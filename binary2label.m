function [out,n] = binary2label(in)
	[out1,n1] = bwlabel( in,4);
   [out2,n2] = bwlabel(~in,4);
   out = out1;
   out(out1==0) = double(out2(out1==0)) + n1;
   n = n1 + n2;
return