module detects the external clock input and automatically switches over
when it is stable.
          clk_10mhz_int      clk_10mhz_ext
                |                  |
                |                  +---> counter --> threshold/hyst.
                |                  |                        |
                V                  V                        |
           DCM_CLKGEN         DCM_CLKGEN                    |
                |                  |                        |
          clk_250mhz_int     clk_250mhz_ext                 |
                |                  |                        |
    Logic  <----+                  |                        |
    DDR2        |                  |                        |
              __V__________________V__                      |
              \______________________/ <--------------------+
                         |
                         |
                         V
                ,-------PLL--------,
                |                  |
           clk_250mhz          clk_10mhz
                |                  |
                V                  V
          DSP, DDS, DAC         REF out
*/
// clocks
wire clk_10mhz_int_ibufg;
wire clk_10mhz_int_bufg;
wire clk_10mhz_ext_ibufg;
wire clk_10mhz_ext_bufg;
wire clk_250mhz_int_dcm;
wire clk_250mhz_ext_dcm;
wire clk_250mhz_ext;
wire clk_250mhz_to_pll;
wire clk_250mhz_pll;
wire clk_10mhz_pll;
// pll connections
wire pll_clkfb;
wire pll_reset;
wire pll_locked;
// resets
wire rst_10mhz_int;
wire rst_10mhz_ext;
wire rst_250mhz_ext;
// clock management
wire clk_250mhz_int_dcm_reset;
wire clk_250mhz_int_dcm_locked;
wire [7:0] clk_250mhz_int_dcm_status;
wire clk_250mhz_int_dcm_clkfx_stopped = clk_250mhz_int_dcm_status[1];
wire clk_250mhz_ext_dcm_reset;
wire clk_250mhz_ext_dcm_locked;
wire [7:0] clk_250mhz_ext_dcm_status;
wire clk_250mhz_ext_dcm_clkfx_stopped = clk_250mhz_ext_dcm_status[1];
wire ref_freq_valid;
wire clk_out_select;
assign ext_clock_selected = clk_out_select;
reg reset_output = 0;
// reset logic
// 10mhz_int clock domain reset
reset_stretch #(.N(4)) rst_10mhz_int_inst (
    .clk(clk_10mhz_int_bufg),
    .rst_in(reset_in),
    .rst_out(rst_10mhz_int)
);
// 10mhz_ext clock domain reset
reset_stretch #(.N(4)) rst_10mhz_ext_inst (
    .clk(clk_10mhz_ext_bufg),
    .rst_in(reset_in | ~ref_freq_valid),
    .rst_out(rst_10mhz_ext)
);
// 250mhz_int clock domain reset
reset_stretch #(.N(4)) rst_250mhz_int_inst (
    .clk(clk_250mhz_int),
    .rst_in(rst_10mhz_int | ~clk_250mhz_int_dcm_locked | clk_250mhz_int_dcm_clkfx_stopped),
    .rst_out(rst_250mhz_int)
);
reset_stretch #(.N(3)) rst_250mhz_int_dcm_inst (
    .clk(clk_10mhz_int_bufg),
    .rst_in(rst_10mhz_int | (~clk_250mhz_int_dcm_locked & clk_250mhz_int_dcm_clkfx_stopped) | clk_250mhz_int_dcm_clkfx_stopped),
    .rst_out(clk_250mhz_int_dcm_reset)
);
// 250mhz_ext clock domain reset
reset_stretch #(.N(4)) rst_250mhz_ext_inst (
    .clk(clk_250mhz_ext),
    .rst_in(rst_10mhz_ext | ~clk_250mhz_ext_dcm_locked | clk_250mhz_ext_dcm_clkfx_stopped),
    .rst_out(rst_250mhz_ext)
);
reset_stretch #(.N(3)) rst_250mhz_ext_dcm_inst (
    .clk(clk_10mhz_ext_bufg),
    .rst_in(rst_10mhz_ext | (~clk_250mhz_ext_dcm_locked & clk_250mhz_ext_dcm_clkfx_stopped) | clk_250mhz_ext_dcm_clkfx_stopped),
    .rst_out(clk_250mhz_ext_dcm_reset)
);
// PLL reset
reset_stretch #(.N(4)) rst_pll_inst (
    .clk(clk_250mhz_to_pll),
    .rst_in((clk_out_select ? rst_250mhz_ext : rst_250mhz_int) | reset_output),
    .rst_out(pll_reset)
);
// 250mhz_out clock domain reset
reset_stretch #(.N(4)) rst_250mhz_inst (
    .clk(clk_250mhz),
    .rst_in(pll_reset | ~pll_locked),
    .rst_out(rst_250mhz)
);
// 10mhz_out clock domain reset
reset_stretch #(.N(4)) rst_10mhz_inst (
    .clk(clk_10mhz),
    .rst_in(pll_reset | ~pll_locked),
    .rst_out(rst_10mhz)
);
// Source switching logic
reg ref_clk_src_reg = 0;
reg [2:0] ref_clk_sync_reg = 0;
reg ref_clk_reg = 0;
reg ref_clk_last_reg = 0;
reg [7:0] ref_freq_gate_count_reg = 0;
reg ref_freq_gate_reg = 0;
reg [7:0] ref_freq_count_reg = 0;
reg [6:0] ref_freq_valid_count_reg = 0;
reg ref_freq_valid_reg = 0;
reg ref_freq_window1_reg = 0;
reg ref_freq_window2_reg = 0;
assign ref_freq_valid = ref_freq_valid_reg;
reg clk_out_select_reg = 0;
assign clk_out_select = clk_out_select_reg;
always @(posedge clk_10mhz_ext_bufg) begin
    ref_clk_src_reg <= ~ref_clk_src_reg;
