module ddr3_int_phy_alt_mem_phy (
                        //Clock and reset inputs:
                        pll_ref_clk,
                        global_reset_n,
                        soft_reset_n,
                        // Used to indicate PLL loss of lock for system reset management:
                        reset_request_n,
                        // Clock and reset for the controller interface:
                        ctl_clk,
                        ctl_reset_n,
                        // Write data interface:
                        ctl_dqs_burst,
                        ctl_wdata_valid,
                        ctl_wdata,
                        ctl_dm,
                        ctl_wlat,
                        // Address and command interface:
                        ctl_addr,
                        ctl_ba,
                        ctl_cas_n,
                        ctl_cke,
                        ctl_cs_n,
                        ctl_odt,
                        ctl_ras_n,
                        ctl_we_n,
                        ctl_rst_n,
                        ctl_mem_clk_disable,
                        // Read data interface:
                        ctl_doing_rd,
                        ctl_rdata,
                        ctl_rdata_valid,
                        ctl_rlat,
                        //re-calibration request & configuration:
                        ctl_cal_req,
                        ctl_cal_byte_lane_sel_n,
                        //Calibration status interface:
                        ctl_cal_success,
                        ctl_cal_fail,
                        ctl_cal_warning,
                        //ports to memory device(s):
                        mem_addr,
                        mem_ba,
                        mem_cas_n,
                        mem_cke,
                        mem_cs_n,
                        mem_dm,
                        mem_odt,
                        mem_ras_n,
                        mem_we_n,
                        mem_clk,
                        mem_clk_n,
                        mem_reset_n,
                        // Bidirectional Memory interface signals:
                        mem_dq,
                        mem_dqs,
                        mem_dqs_n,
                        // Auxiliary clocks. Some systems may need these for debugging
                        // purposes, or for full-rate to half-rate bridge interfaces
                        aux_half_rate_clk,
                        aux_full_rate_clk,
                        // On Chip Termination: -  dynamically updated values.
                        oct_ctl_rs_value,
                        oct_ctl_rt_value,
                        // DLL import/export ports
                        dqs_offset_delay_ctrl,
                        dqs_delay_ctrl_import,
                        dqs_delay_ctrl_export,
                        dll_reference_clk,
                        // Debug interface:- ALTERA USE ONLY
                        dbg_clk,
                        dbg_reset_n,
                        dbg_addr,
                        dbg_wr,
                        dbg_rd,
                        dbg_cs,
                        dbg_wr_data,
                        dbg_rd_data,
                        dbg_waitrequest
                      );
// Default parameter values :
parameter FAMILY                          =     "CYCLONEIII";
parameter MEM_IF_MEMTYPE                  =           "DDR2";
parameter SPEED_GRADE                     =             "C6";
parameter DLL_DELAY_BUFFER_MODE           =           "HIGH";
parameter DLL_DELAY_CHAIN_LENGTH          =                8;
parameter DQS_DELAY_CTL_WIDTH             =                6;
parameter DQS_OUT_MODE                    =   "DELAY_CHAIN2";
parameter DQS_PHASE                       =             9000;
parameter DQS_PHASE_SETTING               =                2;
parameter DWIDTH_RATIO                    =                4;
parameter MEM_IF_DWIDTH                   =               64;
parameter MEM_IF_ADDR_WIDTH               =               13;
parameter MEM_IF_BANKADDR_WIDTH           =                3;
parameter MEM_IF_CS_WIDTH                 =                2;
parameter MEM_IF_DM_WIDTH                 =                8;
parameter MEM_IF_DM_PINS_EN               =                1;
parameter MEM_IF_DQ_PER_DQS               =                8;
parameter MEM_IF_DQS_WIDTH                =                8;
parameter MEM_IF_OCT_EN                   =                0;
parameter MEM_IF_CLK_PAIR_COUNT           =                3;
parameter MEM_IF_CLK_PS                   =             4000;
parameter MEM_IF_CLK_PS_STR               =        "4000 ps";
parameter MEM_IF_MR_0                     =                0;
parameter MEM_IF_MR_1                     =                0;
parameter MEM_IF_MR_2                     =                0;
parameter MEM_IF_MR_3                     =                0;
parameter MEM_IF_PRESET_RLAT              =                0;
parameter PLL_STEPS_PER_CYCLE             =               24;
parameter SCAN_CLK_DIVIDE_BY              =                4;
parameter REDUCE_SIM_TIME                 =                0;
parameter CAPABILITIES                    =                0;
parameter TINIT_TCK                       =            40000;
parameter TINIT_RST                       =           100000;
parameter DBG_A_WIDTH                     =               13;
parameter SEQ_STRING_ID                   =       "seq_name";
parameter MEM_IF_CS_PER_RANK              =                1;    // duplicates CS, CKE, ODT, sequencer still controls 1 rank, but it is subdivided from controller perspective.
parameter MEM_IF_RANKS_PER_SLOT           =                1;    // how ranks are arranged into slot - needed for odt setting in the sequencer
parameter MEM_IF_RDV_PER_CHIP             =                0;   // multiple chips, and which gives valid data
parameter GENERATE_ADDITIONAL_DBG_RTL     =                0;   // DDR2 sequencer specific
parameter CAPTURE_PHASE_OFFSET            =                0;
parameter MEM_IF_ADDR_CMD_PHASE           =                0;
parameter DLL_EXPORT_IMPORT               =           "NONE";
parameter MEM_IF_DQSN_EN                  =                1;
parameter RANK_HAS_ADDR_SWAP              =                0;
parameter INVERT_POSTAMBLE_CLK            =          "false";
localparam phy_report_prefix              = "ddr3_int_phy_alt_mem_phy (top level) : ";
localparam POSTAMBLE_AWIDTH                   =                6;
localparam POSTAMBLE_HALFT_EN                 =                0;
localparam POSTAMBLE_INITIAL_LAT              =               16;
localparam POSTAMBLE_RESYNC_LAT_CTL_EN        =                0;
// function to set the USE_MEM_CLK_FOR_ADDR_CMD_CLK localparam based on MEM_IF_ADDR_CMD_PHASE
function integer set_mem_clk_for_ac_clk (input reg [23:0] addr_cmd_phase);
    integer return_value;
    begin
        return_value = 0;
        case (addr_cmd_phase)
            0, 180       : return_value = 1;
            90, 270      : return_value = 0;
            default      : begin
                           //synthesis translate_off
                               $display(phy_report_prefix, "Illegal value set on MEM_IF_ADDR_CMD_PHASE parameter: ", addr_cmd_phase);
                               $stop;
                           //synthesis translate_on
                           end
        endcase
        set_mem_clk_for_ac_clk = return_value;
    end
endfunction
// function to set the ADDR_CMD_NEGEDGE_EN localparam based on MEM_IF_ADDR_CMD_PHASE
function integer set_ac_negedge_en(input reg [23:0] addr_cmd_phase);
    integer return_value;
    begin
        return_value = 0;
        case (addr_cmd_phase)
            90, 180      : return_value = 1;
            0, 270       : return_value = 0;
            default      : begin
                           //synthesis translate_off
                               $display(phy_report_prefix, "Illegal value set on MEM_IF_ADDR_CMD_PHASE parameter: ", addr_cmd_phase);
                               $stop;
                           //synthesis translate_on
                           end
        endcase
        set_ac_negedge_en = return_value;
    end
