%% -- ALGORITHM 4 -- %%
% - This algorithm calculates the F-Score of the entire algorithm - %

%% -- DECLARATION OF VARIABLES -- %%
path_ideal_mask1 = strcat(path_code,'/Dataset I/Masks-Ideal');
path_ideal_mask2 = strcat(path_code,'/Dataset II/Masks-Ideal');
ideal_mask_1 = dir(path_ideal_mask1); 
ideal_mask_2 = dir(path_ideal_mask2);
mask_set_1 = dir(path_mask1);
mask_set_2 = dir(path_mask2);
F_Score_set1 = zeros((length(data_set_1)-2),1); 
F_Score_set2 = zeros((length(data_set_2)-2),1);

%% -- CALCULATION OF THE F_SCORE OF THE DATASET I -- %%
for n = 3:length(ideal_mask_1)
	cd(path_ideal_mask1);
	Ideal_Ma = imread((ideal_mask_1(n).name));
	cd(path_mask1);
	Test_Ma = imread((mask_set_1(n).name));
	cd(path_code);
	[Precision,Recall,E] = stadistic(Ideal_Ma,Test_Ma);
	if(E)
		return;
	end
	F_Score_set1(n-2,1) = 2*((Precision*Recall)/(Precision+Recall));
end

%% -- CALCULATION OF THE F_SCORE OF THE DATASET II -- %%
for n = 3:length(ideal_mask_2)
	cd(path_ideal_mask2);
	Ideal_Ma = imread((ideal_mask_2(n).name));
	cd(path_mask2);
	Test_Ma = imread((mask_set_2(n).name));
	cd(path_code);
	[Precision,Recall] = stadistic(Ideal_Ma,Test_Ma);
	if(E)
		return;
	end
	F_Score_set2(n-2,1) = 2*((Precision*Recall)/(Precision+Recall));
end
Result1 = ['The detection for the SET 1 is: ',num2str(mean(F_Score_set1))];
Result2 = ['The detection for the SET 2 is: ',num2str(mean(F_Score_set2))];
disp(Result1)
disp(Result2)
clear Result1; clear Result2;
clear E; clear Precision; clear Recall; clear Ideal_Ma; clear Test_Ma; clear n;
