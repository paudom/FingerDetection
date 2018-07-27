%% -- FUNCTION TO CALCULATE THE EQUATIONS NEEDED TO DECIDE -- %%
function [ one , two ] = equathresh(CbI,CrI)

	% - DECLARATION OF VARIABLES - %
	Ecx = 1.6; Ecy = 2.41; a = 25.39; b = 14.03;
	Cx = 109.38; Cy = 152.02; theta = 2.53;
    x = CbI/Cx; y = CrI/Cy;

	one = ((x-Ecx)^2/a^2)+(((y-Ecy)^2/b^2));
	first_term = cos(theta)*(CbI-Cx)+sin(theta)*(double(CrI)-Cy);
	second_term = -sin(theta)*(CbI-Cx)+cos(theta)*(double(CrI)-Cy);
	two = [first_term second_term];
end