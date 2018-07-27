%% -- FUNCTION TO CALCULATE LOCAL MIN OF THE PROFILE SUM OF BINARY MASK , INDICATES WRIST POSITION -- %%
function [Wrist] = wrist(Suma, No_valid)

    % -- DUAL RECONSTRUCTION  -- %
    Marker = Suma+1;
    S_rec = Reconstruct_Dual(Marker,Suma);
    Wrist = S_rec-Suma;
    
    % -- DECITION -- %
    Wrist(No_valid)=0;
    if(max(Wrist)>1)
        Wrist(Wrist==max(Wrist))=1;
    end
    Wrist(Wrist<0.1)=0;
end

