%% -- FUNCTION TO FIND THE DIRECTION -- %%
function [direction] = looktable(Cube)

	% - DECLARATION OF VARIABLES - %
	Poles = zeros(1,8);
    direction = "NULL";
	Dir = ["N","NE","E","SE","S","SW","W","NW"];
	% - LOOKING THE DRIECTION - %
	if(Cube(1,2)==1)
		Poles(1,1)=1;
    end
	if(Cube(1,3)==1)
		Poles(1,2)=1;
    end
	if(Cube(2,3)==1)
		Poles(1,3)=1;
    end
	if(Cube(3,3)==1)
		Poles(1,4)=1;
    end
	if(Cube(3,2)==1)
		Poles(1,5)=1;
    end
	if(Cube(3,1)==1)
		Poles(1,6)=1;
    end
	if(Cube(2,1)==1)
		Poles(1,7)=1;
    end
	if(Cube(1,1)==1)
		Poles(1,8)=1;
	end
	for n = 1:length(Poles)
		if(Poles(1,n)==1)
			direction = Dir(1,n);
			break;
		end
	end
end