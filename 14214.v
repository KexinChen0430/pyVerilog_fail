module.
                                             //   1 => FWD       = The master VALID and payload signals
                                             //                    are registrated.
                                             //   2 => REV       = The slave ready signal is registrated
                                             //   3 => FWD_REV   = Both FWD and REV
                                             //   4 => SLAVE_FWD = All slave side signals and master
                                             //                    VALID and payload are registrated.
                                             //   5 => SLAVE_RDY = All slave side signals and master
                                             //                    READY are registrated.
                                             //   6 => INPUTS    = Slave and Master side inputs are
                                             //                    registrated.
 parameter C_S_AXI_REG_EN1                 = 20'h00000,
                                             // Same as C_S_AXI_REG_EN0, but this register is after
                                             // the upsizer
 parameter C_S_AXI_CTRL_ADDR_WIDTH         = 32,
                                             // Width of AXI-4-Lite address bus
 parameter C_S_AXI_CTRL_DATA_WIDTH         = 32,
                                             // Width of AXI-4-Lite data buses
 parameter C_S_AXI_BASEADDR                = 32'h0000_0000,
                                             // Base address of AXI4 Memory Mapped bus.
 parameter C_ECC_ONOFF_RESET_VALUE         = 1,
                                             // Controls ECC on/off value at startup/reset
 parameter C_ECC_CE_COUNTER_WIDTH          = 8,
                                             // The external memory to controller clock ratio.
 parameter FPGA_VOLT_TYPE                  = "N"
  )
  (
   // Clock and reset ports
   input                              clk,
   input                              clk_div2,
   input                              rst_div2,
   input [1:0]                        clk_ref,
   input                              mem_refclk ,
   input                              freq_refclk ,
   input                              pll_lock,
   input                              sync_pulse ,
   input                              mmcm_ps_clk,
   input                              poc_sample_pd,
   input                              rst,
   // memory interface ports
   inout [DQ_WIDTH-1:0]               ddr_dq,
   inout [DQS_WIDTH-1:0]              ddr_dqs_n,
   inout [DQS_WIDTH-1:0]              ddr_dqs,
   output [ROW_WIDTH-1:0]             ddr_addr,
   output [BANK_WIDTH-1:0]            ddr_ba,
   output                             ddr_cas_n,
   output [CK_WIDTH-1:0]              ddr_ck_n,
   output [CK_WIDTH-1:0]              ddr_ck,
   output [CKE_WIDTH-1:0]             ddr_cke,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_cs_n,
   output [DM_WIDTH-1:0]              ddr_dm,
   output [ODT_WIDTH-1:0]             ddr_odt,
   output                             ddr_ras_n,
   output                             ddr_reset_n,
   output                             ddr_parity,
   output                             ddr_we_n,
   output [BM_CNT_WIDTH-1:0]          bank_mach_next,
   output [2*nCK_PER_CLK-1:0]         app_ecc_multiple_err_o,
   output [2*nCK_PER_CLK-1:0]         app_ecc_single_err,
   input                              app_sr_req,
   output                             app_sr_active,
   input                              app_ref_req,
   output                             app_ref_ack,
   input                              app_zq_req,
   output                             app_zq_ack,
   // Ports to be used with SKIP_CALIB defined
   output                              calib_tap_req,
   input [6:0]                         calib_tap_addr,
   input                               calib_tap_load,
   input [7:0]                         calib_tap_val,
   input                               calib_tap_load_done,
   // temperature monitor ports
   input  [11:0]                      device_temp,
   //phase shift clock control
   output                             psen,
   output                             psincdec,
   input                              psdone,
   // debug logic ports
   input                              dbg_idel_down_all,
   input                              dbg_idel_down_cpt,
   input                              dbg_idel_up_all,
   input                              dbg_idel_up_cpt,
   input                              dbg_sel_all_idel_cpt,
   input [DQS_CNT_WIDTH-1:0]          dbg_sel_idel_cpt,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_cpt_first_edge_cnt,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_cpt_second_edge_cnt,
   output [DQS_WIDTH-1:0]             dbg_rd_data_edge_detect,
   output [2*nCK_PER_CLK*DQ_WIDTH-1:0] dbg_rddata,
   output [1:0]                       dbg_rdlvl_done,
   output [1:0]                       dbg_rdlvl_err,
   output [1:0]                       dbg_rdlvl_start,
   output [5:0]                       dbg_tap_cnt_during_wrlvl,
   output                             dbg_wl_edge_detect_valid,
   output                             dbg_wrlvl_done,
   output                             dbg_wrlvl_err,
   output                             dbg_wrlvl_start,
   output [6*DQS_WIDTH-1:0]           dbg_final_po_fine_tap_cnt,
   output [3*DQS_WIDTH-1:0]           dbg_final_po_coarse_tap_cnt,
   input                              aresetn,
   // Slave Interface Write Address Ports
   input  [C_S_AXI_ID_WIDTH-1:0]      s_axi_awid,
   input  [C_S_AXI_ADDR_WIDTH-1:0]    s_axi_awaddr,
   input  [7:0]                       s_axi_awlen,
   input  [2:0]                       s_axi_awsize,
   input  [1:0]                       s_axi_awburst,
   input  [0:0]                       s_axi_awlock,
   input  [3:0]                       s_axi_awcache,
   input  [2:0]                       s_axi_awprot,
   input  [3:0]                       s_axi_awqos,
   input                              s_axi_awvalid,
   output                             s_axi_awready,
   // Slave Interface Write Data Ports
   input  [C_S_AXI_DATA_WIDTH-1:0]    s_axi_wdata,
   input  [C_S_AXI_DATA_WIDTH/8-1:0]  s_axi_wstrb,
   input                              s_axi_wlast,
   input                              s_axi_wvalid,
   output                             s_axi_wready,
   // Slave Interface Write Response Ports
   input                              s_axi_bready,
   output [C_S_AXI_ID_WIDTH-1:0]      s_axi_bid,
   output [1:0]                       s_axi_bresp,
   output                             s_axi_bvalid,
   // Slave Interface Read Address Ports
   input  [C_S_AXI_ID_WIDTH-1:0]      s_axi_arid,
   input  [C_S_AXI_ADDR_WIDTH-1:0]    s_axi_araddr,
   input  [7:0]                       s_axi_arlen,
   input  [2:0]                       s_axi_arsize,
   input  [1:0]                       s_axi_arburst,
   input  [0:0]                       s_axi_arlock,
   input  [3:0]                       s_axi_arcache,
   input  [2:0]                       s_axi_arprot,
   input  [3:0]                       s_axi_arqos,
   input                              s_axi_arvalid,
   output                             s_axi_arready,
   // Slave Interface Read Data Ports
   input                              s_axi_rready,
   output [C_S_AXI_ID_WIDTH-1:0]      s_axi_rid,
   output [C_S_AXI_DATA_WIDTH-1:0]    s_axi_rdata,
   output [1:0]                       s_axi_rresp,
   output                             s_axi_rlast,
   output                             s_axi_rvalid,
   // AXI CTRL port
   input                                s_axi_ctrl_awvalid,
   output                               s_axi_ctrl_awready,
   input  [C_S_AXI_CTRL_ADDR_WIDTH-1:0] s_axi_ctrl_awaddr,
   // Slave Interface Write Data Ports
   input                                s_axi_ctrl_wvalid,
   output                               s_axi_ctrl_wready,
   input  [C_S_AXI_CTRL_DATA_WIDTH-1:0] s_axi_ctrl_wdata,
   // Slave Interface Write Response Ports
   output                               s_axi_ctrl_bvalid,
   input                                s_axi_ctrl_bready,
   output [1:0]                         s_axi_ctrl_bresp,
   // Slave Interface Read Address Ports
   input                                s_axi_ctrl_arvalid,
   output                               s_axi_ctrl_arready,
   input  [C_S_AXI_CTRL_ADDR_WIDTH-1:0] s_axi_ctrl_araddr,
   // Slave Interface Read Data Ports
   output                               s_axi_ctrl_rvalid,
   input                                s_axi_ctrl_rready,
   output [C_S_AXI_CTRL_DATA_WIDTH-1:0] s_axi_ctrl_rdata,
   output [1:0]                         s_axi_ctrl_rresp,
   // Interrupt output
   output                               interrupt,
   output                             init_calib_complete,
   input                              dbg_sel_pi_incdec,
   input                              dbg_sel_po_incdec,
   input [DQS_CNT_WIDTH:0]            dbg_byte_sel,
   input                              dbg_pi_f_inc,
   input                              dbg_pi_f_dec,
   input                              dbg_po_f_inc,
   input                              dbg_po_f_stg23_sel,
   input                              dbg_po_f_dec,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_cpt_tap_cnt,
   output [5*DQS_WIDTH*RANKS-1:0]     dbg_dq_idelay_tap_cnt,
   output                             dbg_rddata_valid,
   output [6*DQS_WIDTH-1:0]           dbg_wrlvl_fine_tap_cnt,
   output [3*DQS_WIDTH-1:0]           dbg_wrlvl_coarse_tap_cnt,
   output                             ref_dll_lock,
   input                              rst_phaser_ref,
   input                              iddr_rst,
   output [6*RANKS-1:0]               dbg_rd_data_offset,
   output [255:0]                     dbg_calib_top,
   output [255:0]                     dbg_phy_wrlvl,
   output [255:0]                     dbg_phy_rdlvl,
   output [99:0]                      dbg_phy_wrcal,
   output [255:0]                     dbg_phy_init,
   output [255:0]                     dbg_prbs_rdlvl,
   output [255:0]                     dbg_dqs_found_cal,
   output [5:0]                       dbg_pi_counter_read_val,
   output [8:0]                       dbg_po_counter_read_val,
   output                             dbg_pi_phaselock_start,
   output                             dbg_pi_phaselocked_done,
   output                             dbg_pi_phaselock_err,
   output                             dbg_pi_dqsfound_start,
   output                             dbg_pi_dqsfound_done,
   output                             dbg_pi_dqsfound_err,
   output                             dbg_wrcal_start,
   output                             dbg_wrcal_done,
   output                             dbg_wrcal_err,
   output [11:0]                      dbg_pi_dqs_found_lanes_phy4lanes,
   output [11:0]                      dbg_pi_phase_locked_phy4lanes,
   output [6*RANKS-1:0]               dbg_calib_rd_data_offset_1,
   output [6*RANKS-1:0]               dbg_calib_rd_data_offset_2,
   output [5:0]                       dbg_data_offset,
   output [5:0]                       dbg_data_offset_1,
   output [5:0]                       dbg_data_offset_2,
   output                             dbg_oclkdelay_calib_start,
   output                             dbg_oclkdelay_calib_done,
   output [255:0]                     dbg_phy_oclkdelay_cal,
   output [DRAM_WIDTH*16 -1:0]        dbg_oclkdelay_rd_data,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_prbs_final_dqs_tap_cnt_r,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_prbs_first_edge_taps,
   output [6*DQS_WIDTH*RANKS-1:0]     dbg_prbs_second_edge_taps,
   output [1023:0]                    dbg_poc
   );
  localparam IODELAY_GRP = (tCK <= 1500)? IODELAY_GRP1 : IODELAY_GRP0;
  localparam INTERFACE                   = "AXI4";
                                           // Port Interface.
                                           // # = UI - User Interface,
                                           //   = AXI4 - AXI4 Interface.
  localparam C_FAMILY                    = "virtex7";
  localparam C_MC_DATA_WIDTH_LCL         = 2*nCK_PER_CLK*DATA_WIDTH ;
