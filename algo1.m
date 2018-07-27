%% -- ALGORITHM 1 -- %%
% This algorithm geets the histogram of the skin píxels from the training images

%% -- DECLARATION OF VARIABLES -- %%
% cd('C:\Users\piv114\Desktop\Prog Finger Detection\Training');
path_code = '/Volumes/Productions/Alternas/UPC/3B/PIV/Prog Finger Detection';
path_im = strcat(path_code,'/Training/Training Images');
path_mask = strcat(path_code,'/Training/Training Masks');
im_info = dir(path_im); mask_info = dir(path_mask);
im_num = (length(im_info)-2); im = 1;
skin2D = zeros(255,255,im_num);
back2D = zeros(255,255,im_num);

%% -- OBTAINING THE HISTOGRAM OF THE SKIN PIXELS --%%
for n = 3:length(im_info)
    cd(path_mask);
	TMask = imread((mask_info(n).name)); 
	cd(path_im);
	TImag = imread((im_info(n).name)); 
	% cd('C:\Users\piv114\Desktop\Prog Finger Detection\');
	cd(path_code);
	[skin2D(:,:,im), back2D(:,:,im)] = hist2D(TImag,TMask);
	im = im+1;
end

%% -- GETTING THE AVERAGE HISTOGRAM OF THE SKIN PIXELS AND THE AVERAGE RANGES -- %%
[avgskin, avgback, PS_avg, PB_avg] = avg(skin2D,back2D,im_num);
clear im; clear im_num; clear TMask;