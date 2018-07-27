%% -- FUNCTION TO OBTAIN THE MODEL HISTOGRAM AND THE AVG DISTANCE -- %%
function [ avgskin, avgback, PS_avg, PB_avg ] = avg(skin2D,back2D,im_num)

	% - DECLARATION OF VARIABLES - %
	avgskin = zeros(255,255);
    avgback = zeros(255,255);
    Pskin = 0; Pback = 0;

	% - CALCULATION OF THE AVERAGE HISTOGRAM - %
	for i = 1:im_num
		avgskin = avgskin + skin2D(:,:,i);
        avgback = avgback + back2D(:,:,i);
	end
	avgskin = avgskin./im_num;
    avgback = avgback./im_num;

    % - CALCULATION OF THE PRIORI PROBABILITIES - %
    for i = 1:255
        for j = 1:255
            if(avgskin(i,j)>0)
                Pskin = Pskin + 1;
            end
            if(avgback(i,j)>0)
                Pback = Pback + 1;
            end
        end
    end
    PS_avg = Pskin/(255*255);
    PB_avg = Pback/(255*255);
end