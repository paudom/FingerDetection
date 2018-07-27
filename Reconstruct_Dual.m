function Recons = Reconstruct_Dual(Marker,Reference);
	Max = max(max(max(Marker)),max(max(Reference)));
    Inv_marker = Max-Marker; Inv_ref = Max-Reference;
    Opt_marker = min(Inv_marker,Inv_ref);
    Recons = Max-imreconstruct(Opt_marker,Inv_ref);
end