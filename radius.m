%% -- ALGORITHM 5 -- %%
% This function determines the number of fingers that appear on an image from a binary image %
function [ Num_fingers ] = algo5( Bin_Mask )

    % - DECLARATION OF VARIABLES - %
    [Z,T] = size(Bin_Mask);

    % - FINDING THE G POINT- %
    D_Transform = bwdist(Bin_Mask);
    Marker = D_Transform-1;
    D_rec = imreconstruct(Marker,D_Transform);
    Distance = D_Transform-D_rec;
   	[X,Y] = find(Distance == max(max(Distance)));
    C=zeros(1,length(X));
    M=zeros(1,length(X));
    Score=zeros(1,length(X));
    for i = 1:length(X)
        C(i) = sqrt((X(i)-round(Z/2))^2+(Y(i)-round(T/2))^2);
        M(i) = D_Transform(X(i),Y(i));
        Score(i)=M(i)/C(i);
    end
    G = [X(Score==max(Score)) Y(Score==max(Score))];
    
  % - CONTOUR IMAGE - %
  SE = strel('disk',1);
  Cont_Im = imdilate(Bin_Mask,SE)-Bin_Mask;
  found = 0;
  for i = 5:Z-5
      for j = 5:T-5
          if(Cont_Im(i,j)==1)
             direction = looktable(Cont_Im([i-1:i+1],[j-1:j+1]));
             if(sum(sum(Cont_Im([i-1:i+1],[j-1:j+1])))==3)
                 Initial = [i j];
                 found = 1;
             end
          end
          if(found==1)
              break
          end
        end
      if(found==1)
          break
      end
  end
  B = bwtraceboundary(Cont_Im,Initial,direction,8,Inf,'clockwise');
  distance = zeros(1,length(B));
  for n = 1:length(B)
     distance(1,n) = sqrt((G(1,1)-B(n,1))^2+(G(1,2)-B(n,2))^2);
  end
  Radius = min(distance);
  S=(Z/T)*2.25;
  Radius_Scalar = Radius*S; %parametre de validació
  [col, rows] = meshgrid(1:T,1:Z);
  Cercle1 = 1-((col - G(1,2)).^2 + (rows - G(1,1)).^2 <= Radius_Scalar.^2);
  Hand = imbinarize(Bin_Mask+Cercle1);
  imshow(Hand)
  
  Num_fingers=3;   
 end
