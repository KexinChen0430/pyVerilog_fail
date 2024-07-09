module mux8x0 (
    output Q,
    input  S0,
    input  S1,
    input  S2,
    input  A,
    input  B,
    input  C,
    input  D,
    input  E,
    input  F,
    input  G,
    input  H
);
  C_FRAG # (
  .TAS1(1'b0),
  .TAS2(1'b0),
  .TBS1(1'b0),
  .TBS2(1'b0),
  .BAS1(1'b0),
  .BAS2(1'b0),
  .BBS1(1'b0),
  .BBS2(1'b0),
  )
  c_frag (
  .TBS(S2),
  .TAB(S1),
  .TSL(S0),
  .TA1(A),
  .TA2(B),
  .TB1(C),
  .TB2(D),
  .BAB(S1),
  .BSL(S0),
  .BA1(E),
  .BA2(F),
  .BB1(G),
  .BB2(H),
  .CZ (Q)
  );
endmodule