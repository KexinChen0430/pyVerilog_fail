module OSERDESE2 (
  input CLK,
  input CLKDIV,
  input D1,
  input D2,
  input D3,
  input D4,
  input D5,
  input D6,
  input D7,
  input D8,
  input OCE,
  input RST,
  input T1,
  input T2,
  input T3,
  input T4,
  input TCE,
  output OFB,
  output OQ,
  output TFB,
  output TQ
  );
  parameter DATA_RATE_OQ = "DDR";
  parameter DATA_RATE_TQ = "DDR";
  parameter DATA_WIDTH = 4;
  parameter SERDES_MODE = "MASTER";
  parameter TRISTATE_WIDTH = 4;
  parameter IO_LOC_PAIRS = "NONE";
  if (DATA_RATE_OQ == "DDR" &&
      !(DATA_WIDTH == 4 || DATA_WIDTH == 6 || DATA_WIDTH == 8)) begin
    wire _TECHMAP_FAIL_;
  end
  if (DATA_RATE_OQ == "SDR" &&
      !(DATA_WIDTH >= 2 || DATA_WIDTH <= 8)) begin
    wire _TECHMAP_FAIL_;
  end
  if ((DATA_RATE_TQ == "SDR" || DATA_RATE_TQ == "BUF") &&
      TRISTATE_WIDTH != 1) begin
    wire _TECHMAP_FAIL_;
  end
  if (DATA_RATE_OQ == "SDR" && DATA_RATE_TQ == "DDR") begin
    wire _TECHMAP_FAIL_;
  end
  if (TRISTATE_WIDTH != 1 && TRISTATE_WIDTH != 4) begin
    wire _TECHMAP_FAIL_;
  end
  // Inverter parameters
  parameter [0:0] IS_D1_INVERTED = 1'b0;
  parameter [0:0] IS_D2_INVERTED = 1'b0;
  parameter [0:0] IS_D3_INVERTED = 1'b0;
  parameter [0:0] IS_D4_INVERTED = 1'b0;
  parameter [0:0] IS_D5_INVERTED = 1'b0;
  parameter [0:0] IS_D6_INVERTED = 1'b0;
  parameter [0:0] IS_D7_INVERTED = 1'b0;
  parameter [0:0] IS_D8_INVERTED = 1'b0;
  parameter [0:0] IS_CLKDIV_INVERTED = 1'b0;
  parameter [0:0] IS_CLK_INVERTED = 1'b0;
  parameter [0:0] IS_T1_INVERTED = 1'b0;
  parameter [0:0] IS_T2_INVERTED = 1'b0;
  parameter [0:0] IS_T3_INVERTED = 1'b0;
  parameter [0:0] IS_T4_INVERTED = 1'b0;
  localparam [0:0] INIT_OQ = 1'b0;
  localparam [0:0] INIT_TQ = 1'b0;
  localparam [0:0] SRVAL_OQ = 1'b0;
  localparam [0:0] SRVAL_TQ = 1'b0;
  parameter _TECHMAP_CONSTMSK_D1_ = 0;
  parameter _TECHMAP_CONSTVAL_D1_ = 0;
  parameter _TECHMAP_CONSTMSK_D2_ = 0;
  parameter _TECHMAP_CONSTVAL_D2_ = 0;
  parameter _TECHMAP_CONSTMSK_D3_ = 0;
  parameter _TECHMAP_CONSTVAL_D3_ = 0;
  parameter _TECHMAP_CONSTMSK_D4_ = 0;
  parameter _TECHMAP_CONSTVAL_D4_ = 0;
  parameter _TECHMAP_CONSTMSK_D5_ = 0;
  parameter _TECHMAP_CONSTVAL_D5_ = 0;
  parameter _TECHMAP_CONSTMSK_D6_ = 0;
  parameter _TECHMAP_CONSTVAL_D6_ = 0;
  parameter _TECHMAP_CONSTMSK_D7_ = 0;
  parameter _TECHMAP_CONSTVAL_D7_ = 0;
  parameter _TECHMAP_CONSTMSK_D8_ = 0;
  parameter _TECHMAP_CONSTVAL_D8_ = 0;
  parameter _TECHMAP_CONSTMSK_TQ_ = 1'bx;
  parameter _TECHMAP_CONSTVAL_TQ_ = 1'bx;
  localparam INV_D1 = (_TECHMAP_CONSTMSK_D1_ == 1)  ? !_TECHMAP_CONSTVAL_D1_ ^ IS_D1_INVERTED :
                      (_TECHMAP_CONSTVAL_D1_ === 0) ? ~IS_D1_INVERTED : IS_D1_INVERTED;
  wire d1 = (_TECHMAP_CONSTMSK_D1_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D1_ === 0) ? 1'b1 : D1;
  localparam INV_D2 = (_TECHMAP_CONSTMSK_D2_ == 1)  ? !_TECHMAP_CONSTVAL_D2_ ^ IS_D2_INVERTED :
                      (_TECHMAP_CONSTVAL_D2_ === 0) ? ~IS_D2_INVERTED : IS_D2_INVERTED;
  wire d2 = (_TECHMAP_CONSTMSK_D2_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D2_ === 0) ? 1'b1 : D2;
  localparam INV_D3 = (_TECHMAP_CONSTMSK_D3_ == 1)  ? !_TECHMAP_CONSTVAL_D3_ ^ IS_D3_INVERTED :
                      (_TECHMAP_CONSTVAL_D3_ === 0) ? ~IS_D3_INVERTED : IS_D3_INVERTED;
  wire d3 = (_TECHMAP_CONSTMSK_D3_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D3_ === 0) ? 1'b1 : D3;
  localparam INV_D4 = (_TECHMAP_CONSTMSK_D4_ == 1)  ? !_TECHMAP_CONSTVAL_D4_ ^ IS_D4_INVERTED :
                      (_TECHMAP_CONSTVAL_D4_ === 0) ? ~IS_D4_INVERTED : IS_D4_INVERTED;
  wire d4 = (_TECHMAP_CONSTMSK_D4_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D4_ === 0) ? 1'b1 : D4;
  localparam INV_D5 = (_TECHMAP_CONSTMSK_D5_ == 1)  ? !_TECHMAP_CONSTVAL_D5_ ^ IS_D5_INVERTED :
                      (_TECHMAP_CONSTVAL_D5_ === 0) ? ~IS_D5_INVERTED : IS_D5_INVERTED;
  wire d5 = (_TECHMAP_CONSTMSK_D5_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D5_ === 0) ? 1'b1 : D5;
  localparam INV_D6 = (_TECHMAP_CONSTMSK_D6_ == 1)  ? !_TECHMAP_CONSTVAL_D6_ ^ IS_D6_INVERTED :
                      (_TECHMAP_CONSTVAL_D6_ === 0) ? ~IS_D6_INVERTED : IS_D6_INVERTED;
  wire d6 = (_TECHMAP_CONSTMSK_D6_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D6_ === 0) ? 1'b1 : D6;
  localparam INV_D7 = (_TECHMAP_CONSTMSK_D7_ == 1)  ? !_TECHMAP_CONSTVAL_D7_ ^ IS_D7_INVERTED :
                      (_TECHMAP_CONSTVAL_D7_ === 0) ? ~IS_D7_INVERTED : IS_D7_INVERTED;
  wire d7 = (_TECHMAP_CONSTMSK_D7_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D7_ === 0) ? 1'b1 : D7;
  localparam INV_D8 = (_TECHMAP_CONSTMSK_D8_ == 1)  ? !_TECHMAP_CONSTVAL_D8_ ^ IS_D8_INVERTED :
                      (_TECHMAP_CONSTVAL_D8_ === 0) ? ~IS_D8_INVERTED : IS_D8_INVERTED;
  wire d8 = (_TECHMAP_CONSTMSK_D8_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_D8_ === 0) ? 1'b1 : D8;
  localparam TQ_USED = (_TECHMAP_CONSTVAL_TQ_ === 1'bx && (DATA_RATE_TQ == "DDR" || DATA_RATE_TQ == "SDR")) ? 1'b1 : 1'b0;
  parameter _TECHMAP_CONSTMSK_T1_ = 0;
  parameter _TECHMAP_CONSTVAL_T1_ = 0;
  parameter _TECHMAP_CONSTMSK_T2_ = 0;
  parameter _TECHMAP_CONSTVAL_T2_ = 0;
  parameter _TECHMAP_CONSTMSK_T3_ = 0;
  parameter _TECHMAP_CONSTVAL_T3_ = 0;
  parameter _TECHMAP_CONSTMSK_T4_ = 0;
  parameter _TECHMAP_CONSTVAL_T4_ = 0;
  localparam INV_T1 = (_TECHMAP_CONSTMSK_T1_ == 1)  ? !_TECHMAP_CONSTVAL_T1_ ^ IS_T1_INVERTED :
                      (_TECHMAP_CONSTVAL_T1_ === 0) ? ~IS_T1_INVERTED : IS_T1_INVERTED;
  wire t1 = (_TECHMAP_CONSTMSK_T1_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_T1_ === 0) ? 1'b1 : T1;
  localparam INV_T2 = (_TECHMAP_CONSTMSK_T2_ == 1)  ? !_TECHMAP_CONSTVAL_T2_ ^ IS_T2_INVERTED :
                      (_TECHMAP_CONSTVAL_T2_ === 0) ? ~IS_T2_INVERTED : IS_T2_INVERTED;
  wire t2 = (_TECHMAP_CONSTMSK_T2_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_T2_ === 0) ? 1'b1 : T2;
  localparam INV_T3 = (_TECHMAP_CONSTMSK_T3_ == 1)  ? !_TECHMAP_CONSTVAL_T3_ ^ IS_T3_INVERTED :
                      (_TECHMAP_CONSTVAL_T3_ === 0) ? ~IS_T3_INVERTED : IS_T3_INVERTED;
  wire t3 = (_TECHMAP_CONSTMSK_T3_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_T3_ === 0) ? 1'b1 : T3;
  localparam INV_T4 = (_TECHMAP_CONSTMSK_T4_ == 1)  ? !_TECHMAP_CONSTVAL_T4_ ^ IS_T4_INVERTED :
                      (_TECHMAP_CONSTVAL_T4_ === 0) ? ~IS_T4_INVERTED : IS_T4_INVERTED;
  wire t4 = (_TECHMAP_CONSTMSK_T4_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_T4_ === 0) ? 1'b1 : T4;
  OSERDESE2_VPR #(
      .SERDES_MODE_SLAVE            (SERDES_MODE == "SLAVE"),
      .TRISTATE_WIDTH_W4            (TRISTATE_WIDTH == 4),
      .DATA_RATE_OQ_DDR             (DATA_RATE_OQ == "DDR"),
      .DATA_RATE_OQ_SDR             (DATA_RATE_OQ == "SDR"),
      .DATA_RATE_TQ_BUF             (DATA_RATE_TQ == "BUF"),
      .DATA_RATE_TQ_DDR             (DATA_RATE_TQ == "DDR"),
      .DATA_RATE_TQ_SDR             (DATA_RATE_TQ == "SDR"),
      .DATA_WIDTH_DDR_W4            (DATA_RATE_OQ == "DDR" && DATA_WIDTH == 4),
      .DATA_WIDTH_DDR_W6            (DATA_RATE_OQ == "DDR" && DATA_WIDTH == 6),
      .DATA_WIDTH_DDR_W8            (DATA_RATE_OQ == "DDR" && DATA_WIDTH == 8),
      .DATA_WIDTH_SDR_W2            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 2),
      .DATA_WIDTH_SDR_W3            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 3),
      .DATA_WIDTH_SDR_W4            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 4),
      .DATA_WIDTH_SDR_W5            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 5),
      .DATA_WIDTH_SDR_W6            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 6),
      .DATA_WIDTH_SDR_W7            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 7),
      .DATA_WIDTH_SDR_W8            (DATA_RATE_OQ == "SDR" && DATA_WIDTH == 8),
      .ZINIT_OQ                     (!INIT_OQ),
      .ZINIT_TQ                     (!INIT_TQ),
      .ZSRVAL_OQ                    (!SRVAL_OQ),
      .ZSRVAL_TQ                    (!SRVAL_TQ),
      .IS_CLKDIV_INVERTED           (IS_CLKDIV_INVERTED),
      .IS_D1_INVERTED               (INV_D1),
      .IS_D2_INVERTED               (INV_D2),
      .IS_D3_INVERTED               (INV_D3),
      .IS_D4_INVERTED               (INV_D4),
      .IS_D5_INVERTED               (INV_D5),
      .IS_D6_INVERTED               (INV_D6),
      .IS_D7_INVERTED               (INV_D7),
      .IS_D8_INVERTED               (INV_D8),
      .ZINV_CLK                     (!IS_CLK_INVERTED),
      .ZINV_T1                      (!INV_T1),
      .ZINV_T2                      (!INV_T2),
      .ZINV_T3                      (!INV_T3),
      .ZINV_T4                      (!INV_T4),
      .TQ_USED                      (TQ_USED)
  ) _TECHMAP_REPLACE_ (
    .CLK    (CLK),
    .CLKDIV (CLKDIV),
    .D1     (d1),
    .D2     (d2),
    .D3     (d3),
    .D4     (d4),
    .D5     (d5),
    .D6     (d6),
    .D7     (d7),
    .D8     (d8),
    .OCE    (OCE),
    .RST    (RST),
    .T1     (t1),
    .T2     (t2),
    .T3     (t3),
    .T4     (t4),
    .TCE    (TCE),
    .OFB    (OFB),
    .OQ     (OQ),
    .TFB    (TFB),
    .TQ     (TQ)
  );
endmodule