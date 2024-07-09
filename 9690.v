module IDDR (
  output Q1,
  output Q2,
  input  C,
  input  CE,
  input  D,
  input  R,
  input  S,
);
  parameter DDR_CLK_EDGE = "OPPOSITE_EDGE";
  parameter INIT_Q1 = 1'b0;
  parameter INIT_Q2 = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter SRTYPE = "SYNC";
  IDDR_2CLK # (
    .DDR_CLK_EDGE   (DDR_CLK_EDGE),
    .SRTYPE         (SRTYPE),
    .INIT_Q1        (INIT_Q1),
    .INIT_Q2        (INIT_Q2),
    .IS_C_INVERTED  (IS_C_INVERTED),
    .IS_CB_INVERTED (!IS_C_INVERTED),
    .IS_D_INVERTED  (IS_D_INVERTED)
  ) _TECHMAP_REPLACE_ (
    .C  (C),
    .CB (C),
    .CE (CE),
    .S  (S),
    .R  (R),
    .D  (D),
    .Q1 (Q1),
    .Q2 (Q2)
  );
endmodule