%% -- ALGORITHM 7 -- %%
% - This algorithm calculates the probability of error when assigning a number of fingers for each image - %

%% -- DECLARATION OF VARIABLES -- %%
load Dataset_I.txt
load Dataset_II.txt
%% -- CALCULATION OF ERRORS -- %%
[True,Y] = size(Dataset_I);
Detected = 0;
for n = 1:True
    if(Dataset_I(n,1)==Dataset_I(n,2))
        Detected = Detected+1;
    end
end
Precision_D1 = Detected/True;
Error_D1 = 1-Precision_D1;
[True,Y] = size(Dataset_II);
Detected = 0;
for n = 1:True
   if(Dataset_II(n,1)==Dataset_II(n,2))
       Detected = Detected+1;
   end
end
Precision_D2 = Detected/True;
Error_D2 = 1-Precision_D2;
Result1 = ['The precision for detecting fingers for the SET 1 is: ',num2str(Precision_D1)];
Result2 = ['The probability of error for detecting fingers for the SET 1 is: ',num2str(Error_D1)];
Result3 = ['The precision for detecting fingers for the SET 2 is: ',num2str(Precision_D2)];
Result4 = ['The probability of error for detecting fingers for the SET 2 is: ',num2str(Error_D2)];
disp(Result1);
disp(Result2);
disp(Result3);
disp(Result4);
clear Result1; clear Result2; clear Result3; clear Result4;
clear Precision_D1; clear Precision_D2; clear Error_D1; clear Error_D2; clear True; clear Detected;
