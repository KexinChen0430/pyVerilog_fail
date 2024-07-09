module
   generate
     if(CKE_ODT_AUX == "TRUE") begin
       assign aux_out_map = ((DRAM_TYPE == "DDR2") && (RANKS == 1)) ?
       {mux_aux_out[1],mux_aux_out[1],mux_aux_out[1],mux_aux_out[0]} :
            mux_aux_out;
     end else begin
       assign aux_out_map = 4'b0000 ;
     end
  endgenerate
  assign init_calib_complete = phy_init_data_sel;
  assign phy_mc_ctl_full  = phy_ctl_full;
  assign phy_mc_cmd_full  = phy_cmd_full;
  assign phy_mc_data_full = phy_pre_data_a_full;
  // Generate parity for DDR3 RDIMM.
  generate
    if ((DRAM_TYPE == "DDR3") && (REG_CTRL == "ON")) begin: gen_ddr3_parity
      if (nCK_PER_CLK == 4) begin
        always @(posedge clk) begin
          parity[0] <= #TCQ (^{mux_address[(ROW_WIDTH*4)-1:ROW_WIDTH*3],
                               mux_bank[(BANK_WIDTH*4)-1:BANK_WIDTH*3],
                               mux_cas_n[3], mux_ras_n[3], mux_we_n[3]});
        end
        always @(*) begin
          parity[1] = (^{mux_address[ROW_WIDTH-1:0], mux_bank[BANK_WIDTH-1:0],
                         mux_cas_n[0],mux_ras_n[0], mux_we_n[0]});
          parity[2] = (^{mux_address[(ROW_WIDTH*2)-1:ROW_WIDTH],
                         mux_bank[(BANK_WIDTH*2)-1:BANK_WIDTH],
                         mux_cas_n[1], mux_ras_n[1], mux_we_n[1]});
          parity[3] = (^{mux_address[(ROW_WIDTH*3)-1:ROW_WIDTH*2],
                         mux_bank[(BANK_WIDTH*3)-1:BANK_WIDTH*2],
                         mux_cas_n[2],mux_ras_n[2], mux_we_n[2]});
        end
      end else begin
        always @(posedge clk) begin
        parity[0] <= #TCQ(^{mux_address[(ROW_WIDTH*2)-1:ROW_WIDTH],
                            mux_bank[(BANK_WIDTH*2)-1:BANK_WIDTH],
                            mux_cas_n[1], mux_ras_n[1], mux_we_n[1]});
        end
        always @(*) begin
          parity[1] = (^{mux_address[ROW_WIDTH-1:0],
                         mux_bank[BANK_WIDTH-1:0],
                         mux_cas_n[0], mux_ras_n[0], mux_we_n[0]});
        end
      end
    end else begin: gen_ddr3_noparity
      if (nCK_PER_CLK == 4) begin
        always @(posedge clk) begin
          parity[0] <= #TCQ 1'b0;
          parity[1] <= #TCQ 1'b0;
          parity[2] <= #TCQ 1'b0;
          parity[3] <= #TCQ 1'b0;
        end
      end else begin
        always @(posedge clk) begin
          parity[0] <= #TCQ 1'b0;
          parity[1] <= #TCQ 1'b0;
        end
      end
    end
  endgenerate
  // Code for optional register stage in read path to MC for timing
  generate
    if(RD_PATH_REG == 1)begin:RD_REG_TIMING
      always @(posedge clk)begin
        rddata_valid_reg <= #TCQ phy_rddata_valid_w;
        rd_data_reg <= #TCQ rd_data_map;
      end // always @ (posedge clk)
    end else begin : RD_REG_NO_TIMING // block: RD_REG_TIMING
      always @(phy_rddata_valid_w or rd_data_map)begin
        rddata_valid_reg = phy_rddata_valid_w;
        rd_data_reg = rd_data_map;
      end
    end
  endgenerate
  assign phy_rddata_valid = rddata_valid_reg;
  assign phy_rd_data = rd_data_reg;
  // Hard PHY and accompanying bit mapping logic
  mig_7series_v2_0_ddr_mc_phy_wrapper #
    (
     .TCQ                (TCQ),
     .tCK                (tCK),
     .BANK_TYPE          (BANK_TYPE),
     .DATA_IO_PRIM_TYPE  (DATA_IO_PRIM_TYPE),
     .DATA_IO_IDLE_PWRDWN(DATA_IO_IDLE_PWRDWN),
     .IODELAY_GRP        (IODELAY_GRP),
     .nCK_PER_CLK        (nCK_PER_CLK),
     .nCS_PER_RANK       (nCS_PER_RANK),
     .BANK_WIDTH         (BANK_WIDTH),
     .CKE_WIDTH          (CKE_WIDTH),
     .CS_WIDTH           (CS_WIDTH),
     .CK_WIDTH           (CK_WIDTH),
     .LP_DDR_CK_WIDTH    (LP_DDR_CK_WIDTH),
     .DDR2_DQSN_ENABLE   (DDR2_DQSN_ENABLE),
     .CWL                (CWL),
     .DM_WIDTH           (DM_WIDTH),
     .DQ_WIDTH           (DQ_WIDTH),
     .DQS_CNT_WIDTH      (DQS_CNT_WIDTH),
     .DQS_WIDTH          (DQS_WIDTH),
     .DRAM_TYPE          (DRAM_TYPE),
     .RANKS              (RANKS),
     .ODT_WIDTH          (ODT_WIDTH),
     .REG_CTRL           (REG_CTRL),
     .ROW_WIDTH          (ROW_WIDTH),
     .USE_CS_PORT        (USE_CS_PORT),
     .USE_DM_PORT        (USE_DM_PORT),
     .USE_ODT_PORT       (USE_ODT_PORT),
     .IBUF_LPWR_MODE     (IBUF_LPWR_MODE),
     .PHYCTL_CMD_FIFO    (PHYCTL_CMD_FIFO),
     .DATA_CTL_B0        (DATA_CTL_B0),
     .DATA_CTL_B1        (DATA_CTL_B1),
     .DATA_CTL_B2        (DATA_CTL_B2),
     .DATA_CTL_B3        (DATA_CTL_B3),
     .DATA_CTL_B4        (DATA_CTL_B4),
     .BYTE_LANES_B0      (BYTE_LANES_B0),
     .BYTE_LANES_B1      (BYTE_LANES_B1),
     .BYTE_LANES_B2      (BYTE_LANES_B2),
     .BYTE_LANES_B3      (BYTE_LANES_B3),
     .BYTE_LANES_B4      (BYTE_LANES_B4),
     .PHY_0_BITLANES     (PHY_0_BITLANES),
     .PHY_1_BITLANES     (PHY_1_BITLANES),
     .PHY_2_BITLANES     (PHY_2_BITLANES),
     .HIGHEST_BANK       (HIGHEST_BANK),
     .HIGHEST_LANE       (HIGHEST_LANE),
     .CK_BYTE_MAP        (CK_BYTE_MAP),
     .ADDR_MAP           (ADDR_MAP),
     .BANK_MAP           (BANK_MAP),
     .CAS_MAP            (CAS_MAP),
     .CKE_ODT_BYTE_MAP   (CKE_ODT_BYTE_MAP),
     .CKE_MAP            (CKE_MAP),
     .ODT_MAP            (ODT_MAP),
     .CKE_ODT_AUX        (CKE_ODT_AUX),
     .CS_MAP             (CS_MAP),
     .PARITY_MAP         (PARITY_MAP),
     .RAS_MAP            (RAS_MAP),
     .WE_MAP             (WE_MAP),
     .DQS_BYTE_MAP       (DQS_BYTE_MAP),
     .DATA0_MAP          (DATA0_MAP),
     .DATA1_MAP          (DATA1_MAP),
     .DATA2_MAP          (DATA2_MAP),
     .DATA3_MAP          (DATA3_MAP),
     .DATA4_MAP          (DATA4_MAP),
     .DATA5_MAP          (DATA5_MAP),
     .DATA6_MAP          (DATA6_MAP),
     .DATA7_MAP          (DATA7_MAP),
     .DATA8_MAP          (DATA8_MAP),
     .DATA9_MAP          (DATA9_MAP),
     .DATA10_MAP         (DATA10_MAP),
     .DATA11_MAP         (DATA11_MAP),
     .DATA12_MAP         (DATA12_MAP),
     .DATA13_MAP         (DATA13_MAP),
     .DATA14_MAP         (DATA14_MAP),
     .DATA15_MAP         (DATA15_MAP),
     .DATA16_MAP         (DATA16_MAP),
     .DATA17_MAP         (DATA17_MAP),
     .MASK0_MAP          (MASK0_MAP),
     .MASK1_MAP          (MASK1_MAP),
     .SIM_CAL_OPTION     (SIM_CAL_OPTION),
     .MASTER_PHY_CTL     (MASTER_PHY_CTL)
     )
    u_ddr_mc_phy_wrapper
      (
       .rst                 (rst),
       .clk                 (clk),
       // For memory frequencies between 400~1066 MHz freq_refclk = mem_refclk
       // For memory frequencies below 400 MHz mem_refclk = mem_refclk and
       // freq_refclk = 2x or 4x mem_refclk such that it remains in the
       // 400~1066 MHz range
       .freq_refclk         (freq_refclk),
       .mem_refclk          (mem_refclk),
       .pll_lock            (pll_lock),
       .sync_pulse          (sync_pulse),
       .idelayctrl_refclk   (clk_ref),
       .phy_cmd_wr_en       (mux_cmd_wren),
       .phy_data_wr_en      (mux_wrdata_en),
       // phy_ctl_wd = {ACTPRE[31:30],EventDelay[29:25],seq[24:23],
       //               DataOffset[22:17],HiIndex[16:15],LowIndex[14:12],
       //               AuxOut[11:8],ControlOffset[7:3],PHYCmd[2:0]}
       // The fields ACTPRE, and BankCount are only used
       // when the hard PHY counters are used by the MC.
       .phy_ctl_wd             ({5'd0, mux_cas_slot, calib_seq, mux_data_offset,
                                 mux_rank_cnt, 3'd0, aux_out_map,
                                 5'd0, mux_cmd}),
       .phy_ctl_wr             (mux_ctl_wren),
       .phy_if_empty_def       (phy_if_empty_def),
       .phy_if_reset           (phy_if_reset),
       .data_offset_1          (mux_data_offset_1),
       .data_offset_2          (mux_data_offset_2),
       .aux_in_1               (aux_out_map),
       .aux_in_2               (aux_out_map),
       .idelaye2_init_val      (idelaye2_init_val),
       .oclkdelay_init_val     (oclkdelay_init_val),
       .if_empty               (if_empty),
       .phy_ctl_full           (phy_ctl_full),
       .phy_cmd_full           (phy_cmd_full),
       .phy_data_full          (phy_data_full),
       .phy_pre_data_a_full    (phy_pre_data_a_full),
       .ddr_clk                (ddr_clk),
       .phy_mc_go              (phy_mc_go),
       .phy_write_calib        (phy_write_calib),
       .phy_read_calib         (phy_read_calib),
       .po_fine_enable         (po_enstg2_f),
       .po_coarse_enable       (po_enstg2_c),
       .po_fine_inc            (po_stg2_fincdec),
       .po_coarse_inc          (po_stg2_cincdec),
       .po_counter_load_en     (po_counter_load_en),
       .po_counter_read_en     (1'b1),
       .po_sel_fine_oclk_delay (po_sel_stg2stg3),
       .po_counter_load_val    (),
       .po_counter_read_val    (po_counter_read_val),
       .pi_rst_dqs_find        (rst_stg1_cal),
       .pi_fine_enable         (pi_enstg2_f),
       .pi_fine_inc            (pi_stg2_fincdec),
       .pi_counter_load_en     (pi_stg2_load),
       .pi_counter_load_val    (pi_stg2_reg_l),
       .pi_counter_read_val    (pi_counter_read_val),
       .idelay_ce              (idelay_ce),
       .idelay_inc             (idelay_inc),
       .idelay_ld              (idelay_ld),
       .pi_phase_locked        (pi_phase_locked),
       .pi_phase_locked_all    (pi_phase_locked_all),
       .pi_dqs_found           (pi_found_dqs),
       .pi_dqs_found_all       (pi_dqs_found_all),
       // Currently not being used. May be used in future if periodic reads
       // become a requirement. This output could also be used to signal a
       // catastrophic failure in read capture and the need for re-cal
       .pi_dqs_out_of_range    (pi_dqs_out_of_range),
       .phy_init_data_sel      (phy_init_data_sel),
       .calib_sel              (calib_sel),
       .calib_in_common        (calib_in_common),
       .calib_zero_inputs      (calib_zero_inputs),
       .calib_zero_ctrl        (calib_zero_ctrl),
       .mux_address            (mux_address),
       .mux_bank               (mux_bank),
       .mux_cs_n               (mux_cs_n),
       .mux_ras_n              (mux_ras_n),
       .mux_cas_n              (mux_cas_n),
       .mux_we_n               (mux_we_n),
       .mux_reset_n            (mux_reset_n),
       .parity_in              (parity),
       .mux_wrdata             (mux_wrdata),
       .mux_wrdata_mask        (mux_wrdata_mask),
       .mux_odt                (mux_odt),
       .mux_cke		       (mux_cke),
       .idle  	               (idle),
       .rd_data                (rd_data_map),
       .ddr_addr               (ddr_addr),
       .ddr_ba                 (ddr_ba),
       .ddr_cas_n              (ddr_cas_n),
       .ddr_cke                (ddr_cke),
       .ddr_cs_n               (ddr_cs_n),
       .ddr_dm                 (ddr_dm),
       .ddr_odt                (ddr_odt),
       .ddr_parity             (ddr_parity),
       .ddr_ras_n              (ddr_ras_n),
       .ddr_we_n               (ddr_we_n),
       .ddr_dq                 (ddr_dq),
       .ddr_dqs                (ddr_dqs),
       .ddr_dqs_n              (ddr_dqs_n),
       .ddr_reset_n            (ddr_reset_n),
       .dbg_pi_counter_read_en (1'b1),
       .ref_dll_lock           (ref_dll_lock),
       .rst_phaser_ref         (rst_phaser_ref),
       .dbg_pi_phase_locked_phy4lanes (dbg_pi_phase_locked_phy4lanes),
       .dbg_pi_dqs_found_lanes_phy4lanes (dbg_pi_dqs_found_lanes_phy4lanes)
       );
  // Soft memory initialization and calibration logic
  mig_7series_v2_0_ddr_calib_top #
    (
     .TCQ              (TCQ),
     .DDR3_VDD_OP_VOLT (DDR3_VDD_OP_VOLT),
     .nCK_PER_CLK      (nCK_PER_CLK),
     .PRE_REV3ES       (PRE_REV3ES),
     .tCK              (tCK),
     .CLK_PERIOD       (CLK_PERIOD),
     .N_CTL_LANES      (N_CTL_LANES),
     .CTL_BYTE_LANE    (CTL_BYTE_LANE),
     .CTL_BANK         (CTL_BANK),
     .DRAM_TYPE        (DRAM_TYPE),
     .PRBS_WIDTH       (8),
     .DQS_BYTE_MAP     (DQS_BYTE_MAP),
     .HIGHEST_BANK     (HIGHEST_BANK),
     .BANK_TYPE        (BANK_TYPE),
     .HIGHEST_LANE     (HIGHEST_LANE),
     .BYTE_LANES_B0    (BYTE_LANES_B0),
     .BYTE_LANES_B1    (BYTE_LANES_B1),
     .BYTE_LANES_B2    (BYTE_LANES_B2),
     .BYTE_LANES_B3    (BYTE_LANES_B3),
     .BYTE_LANES_B4    (BYTE_LANES_B4),
     .DATA_CTL_B0      (DATA_CTL_B0),
     .DATA_CTL_B1      (DATA_CTL_B1),
     .DATA_CTL_B2      (DATA_CTL_B2),
     .DATA_CTL_B3      (DATA_CTL_B3),
     .DATA_CTL_B4      (DATA_CTL_B4),
     .SLOT_1_CONFIG    (SLOT_1_CONFIG),
     .BANK_WIDTH       (BANK_WIDTH),
     .CA_MIRROR        (CA_MIRROR),
     .COL_WIDTH        (COL_WIDTH),
     .CKE_ODT_AUX      (CKE_ODT_AUX),
     .nCS_PER_RANK     (nCS_PER_RANK),
     .DQ_WIDTH         (DQ_WIDTH),
     .DQS_CNT_WIDTH    (DQS_CNT_WIDTH),
     .DQS_WIDTH        (DQS_WIDTH),
     .DRAM_WIDTH       (DRAM_WIDTH),
     .ROW_WIDTH        (ROW_WIDTH),
     .RANKS            (RANKS),
     .CS_WIDTH         (CS_WIDTH),
     .CKE_WIDTH        (CKE_WIDTH),
     .DDR2_DQSN_ENABLE (DDR2_DQSN_ENABLE),
     .PER_BIT_DESKEW   ("OFF"),
     .CALIB_ROW_ADD    (CALIB_ROW_ADD),
     .CALIB_COL_ADD    (CALIB_COL_ADD),
     .CALIB_BA_ADD     (CALIB_BA_ADD),
     .AL               (AL),
     .BURST_MODE       (BURST_MODE),
     .BURST_TYPE       (BURST_TYPE),
     .nCL              (CL),
     .nCWL             (CWL),
     .tRFC             (tRFC),
     .OUTPUT_DRV       (OUTPUT_DRV),
     .REG_CTRL         (REG_CTRL),
     .ADDR_CMD_MODE    (ADDR_CMD_MODE),
     .RTT_NOM          (RTT_NOM),
     .RTT_WR           (RTT_WR),
     .WRLVL            (WRLVL_W),
     .USE_ODT_PORT     (USE_ODT_PORT),
     .SIM_INIT_OPTION  (SIM_INIT_OPTION),
     .SIM_CAL_OPTION   (SIM_CAL_OPTION),
     .DEBUG_PORT       (DEBUG_PORT)
     )
    u_ddr_calib_top
      (
       .clk                         (clk),
       .rst                         (rst),
       .tg_err                      (error),
       .rst_tg_mc                   (rst_tg_mc),
       .slot_0_present              (slot_0_present),
       .slot_1_present              (slot_1_present),
       // PHY Control Block and IN_FIFO status
       .phy_ctl_ready               (phy_mc_go),
       .phy_ctl_full                (1'b0),
       .phy_cmd_full                (1'b0),
       .phy_data_full               (1'b0),
       .phy_if_empty                (if_empty),
       .idelaye2_init_val           (idelaye2_init_val),
       .oclkdelay_init_val          (oclkdelay_init_val),
       // From calib logic To data IN_FIFO
       // DQ IDELAY tap value from Calib logic
       // port to be added to mc_phy by Gary
       .dlyval_dq                   (),
       // hard PHY calibration modes
       .write_calib                 (phy_write_calib),
       .read_calib                  (phy_read_calib),
       // DQS count and ck/addr/cmd to be mapped to calib_sel
       // based on parameter that defines placement of ctl lanes
       // and DQS byte groups in each bank. When phy_write_calib
       // is de-asserted calib_sel should select CK/addr/cmd/ctl.
       .calib_sel                   (calib_sel),
       .calib_in_common             (calib_in_common),
       .calib_zero_inputs           (calib_zero_inputs),
       .calib_zero_ctrl             (calib_zero_ctrl),
       .phy_if_empty_def            (phy_if_empty_def),
       .phy_if_reset                (phy_if_reset),
       // Signals from calib logic to be MUXED with MC
       // signals before sending to hard PHY
       .calib_ctl_wren              (calib_ctl_wren),
       .calib_cmd_wren              (calib_cmd_wren),
       .calib_seq                   (calib_seq),
       .calib_aux_out               (calib_aux_out),
       .calib_odt	            (calib_odt),
       .calib_cke		    (calib_cke),
       .calib_cmd                   (calib_cmd),
       .calib_wrdata_en             (calib_wrdata_en),
       .calib_rank_cnt              (calib_rank_cnt),
       .calib_cas_slot              (calib_cas_slot),
       .calib_data_offset_0         (calib_data_offset_0),
       .calib_data_offset_1         (calib_data_offset_1),
       .calib_data_offset_2         (calib_data_offset_2),
       .phy_reset_n                 (phy_reset_n),
       .phy_address                 (phy_address),
       .phy_bank                    (phy_bank),
       .phy_cs_n                    (phy_cs_n),
       .phy_ras_n                   (phy_ras_n),
       .phy_cas_n                   (phy_cas_n),
       .phy_we_n                    (phy_we_n),
       .phy_wrdata                  (phy_wrdata),
       // DQS Phaser_IN calibration/status signals
       .pi_phaselocked              (pi_phase_locked),
       .pi_phase_locked_all         (pi_phase_locked_all),
       .pi_found_dqs                (pi_found_dqs),
       .pi_dqs_found_all            (pi_dqs_found_all),
       .pi_dqs_found_lanes          (dbg_pi_dqs_found_lanes_phy4lanes),
       .pi_rst_stg1_cal             (rst_stg1_cal),
       .pi_en_stg2_f                (pi_enstg2_f),
       .pi_stg2_f_incdec            (pi_stg2_fincdec),
       .pi_stg2_load                (pi_stg2_load),
       .pi_stg2_reg_l               (pi_stg2_reg_l),
       .pi_counter_read_val      (pi_counter_read_val),
       .device_temp                 (device_temp),
       .tempmon_sample_en           (tempmon_sample_en),
       // IDELAY tap enable and inc signals
       .idelay_ce                   (idelay_ce),
       .idelay_inc                  (idelay_inc),
       .idelay_ld                   (idelay_ld),
       // DQS Phaser_OUT calibration/status signals
       .po_sel_stg2stg3             (po_sel_stg2stg3),
       .po_stg2_c_incdec            (po_stg2_cincdec),
       .po_en_stg2_c                (po_enstg2_c),
       .po_stg2_f_incdec            (po_stg2_fincdec),
       .po_en_stg2_f                (po_enstg2_f),
       .po_counter_load_en          (po_counter_load_en),
       .po_counter_read_val         (po_counter_read_val),
       // From data IN_FIFO To Calib logic and MC/UI
       .phy_rddata                  (rd_data_map),
       // From calib logic To MC
       .phy_rddata_valid            (phy_rddata_valid_w),
       .calib_rd_data_offset_0      (calib_rd_data_offset_0),
       .calib_rd_data_offset_1      (calib_rd_data_offset_1),
       .calib_rd_data_offset_2      (calib_rd_data_offset_2),
       .calib_writes                (),
       // Mem Init and Calibration status To MC
       .init_calib_complete         (phy_init_data_sel),
       .init_wrcal_complete         (init_wrcal_complete),
       // Debug Error signals
       .pi_phase_locked_err         (dbg_pi_phaselock_err),
       .pi_dqsfound_err             (dbg_pi_dqsfound_err),
       .wrcal_err                   (dbg_wrcal_err),
       // Debug Signals
       .dbg_pi_phaselock_start      (dbg_pi_phaselock_start),
       .dbg_pi_dqsfound_start       (dbg_pi_dqsfound_start),
       .dbg_pi_dqsfound_done        (dbg_pi_dqsfound_done),
       .dbg_wrlvl_start             (dbg_wrlvl_start),
       .dbg_wrlvl_done              (dbg_wrlvl_done),
       .dbg_wrlvl_err               (dbg_wrlvl_err),
       .dbg_wrlvl_fine_tap_cnt      (dbg_wrlvl_fine_tap_cnt),
       .dbg_wrlvl_coarse_tap_cnt    (dbg_wrlvl_coarse_tap_cnt),
       .dbg_phy_wrlvl               (dbg_phy_wrlvl),
       .dbg_tap_cnt_during_wrlvl    (dbg_tap_cnt_during_wrlvl),
       .dbg_wl_edge_detect_valid    (dbg_wl_edge_detect_valid),
       .dbg_rd_data_edge_detect     (dbg_rd_data_edge_detect),
       .dbg_wrcal_start             (dbg_wrcal_start),
       .dbg_wrcal_done              (dbg_wrcal_done),
       .dbg_phy_wrcal               (dbg_phy_wrcal),
       .dbg_final_po_fine_tap_cnt   (dbg_final_po_fine_tap_cnt),
       .dbg_final_po_coarse_tap_cnt (dbg_final_po_coarse_tap_cnt),
       .dbg_rdlvl_start             (dbg_rdlvl_start),
       .dbg_rdlvl_done              (dbg_rdlvl_done),
       .dbg_rdlvl_err               (dbg_rdlvl_err),
       .dbg_cpt_first_edge_cnt      (dbg_cpt_first_edge_cnt),
       .dbg_cpt_second_edge_cnt     (dbg_cpt_second_edge_cnt),
       .dbg_cpt_tap_cnt             (dbg_cpt_tap_cnt),
       .dbg_dq_idelay_tap_cnt       (dbg_dq_idelay_tap_cnt),
       .dbg_sel_pi_incdec           (dbg_sel_pi_incdec),
       .dbg_sel_po_incdec           (dbg_sel_po_incdec),
       .dbg_byte_sel                (dbg_byte_sel),
       .dbg_pi_f_inc                (dbg_pi_f_inc),
       .dbg_pi_f_dec                (dbg_pi_f_dec),
       .dbg_po_f_inc                (dbg_po_f_inc),
       .dbg_po_f_stg23_sel          (dbg_po_f_stg23_sel),
       .dbg_po_f_dec                (dbg_po_f_dec),
       .dbg_idel_up_all             (dbg_idel_up_all),
       .dbg_idel_down_all           (dbg_idel_down_all),
       .dbg_idel_up_cpt             (dbg_idel_up_cpt),
       .dbg_idel_down_cpt           (dbg_idel_down_cpt),
       .dbg_sel_idel_cpt            (dbg_sel_idel_cpt),
       .dbg_sel_all_idel_cpt        (dbg_sel_all_idel_cpt),
       .dbg_phy_rdlvl               (dbg_phy_rdlvl),
       .dbg_calib_top               (dbg_calib_top),
       .dbg_phy_init                (dbg_phy_init),
       .dbg_prbs_rdlvl              (dbg_prbs_rdlvl),
       .dbg_dqs_found_cal           (dbg_dqs_found_cal),
       .dbg_phy_oclkdelay_cal       (dbg_phy_oclkdelay_cal),
       .dbg_oclkdelay_rd_data       (dbg_oclkdelay_rd_data),
       .dbg_oclkdelay_calib_start   (dbg_oclkdelay_calib_start),
       .dbg_oclkdelay_calib_done    (dbg_oclkdelay_calib_done)
       );
endmodule