end
always @(posedge clk_250mhz_int) begin
    ref_clk_sync_reg <= {ref_clk_sync_reg[1:0], ref_clk_src_reg};
end
always @(posedge clk_250mhz_int or posedge rst_250mhz_int) begin
    if (rst_250mhz_int) begin
        // reset
        ref_clk_reg <= 0;
        ref_clk_last_reg <= 0;
        ref_freq_gate_reg <= 0;
        ref_freq_gate_count_reg <= 0;
        ref_freq_count_reg <= 0;
        ref_freq_valid_count_reg <= 0;
        ref_freq_valid_reg <= 0;
        ref_freq_window1_reg <= 0;
        ref_freq_window2_reg <= 0;
        reset_output <= 0;
    end else begin
        ref_clk_reg <= ref_clk_sync_reg[2];
        ref_clk_last_reg <= ref_clk_reg;
        ref_freq_gate_count_reg <= ref_freq_gate_count_reg + 1;
        ref_freq_gate_reg <= (ref_freq_gate_count_reg == 0);
        // measure edge rate of reference signal
        // count edges
        if (ref_clk_reg ^ ref_clk_last_reg) begin
            ref_freq_count_reg <= ref_freq_count_reg + 1;
        end
        // 10 MHz should be 10.24 cycles, allow one cycle window
        // 4 us (250 MHz) * 256 (gate) / 100 us (10 MHz) = 10.24 cycles
        // add some hysteresis
        ref_freq_window1_reg <= (ref_freq_count_reg >= 10 & ref_freq_count_reg <= 11);
        ref_freq_window2_reg <= (ref_freq_count_reg >= 9 & ref_freq_count_reg <= 12);
        // gate every 256 cycles and check edge count
        if (ref_freq_gate_reg) begin
            ref_freq_count_reg <= 0;
            if (ref_freq_window1_reg) begin
                if (&ref_freq_valid_count_reg) begin
                    ref_freq_valid_reg <= 1;
                end else begin
                    ref_freq_valid_count_reg <= ref_freq_valid_count_reg + 1;
                end
            end else if (!ref_freq_window2_reg) begin
                if (ref_freq_valid_count_reg > 0) begin
                    ref_freq_valid_count_reg <= ref_freq_valid_count_reg - 1;
                end else begin
                    ref_freq_valid_reg <= 0;
                end
            end
        end
        reset_output <= 0;
        if (rst_250mhz_ext) begin
            // external clock DCM is not ready, do not use it
            clk_out_select_reg <= 0;
            reset_output <= clk_out_select_reg;
        end else begin
            // external clock DCM is ready and valid, switch to it
            if (ref_freq_valid_reg) begin
                clk_out_select_reg <= 1;
                reset_output <= ~clk_out_select_reg;
            end
        end
    end
