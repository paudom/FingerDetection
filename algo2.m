%% -- ALGORITHM 2 -- %%
% This function creates a binary image showing the skin pixels in black and others in white
function [ Bin_Image ] = algo2(Orig_Imag,avgskin,avgback,PS_avg,PB_avg)

	% - DECLARATION OF VARIABLES - %
	CbCrIm = rgb2ycbcr(Orig_Imag);
	LumY = CbCrIm(:,:,1); CbI = CbCrIm(:,:,2); CrI = CbCrIm(:,:,3);
	[X,Y,Z] = size(CbCrIm);
    Bin_Image = ones(X,Y);
    Bin_Mask = Bin_Image;
    Luma_Thresh = [35 175];
    
    % - CALCULATE THE ORIGINAL HISTOGRAM - %
    Threshold = calthresh(avgskin,avgback,CbI,CrI);
    
    % - CALCULATING THE BINARY IMAGE - %
    for i = 1:X
		for j = 1:Y
            if(LumY(i,j)>Luma_Thresh(1,1) && LumY(i,j)<Luma_Thresh(1,2))
                Decision = (avgskin(CbI(i,j),CrI(i,j))*PS_avg)/(avgback(CbI(i,j),CrI(i,j))*PB_avg);
                if(Decision >= Threshold)
                    Bin_Mask(i,j) = 0;
                end
            end
		end
    end
    
    % - OPTIMIZING THE BINARY IMAGE - %
    Bin_Image = optimus(Bin_Mask);
end

						