%% -- ALGORITHM 5 -- %%
% This function determines the number of fingers that appear on an image from a binary image %
function [ Num_fingers ] = algo5( Bin_Mask)
   
    % - DECLARATION OF VARIABLES - %
    [Z,T] = size(Bin_Mask);
    Thresh1_Limiter = 0.69;
    Thresh2_Limiter = 0.89;
    Thresh1_dist = 0.24;
    Thresh2_dist = 1;
    
    % - CALCULATION OF PROFILE SUM - %
    [Suma, Option, No_valid] = sum_perf(Bin_Mask);
   
    % - CALCULATION OF LOCAL MIN PROFILE SUM , WHICH IS THE WRIST POSITION - %
    Wrist = wrist(Suma, No_valid);
   
    % - ARM CROP - %
    Bin_Mask = arm_crop(Bin_Mask, Wrist, Option);
   
    % - CALCULATION OF HAND CENTER OF GRAVITY - %
    D_Transform = bwdist(Bin_Mask);
    [X,Y] = find(D_Transform == max(max(D_Transform)));
    G = zeros(1,2);
    G(1,1) = X(1,1); G(1,2)=Y(1,1);
  
    % - CALCULATION OF CONTOUR IMAGE - %
    SE = strel('disk',1);
    Cont_Im = imdilate(Bin_Mask,SE)-Bin_Mask;
  
    % - FIND DIRECTION TO TRACE THE CONTOUR AND INITIAL POINT - %
    [Direction, Initial] = direction(Z,T,Cont_Im);
  
    % - CALCULATION OF DISTANCE BETWEEN HAND CENTER OF GRAVITY AND CONTOUR - %  
    B = bwtraceboundary(Cont_Im,Initial,Direction,8,Inf,'clockwise');
    distance = zeros(1,length(B));
    for n = 1:length(B)
        distance(1,n) = sqrt((G(1,1)-B(n,1))^2+(G(1,2)-B(n,2))^2);
    end
    distance=smooth(distance,25);  
    
    % - CALCULATION OF NUM OF FINGERS -%
    Num_fingers = num_fingers(distance, Option, Thresh1_Limiter, Thresh2_Limiter,Thresh1_dist, Thresh2_dist);
end
