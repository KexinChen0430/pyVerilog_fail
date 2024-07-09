module ODDR (
  input  C,
  input  CE,
  input  R,
  input  S,
  input  D1,
  input  D2,
  output Q
);
  parameter DDR_CLK_EDGE = "OPPOSITE_EDGE";
  parameter INIT = 1'b0;
  parameter [0:0] IS_C_INVERTED = 1'b0;
  parameter [0:0] IS_D1_INVERTED = 1'b0;
  parameter [0:0] IS_D2_INVERTED = 1'b0;
  parameter SRTYPE = "SYNC";
  parameter _TECHMAP_CONSTMSK_R_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_R_ = 1'bx;
  parameter _TECHMAP_CONSTMSK_S_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_S_ = 1'bx;
  localparam [0:0] R_USED = (_TECHMAP_CONSTMSK_R_ != 1'b1);
  localparam [0:0] S_USED = (_TECHMAP_CONSTMSK_S_ != 1'b1);
  wire SR;
  localparam SRVAL = (!R_USED) ? 1'b1 : 1'b0;
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
  parameter _TECHMAP_CONSTMSK_D1_ = 0;
  parameter _TECHMAP_CONSTVAL_D1_ = 0;
  parameter _TECHMAP_CONSTMSK_D2_ = 0;
  parameter _TECHMAP_CONSTVAL_D2_ = 0;
  localparam INV_D1 = (_TECHMAP_CONSTMSK_D1_ ==  1) ? !_TECHMAP_CONSTVAL_D1_ ^ IS_D1_INVERTED :
                       (_TECHMAP_CONSTVAL_D1_ === 0) ? IS_D1_INVERTED : !IS_D1_INVERTED;
  wire d1 = (_TECHMAP_CONSTMSK_D1_ ==  1) ? 1'b1 :
            (_TECHMAP_CONSTVAL_D1_ === 0) ? 1'b1 : D1;
  localparam INV_D2 = (_TECHMAP_CONSTMSK_D2_ ==  1) ? !_TECHMAP_CONSTVAL_D2_ ^ IS_D2_INVERTED :
                       (_TECHMAP_CONSTVAL_D2_ === 0) ? IS_D2_INVERTED : !IS_D2_INVERTED;
  wire d2 = (_TECHMAP_CONSTMSK_D2_ ==  1) ? 1'b1 :
            (_TECHMAP_CONSTVAL_D2_ === 0) ? 1'b1 : D2;
  ODDR_VPR # (
    .ZINV_CLK       (!IS_C_INVERTED),
    .INV_D1         (INV_D1),
    .INV_D2         (INV_D2),
    .ZINV_D1        (!INV_D1),
    .ZINV_D2        (!INV_D2),
    .SRTYPE_SYNC    ( SRTYPE == "SYNC"),
    .SAME_EDGE      ( (DDR_CLK_EDGE != "OPPOSITE_EDGE") ^ IS_C_INVERTED),
    .ZINIT_Q        (!INIT),
    .ZSRVAL_Q       (!SRVAL)
  ) _TECHMAP_REPLACE_ (
    .CK (C),
    .CE (CE),
    .SR (SR),
    .D1 (d1),
    .D2 (d2),
    .Q  (Q)
  );
endmodule