endfunction
localparam USE_MEM_CLK_FOR_ADDR_CMD_CLK   =           set_mem_clk_for_ac_clk(MEM_IF_ADDR_CMD_PHASE);
localparam ADDR_CMD_NEGEDGE_EN            =           set_ac_negedge_en(MEM_IF_ADDR_CMD_PHASE);
localparam LOCAL_IF_DWIDTH                =           MEM_IF_DWIDTH*DWIDTH_RATIO;
localparam MEM_IF_POSTAMBLE_EN_WIDTH      =           MEM_IF_DWIDTH/MEM_IF_DQ_PER_DQS;
localparam LOCAL_IF_CLK_PS                =           MEM_IF_CLK_PS/(DWIDTH_RATIO/2);
localparam PLL_REF_CLK_PS                 =           LOCAL_IF_CLK_PS;
localparam MEM_IF_DQS_CAPTURE_EN          =                1;
localparam ADDR_COUNT_WIDTH               =                4;
localparam RDP_RESYNC_LAT_CTL_EN          =                0;
localparam DEDICATED_MEMORY_CLK_EN        =                0;
localparam ADV_LAT_WIDTH                  =                5;
localparam CAPTURE_MIMIC_PATH             =                0;
localparam DDR_MIMIC_PATH_EN              =                1;
localparam MIMIC_DEBUG_EN                 =                0;
localparam NUM_MIMIC_SAMPLE_CYCLES        =                6;
localparam NUM_DEBUG_SAMPLES_TO_STORE     =             4096;
localparam ASYNCHRONOUS_AVALON_CLOCK      =                1;
localparam RDV_INITIAL_LAT                =               ((DWIDTH_RATIO == 2) && (MEM_IF_MEMTYPE == "DDR2")) ? 25 : 23;
localparam RDP_INITIAL_LAT                =                6;
localparam RESYNC_PIPELINE_DEPTH          =                0;
localparam CLOCK_INDEX_WIDTH              =                3;
localparam OCT_LAT_WIDTH                  =    ADV_LAT_WIDTH;
// I/O Signal definitions :
// Clock and reset I/O :
input  wire                                                    pll_ref_clk;
input  wire                                                    global_reset_n;
input  wire                                                    soft_reset_n;
// This is the PLL locked signal :
output wire                                                    reset_request_n;
// The controller must use this phy_clk to interface to the PHY.  It is
// optional as to whether the remainder of the system uses it :
output wire                                                    ctl_clk;
output wire                                                    ctl_reset_n;
// new AFI I/Os -  write data i/f:
input  wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO/2 -1 : 0]         ctl_dqs_burst;
input  wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO/2 -1 : 0]         ctl_wdata_valid;
input  wire [MEM_IF_DWIDTH * DWIDTH_RATIO      -1 : 0]         ctl_wdata;
input  wire [MEM_IF_DM_WIDTH * DWIDTH_RATIO    -1 : 0]         ctl_dm;
output wire [4 : 0]                                            ctl_wlat;
// new AFI I/Os - addr/cmd i/f:
input  wire [MEM_IF_ADDR_WIDTH  * DWIDTH_RATIO/2 -1 : 0]       ctl_addr;
input  wire [MEM_IF_BANKADDR_WIDTH * DWIDTH_RATIO/2 -1 : 0]    ctl_ba;
input  wire [1 * DWIDTH_RATIO/2 -1 : 0]                        ctl_cas_n;
input  wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1:0]           ctl_cke;
input  wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1:0]           ctl_cs_n;
input  wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1:0]           ctl_odt;
input  wire [1 * DWIDTH_RATIO/2 -1 : 0]                        ctl_ras_n;
input  wire [1 * DWIDTH_RATIO/2 -1 : 0]                        ctl_we_n;
input  wire [DWIDTH_RATIO/2 - 1 : 0]                           ctl_rst_n;
input  wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                    ctl_mem_clk_disable;
// new AFI I/Os - read data i/f:
input  wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO / 2 -1 : 0]       ctl_doing_rd;
output wire [MEM_IF_DWIDTH * DWIDTH_RATIO      -1 : 0]         ctl_rdata;
output wire [DWIDTH_RATIO / 2 -1 : 0]                          ctl_rdata_valid;
output wire [4 : 0]                                            ctl_rlat;
// re-calibration request and configuration:
input  wire                                                    ctl_cal_req;
input  wire [MEM_IF_DQS_WIDTH * MEM_IF_CS_WIDTH - 1 : 0]       ctl_cal_byte_lane_sel_n;
// new AFI I/Os - status interface:
output wire                                                    ctl_cal_success;
output wire                                                    ctl_cal_fail;
output wire                                                    ctl_cal_warning;
//Outputs to DIMM :
output wire [MEM_IF_ADDR_WIDTH - 1 : 0]                        mem_addr;
output wire [MEM_IF_BANKADDR_WIDTH - 1 : 0]                    mem_ba;
output wire                                                    mem_cas_n;
output wire [MEM_IF_CS_WIDTH - 1 : 0]                          mem_cke;
output wire [MEM_IF_CS_WIDTH - 1 : 0]                          mem_cs_n;
wire        [MEM_IF_DWIDTH - 1 : 0]                            mem_d;
output wire [MEM_IF_DM_WIDTH - 1 : 0]                          mem_dm;
output wire [MEM_IF_CS_WIDTH - 1 : 0]                          mem_odt;
output wire                                                    mem_ras_n;
output wire                                                    mem_we_n;
output wire                                                    mem_reset_n;
//The mem_clks are outputs, but one is sometimes used for the mimic_path, so
//is looped back in.  Therefore defining as an inout ensures no errors in Quartus :
inout  wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                    mem_clk;
inout  wire [MEM_IF_CLK_PAIR_COUNT - 1 : 0]                    mem_clk_n;
//Bidirectional:
inout  tri  [MEM_IF_DWIDTH - 1 : 0]                            mem_dq;
inout  tri  [MEM_IF_DWIDTH / MEM_IF_DQ_PER_DQS - 1 : 0]        mem_dqs;
inout  tri  [MEM_IF_DWIDTH / MEM_IF_DQ_PER_DQS - 1 : 0]        mem_dqs_n;
input  wire [`OCT_SERIES_TERM_CONTROL_WIDTH   -1 : 0]          oct_ctl_rs_value;
input  wire [`OCT_PARALLEL_TERM_CONTROL_WIDTH -1 : 0]          oct_ctl_rt_value;
// DQS offsetting is possible with the ArriaII hardware, however this is unsupported by the IP
// in this release :
input  wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]	               dqs_offset_delay_ctrl;
input  wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]                     dqs_delay_ctrl_import;
output wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]                     dqs_delay_ctrl_export;
output wire                                                    dll_reference_clk;
// AVALON MM Slave   -- debug IF
input  wire                                                    dbg_clk;
input  wire                                                    dbg_reset_n;
input  wire [DBG_A_WIDTH -1 : 0]                               dbg_addr;
input  wire                                                    dbg_wr;
input  wire                                                    dbg_rd;
input  wire                                                    dbg_cs;
input  wire [31 : 0]                                           dbg_wr_data;
output wire [31 : 0]                                           dbg_rd_data;
output wire                                                    dbg_waitrequest;
// Auxillary clocks. These do not have to be connected if the system
// doesn't require them :
output wire                                                    aux_half_rate_clk;
output wire                                                    aux_full_rate_clk;
// Internal signal declarations :
// Clocks :
// full-rate memory clock
wire                                            mem_clk_2x;
// write_clk_2x is a full-rate write clock.  It is -90 degress aligned to the
// system clock :
wire                                            write_clk_2x;
wire                                            phy_clk_1x_src;
wire                                            phy_clk_1x;
wire                                            ac_clk_1x;
wire                                            ac_clk_2x;
wire                                            cs_n_clk_1x;
wire                                            cs_n_clk_2x;
wire                                            postamble_clk_2x;
wire                                            resync_clk_2x;
wire                                            measure_clk_1x;
wire                                            measure_clk_2x;
wire                                            half_rate_clk;
wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]             dedicated_dll_delay_ctrl;
// resets, async assert, de-assert is sync'd to each clock domain
wire                                            reset_mem_clk_2x_n;
wire                                            reset_rdp_phy_clk_1x_n;
wire                                            reset_phy_clk_1x_n;
wire                                            reset_ac_clk_1x_n;
wire                                            reset_ac_clk_2x_n;
wire                                            reset_cs_n_clk_1x_n;
wire                                            reset_cs_n_clk_2x_n;
wire                                            reset_mimic_2x_n;
wire [MEM_IF_DQS_WIDTH - 1 : 0]                 reset_resync_clk_1x_n;
wire                                            reset_resync_clk_2x_n;
wire                                            reset_seq_n;
wire                                            reset_measure_clk_1x_n;
wire                                            reset_measure_clk_2x_n;
wire                                            reset_poa_clk_2x_n;
wire                                            reset_write_clk_2x_n;
// Misc signals :
wire                                            phs_shft_busy;
wire                                            pll_seq_reconfig_busy;
// Postamble signals :
wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO /2  - 1 : 0]             poa_postamble_en_preset;
wire [MEM_IF_POSTAMBLE_EN_WIDTH - 1 : 0]                       poa_postamble_en_preset_2x;
// Sequencer signals
wire                                                           seq_mmc_start;
wire                                                           seq_pll_inc_dec_n;
wire                                                           seq_pll_start_reconfig;
wire [CLOCK_INDEX_WIDTH - 1 : 0]                               seq_pll_select;
wire [MEM_IF_DQS_WIDTH -1 : 0]                                 seq_rdp_dec_read_lat_1x;
wire [MEM_IF_DQS_WIDTH -1 : 0]                                 seq_rdp_inc_read_lat_1x;
wire [MEM_IF_DQS_WIDTH -1 : 0]                                 seq_poa_lat_dec_1x;
wire [MEM_IF_DQS_WIDTH -1 : 0]                                 seq_poa_lat_inc_1x;
wire                                                           seq_poa_protection_override_1x;
wire                                                           seq_rdp_reset_req_n;
wire                                                           seq_ac_sel;
wire [MEM_IF_ADDR_WIDTH * DWIDTH_RATIO/2 - 1 : 0]              seq_ac_addr;
wire [MEM_IF_BANKADDR_WIDTH * DWIDTH_RATIO/2 - 1 : 0]          seq_ac_ba;
wire [DWIDTH_RATIO/2 -1 : 0]                                   seq_ac_cas_n;
wire [DWIDTH_RATIO/2 -1 : 0]                                   seq_ac_ras_n;
wire [DWIDTH_RATIO/2 -1 : 0]                                   seq_ac_we_n;
wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : 0]                seq_ac_cke;
wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : 0]                seq_ac_cs_n;
wire [MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : 0]                seq_ac_odt;
wire [DWIDTH_RATIO * MEM_IF_DM_WIDTH - 1 : 0 ]                 seq_wdp_dm;
wire [MEM_IF_DQS_WIDTH * (DWIDTH_RATIO/2) - 1 : 0]             seq_wdp_dqs_burst;
wire [MEM_IF_DWIDTH * DWIDTH_RATIO - 1 : 0 ]                   seq_wdp_wdata;
wire [MEM_IF_DQS_WIDTH * (DWIDTH_RATIO/2) - 1 : 0]             seq_wdp_wdata_valid;
wire [DWIDTH_RATIO - 1 :0]                                     seq_wdp_dqs;
wire                                                           seq_wdp_ovride;
wire [MEM_IF_DQS_WIDTH * (DWIDTH_RATIO/2) - 1 : 0]             oct_rsst_sel;
wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO/2 - 1 : 0]               seq_doing_rd;
wire                                                           seq_rdata_valid_lat_inc;
wire                                                           seq_rdata_valid_lat_dec;
wire  [DWIDTH_RATIO/2 - 1 : 0]                                 seq_rdata_valid;
reg  [DQS_DELAY_CTL_WIDTH - 1 : 0 ]                            dedicated_dll_delay_ctrl_r;
wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]                            dqs_delay_ctrl_internal;
wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]                            dqs_delay_ctrl; // Output from clk_reset block
// set pll clock index of resync and mimic clocks
wire [CLOCK_INDEX_WIDTH                        - 1 : 0]        pll_resync_clk_index;
wire [CLOCK_INDEX_WIDTH                        - 1 : 0]        pll_measure_clk_index;
// The clk_reset block provides the sc_clk to the sequencer and DP blocks.
wire                                               sc_clk;
wire [MEM_IF_DQS_WIDTH - 1 : 0]                    sc_clk_dp;
// Mimic signals :
wire                                               mmc_seq_done;
wire                                               mmc_seq_value;
wire                                               mimic_data;
wire                                               mux_seq_controller_ready;
wire                                               mux_seq_wdata_req;
// Read datapath signals :
// Connections from the IOE to the read datapath :
wire [MEM_IF_DWIDTH - 1 : 0]                       dio_rdata_h_2x;
wire [MEM_IF_DWIDTH - 1 : 0]                       dio_rdata_l_2x;
// Write datapath signals :
// wires from the wdp to the dpio :
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata3_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata2_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata1_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata0_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata_h_2x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata_l_2x;
wire [MEM_IF_DWIDTH - 1 : 0]                 wdp_wdata_oe_2x;
wire  [(LOCAL_IF_DWIDTH/8) - 1 : 0]          ctl_mem_be;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_wdata_oe_h_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_wdata_oe_l_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs3_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs2_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs1_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs0_1x;
wire [(MEM_IF_DQS_WIDTH) - 1 : 0]            wdp_wdqs_2x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs_oe_h_1x;
wire [MEM_IF_DQS_WIDTH - 1 : 0]              wdp_dqs_oe_l_1x;
wire [(MEM_IF_DQS_WIDTH) - 1 : 0]            wdp_wdqs_oe_2x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm3_1x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm2_1x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm1_1x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm0_1x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm_h_2x;
wire [MEM_IF_DM_WIDTH -1 : 0]                wdp_dm_l_2x;
wire [MEM_IF_DQS_WIDTH -1 : 0]               wdp_oct_h_1x;
wire [MEM_IF_DQS_WIDTH -1 : 0]               wdp_oct_l_1x;
wire [MEM_IF_DQS_WIDTH -1 : 0]               seq_dqs_add_2t_delay;
wire                                         ctl_add_1t_ac_lat_internal;
wire                                         ctl_add_1t_odt_lat_internal;
wire                                         ctl_add_intermediate_regs_internal;
wire                                         ctl_negedge_en_internal;
wire                                         ctl_mem_dqs_burst;
wire [MEM_IF_DWIDTH*DWIDTH_RATIO - 1 : 0]    ctl_mem_wdata;
wire                                         ctl_mem_wdata_valid;
// These ports are tied off for DDR,DDR2,DDR3.  Registers are used to reduce Quartus warnings :
(* preserve *) reg [3 : 0]                   ctl_mem_dqs = 4'b1100;
wire [MEM_IF_CS_WIDTH - 1 : 0]               int_rank_has_addr_swap;
//SIII declarations :
//Outputs from the dp_io block to the read_dp block :
wire [MEM_IF_DWIDTH - 1 : 0]                     dio_rdata3_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                     dio_rdata2_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                     dio_rdata1_1x;
wire [MEM_IF_DWIDTH - 1 : 0]                     dio_rdata0_1x;
wire [MEM_IF_DQS_WIDTH * DWIDTH_RATIO/2 - 1 : 0]  merged_doing_rd;
wire [OCT_LAT_WIDTH - 1 : 0]                     seq_oct_oct_delay; // oct_lat
wire [OCT_LAT_WIDTH - 1 : 0]                     seq_oct_oct_extend; //oct_extend_duration
wire seq_oct_val;
wire seq_mem_clk_disable;
wire [DWIDTH_RATIO/2 - 1 : 0]                    seq_ac_rst_n;
wire                                             dqs_delay_update_en;
wire [DQS_DELAY_CTL_WIDTH - 1 : 0 ]              dlloffset_offsetctrl_out;
// Use either the imported DQS delay or the clock/reset output :
generate
    if (DLL_EXPORT_IMPORT == "IMPORT")
        assign dqs_delay_ctrl_internal = dqs_delay_ctrl_import;
    else
        assign dqs_delay_ctrl_internal = dqs_delay_ctrl;
