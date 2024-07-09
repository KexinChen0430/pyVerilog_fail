module ddr3_s4_amphy_phy_alt_mem_phy_clk_reset (
                               pll_ref_clk,
                               global_reset_n,
                               soft_reset_n,
                               seq_rdp_reset_req_n,
                               seq_qdr_doff_req_n,
                               resync_clk_1x,
                               ac_clk_1x,
                               measure_clk_1x,
                               mem_clk_2x,
                               mem_clk,
                               mem_clk_n,
                               phy_clk_1x,
                               postamble_clk_2x,
                               resync_clk_2x,
                               cs_n_clk_1x,
                               write_clk_2x,
                               aux_clk,
                               scan_clk,
                               aux_scan_clk_reset_n,    // Connection New for 9.0
                               scan_clk_in,
                               scan_enable_ck,
                               scan_update,
                               scan_din,
                               reset_ac_clk_1x_n,
                               reset_measure_clk_1x_n,
                               reset_mem_clk_2x_n,
                               reset_phy_clk_1x_n,
                               reset_rdp_phy_clk_1x_n,
                               reset_resync_clk_1x_n,
                               reset_resync_clk_2x_n,
                               reset_write_clk_2x_n,
                               reset_cs_n_clk_1x_n,
                               mem_reset_n,
                               mem_doff_n,
                               reset_request_n, // new output
                               dqs_delay_ctrl,
                               dqs_delay_ctrl_import,
                               dqs_delay_update_en,
                               dlloffset_addnsub,
                               dlloffset_offset,
                               dlloffset_offsetctrl_out,
                               phs_shft_busy,
                               seq_pll_inc_dec_n,
                               seq_pll_select,
                               seq_pll_start_reconfig,
                               mimic_data_1x,
                               seq_clk_disable,
                               ctrl_clk_disable,
                               pll_reconfig_enable,       // Connection New for 9.0
                               pll_phasecounterselect,    // Connection New for 9.0
                               pll_phaseupdown,           // Connection New for 9.0
                               pll_phasestep,             // Connection New for 9.0
                               pll_phase_done             // Connection New for 9.0
                              ) /* synthesis altera_attribute=" SUPPRESS_DA_RULE_INTERNAL=\"R101,C104,C106\" ; AUTO_GLOBAL_REGISTER_CONTROLS=\"OFF\" "*/;
