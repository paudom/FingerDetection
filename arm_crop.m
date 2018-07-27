%% -- FUNCTION TO CROP ARM FORM MASK  -- %%
function [Bin_Mask] = arm_crop(Bin_Mask, Wrist, Option)
    
    % -- DECLARATION OF VARIABLES -- %
    [Z,T] = size(Bin_Mask);
    Bin =  Bin_Mask;
    
    switch Option
       case 1
           Wrist(1:round(Z/4))=0; Wrist(round(Z-Z/4):Z)=0;
           W=find(Wrist==max(Wrist));
           W=W(W-(Z/2)<135);
           for i=1:Z
                if(i>=W)
                    Bin_Mask(i,:)=1;
                end
           end
       case 2
           Wrist(1:80)=0; Wrist(round(T-T/4):T)=0;
           W=find(Wrist>0.999);
           if(isempty(W))
               W=find(Wrist==max(Wrist));
           end
           W=W(W-(T/2)<135);
           for i=1:T
                if(i<W)
                    Bin_Mask(:,i)=1;
                end
           end
   end
   cont=0;
      
   for i = 1:Z
       for j = 1:T
           if(Bin_Mask(i,j)==0)
               cont=cont+1;
           end
       end
   end
   if(cont<200)
       Bin_Mask = Bin;
   end
end

