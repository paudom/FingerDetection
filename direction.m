% - CALCULATES DIRECTION TO TRACE THE CONTOUR AND INITIAL POINT WHERE TO START TRACING - %
function [Direction, Initial] = direction(Z,T,Cont_Im)
found = 0;
  for j = 20:T-20
      for i = 20:Z-20
          if(Cont_Im(i,j)==1)
             Direction = looktable(Cont_Im([i-1:i+1],[j-1:j+1]));
             if(sum(sum(Cont_Im([i-1:i+1],[j-1:j+1])))==3)
                 Initial = [i j];
                 found = 1;
             end
          end
          if(found==1)
              break
          end
       end
      if(found==1)
          break
      end
  end
end