endgenerate
// Generate auxillary clocks:
generate
    // Half-rate mode :
    if (DWIDTH_RATIO == 4)
    begin
        assign aux_half_rate_clk = phy_clk_1x;
        assign aux_full_rate_clk = mem_clk_2x;
    end
    // Full-rate mode :
    else
    begin
        assign aux_half_rate_clk = half_rate_clk;
        assign aux_full_rate_clk = phy_clk_1x;
    end
endgenerate
// The top level I/O should not have the "Nx" clock domain suffices, so this is
// assigned here.  Also note that to avoid delta delay issues both the external and
// internal phy_clks are assigned to a common 'src' clock :
assign ctl_clk         = phy_clk_1x_src;
assign phy_clk_1x      = phy_clk_1x_src;
assign ctl_reset_n     = reset_phy_clk_1x_n;
// Export the internally generated DQS delay :
assign dqs_delay_ctrl_export = dqs_delay_ctrl;
assign dll_reference_clk     = mem_clk_2x;
// Instance I/O modules :
ddr3_int_phy_alt_mem_phy_dp_io #(
    .MEM_IF_DWIDTH              (MEM_IF_DWIDTH),
    .MEM_IF_DM_PINS_EN          (MEM_IF_DM_PINS_EN),
    .MEM_IF_DM_WIDTH            (MEM_IF_DM_WIDTH),
    .MEM_IF_DQ_PER_DQS          (MEM_IF_DQ_PER_DQS),
    .MEM_IF_DQS_WIDTH           (MEM_IF_DQS_WIDTH),
    .MEM_IF_MEMTYPE             (MEM_IF_MEMTYPE),
    .MEM_IF_DQSN_EN             (MEM_IF_DQSN_EN),
    .MEM_IF_POSTAMBLE_EN_WIDTH  (MEM_IF_POSTAMBLE_EN_WIDTH),
    .DQS_DELAY_CTL_WIDTH        (DQS_DELAY_CTL_WIDTH)
) dpio (
    .reset_write_clk_2x_n       (reset_write_clk_2x_n),
    .resync_clk_2x              (resync_clk_2x),
    .postamble_clk_2x           (postamble_clk_2x),
    .mem_clk_2x                 (mem_clk_2x),
    .write_clk_2x               (write_clk_2x),
    .dqs_delay_ctrl             (dqs_delay_ctrl_internal),
    .mem_dm                     (mem_dm),
    .mem_dq                     (mem_dq),
    .mem_dqs                    (mem_dqs),
    .mem_dqsn                   (mem_dqs_n),
    .dio_rdata_h_2x             (dio_rdata_h_2x),
    .dio_rdata_l_2x             (dio_rdata_l_2x),
    .poa_postamble_en_preset_2x (poa_postamble_en_preset_2x),
    .wdp_dm_h_2x                (wdp_dm_h_2x),
    .wdp_dm_l_2x                (wdp_dm_l_2x),
    .wdp_wdata_h_2x             (wdp_wdata_h_2x),
    .wdp_wdata_l_2x             (wdp_wdata_l_2x),
    .wdp_wdata_oe_2x            (wdp_wdata_oe_2x),
    .wdp_wdqs_2x                (wdp_wdqs_2x),
    .wdp_wdqs_oe_2x             (wdp_wdqs_oe_2x)
);
// Instance the read datapath :
ddr3_int_phy_alt_mem_phy_read_dp #(
    .ADDR_COUNT_WIDTH          (ADDR_COUNT_WIDTH),
    .BIDIR_DPINS               (1),
    .DWIDTH_RATIO              (DWIDTH_RATIO),
    .MEM_IF_CLK_PS             (MEM_IF_CLK_PS),
    .FAMILY                    (FAMILY),
    .LOCAL_IF_DWIDTH           (LOCAL_IF_DWIDTH),
    .MEM_IF_DQ_PER_DQS         (MEM_IF_DQ_PER_DQS),
    .MEM_IF_DQS_WIDTH          (MEM_IF_DQS_WIDTH),
    .MEM_IF_DWIDTH             (MEM_IF_DWIDTH),
    .RDP_INITIAL_LAT           (RDP_INITIAL_LAT),
    .RDP_RESYNC_LAT_CTL_EN     (RDP_RESYNC_LAT_CTL_EN),
    .RESYNC_PIPELINE_DEPTH     (RESYNC_PIPELINE_DEPTH)
) rdp (
    .phy_clk_1x                (phy_clk_1x),
    .resync_clk_2x             (resync_clk_2x),
    .reset_phy_clk_1x_n        (reset_rdp_phy_clk_1x_n),
    .reset_resync_clk_2x_n     (reset_resync_clk_2x_n),
    .seq_rdp_dec_read_lat_1x   (seq_rdp_dec_read_lat_1x[0]),
    .seq_rdp_dmx_swap          (1'b0),
    .seq_rdp_inc_read_lat_1x   (seq_rdp_inc_read_lat_1x[0]),
    .dio_rdata_h_2x            (dio_rdata_h_2x),
    .dio_rdata_l_2x            (dio_rdata_l_2x),
    .ctl_mem_rdata             (ctl_rdata)
);
//          enhancements a different delay per dqs group may be implemented using the
//          full vector
// Instance the write datapath :
generate
    // Half-rate Write datapath :
    if (DWIDTH_RATIO == 4)
    begin : half_rate_wdp_gen
        ddr3_int_phy_alt_mem_phy_write_dp #(
                    .MEM_IF_MEMTYPE        (MEM_IF_MEMTYPE),
            .BIDIR_DPINS           (1),
            .LOCAL_IF_DRATE        ("HALF"),
            .LOCAL_IF_DWIDTH       (LOCAL_IF_DWIDTH),
            .MEM_IF_DM_WIDTH       (MEM_IF_DM_WIDTH),
            .MEM_IF_DQ_PER_DQS     (MEM_IF_DQ_PER_DQS),
            .MEM_IF_DQS_WIDTH      (MEM_IF_DQS_WIDTH),
            .GENERATE_WRITE_DQS    (1),
            .MEM_IF_DWIDTH         (MEM_IF_DWIDTH),
            .DWIDTH_RATIO          (DWIDTH_RATIO)
        ) wdp (
            .phy_clk_1x            (phy_clk_1x),
            .mem_clk_2x            (mem_clk_2x),
            .write_clk_2x          (write_clk_2x),
            .reset_phy_clk_1x_n    (reset_phy_clk_1x_n),
            .reset_mem_clk_2x_n    (reset_mem_clk_2x_n),
            .reset_write_clk_2x_n  (reset_write_clk_2x_n),
            .ctl_mem_be            (ctl_dm),
            .ctl_mem_dqs_burst     (ctl_dqs_burst),
            .ctl_mem_wdata         (ctl_wdata),
            .ctl_mem_wdata_valid   (ctl_wdata_valid),
            .seq_be                (seq_wdp_dm),
            .seq_dqs_burst         (seq_wdp_dqs_burst),
            .seq_wdata             (seq_wdp_wdata),
            .seq_wdata_valid       (seq_wdp_wdata_valid),
            .seq_ctl_sel           (seq_wdp_ovride),
            .wdp_wdata_h_2x        (wdp_wdata_h_2x),
            .wdp_wdata_l_2x        (wdp_wdata_l_2x),
            .wdp_wdata_oe_2x       (wdp_wdata_oe_2x),
            .wdp_wdqs_2x           (wdp_wdqs_2x),
            .wdp_wdqs_oe_2x        (wdp_wdqs_oe_2x),
            .wdp_dm_h_2x           (wdp_dm_h_2x),
            .wdp_dm_l_2x           (wdp_dm_l_2x)
        );
    end
    // Full-rate :
    else
    begin : full_rate_wdp_gen
        ddr3_int_phy_alt_mem_phy_write_dp_fr #(
                    .BIDIR_DPINS           (1),
            .LOCAL_IF_DRATE        ("FULL"),
            .LOCAL_IF_DWIDTH       (LOCAL_IF_DWIDTH),
            .MEM_IF_DM_WIDTH       (MEM_IF_DM_WIDTH),
            .MEM_IF_DQ_PER_DQS     (MEM_IF_DQ_PER_DQS),
            .MEM_IF_DQS_WIDTH      (MEM_IF_DQS_WIDTH),
            .GENERATE_WRITE_DQS    (1),
            .MEM_IF_DWIDTH         (MEM_IF_DWIDTH),
            .DWIDTH_RATIO          (DWIDTH_RATIO)
        ) wdp (
            .phy_clk_1x            (phy_clk_1x),
            .mem_clk_2x            (mem_clk_2x),
            .write_clk_2x          (write_clk_2x),
            .reset_phy_clk_1x_n    (reset_phy_clk_1x_n),
            .reset_mem_clk_2x_n    (reset_mem_clk_2x_n),
            .reset_write_clk_2x_n  (reset_write_clk_2x_n),
            .ctl_mem_be            (ctl_dm),
            .ctl_mem_dqs_burst     (ctl_dqs_burst),
            .ctl_mem_wdata         (ctl_wdata),
            .ctl_mem_wdata_valid   (ctl_wdata_valid),
            .seq_be                (seq_wdp_dm),
            .seq_dqs_burst         (seq_wdp_dqs_burst),
            .seq_wdata             (seq_wdp_wdata),
            .seq_wdata_valid       (seq_wdp_wdata_valid),
            .seq_ctl_sel            (seq_wdp_ovride),
            .wdp_wdata_h_2x        (wdp_wdata_h_2x),
            .wdp_wdata_l_2x        (wdp_wdata_l_2x),
            .wdp_wdata_oe_2x       (wdp_wdata_oe_2x),
            .wdp_wdqs_2x           (wdp_wdqs_2x),
            .wdp_wdqs_oe_2x        (wdp_wdqs_oe_2x),
            .wdp_dm_h_2x           (wdp_dm_h_2x),
            .wdp_dm_l_2x           (wdp_dm_l_2x)
        );
    end