// Note the peculiar ranging below is necessary to use a generated CASE statement
// later in the code :
parameter AC_PHASE                     =      "MEM_CLK";
parameter CLOCK_INDEX_WIDTH            =              3;
parameter DDR_MIMIC_PATH_EN            =              1; // Only applicable for QDRII
parameter DLL_EXPORT_IMPORT            =         "NONE";
parameter LOCAL_IF_CLK_PS              =           4000;
parameter MEM_IF_CLK_PAIR_COUNT        =              3;
parameter MEM_IF_CLK_PS                =           4000;
parameter MEM_IF_CLK_PS_STR            =       "4000 ps";
parameter MEM_IF_DQ_PER_DQS            =              8;
parameter MEM_IF_DWIDTH                =             64;
parameter MEM_IF_DQS_WIDTH             =              8;
parameter MEM_IF_MEMTYPE               =          "DDR";
parameter LEVELLING                    =              1;
parameter READ_DESKEW_MODE             =         "NONE";
parameter WRITE_DESKEW_MODE            =         "NONE";
parameter MEM_IF_DQSN_EN               =              1;
parameter MIF_FILENAME                 =      "PLL.MIF";
parameter DWIDTH_RATIO                 =              4;
parameter PLL_EXPORT_IMPORT            =         "NONE";
parameter PLL_REF_CLK_PS               =           4000;
parameter PLL_TYPE                     =     "ENHANCED";
parameter SPEED_GRADE                  =           "C3";
parameter DLL_DELAY_BUFFER_MODE        =         "HIGH";
parameter DLL_DELAY_CHAIN_LENGTH       =              8;
parameter DQS_OUT_MODE                 = "DELAY_CHAIN2";
parameter DQS_PHASE                    =             72;
parameter SCAN_CLK_DIVIDE_BY           =              2;
parameter USE_MEM_CLK_FOR_ADDR_CMD_CLK =              1;
parameter DQS_DELAY_CTL_WIDTH          =              6;
parameter USE_DLL_OFFSET               =        "false";
parameter PLL_RECONFIG_PORTS_EN        =              0;
localparam RDP_RESET_PIPE_DEPTH = (MEM_IF_MEMTYPE == "QDRII") ? 1 : 3;
// Clock/reset inputs :
input                                                 global_reset_n;
input  wire                                           soft_reset_n;
input  wire                                           pll_ref_clk;
input  wire [MEM_IF_DQS_WIDTH - 1 : 0]                seq_rdp_reset_req_n;
input  wire                                           seq_qdr_doff_req_n;
input  wire [MEM_IF_DQS_WIDTH - 1 : 0]                resync_clk_1x; //NB. Input!
// Clock/reset outputs :
output                                                ac_clk_1x;
output                                                measure_clk_1x;
output                                                mem_clk_2x;
inout  [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                mem_clk;
inout  [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                mem_clk_n;
output                                                phy_clk_1x;
output                                                postamble_clk_2x;
output                                                resync_clk_2x;
output                                                cs_n_clk_1x;
output                                                write_clk_2x;
// The Aux clk shall be half-rate for full-rate mode and visa versa :
output                                                aux_clk;
output wire                                           reset_ac_clk_1x_n;
output wire                                           reset_measure_clk_1x_n;
output wire                                           reset_mem_clk_2x_n;
output reg                              	      reset_phy_clk_1x_n;
output wire [MEM_IF_DQS_WIDTH - 1 : 0]  	      reset_rdp_phy_clk_1x_n;
output wire [MEM_IF_DQS_WIDTH - 1 : 0]                reset_resync_clk_1x_n;
output wire                                           reset_resync_clk_2x_n;
output wire                                           reset_write_clk_2x_n;
output wire                                           reset_cs_n_clk_1x_n;
output wire                                           mem_reset_n;
output wire                                           mem_doff_n;
// This is the PLL locked signal :
output wire                                           reset_request_n;
// Misc I/O :
output wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]            dqs_delay_ctrl;
// For DDR3 only, when using an external DLL we need to import the code for the
// mem_clk output phase align block :
input  wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]            dqs_delay_ctrl_import;
output wire                                           dqs_delay_update_en;
// Note - although the DLL offset signals are present here, use of an offset when
// in "internal" DLL mode is unsupported (and would therefore prevent hardcopy migration).
// Customers requiring DLL offsets should use "external" DLL mode, as this is the
// supported flow :
input  wire                                           dlloffset_addnsub;        // Do not use
input  wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]            dlloffset_offset;         // Do not use
output wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]            dlloffset_offsetctrl_out; // Do not use
output wire                                           phs_shft_busy;
input  wire                                           seq_pll_inc_dec_n;
input  wire [CLOCK_INDEX_WIDTH - 1 : 0 ]              seq_pll_select;
input  wire                                           seq_pll_start_reconfig;
output wire                                           mimic_data_1x;
// Create the scan clock.  This is a divided-down version of the PLL reference clock.
// The scan chain will have an Fmax of around 100MHz, and so initially the scan clock is
// created by a divide-by 4 circuit to allow plenty of margin with the expected reference
// clock frequency of 100MHz.  This may be changed via the parameter.
output                                                scan_clk;
output                                                aux_scan_clk_reset_n;
localparam MEM_IF_STR_T9_DESKEW_EN                    = 0;
localparam MEM_IF_STR_T10_DESKEW_EN                   = 0;//uses_dekew_delay(MEM_IF_MEMTYPE, LEVELLING, WRITE_DESKEW_MODE);
input  wire                                           scan_clk_in;
input  wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]           scan_enable_ck;
input  wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]           scan_din;
input  wire                                           scan_update;
input wire                                            seq_clk_disable;
input wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]            ctrl_clk_disable;
// PLL reconfig interface.  Made available primarily for HardCopy customers :
input  wire         	                              pll_reconfig_enable;       // New for 9.0 - tie low if not required.
input  wire [3:0]        	                          pll_phasecounterselect;    // New for 9.0 - tie low if not required.
input  wire         	                              pll_phaseupdown;           // New for 9.0 - tie low if not required.
input  wire         	                              pll_phasestep;             // New for 9.0 - tie low if not required.
output wire         	                              pll_phase_done;            // New for 9.0
wire global_reset_n;
(* keep, altera_attribute = "-name global_signal  off" *) reg  scan_clk = 1'b0;
(* keep, altera_attribute = "-name global_signal dual_regional_clock" *) wire mem_clk_2x;
(* keep, altera_attribute = "-name global_signal        global_clock" *) wire phy_clk_1x;
wire aux_clk;
wire postamble_clk_2x;
(* keep, altera_attribute = "-name global_signal dual_regional_clock" *) wire resync_clk_2x;
(* keep, altera_attribute = "-name global_signal dual_regional_clock" *) wire write_clk_2x;
wire cs_n_clk_1x;
(* keep, altera_attribute = "-name global_signal dual_regional_clock" *) wire ac_clk_1x;
(* keep, altera_attribute = "-name global_signal dual_regional_clock" *) wire measure_clk_1x;
(* keep, altera_attribute = "-name global_signal                 off" *) wire phy_internal_reset_n;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                               mem_clk;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                               mem_clk_n;
reg [2:0]                                    divider  = 3'h0;
(*preserve*) reg                             seq_pll_start_reconfig_ams;
(*preserve*) reg                             seq_pll_start_reconfig_r;
(*preserve*) reg                             seq_pll_start_reconfig_2r;
(*preserve*) reg                             seq_pll_start_reconfig_3r;
reg                                          pll_new_dir;
reg [CLOCK_INDEX_WIDTH - 1 : 0 ]             pll_new_phase;
wire                                         pll_phase_auto_calibrate_pulse;
(*preserve*) reg                             pll_reprogram_request;
wire                                         pll_locked_src;
reg                                          pll_locked;
(*preserve*) reg                             pll_reprogram_request_pulse;   // 1 scan clk cycle long
(*preserve*) reg                             pll_reprogram_request_pulse_r;
(*preserve*) reg                             pll_reprogram_request_pulse_2r;
wire                                         pll_reprogram_request_long_pulse; // 3 scan clk cycles long
(*preserve*) reg                             reset_master_ams;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]         mem_clk_pdiff_in;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]         mem_clk_buf_in;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]         mem_clk_n_buf_in;
reg                                          phs_shft_busy_siii;
(*preserve*) reg [2:0]                       seq_pll_start_reconfig_ccd_pipe;
(*preserve*) reg                             seq_pll_inc_dec_ccd;
(*preserve*) reg [CLOCK_INDEX_WIDTH - 1 : 0] seq_pll_select_ccd ;
(*preserve*) reg                             global_pre_clear;
wire                                         global_or_soft_reset_n;
(*preserve*) reg                             clk_div_reset_ams_n   = 1'b0;
(*preserve*) reg                             clk_div_reset_ams_n_r = 1'b0;
(*preserve*) reg                             pll_reconfig_reset_ams_n   = 1'b0;
(*preserve*) reg                             pll_reconfig_reset_ams_n_r = 1'b0;
wire                                         clk_divider_reset_n;
wire                                         qdr_doff_req_n;
(* altera_attribute = "-name global_signal  off" *) wire [MEM_IF_DQS_WIDTH - 1 : 0]              rdp_reset_req_n;
wire                                         pll_reset;
wire                                         fb_clk;
wire                                         pll_reconfig_reset_n;
wire                                         master_reset_resync_clk_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              reset_resync_clk_1x_pre_clear;
wire                                         dll_offset_delay_ctrl_clk;
wire [DQS_DELAY_CTL_WIDTH - 1 : 0]           dll_offset_delay_code;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]         mem_clk_pdiff_in_delayed1;
wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]         mem_clk_pdiff_in_delayed2;
wire [`IOCONFIG_DQ_OUTPUT_DELAY_SETTING1_WIDTH-1:0] outputdelaysetting1[MEM_IF_CLK_PAIR_COUNT - 1 : 0];
wire [`IOCONFIG_DQ_OUTPUT_DELAY_SETTING2_WIDTH-1:0] outputdelaysetting2[MEM_IF_CLK_PAIR_COUNT - 1 : 0];
// Hc-x requires access to the PLL phase stepping inputs, therefore they are multiplexed :
reg [3:0] 				                     muxed_pll_phasecounterselect;
reg 	  				                     muxed_pll_phasestep;
reg 	  				                     muxed_pll_phaseupdown;
wire                                         pll_reconfig_enable_internal;
genvar dqs_group;
function integer uses_dekew_delay (input [31:0] mem_type,
                                   input levelling,
                                   input [31:0] mode);
