module dffsc(
  output Q,
  input  D,
  input  CLK,
  input  CLR,
);
  parameter [0:0] INIT = 1'b0;
  Q_FRAG # (
  .Z_QCKS (1'b1)
  )
  _TECHMAP_REPLACE_
  (
  .QCK(CLK),
  .QST(1'b0),
  .QRT(CLR),
  .QEN(1'b1),
  .QD (D),
  .QZ (Q),
  .CONST0 (1'b0),
  .CONST1 (1'b1)
  );
endmodule