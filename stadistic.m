%% -- FUNCTION THAT COMPARES THE TWO MASK AND DETERMINES THE PRECISION AND RECALL -- %%
function [ Precision,Recall,E ] = stadistic(Ideal_Ma,Test_Ma)

	% - DECLARATION OF VARIABLES - %
	TP = 0; FP = 0; FN = 0;
	E = false;
	[X,Y] = size(Ideal_Ma);

	% - CALCULATION OF THE STADISTIC - %
	if(size(Ideal_Ma)~=size(Test_Ma))
		error('ERROR(2): The images have different sizes.');
		E = true;
	end
	if(~E)
		for i = 1:X
			for j = 1:Y
				% - COUNTING THE TRUE POSITIVES - %
				if((Ideal_Ma(i,j)==0)&&(Test_Ma(i,j)==0))
					TP = TP + 1;
				% - COUNTING THE FALSE POSITIVE - %
                elseif((Ideal_Ma(i,j)==1)&&(Test_Ma(i,j)==0))
					FP = FP + 1;
				% - COUNTING THE FALSE NEGATIVE - %
                elseif((Ideal_Ma(i,j)==0) && (Test_Ma(i,j)==255)); 
					FN = FN + 1;
				end
			end
		end
		Precision = TP/(TP+FP);
		Recall = TP/(TP+FN);
    else
		Precision = 0; Recall = 0;
		return;
    end
end