module dff (CK,Q,D);
input CK,D;
output Q;
  wire NM,NCK;
  trireg NQ,M;
  nmos N7 (M,D,NCK);
  not P3 (NM,M);
  nmos N9 (NQ,NM,CK);
  not P5 (Q,NQ);
  not P1 (NCK,CK);
endmodule