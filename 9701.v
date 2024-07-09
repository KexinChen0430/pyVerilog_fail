module MMCME2_ADV
(
input         CLKFBIN,
input         CLKIN1,
input         CLKIN2,
input         CLKINSEL,
output        CLKFBOUT,
output        CLKFBOUTB,
output        CLKOUT0,
output        CLKOUT0B,
output        CLKOUT1,
output        CLKOUT1B,
output        CLKOUT2,
output        CLKOUT2B,
output        CLKOUT3,
output        CLKOUT3B,
output        CLKOUT4,
output        CLKOUT5,
output        CLKOUT6,
output        CLKINSTOPPED,
output        CLKFBSTOPPED,
input         PWRDWN,
input         RST,
output        LOCKED,
input         PSCLK,
input         PSEN,
input         PSINCDEC,
output        PSDONE,
input         DCLK,
input         DEN,
input         DWE,
output        DRDY,
input  [ 6:0] DADDR,
input  [15:0] DI,
output [15:0] DO
);
  parameter _TECHMAP_CONSTMSK_CLKINSEL_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKINSEL_ = 0;
  parameter _TECHMAP_CONSTMSK_RST_      = 0;
  parameter _TECHMAP_CONSTVAL_RST_      = 0;
  parameter _TECHMAP_CONSTMSK_PWRDWN_   = 0;
  parameter _TECHMAP_CONSTVAL_PWRDWN_   = 0;
  parameter _TECHMAP_CONSTMSK_CLKFBOUT_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKFBOUT_ = 0;
  parameter _TECHMAP_CONSTMSK_CLKFBOUTB_= 0;
  parameter _TECHMAP_CONSTVAL_CLKFBOUTB_= 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT0_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT0_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT0B_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT0B_ = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT1_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT1_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT1B_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT1B_ = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT2_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT2_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT2B_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT2B_ = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT3_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT3_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT3B_ = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT3B_ = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT4_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT4_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT5_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT5_  = 0;
  parameter _TECHMAP_CONSTMSK_CLKOUT6_  = 0;
  parameter _TECHMAP_CONSTVAL_CLKOUT6_  = 0;
  parameter _TECHMAP_CONSTMSK_PSCLK_    = 0;
  parameter _TECHMAP_CONSTVAL_PSCLK_    = 0;
  parameter _TECHMAP_CONSTMSK_PSEN_     = 0;
  parameter _TECHMAP_CONSTVAL_PSEN_     = 0;
  parameter _TECHMAP_CONSTMSK_PSINCDEC_ = 0;
  parameter _TECHMAP_CONSTVAL_PSINCDEC_ = 0;
  parameter _TECHMAP_CONSTMSK_DCLK_     = 0;
  parameter _TECHMAP_CONSTVAL_DCLK_     = 0;
  parameter _TECHMAP_CONSTMSK_DEN_      = 0;
  parameter _TECHMAP_CONSTVAL_DEN_      = 0;
  parameter _TECHMAP_CONSTMSK_DWE_      = 0;
  parameter _TECHMAP_CONSTVAL_DWE_      = 0;
  parameter IS_CLKINSEL_INVERTED = 1'b0;
  parameter IS_RST_INVERTED = 1'b0;
  parameter IS_PWRDWN_INVERTED = 1'b0;
  parameter IS_PSEN_INVERTED = 1'b0;
  parameter IS_PSINCDEC_INVERTED = 1'b0;
  parameter BANDWIDTH = "OPTIMIZED";
  parameter STARTUP_WAIT = "FALSE";
// Previously, the default COMPENSATION value was ZHOLD, resulting in non-functional
//   bitstreams when the feedback loop is closed on-chip.
  // Setting it to INTERNAL as the default creates working bitstreams for that case.
