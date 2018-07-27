%% -- FUNCTION TO CALCULATE THE PROFILE SUM OF BINARY MASK  -- %%
function [Suma , Option, No_valid] = sum_perf(Bin_Mask)

    % - DECLARATION OF VARIABLES - %
   [Z,T] = size(Bin_Mask);
   Bin_double = double(1-Bin_Mask);
   Option = 0;
   
   % -- CALCULATION OF THE PROFILE SUM DEPENDING ON THE MASK DIMENSIONS -- %
   % - Option assigment depending on the dimensions - %
   if(Z>=T)
       Option=1;
       Suma = zeros(1,Z);
       for i=1:Z
           Suma(1,i) = sum(Bin_double(i,:));
       end
   else
       Option=2;
       Suma = zeros(1,T);
       for i=1:T
           Suma(1,i)=sum(Bin_double(:,i));
       end
   end
   
   % -- CALCULATION OF THE SMOOTHED SIGNAL SUMA -- %
   Suma=smooth(Suma,70);
   
    % -- DECLARATION OF VARIABLES AFTER SUM RESULT-- %
   No_valid = Suma==0;
end

