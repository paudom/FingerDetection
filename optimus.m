%% -- FUNCTION TO OPTIMIZE THE BINARY IMAGES  -- %%
% - Using the reconstruction by dilation we get rid of the possible noise (FP) - %
% - Then using a reconstruction by eroding we fill the the possible holes (TN) - %
function [ Bin_Image ] = optimus(Bin_Mask)

	% -- DECLARATION OF VARIABLE -- %
 	SE = strel('disk',4);

 	% -- RECONSTRUCTION BY DILATION -- %
    Marker_1 = imclose(Bin_Mask,SE);
	Recons_1 = Reconstruct_Dual(Marker_1,Bin_Mask);

    % -- RECONSTRUCTION BY ERODING -- %
    Marker_2 = imopen(Recons_1,SE);
    Bin_Image = imreconstruct(Marker_2,Recons_1);
end