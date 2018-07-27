%% -- FUNCTION TO OBTAIN THE HISTOGRAM OF THE SKIN PIXELS AND IT'S RANGE FOR Cb and Cr --%%
function [ skin2D, back2D ]  = hist2D(TImag,TMask)

	% - DECLARATION OF VARIABLES - %
	cbcrIm = rgb2ycbcr(TImag);
	cbY = cbcrIm(:, :, 2); crX = cbcrIm(:, :, 3);
	skin2D = zeros(255,255); back2D = zeros(255,255);
	[X,Y] = size(TMask);
	sum_background = 0;
	% - CALCULATING THE HSITOGRAM OF THE SKIN PIXELS - %
	for i = 1:X
	    for j = 1:Y
	    	if(TMask(i,j)==0)
	        	skin2D(cbY(i,j),crX(i,j)) = skin2D(cbY(i,j),crX(i,j)) + 1;
            else
                sum_background = sum_background + 1;
            end
        end
    end
    skin2D = skin2D/(X*Y);
    for i = 1:X
	    for j = 1:Y
	    	if(TMask(i,j)==1)
	    		back2D(cbY(i,j),crX(i,j)) = sum_background/(X*Y);
	    	end
	    end
	end
end