end
// clock management components
// input clock buffers
IBUFG
clk_10mhz_int_ibufg_inst
(
    .I(clk_10mhz_int),
    .O(clk_10mhz_int_ibufg)
);
BUFG
clk_10mhz_int_bufg_inst
(
    .I(clk_10mhz_int_ibufg),
    .O(clk_10mhz_int_bufg)
);
IBUFG
clk_10mhz_ext_ibufg_inst
(
    .I(clk_10mhz_ext),
    .O(clk_10mhz_ext_ibufg)
);
BUFG
clk_10mhz_ext_bufg_inst
(
    .I(clk_10mhz_ext_ibufg),
    .O(clk_10mhz_ext_bufg)
);
// DCMs to convert input clocks to 250 MHz
DCM_CLKGEN #
(
    .CLKFXDV_DIVIDE        (2),
    .CLKFX_DIVIDE          (1),
    .CLKFX_MULTIPLY        (25),
    .SPREAD_SPECTRUM       ("NONE"),
    .STARTUP_WAIT          ("FALSE"),
    .CLKIN_PERIOD          (100.0),
    .CLKFX_MD_MAX          (0.000)
)
clk_10mhz_int_dcm_clkgen_inst
(
    .CLKIN                 (clk_10mhz_int_ibufg),
    .CLKFX                 (clk_250mhz_int_dcm),
    .CLKFX180              (),
    .CLKFXDV               (),
    .PROGCLK               (1'b0),
    .PROGDATA              (1'b0),
    .PROGEN                (1'b0),
    .PROGDONE              (),
    .FREEZEDCM             (1'b0),
    .LOCKED                (clk_250mhz_int_dcm_locked),
    .STATUS                (clk_250mhz_int_dcm_status),
    .RST                   (clk_250mhz_int_dcm_reset)
);
DCM_CLKGEN #
(
    .CLKFXDV_DIVIDE        (2),
    .CLKFX_DIVIDE          (1),
    .CLKFX_MULTIPLY        (25),
    .SPREAD_SPECTRUM       ("NONE"),
    .STARTUP_WAIT          ("FALSE"),
    .CLKIN_PERIOD          (100.0),
    .CLKFX_MD_MAX          (0.000)
)
clk_10mhz_ext_dcm_clkgen_inst
(
    .CLKIN                 (clk_10mhz_ext_ibufg),
    .CLKFX                 (clk_250mhz_ext_dcm),
    .CLKFX180              (),
    .CLKFXDV               (),
    .PROGCLK               (1'b0),
    .PROGDATA              (1'b0),
    .PROGEN                (1'b0),
    .PROGDONE              (),
    .FREEZEDCM             (1'b0),
    .LOCKED                (clk_250mhz_ext_dcm_locked),
    .STATUS                (clk_250mhz_ext_dcm_status),
    .RST                   (clk_250mhz_ext_dcm_reset)
);
// Buffers for 250 MHz internal clock
BUFG
clk_250mhz_int_bufg_inst
(
    .I(clk_250mhz_int_dcm),
    .O(clk_250mhz_int)
);
BUFG
clk_250mhz_ext_bufg_inst
(
    .I(clk_250mhz_ext_dcm),
    .O(clk_250mhz_ext)
);
// Clock mux for reference selection
BUFGMUX #
(
    .CLK_SEL_TYPE("ASYNC")
)
clk_250mhz_bufgmux_inst
(
    .I0(clk_250mhz_int_dcm),
    .I1(clk_250mhz_ext_dcm),
    .S(clk_out_select),
    .O(clk_250mhz_to_pll)
);
// PLL for jitter attenuation and 10 MHz output generation
PLL_ADV #
(
    .BANDWIDTH          ("LOW"),
    .CLKIN1_PERIOD      (4.0),
    .CLKIN2_PERIOD      (4.0),
    .CLKOUT0_DIVIDE     (2),
    .CLKOUT1_DIVIDE     (50),
    .CLKOUT2_DIVIDE     (1),
    .CLKOUT3_DIVIDE     (1),
    .CLKOUT4_DIVIDE     (1),
    .CLKOUT5_DIVIDE     (1),
    .CLKOUT0_PHASE      (0.000),
    .CLKOUT1_PHASE      (0.000),
    .CLKOUT2_PHASE      (0.000),
    .CLKOUT3_PHASE      (0.000),
    .CLKOUT4_PHASE      (0.000),
    .CLKOUT5_PHASE      (0.000),
    .CLKOUT0_DUTY_CYCLE (0.500),
    .CLKOUT1_DUTY_CYCLE (0.500),
    .CLKOUT2_DUTY_CYCLE (0.500),
    .CLKOUT3_DUTY_CYCLE (0.500),
    .CLKOUT4_DUTY_CYCLE (0.500),
    .CLKOUT5_DUTY_CYCLE (0.500),
    .SIM_DEVICE         ("SPARTAN6"),
    .COMPENSATION       ("DCM2PLL"),
    .DIVCLK_DIVIDE      (1),
    .CLKFBOUT_MULT      (2),
    .CLKFBOUT_PHASE     (0.0),
    .REF_JITTER         (0.025000)
)
clk_250mhz_pll_inst
(
    .CLKFBIN     (pll_clkfb),
    .CLKINSEL    (1'b1),
    .CLKIN1      (clk_250mhz_to_pll),
    .CLKIN2      (1'b0),
    .DADDR       (5'b0),
    .DCLK        (1'b0),
    .DEN         (1'b0),
    .DI          (16'b0),
    .DWE         (1'b0),
    .REL         (1'b0),
    .RST         (pll_reset),
    .CLKFBDCM    (),
    .CLKFBOUT    (pll_clkfb),
    .CLKOUTDCM0  (),
    .CLKOUTDCM1  (),
    .CLKOUTDCM2  (),
    .CLKOUTDCM3  (),
    .CLKOUTDCM4  (),
    .CLKOUTDCM5  (),
    .CLKOUT0     (clk_250mhz_pll),
    .CLKOUT1     (clk_10mhz_pll),
    .CLKOUT2     (),
    .CLKOUT3     (),
    .CLKOUT4     (),
    .CLKOUT5     (),
    .DO          (),
    .DRDY        (),
    .LOCKED      (pll_locked)
);
BUFGCE
clk_250mhz_bufg_inst
(
    .I(clk_250mhz_pll),
    .O(clk_250mhz),
    .CE(pll_locked)
);
BUFGCE
clk_10mhz_bufg_inst
(
    .I(clk_10mhz_pll),
    .O(clk_10mhz),
    .CE(pll_locked)
);
endmodule