%% -- ALGORITHM 3 -- %%
% - This algorithm calls the algo2 for each image of the bank of images and extract his binary image - %

%% -- DECLARATION OF VARIABLES -- %%
path_dataset1 = strcat(path_code,'\Dataset I\Images');
path_dataset2 = strcat(path_code,'\Dataset II\Images');
path_mask1 = strcat(path_code,'\Dataset I\Masks');
path_mask2 = strcat(path_code,'\Dataset II\Masks');
data_set_1 = dir(path_dataset1);
data_set_2 = dir(path_dataset2);

%% -- STORING THE MASKS CREATED BY ALGO2 IN THE MASKS DIRECTORY (DATASET I)-- %%
for n = 3:length(data_set_1)
	cd(path_dataset1);
	TImag = imread((data_set_1(n).name));
	cd(path_code);
	Bin_Image = algo2bis(TImag);
	baseFileName = sprintf(strcat(data_set_1(n).name(1:end-3),'bmp'));
	fullFileName = fullfile(path_mask1,baseFileName);
	imwrite(Bin_Image,fullFileName);
end

%% -- STORING THE MASKS CREATED BY ALGO2 IN THE MASKS DIRECTORY (DATASET II)-- %%
for n = 3:length(data_set_2)
	cd(path_dataset2);
	TImag = imread((data_set_2(n).name));
	cd(path_code);
	Bin_Image = algo2bis(TImag);
	baseFileName = sprintf(strcat(data_set_2(n).name(1:end-3),'bmp'));
	fullFileName = fullfile(path_mask2,baseFileName);
	imwrite(Bin_Image,fullFileName);
end
clear fullFileName; clear baseFileName; clear TImag; clear Bin_Image;