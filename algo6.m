%% -- ALGORITHM 6 -- %%
% - This algorithm calls the algo2 and algo5 for each image of the bank of images and extract his binary image and the number of fingers - %

%% -- DECLARATION OF VARIABLES -- %%
path_dataset1 = strcat(path_code,'/Dataset I/Images');
path_dataset2 = strcat(path_code,'/Dataset II/Images');
path_mask1 = strcat(path_code,'/Dataset I/Masks');
path_mask2 = strcat(path_code,'/Dataset II/Masks');
path_eval1 = strcat(path_code,'/Fingers/Dataset I');
path_eval2 = strcat(path_code,'/Fingers/Dataset II');
data_set_1 = dir(path_dataset1);
data_set_2 = dir(path_dataset2);
text_1 = 'Dataset_I.txt';
text_2 = 'Dataset_II.txt';

%% -- STORING THE MASKS CREATED BY ALGO2 AND FINGERS BY ALGO5 FROM (DATASET I)-- %%
fileID = fopen(text_1,'w');
for n = 3:length(data_set_1)
	 cd(path_dataset1);
    TImag = imread((data_set_1(n).name));
    cd(path_code);
    Bin_Image = algo2(TImag,avgskin,avgback,PS_avg,PB_avg);
    baseFileName = sprintf(strcat(data_set_1(n).name(1:end-3),'bmp'));
    fullFileName = fullfile(path_mask1,baseFileName);
    imwrite(Bin_Image,fullFileName);
    Num_fingers = algo5(Bin_Image);
    Namefile = data_set_1(n).name(1:end-4);
    fprintf(fileID,'%s  %d\n',Namefile,Num_fingers);
    cd(path_eval1);
    file = fopen(strcat(Namefile,'.txt'),'w');
    fprintf(file,'%d',Num_fingers);
    fclose(file);
end
fclose(fileID); clear Namefile; clear Num_fingers;

%% -- STORING THE MASKS CREATED BY ALGO2 AND FINGERS BY ALGO5 FROM (DATASET II)-- %%
fileID = fopen(text_2,'w');
for n = 3:length(data_set_2)
	 cd(path_dataset2);
    TImag = imread((data_set_2(n).name));
    cd(path_code);
    Bin_Image = algo2(TImag,avgskin,avgback,PS_avg,PB_avg);
    baseFileName = sprintf(strcat(data_set_2(n).name(1:end-3),'bmp'));
    fullFileName = fullfile(path_mask2,baseFileName);
    imwrite(Bin_Image,fullFileName);
    Num_fingers = algo5(Bin_Image);
    Namefile = data_set_2(n).name(1:end-4);
    fprintf(fileID,'%s  %d\n',Namefile,Num_fingers);
    cd(path_eval2);
    file = fopen(strcat(Namefile,'.txt'),'w');
    fprintf(file,'%d',Num_fingers);
    fclose(file);
end
fclose(fileID);
cd(path_code);
clear fullFileName; clear baseFileName; clear TImag; clear Bin_Image; clear Namefile; clear Num_fingers; clear fileID;