begin
    if (((mem_type == "DDR3") || (mem_type == "ddr3")) && levelling == 1 && ((mode != "NONE") && (mode != "none")))
        uses_dekew_delay = 1;
    else
        uses_dekew_delay = 0;
end
endfunction
// Output the PLL locked signal to be used as a reset_request_n - IE. reset when the PLL loses
// lock :
assign reset_request_n = pll_locked;
// Reset the scanclk clock divider if we either have a global_reset or the PLL loses lock
assign pll_reconfig_reset_n = global_reset_n && pll_locked;
// Delayed and re-synchronised to scan clk, reset output for external PLL reconfiguration users :
assign aux_scan_clk_reset_n = pll_reconfig_reset_ams_n_r;
// Clock divider circuit reset generation.
always @(posedge phy_clk_1x or negedge pll_reconfig_reset_n)
begin
    if (pll_reconfig_reset_n == 1'b0)
    begin
        clk_div_reset_ams_n   <= 1'b0;
        clk_div_reset_ams_n_r <= 1'b0;
    end
    else
    begin
        clk_div_reset_ams_n   <= 1'b1;
        clk_div_reset_ams_n_r <= clk_div_reset_ams_n;
    end
end
// PLL reconfig and synchronisation circuit reset generation.
always @(posedge scan_clk or negedge pll_reconfig_reset_n)
begin
    if (pll_reconfig_reset_n == 1'b0)
    begin
        pll_reconfig_reset_ams_n   <= 1'b0;
        pll_reconfig_reset_ams_n_r <= 1'b0;
    end
    else
    begin
        pll_reconfig_reset_ams_n   <= 1'b1;
        pll_reconfig_reset_ams_n_r <= pll_reconfig_reset_ams_n;
    end
end
// Create the scan clock.  Used for PLL reconfiguring in this block.
// Clock divider reset is the direct output of the AMS flops :
assign clk_divider_reset_n = clk_div_reset_ams_n_r;
generate
    if (SCAN_CLK_DIVIDE_BY == 1)
    begin : no_scan_clk_divider
        always @(phy_clk_1x)
        begin
            scan_clk = phy_clk_1x;
        end
    end
    else
    begin : gen_scan_clk
        always @(posedge phy_clk_1x or negedge clk_divider_reset_n)
        begin
            if (clk_divider_reset_n == 1'b0)
            begin
                scan_clk <= 1'b0;
                divider      <= 3'h0;
            end
            else
            begin
                // This method of clock division does not require "divider" to be used
                // as an intermediate clock:
                if (divider == (SCAN_CLK_DIVIDE_BY / 2 - 1))
                begin
                    scan_clk <= ~scan_clk; // Toggle
                    divider  <= 3'h0;
                end
                else
                begin
                    scan_clk <= scan_clk; // Do not toggle
                    divider  <= divider + 3'h1;
                end
            end
        end
    end
endgenerate
// NB. This lookup_sii table shall be different for CIII/SIII
function [3:0] lookup_siii;
input [CLOCK_INDEX_WIDTH-1:0] seq_num;
begin
    casez (seq_num)
    4'b0000  : lookup_siii = 4'b0010; // Legal code
    4'b0001  : lookup_siii = 4'b0011; // Legal code
    4'b0010  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b0011  : lookup_siii = 4'b0101; // Legal code
    4'b0100  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b0101  : lookup_siii = 4'b0110; // Legal code
    4'b0110  : lookup_siii = 4'b1000; // Legal code
    4'b0111  : lookup_siii = 4'b0111; // Legal code
    4'b1000  : lookup_siii = 4'b0100; // Legal code
    4'b1001  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1010  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1011  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1100  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1101  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1110  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    4'b1111  : lookup_siii = 4'b1111; // illegal - return code 4'b1111
    default  : lookup_siii = 4'bxxxx; // X propagation
    endcase
end
endfunction
always @(posedge phy_clk_1x or negedge reset_phy_clk_1x_n)
begin
    if (reset_phy_clk_1x_n == 1'b0)
    begin
        seq_pll_inc_dec_ccd             <= 1'b0;
        seq_pll_select_ccd              <= {CLOCK_INDEX_WIDTH{1'b0}};
        seq_pll_start_reconfig_ccd_pipe <= 3'b000;
    end
    // Generate 'ccd' Cross Clock Domain signals :
    else
    begin
        seq_pll_start_reconfig_ccd_pipe <= {seq_pll_start_reconfig_ccd_pipe[1:0], seq_pll_start_reconfig};
        if (seq_pll_start_reconfig == 1'b1 && seq_pll_start_reconfig_ccd_pipe[0] == 1'b0)
        begin
            seq_pll_inc_dec_ccd <= seq_pll_inc_dec_n;
            seq_pll_select_ccd  <= seq_pll_select;
        end
    end
end
always @(posedge scan_clk or negedge pll_reconfig_reset_ams_n_r)
begin
    if (pll_reconfig_reset_ams_n_r == 1'b0)
    begin
        seq_pll_start_reconfig_ams     <= 1'b0;
        seq_pll_start_reconfig_r       <= 1'b0;
        seq_pll_start_reconfig_2r      <= 1'b0;
        seq_pll_start_reconfig_3r      <= 1'b0;
        pll_reprogram_request_pulse    <= 1'b0;
        pll_reprogram_request_pulse_r  <= 1'b0;
        pll_reprogram_request_pulse_2r <= 1'b0;
        pll_reprogram_request          <= 1'b0;
    end
    else
    begin
        seq_pll_start_reconfig_ams       <= seq_pll_start_reconfig_ccd_pipe[2];
        seq_pll_start_reconfig_r         <= seq_pll_start_reconfig_ams;
        seq_pll_start_reconfig_2r        <= seq_pll_start_reconfig_r;
        seq_pll_start_reconfig_3r        <= seq_pll_start_reconfig_2r;
        pll_reprogram_request_pulse      <= pll_phase_auto_calibrate_pulse;
        pll_reprogram_request_pulse_r    <= pll_reprogram_request_pulse;
        pll_reprogram_request_pulse_2r   <= pll_reprogram_request_pulse_r;
        pll_reprogram_request            <= pll_reprogram_request_long_pulse;
    end
end
// Rising-edge detect to generate a single phase shift step
assign pll_phase_auto_calibrate_pulse = ~seq_pll_start_reconfig_3r && seq_pll_start_reconfig_2r;
// extend the phase shift request pulse to be 3 scan clk cycles long.
assign pll_reprogram_request_long_pulse = pll_reprogram_request_pulse || pll_reprogram_request_pulse_r || pll_reprogram_request_pulse_2r;
// Register the Phase step settings
always @(posedge scan_clk or negedge pll_reconfig_reset_ams_n_r)
begin
    if (pll_reconfig_reset_ams_n_r == 1'b0)
    begin
        pll_new_dir   <= 1'b0;
        pll_new_phase <= 'h0;
    end
    else
    begin
        if (pll_phase_auto_calibrate_pulse)
        begin
            pll_new_dir   <= seq_pll_inc_dec_ccd;
            pll_new_phase <= seq_pll_select_ccd;
        end
    end
end
// generate the busy signal - just the inverse of the done o/p from the pll, and stretched ,
//as the initial pulse might not be long enough to be catched by the sequencer
//the same circuitry in the ciii clock and reset block
always @(posedge scan_clk or negedge pll_reconfig_reset_ams_n_r)
begin
    if (pll_reconfig_reset_ams_n_r == 1'b0)
        phs_shft_busy_siii <= 1'b0;
    else
        phs_shft_busy_siii <= pll_reprogram_request || ~pll_phase_done;
end
assign phs_shft_busy = phs_shft_busy_siii;
// Gate the soft reset input (from SOPC builder for example) with the PLL
// locked signal :
assign global_or_soft_reset_n  = soft_reset_n && global_reset_n;
// Create the PHY internal reset signal :
assign phy_internal_reset_n = pll_locked && global_or_soft_reset_n;
// The PLL resets only on a global reset :
assign pll_reset = !global_reset_n;
// If PLL reconfig ports are present, create the reconfig mux :
generate
    // Half-rate mode :
    if (PLL_RECONFIG_PORTS_EN == 1)
        assign pll_reconfig_enable_internal =  pll_reconfig_enable;
    else
        assign pll_reconfig_enable_internal =  1'b0;
endgenerate
always @*
begin
    if (pll_reconfig_enable_internal == 1'b0)
    begin
        muxed_pll_phasecounterselect = lookup_siii(pll_new_phase);
        muxed_pll_phasestep          = pll_reprogram_request;
        muxed_pll_phaseupdown        = pll_new_dir;
    end
    else
    begin
        muxed_pll_phasecounterselect = pll_phasecounterselect;
        muxed_pll_phasestep          = pll_phasestep;
        muxed_pll_phaseupdown        = pll_phaseupdown;
    end
end
generate
    // Half-rate mode :
    if (DWIDTH_RATIO == 4)
    begin : half_rate
        ddr3_s4_amphy_phy_alt_mem_phy_pll pll (
                     .inclk0             (pll_ref_clk),
             .areset             (pll_reset),
             .c0                 (phy_clk_1x),     // hR
             .c1                 (mem_clk_2x),     // FR
             .c2                 (aux_clk),        // FR
             .c3                 (write_clk_2x),   // FR
             .c4                 (resync_clk_2x),  // FR
             .c5                 (measure_clk_1x), // hR
             .c6                 (ac_clk_1x),      // hR
             .phasecounterselect (muxed_pll_phasecounterselect),
             .phasestep          (muxed_pll_phasestep),
             .phaseupdown        (muxed_pll_phaseupdown),
             .scanclk            (scan_clk),
             .locked             (pll_locked_src),
             .phasedone          (pll_phase_done)
         );
    end
    // Full-rate mode :
    else
    begin : full_rate
        ddr3_s4_amphy_phy_alt_mem_phy_pll pll (
                     .inclk0             (pll_ref_clk),
             .areset             (pll_reset),
             .c0                 (aux_clk),         // hR
             .c1                 (mem_clk_2x),      // FR
             .c2                 (phy_clk_1x),      // FR
             .c3                 (write_clk_2x),    // FR
             .c4                 (resync_clk_2x),   // FR
             .c5                 (measure_clk_1x),  // hR
             .c6                 (ac_clk_1x),       // hR
             .phasecounterselect (muxed_pll_phasecounterselect),
             .phasestep          (muxed_pll_phasestep),
             .phaseupdown        (muxed_pll_phaseupdown),
             .scanclk            (scan_clk),
             .locked             (pll_locked_src),
             .phasedone          (pll_phase_done)
         );
    end
endgenerate
//synopsys translate_off
reg [19:0] pll_locked_chain  = 20'h0;
always @(posedge pll_ref_clk)
begin
    pll_locked_chain <= {pll_locked_chain[18:0],pll_locked_src};
end
//synopsys translate_on
always @*
begin
 pll_locked = pll_locked_src;
//synopsys translate_off
 pll_locked = pll_locked_chain[19];
//synopsys translate_on
end
assign cs_n_clk_1x = ac_clk_1x;
// The postamble clock is the inverse of the resync clock
assign postamble_clk_2x = ~resync_clk_2x;
generate
genvar clk_pair;
    for (clk_pair = 0 ; clk_pair < MEM_IF_CLK_PAIR_COUNT; clk_pair = clk_pair + 1)
    begin : DDR_CLK_OUT
        // For DDR/DDR2 use DDIO :
        if (MEM_IF_MEMTYPE == "DDR" || MEM_IF_MEMTYPE == "DDR2" || MEM_IF_MEMTYPE == "QDRII" || (MEM_IF_MEMTYPE == "DDR3" && LEVELLING == 0))
        begin : ddio_memclk_gen
            stratixiii_ddio_out # (
                .half_rate_mode("false"),
                .use_new_clocking_model("true")
            ) mem_clk_ddio (
                .datainlo        (1'b0),
                .datainhi        (~seq_clk_disable && ~ctrl_clk_disable[clk_pair]),
                .clkhi           (mem_clk_2x),
                .clklo           (mem_clk_2x),
                .muxsel          (mem_clk_2x),
                .clk             (),
                .ena             (1'b1),
                .areset          (1'b0),
                .sreset          (1'b0),
                .dataout         (mem_clk_pdiff_in[clk_pair]),
                .dfflo           (),
                .dffhi           (),
                .devpor          (),
                .devclrn         ()
            );
        end
        // For DDR3 use a phase align atom :
        else
        begin : phase_align_memclk_gen
            wire ck_h;
            wire ck_l;
            wire ck_n_h;
            wire ck_n_l;
            stratixiii_ddio_out # (
                .half_rate_mode("true"),
                .use_new_clocking_model("true")
            ) mem_clk_hr_ddio_h(
                .datainhi (~seq_clk_disable && ~ctrl_clk_disable[clk_pair]),
                .datainlo (~seq_clk_disable && ~ctrl_clk_disable[clk_pair]),
                .clkhi    (phy_clk_1x),
                .clklo    (phy_clk_1x),
                .muxsel   (phy_clk_1x),
                .ena      (1'b1),
                .areset   (1'b0),
                .sreset   (1'b0),
                // synopsys translate_off
                .dfflo(),
                .dffhi(),
                .clk(),
                // synopsys translate_on
                .dataout (ck_h),
                .devclrn(),
                .devpor()
            );
            stratixiii_ddio_out # (
                .half_rate_mode("true"),
                .use_new_clocking_model("true")
            ) mem_clk_hr_ddio_l(
                .datainhi (1'b0),
                .datainlo (1'b0),
                .clkhi    (phy_clk_1x),
                .clklo    (phy_clk_1x),
                .muxsel   (phy_clk_1x),
                .ena      (1'b1),
                .areset   (1'b0),
                .sreset   (1'b0),
                // synopsys translate_off
                .dfflo(),
                .dffhi(),
                .clk(),
                // synopsys translate_on
                .dataout (ck_l),
                .devclrn(),
                .devpor()
            );
            // Note : delay_buffer_mode for output_phase_alignment atoms must always
            // be tied to "high" :
            stratixiii_output_phase_alignment # (
                .operation_mode                  ("ddio_out"),
                .use_phasectrlin                 ("false"),
                .phase_setting                   (2),
                .delay_buffer_mode               ("high"),
                .power_up                        ("low"),
                .async_mode                      ("clear"),
                .sync_mode                       ("none"),
                .add_output_cycle_delay          ("false"),
                .use_delayed_clock               ("false"),
                .phase_setting_for_delayed_clock (2),
                .add_phase_transfer_reg          ("true"),
                .use_phasectrl_clock             ("false"),
                .invert_phase                    ("false"),
                .use_primary_clock               ("true"),
                .bypass_input_register           ("false")
            ) mem_clk_opa (
                .datain                 ({ck_h, ck_l}),
                .clk                    (write_clk_2x),
                .delayctrlin            ((DLL_EXPORT_IMPORT == "IMPORT") ? dqs_delay_ctrl_import : dqs_delay_ctrl),
                .areset                 (1'b0),
                .sreset                 (1'b0),
                .clkena                 (1'b1),
                .phaseinvertctrl        (),
                .enaphasetransferreg    (),
                .enaoutputcycledelay    (),
                .phasectrlin            (),
                // synopsys translate_off
                .devclrn(), .devpor(),
                .dffin(), .dff1t(), .dffddiodataout(),
                // synopsys translate_on
                .dataout                (mem_clk_pdiff_in[clk_pair])
            );
        end
        if (MEM_IF_STR_T9_DESKEW_EN == 1)
        begin : gen_T9
            stratixiii_delay_chain  o_pa_dc1(
                .datain             (mem_clk_pdiff_in[clk_pair]),
                .delayctrlin        (outputdelaysetting1[clk_pair]),
                // synopsys translate_off
                .devclrn(), .devpor(),
                // synopsys translate_on
               .dataout             (mem_clk_pdiff_in_delayed1[clk_pair])
            );
        end
        else
        begin : gen_no_T9
            assign mem_clk_pdiff_in_delayed1[clk_pair] = mem_clk_pdiff_in[clk_pair];
        end
        if (MEM_IF_STR_T10_DESKEW_EN == 1)
        begin : gen_T10_dqs_deskew
            stratixiii_delay_chain  o_pa_dc2(
                .datain             (mem_clk_pdiff_in_delayed1[clk_pair]),
                .delayctrlin        ({1'b0, outputdelaysetting2[clk_pair]}),
                // synopsys translate_off
                .devclrn(), .devpor(),
                // synopsys translate_on
               .dataout             (mem_clk_pdiff_in_delayed2[clk_pair])
            );
        end
        else
        begin : gen_no_T10
            assign mem_clk_pdiff_in_delayed2[clk_pair] = mem_clk_pdiff_in_delayed1[clk_pair];
        end
        // Pseudo-diff used to ensure fanout of 1 from OPA/DDIO_OUT atoms :
        stratixiii_pseudo_diff_out mem_clk_pdiff (
             .i    (mem_clk_pdiff_in_delayed2[clk_pair]),
             .o    (  mem_clk_buf_in[clk_pair]),
             .obar (mem_clk_n_buf_in[clk_pair])
         );
        // The same output buf is for both DDR2 and 3 :
        stratixiii_io_obuf # (
            .bus_hold("false"),
            .open_drain_output("false"),
            .shift_series_termination_control("false")
        ) mem_clk_obuf (
            .i                         (mem_clk_buf_in[clk_pair]),
            .oe                        (1'b1),
            .dynamicterminationcontrol (1'b0),
            // synopsys translate_off
            .seriesterminationcontrol(),
            .parallelterminationcontrol(),
            .obar(),
            // synopsys translate_on
            .o(mem_clk[clk_pair]),
            .devoe()
        );
        // The same output buf is used
        stratixiii_io_obuf # (
            .bus_hold("false"),
            .open_drain_output("false"),
            .shift_series_termination_control("false")
        ) mem_clk_n_obuf (
            .i                         (mem_clk_n_buf_in[clk_pair]),
            .oe                        (1'b1),
            .dynamicterminationcontrol (1'b0),
            // synopsys translate_off
            .seriesterminationcontrol(),
            .parallelterminationcontrol(),
            .obar(),
            // synopsys translate_on
            .o(mem_clk_n[clk_pair]),
            .devoe()
        );
        // IO CONFIG.
        stratixiii_io_config io_config(
            .datain(scan_din[clk_pair]),
            .clk(scan_clk_in),
            .ena(scan_enable_ck[clk_pair]),
            .update(scan_update),
            // synopsys translate_off
            .devclrn(), .devpor(),
            .dutycycledelaymode(),
            .dutycycledelaysettings(),
            .outputfinedelaysetting1(),
            .outputfinedelaysetting2(),
            .outputonlydelaysetting2(),
            .outputonlyfinedelaysetting2(),
            .padtoinputregisterfinedelaysetting(),
            // synopsys translate_on
            .padtoinputregisterdelaysetting(),
            .outputdelaysetting1(outputdelaysetting1[clk_pair]),
            .outputdelaysetting2(outputdelaysetting2[clk_pair]),
            .dataout()
        );
    end //for
endgenerate
// Mimic path - connect an input buffer to the pad.  Choose mem_clk[0] as
// this shall always be implemented :
generate
    // Mimic clock generation should be differential or single-ended dependant upon DQS usage :
    if (MEM_IF_MEMTYPE == "QDRII" || MEM_IF_MEMTYPE == "DDR" || (MEM_IF_MEMTYPE == "DDR2" && (MEM_IF_DQSN_EN == 0)) )
    begin : gen_mimic_se_ibuf
        stratixiii_io_ibuf fb_clk_ibuf(
            .i      (mem_clk[0]),
            // synopsys translate_off
            .ibar(),
            .dynamicterminationcontrol(),
            // synopsys translate_on
            .o      (fb_clk)
        );
    end
    // For DDR3 and DDR2 with DQSN, use a differential I/O :
    else
    begin : gen_mimic_diff_ibuf
        stratixiii_io_ibuf fb_clk_ibuf(
            .i      (mem_clk[0]),
            .ibar   (mem_clk_n[0]),
            // synopsys translate_off
            .dynamicterminationcontrol(),
            // synopsys translate_on
            .o      (fb_clk)
        );
    end
endgenerate
// DDR2 Mimic Path Generation - in effect this is just a register :
stratixiii_ddio_in ddio_mimic(
    .datain     (fb_clk),
    .clk        (measure_clk_1x),
    .clkn       (),
    // synopsys translate_off
    .devclrn(),
    .devpor(),
   // synopsys translate_on
    .ena        (1'b1),
    .areset     (1'b0),
    .sreset     (1'b0),
    .regoutlo   (),
    .regouthi   (mimic_data_1x),
    .dfflo      ()
);
generate
    if (DLL_EXPORT_IMPORT != "IMPORT")
    begin
        // Note : delay_buffer_mode for the dll atoms may be either 'high' or 'low', so it is
        // correct to propagate the DLL_DELAY_BUFFER_MODE parameter here :
        stratixiii_dll # (
            .input_frequency                 (MEM_IF_CLK_PS_STR),
            .delay_buffer_mode               (DLL_DELAY_BUFFER_MODE),
            .delay_chain_length              (DLL_DELAY_CHAIN_LENGTH),
            .delayctrlout_mode               ("normal"),
            .jitter_reduction                ("true"),
            .sim_valid_lock                  (1280),
            .sim_low_buffer_intrinsic_delay  (350),
            .sim_high_buffer_intrinsic_delay (175),
            .sim_buffer_delay_increment      (10),
            .static_delay_ctrl               (0),
            .lpm_type                        ("stratixiii_dll")
        ) dll(
            .clk                    (mem_clk_2x),
            .aload                  (~pll_locked),
            .delayctrlout           (dqs_delay_ctrl),
            .upndnout               (),
            .dqsupdate              (dqs_delay_update_en),
            .offsetdelayctrlclkout  (dll_offset_delay_ctrl_clk),
            .offsetdelayctrlout     (dll_offset_delay_code),
            .devpor                 (),
            .devclrn                (),
            .upndninclkena          (),
            .upndnin                ()
        );
    end
endgenerate
generate
    if (USE_DLL_OFFSET =="true" || USE_DLL_OFFSET == "TRUE")
        stratixiii_dll_offset_ctrl # (
            .use_offset        (USE_DLL_OFFSET),
            .static_offset     ("0"),
            .delay_buffer_mode (DLL_DELAY_BUFFER_MODE)
        ) dll_phs_offset (
            .clk                (dll_offset_delay_ctrl_clk),
            .aload              (~pll_locked),
            .offsetdelayctrlin  (dll_offset_delay_code),
            .offset             (dlloffset_offset),
            .addnsub            (dlloffset_addnsub),
            .devclrn            (),
            .devpor             (),
            .offsettestout      (),
            .offsetctrlout      (dlloffset_offsetctrl_out)
        );
     else
        assign dlloffset_offsetctrl_out = 6'b000000;
endgenerate
// Master reset generation :
always @(posedge phy_clk_1x or negedge phy_internal_reset_n)
begin
    if (phy_internal_reset_n == 1'b0)
    begin
        reset_master_ams <= 1'b0;
        global_pre_clear <= 1'b0;
    end
    else
    begin
        reset_master_ams <= 1'b1;
        global_pre_clear <= reset_master_ams;
    end
end
// phy_clk reset generation :
always @(posedge phy_clk_1x or negedge global_pre_clear)
begin
    if (global_pre_clear == 1'b0)
    begin
        reset_phy_clk_1x_n <= 1'b0;
    end
    else
    begin
        reset_phy_clk_1x_n <= global_pre_clear;
    end
end
generate
    for (dqs_group = 0 ; dqs_group < MEM_IF_DQS_WIDTH; dqs_group = dqs_group + 1)
    begin : RESET_RDP_BUS
        assign rdp_reset_req_n[dqs_group] = seq_rdp_reset_req_n[dqs_group] && global_pre_clear ;
        // phy_clk reset generation for read datapaths :
        ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (RDP_RESET_PIPE_DEPTH) ) reset_rdp_phy_clk_pipe(
                     .clock     (phy_clk_1x),
             .pre_clear (rdp_reset_req_n[dqs_group]),
             .reset_out (reset_rdp_phy_clk_1x_n[dqs_group])
        );
    end
endgenerate
// NB. phy_clk reset is generated above.
// Instantiate the reset pipes.  The 4 reset signals below are family invariant
// whilst the other resets are generated on a per-family basis :
// mem_clk reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) )  mem_pipe(
     .clock     (mem_clk_2x),
     .pre_clear (global_pre_clear),
     .reset_out (mem_reset_n)
);
// mem_clk_2x reset generation - required for SIII DDR/DDR2 support :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (4) ) mem_clk_pipe(
    .clock     (mem_clk_2x),
    .pre_clear (global_pre_clear),
    .reset_out (reset_mem_clk_2x_n)
);
// write_clk_2x reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (4) )   write_clk_pipe(
      .clock     (write_clk_2x),
      .pre_clear (global_pre_clear),
      .reset_out (reset_write_clk_2x_n)
);
// ac_clk_1x reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) )   ac_clk_pipe_1x(
     .clock     (ac_clk_1x),
     .pre_clear (global_pre_clear),
     .reset_out (reset_ac_clk_1x_n)
);
// cs_clk_2x reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (4) ) cs_n_clk_pipe_1x(
      .clock     (cs_n_clk_1x),
      .pre_clear (global_pre_clear),
      .reset_out (reset_cs_n_clk_1x_n)
);
// measure_clk_1x reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) ) measure_clk_pipe(
      .clock     (measure_clk_1x),
      .pre_clear (global_pre_clear),
      .reset_out (reset_measure_clk_1x_n)
);
// resync_clk_2x reset generation :
ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (RDP_RESET_PIPE_DEPTH) ) resync_clk_2x_pipe(
      .clock     (resync_clk_2x),
      .pre_clear (rdp_reset_req_n[0]),
      .reset_out (reset_resync_clk_2x_n)
);
generate
    if (MEM_IF_MEMTYPE == "QDRII")
    begin : qdr_doff_pipe_gen
        assign qdr_doff_req_n = seq_qdr_doff_req_n && global_pre_clear ;
        ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) ) qdr_doff_pipe(
                    .clock     (mem_clk_2x),
            .pre_clear (qdr_doff_req_n),
            .reset_out (mem_doff_n)
        );
    end
    else
    begin
        assign mem_doff_n = 1'b0;
    end
endgenerate
generate
    for (dqs_group = 0 ; dqs_group < 1; dqs_group = dqs_group + 1)
    begin : reset_resync_clk_pipe
        ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) ) resync_clk_pipe_1x(
                     .clock     (resync_clk_1x[0]),
             .pre_clear (rdp_reset_req_n[0]),
             .reset_out (master_reset_resync_clk_1x)
        );
    end
endgenerate
// QDRII requires individual control of each DQS group reset, whilst DDR3 requires all groups to be synchronised to reset[0] :
assign reset_resync_clk_1x_pre_clear = (MEM_IF_MEMTYPE == "QDRII") ? rdp_reset_req_n : {MEM_IF_DQS_WIDTH{master_reset_resync_clk_1x}} ;
// resync_clk_1x reset generation.  Note that the pre_clear is connected to the
// local read data path reset request signal, as these shall be reset when the
// sequencer requests :
generate
    for (dqs_group = 0 ; dqs_group < MEM_IF_DQS_WIDTH; dqs_group = dqs_group + 1)
    begin : slave_reset_resync_clk_pipe
        ddr3_s4_amphy_phy_alt_mem_phy_reset_pipe # (.PIPE_DEPTH (2) ) slave_resync_clk_pipe_1x(
                     .clock     (resync_clk_1x[dqs_group]), // Choose one resync_clk from which to generate reset
             .pre_clear (reset_resync_clk_1x_pre_clear[dqs_group]),
             .reset_out (reset_resync_clk_1x_n[dqs_group])
        );
    end
endgenerate
endmodule