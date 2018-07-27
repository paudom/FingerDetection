%% -- FUNCTION TO OBTAIN THE HISTOGRAM OF THE SKIN PIXELS AND IT'S RANGE FOR Cb and Cr --%%
function [ Threshold ]  = calthresh(avgskin,avgback,CbI,CrI)

% - DECLARATION OF VARIABLES - %
[X,Y] = size(CbI);
sum_skin = 0;
sum_back = 0;
min_value_hist = 0.00126;

% - CALCULATE THE RELATION BETWEEN SKIN AND BACKGROUND PIXELS - %
for i = 1:X
    for j = 1:Y
        if(avgskin(CbI(i,j),CrI(i,j))>min_value_hist)
           sum_skin = sum_skin + 1;
        end
        if(avgback(CbI(i,j),CrI(i,j))>min_value_hist)
           sum_back = sum_back + 1;
        end
    end
end
Threshold = sum_skin/(sum_back*100);
end