// This bug was not previously uncovered since the MMCM tests all explicitly
//   specified a COMPENSATION value so the ZHOLD default was never used.
// Setting it here in the techmapper means that existing code using on-chip
//   MMCM feedback without specifying a COMPENSATION value can be ported
//   unmodified into the toolflow and will result in functional bitstreams.
// A test was added to test the case when relying on the default COMPENSATION value.
  parameter COMPENSATION = "INTERNAL";
  parameter CLKIN1_PERIOD = 0.0;
  parameter REF_JITTER1 = 0.01;
  parameter CLKIN2_PERIOD = 0.0;
  parameter REF_JITTER2 = 0.01;
  parameter [5:0] DIVCLK_DIVIDE = 1;
  parameter CLKFBOUT_MULT_F = 5000;
  parameter signed [31:0] CLKFBOUT_PHASE = 0;
  parameter CLKFBOUT_USE_FINE_PS = "FALSE";
  parameter CLKOUT0_DIVIDE_F = 1000;
  parameter CLKOUT0_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT0_PHASE = 0;
  parameter CLKOUT0_USE_FINE_PS = "FALSE";
  parameter CLKOUT1_DIVIDE = 1;
  parameter CLKOUT1_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT1_PHASE = 0;
  parameter CLKOUT1_USE_FINE_PS = "FALSE";
  parameter CLKOUT2_DIVIDE = 1;
  parameter CLKOUT2_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT2_PHASE = 0;
  parameter CLKOUT2_USE_FINE_PS = "FALSE";
  parameter CLKOUT3_DIVIDE = 1;
  parameter CLKOUT3_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT3_PHASE = 0;
  parameter CLKOUT3_USE_FINE_PS = "FALSE";
  parameter CLKOUT4_DIVIDE = 1;
  parameter CLKOUT4_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT4_PHASE = 0;
  parameter CLKOUT4_USE_FINE_PS = "FALSE";
  parameter CLKOUT5_DIVIDE = 1;
  parameter CLKOUT5_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT5_PHASE = 0;
  parameter CLKOUT5_USE_FINE_PS = "FALSE";
  parameter CLKOUT6_DIVIDE = 1;
  parameter CLKOUT6_DUTY_CYCLE = 50000;
  parameter signed [31:0] CLKOUT6_PHASE = 0;
  parameter CLKOUT6_USE_FINE_PS = "FALSE";
  parameter CLKOUT4_CASCADE = 0;
  parameter SS_EN   = "FALSE";
  parameter SS_MODE = "CENTER_HIGH";
  parameter SS_MOD_PERIOD = 10000;
  // Sanity check parameters
  if (BANDWIDTH != "HIGH" && BANDWIDTH != "LOW" && BANDWIDTH != "OPTIMIZED") begin
    wire _TECHMAP_FAIL_;
    $error("BANDWIDTH must be one of: 'HIGH', 'LOW', 'OPTIMIZED'");
  end
  if (COMPENSATION != "ZHOLD" && COMPENSATION != "EXTERNAL" && COMPENSATION != "INTERNAL" && COMPENSATION != "BUF_IN") begin
    wire _TECHMAP_FAIL_;
    $error("COMPENSATION must be one of: 'ZHOLD', 'EXTERNAL', 'INTERNAL', 'BUF_IN'");
  end
  if (DIVCLK_DIVIDE < 1 || DIVCLK_DIVIDE > 106) begin
    wire _TECHMAP_FAIL_;
    $error("DIVCLK_DIVIDE must range from 1 to 106");
  end
  if (CLKFBOUT_MULT_F < 2000 || CLKFBOUT_MULT_F > 64000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKFBOUT_MULT_F must range from 2000 to 64000");
  end
  if (CLKFBOUT_PHASE < -32'sd360000 || CLKFBOUT_PHASE > 32'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKFBOUT_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT0_DIVIDE_F < 1000 || CLKOUT0_DIVIDE_F > 128000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT0_DIVIDE_F must range from 1000 to 128000");
  end
  if (CLKOUT1_DIVIDE < 1 || CLKOUT1_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT1_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT2_DIVIDE < 1 || CLKOUT2_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT2_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT3_DIVIDE < 1 || CLKOUT3_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT3_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT4_DIVIDE < 1 || CLKOUT4_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT4_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT5_DIVIDE < 1 || CLKOUT5_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT5_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT6_DIVIDE < 1 || CLKOUT6_DIVIDE > 128) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT6_DIVIDE must range from 1 to 128");
  end
  if (CLKOUT0_PHASE < -'sd360000 || CLKOUT0_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT0_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT1_PHASE < -'sd360000 || CLKOUT1_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT1_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT2_PHASE < -'sd360000 || CLKOUT2_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT2_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT3_PHASE < -'sd360000 || CLKOUT3_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT3_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT4_PHASE < -'sd360000 || CLKOUT4_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT4_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT5_PHASE < -'sd360000 || CLKOUT5_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT5_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT6_PHASE < -'sd360000 || CLKOUT6_PHASE > 'sd360000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT6_PHASE must range from -360000 to 360000");
  end
  if (CLKOUT0_DUTY_CYCLE < 1000 || CLKOUT0_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT0_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT1_DUTY_CYCLE < 1000 || CLKOUT1_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT1_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT2_DUTY_CYCLE < 1000 || CLKOUT2_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT2_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT3_DUTY_CYCLE < 1000 || CLKOUT3_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT3_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT4_DUTY_CYCLE < 1000 || CLKOUT4_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT4_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT5_DUTY_CYCLE < 1000 || CLKOUT5_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT5_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (CLKOUT6_DUTY_CYCLE < 1000 || CLKOUT6_DUTY_CYCLE > 99000) begin
    wire _TECHMAP_FAIL_;
    $error("CLKOUT6_DUTY_CYCLE must range from 1000 to 99000");
  end
  if (SS_EN != "TRUE" && SS_EN != "FALSE") begin
    wire _TECHMAP_FAIL_;
    $error("SS_EN must be either 'TRUE' or 'FALSE'");
  end
  if (SS_MODE != "DOWN_LOW" && SS_MODE != "DOWN_HIGH" && SS_MODE != "CENTER_LOW" && SS_MODE != "CENTER_HIGH") begin
    wire _TECHMAP_FAIL_;
    $error("SS_MODE must be one of: 'DOWN_LOW', 'DOWN_HIGH', 'CENTER_LOW', 'CENTER_HIGH'");
  end
  if (SS_MOD_PERIOD < 4000 || SS_MOD_PERIOD > 40000) begin
    wire _TECHMAP_FAIL_;
    $error("SS_MOD_PERIOD must range from 4000 to 40000");
  end
  // Round fractional dividers to multiples of 1/8.
  // (125 / 2 = 62.5)
  localparam CLKFBOUT_MULT_R  = ((CLKFBOUT_MULT_F  + 62) / 125) * 125;
  localparam CLKOUT0_DIVIDE_R = ((CLKOUT0_DIVIDE_F + 62) / 125) * 125;
  // Compute integer multipliers needed later for look-up tables
  localparam CLKFBOUT_MULT    =  CLKFBOUT_MULT_R  / 1000;
  localparam CLKOUT0_DIVIDE   =  CLKOUT0_DIVIDE_R / 1000;
  // Check whether fractional divider needs to be enabled on CLKFBOUT and
  // CLKOUT0
  localparam CLKFBOUT_FRAC_EN = (CLKFBOUT_MULT_R  % 1000) != 0;
  localparam CLKOUT0_FRAC_EN  = (CLKOUT0_DIVIDE_R % 1000) != 0;
  if (CLKOUT0_FRAC_EN && CLKOUT0_DUTY_CYCLE != 50000) begin
    wire _TECHMAP_FAIL_;
    $error("When CLKOUT0 uses fractional divider the duty cycle must be 50%");
  end
  // Check whether phase shift of CLKFBOUT and CLKOUT0 is a multiple of 45 deg.
  // This is needed for determining content of POWER_REG.
  localparam CLKFBOUT_PHASE_45 = (CLKFBOUT_PHASE % 45000) == 0;
  localparam CLKOUT0_PHASE_45  = (CLKOUT0_PHASE  % 45000) == 0;
  // Handle registers controling fractional dividers
  localparam CLKFBOUT_CALC = mmcm_clkregs(CLKFBOUT_MULT, 50000, CLKFBOUT_PHASE);
  localparam CLKOUT0_CALC  = mmcm_clkregs(CLKOUT0_DIVIDE, CLKOUT0_DUTY_CYCLE, CLKOUT0_PHASE);
  localparam CLKOUT5_CALC  = mmcm_clkregs(CLKOUT5_DIVIDE, CLKOUT5_DUTY_CYCLE, CLKOUT5_PHASE);
  localparam CLKOUT6_CALC  = mmcm_clkregs(CLKOUT6_DIVIDE, CLKOUT6_DUTY_CYCLE, CLKOUT6_PHASE);
  localparam CLKFBOUT_FRAC_CALC = mmcm_clkregs_frac(CLKFBOUT_MULT_R,  50000, CLKFBOUT_PHASE);
  localparam CLKOUT0_FRAC_CALC  = mmcm_clkregs_frac(CLKOUT0_DIVIDE_R, 50000,  CLKOUT0_PHASE);
  // Compute PLL's registers content
  // When no fractional divider is enabled use the *_CALC content.
  // For fractional divider use *_FRAC_CALC content but tak the "EDGE" bit
  // from *_CALC. This is not documented in XAPP888 but has been observed in
  // vendor tools.
  // Additional part of *_FRAC_CALC data needs to end up in bits of
  // CLKOUT5_REGS and CLKOUT6_REGS.
  localparam CLKFBOUT_REGS = (CLKFBOUT_FRAC_EN) ? (CLKFBOUT_FRAC_CALC[31:0] | (CLKFBOUT_CALC[23] << 23)): CLKFBOUT_CALC;
  localparam DIVCLK_REGS   = mmcm_clkregs(DIVCLK_DIVIDE, 50000, 0);
  localparam CLKOUT0_REGS  = (CLKOUT0_FRAC_EN)  ? (CLKOUT0_FRAC_CALC[31:0]  | (CLKOUT0_CALC[23]  << 23)): CLKOUT0_CALC;
  localparam CLKOUT1_REGS  = mmcm_clkregs(CLKOUT1_DIVIDE, CLKOUT1_DUTY_CYCLE, CLKOUT1_PHASE);
  localparam CLKOUT2_REGS  = mmcm_clkregs(CLKOUT2_DIVIDE, CLKOUT2_DUTY_CYCLE, CLKOUT2_PHASE);
  localparam CLKOUT3_REGS  = mmcm_clkregs(CLKOUT3_DIVIDE, CLKOUT3_DUTY_CYCLE, CLKOUT3_PHASE);
  localparam CLKOUT4_REGS  = mmcm_clkregs(CLKOUT4_DIVIDE, CLKOUT4_DUTY_CYCLE, CLKOUT4_PHASE);
  // Substitute the shared part of CLKOUT5 and CLKOUT6 regs with data for
  // CLKOUT0 and CLKFBOUT when factional divider is used for either of them.
  // Additionaly copy the PHASE_MUX field to the PHASE_MUX_F fiels when
  // fractional divider is not used. This behavior is not documented in
  // XAPP888 but has been observed.
  localparam CLKOUT5_REGS  = (CLKOUT0_FRAC_EN)  ? {CLKOUT5_CALC[31:30], CLKOUT0_FRAC_CALC[35:32],  CLKOUT5_CALC[25:0]} :
                                                  {CLKOUT5_CALC[31:30], CLKOUT0_CALC[15:13],       CLKOUT5_CALC[26:0]};
  localparam CLKOUT6_REGS  = (CLKFBOUT_FRAC_EN) ? {CLKOUT6_CALC[31:30], CLKFBOUT_FRAC_CALC[35:32], CLKOUT6_CALC[25:0]} :
                                                  {CLKOUT6_CALC[31:30], CLKFBOUT_CALC[15:13],      CLKOUT6_CALC[26:0]};
  // Handle inputs that should have certain logic levels when left unconnected
  localparam INV_CLKINSEL  = (_TECHMAP_CONSTMSK_CLKINSEL_ == 1) ? !_TECHMAP_CONSTVAL_CLKINSEL_ : IS_CLKINSEL_INVERTED;
  wire clkinsel = (_TECHMAP_CONSTMSK_CLKINSEL_ == 1) ? 1'b1 :
                  (_TECHMAP_CONSTVAL_CLKINSEL_ == 0) ? 1'b1 :
                                                       CLKINSEL;
  localparam INV_PWRDWN    = (_TECHMAP_CONSTMSK_PWRDWN_ == 1) ? !_TECHMAP_CONSTVAL_PWRDWN_ :
                             (_TECHMAP_CONSTVAL_PWRDWN_ == 0) ? ~IS_PWRDWN_INVERTED :
                                                                 IS_PWRDWN_INVERTED;
  wire pwrdwn   = (_TECHMAP_CONSTMSK_PWRDWN_ == 1) ? 1'b1 :
                  (_TECHMAP_CONSTVAL_PWRDWN_ == 0) ? 1'b1 : PWRDWN;
  localparam INV_RST    = (_TECHMAP_CONSTMSK_RST_ == 1) ? !_TECHMAP_CONSTVAL_RST_ :
                          (_TECHMAP_CONSTVAL_RST_ == 0) ? ~IS_RST_INVERTED :
                                                          IS_RST_INVERTED;
  wire rst   = (_TECHMAP_CONSTMSK_RST_   == 1) ? 1'b1 :
               (_TECHMAP_CONSTVAL_RST_   == 0) ? 1'b1 : RST;
  wire dclk  = (_TECHMAP_CONSTMSK_DCLK_  == 1) ? _TECHMAP_CONSTVAL_DCLK_ :
               (_TECHMAP_CONSTVAL_DCLK_  == 0) ? 1'b0 : DCLK;
  wire den   = (_TECHMAP_CONSTMSK_DEN_   == 1) ? _TECHMAP_CONSTVAL_DEN_ :
               (_TECHMAP_CONSTVAL_DEN_   == 0) ? 1'b0 : DEN;
  wire dwe   = (_TECHMAP_CONSTMSK_DWE_   == 1) ? _TECHMAP_CONSTVAL_DWE_ :
               (_TECHMAP_CONSTVAL_DWE_   == 0) ? 1'b0 : DWE;
  wire psclk = (_TECHMAP_CONSTMSK_PSCLK_ == 1) ? _TECHMAP_CONSTVAL_PSCLK_ :
               (_TECHMAP_CONSTVAL_PSCLK_ == 0) ? 1'b0 : PSCLK;
  localparam INV_PSEN   = (_TECHMAP_CONSTMSK_PSEN_ == 1) ? !_TECHMAP_CONSTVAL_PSEN_ :
                          (_TECHMAP_CONSTVAL_PSEN_ == 0) ? ~IS_PSEN_INVERTED :
                                                            IS_PSEN_INVERTED;
  wire psen  = (_TECHMAP_CONSTMSK_PSEN_ == 1) ? 1'b1 :
               (_TECHMAP_CONSTVAL_PSEN_ == 0) ? 1'b1 : PSEN;
  localparam INV_PSINCDEC = (_TECHMAP_CONSTMSK_PSINCDEC_ == 1) ? !_TECHMAP_CONSTVAL_PSINCDEC_ :
                            (_TECHMAP_CONSTVAL_PSINCDEC_ == 0) ? ~IS_PSINCDEC_INVERTED :
                                                                  IS_PSINCDEC_INVERTED;
  wire psincdec = (_TECHMAP_CONSTMSK_PSINCDEC_ == 1) ? 1'b1 :
                  (_TECHMAP_CONSTVAL_PSINCDEC_ == 0) ? 1'b1 : PSINCDEC;
  // The substituted cell
  MMCME2_ADV_VPR #
  (
  // Inverters
  .INV_CLKINSEL  (INV_CLKINSEL),
  .ZINV_PWRDWN   (INV_PWRDWN),
  .ZINV_RST      (INV_RST),
  .ZINV_PSEN     (INV_PSEN),
  .ZINV_PSINCDEC (INV_PSINCDEC),
  // Compensation
  .COMP_ZHOLD    (COMPENSATION == "ZHOLD"),
  .COMP_Z_ZHOLD  (COMPENSATION != "ZHOLD"),
  // Spread spectrum
  .SS_EN         (1'b0), // TODO: Disable for now
  // Straight mapped parameters
  .STARTUP_WAIT(STARTUP_WAIT == "TRUE"),
  // Lookup tables
  .LKTABLE(mmcm_lktable_lookup(CLKFBOUT_MULT)),
  .TABLE(mmcm_table_lookup(CLKFBOUT_MULT, BANDWIDTH, (SS_EN == "TRUE"))),
  // FIXME: How to compute values the two below ?
  .FILTREG1_RESERVED(12'b0000_00001000),
  .LOCKREG3_RESERVED(1'b1),
  // Clock feedback settings
  .CLKFBOUT_CLKOUT1_HIGH_TIME   (CLKFBOUT_REGS[11:6]),
  .CLKFBOUT_CLKOUT1_LOW_TIME    (CLKFBOUT_REGS[5:0]),
  .CLKFBOUT_CLKOUT1_PHASE_MUX   (CLKFBOUT_REGS[15:13]),
  .CLKFBOUT_CLKOUT2_DELAY_TIME  (CLKFBOUT_REGS[21:16]),
  .CLKFBOUT_CLKOUT2_EDGE        (CLKFBOUT_REGS[23]),
  .CLKFBOUT_CLKOUT2_FRAC        (CLKFBOUT_REGS[30:28]),
  .CLKFBOUT_CLKOUT2_FRAC_EN     (CLKFBOUT_REGS[27]),
  .CLKFBOUT_CLKOUT2_FRAC_WF_R   (CLKFBOUT_REGS[26]),
  .CLKFBOUT_CLKOUT2_NO_COUNT    (CLKFBOUT_REGS[22]),
  // Internal VCO divider settings
  .DIVCLK_DIVCLK_HIGH_TIME      (DIVCLK_REGS[11:6]),
  .DIVCLK_DIVCLK_LOW_TIME       (DIVCLK_REGS[5:0]),
  .DIVCLK_DIVCLK_NO_COUNT       (DIVCLK_REGS[22]),
  .DIVCLK_DIVCLK_EDGE           (DIVCLK_REGS[23]),
  // CLKOUT0
  .CLKOUT0_CLKOUT1_HIGH_TIME    (CLKOUT0_REGS[11:6]),
  .CLKOUT0_CLKOUT1_LOW_TIME     (CLKOUT0_REGS[5:0]),
  .CLKOUT0_CLKOUT1_PHASE_MUX    (CLKOUT0_REGS[15:13]),
  .CLKOUT0_CLKOUT2_DELAY_TIME   (CLKOUT0_REGS[21:16]),
  .CLKOUT0_CLKOUT2_EDGE         (CLKOUT0_REGS[23]),
  .CLKOUT0_CLKOUT2_FRAC         (CLKOUT0_REGS[30:28]),
  .CLKOUT0_CLKOUT2_FRAC_EN      (CLKOUT0_REGS[27]),
  .CLKOUT0_CLKOUT2_FRAC_WF_R    (CLKOUT0_REGS[26]),
  .CLKOUT0_CLKOUT2_NO_COUNT     (CLKOUT0_REGS[22]),
  // CLKOUT1
  .CLKOUT1_CLKOUT1_HIGH_TIME    (CLKOUT1_REGS[11:6]),
  .CLKOUT1_CLKOUT1_LOW_TIME     (CLKOUT1_REGS[5:0]),
  .CLKOUT1_CLKOUT1_PHASE_MUX    (CLKOUT1_REGS[15:13]),
  .CLKOUT1_CLKOUT2_DELAY_TIME   (CLKOUT1_REGS[21:16]),
  .CLKOUT1_CLKOUT2_EDGE         (CLKOUT1_REGS[23]),
  .CLKOUT1_CLKOUT2_NO_COUNT     (CLKOUT1_REGS[22]),
  // CLKOUT2
  .CLKOUT2_CLKOUT1_HIGH_TIME    (CLKOUT2_REGS[11:6]),
  .CLKOUT2_CLKOUT1_LOW_TIME     (CLKOUT2_REGS[5:0]),
  .CLKOUT2_CLKOUT1_PHASE_MUX    (CLKOUT2_REGS[15:13]),
  .CLKOUT2_CLKOUT2_DELAY_TIME   (CLKOUT2_REGS[21:16]),
  .CLKOUT2_CLKOUT2_EDGE         (CLKOUT2_REGS[23]),
  .CLKOUT2_CLKOUT2_NO_COUNT     (CLKOUT2_REGS[22]),
  // CLKOUT3
  .CLKOUT3_CLKOUT1_HIGH_TIME    (CLKOUT3_REGS[11:6]),
  .CLKOUT3_CLKOUT1_LOW_TIME     (CLKOUT3_REGS[5:0]),
  .CLKOUT3_CLKOUT1_PHASE_MUX    (CLKOUT3_REGS[15:13]),
  .CLKOUT3_CLKOUT2_DELAY_TIME   (CLKOUT3_REGS[21:16]),
  .CLKOUT3_CLKOUT2_EDGE         (CLKOUT3_REGS[23]),
  .CLKOUT3_CLKOUT2_NO_COUNT     (CLKOUT3_REGS[22]),
  // CLKOUT4
  .CLKOUT4_CLKOUT1_HIGH_TIME    (CLKOUT4_REGS[11:6]),
  .CLKOUT4_CLKOUT1_LOW_TIME     (CLKOUT4_REGS[5:0]),
  .CLKOUT4_CLKOUT1_PHASE_MUX    (CLKOUT4_REGS[15:13]),
  .CLKOUT4_CLKOUT2_DELAY_TIME   (CLKOUT4_REGS[21:16]),
  .CLKOUT4_CLKOUT2_EDGE         (CLKOUT4_REGS[23]),
  .CLKOUT4_CLKOUT2_NO_COUNT     (CLKOUT4_REGS[22]),
  // CLKOUT5
  .CLKOUT5_CLKOUT1_HIGH_TIME                (CLKOUT5_REGS[11:6]),
  .CLKOUT5_CLKOUT1_LOW_TIME                 (CLKOUT5_REGS[5:0]),
  .CLKOUT5_CLKOUT1_PHASE_MUX                (CLKOUT5_REGS[15:13]),
  .CLKOUT5_CLKOUT2_FRACTIONAL_DELAY_TIME    (CLKOUT5_REGS[21:16]),
  .CLKOUT5_CLKOUT2_FRACTIONAL_EDGE          (CLKOUT5_REGS[23]),
  .CLKOUT5_CLKOUT2_FRACTIONAL_NO_COUNT      (CLKOUT5_REGS[22]),
  .CLKOUT5_CLKOUT2_FRACTIONAL_PHASE_MUX_F   (CLKOUT5_REGS[29:27]),
  .CLKOUT5_CLKOUT2_FRACTIONAL_FRAC_WF_F     (CLKOUT5_REGS[26]),
  // CLKOUT6
  .CLKOUT6_CLKOUT1_HIGH_TIME                (CLKOUT6_REGS[11:6]),
  .CLKOUT6_CLKOUT1_LOW_TIME                 (CLKOUT6_REGS[5:0]),
  .CLKOUT6_CLKOUT1_PHASE_MUX                (CLKOUT6_REGS[15:13]),
  .CLKOUT6_CLKOUT2_FRACTIONAL_DELAY_TIME    (CLKOUT6_REGS[21:16]),
  .CLKOUT6_CLKOUT2_FRACTIONAL_EDGE          (CLKOUT6_REGS[23]),
  .CLKOUT6_CLKOUT2_FRACTIONAL_NO_COUNT      (CLKOUT6_REGS[22]),
  .CLKOUT6_CLKOUT2_FRACTIONAL_PHASE_MUX_F   (CLKOUT6_REGS[29:27]),
  .CLKOUT6_CLKOUT2_FRACTIONAL_FRAC_WF_F     (CLKOUT6_REGS[26]),
  // POWER_REG
  // FIXME: Check whether this is always thar same content. XAPP888 says that
  // "all the bits should be set when performing DRP". The values below has
  // been observed to be used by vendor tools in some circumstances.
  .POWER_REG ((CLKFBOUT_FRAC_EN || CLKOUT0_FRAC_EN || !CLKOUT0_PHASE_45) ? 16'b10011001_00000000 :
                                                                           16'b00000001_00000000),
  // Clock output enable controls
  .CLKFBOUT_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKFBOUT_ === 1'bX || _TECHMAP_CONSTVAL_CLKFBOUTB_ === 1'bX),
  .CLKOUT0_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT0_ === 1'bX || _TECHMAP_CONSTVAL_CLKOUT0B_ === 1'bX),
  .CLKOUT1_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT1_ === 1'bX || _TECHMAP_CONSTVAL_CLKOUT1B_ === 1'bX),
  .CLKOUT2_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT2_ === 1'bX || _TECHMAP_CONSTVAL_CLKOUT2B_ === 1'bX),
  .CLKOUT3_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT3_ === 1'bX || _TECHMAP_CONSTVAL_CLKOUT3B_ === 1'bX),
  .CLKOUT4_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT4_ === 1'bX),
  .CLKOUT5_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT5_ === 1'bX),
  .CLKOUT6_CLKOUT1_OUTPUT_ENABLE(_TECHMAP_CONSTVAL_CLKOUT6_ === 1'bX)
  )
  _TECHMAP_REPLACE_
  (
  .CLKFBIN      (CLKFBIN),
  .CLKIN1       (CLKIN1),
  .CLKIN2       (CLKIN2),
  .CLKINSEL     (clkinsel),
  .CLKFBOUT     (CLKFBOUT),
  .CLKFBOUTB    (CLKFBOUTB),
  .CLKOUT0      (CLKOUT0),
  .CLKOUT0B     (CLKOUT0B),
  .CLKOUT1      (CLKOUT1),
  .CLKOUT1B     (CLKOUT1B),
  .CLKOUT2      (CLKOUT2),
  .CLKOUT2B     (CLKOUT2B),
  .CLKOUT3      (CLKOUT3),
  .CLKOUT3B     (CLKOUT3B),
  .CLKOUT4      (CLKOUT4),
  .CLKOUT5      (CLKOUT5),
  .CLKOUT6      (CLKOUT6),
  .CLKINSTOPPED (CLKINSTOPPED),
  .CLKFBSTOPPED (CLKFBSTOPPED),
  .PWRDWN       (pwrdwn),
  .RST          (rst),
  .LOCKED       (LOCKED),
  .PSCLK        (psclk),
  .PSEN         (psen),
  .PSINCDEC     (psincdec),
  .PSDONE       (PSDONE),
  .DCLK         (dclk),
  .DEN          (den),
  .DWE          (dwe),
  .DRDY         (DRDY),
  .DADDR0       (DADDR[0]),
  .DADDR1       (DADDR[1]),
  .DADDR2       (DADDR[2]),
  .DADDR3       (DADDR[3]),
  .DADDR4       (DADDR[4]),
  .DADDR5       (DADDR[5]),
  .DADDR6       (DADDR[6]),
  .DI0          (DI[0]),
  .DI1          (DI[1]),
  .DI2          (DI[2]),
  .DI3          (DI[3]),
  .DI4          (DI[4]),
  .DI5          (DI[5]),
  .DI6          (DI[6]),
  .DI7          (DI[7]),
  .DI8          (DI[8]),
  .DI9          (DI[9]),
  .DI10         (DI[10]),
  .DI11         (DI[11]),
  .DI12         (DI[12]),
  .DI13         (DI[13]),
  .DI14         (DI[14]),
  .DI15         (DI[15]),
  .DO0          (DO[0]),
  .DO1          (DO[1]),
  .DO2          (DO[2]),
  .DO3          (DO[3]),
  .DO4          (DO[4]),
  .DO5          (DO[5]),
  .DO6          (DO[6]),
  .DO7          (DO[7]),
  .DO8          (DO[8]),
  .DO9          (DO[9]),
  .DO10         (DO[10]),
  .DO11         (DO[11]),
  .DO12         (DO[12]),
  .DO13         (DO[13]),
  .DO14         (DO[14]),
  .DO15         (DO[15])
  );
endmodule