endgenerate
// Instance the address and command :
// A CIII ADC block is used, as the ADC clock may be set to one of four quadrant positions,
// not an arbitrary PLL phase :
generate
    // Half-rate address and command :
    if (DWIDTH_RATIO == 4)
    begin : half_rate_adc_gen
        ddr3_int_phy_alt_mem_phy_addr_cmd #(
                     .DWIDTH_RATIO                 (DWIDTH_RATIO),
             .MEM_ADDR_CMD_BUS_COUNT       (1),
             .MEM_IF_BANKADDR_WIDTH        (MEM_IF_BANKADDR_WIDTH),
             .MEM_IF_CS_WIDTH              (MEM_IF_CS_WIDTH),
             .MEM_IF_MEMTYPE               (MEM_IF_MEMTYPE),
             .MEM_IF_ROWADDR_WIDTH         (MEM_IF_ADDR_WIDTH)
        ) adc (
             .ac_clk_1x                    (ac_clk_1x),
             .ac_clk_2x                    (ac_clk_2x),
             .cs_n_clk_1x                  (cs_n_clk_1x),
             .cs_n_clk_2x                  (cs_n_clk_2x),
             .phy_clk_1x                   (phy_clk_1x),
             .reset_ac_clk_1x_n            (reset_ac_clk_1x_n),
             .reset_ac_clk_2x_n            (reset_ac_clk_2x_n),
             .reset_cs_n_clk_1x_n          (reset_cs_n_clk_1x_n),
             .reset_cs_n_clk_2x_n          (reset_cs_n_clk_2x_n),
             .ctl_add_1t_ac_lat            (ctl_add_1t_ac_lat_internal),
             .ctl_add_1t_odt_lat           (ctl_add_1t_odt_lat_internal),
             .ctl_add_intermediate_regs    (ctl_add_intermediate_regs_internal),
        //     .ctl_negedge_en               (ctl_negedge_en_internal),
             .ctl_negedge_en               (ADDR_CMD_NEGEDGE_EN[0 : 0]),
             .ctl_mem_addr_h               (ctl_addr[MEM_IF_ADDR_WIDTH -1 : 0]),
             .ctl_mem_addr_l               (ctl_addr[(MEM_IF_ADDR_WIDTH  * DWIDTH_RATIO/2) -1 : MEM_IF_ADDR_WIDTH]),
             .ctl_mem_ba_h                 (ctl_ba[MEM_IF_BANKADDR_WIDTH -1 : 0]),
             .ctl_mem_ba_l                 (ctl_ba[MEM_IF_BANKADDR_WIDTH * DWIDTH_RATIO/2 -1 : MEM_IF_BANKADDR_WIDTH]),
             .ctl_mem_cas_n_h              (ctl_cas_n[0]),
             .ctl_mem_cas_n_l              (ctl_cas_n[1]),
             .ctl_mem_cke_h                (ctl_cke[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_cke_l                (ctl_cke[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .ctl_mem_cs_n_h               (ctl_cs_n[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_cs_n_l               (ctl_cs_n[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .ctl_mem_odt_h                (ctl_odt[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_odt_l                (ctl_odt[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .ctl_mem_ras_n_h              (ctl_ras_n[0]),
             .ctl_mem_ras_n_l              (ctl_ras_n[1]),
             .ctl_mem_we_n_h               (ctl_we_n[0]),
             .ctl_mem_we_n_l               (ctl_we_n[1]),
             .ctl_mem_rst_n_h              (ctl_rst_n[0]),
             .ctl_mem_rst_n_l              (ctl_rst_n[1]),
             .seq_addr_h                   (seq_ac_addr[MEM_IF_ADDR_WIDTH -1 : 0]),
             .seq_addr_l                   (seq_ac_addr[MEM_IF_ADDR_WIDTH  * DWIDTH_RATIO/2 -1 : MEM_IF_ADDR_WIDTH]),
             .seq_ba_h                     (seq_ac_ba[MEM_IF_BANKADDR_WIDTH -1 : 0]),
             .seq_ba_l                     (seq_ac_ba[MEM_IF_BANKADDR_WIDTH * DWIDTH_RATIO/2 -1 : MEM_IF_BANKADDR_WIDTH]),
             .seq_cas_n_h                  (seq_ac_cas_n[0]),
             .seq_cas_n_l                  (seq_ac_cas_n[1]),
             .seq_cke_h                    (seq_ac_cke[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_cke_l                    (seq_ac_cke[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .seq_cs_n_h                   (seq_ac_cs_n[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_cs_n_l                   (seq_ac_cs_n[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .seq_odt_h                    (seq_ac_odt[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_odt_l                    (seq_ac_odt[MEM_IF_CS_WIDTH * DWIDTH_RATIO/2 - 1 : MEM_IF_CS_WIDTH]),
             .seq_ras_n_h                  (seq_ac_ras_n[0]),
             .seq_ras_n_l                  (seq_ac_ras_n[1]),
             .seq_we_n_h                   (seq_ac_we_n[0]),
             .seq_we_n_l                   (seq_ac_we_n[1]),
             .seq_mem_rst_n_h              (seq_ac_rst_n[0]),
             .seq_mem_rst_n_l              (seq_ac_rst_n[1]),
             .seq_ac_sel                   (seq_ac_sel),
             .mem_addr                     (mem_addr),
             .mem_ba                       (mem_ba),
             .mem_cas_n                    (mem_cas_n),
             .mem_cke                      (mem_cke),
             .mem_cs_n                     (mem_cs_n),
             .mem_odt                      (mem_odt),
             .mem_ras_n                    (mem_ras_n),
             .mem_we_n                     (mem_we_n),
             .mem_rst_n                    (mem_reset_n)
        );
    end
    // Full-rate :
    else
    begin : full_rate_adc_gen
        ddr3_int_phy_alt_mem_phy_addr_cmd #(
                     .DWIDTH_RATIO                 (DWIDTH_RATIO),
             .MEM_ADDR_CMD_BUS_COUNT       (1),
             .MEM_IF_BANKADDR_WIDTH        (MEM_IF_BANKADDR_WIDTH),
             .MEM_IF_CS_WIDTH              (MEM_IF_CS_WIDTH),
             .MEM_IF_MEMTYPE               (MEM_IF_MEMTYPE),
             .MEM_IF_ROWADDR_WIDTH         (MEM_IF_ADDR_WIDTH)
        ) adc (
             .ac_clk_1x                    (ac_clk_1x),
             .ac_clk_2x                    (ac_clk_2x),
             .cs_n_clk_1x                  (cs_n_clk_1x),
             .cs_n_clk_2x                  (cs_n_clk_2x),
             .phy_clk_1x                   (phy_clk_1x),
             .reset_ac_clk_1x_n            (reset_ac_clk_1x_n),
             .reset_ac_clk_2x_n            (reset_ac_clk_2x_n),
             .reset_cs_n_clk_1x_n          (reset_cs_n_clk_1x_n),
             .reset_cs_n_clk_2x_n          (reset_cs_n_clk_2x_n),
             .ctl_add_1t_ac_lat            (ctl_add_1t_ac_lat_internal),
             .ctl_add_1t_odt_lat           (ctl_add_1t_odt_lat_internal),
             .ctl_add_intermediate_regs    (ctl_add_intermediate_regs_internal),
        //     .ctl_negedge_en               (ctl_negedge_en_internal),
             .ctl_negedge_en               (ADDR_CMD_NEGEDGE_EN[0 : 0]),
             .ctl_mem_addr_h               (),
             .ctl_mem_addr_l               (ctl_addr[MEM_IF_ADDR_WIDTH  -1 : 0]),
             .ctl_mem_ba_h                 (),
             .ctl_mem_ba_l                 (ctl_ba[MEM_IF_BANKADDR_WIDTH -1 : 0]),
             .ctl_mem_cas_n_h              (),
             .ctl_mem_cas_n_l              (ctl_cas_n[0]),
             .ctl_mem_cke_h                (),
             .ctl_mem_cke_l                (ctl_cke[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_cs_n_h               (),
             .ctl_mem_cs_n_l               (ctl_cs_n[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_odt_h                (),
             .ctl_mem_odt_l                (ctl_odt[MEM_IF_CS_WIDTH - 1 : 0]),
             .ctl_mem_ras_n_h              (),
             .ctl_mem_ras_n_l              (ctl_ras_n[0]),
             .ctl_mem_we_n_h               (),
             .ctl_mem_we_n_l               (ctl_we_n[0]),
             .ctl_mem_rst_n_h              (),
             .ctl_mem_rst_n_l              (ctl_rst_n[0]),
             .seq_addr_h                   (),
             .seq_addr_l                   (seq_ac_addr[MEM_IF_ADDR_WIDTH -1 : 0]),
             .seq_ba_h                     (),
             .seq_ba_l                     (seq_ac_ba[MEM_IF_BANKADDR_WIDTH -1 : 0]),
             .seq_cas_n_h                  (),
             .seq_cas_n_l                  (seq_ac_cas_n[0]),
             .seq_cke_h                    (),
             .seq_cke_l                    (seq_ac_cke[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_cs_n_h                   (),
             .seq_cs_n_l                   (seq_ac_cs_n[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_odt_h                    (),
             .seq_odt_l                    (seq_ac_odt[MEM_IF_CS_WIDTH - 1 : 0]),
             .seq_ras_n_h                  (),
             .seq_ras_n_l                  (seq_ac_ras_n[0]),
             .seq_we_n_h                   (),
             .seq_we_n_l                   (seq_ac_we_n[0]),
             .seq_mem_rst_n_h              (),
             .seq_mem_rst_n_l              (seq_ac_rst_n[0]),
             .seq_ac_sel                   (seq_ac_sel),
             .mem_addr                     (mem_addr),
             .mem_ba                       (mem_ba),
             .mem_cas_n                    (mem_cas_n),
             .mem_cke                      (mem_cke),
             .mem_cs_n                     (mem_cs_n),
             .mem_odt                      (mem_odt),
             .mem_ras_n                    (mem_ras_n),
             .mem_we_n                     (mem_we_n),
             .mem_rst_n                    (mem_reset_n)
        );
    end
endgenerate
ddr3_int_phy_alt_mem_phy_postamble #(
    .FAMILY                         (FAMILY),
    .DWIDTH_RATIO                   (DWIDTH_RATIO),
    .MEM_IF_POSTAMBLE_EN_WIDTH      (MEM_IF_POSTAMBLE_EN_WIDTH),
    .POSTAMBLE_AWIDTH               (POSTAMBLE_AWIDTH),
    .POSTAMBLE_HALFT_EN             (POSTAMBLE_HALFT_EN),
    .POSTAMBLE_INITIAL_LAT          (POSTAMBLE_INITIAL_LAT),
    .POSTAMBLE_RESYNC_LAT_CTL_EN    (POSTAMBLE_RESYNC_LAT_CTL_EN)
) poa (
    .phy_clk_1x                     (phy_clk_1x),
    .poa_postamble_en_preset_2x     (poa_postamble_en_preset_2x),
    .postamble_clk_2x               (postamble_clk_2x),
    .reset_phy_clk_1x_n             (reset_rdp_phy_clk_1x_n),
    .reset_poa_clk_2x_n             (reset_poa_clk_2x_n),
    .ctl_doing_rd_beat1_1x          (merged_doing_rd[0]),
    .ctl_doing_rd_beat2_1x          (DWIDTH_RATIO == 4 ? merged_doing_rd[MEM_IF_DQS_WIDTH] : merged_doing_rd[0]),
    .seq_poa_lat_dec_1x             (seq_poa_lat_dec_1x[0]),
    .seq_poa_lat_inc_1x             (seq_poa_lat_inc_1x[0]),
    .seq_poa_protection_override_1x (seq_poa_protection_override_1x)
);
// Generate the data postamble paths (merged_doing_rd)
 assign merged_doing_rd = seq_doing_rd | (ctl_doing_rd & {((DWIDTH_RATIO/2) * MEM_IF_DQS_WIDTH) {ctl_cal_success}});
 assign int_rank_has_addr_swap = RANK_HAS_ADDR_SWAP[MEM_IF_CS_WIDTH - 1 : 0];
 assign pll_resync_clk_index   = 5;
 assign pll_measure_clk_index  = 7;
  ddr3_int_phy_alt_mem_phy_seq_wrapper
    seq_wrapper (
        .phy_clk_1x                         (phy_clk_1x),
        .reset_phy_clk_1x_n                 (reset_phy_clk_1x_n),
        .ctl_cal_success                    (ctl_cal_success),
        .ctl_cal_fail                       (ctl_cal_fail),
        .ctl_cal_warning                    (ctl_cal_warning),
        .ctl_cal_req                        (ctl_cal_req),
        .int_RANK_HAS_ADDR_SWAP             (int_rank_has_addr_swap),
        .ctl_cal_byte_lane_sel_n            (ctl_cal_byte_lane_sel_n),
        .seq_pll_inc_dec_n                  (seq_pll_inc_dec_n),
        .seq_pll_start_reconfig             (seq_pll_start_reconfig),
        .seq_pll_select                     (seq_pll_select),
        .phs_shft_busy                      (phs_shft_busy),
        .pll_resync_clk_index               (pll_resync_clk_index),
        .pll_measure_clk_index              (pll_measure_clk_index),
        .sc_clk_dp                          (),
        .scan_enable_dqs_config             (),
        .scan_update                        (),
        .scan_din                           (),
        .scan_enable_ck                     (),
        .scan_enable_dqs                    (),
        .scan_enable_dqsn                   (),
        .scan_enable_dq                     (),
        .scan_enable_dm                     (),
        .hr_rsc_clk                         (1'b0), // Halfrate resync clock not required for non-SIII style families.
        .seq_ac_addr                        (seq_ac_addr),
        .seq_ac_ba                          (seq_ac_ba),
        .seq_ac_cas_n                       (seq_ac_cas_n),
        .seq_ac_ras_n                       (seq_ac_ras_n),
        .seq_ac_we_n                        (seq_ac_we_n),
        .seq_ac_cke                         (seq_ac_cke),
        .seq_ac_cs_n                        (seq_ac_cs_n),
        .seq_ac_odt                         (seq_ac_odt),
        .seq_ac_rst_n                       (seq_ac_rst_n),
        .seq_ac_sel                         (seq_ac_sel),
        .seq_mem_clk_disable                (seq_mem_clk_disable),
        .ctl_add_1t_ac_lat_internal         (ctl_add_1t_ac_lat_internal),
        .ctl_add_1t_odt_lat_internal        (ctl_add_1t_odt_lat_internal),
        .ctl_add_intermediate_regs_internal (ctl_add_intermediate_regs_internal),
        .seq_rdv_doing_rd                   (seq_doing_rd),
        .seq_rdp_reset_req_n                (seq_rdp_reset_req_n),
        .seq_rdp_inc_read_lat_1x            (seq_rdp_inc_read_lat_1x),
        .seq_rdp_dec_read_lat_1x            (seq_rdp_dec_read_lat_1x),
        .ctl_rdata                          (ctl_rdata),
        .int_rdata_valid_1t                 (seq_rdata_valid),
        .seq_rdata_valid_lat_inc            (seq_rdata_valid_lat_inc),
        .seq_rdata_valid_lat_dec            (seq_rdata_valid_lat_dec),
        .ctl_rlat                           (ctl_rlat),
        .seq_poa_lat_dec_1x                 (seq_poa_lat_dec_1x),
        .seq_poa_lat_inc_1x                 (seq_poa_lat_inc_1x),
        .seq_poa_protection_override_1x     (seq_poa_protection_override_1x),
        .seq_oct_oct_delay                  (seq_oct_oct_delay),
        .seq_oct_oct_extend                 (seq_oct_oct_extend),
        .seq_oct_val                        (seq_oct_val),
        .seq_wdp_dqs_burst                  (seq_wdp_dqs_burst),
        .seq_wdp_wdata_valid                (seq_wdp_wdata_valid),
        .seq_wdp_wdata                      (seq_wdp_wdata),
        .seq_wdp_dm                         (seq_wdp_dm),
        .seq_wdp_dqs                        (seq_wdp_dqs),
        .seq_wdp_ovride                     (seq_wdp_ovride),
        .seq_dqs_add_2t_delay               (seq_dqs_add_2t_delay),
        .ctl_wlat                           (ctl_wlat),
        .seq_mmc_start                      (seq_mmc_start),
        .mmc_seq_done                       (mmc_seq_done),
        .mmc_seq_value                      (mmc_seq_value),
        .mem_err_out_n                      (1'b1),
        .parity_error_n                     (),
        .dbg_clk                            (dbg_clk),
        .dbg_reset_n                        (dbg_reset_n),
        .dbg_addr                           (dbg_addr),
        .dbg_wr                             (dbg_wr),
        .dbg_rd                             (dbg_rd),
        .dbg_cs                             (dbg_cs),
        .dbg_wr_data                        (dbg_wr_data),
        .dbg_rd_data                        (dbg_rd_data),
        .dbg_waitrequest                    (dbg_waitrequest)
    );
// Generate rdata_valid for sequencer and control blocks
ddr3_int_phy_alt_mem_phy_rdata_valid #(
     .FAMILY                    (FAMILY),
     .MEM_IF_DQS_WIDTH          (MEM_IF_DQS_WIDTH),
     .RDATA_VALID_AWIDTH        (5),
     .RDATA_VALID_INITIAL_LAT   (RDV_INITIAL_LAT),
     .DWIDTH_RATIO              (DWIDTH_RATIO)
) rdv_pipe (
     .phy_clk_1x                (phy_clk_1x),
     .reset_phy_clk_1x_n        (reset_rdp_phy_clk_1x_n),
     .seq_rdata_valid_lat_dec   (seq_rdata_valid_lat_dec),
     .seq_rdata_valid_lat_inc   (seq_rdata_valid_lat_inc),
     .seq_doing_rd              (seq_doing_rd),
     .ctl_doing_rd              (ctl_doing_rd),
     .ctl_cal_success           (ctl_cal_success),
     .ctl_rdata_valid           (ctl_rdata_valid),
     .seq_rdata_valid           (seq_rdata_valid)
);
// Instance the AII clock and reset :
ddr3_int_phy_alt_mem_phy_clk_reset #(
    .CLOCK_INDEX_WIDTH                    (CLOCK_INDEX_WIDTH),
    .DLL_EXPORT_IMPORT                    (DLL_EXPORT_IMPORT),
    .DWIDTH_RATIO                         (DWIDTH_RATIO),
    .LOCAL_IF_CLK_PS                      (LOCAL_IF_CLK_PS),
    .MEM_IF_CLK_PAIR_COUNT                (MEM_IF_CLK_PAIR_COUNT),
    .MEM_IF_CLK_PS                        (MEM_IF_CLK_PS),
    .MEM_IF_CLK_PS_STR                    (MEM_IF_CLK_PS_STR),
    .MEM_IF_DWIDTH                        (MEM_IF_DWIDTH),
    .MEM_IF_MEMTYPE                       (MEM_IF_MEMTYPE),
    .MEM_IF_DQSN_EN                       (MEM_IF_DQSN_EN),
    .DLL_DELAY_BUFFER_MODE                (DLL_DELAY_BUFFER_MODE),
    .DLL_DELAY_CHAIN_LENGTH               (DLL_DELAY_CHAIN_LENGTH),
    .SCAN_CLK_DIVIDE_BY                   (SCAN_CLK_DIVIDE_BY),
    .USE_MEM_CLK_FOR_ADDR_CMD_CLK         (USE_MEM_CLK_FOR_ADDR_CMD_CLK),
    .DQS_DELAY_CTL_WIDTH                  (DQS_DELAY_CTL_WIDTH),
    .INVERT_POSTAMBLE_CLK                 (INVERT_POSTAMBLE_CLK)
) clk (
    .pll_ref_clk                          (pll_ref_clk),
    .global_reset_n                       (global_reset_n),
    .soft_reset_n                         (soft_reset_n),
    .seq_rdp_reset_req_n                  (seq_rdp_reset_req_n),
    .ac_clk_2x                            (ac_clk_2x),
    .measure_clk_2x                       (measure_clk_2x),
    .mem_clk_2x                           (mem_clk_2x),
    .mem_clk                              (mem_clk),
    .mem_clk_n                            (mem_clk_n),
    .phy_clk_1x                           (phy_clk_1x_src),
    .postamble_clk_2x                     (postamble_clk_2x),
    .resync_clk_2x                        (resync_clk_2x),
    .cs_n_clk_2x                          (cs_n_clk_2x),
    .write_clk_2x                         (write_clk_2x),
    .half_rate_clk                        (half_rate_clk),
    .reset_ac_clk_2x_n                    (reset_ac_clk_2x_n),
    .reset_measure_clk_2x_n               (reset_measure_clk_2x_n),
    .reset_mem_clk_2x_n                   (reset_mem_clk_2x_n),
    .reset_phy_clk_1x_n                   (reset_phy_clk_1x_n),
    .reset_poa_clk_2x_n                   (reset_poa_clk_2x_n),
    .reset_resync_clk_2x_n                (reset_resync_clk_2x_n),
    .reset_write_clk_2x_n                 (reset_write_clk_2x_n),
    .reset_cs_n_clk_2x_n                  (reset_cs_n_clk_2x_n),
    .reset_rdp_phy_clk_1x_n               (reset_rdp_phy_clk_1x_n),
    .mem_reset_n                          (),
    .reset_request_n                      (reset_request_n),
    .dqs_delay_ctrl                       (dqs_delay_ctrl),
    .phs_shft_busy                        (phs_shft_busy),
    .seq_pll_inc_dec_n                    (seq_pll_inc_dec_n),
    .seq_pll_select                       (seq_pll_select),
    .seq_pll_start_reconfig               (seq_pll_start_reconfig),
    .mimic_data_2x                        (mimic_data),
    .seq_clk_disable                      (seq_mem_clk_disable),
    .ctrl_clk_disable                     (ctl_mem_clk_disable)
);
// Instance the mimic block :
ddr3_int_phy_alt_mem_phy_mimic #(
    .NUM_MIMIC_SAMPLE_CYCLES (NUM_MIMIC_SAMPLE_CYCLES)
) mmc (
    .measure_clk             (measure_clk_2x),
    .reset_measure_clk_n     (reset_measure_clk_2x_n),
    .mimic_data_in           (mimic_data),
    .seq_mmc_start           (seq_mmc_start),
    .mmc_seq_done            (mmc_seq_done),
    .mmc_seq_value           (mmc_seq_value)
);
// If required, instance the Mimic debug block.  If the debug block is used, a top level input
// for mimic_recapture_debug_data should be created.
generate
    if (MIMIC_DEBUG_EN == 1)
    begin : create_mimic_debug_ram
        ddr3_int_phy_alt_mem_phy_mimic_debug #(
                    .NUM_DEBUG_SAMPLES_TO_STORE (NUM_DEBUG_SAMPLES_TO_STORE),
            .PLL_STEPS_PER_CYCLE        (PLL_STEPS_PER_CYCLE)
        ) mmc_debug (
            .measure_clk                (measure_clk_1x),
            .reset_measure_clk_n        (reset_measure_clk_1x_n),
            .mmc_seq_done               (mmc_seq_done),
            .mmc_seq_value              (mmc_seq_value),
            .mimic_recapture_debug_data (1'b0)
        );
    end
endgenerate
endmodule