//  wire [6*DQS_WIDTH*RANKS-1:0]     prbs_final_dqs_tap_cnt_r;
//  wire [6*DQS_WIDTH*RANKS-1:0]     dbg_prbs_first_edge_taps;
//  wire [6*DQS_WIDTH*RANKS-1:0]     dbg_prbs_second_edge_taps;
  wire                                   correct_en;
  wire [2*nCK_PER_CLK-1:0]               raw_not_ecc;
  wire [2*nCK_PER_CLK-1:0]               ecc_single;
  wire [2*nCK_PER_CLK-1:0]               ecc_multiple;
  wire [MC_ERR_ADDR_WIDTH-1:0]           ecc_err_addr;
  wire                                   app_correct_en;
  wire                                   app_correct_en_i;
  wire [2*nCK_PER_CLK-1:0]               app_raw_not_ecc;
  wire [DQ_WIDTH/8-1:0]                  fi_xor_we;
  wire [DQ_WIDTH-1:0]                    fi_xor_wrdata;
  wire [DATA_BUF_OFFSET_WIDTH-1:0]       wr_data_offset;
  wire                                   wr_data_en;
  wire [DATA_BUF_ADDR_WIDTH-1:0]         wr_data_addr;
  wire [DATA_BUF_OFFSET_WIDTH-1:0]       rd_data_offset;
  wire                                   rd_data_en;
  wire [DATA_BUF_ADDR_WIDTH-1:0]         rd_data_addr;
  wire                                   accept;
  wire                                   accept_ns;
  wire [2*nCK_PER_CLK*PAYLOAD_WIDTH-1:0] rd_data;
  wire                                   rd_data_end;
  wire                                   use_addr;
  wire                                   size;
  wire [ROW_WIDTH-1:0]                   row;
  wire [RANK_WIDTH-1:0]                  rank;
  wire                                   hi_priority;
  wire [DATA_BUF_ADDR_WIDTH-1:0]         data_buf_addr;
  wire [COL_WIDTH-1:0]                   col;
  wire [2:0]                             cmd;
  wire [BANK_WIDTH-1:0]                  bank;
  wire [2*nCK_PER_CLK*PAYLOAD_WIDTH-1:0] wr_data;
  wire [2*nCK_PER_CLK*PAYLOAD_WIDTH/8-1:0]  wr_data_mask;
  wire [APP_DATA_WIDTH-1:0]              app_rd_data;
  wire [C_MC_DATA_WIDTH_LCL-1:0]         app_rd_data_to_axi;
  wire                                   app_rd_data_end;
  wire                                   app_rd_data_valid;
  wire                                   app_rdy;
  wire                                   app_wdf_rdy;
  wire [ADDR_WIDTH-1:0]                  app_addr;
  wire [2:0]                             app_cmd;
  wire                                   app_en;
  wire                                   app_hi_pri;
  wire                                   app_sz;
  wire [APP_DATA_WIDTH-1:0]              app_wdf_data;
  wire [C_MC_DATA_WIDTH_LCL-1:0]              app_wdf_data_axi_o;
  wire                                   app_wdf_end;
  wire [APP_MASK_WIDTH-1:0]              app_wdf_mask;
  wire [C_MC_DATA_WIDTH_LCL/8-1:0]              app_wdf_mask_axi_o;
  wire                                   app_wdf_wren;
  wire                                   app_sr_req_i;
  wire                                   app_sr_active_i;
  wire                                   app_ref_req_i;
  wire                                   app_ref_ack_i;
  wire                                   app_zq_req_i;
  wire                                   app_zq_ack_i;
  wire                                   rst_tg_mc;
  wire                                   error;
  wire                                   init_wrcal_complete;
  reg               reset /* synthesis syn_maxfan = 10 */;
  reg                                    init_calib_complete_r;
  // Added a single register stage for the calib_done to fix timing
  always @(posedge clk)
    init_calib_complete_r <= init_calib_complete;
  always @(posedge clk)
    reset <= #TCQ (rst | rst_tg_mc);
  mig_7series_v4_0_mem_intfc #
     (
      .TCQ                   (TCQ),
      .DDR3_VDD_OP_VOLT      (DDR3_VDD_OP_VOLT),
      .PAYLOAD_WIDTH         (PAYLOAD_WIDTH),
      .ADDR_CMD_MODE         (ADDR_CMD_MODE),
      .AL                    (AL),
      .BANK_WIDTH            (BANK_WIDTH),
      .BM_CNT_WIDTH          (BM_CNT_WIDTH),
      .BURST_MODE            (BURST_MODE),
      .BURST_TYPE            (BURST_TYPE),
      .CA_MIRROR             (CA_MIRROR),
      .CK_WIDTH              (CK_WIDTH),
      .COL_WIDTH             (COL_WIDTH),
      .CMD_PIPE_PLUS1        (CMD_PIPE_PLUS1),
      .CS_WIDTH              (CS_WIDTH),
      .nCS_PER_RANK          (nCS_PER_RANK),
      .CKE_WIDTH             (CKE_WIDTH),
      .DATA_WIDTH            (DATA_WIDTH),
      .DATA_BUF_ADDR_WIDTH   (DATA_BUF_ADDR_WIDTH),
      .MASTER_PHY_CTL        (MASTER_PHY_CTL),
      .DATA_BUF_OFFSET_WIDTH (DATA_BUF_OFFSET_WIDTH),
      .DDR2_DQSN_ENABLE      (DDR2_DQSN_ENABLE),
      .DM_WIDTH              (DM_WIDTH),
      .DQ_CNT_WIDTH          (DQ_CNT_WIDTH),
      .DQ_WIDTH              (DQ_WIDTH),
      .DQS_CNT_WIDTH         (DQS_CNT_WIDTH),
      .DQS_WIDTH             (DQS_WIDTH),
      .DRAM_TYPE             (DRAM_TYPE),
      .DRAM_WIDTH            (DRAM_WIDTH),
      .ECC                   (ECC),
      .ECC_WIDTH             (ECC_WIDTH),
      .MC_ERR_ADDR_WIDTH     (MC_ERR_ADDR_WIDTH),
      .REFCLK_FREQ           (REFCLK_FREQ),
      .nAL                   (nAL),
      .nBANK_MACHS           (nBANK_MACHS),
      .nCK_PER_CLK           (nCK_PER_CLK),
      .ORDERING              (ORDERING),
      .OUTPUT_DRV            (OUTPUT_DRV),
      .IBUF_LPWR_MODE        (IBUF_LPWR_MODE),
      .BANK_TYPE             (BANK_TYPE),
      .DATA_IO_PRIM_TYPE     (DATA_IO_PRIM_TYPE),
      .DATA_IO_IDLE_PWRDWN   (DATA_IO_IDLE_PWRDWN),
      .IODELAY_GRP           (IODELAY_GRP),
      .FPGA_SPEED_GRADE      (FPGA_SPEED_GRADE),
      .REG_CTRL              (REG_CTRL),
      .RTT_NOM               (RTT_NOM),
      .RTT_WR                (RTT_WR),
      .CL                    (CL),
      .CWL                   (CWL),
      .tCK                   (tCK),
      .tCKE                  (tCKE),
      .tFAW                  (tFAW),
      .tPRDI                 (tPRDI),
      .tRAS                  (tRAS),
      .tRCD                  (tRCD),
      .tREFI                 (tREFI),
      .tRFC                  (tRFC),
      .tRP                   (tRP),
      .tRRD                  (tRRD),
      .tRTP                  (tRTP),
      .tWTR                  (tWTR),
      .tZQI                  (tZQI),
      .tZQCS                 (tZQCS),
      .USER_REFRESH          (USER_REFRESH),
      .TEMP_MON_EN           (TEMP_MON_EN),
      .WRLVL                 (WRLVL),
      .DEBUG_PORT            (DEBUG_PORT),
      .CAL_WIDTH             (CAL_WIDTH),
      .RANK_WIDTH            (RANK_WIDTH),
      .RANKS                 (RANKS),
      .ODT_WIDTH             (ODT_WIDTH),
      .ROW_WIDTH             (ROW_WIDTH),
      .SIM_BYPASS_INIT_CAL   (SIM_BYPASS_INIT_CAL),
      .BYTE_LANES_B0         (BYTE_LANES_B0),
      .BYTE_LANES_B1         (BYTE_LANES_B1),
      .BYTE_LANES_B2         (BYTE_LANES_B2),
      .BYTE_LANES_B3         (BYTE_LANES_B3),
      .BYTE_LANES_B4         (BYTE_LANES_B4),
      .DATA_CTL_B0           (DATA_CTL_B0),
      .DATA_CTL_B1           (DATA_CTL_B1),
      .DATA_CTL_B2           (DATA_CTL_B2),
      .DATA_CTL_B3           (DATA_CTL_B3),
      .DATA_CTL_B4           (DATA_CTL_B4),
      .PHY_0_BITLANES        (PHY_0_BITLANES),
      .PHY_1_BITLANES        (PHY_1_BITLANES),
      .PHY_2_BITLANES        (PHY_2_BITLANES),
      .CK_BYTE_MAP           (CK_BYTE_MAP),
      .ADDR_MAP              (ADDR_MAP),
      .BANK_MAP              (BANK_MAP),
      .CAS_MAP               (CAS_MAP),
      .CKE_ODT_BYTE_MAP      (CKE_ODT_BYTE_MAP),
      .CKE_MAP               (CKE_MAP),
      .ODT_MAP               (ODT_MAP),
      .CKE_ODT_AUX           (CKE_ODT_AUX),
      .CS_MAP                (CS_MAP),
      .PARITY_MAP            (PARITY_MAP),
      .RAS_MAP               (RAS_MAP),
      .WE_MAP                (WE_MAP),
      .DQS_BYTE_MAP          (DQS_BYTE_MAP),
      .DATA0_MAP             (DATA0_MAP),
      .DATA1_MAP             (DATA1_MAP),
      .DATA2_MAP             (DATA2_MAP),
      .DATA3_MAP             (DATA3_MAP),
      .DATA4_MAP             (DATA4_MAP),
      .DATA5_MAP             (DATA5_MAP),
      .DATA6_MAP             (DATA6_MAP),
      .DATA7_MAP             (DATA7_MAP),
      .DATA8_MAP             (DATA8_MAP),
      .DATA9_MAP             (DATA9_MAP),
      .DATA10_MAP            (DATA10_MAP),
      .DATA11_MAP            (DATA11_MAP),
      .DATA12_MAP            (DATA12_MAP),
      .DATA13_MAP            (DATA13_MAP),
      .DATA14_MAP            (DATA14_MAP),
      .DATA15_MAP            (DATA15_MAP),
      .DATA16_MAP            (DATA16_MAP),
      .DATA17_MAP            (DATA17_MAP),
      .MASK0_MAP             (MASK0_MAP),
      .MASK1_MAP             (MASK1_MAP),
      .SLOT_0_CONFIG         (SLOT_0_CONFIG),
      .SLOT_1_CONFIG         (SLOT_1_CONFIG),
      .CALIB_ROW_ADD         (CALIB_ROW_ADD),
      .CALIB_COL_ADD         (CALIB_COL_ADD),
      .CALIB_BA_ADD          (CALIB_BA_ADD),
      .STARVE_LIMIT          (STARVE_LIMIT),
      .USE_CS_PORT           (USE_CS_PORT),
      .USE_DM_PORT           (USE_DM_PORT),
      .USE_ODT_PORT          (USE_ODT_PORT),
      .IDELAY_ADJ            (IDELAY_ADJ),
      .FINE_PER_BIT          (FINE_PER_BIT),
      .CENTER_COMP_MODE      (CENTER_COMP_MODE),
      .PI_VAL_ADJ            (PI_VAL_ADJ),
      .TAPSPERKCLK           (TAPSPERKCLK),
      .SKIP_CALIB            (SKIP_CALIB),
      .FPGA_VOLT_TYPE        (FPGA_VOLT_TYPE)
      )
    mem_intfc0
     (
      .clk                              (clk),
      .clk_div2                         (clk_div2),
      .rst_div2                         (rst_div2),
      .clk_ref                          (tCK <= 1500 ? clk_ref[1] : clk_ref[0]),
      .mem_refclk                       (mem_refclk), //memory clock
      .freq_refclk                      (freq_refclk),
      .pll_lock                         (pll_lock),
      .sync_pulse                       (sync_pulse),
      .mmcm_ps_clk                      (mmcm_ps_clk),
      .poc_sample_pd                    (poc_sample_pd),
      .rst                              (rst),
      .error                            (error),
      .reset                            (reset),
      .rst_tg_mc                        (rst_tg_mc),
      .ddr_dq                           (ddr_dq),
      .ddr_dqs_n                        (ddr_dqs_n),
      .ddr_dqs                          (ddr_dqs),
      .ddr_addr                         (ddr_addr),
      .ddr_ba                           (ddr_ba),
      .ddr_cas_n                        (ddr_cas_n),
      .ddr_ck_n                         (ddr_ck_n),
      .ddr_ck                           (ddr_ck),
      .ddr_cke                          (ddr_cke),
      .ddr_cs_n                         (ddr_cs_n),
      .ddr_dm                           (ddr_dm),
      .ddr_odt                          (ddr_odt),
      .ddr_ras_n                        (ddr_ras_n),
      .ddr_reset_n                      (ddr_reset_n),
      .ddr_parity                       (ddr_parity),
      .ddr_we_n                         (ddr_we_n),
      .slot_0_present                   (SLOT_0_CONFIG),
      .slot_1_present                   (SLOT_1_CONFIG),
      .correct_en                       (correct_en),
      .bank                             (bank),
      .cmd                              (cmd),
      .col                              (col),
      .data_buf_addr                    (data_buf_addr),
      .wr_data                          (wr_data),
      .wr_data_mask                     (wr_data_mask),
      .rank                             (rank),
      .raw_not_ecc                      (raw_not_ecc),
      .row                              (row),
      .hi_priority                      (hi_priority),
      .size                             (size),
      .use_addr                         (use_addr),
      .accept                           (accept),
      .accept_ns                        (accept_ns),
      .ecc_single                       (ecc_single),
      .ecc_multiple                     (ecc_multiple),
      .ecc_err_addr                     (ecc_err_addr),
      .rd_data                          (rd_data),
      .rd_data_addr                     (rd_data_addr),
      .rd_data_en                       (rd_data_en),
      .rd_data_end                      (rd_data_end),
      .rd_data_offset                   (rd_data_offset),
      .wr_data_addr                     (wr_data_addr),
      .wr_data_en                       (wr_data_en),
      .wr_data_offset                   (wr_data_offset),
      .bank_mach_next                   (bank_mach_next),
      .init_calib_complete              (init_calib_complete),
      .init_wrcal_complete              (init_wrcal_complete),
      .app_sr_req                       (app_sr_req_i),
      .app_sr_active                    (app_sr_active_i),
      .app_ref_req                      (app_ref_req_i),
      .app_ref_ack                      (app_ref_ack_i),
      .app_zq_req                       (app_zq_req_i),
      .app_zq_ack                       (app_zq_ack_i),
       // skip calibration i/f
      .calib_tap_req                    (calib_tap_req),
      .calib_tap_load                   (calib_tap_load),
      .calib_tap_addr                   (calib_tap_addr),
      .calib_tap_val                    (calib_tap_val),
      .calib_tap_load_done              (calib_tap_load_done),
      .device_temp                      (device_temp),
      .psen                             (psen),
      .psincdec                         (psincdec),
      .psdone                           (psdone),
      .fi_xor_we                (fi_xor_we),
      .fi_xor_wrdata            (fi_xor_wrdata),
      .dbg_idel_up_all                  (dbg_idel_up_all),
      .dbg_idel_down_all                (dbg_idel_down_all),
      .dbg_idel_up_cpt                  (dbg_idel_up_cpt),
      .dbg_idel_down_cpt                (dbg_idel_down_cpt),
      .dbg_sel_idel_cpt                 (dbg_sel_idel_cpt),
      .dbg_sel_all_idel_cpt             (dbg_sel_all_idel_cpt),
      .dbg_calib_top                    (dbg_calib_top),
      .dbg_cpt_first_edge_cnt           (dbg_cpt_first_edge_cnt),
      .dbg_cpt_second_edge_cnt          (dbg_cpt_second_edge_cnt),
      .dbg_phy_rdlvl                    (dbg_phy_rdlvl),
      .dbg_phy_wrcal                    (dbg_phy_wrcal),
      .dbg_final_po_fine_tap_cnt        (dbg_final_po_fine_tap_cnt),
      .dbg_final_po_coarse_tap_cnt      (dbg_final_po_coarse_tap_cnt),
      .dbg_rd_data_edge_detect          (dbg_rd_data_edge_detect),
      .dbg_rddata                       (dbg_rddata),
      .dbg_rdlvl_done                   (dbg_rdlvl_done),
      .dbg_rdlvl_err                    (dbg_rdlvl_err),
      .dbg_rdlvl_start                  (dbg_rdlvl_start),
      .dbg_tap_cnt_during_wrlvl         (dbg_tap_cnt_during_wrlvl),
      .dbg_wl_edge_detect_valid         (dbg_wl_edge_detect_valid),
      .dbg_wrlvl_done                   (dbg_wrlvl_done),
      .dbg_wrlvl_err                    (dbg_wrlvl_err),
      .dbg_wrlvl_start                  (dbg_wrlvl_start),
      .dbg_sel_pi_incdec                (dbg_sel_pi_incdec),
      .dbg_sel_po_incdec                (dbg_sel_po_incdec),
      .dbg_byte_sel                     (dbg_byte_sel),
      .dbg_pi_f_inc                     (dbg_pi_f_inc),
      .dbg_pi_f_dec                     (dbg_pi_f_dec),
      .dbg_po_f_inc                     (dbg_po_f_inc),
      .dbg_po_f_stg23_sel               (dbg_po_f_stg23_sel),
      .dbg_po_f_dec                     (dbg_po_f_dec),
      .dbg_cpt_tap_cnt                  (dbg_cpt_tap_cnt),
      .dbg_dq_idelay_tap_cnt            (dbg_dq_idelay_tap_cnt),
      .dbg_rddata_valid                 (dbg_rddata_valid),
      .dbg_wrlvl_fine_tap_cnt           (dbg_wrlvl_fine_tap_cnt),
      .dbg_wrlvl_coarse_tap_cnt         (dbg_wrlvl_coarse_tap_cnt),
      .dbg_phy_wrlvl                    (dbg_phy_wrlvl),
      .dbg_pi_counter_read_val          (dbg_pi_counter_read_val),
      .dbg_po_counter_read_val          (dbg_po_counter_read_val),
      .ref_dll_lock                     (ref_dll_lock),
      .rst_phaser_ref                   (rst_phaser_ref),
      .iddr_rst                         (iddr_rst),
      .dbg_rd_data_offset               (dbg_rd_data_offset),
      .dbg_phy_init                     (dbg_phy_init),
      .dbg_prbs_rdlvl                   (dbg_prbs_rdlvl),
      .dbg_dqs_found_cal                (dbg_dqs_found_cal),
      .dbg_pi_phaselock_start           (dbg_pi_phaselock_start),
      .dbg_pi_phaselocked_done          (dbg_pi_phaselocked_done),
      .dbg_pi_phaselock_err             (dbg_pi_phaselock_err),
      .dbg_pi_dqsfound_start            (dbg_pi_dqsfound_start),
      .dbg_pi_dqsfound_done             (dbg_pi_dqsfound_done),
      .dbg_pi_dqsfound_err              (dbg_pi_dqsfound_err),
      .dbg_wrcal_start                  (dbg_wrcal_start),
      .dbg_wrcal_done                   (dbg_wrcal_done),
      .dbg_wrcal_err                    (dbg_wrcal_err),
      .dbg_pi_dqs_found_lanes_phy4lanes (dbg_pi_dqs_found_lanes_phy4lanes),
      .dbg_pi_phase_locked_phy4lanes    (dbg_pi_phase_locked_phy4lanes),
      .dbg_calib_rd_data_offset_1       (dbg_calib_rd_data_offset_1),
      .dbg_calib_rd_data_offset_2       (dbg_calib_rd_data_offset_2),
      .dbg_data_offset                  (dbg_data_offset),
      .dbg_data_offset_1                (dbg_data_offset_1),
      .dbg_data_offset_2                (dbg_data_offset_2),
      .dbg_phy_oclkdelay_cal            (dbg_phy_oclkdelay_cal),
      .dbg_oclkdelay_rd_data            (dbg_oclkdelay_rd_data),
      .dbg_oclkdelay_calib_start        (dbg_oclkdelay_calib_start),
      .dbg_oclkdelay_calib_done         (dbg_oclkdelay_calib_done),
      .prbs_final_dqs_tap_cnt_r         (dbg_prbs_final_dqs_tap_cnt_r),
      .dbg_prbs_first_edge_taps         (dbg_prbs_first_edge_taps),
      .dbg_prbs_second_edge_taps        (dbg_prbs_second_edge_taps),
      .dbg_poc                          (dbg_poc[1023:0])
      );
  genvar o;
  generate
    if(ECC_TEST == "ON") begin
      if(DQ_WIDTH == 72) begin
	for(o=0;o<8;o=o+1) begin
       		 assign app_wdf_data[o*72+:72] = {app_wdf_data_axi_o[o*64+:8],app_wdf_data_axi_o[o*64+:64]} ;
      		 assign app_wdf_mask[o*9+:9] = {app_wdf_mask_axi_o[o*8],app_wdf_mask_axi_o[o*8+:8]} ;
	end
      end else begin
      end
    end else begin
      assign app_wdf_data = app_wdf_data_axi_o ;
      assign app_wdf_mask = app_wdf_mask_axi_o ;
    end
  endgenerate
  genvar e;
  generate
    if(ECC_TEST == "ON") begin
      if(DQ_WIDTH == 72) begin
	for(e=0;e<8;e=e+1) begin
	     assign app_rd_data_to_axi[e*64+:64] = app_rd_data[e*72+:64];
	end
      end
    end else begin
    	assign app_rd_data_to_axi = app_rd_data;
    end
  endgenerate
  mig_7series_v4_0_ui_top #
    (
     .TCQ                 (TCQ),
     .APP_DATA_WIDTH      (APP_DATA_WIDTH),
     .APP_MASK_WIDTH      (APP_MASK_WIDTH),
     .BANK_WIDTH          (BANK_WIDTH),
     .COL_WIDTH           (COL_WIDTH),
     .CWL                 (CWL),
     .DATA_BUF_ADDR_WIDTH (DATA_BUF_ADDR_WIDTH),
     .ECC                 (ECC),
     .ECC_TEST            (ECC_TEST),
     .nCK_PER_CLK         (nCK_PER_CLK),
     .ORDERING            (ORDERING),
     .RANKS               (RANKS),
     .RANK_WIDTH          (RANK_WIDTH),
     .ROW_WIDTH           (ROW_WIDTH),
     .MEM_ADDR_ORDER      (MEM_ADDR_ORDER)
    )
   u_ui_top
     (
      .wr_data_mask         (wr_data_mask[APP_MASK_WIDTH-1:0]),
      .wr_data              (wr_data[APP_DATA_WIDTH-1:0]),
      .use_addr             (use_addr),
      .size                 (size),
      .row                  (row),
      .raw_not_ecc          (raw_not_ecc),
      .rank                 (rank),
      .hi_priority          (hi_priority),
      .data_buf_addr        (data_buf_addr),
      .col                  (col),
      .cmd                  (cmd),
      .bank                 (bank),
      .app_wdf_rdy          (app_wdf_rdy),
      .app_rdy              (app_rdy),
      .app_rd_data_valid    (app_rd_data_valid),
      .app_rd_data_end      (app_rd_data_end),
      .app_rd_data          (app_rd_data),
      .correct_en           (correct_en),
      .wr_data_offset       (wr_data_offset),
      .wr_data_en           (wr_data_en),
      .wr_data_addr         (wr_data_addr),
      .rst                  (reset),
      .rd_data_offset       (rd_data_offset),
      .rd_data_end          (rd_data_end),
      .rd_data_en           (rd_data_en),
      .rd_data_addr         (rd_data_addr),
      .rd_data              (rd_data[APP_DATA_WIDTH-1:0]),
      .ecc_multiple         (ecc_multiple),
      .ecc_single           (ecc_single),
      .clk                  (clk),
      .app_wdf_wren         (app_wdf_wren),
      .app_wdf_mask         (app_wdf_mask),
      .app_wdf_end          (app_wdf_end),
      .app_wdf_data         (app_wdf_data),
      .app_sz               (app_sz),
      .app_hi_pri           (app_hi_pri),
      .app_en               (app_en),
      .app_cmd              (app_cmd),
      .app_addr             (app_addr),
      .accept_ns            (accept_ns),
      .accept               (accept),
// ECC ports
      .app_raw_not_ecc      (app_raw_not_ecc),
      .app_ecc_multiple_err (app_ecc_multiple_err_o),
      .app_ecc_single_err   (app_ecc_single_err),
      .app_correct_en       (app_correct_en_i),
      .app_sr_req           (app_sr_req),
      .sr_req               (app_sr_req_i),
      .sr_active            (app_sr_active_i),
      .app_sr_active        (app_sr_active),
      .app_ref_req          (app_ref_req),
      .ref_req              (app_ref_req_i),
      .ref_ack              (app_ref_ack_i),
      .app_ref_ack          (app_ref_ack),
      .app_zq_req           (app_zq_req),
      .zq_req               (app_zq_req_i),
      .zq_ack               (app_zq_ack_i),
      .app_zq_ack           (app_zq_ack)
      );
      mig_7series_v4_0_axi_mc #
        (
         .C_FAMILY                      (C_FAMILY),
         .C_S_AXI_ID_WIDTH              (C_S_AXI_ID_WIDTH),
         .C_S_AXI_ADDR_WIDTH            (C_S_AXI_ADDR_WIDTH),
         .C_S_AXI_DATA_WIDTH            (C_S_AXI_DATA_WIDTH),
         .C_MC_DATA_WIDTH               (C_MC_DATA_WIDTH_LCL),
         .C_MC_ADDR_WIDTH               (ADDR_WIDTH),
         .C_MC_BURST_MODE               (BURST_MODE),
         .C_MC_nCK_PER_CLK              (nCK_PER_CLK),
         .C_S_AXI_SUPPORTS_NARROW_BURST (C_S_AXI_SUPPORTS_NARROW_BURST),
         .C_RD_WR_ARB_ALGORITHM         (C_RD_WR_ARB_ALGORITHM),
         .C_S_AXI_REG_EN0               (C_S_AXI_REG_EN0),
         .C_S_AXI_REG_EN1               (C_S_AXI_REG_EN1),
         .C_ECC                         (ECC)
        )
        u_axi_mc
          (
           .aclk                                   (clk),
           .aresetn                                (aresetn),
           // Slave Interface Write Address Ports
           .s_axi_awid                             (s_axi_awid),
           .s_axi_awaddr                           (s_axi_awaddr),
           .s_axi_awlen                            (s_axi_awlen),
           .s_axi_awsize                           (s_axi_awsize),
           .s_axi_awburst                          (s_axi_awburst),
           .s_axi_awlock                           (s_axi_awlock),
           .s_axi_awcache                          (s_axi_awcache),
           .s_axi_awprot                           (s_axi_awprot),
           .s_axi_awqos                            (s_axi_awqos),
           .s_axi_awvalid                          (s_axi_awvalid),
           .s_axi_awready                          (s_axi_awready),
           // Slave Interface Write Data Ports
           .s_axi_wdata                            (s_axi_wdata),
           .s_axi_wstrb                            (s_axi_wstrb),
           .s_axi_wlast                            (s_axi_wlast),
           .s_axi_wvalid                           (s_axi_wvalid),
           .s_axi_wready                           (s_axi_wready),
           // Slave Interface Write Response Ports
           .s_axi_bid                              (s_axi_bid),
           .s_axi_bresp                            (s_axi_bresp),
           .s_axi_bvalid                           (s_axi_bvalid),
           .s_axi_bready                           (s_axi_bready),
           // Slave Interface Read Address Ports
           .s_axi_arid                             (s_axi_arid),
           .s_axi_araddr                           (s_axi_araddr),
           .s_axi_arlen                            (s_axi_arlen),
           .s_axi_arsize                           (s_axi_arsize),
           .s_axi_arburst                          (s_axi_arburst),
           .s_axi_arlock                           (s_axi_arlock),
           .s_axi_arcache                          (s_axi_arcache),
           .s_axi_arprot                           (s_axi_arprot),
           .s_axi_arqos                            (s_axi_arqos),
           .s_axi_arvalid                          (s_axi_arvalid),
           .s_axi_arready                          (s_axi_arready),
           // Slave Interface Read Data Ports
           .s_axi_rid                              (s_axi_rid),
           .s_axi_rdata                            (s_axi_rdata),
           .s_axi_rresp                            (s_axi_rresp),
           .s_axi_rlast                            (s_axi_rlast),
           .s_axi_rvalid                           (s_axi_rvalid),
           .s_axi_rready                           (s_axi_rready),
           // MC Master Interface
           //CMD PORT
           .mc_app_en                              (app_en),
           .mc_app_cmd                             (app_cmd),
           .mc_app_sz                              (app_sz),
           .mc_app_addr                            (app_addr),
           .mc_app_hi_pri                          (app_hi_pri),
           .mc_app_rdy                             (app_rdy),
           .mc_init_complete                       (init_calib_complete_r),
           //DATA PORT
           .mc_app_wdf_wren                        (app_wdf_wren),
           .mc_app_wdf_mask                        (app_wdf_mask_axi_o),
           .mc_app_wdf_data                        (app_wdf_data_axi_o),
           .mc_app_wdf_end                         (app_wdf_end),
           .mc_app_wdf_rdy                         (app_wdf_rdy),
           .mc_app_rd_valid                        (app_rd_data_valid),
           .mc_app_rd_data                         (app_rd_data_to_axi),
           .mc_app_rd_end                          (app_rd_data_end),
           .mc_app_ecc_multiple_err                (app_ecc_multiple_err_o)
           );
  generate
  if (ECC == "ON") begin : gen_axi_ctrl_top
    reg [2*nCK_PER_CLK*DQ_WIDTH-1:0]         dbg_rddata_r;
    mig_7series_v4_0_axi_ctrl_top #
    (
      .C_S_AXI_CTRL_ADDR_WIDTH (C_S_AXI_CTRL_ADDR_WIDTH) ,
      .C_S_AXI_CTRL_DATA_WIDTH (C_S_AXI_CTRL_DATA_WIDTH) ,
      .C_S_AXI_ADDR_WIDTH      (C_S_AXI_ADDR_WIDTH) ,
      .C_S_AXI_BASEADDR        (C_S_AXI_BASEADDR) ,
      .C_ECC_TEST              (ECC_TEST) ,
      .C_DQ_WIDTH              (DQ_WIDTH) ,
      .C_ECC_WIDTH             (ECC_WIDTH) ,
      .C_MEM_ADDR_ORDER        (MEM_ADDR_ORDER) ,
      .C_BANK_WIDTH            (BANK_WIDTH) ,
      .C_ROW_WIDTH             (ROW_WIDTH) ,
      .C_COL_WIDTH             (COL_WIDTH) ,
      .C_ECC_ONOFF_RESET_VALUE (C_ECC_ONOFF_RESET_VALUE) ,
      .C_ECC_CE_COUNTER_WIDTH  (C_ECC_CE_COUNTER_WIDTH) ,
      .C_NCK_PER_CLK           (nCK_PER_CLK) ,
      .C_MC_ERR_ADDR_WIDTH     (MC_ERR_ADDR_WIDTH)
    )
    axi_ctrl_top_0
    (
      .aclk           (clk) ,
      .aresetn        (aresetn) ,
      .s_axi_awvalid  (s_axi_ctrl_awvalid) ,
      .s_axi_awready  (s_axi_ctrl_awready) ,
      .s_axi_awaddr   (s_axi_ctrl_awaddr) ,
      .s_axi_wvalid   (s_axi_ctrl_wvalid) ,
      .s_axi_wready   (s_axi_ctrl_wready) ,
      .s_axi_wdata    (s_axi_ctrl_wdata) ,
      .s_axi_bvalid   (s_axi_ctrl_bvalid) ,
      .s_axi_bready   (s_axi_ctrl_bready) ,
      .s_axi_bresp    (s_axi_ctrl_bresp) ,
      .s_axi_arvalid  (s_axi_ctrl_arvalid) ,
      .s_axi_arready  (s_axi_ctrl_arready) ,
      .s_axi_araddr   (s_axi_ctrl_araddr) ,
      .s_axi_rvalid   (s_axi_ctrl_rvalid) ,
      .s_axi_rready   (s_axi_ctrl_rready) ,
      .s_axi_rdata    (s_axi_ctrl_rdata) ,
      .s_axi_rresp    (s_axi_ctrl_rresp) ,
      .interrupt      (interrupt) ,
      .init_complete  (init_calib_complete_r) ,
      .ecc_single     (ecc_single) ,
      .ecc_multiple   (ecc_multiple) ,
      .ecc_err_addr   (ecc_err_addr) ,
      .app_correct_en (app_correct_en) ,
      .dfi_rddata     (dbg_rddata_r) ,
      .fi_xor_we      (fi_xor_we) ,
      .fi_xor_wrdata  (fi_xor_wrdata)
    );
    // dbg_rddata delayed one cycle to match ecc_*
    always @(posedge clk) begin
      dbg_rddata_r <= dbg_rddata;
    end
    //if(ECC_TEST == "ON") begin
    //  assign app_raw_not_ecc = {2*nCK_PER_CLK{1'b1}};
    //  assign app_correct_en_i = 'b0 ;
    //end else begin
    //  assign app_raw_not_ecc = {2*nCK_PER_CLK{1'b0}};
    //  assign app_correct_en_i = app_correct_en ;
    //end
    assign app_raw_not_ecc = {2*nCK_PER_CLK{1'b0}};
    assign app_correct_en_i = app_correct_en ;
  end
  else begin : gen_no_axi_ctrl_top
    assign s_axi_ctrl_awready = 1'b0;
    assign s_axi_ctrl_wready  = 1'b0;
    assign s_axi_ctrl_bvalid  = 1'b0;
    assign s_axi_ctrl_bresp   = 2'b0;
    assign s_axi_ctrl_arready = 1'b0;
    assign s_axi_ctrl_rvalid  = 1'b0;
    assign s_axi_ctrl_rdata   = {C_S_AXI_CTRL_DATA_WIDTH{1'b0}};
    assign s_axi_ctrl_rresp   = 2'b0;
    assign interrupt          = 1'b0;
    assign app_correct_en     = 1'b1;
    assign app_raw_not_ecc    = 4'b0;
    assign fi_xor_we          = {DQ_WIDTH/8{1'b0}};
    assign fi_xor_wrdata      = {DQ_WIDTH{1'b0}};
  end
  endgenerate
endmodule