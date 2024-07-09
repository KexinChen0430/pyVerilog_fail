module GTPE2_COMMON (
  output DRPRDY,
  output PLL0FBCLKLOST,
  output PLL0LOCK,
  output PLL0OUTCLK,
  output PLL0OUTREFCLK,
  output PLL0REFCLKLOST,
  output PLL1FBCLKLOST,
  output PLL1LOCK,
  output PLL1OUTCLK,
  output PLL1OUTREFCLK,
  output PLL1REFCLKLOST,
  output REFCLKOUTMONITOR0,
  output REFCLKOUTMONITOR1,
  output [15:0] DRPDO,
  output [15:0] PMARSVDOUT,
  output [7:0] DMONITOROUT,
  input BGBYPASSB,
  input BGMONITORENB,
  input BGPDB,
  input BGRCALOVRDENB,
  input DRPCLK,
  input DRPEN,
  input DRPWE,
  input GTREFCLK0,
  input GTREFCLK1,
  input GTGREFCLK0,
  input GTGREFCLK1,
  input PLL0LOCKDETCLK,
  input PLL0LOCKEN,
  input PLL0PD,
  input PLL0RESET,
  input PLL1LOCKDETCLK,
  input PLL1LOCKEN,
  input PLL1PD,
  input PLL1RESET,
  input RCALENB,
  input [15:0] DRPDI,
  input [2:0] PLL0REFCLKSEL,
  input [2:0] PLL1REFCLKSEL,
  input [4:0] BGRCALOVRD,
  input [7:0] DRPADDR,
  input [7:0] PMARSVD
);
  parameter [63:0] BIAS_CFG = 64'h0000000000000000;
  parameter [31:0] COMMON_CFG = 32'h00000000;
  parameter [26:0] PLL0_CFG = 27'h01F03DC;
  parameter [0:0] PLL0_DMON_CFG = 1'b0;
  parameter [23:0] PLL0_INIT_CFG = 24'h00001E;
  parameter [8:0] PLL0_LOCK_CFG = 9'h1E8;
  parameter [26:0] PLL1_CFG = 27'h01F03DC;
  parameter [0:0] PLL1_DMON_CFG = 1'b0;
  parameter [23:0] PLL1_INIT_CFG = 24'h00001E;
  parameter [8:0] PLL1_LOCK_CFG = 9'h1E8;
  parameter [7:0] PLL_CLKOUT_CFG = 8'b00000000;
  parameter [15:0] RSVD_ATTR0 = 16'h0000;
  parameter [15:0] RSVD_ATTR1 = 16'h0000;
  parameter integer PLL0_REFCLK_DIV = 1;
  parameter integer PLL0_FBDIV = 4;
  parameter integer PLL0_FBDIV_45 = 5;
  parameter integer PLL1_REFCLK_DIV = 1;
  parameter integer PLL1_FBDIV = 4;
  parameter integer PLL1_FBDIV_45 = 5;
  localparam [4:0] PLL0_REFCLK_DIV_BIN = PLL0_REFCLK_DIV == 1 ? 5'b10000 : 5'b00000;
  localparam [4:0] PLL1_REFCLK_DIV_BIN = PLL1_REFCLK_DIV == 1 ? 5'b10000 : 5'b00000;
  localparam [5:0] PLL0_FBDIV_BIN = PLL0_FBDIV == 1 ? 6'b010000 :
                                    PLL0_FBDIV == 2 ? 6'b000000 :
                                    PLL0_FBDIV == 3 ? 6'b000001 :
                                    PLL0_FBDIV == 4 ? 6'b000010 :
                                  /*PLL0_FBDIV == 5*/ 6'b000011;
  localparam [5:0] PLL1_FBDIV_BIN = PLL1_FBDIV == 1 ? 6'b010000 :
                                    PLL1_FBDIV == 2 ? 6'b000000 :
                                    PLL1_FBDIV == 3 ? 6'b000001 :
                                    PLL1_FBDIV == 4 ? 6'b000010 :
                                  /*PLL1_FBDIV == 5*/ 6'b000011;
  localparam PLL0_FBDIV_45_BIN = PLL0_FBDIV_45 == 4 ? 1'b0 : 1'b1;
  localparam PLL1_FBDIV_45_BIN = PLL1_FBDIV_45 == 4 ? 1'b0 : 1'b1;
  parameter [0:0] IS_DRPCLK_INVERTED = 1'b0;
  parameter [0:0] IS_PLL0LOCKDETCLK_INVERTED = 1'b0;
  parameter [0:0] IS_PLL1LOCKDETCLK_INVERTED = 1'b0;
  parameter [0:0] IS_GTGREFCLK0_INVERTED = 1'b0;
  parameter [0:0] IS_GTGREFCLK1_INVERTED = 1'b0;
  parameter _TECHMAP_CONSTMSK_DRPCLK_         = 0;
  parameter _TECHMAP_CONSTVAL_DRPCLK_         = 0;
  parameter _TECHMAP_CONSTMSK_PLL0LOCKDETCLK_ = 0;
  parameter _TECHMAP_CONSTVAL_PLL0LOCKDETCLK_ = 0;
  parameter _TECHMAP_CONSTMSK_PLL1LOCKDETCLK_ = 0;
  parameter _TECHMAP_CONSTVAL_PLL1LOCKDETCLK_ = 0;
  localparam [0:0] INV_DRPCLK = (_TECHMAP_CONSTMSK_DRPCLK_ == 1) ? !_TECHMAP_CONSTVAL_DRPCLK_ ^ IS_DRPCLK_INVERTED :
                                (_TECHMAP_CONSTVAL_DRPCLK_ == 0) ? ~IS_DRPCLK_INVERTED : IS_DRPCLK_INVERTED;
  wire drpclk = (_TECHMAP_CONSTMSK_DRPCLK_ == 1) ? 1'b1 :
                (_TECHMAP_CONSTVAL_DRPCLK_ == 0) ? 1'b1 : DRPCLK;
  localparam [0:0] INV_PLL0LOCKDETCLK = (_TECHMAP_CONSTMSK_PLL0LOCKDETCLK_ == 1) ? !_TECHMAP_CONSTVAL_PLL0LOCKDETCLK_ ^ IS_PLL0LOCKDETCLK_INVERTED :
                                        (_TECHMAP_CONSTVAL_PLL0LOCKDETCLK_ == 0) ? ~IS_PLL0LOCKDETCLK_INVERTED : IS_PLL0LOCKDETCLK_INVERTED;
  wire pll0lockdetclk = (_TECHMAP_CONSTMSK_PLL0LOCKDETCLK_ == 1) ? 1'b1 :
                        (_TECHMAP_CONSTVAL_PLL0LOCKDETCLK_ == 0) ? 1'b1 : PLL0LOCKDETCLK;
  localparam [0:0] INV_PLL1LOCKDETCLK = (_TECHMAP_CONSTMSK_PLL1LOCKDETCLK_ == 1) ? !_TECHMAP_CONSTVAL_PLL1LOCKDETCLK_ ^ IS_PLL1LOCKDETCLK_INVERTED :
                                        (_TECHMAP_CONSTVAL_PLL1LOCKDETCLK_ == 0) ? ~IS_PLL1LOCKDETCLK_INVERTED : IS_PLL1LOCKDETCLK_INVERTED;
  wire pll1lockdetclk = (_TECHMAP_CONSTMSK_PLL1LOCKDETCLK_ == 1) ? 1'b1 :
                        (_TECHMAP_CONSTVAL_PLL1LOCKDETCLK_ == 0) ? 1'b1 : PLL1LOCKDETCLK;
  parameter _TECHMAP_CONSTMSK_GTREFCLK0_ = 0;
  parameter _TECHMAP_CONSTVAL_GTREFCLK0_ = 0;
  parameter _TECHMAP_CONSTMSK_GTREFCLK1_ = 0;
  parameter _TECHMAP_CONSTVAL_GTREFCLK1_ = 0;
  localparam [0:0] GTREFCLK0_USED = (_TECHMAP_CONSTMSK_GTREFCLK0_ == 1)  ? 1'b0 :
                                    (_TECHMAP_CONSTVAL_GTREFCLK0_ === 0) ? 1'b0 : 1'b1;
  localparam [0:0] GTREFCLK1_USED = (_TECHMAP_CONSTMSK_GTREFCLK1_ == 1)  ? 1'b0 :
                                    (_TECHMAP_CONSTVAL_GTREFCLK1_ === 0) ? 1'b0 : 1'b1;
  localparam [0:0] BOTH_GTREFCLK_USED = GTREFCLK0_USED && GTREFCLK1_USED;
  localparam [0:0] NONE_GTREFCLK_USED = !(GTREFCLK0_USED || GTREFCLK1_USED);
  if (NONE_GTREFCLK_USED) begin
    wire _TECHMAP_FAIL_ = 1'b1;
  end
  if (BOTH_GTREFCLK_USED) begin
      GTPE2_COMMON_VPR #(
        .BIAS_CFG                   (BIAS_CFG),
        .COMMON_CFG                 (COMMON_CFG),
        .PLL0_CFG                   (PLL0_CFG),
        .PLL0_DMON_CFG              (PLL0_DMON_CFG),
        .PLL0_FBDIV                 (PLL0_FBDIV_BIN),
        .PLL0_FBDIV_45              (PLL0_FBDIV_45_BIN),
        .PLL0_INIT_CFG              (PLL0_INIT_CFG),
        .PLL0_LOCK_CFG              (PLL0_LOCK_CFG),
        .PLL0_REFCLK_DIV            (PLL0_REFCLK_DIV_BIN),
        .PLL1_CFG                   (PLL1_CFG),
        .PLL1_DMON_CFG              (PLL1_DMON_CFG),
        .PLL1_FBDIV                 (PLL1_FBDIV_BIN),
        .PLL1_FBDIV_45              (PLL1_FBDIV_45_BIN),
        .PLL1_INIT_CFG              (PLL1_INIT_CFG),
        .PLL1_LOCK_CFG              (PLL1_LOCK_CFG),
        .PLL1_REFCLK_DIV            (PLL1_REFCLK_DIV_BIN),
        .PLL_CLKOUT_CFG             (PLL_CLKOUT_CFG),
        .RSVD_ATTR0                 (RSVD_ATTR0),
        .RSVD_ATTR1                 (RSVD_ATTR1),
        .INV_DRPCLK                 (INV_DRPCLK),
        .INV_PLL0LOCKDETCLK         (INV_PLL0LOCKDETCLK),
        .INV_PLL1LOCKDETCLK         (INV_PLL1LOCKDETCLK),
        .GTREFCLK0_USED             (GTREFCLK0_USED == 1'b1),
        .GTREFCLK1_USED             (GTREFCLK1_USED == 1'b1),
        .BOTH_GTREFCLK_USED         (BOTH_GTREFCLK_USED),
        .ENABLE_DRP                 (1'b1),
        .IBUFDS_GTE2_CLKSWING_CFG   (2'b11)
      ) _TECHMAP_REPLACE_ (
        .DRPRDY             (DRPRDY),
        .PLL0FBCLKLOST      (PLL0FBCLKLOST),
        .PLL0LOCK           (PLL0LOCK),
        .PLL0OUTCLK         (PLL0OUTCLK),
        .PLL0OUTREFCLK      (PLL0OUTREFCLK),
        .PLL0REFCLKLOST     (PLL0REFCLKLOST),
        .PLL1FBCLKLOST      (PLL1FBCLKLOST),
        .PLL1LOCK           (PLL1LOCK),
        .PLL1OUTCLK         (PLL1OUTCLK),
        .PLL1OUTREFCLK      (PLL1OUTREFCLK),
        .PLL1REFCLKLOST     (PLL1REFCLKLOST),
        .REFCLKOUTMONITOR0  (REFCLKOUTMONITOR0),
        .REFCLKOUTMONITOR1  (REFCLKOUTMONITOR1),
        .DRPDO              (DRPDO),
        .PMARSVDOUT         (PMARSVDOUT),
        .DMONITOROUT        (DMONITOROUT),
        .BGBYPASSB          (BGBYPASSB),
        .BGMONITORENB       (BGMONITORENB),
        .BGPDB              (BGPDB),
        .BGRCALOVRDENB      (BGRCALOVRDENB),
        .DRPCLK             (drpclk),
        .DRPEN              (DRPEN),
        .DRPWE              (DRPWE),
        .GTREFCLK0          (GTREFCLK0),
        .GTREFCLK1          (GTREFCLK1),
        .PLL0LOCKDETCLK     (pll0lockdetclk),
        .PLL0LOCKEN         (PLL0LOCKEN),
        .PLL0PD             (PLL0PD),
        .PLL0RESET          (PLL0RESET),
        .PLL1LOCKDETCLK     (pll1lockdetclk),
        .PLL1LOCKEN         (PLL1LOCKEN),
        .PLL1PD             (PLL1PD),
        .PLL1RESET          (PLL1RESET),
        .RCALENB            (RCALENB),
        .DRPDI              (DRPDI),
        .PLL0REFCLKSEL      (PLL0REFCLKSEL),
        .PLL1REFCLKSEL      (PLL1REFCLKSEL),
        .BGRCALOVRD         (BGRCALOVRD),
        .DRPADDR            (DRPADDR),
        .PMARSVD            (PMARSVD)
      );
  end else if (GTREFCLK0_USED) begin
      GTPE2_COMMON_VPR #(
        .BIAS_CFG                   (BIAS_CFG),
        .COMMON_CFG                 (COMMON_CFG),
        .PLL0_CFG                   (PLL0_CFG),
        .PLL0_DMON_CFG              (PLL0_DMON_CFG),
        .PLL0_FBDIV                 (PLL0_FBDIV_BIN),
        .PLL0_FBDIV_45              (PLL0_FBDIV_45_BIN),
        .PLL0_INIT_CFG              (PLL0_INIT_CFG),
        .PLL0_LOCK_CFG              (PLL0_LOCK_CFG),
        .PLL0_REFCLK_DIV            (PLL0_REFCLK_DIV_BIN),
        .PLL1_CFG                   (PLL1_CFG),
        .PLL1_DMON_CFG              (PLL1_DMON_CFG),
        .PLL1_FBDIV                 (PLL1_FBDIV_BIN),
        .PLL1_FBDIV_45              (PLL1_FBDIV_45_BIN),
        .PLL1_INIT_CFG              (PLL1_INIT_CFG),
        .PLL1_LOCK_CFG              (PLL1_LOCK_CFG),
        .PLL1_REFCLK_DIV            (PLL1_REFCLK_DIV_BIN),
        .PLL_CLKOUT_CFG             (PLL_CLKOUT_CFG),
        .RSVD_ATTR0                 (RSVD_ATTR0),
        .RSVD_ATTR1                 (RSVD_ATTR1),
        .INV_DRPCLK                 (INV_DRPCLK),
        .INV_PLL0LOCKDETCLK         (INV_PLL0LOCKDETCLK),
        .INV_PLL1LOCKDETCLK         (INV_PLL1LOCKDETCLK),
        .GTREFCLK0_USED             (GTREFCLK0_USED == 1'b1),
        .GTREFCLK1_USED             (GTREFCLK1_USED == 1'b1),
        .BOTH_GTREFCLK_USED         (BOTH_GTREFCLK_USED),
        .ENABLE_DRP                 (1'b1),
        .IBUFDS_GTE2_CLKSWING_CFG   (2'b11)
      ) _TECHMAP_REPLACE_ (
        .DRPRDY             (DRPRDY),
        .PLL0FBCLKLOST      (PLL0FBCLKLOST),
        .PLL0LOCK           (PLL0LOCK),
        .PLL0OUTCLK         (PLL0OUTCLK),
        .PLL0OUTREFCLK      (PLL0OUTREFCLK),
        .PLL0REFCLKLOST     (PLL0REFCLKLOST),
        .PLL1FBCLKLOST      (PLL1FBCLKLOST),
        .PLL1LOCK           (PLL1LOCK),
        .PLL1OUTCLK         (PLL1OUTCLK),
        .PLL1OUTREFCLK      (PLL1OUTREFCLK),
        .PLL1REFCLKLOST     (PLL1REFCLKLOST),
        .REFCLKOUTMONITOR0  (REFCLKOUTMONITOR0),
        .REFCLKOUTMONITOR1  (REFCLKOUTMONITOR1),
        .DRPDO              (DRPDO),
        .PMARSVDOUT         (PMARSVDOUT),
        .DMONITOROUT        (DMONITOROUT),
        .BGBYPASSB          (BGBYPASSB),
        .BGMONITORENB       (BGMONITORENB),
        .BGPDB              (BGPDB),
        .BGRCALOVRDENB      (BGRCALOVRDENB),
        .DRPCLK             (drpclk),
        .DRPEN              (DRPEN),
        .DRPWE              (DRPWE),
        .GTREFCLK0          (GTREFCLK0),
        .PLL0LOCKDETCLK     (pll0lockdetclk),
        .PLL0LOCKEN         (PLL0LOCKEN),
        .PLL0PD             (PLL0PD),
        .PLL0RESET          (PLL0RESET),
        .PLL1LOCKDETCLK     (pll1lockdetclk),
        .PLL1LOCKEN         (PLL1LOCKEN),
        .PLL1PD             (PLL1PD),
        .PLL1RESET          (PLL1RESET),
        .RCALENB            (RCALENB),
        .DRPDI              (DRPDI),
        .PLL0REFCLKSEL      (PLL0REFCLKSEL),
        .PLL1REFCLKSEL      (PLL1REFCLKSEL),
        .BGRCALOVRD         (BGRCALOVRD),
        .DRPADDR            (DRPADDR),
        .PMARSVD            (PMARSVD)
      );
  end else begin
      GTPE2_COMMON_VPR #(
        .BIAS_CFG                   (BIAS_CFG),
        .COMMON_CFG                 (COMMON_CFG),
        .PLL0_CFG                   (PLL0_CFG),
        .PLL0_DMON_CFG              (PLL0_DMON_CFG),
        .PLL0_FBDIV                 (PLL0_FBDIV_BIN),
        .PLL0_FBDIV_45              (PLL0_FBDIV_45_BIN),
        .PLL0_INIT_CFG              (PLL0_INIT_CFG),
        .PLL0_LOCK_CFG              (PLL0_LOCK_CFG),
        .PLL0_REFCLK_DIV            (PLL0_REFCLK_DIV_BIN),
        .PLL1_CFG                   (PLL1_CFG),
        .PLL1_DMON_CFG              (PLL1_DMON_CFG),
        .PLL1_FBDIV                 (PLL1_FBDIV_BIN),
        .PLL1_FBDIV_45              (PLL1_FBDIV_45_BIN),
        .PLL1_INIT_CFG              (PLL1_INIT_CFG),
        .PLL1_LOCK_CFG              (PLL1_LOCK_CFG),
        .PLL1_REFCLK_DIV            (PLL1_REFCLK_DIV_BIN),
        .PLL_CLKOUT_CFG             (PLL_CLKOUT_CFG),
        .RSVD_ATTR0                 (RSVD_ATTR0),
        .RSVD_ATTR1                 (RSVD_ATTR1),
        .INV_DRPCLK                 (INV_DRPCLK),
        .INV_PLL0LOCKDETCLK         (INV_PLL0LOCKDETCLK),
        .INV_PLL1LOCKDETCLK         (INV_PLL1LOCKDETCLK),
        .GTREFCLK0_USED             (GTREFCLK0_USED == 1'b1),
        .GTREFCLK1_USED             (GTREFCLK1_USED == 1'b1),
        .BOTH_GTREFCLK_USED         (BOTH_GTREFCLK_USED),
        .ENABLE_DRP                 (1'b1),
        .IBUFDS_GTE2_CLKSWING_CFG   (2'b11)
      ) _TECHMAP_REPLACE_ (
        .DRPRDY             (DRPRDY),
        .PLL0FBCLKLOST      (PLL0FBCLKLOST),
        .PLL0LOCK           (PLL0LOCK),
        .PLL0OUTCLK         (PLL0OUTCLK),
        .PLL0OUTREFCLK      (PLL0OUTREFCLK),
        .PLL0REFCLKLOST     (PLL0REFCLKLOST),
        .PLL1FBCLKLOST      (PLL1FBCLKLOST),
        .PLL1LOCK           (PLL1LOCK),
        .PLL1OUTCLK         (PLL1OUTCLK),
        .PLL1OUTREFCLK      (PLL1OUTREFCLK),
        .PLL1REFCLKLOST     (PLL1REFCLKLOST),
        .REFCLKOUTMONITOR0  (REFCLKOUTMONITOR0),
        .REFCLKOUTMONITOR1  (REFCLKOUTMONITOR1),
        .DRPDO              (DRPDO),
        .PMARSVDOUT         (PMARSVDOUT),
        .DMONITOROUT        (DMONITOROUT),
        .BGBYPASSB          (BGBYPASSB),
        .BGMONITORENB       (BGMONITORENB),
        .BGPDB              (BGPDB),
        .BGRCALOVRDENB      (BGRCALOVRDENB),
        .DRPCLK             (drpclk),
        .DRPEN              (DRPEN),
        .DRPWE              (DRPWE),
        .GTREFCLK1          (GTREFCLK1),
        .PLL0LOCKDETCLK     (pll0lockdetclk),
        .PLL0LOCKEN         (PLL0LOCKEN),
        .PLL0PD             (PLL0PD),
        .PLL0RESET          (PLL0RESET),
        .PLL1LOCKDETCLK     (pll1lockdetclk),
        .PLL1LOCKEN         (PLL1LOCKEN),
        .PLL1PD             (PLL1PD),
        .PLL1RESET          (PLL1RESET),
        .RCALENB            (RCALENB),
        .DRPDI              (DRPDI),
        .PLL0REFCLKSEL      (PLL0REFCLKSEL),
        .PLL1REFCLKSEL      (PLL1REFCLKSEL),
        .BGRCALOVRD         (BGRCALOVRD),
        .DRPADDR            (DRPADDR),
        .PMARSVD            (PMARSVD)
      );
  end
endmodule