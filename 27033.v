module
  localparam tTEMPSAMPLE           = 10000000;   // sample every 10 us
  localparam XADC_CLK_PERIOD       = 5000;       // Use 200 MHz IODELAYCTRL clock
  localparam TAPSPERKCLK = 56;
  // Wire declarations
  wire [BM_CNT_WIDTH-1:0]           bank_mach_next;
  wire                              clk;
  wire [1:0]                        clk_ref;
  wire [1:0]                        iodelay_ctrl_rdy;
  wire                              clk_ref_in;
  wire                              sys_rst_o;
  wire                              clk_div2;
  wire                              rst_div2;
  wire                              freq_refclk ;
  wire                              mem_refclk ;
  wire                              pll_lock ;
  wire                              sync_pulse;
  wire                              mmcm_ps_clk;
  wire                              poc_sample_pd;
  wire                              psen;
  wire                              psincdec;
  wire                              psdone;
  wire                              iddr_rst;
  wire                              ref_dll_lock;
  wire                              rst_phaser_ref;
  wire                              pll_locked;
  wire                              rst;
  wire [(2*nCK_PER_CLK)-1:0]            app_ecc_multiple_err;
  wire [(2*nCK_PER_CLK)-1:0]            app_ecc_single_err;
  wire                                ddr2_reset_n;
  wire                                ddr2_parity;
      // AXI CTRL port
  wire                              s_axi_ctrl_awvalid;
  wire                              s_axi_ctrl_awready;
  wire  [C_S_AXI_CTRL_ADDR_WIDTH-1:0] s_axi_ctrl_awaddr;
  // Slave Interface Write Data Ports
  wire                              s_axi_ctrl_wvalid;
  wire                              s_axi_ctrl_wready;
  wire  [C_S_AXI_CTRL_DATA_WIDTH-1:0] s_axi_ctrl_wdata;
  // Slave Interface Write Response Ports
  wire                              s_axi_ctrl_bvalid;
  wire                              s_axi_ctrl_bready;
  wire [1:0]                        s_axi_ctrl_bresp;
  // Slave Interface Read Address Ports
  wire                              s_axi_ctrl_arvalid;
  wire                              s_axi_ctrl_arready;
  wire  [C_S_AXI_CTRL_ADDR_WIDTH-1:0]  s_axi_ctrl_araddr;
  // Slave Interface Read Data Ports
  wire                              s_axi_ctrl_rvalid;
  wire                              s_axi_ctrl_rready;
  wire [C_S_AXI_CTRL_DATA_WIDTH-1:0]   s_axi_ctrl_rdata;
  wire [1:0]                        s_axi_ctrl_rresp;
  // Interrupt output
  wire                              interrupt;
  wire                              sys_clk_p;
  wire                              sys_clk_n;
  wire                              mmcm_clk;
  wire                              clk_ref_p;
  wire                              clk_ref_n;
  wire [11:0]                       device_temp;
  wire [11:0]                       device_temp_i;
  // Debug port signals
  wire                              dbg_idel_down_all;
  wire                              dbg_idel_down_cpt;
  wire                              dbg_idel_up_all;
  wire                              dbg_idel_up_cpt;
  wire                              dbg_sel_all_idel_cpt;
  wire [DQS_CNT_WIDTH-1:0]          dbg_sel_idel_cpt;
  wire                              dbg_sel_pi_incdec;
  wire [DQS_CNT_WIDTH:0]            dbg_byte_sel;
  wire                              dbg_pi_f_inc;
  wire                              dbg_pi_f_dec;
  wire [5:0]                        dbg_pi_counter_read_val;
  wire [8:0]                        dbg_po_counter_read_val;
  wire [(6*DQS_WIDTH*RANKS)-1:0]      dbg_cpt_tap_cnt;
  wire [(5*DQS_WIDTH*RANKS)-1:0]      dbg_dq_idelay_tap_cnt;
  wire [255:0]                      dbg_calib_top;
  wire [(6*DQS_WIDTH*RANKS)-1:0]      dbg_cpt_first_edge_cnt;
  wire [(6*DQS_WIDTH*RANKS)-1:0]      dbg_cpt_second_edge_cnt;
  wire [(6*RANKS)-1:0]                dbg_rd_data_offset;
  wire [255:0]                      dbg_phy_rdlvl;
  wire [99:0]                       dbg_phy_wrcal;
  wire [(6*DQS_WIDTH)-1:0]            dbg_final_po_fine_tap_cnt;
  wire [(3*DQS_WIDTH)-1:0]            dbg_final_po_coarse_tap_cnt;
  wire [255:0]                      dbg_phy_wrlvl;
  wire [255:0]                      dbg_phy_init;
  wire [255:0]                      dbg_prbs_rdlvl;
  wire [255:0]                      dbg_dqs_found_cal;
  wire                              dbg_pi_phaselock_start;
  wire                              dbg_pi_phaselocked_done;
  wire                              dbg_pi_phaselock_err;
  wire                              dbg_pi_dqsfound_start;
  wire                              dbg_pi_dqsfound_done;
  wire                              dbg_pi_dqsfound_err;
  wire                              dbg_wrcal_start;
  wire                              dbg_wrcal_done;
  wire                              dbg_wrcal_err;
  wire [11:0]                       dbg_pi_dqs_found_lanes_phy4lanes;
  wire [11:0]                       dbg_pi_phase_locked_phy4lanes;
  wire                              dbg_oclkdelay_calib_start;
  wire                              dbg_oclkdelay_calib_done;
  wire [255:0]                      dbg_phy_oclkdelay_cal;
  wire [(DRAM_WIDTH*16)-1:0]         dbg_oclkdelay_rd_data;
  wire [DQS_WIDTH-1:0]              dbg_rd_data_edge_detect;
  wire [(2*nCK_PER_CLK*DQ_WIDTH)-1:0] dbg_rddata;
  wire                              dbg_rddata_valid;
  wire [1:0]                        dbg_rdlvl_done;
  wire [1:0]                        dbg_rdlvl_err;
  wire [1:0]                        dbg_rdlvl_start;
  wire [(6*DQS_WIDTH)-1:0]            dbg_wrlvl_fine_tap_cnt;
  wire [(3*DQS_WIDTH)-1:0]            dbg_wrlvl_coarse_tap_cnt;
  wire [5:0]                        dbg_tap_cnt_during_wrlvl;
  wire                              dbg_wl_edge_detect_valid;
  wire                              dbg_wrlvl_done;
  wire                              dbg_wrlvl_err;
  wire                              dbg_wrlvl_start;
  reg [63:0]                        dbg_rddata_r;
  reg                               dbg_rddata_valid_r;
  wire [53:0]                       ocal_tap_cnt;
  wire [4:0]                        dbg_dqs;
  wire [8:0]                        dbg_bit;
  wire [8:0]                        rd_data_edge_detect_r;
  wire [53:0]                       wl_po_fine_cnt;
  wire [26:0]                       wl_po_coarse_cnt;
  wire [(6*RANKS)-1:0]                dbg_calib_rd_data_offset_1;
  wire [(6*RANKS)-1:0]                dbg_calib_rd_data_offset_2;
  wire [5:0]                        dbg_data_offset;
  wire [5:0]                        dbg_data_offset_1;
  wire [5:0]                        dbg_data_offset_2;
  wire [390:0]                      ddr2_ila_wrpath_int;
  wire [1023:0]                     ddr2_ila_rdpath_int;
  wire [119:0]                      ddr2_ila_basic_int;
  wire [(6*DQS_WIDTH*RANKS)-1:0] dbg_prbs_final_dqs_tap_cnt_r_int;
  wire [(6*DQS_WIDTH*RANKS)-1:0] dbg_prbs_first_edge_taps_int;
  wire [(6*DQS_WIDTH*RANKS)-1:0] dbg_prbs_second_edge_taps_int;
  assign ui_clk = clk;
  assign ui_clk_sync_rst = rst;
  assign sys_clk_p = 1'b0;
  assign sys_clk_n = 1'b0;
  assign clk_ref_p = 1'b0;
  assign clk_ref_n = 1'b0;
  generate
    if (REFCLK_TYPE == "USE_SYSTEM_CLOCK")
      assign clk_ref_in = mmcm_clk;
    else
      assign clk_ref_in = clk_ref_i;
  endgenerate
  mig_7series_v4_0_iodelay_ctrl #
    (
     .TCQ                       (TCQ),
     .IODELAY_GRP0              (IODELAY_GRP0),
     .REFCLK_TYPE               (REFCLK_TYPE),
     .SYSCLK_TYPE               (SYSCLK_TYPE),
     .SYS_RST_PORT              (SYS_RST_PORT),
     .RST_ACT_LOW               (RST_ACT_LOW),
     .DIFF_TERM_REFCLK          (DIFF_TERM_REFCLK)
     )
    u_iodelay_ctrl
      (
       // Outputs
       .iodelay_ctrl_rdy (iodelay_ctrl_rdy),
       .sys_rst_o        (sys_rst_o),
       .clk_ref          (clk_ref),
       // Inputs
       .clk_ref_p        (clk_ref_p),
       .clk_ref_n        (clk_ref_n),
       .clk_ref_i        (clk_ref_in),
       .sys_rst          (sys_rst)
       );
  mig_7series_v4_0_clk_ibuf #
    (
     .SYSCLK_TYPE      (SYSCLK_TYPE),
     .DIFF_TERM_SYSCLK (DIFF_TERM_SYSCLK)
     )
    u_ddr2_clk_ibuf
      (
       .sys_clk_p        (sys_clk_p),
       .sys_clk_n        (sys_clk_n),
       .sys_clk_i        (sys_clk_i),
       .mmcm_clk         (mmcm_clk)
       );
  // Temperature monitoring logic
  generate
    if (TEMP_MON_EN == "ON") begin: temp_mon_enabled
      mig_7series_v4_0_tempmon #
        (
         .TCQ              (TCQ),
         .TEMP_MON_CONTROL (TEMP_MON_CONTROL),
         .XADC_CLK_PERIOD  (XADC_CLK_PERIOD),
         .tTEMPSAMPLE      (tTEMPSAMPLE)
         )
        u_tempmon
          (
           .clk            (clk),
           .xadc_clk       (clk_ref[0]),
           .rst            (rst),
           .device_temp_i  (device_temp_i),
           .device_temp    (device_temp)
          );
    end else begin: temp_mon_disabled
      assign device_temp = 'b0;
    end
  endgenerate
  mig_7series_v4_0_infrastructure #
    (
     .TCQ                (TCQ),
     .nCK_PER_CLK        (nCK_PER_CLK),
     .CLKIN_PERIOD       (CLKIN_PERIOD),
     .SYSCLK_TYPE        (SYSCLK_TYPE),
     .CLKFBOUT_MULT      (CLKFBOUT_MULT),
     .DIVCLK_DIVIDE      (DIVCLK_DIVIDE),
     .CLKOUT0_PHASE      (CLKOUT0_PHASE),
     .CLKOUT0_DIVIDE     (CLKOUT0_DIVIDE),
     .CLKOUT1_DIVIDE     (CLKOUT1_DIVIDE),
     .CLKOUT2_DIVIDE     (CLKOUT2_DIVIDE),
     .CLKOUT3_DIVIDE     (CLKOUT3_DIVIDE),
     .MMCM_VCO           (MMCM_VCO),
     .MMCM_MULT_F        (MMCM_MULT_F),
     .MMCM_DIVCLK_DIVIDE (MMCM_DIVCLK_DIVIDE),
     .RST_ACT_LOW        (RST_ACT_LOW),
     .tCK                (tCK),
     .MEM_TYPE           (DRAM_TYPE)
     )
    u_ddr2_infrastructure
      (
       // Outputs
       .rstdiv0          (rst),
       .clk              (clk),
       .clk_div2         (clk_div2),
       .rst_div2         (rst_div2),
       .mem_refclk       (mem_refclk),
       .freq_refclk      (freq_refclk),
       .sync_pulse       (sync_pulse),
       .mmcm_ps_clk      (mmcm_ps_clk),
       .poc_sample_pd    (poc_sample_pd),
       .psdone           (psdone),
       .iddr_rst         (iddr_rst),
//       .auxout_clk       (),
       .ui_addn_clk_0    (),
       .ui_addn_clk_1    (),
       .ui_addn_clk_2    (),
       .ui_addn_clk_3    (),
       .ui_addn_clk_4    (),
       .pll_locked       (pll_locked),
       .mmcm_locked      (mmcm_locked),
       .rst_phaser_ref   (rst_phaser_ref),
       // Inputs
       .psen             (psen),
       .psincdec         (psincdec),
       .mmcm_clk         (mmcm_clk),
       .sys_rst          (sys_rst_o),
       .iodelay_ctrl_rdy (iodelay_ctrl_rdy),
       .ref_dll_lock     (ref_dll_lock)
       );
  mig_7series_v4_0_memc_ui_top_axi #
    (
     .TCQ                              (TCQ),
     .ADDR_CMD_MODE                    (ADDR_CMD_MODE),
     .AL                               (AL),
     .PAYLOAD_WIDTH                    (PAYLOAD_WIDTH),
     .BANK_WIDTH                       (BANK_WIDTH),
     .BM_CNT_WIDTH                     (BM_CNT_WIDTH),
     .BURST_MODE                       (BURST_MODE),
     .BURST_TYPE                       (BURST_TYPE),
     .CK_WIDTH                         (CK_WIDTH),
     .COL_WIDTH                        (COL_WIDTH),
     .CMD_PIPE_PLUS1                   (CMD_PIPE_PLUS1),
     .CS_WIDTH                         (CS_WIDTH),
     .nCS_PER_RANK                     (nCS_PER_RANK),
     .CKE_WIDTH                        (CKE_WIDTH),
     .DATA_WIDTH                       (DATA_WIDTH),
     .DATA_BUF_ADDR_WIDTH              (DATA_BUF_ADDR_WIDTH),
     .DM_WIDTH                         (DM_WIDTH),
     .DQ_CNT_WIDTH                     (DQ_CNT_WIDTH),
     .DQ_WIDTH                         (DQ_WIDTH),
     .DQS_CNT_WIDTH                    (DQS_CNT_WIDTH),
     .DQS_WIDTH                        (DQS_WIDTH),
     .DRAM_TYPE                        (DRAM_TYPE),
     .DRAM_WIDTH                       (DRAM_WIDTH),
     .ECC                              (ECC),
     .ECC_WIDTH                        (ECC_WIDTH),
     .ECC_TEST                         (ECC_TEST),
     .MC_ERR_ADDR_WIDTH                (MC_ERR_ADDR_WIDTH),
     .REFCLK_FREQ                      (REFCLK_FREQ),
     .nAL                              (nAL),
     .nBANK_MACHS                      (nBANK_MACHS),
     .CKE_ODT_AUX                      (CKE_ODT_AUX),
     .nCK_PER_CLK                      (nCK_PER_CLK),
     .ORDERING                         (ORDERING),
     .OUTPUT_DRV                       (OUTPUT_DRV),
     .IBUF_LPWR_MODE                   (IBUF_LPWR_MODE),
     .DATA_IO_IDLE_PWRDWN              (DATA_IO_IDLE_PWRDWN),
     .BANK_TYPE                        (BANK_TYPE),
     .DATA_IO_PRIM_TYPE                (DATA_IO_PRIM_TYPE),
     .IODELAY_GRP0                     (IODELAY_GRP0),
     .REG_CTRL                         (REG_CTRL),
     .RTT_NOM                          (RTT_NOM),
     .CL                               (CL),
     .tCK                              (tCK),
     .tCKE                             (tCKE),
     .tFAW                             (tFAW),
     .tPRDI                            (tPRDI),
     .tRAS                             (tRAS),
     .tRCD                             (tRCD),
     .tREFI                            (tREFI),
     .tRFC                             (tRFC),
     .tRP                              (tRP),
     .tRRD                             (tRRD),
     .tRTP                             (tRTP),
     .tWTR                             (tWTR),
     .tZQI                             (tZQI),
     .tZQCS                            (tZQCS),
     .USER_REFRESH                     (USER_REFRESH),
     .TEMP_MON_EN                      (TEMP_MON_EN),
     .WRLVL                            (WRLVL),
     .DEBUG_PORT                       (DEBUG_PORT),
     .CAL_WIDTH                        (CAL_WIDTH),
     .RANK_WIDTH                       (RANK_WIDTH),
     .RANKS                            (RANKS),
     .ODT_WIDTH                        (ODT_WIDTH),
     .ROW_WIDTH                        (ROW_WIDTH),
     .ADDR_WIDTH                       (ADDR_WIDTH),
     .APP_DATA_WIDTH                   (APP_DATA_WIDTH),
     .APP_MASK_WIDTH                   (APP_MASK_WIDTH),
     .SIM_BYPASS_INIT_CAL              (SIM_BYPASS_INIT_CAL),
     .BYTE_LANES_B0                    (BYTE_LANES_B0),
     .BYTE_LANES_B1                    (BYTE_LANES_B1),
     .BYTE_LANES_B2                    (BYTE_LANES_B2),
     .BYTE_LANES_B3                    (BYTE_LANES_B3),
     .BYTE_LANES_B4                    (BYTE_LANES_B4),
     .DATA_CTL_B0                      (DATA_CTL_B0),
     .DATA_CTL_B1                      (DATA_CTL_B1),
     .DATA_CTL_B2                      (DATA_CTL_B2),
     .DATA_CTL_B3                      (DATA_CTL_B3),
     .DATA_CTL_B4                      (DATA_CTL_B4),
     .PHY_0_BITLANES                   (PHY_0_BITLANES),
     .PHY_1_BITLANES                   (PHY_1_BITLANES),
     .PHY_2_BITLANES                   (PHY_2_BITLANES),
     .CK_BYTE_MAP                      (CK_BYTE_MAP),
     .ADDR_MAP                         (ADDR_MAP),
     .BANK_MAP                         (BANK_MAP),
     .CAS_MAP                          (CAS_MAP),
     .CKE_ODT_BYTE_MAP                 (CKE_ODT_BYTE_MAP),
     .CKE_MAP                          (CKE_MAP),
     .ODT_MAP                          (ODT_MAP),
     .CS_MAP                           (CS_MAP),
     .PARITY_MAP                       (PARITY_MAP),
     .RAS_MAP                          (RAS_MAP),
     .WE_MAP                           (WE_MAP),
     .DQS_BYTE_MAP                     (DQS_BYTE_MAP),
     .DATA0_MAP                        (DATA0_MAP),
     .DATA1_MAP                        (DATA1_MAP),
     .DATA2_MAP                        (DATA2_MAP),
     .DATA3_MAP                        (DATA3_MAP),
     .DATA4_MAP                        (DATA4_MAP),
     .DATA5_MAP                        (DATA5_MAP),
     .DATA6_MAP                        (DATA6_MAP),
     .DATA7_MAP                        (DATA7_MAP),
     .DATA8_MAP                        (DATA8_MAP),
     .DATA9_MAP                        (DATA9_MAP),
     .DATA10_MAP                       (DATA10_MAP),
     .DATA11_MAP                       (DATA11_MAP),
     .DATA12_MAP                       (DATA12_MAP),
     .DATA13_MAP                       (DATA13_MAP),
     .DATA14_MAP                       (DATA14_MAP),
     .DATA15_MAP                       (DATA15_MAP),
     .DATA16_MAP                       (DATA16_MAP),
     .DATA17_MAP                       (DATA17_MAP),
     .MASK0_MAP                        (MASK0_MAP),
     .MASK1_MAP                        (MASK1_MAP),
     .CALIB_ROW_ADD                    (CALIB_ROW_ADD),
     .CALIB_COL_ADD                    (CALIB_COL_ADD),
     .CALIB_BA_ADD                     (CALIB_BA_ADD),
     .IDELAY_ADJ                       ("OFF"),
     .FINE_PER_BIT                     ("OFF"),
     .CENTER_COMP_MODE                 ("OFF"),
     .PI_VAL_ADJ                       ("OFF"),
     .SLOT_0_CONFIG                    (SLOT_0_CONFIG),
     .SLOT_1_CONFIG                    (SLOT_1_CONFIG),
     .MEM_ADDR_ORDER                   (MEM_ADDR_ORDER),
     .STARVE_LIMIT                     (STARVE_LIMIT),
     .C_S_AXI_ID_WIDTH                 (C_S_AXI_ID_WIDTH),
     .C_S_AXI_ADDR_WIDTH               (C_S_AXI_ADDR_WIDTH),
     .C_S_AXI_DATA_WIDTH               (C_S_AXI_DATA_WIDTH),
     .C_S_AXI_SUPPORTS_NARROW_BURST    (C_S_AXI_SUPPORTS_NARROW_BURST),
     .C_RD_WR_ARB_ALGORITHM            (C_RD_WR_ARB_ALGORITHM),
     .C_S_AXI_REG_EN0                  (C_S_AXI_REG_EN0),
     .C_S_AXI_REG_EN1                  (C_S_AXI_REG_EN1),
     .C_S_AXI_CTRL_ADDR_WIDTH          (C_S_AXI_CTRL_ADDR_WIDTH),
     .C_S_AXI_CTRL_DATA_WIDTH          (C_S_AXI_CTRL_DATA_WIDTH),
     .C_S_AXI_BASEADDR                 (C_S_AXI_BASEADDR),
     .C_ECC_ONOFF_RESET_VALUE          (C_ECC_ONOFF_RESET_VALUE),
     .C_ECC_CE_COUNTER_WIDTH           (C_ECC_CE_COUNTER_WIDTH),
     .USE_CS_PORT                      (USE_CS_PORT),
     .USE_DM_PORT                      (USE_DM_PORT),
     .USE_ODT_PORT                     (USE_ODT_PORT),
     .MASTER_PHY_CTL                   (PHY_CONTROL_MASTER_BANK),
     .TAPSPERKCLK                      (TAPSPERKCLK),
     .SKIP_CALIB                       ("FALSE"),
     .FPGA_VOLT_TYPE                   ("N")
     )
    u_memc_ui_top_axi
      (
       .clk                              (clk),
       .clk_div2                         (clk_div2),
       .rst_div2                         (rst_div2),
       .clk_ref                          (clk_ref),
       .mem_refclk                       (mem_refclk), //memory clock
       .freq_refclk                      (freq_refclk),
       .pll_lock                         (pll_locked),
       .sync_pulse                       (sync_pulse),
       .mmcm_ps_clk                      (mmcm_ps_clk),
       .poc_sample_pd                    (poc_sample_pd),
       .psdone                           (psdone),
       .iddr_rst                         (iddr_rst),
       .psen                             (psen),
       .psincdec                         (psincdec),
       .rst                              (rst),
       .rst_phaser_ref                   (rst_phaser_ref),
       .ref_dll_lock                     (ref_dll_lock),
// Memory interface ports
       .ddr_dq                           (ddr2_dq),
       .ddr_dqs_n                        (ddr2_dqs_n),
       .ddr_dqs                          (ddr2_dqs_p),
       .ddr_addr                         (ddr2_addr),
       .ddr_ba                           (ddr2_ba),
       .ddr_cas_n                        (ddr2_cas_n),
       .ddr_ck_n                         (ddr2_ck_n),
       .ddr_ck                           (ddr2_ck_p),
       .ddr_cke                          (ddr2_cke),
       .ddr_cs_n                         (ddr2_cs_n),
       .ddr_dm                           (ddr2_dm),
       .ddr_odt                          (ddr2_odt),
       .ddr_ras_n                        (ddr2_ras_n),
       .ddr_reset_n                      (ddr2_reset_n),
       .ddr_parity                       (ddr2_parity),
       .ddr_we_n                         (ddr2_we_n),
       .bank_mach_next                   (bank_mach_next),
// Application interface ports
       .app_ecc_multiple_err_o           (),
       .app_ecc_single_err               (),
       .device_temp                      (device_temp),
       .calib_tap_req                    (),
       .calib_tap_load                   (1'b0),
       .calib_tap_addr                   (7'b0),
       .calib_tap_val                    (8'b0),
       .calib_tap_load_done              (1'b0),
// Debug logic ports
       .dbg_idel_up_all                  (dbg_idel_up_all),
       .dbg_idel_down_all                (dbg_idel_down_all),
       .dbg_idel_up_cpt                  (dbg_idel_up_cpt),
       .dbg_idel_down_cpt                (dbg_idel_down_cpt),
       .dbg_sel_idel_cpt                 (dbg_sel_idel_cpt),
       .dbg_sel_all_idel_cpt             (dbg_sel_all_idel_cpt),
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
       .dbg_calib_top                    (dbg_calib_top),
       .dbg_cpt_first_edge_cnt           (dbg_cpt_first_edge_cnt),
       .dbg_cpt_second_edge_cnt          (dbg_cpt_second_edge_cnt),
       .dbg_rd_data_offset               (dbg_rd_data_offset),
       .dbg_phy_rdlvl                    (dbg_phy_rdlvl),
       .dbg_phy_wrcal                    (dbg_phy_wrcal),
       .dbg_final_po_fine_tap_cnt        (dbg_final_po_fine_tap_cnt),
       .dbg_final_po_coarse_tap_cnt      (dbg_final_po_coarse_tap_cnt),
       .dbg_rd_data_edge_detect          (dbg_rd_data_edge_detect),
       .dbg_rddata                       (dbg_rddata),
       .dbg_rddata_valid                 (dbg_rddata_valid),
       .dbg_rdlvl_done                   (dbg_rdlvl_done),
       .dbg_rdlvl_err                    (dbg_rdlvl_err),
       .dbg_rdlvl_start                  (dbg_rdlvl_start),
       .dbg_wrlvl_fine_tap_cnt           (dbg_wrlvl_fine_tap_cnt),
       .dbg_wrlvl_coarse_tap_cnt         (dbg_wrlvl_coarse_tap_cnt),
       .dbg_tap_cnt_during_wrlvl         (dbg_tap_cnt_during_wrlvl),
       .dbg_wl_edge_detect_valid         (dbg_wl_edge_detect_valid),
       .dbg_wrlvl_done                   (dbg_wrlvl_done),
       .dbg_wrlvl_err                    (dbg_wrlvl_err),
       .dbg_wrlvl_start                  (dbg_wrlvl_start),
       .dbg_phy_wrlvl                    (dbg_phy_wrlvl),
       .dbg_phy_init                     (dbg_phy_init),
       .dbg_prbs_rdlvl                   (dbg_prbs_rdlvl),
       .dbg_pi_counter_read_val          (dbg_pi_counter_read_val),
       .dbg_po_counter_read_val          (dbg_po_counter_read_val),
       .dbg_prbs_final_dqs_tap_cnt_r     (dbg_prbs_final_dqs_tap_cnt_r_int),
       .dbg_prbs_first_edge_taps         (dbg_prbs_first_edge_taps_int),
       .dbg_prbs_second_edge_taps        (dbg_prbs_second_edge_taps_int),
       .dbg_pi_phaselock_start           (dbg_pi_phaselock_start),
       .dbg_pi_phaselocked_done          (dbg_pi_phaselocked_done),
       .dbg_pi_phaselock_err             (dbg_pi_phaselock_err),
       .dbg_pi_phase_locked_phy4lanes    (dbg_pi_phase_locked_phy4lanes),
       .dbg_pi_dqsfound_start            (dbg_pi_dqsfound_start),
       .dbg_pi_dqsfound_done             (dbg_pi_dqsfound_done),
       .dbg_pi_dqsfound_err              (dbg_pi_dqsfound_err),
       .dbg_pi_dqs_found_lanes_phy4lanes (dbg_pi_dqs_found_lanes_phy4lanes),
       .dbg_calib_rd_data_offset_1       (dbg_calib_rd_data_offset_1),
       .dbg_calib_rd_data_offset_2       (dbg_calib_rd_data_offset_2),
       .dbg_data_offset                  (dbg_data_offset),
       .dbg_data_offset_1                (dbg_data_offset_1),
       .dbg_data_offset_2                (dbg_data_offset_2),
       .dbg_wrcal_start                  (dbg_wrcal_start),
       .dbg_wrcal_done                   (dbg_wrcal_done),
       .dbg_wrcal_err                    (dbg_wrcal_err),
       .dbg_phy_oclkdelay_cal            (dbg_phy_oclkdelay_cal),
       .dbg_oclkdelay_rd_data            (dbg_oclkdelay_rd_data),
       .dbg_oclkdelay_calib_start        (dbg_oclkdelay_calib_start),
       .dbg_oclkdelay_calib_done         (dbg_oclkdelay_calib_done),
       .dbg_dqs_found_cal                (dbg_dqs_found_cal),
       .aresetn                          (aresetn),
       .app_sr_req                       (1'b0),
       .app_sr_active                    (app_sr_active),
       .app_ref_req                      (1'b0),
       .app_ref_ack                      (app_ref_ack),
       .app_zq_req                       (1'b0),
       .app_zq_ack                       (app_zq_ack),
       // Slave Interface Write Address Ports
       .s_axi_awid                       (s_axi_awid),
       .s_axi_awaddr                     (s_axi_awaddr),
       .s_axi_awlen                      (s_axi_awlen),
       .s_axi_awsize                     (s_axi_awsize),
       .s_axi_awburst                    (s_axi_awburst),
       .s_axi_awlock                     (s_axi_awlock),
       .s_axi_awcache                    (s_axi_awcache),
       .s_axi_awprot                     (s_axi_awprot),
       .s_axi_awqos                      (s_axi_awqos),
       .s_axi_awvalid                    (s_axi_awvalid),
       .s_axi_awready                    (s_axi_awready),
       // Slave Interface Write Data Ports
       .s_axi_wdata                      (s_axi_wdata),
       .s_axi_wstrb                      (s_axi_wstrb),
       .s_axi_wlast                      (s_axi_wlast),
       .s_axi_wvalid                     (s_axi_wvalid),
       .s_axi_wready                     (s_axi_wready),
       // Slave Interface Write Response Ports
       .s_axi_bid                        (s_axi_bid),
       .s_axi_bresp                      (s_axi_bresp),
       .s_axi_bvalid                     (s_axi_bvalid),
       .s_axi_bready                     (s_axi_bready),
       // Slave Interface Read Address Ports
       .s_axi_arid                       (s_axi_arid),
       .s_axi_araddr                     (s_axi_araddr),
       .s_axi_arlen                      (s_axi_arlen),
       .s_axi_arsize                     (s_axi_arsize),
       .s_axi_arburst                    (s_axi_arburst),
       .s_axi_arlock                     (s_axi_arlock),
       .s_axi_arcache                    (s_axi_arcache),
       .s_axi_arprot                     (s_axi_arprot),
       .s_axi_arqos                      (s_axi_arqos),
       .s_axi_arvalid                    (s_axi_arvalid),
       .s_axi_arready                    (s_axi_arready),
       // Slave Interface Read Data Ports
       .s_axi_rid                        (s_axi_rid),
       .s_axi_rdata                      (s_axi_rdata),
       .s_axi_rresp                      (s_axi_rresp),
       .s_axi_rlast                      (s_axi_rlast),
       .s_axi_rvalid                     (s_axi_rvalid),
       .s_axi_rready                     (s_axi_rready),
       // AXI CTRL port
       .s_axi_ctrl_awvalid               (s_axi_ctrl_awvalid),
       .s_axi_ctrl_awready               (s_axi_ctrl_awready),
       .s_axi_ctrl_awaddr                (s_axi_ctrl_awaddr),
       // Slave Interface Write Data Ports
       .s_axi_ctrl_wvalid                (s_axi_ctrl_wvalid),
       .s_axi_ctrl_wready                (s_axi_ctrl_wready),
       .s_axi_ctrl_wdata                 (s_axi_ctrl_wdata),
       // Slave Interface Write Response Ports
       .s_axi_ctrl_bvalid                (s_axi_ctrl_bvalid),
       .s_axi_ctrl_bready                (s_axi_ctrl_bready),
       .s_axi_ctrl_bresp                 (s_axi_ctrl_bresp),
       // Slave Interface Read Address Ports
       .s_axi_ctrl_arvalid               (s_axi_ctrl_arvalid),
       .s_axi_ctrl_arready               (s_axi_ctrl_arready),
       .s_axi_ctrl_araddr                (s_axi_ctrl_araddr),
       // Slave Interface Read Data Ports
       .s_axi_ctrl_rvalid                (s_axi_ctrl_rvalid),
       .s_axi_ctrl_rready                (s_axi_ctrl_rready),
       .s_axi_ctrl_rdata                 (s_axi_ctrl_rdata),
       .s_axi_ctrl_rresp                 (s_axi_ctrl_rresp),
       // Interrupt output
       .interrupt                        (interrupt),
       .init_calib_complete              (init_calib_complete),
       .dbg_poc                          (dbg_poc)
       );
   // Resetting all RTL debug inputs as the debug ports are not enabled
   assign dbg_idel_down_all    = 1'b0;
   assign dbg_idel_down_cpt    = 1'b0;
   assign dbg_idel_up_all      = 1'b0;
   assign dbg_idel_up_cpt      = 1'b0;
   assign dbg_sel_all_idel_cpt = 1'b0;
   assign dbg_sel_idel_cpt     = 'b0;
   assign dbg_byte_sel         = 'd0;
   assign dbg_sel_pi_incdec    = 1'b0;
   assign dbg_pi_f_inc         = 1'b0;
   assign dbg_pi_f_dec         = 1'b0;
   assign dbg_po_f_inc         = 'b0;
   assign dbg_po_f_dec         = 'b0;
   assign dbg_po_f_stg23_sel   = 'b0;
   assign dbg_sel_po_incdec    = 'b0;
endmodule