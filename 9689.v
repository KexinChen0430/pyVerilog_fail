module IDDR_2CLK (
  output Q1,
  output Q2,
  input  C,
  input  CB,
  input  CE,
  input  D,
  input  R,
  input  S,
);
  parameter DDR_CLK_EDGE = "OPPOSITE_EDGE";
  parameter INIT_Q1 = 1'b0;
  parameter INIT_Q2 = 1'b0;
  parameter [0:0] IS_C_INVERTED  = 1'b0;
  parameter [0:0] IS_CB_INVERTED = 1'b0;
  parameter [0:0] IS_D_INVERTED  = 1'b0;
  parameter SRTYPE = "SYNC";
  parameter _TECHMAP_CONSTMSK_R_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_R_ = 1'bx;
  parameter _TECHMAP_CONSTMSK_S_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_S_ = 1'bx;
  localparam [0:0] R_USED = (_TECHMAP_CONSTMSK_R_ != 1'b1);
  localparam [0:0] S_USED = (_TECHMAP_CONSTMSK_S_ != 1'b1);
  wire SR;
  localparam SRVAL = (!R_USED) ? 1'b1 : 1'b0;
  localparam SRUSED = 1'b1;
  generate if (!R_USED && !S_USED) begin
    assign SR = 1'b0;
  end else if (R_USED && !S_USED) begin
    assign SR = R;
  end else if (!R_USED && S_USED) begin
    assign SR = S;
  end else begin
    assign SR = 1'bx;
    $error("Both S and R cannot be used simultaneously");
  end endgenerate
  localparam INIT_Q3 = (DDR_CLK_EDGE != "OPPOSITE_EDGE") ? INIT_Q1 : 1'b1;
  localparam INIT_Q4 = (DDR_CLK_EDGE != "OPPOSITE_EDGE") ? INIT_Q2 : 1'b1;
  localparam SRVAL34 = (DDR_CLK_EDGE != "OPPOSITE_EDGE") ? SRVAL : 1'b1;
  IDDR_VPR #(
    .ZINV_D         (!IS_D_INVERTED),
    .ZINV_C         (!IS_C_INVERTED),
    .SRTYPE_SYNC    (SRTYPE == "SYNC"),
    .SAME_EDGE      (DDR_CLK_EDGE == "SAME_EDGE"),
    .OPPOSITE_EDGE  (DDR_CLK_EDGE == "OPPOSITE_EDGE"),
    .ZINIT_Q1       (!INIT_Q1),
    .ZINIT_Q2       (!INIT_Q2),
    .ZINIT_Q3       (!INIT_Q3),
    .ZINIT_Q4       (!INIT_Q4),
    .ZSRVAL_Q12     (!SRVAL),
    .ZSRVAL_Q34     (!SRVAL34)
  ) _TECHMAP_REPLACE_ (
    .CK  (C),
    .CKB (CB),
    .CE  (CE),
    .SR  (SR),
    .D   (D),
    .Q1  (Q1),
    .Q2  (Q2)
  );
endmodule