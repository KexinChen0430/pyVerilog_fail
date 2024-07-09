module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					cyclone4_check ( .error(1'b1) );
		end
	endgenerate
	altpcie_hip_pipen1b_qsys #(
		.INTENDED_DEVICE_FAMILY              ("Cyclone IV GX"),
		.pcie_qsys                           (1),
		.p_pcie_hip_type                     ("2"),
		.lane_mask                           (8'b11111110),
		.max_link_width                      (1),
		.millisecond_cycle_count             ("125000"),
		.enable_gen2_core                    ("false"),
		.gen2_lane_rate_mode                 ("false"),
		.no_soft_reset                       ("false"),
		.core_clk_divider                    (2),
		.enable_ch0_pclk_out                 ("true"),
		.core_clk_source                     ("pclk"),
		.CB_P2A_AVALON_ADDR_B0               (0),
		.bar0_size_mask                      (15),
		.bar0_io_space                       ("false"),
		.bar0_64bit_mem_space                ("true"),
		.bar0_prefetchable                   ("true"),
		.CB_P2A_AVALON_ADDR_B1               (0),
		.bar1_size_mask                      (0),
		.bar1_io_space                       ("false"),
		.bar1_64bit_mem_space                ("true"),
		.bar1_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B2               (0),
		.bar2_size_mask                      (15),
		.bar2_io_space                       ("false"),
		.bar2_64bit_mem_space                ("false"),
		.bar2_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B3               (0),
		.bar3_size_mask                      (0),
		.bar3_io_space                       ("false"),
		.bar3_64bit_mem_space                ("false"),
		.bar3_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B4               (0),
		.bar4_size_mask                      (0),
		.bar4_io_space                       ("false"),
		.bar4_64bit_mem_space                ("false"),
		.bar4_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B5               (0),
		.bar5_size_mask                      (0),
		.bar5_io_space                       ("false"),
		.bar5_64bit_mem_space                ("false"),
		.bar5_prefetchable                   ("false"),
		.vendor_id                           (4466),
		.device_id                           (57345),
		.revision_id                         (1),
		.class_code                          (0),
		.subsystem_vendor_id                 (4466),
		.subsystem_device_id                 (4),
		.port_link_number                    (1),
		.msi_function_count                  (0),
		.enable_msi_64bit_addressing         ("true"),
		.enable_function_msix_support        ("false"),
		.eie_before_nfts_count               (4),
		.enable_completion_timeout_disable   ("false"),
		.completion_timeout                  ("NONE"),
		.enable_adapter_half_rate_mode       ("false"),
		.msix_pba_bir                        (0),
		.msix_pba_offset                     (0),
		.msix_table_bir                      (0),
		.msix_table_offset                   (0),
		.msix_table_size                     (0),
		.use_crc_forwarding                  ("false"),
		.surprise_down_error_support         ("false"),
		.dll_active_report_support           ("false"),
		.bar_io_window_size                  ("32BIT"),
		.bar_prefetchable                    (32),
		.hot_plug_support                    (7'b0000000),
		.no_command_completed                ("true"),
		.slot_power_limit                    (0),
		.slot_power_scale                    (0),
		.slot_number                         (0),
		.enable_slot_register                ("false"),
		.advanced_errors                     ("false"),
		.enable_ecrc_check                   ("false"),
		.enable_ecrc_gen                     ("false"),
		.max_payload_size                    (0),
		.retry_buffer_last_active_address    (255),
		.credit_buffer_allocation_aux        ("BALANCED"),
		.vc0_rx_flow_ctrl_posted_header      (28),
		.vc0_rx_flow_ctrl_posted_data        (198),
		.vc0_rx_flow_ctrl_nonposted_header   (30),
		.vc0_rx_flow_ctrl_nonposted_data     (0),
		.vc0_rx_flow_ctrl_compl_header       (48),
		.vc0_rx_flow_ctrl_compl_data         (256),
		.RX_BUF                              (10),
		.RH_NUM                              (7),
		.G_TAG_NUM0                          (32),
		.endpoint_l0_latency                 (0),
		.endpoint_l1_latency                 (0),
		.enable_l1_aspm                      ("false"),
		.l01_entry_latency                   (31),
		.diffclock_nfts_count                (255),
		.sameclock_nfts_count                (255),
		.l1_exit_latency_sameclock           (7),
		.l1_exit_latency_diffclock           (7),
		.l0_exit_latency_sameclock           (7),
		.l0_exit_latency_diffclock           (7),
		.gen2_diffclock_nfts_count           (255),
		.gen2_sameclock_nfts_count           (255),
		.CG_COMMON_CLOCK_MODE                (1),
		.CB_PCIE_MODE                        (0),
		.AST_LITE                            (0),
		.CB_PCIE_RX_LITE                     (0),
		.CG_RXM_IRQ_NUM                      (16),
		.CG_AVALON_S_ADDR_WIDTH              (31),
		.bypass_tl                           ("false"),
		.CG_IMPL_CRA_AV_SLAVE_PORT           (1),
		.CG_NO_CPL_REORDERING                (0),
		.CG_ENABLE_A2P_INTERRUPT             (0),
		.CG_IRQ_BIT_ENA                      (65535),
		.CB_A2P_ADDR_MAP_IS_FIXED            (1),
		.CB_A2P_ADDR_MAP_NUM_ENTRIES         (1),
		.CB_A2P_ADDR_MAP_PASS_THRU_BITS      (31),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW  (32'b00000000000000000000000000000000),
		.RXM_DATA_WIDTH                      (64),
		.RXM_BEN_WIDTH                       (8),
		.TL_SELECTION                        (1),
		.pcie_mode                           ("SHARED_MODE"),
		.single_rx_detect                    (1),
		.enable_coreclk_out_half_rate        ("false"),
		.low_priority_vc                     (0)
	) pcie_internal_hip (
		.npor                            (pcie_rstn_export),                                                     //               npor.interconect
		.dl_ltssm                        (pcie_internal_hip_dl_ltssm),                                           //       dl_ltssm_int.interconect
		.dlup_exit                       (pcie_internal_hip_dlup_exit_interconect),                              //          dlup_exit.interconect
		.hotrst_exit                     (pcie_internal_hip_hotrst_exit_interconect),                            //        hotrst_exit.interconect
		.l2_exit                         (pcie_internal_hip_l2_exit_interconect),                                //            l2_exit.interconect
		.powerdown0_ext                  (pcie_internal_hip_powerdown0_ext_interconect),                         //     powerdown0_ext.interconect
		.rate_ext                        (pcie_internal_hip_rate_ext_interconect),                               //           rate_ext.interconect
		.rc_rx_analogreset               (),                                                                     //  rc_rx_analogreset.interconect
		.rc_rx_digitalreset              (),                                                                     // rc_rx_digitalreset.interconect
		.rxpolarity0_ext                 (pcie_internal_hip_rxpolarity0_ext_interconect),                        //    rxpolarity0_ext.interconect
		.txcompl0_ext                    (pcie_internal_hip_txcompl0_ext_interconect),                           //       txcompl0_ext.interconect
		.txdata0_ext                     (pcie_internal_hip_txdata0_ext_interconect),                            //        txdata0_ext.interconect
		.txdatak0_ext                    (pcie_internal_hip_txdatak0_ext_interconect),                           //       txdatak0_ext.interconect
		.txdetectrx0_ext                 (pcie_internal_hip_txdetectrx0_ext_interconect),                        //    txdetectrx0_ext.interconect
		.txelecidle0_ext                 (pcie_internal_hip_txelecidle0_ext_interconect),                        //    txelecidle0_ext.interconect
		.crst                            (reset_controller_internal_crst_interconect),                           //               crst.interconect
		.pclk_central                    (pipe_interface_internal_pclk_central_hip_interconect),                 //       pclk_central.interconect
		.pclk_ch0                        (pipe_interface_internal_pclk_ch0_hip_interconect),                     //           pclk_ch0.interconect
		.pld_clk                         (pcie_core_clk_clk),                                                    //            pld_clk.clk
		.pll_fixed_clk                   (pipe_interface_internal_pll_fixed_clk_hip_interconect),                //      pll_fixed_clk.interconect
		.rc_areset                       (pipe_interface_internal_rc_areset_interconect),                        //          rc_areset.interconect
		.srst                            (reset_controller_internal_srst_interconect),                           //               srst.interconect
		.test_in                         (test_in_test_in),                                                      //            test_in.interconect
		.AvlClk_i                        (pcie_core_clk_clk),                                                    //         avalon_clk.clk
		.Rstn_i                          (~rst_controller_reset_out_reset),                                      //       avalon_reset.reset_n
		.TxsAddress_i                    (txs_address),                                                          //                Txs.address
		.TxsChipSelect_i                 (txs_chipselect),                                                       //                   .chipselect
		.TxsByteEnable_i                 (txs_byteenable),                                                       //                   .byteenable
		.TxsReadData_o                   (txs_readdata),                                                         //                   .readdata
		.TxsWriteData_i                  (txs_writedata),                                                        //                   .writedata
		.TxsRead_i                       (txs_read),                                                             //                   .read
		.TxsWrite_i                      (txs_write),                                                            //                   .write
		.TxsBurstCount_i                 (txs_burstcount),                                                       //                   .burstcount
		.TxsReadDataValid_o              (txs_readdatavalid),                                                    //                   .readdatavalid
		.TxsWaitRequest_o                (txs_waitrequest),                                                      //                   .waitrequest
		.CraChipSelect_i                 (cra_chipselect),                                                       //                Cra.chipselect
		.CraAddress_i                    (cra_address),                                                          //                   .address
		.CraByteEnable_i                 (cra_byteenable),                                                       //                   .byteenable
		.CraRead                         (cra_read),                                                             //                   .read
		.CraReadData_o                   (cra_readdata),                                                         //                   .readdata
		.CraWrite                        (cra_write),                                                            //                   .write
		.CraWriteData_i                  (cra_writedata),                                                        //                   .writedata
		.CraWaitRequest_o                (cra_waitrequest),                                                      //                   .waitrequest
		.CraIrq_o                        (cra_irq_irq),                                                          //             CraIrq.irq
		.core_clk_out                    (pcie_core_clk_clk),                                                    //      pcie_core_clk.clk
		.eidle_infer_sel                 (pcie_internal_hip_eidle_infer_sel),                                    //  eidle_infer_sel_0.interconect
		.tx_deemph_0                     (),                                                                     //        tx_deemph_0.interconect
		.tx_margin_0                     (),                                                                     //        tx_margin_0.interconect
		.phystatus0_ext                  (pipe_interface_internal_phystatus_hip_0_interconect),                  //     phystatus0_ext.interconect
		.rxdata0_ext                     (pipe_interface_internal_rxdata_hip_0_interconect),                     //        rxdata0_ext.interconect
		.rxdatak0_ext                    (pipe_interface_internal_rxdatak_hip_0_interconect),                    //       rxdatak0_ext.interconect
		.rxelecidle0_ext                 (pipe_interface_internal_rxelecidle_hip_0_interconect),                 //    rxelecidle0_ext.interconect
		.rxstatus0_ext                   (pipe_interface_internal_rxstatus_hip_0_interconect),                   //      rxstatus0_ext.interconect
		.rxvalid0_ext                    (pipe_interface_internal_rxvalid_hip_0_interconect),                    //       rxvalid0_ext.interconect
		.RxmAddress_0_o                  (bar1_0_address),                                                       //           Rxm_BAR0.address
		.RxmRead_0_o                     (bar1_0_read),                                                          //                   .read
		.RxmWaitRequest_0_i              (bar1_0_waitrequest),                                                   //                   .waitrequest
		.RxmWrite_0_o                    (bar1_0_write),                                                         //                   .write
		.RxmReadDataValid_0_i            (bar1_0_readdatavalid),                                                 //                   .readdatavalid
		.RxmReadData_0_i                 (bar1_0_readdata),                                                      //                   .readdata
		.RxmWriteData_0_o                (bar1_0_writedata),                                                     //                   .writedata
		.RxmBurstCount_0_o               (bar1_0_burstcount),                                                    //                   .burstcount
		.RxmByteEnable_0_o               (bar1_0_byteenable),                                                    //                   .byteenable
		.RxmAddress_2_o                  (bar2_address),                                                         //           Rxm_BAR2.address
		.RxmRead_2_o                     (bar2_read),                                                            //                   .read
		.RxmWaitRequest_2_i              (bar2_waitrequest),                                                     //                   .waitrequest
		.RxmWrite_2_o                    (bar2_write),                                                           //                   .write
		.RxmReadDataValid_2_i            (bar2_readdatavalid),                                                   //                   .readdatavalid
		.RxmReadData_2_i                 (bar2_readdata),                                                        //                   .readdata
		.RxmWriteData_2_o                (bar2_writedata),                                                       //                   .writedata
		.RxmBurstCount_2_o               (bar2_burstcount),                                                      //                   .burstcount
		.RxmByteEnable_2_o               (bar2_byteenable),                                                      //                   .byteenable
		.RxmIrq_i                        (rxm_irq_irq),                                                          //             RxmIrq.irq
		.app_int_ack                     (),                                                                     //        (terminated)
		.app_msi_ack                     (),                                                                     //        (terminated)
		.avs_pcie_reconfig_readdata      (),                                                                     //        (terminated)
		.avs_pcie_reconfig_readdatavalid (),                                                                     //        (terminated)
		.avs_pcie_reconfig_waitrequest   (),                                                                     //        (terminated)
		.derr_cor_ext_rcv0               (),                                                                     //        (terminated)
		.derr_cor_ext_rcv1               (),                                                                     //        (terminated)
		.derr_cor_ext_rpl                (),                                                                     //        (terminated)
		.derr_rpl                        (),                                                                     //        (terminated)
		.ev_128ns                        (),                                                                     //        (terminated)
		.ev_1us                          (),                                                                     //        (terminated)
		.hip_extraclkout                 (),                                                                     //        (terminated)
		.int_status                      (),                                                                     //        (terminated)
		.lmi_ack                         (),                                                                     //        (terminated)
		.lmi_dout                        (),                                                                     //        (terminated)
		.npd_alloc_1cred_vc0             (),                                                                     //        (terminated)
		.npd_alloc_1cred_vc1             (),                                                                     //        (terminated)
		.npd_cred_vio_vc0                (),                                                                     //        (terminated)
		.npd_cred_vio_vc1                (),                                                                     //        (terminated)
		.nph_alloc_1cred_vc0             (),                                                                     //        (terminated)
		.nph_alloc_1cred_vc1             (),                                                                     //        (terminated)
		.nph_cred_vio_vc0                (),                                                                     //        (terminated)
		.nph_cred_vio_vc1                (),                                                                     //        (terminated)
		.pme_to_sr                       (),                                                                     //        (terminated)
		.powerdown1_ext                  (),                                                                     //        (terminated)
		.powerdown2_ext                  (),                                                                     //        (terminated)
		.powerdown3_ext                  (),                                                                     //        (terminated)
		.powerdown4_ext                  (),                                                                     //        (terminated)
		.powerdown5_ext                  (),                                                                     //        (terminated)
		.powerdown6_ext                  (),                                                                     //        (terminated)
		.powerdown7_ext                  (),                                                                     //        (terminated)
		.r2c_err0                        (),                                                                     //        (terminated)
		.r2c_err1                        (),                                                                     //        (terminated)
		.rc_gxb_powerdown                (),                                                                     //        (terminated)
		.rc_tx_digitalreset              (),                                                                     //        (terminated)
		.reset_status                    (),                                                                     //        (terminated)
		.rx_fifo_empty0                  (),                                                                     //        (terminated)
		.rx_fifo_empty1                  (),                                                                     //        (terminated)
		.rx_fifo_full0                   (),                                                                     //        (terminated)
		.rx_fifo_full1                   (),                                                                     //        (terminated)
		.rx_st_bardec0                   (),                                                                     //        (terminated)
		.rx_st_bardec1                   (),                                                                     //        (terminated)
		.rx_st_be0                       (),                                                                     //        (terminated)
		.rx_st_be0_p1                    (),                                                                     //        (terminated)
		.rx_st_be1                       (),                                                                     //        (terminated)
		.rx_st_be1_p1                    (),                                                                     //        (terminated)
		.rx_st_data0                     (),                                                                     //        (terminated)
		.rx_st_data0_p1                  (),                                                                     //        (terminated)
		.rx_st_data1                     (),                                                                     //        (terminated)
		.rx_st_data1_p1                  (),                                                                     //        (terminated)
		.rx_st_eop0                      (),                                                                     //        (terminated)
		.rx_st_eop0_p1                   (),                                                                     //        (terminated)
		.rx_st_eop1                      (),                                                                     //        (terminated)
		.rx_st_eop1_p1                   (),                                                                     //        (terminated)
		.rx_st_err0                      (),                                                                     //        (terminated)
		.rx_st_err1                      (),                                                                     //        (terminated)
		.rx_st_sop0                      (),                                                                     //        (terminated)
		.rx_st_sop0_p1                   (),                                                                     //        (terminated)
		.rx_st_sop1                      (),                                                                     //        (terminated)
		.rx_st_sop1_p1                   (),                                                                     //        (terminated)
		.rx_st_valid0                    (),                                                                     //        (terminated)
		.rx_st_valid1                    (),                                                                     //        (terminated)
		.rxpolarity1_ext                 (),                                                                     //        (terminated)
		.rxpolarity2_ext                 (),                                                                     //        (terminated)
		.rxpolarity3_ext                 (),                                                                     //        (terminated)
		.rxpolarity4_ext                 (),                                                                     //        (terminated)
		.rxpolarity5_ext                 (),                                                                     //        (terminated)
		.rxpolarity6_ext                 (),                                                                     //        (terminated)
		.rxpolarity7_ext                 (),                                                                     //        (terminated)
		.serr_out                        (),                                                                     //        (terminated)
		.suc_spd_neg                     (),                                                                     //        (terminated)
		.swdn_wake                       (),                                                                     //        (terminated)
		.swup_hotrst                     (),                                                                     //        (terminated)
		.tl_cfg_add                      (),                                                                     //        (terminated)
		.tl_cfg_ctl                      (),                                                                     //        (terminated)
		.tl_cfg_ctl_wr                   (),                                                                     //        (terminated)
		.tl_cfg_sts                      (),                                                                     //        (terminated)
		.tl_cfg_sts_wr                   (),                                                                     //        (terminated)
		.tlbp_dl_ack_phypm               (),                                                                     //        (terminated)
		.tlbp_dl_ack_requpfc             (),                                                                     //        (terminated)
		.tlbp_dl_ack_sndupfc             (),                                                                     //        (terminated)
		.tlbp_dl_current_deemp           (),                                                                     //        (terminated)
		.tlbp_dl_currentspeed            (),                                                                     //        (terminated)
		.tlbp_dl_dll_req                 (),                                                                     //        (terminated)
		.tlbp_dl_err_dll                 (),                                                                     //        (terminated)
		.tlbp_dl_errphy                  (),                                                                     //        (terminated)
		.tlbp_dl_link_autobdw_status     (),                                                                     //        (terminated)
		.tlbp_dl_link_bdwmng_status      (),                                                                     //        (terminated)
		.tlbp_dl_rpbuf_emp               (),                                                                     //        (terminated)
		.tlbp_dl_rst_enter_comp_bit      (),                                                                     //        (terminated)
		.tlbp_dl_rst_tx_margin_field     (),                                                                     //        (terminated)
		.tlbp_dl_rx_typ_pm               (),                                                                     //        (terminated)
		.tlbp_dl_rx_valpm                (),                                                                     //        (terminated)
		.tlbp_dl_tx_ackpm                (),                                                                     //        (terminated)
		.tlbp_dl_up                      (),                                                                     //        (terminated)
		.tlbp_dl_vc_status               (),                                                                     //        (terminated)
		.tlbp_link_up                    (),                                                                     //        (terminated)
		.tx_cred0                        (),                                                                     //        (terminated)
		.tx_cred1                        (),                                                                     //        (terminated)
		.tx_fifo_empty0                  (),                                                                     //        (terminated)
		.tx_fifo_empty1                  (),                                                                     //        (terminated)
		.tx_fifo_full0                   (),                                                                     //        (terminated)
		.tx_fifo_full1                   (),                                                                     //        (terminated)
		.tx_fifo_rdptr0                  (),                                                                     //        (terminated)
		.tx_fifo_rdptr1                  (),                                                                     //        (terminated)
		.tx_fifo_wrptr0                  (),                                                                     //        (terminated)
		.tx_fifo_wrptr1                  (),                                                                     //        (terminated)
		.tx_st_ready0                    (),                                                                     //        (terminated)
		.tx_st_ready1                    (),                                                                     //        (terminated)
		.txcompl1_ext                    (),                                                                     //        (terminated)
		.txcompl2_ext                    (),                                                                     //        (terminated)
		.txcompl3_ext                    (),                                                                     //        (terminated)
		.txcompl4_ext                    (),                                                                     //        (terminated)
		.txcompl5_ext                    (),                                                                     //        (terminated)
		.txcompl6_ext                    (),                                                                     //        (terminated)
		.txcompl7_ext                    (),                                                                     //        (terminated)
		.txdata1_ext                     (),                                                                     //        (terminated)
		.txdata2_ext                     (),                                                                     //        (terminated)
		.txdata3_ext                     (),                                                                     //        (terminated)
		.txdata4_ext                     (),                                                                     //        (terminated)
		.txdata5_ext                     (),                                                                     //        (terminated)
		.txdata6_ext                     (),                                                                     //        (terminated)
		.txdata7_ext                     (),                                                                     //        (terminated)
		.txdatak1_ext                    (),                                                                     //        (terminated)
		.txdatak2_ext                    (),                                                                     //        (terminated)
		.txdatak3_ext                    (),                                                                     //        (terminated)
		.txdatak4_ext                    (),                                                                     //        (terminated)
		.txdatak5_ext                    (),                                                                     //        (terminated)
		.txdatak6_ext                    (),                                                                     //        (terminated)
		.txdatak7_ext                    (),                                                                     //        (terminated)
		.txdetectrx1_ext                 (),                                                                     //        (terminated)
		.txdetectrx2_ext                 (),                                                                     //        (terminated)
		.txdetectrx3_ext                 (),                                                                     //        (terminated)
		.txdetectrx4_ext                 (),                                                                     //        (terminated)
		.txdetectrx5_ext                 (),                                                                     //        (terminated)
		.txdetectrx6_ext                 (),                                                                     //        (terminated)
		.txdetectrx7_ext                 (),                                                                     //        (terminated)
		.txelecidle1_ext                 (),                                                                     //        (terminated)
		.txelecidle2_ext                 (),                                                                     //        (terminated)
		.txelecidle3_ext                 (),                                                                     //        (terminated)
		.txelecidle4_ext                 (),                                                                     //        (terminated)
		.txelecidle5_ext                 (),                                                                     //        (terminated)
		.txelecidle6_ext                 (),                                                                     //        (terminated)
		.txelecidle7_ext                 (),                                                                     //        (terminated)
		.use_pcie_reconfig               (),                                                                     //        (terminated)
		.wake_oen                        (),                                                                     //        (terminated)
		.aer_msi_num                     (5'b00000),                                                             //        (terminated)
		.app_int_sts                     (1'b0),                                                                 //        (terminated)
		.app_msi_num                     (5'b00000),                                                             //        (terminated)
		.app_msi_req                     (1'b0),                                                                 //        (terminated)
		.app_msi_tc                      (3'b000),                                                               //        (terminated)
		.avs_pcie_reconfig_address       (8'b00000000),                                                          //        (terminated)
		.avs_pcie_reconfig_chipselect    (1'b0),                                                                 //        (terminated)
		.avs_pcie_reconfig_clk           (1'b0),                                                                 //        (terminated)
		.avs_pcie_reconfig_read          (1'b0),                                                                 //        (terminated)
		.avs_pcie_reconfig_rstn          (1'b0),                                                                 //        (terminated)
		.avs_pcie_reconfig_write         (1'b0),                                                                 //        (terminated)
		.avs_pcie_reconfig_writedata     (16'b0000000000000000),                                                 //        (terminated)
		.core_clk_in                     (1'b0),                                                                 //        (terminated)
		.cpl_err                         (7'b0000000),                                                           //        (terminated)
		.cpl_pending                     (1'b0),                                                                 //        (terminated)
		.dbg_pipex1_rx                   (15'b000000000000000),                                                  //        (terminated)
		.hpg_ctrler                      (5'b00000),                                                             //        (terminated)
		.lmi_addr                        (12'b000000000000),                                                     //        (terminated)
		.lmi_din                         (32'b00000000000000000000000000000000),                                 //        (terminated)
		.lmi_rden                        (1'b0),                                                                 //        (terminated)
		.lmi_wren                        (1'b0),                                                                 //        (terminated)
		.mode                            (2'b00),                                                                //        (terminated)
		.pex_msi_num                     (5'b00000),                                                             //        (terminated)
		.pm_auxpwr                       (1'b0),                                                                 //        (terminated)
		.pm_data                         (10'b0000000000),                                                       //        (terminated)
		.pm_event                        (1'b0),                                                                 //        (terminated)
		.pme_to_cr                       (1'b0),                                                                 //        (terminated)
		.rc_inclk_eq_125mhz              (1'b0),                                                                 //        (terminated)
		.rc_pll_locked                   (1'b1),                                                                 //        (terminated)
		.rc_rx_pll_locked_one            (1'b1),                                                                 //        (terminated)
		.rx_st_mask0                     (1'b0),                                                                 //        (terminated)
		.rx_st_mask1                     (1'b0),                                                                 //        (terminated)
		.rx_st_ready0                    (1'b0),                                                                 //        (terminated)
		.rx_st_ready1                    (1'b0),                                                                 //        (terminated)
		.swdn_in                         (3'b000),                                                               //        (terminated)
		.swup_in                         (7'b0000000),                                                           //        (terminated)
		.tl_slotclk_cfg                  (1'b1),                                                                 //        (terminated)
		.tlbp_dl_aspm_cr0                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_comclk_reg              (1'b0),                                                                 //        (terminated)
		.tlbp_dl_ctrl_link2              (13'b0000000000000),                                                    //        (terminated)
		.tlbp_dl_data_upfc               (12'b000000000000),                                                     //        (terminated)
		.tlbp_dl_hdr_upfc                (8'b00000000),                                                          //        (terminated)
		.tlbp_dl_inh_dllp                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_maxpload_dcr            (3'b000),                                                               //        (terminated)
		.tlbp_dl_req_phycfg              (4'b0000),                                                              //        (terminated)
		.tlbp_dl_req_phypm               (4'b0000),                                                              //        (terminated)
		.tlbp_dl_req_upfc                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_req_wake                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_rx_ecrcchk              (1'b0),                                                                 //        (terminated)
		.tlbp_dl_snd_upfc                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_tx_reqpm                (1'b0),                                                                 //        (terminated)
		.tlbp_dl_tx_typpm                (3'b000),                                                               //        (terminated)
		.tlbp_dl_txcfg_extsy             (1'b0),                                                                 //        (terminated)
		.tlbp_dl_typ_upfc                (2'b00),                                                                //        (terminated)
		.tlbp_dl_vc_ctrl                 (8'b00000000),                                                          //        (terminated)
		.tlbp_dl_vcid_map                (24'b000000000000000000000000),                                         //        (terminated)
		.tlbp_dl_vcid_upfc               (3'b000),                                                               //        (terminated)
		.tx_st_data0                     (64'b0000000000000000000000000000000000000000000000000000000000000000), //        (terminated)
		.tx_st_data0_p1                  (64'b0000000000000000000000000000000000000000000000000000000000000000), //        (terminated)
		.tx_st_data1                     (64'b0000000000000000000000000000000000000000000000000000000000000000), //        (terminated)
		.tx_st_data1_p1                  (64'b0000000000000000000000000000000000000000000000000000000000000000), //        (terminated)
		.tx_st_eop0                      (1'b0),                                                                 //        (terminated)
		.tx_st_eop0_p1                   (1'b0),                                                                 //        (terminated)
		.tx_st_eop1                      (1'b0),                                                                 //        (terminated)
		.tx_st_eop1_p1                   (1'b0),                                                                 //        (terminated)
		.tx_st_err0                      (1'b0),                                                                 //        (terminated)
		.tx_st_err1                      (1'b0),                                                                 //        (terminated)
		.tx_st_sop0                      (1'b0),                                                                 //        (terminated)
		.tx_st_sop0_p1                   (1'b0),                                                                 //        (terminated)
		.tx_st_sop1                      (1'b0),                                                                 //        (terminated)
		.tx_st_sop1_p1                   (1'b0),                                                                 //        (terminated)
		.tx_st_valid0                    (1'b0),                                                                 //        (terminated)
		.tx_st_valid1                    (1'b0),                                                                 //        (terminated)
		.phystatus1_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata1_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak1_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle1_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus1_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid1_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus2_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata2_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak2_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle2_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus2_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid2_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus3_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata3_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak3_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle3_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus3_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid3_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus4_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata4_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak4_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle4_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus4_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid4_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus5_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata5_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak5_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle5_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus5_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid5_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus6_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata6_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak6_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle6_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus6_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid6_ext                    (1'b0),                                                                 //        (terminated)
		.phystatus7_ext                  (1'b0),                                                                 //        (terminated)
		.rxdata7_ext                     (8'b00000000),                                                          //        (terminated)
		.rxdatak7_ext                    (1'b0),                                                                 //        (terminated)
		.rxelecidle7_ext                 (1'b0),                                                                 //        (terminated)
		.rxstatus7_ext                   (3'b000),                                                               //        (terminated)
		.rxvalid7_ext                    (1'b0)                                                                  //        (terminated)
	);
	amm_master_qsys_with_pcie_pcie_ip_altgx_internal altgx_internal (
		.cal_blk_clk            (cal_blk_clk_clk),                                              //            cal_blk_clk.clk
		.gxb_powerdown          (pipe_interface_internal_gxb_powerdown_pcs_interconect),        //          gxb_powerdown.interconect
		.pipe8b10binvpolarity   (pipe_interface_internal_rxpolarity_pcs_interconect),           //   pipe8b10binvpolarity.interconect
		.pll_inclk              (refclk_export),                                                //              pll_inclk.interconect
		.powerdn                (pipe_interface_internal_powerdown_pcs_interconect),            //                powerdn.interconect
		.rx_analogreset         (reset_controller_internal_rxanalogreset_interconect),          //         rx_analogreset.interconect
		.fixedclk               (fixedclk_clk),                                                 //        fixedclk_export.clk
		.reconfig_togxb         (reconfig_togxb_data),                                          //           togxb_export.data
		.reconfig_fromgxb       (reconfig_fromgxb_0_data),                                      //       fromgxb_export_0.data
		.reconfig_clk           (reconfig_gxbclk_clk),                                          //    reconfig_clk_export.clk
		.rx_dataout             (altgx_internal_rx_dataout_interconect),                        //             rx_dataout.interconect
		.rx_digitalreset        (reset_controller_internal_rx_digitalreset_serdes_interconect), //        rx_digitalreset.interconect
		.rx_elecidleinfersel_0  (pcie_internal_hip_eidle_infer_sel_0_interconect),              //  rx_elecidleinfersel_0.interconect
		.tx_ctrlenable          (pipe_interface_internal_txdatak_pcs_interconect),              //          tx_ctrlenable.interconect
		.tx_datain              (pipe_interface_internal_txdata_pcs_interconect),               //              tx_datain.interconect
		.tx_detectrxloop        (pipe_interface_internal_txdetectrx_pcs_interconect),           //        tx_detectrxloop.interconect
		.tx_forcedispcompliance (pipe_interface_internal_txcompl_pcs_interconect),              // tx_forcedispcompliance.interconect
		.tx_forceelecidle       (pipe_interface_internal_txelecidle_pcs_interconect),           //       tx_forceelecidle.interconect
		.hip_tx_clkout_0        (altgx_internal_hip_tx_clkout_0_interconect),                   //        hip_tx_clkout_0.interconect
		.pipedatavalid          (altgx_internal_pipedatavalid_interconect),                     //          pipedatavalid.interconect
		.pipephydonestatus      (altgx_internal_pipephydonestatus_interconect),                 //      pipephydonestatus.interconect
		.pipeelecidle           (altgx_internal_pipeelecidle_interconect),                      //           pipeelecidle.interconect
		.pipestatus             (altgx_internal_pipestatus_interconect),                        //             pipestatus.interconect
		.pll_locked             (altgx_internal_pll_locked_interconect),                        //             pll_locked.interconect
		.rx_ctrldetect          (altgx_internal_rx_ctrldetect_interconect),                     //          rx_ctrldetect.interconect
		.rx_freqlocked          (altgx_internal_rx_freqlocked_interconect),                     //          rx_freqlocked.interconect
		.tx_digitalreset        (reset_controller_internal_txdigitalreset_interconect),         //        tx_digitalreset.interconect
		.rx_datain_0            (rx_in_rx_datain_0),                                            //           rx_in_export.rx_datain_0
		.tx_dataout_0           (tx_out_tx_dataout_0)                                           //          tx_out_export.tx_dataout_0
	);
	altera_pcie_hard_ip_reset_controller #(
		.link_width (1),
		.cyclone4   (1)
	) reset_controller_internal (
		.clk250_export          (clocks_sim_clk250_export),                                     // reset_controller_export.clk250_export
		.clk500_export          (clocks_sim_clk500_export),                                     //                        .clk500_export
		.clk125_export          (clocks_sim_clk125_export),                                     //                        .clk125_export
		.busy_altgxb_reconfig   (reconfig_busy_busy_altgxb_reconfig),                           //    reconfig_busy_export.busy_altgxb_reconfig
		.pld_clk                (pcie_core_clk_clk),                                            //                 pld_clk.clk
		.reset_n_out            (pcie_core_reset_reset_n),                                      //             reset_n_out.reset_n
		.pcie_rstn              (pcie_rstn_export),                                             //               pcie_rstn.interconect
		.refclk                 (refclk_export),                                                //                  refclk.interconect
		.l2_exit                (pcie_internal_hip_l2_exit_interconect),                        //                 l2_exit.interconect
		.hotrst_exit            (pcie_internal_hip_hotrst_exit_interconect),                    //             hotrst_exit.interconect
		.dlup_exit              (pcie_internal_hip_dlup_exit_interconect),                      //               dlup_exit.interconect
		.ltssm                  (pcie_internal_hip_dl_ltssm_int_interconect),                   //                   ltssm.interconect
		.pll_locked             (pipe_interface_internal_rc_pll_locked_interconect),            //              pll_locked.interconect
		.rx_freqlocked          (altgx_internal_rx_freqlocked_interconect),                     //           rx_freqlocked.interconect
		.test_in                (test_in_test_in),                                              //                 test_in.interconect
		.srst                   (reset_controller_internal_srst_interconect),                   //                    srst.interconect
		.crst                   (reset_controller_internal_crst_interconect),                   //                    crst.interconect
		.rx_digitalreset_serdes (reset_controller_internal_rx_digitalreset_serdes_interconect), //  rx_digitalreset_serdes.interconect
		.txdigitalreset         (reset_controller_internal_txdigitalreset_interconect),         //          txdigitalreset.interconect
		.rxanalogreset          (reset_controller_internal_rxanalogreset_interconect),          //           rxanalogreset.interconect
		.clk250_out             (reset_controller_internal_clk250_out_interconect),             //              clk250_out.interconect
		.clk500_out             (reset_controller_internal_clk500_out_interconect),             //              clk500_out.interconect
		.rc_inclk_eq_125mhz     (1'b1),                                                         //             (terminated)
		.rx_pll_locked          (1'b0),                                                         //             (terminated)
		.rx_signaldetect        (1'b0)                                                          //             (terminated)
	);
	altpcie_pipe_interface #(
		.max_link_width      (1),
		.gen2_lane_rate_mode ("false"),
		.p_pcie_hip_type     ("2")
	) pipe_interface_internal (
		.pipe_mode               (pipe_ext_pipe_mode),                                    //   pipe_interface_export.pipe_mode
		.phystatus_ext           (pipe_ext_phystatus_ext),                                //                        .phystatus_ext
		.rate_ext                (pipe_ext_rate_ext),                                     //                        .rate_ext
		.powerdown_ext           (pipe_ext_powerdown_ext),                                //                        .powerdown_ext
		.txdetectrx_ext          (pipe_ext_txdetectrx_ext),                               //                        .txdetectrx_ext
		.rxelecidle0_ext         (pipe_ext_rxelecidle0_ext),                              //                        .rxelecidle0_ext
		.rxdata0_ext             (pipe_ext_rxdata0_ext),                                  //                        .rxdata0_ext
		.rxstatus0_ext           (pipe_ext_rxstatus0_ext),                                //                        .rxstatus0_ext
		.rxvalid0_ext            (pipe_ext_rxvalid0_ext),                                 //                        .rxvalid0_ext
		.rxdatak0_ext            (pipe_ext_rxdatak0_ext),                                 //                        .rxdatak0_ext
		.txdata0_ext             (pipe_ext_txdata0_ext),                                  //                        .txdata0_ext
		.txdatak0_ext            (pipe_ext_txdatak0_ext),                                 //                        .txdatak0_ext
		.rxpolarity0_ext         (pipe_ext_rxpolarity0_ext),                              //                        .rxpolarity0_ext
		.txcompl0_ext            (pipe_ext_txcompl0_ext),                                 //                        .txcompl0_ext
		.txelecidle0_ext         (pipe_ext_txelecidle0_ext),                              //                        .txelecidle0_ext
		.pll_powerdown           (powerdown_pll_powerdown),                               //        powerdown_export.pll_powerdown
		.gxb_powerdown           (powerdown_gxb_powerdown),                               //                        .gxb_powerdown
		.pll_locked_pcs          (altgx_internal_pll_locked_interconect),                 //          pll_locked_pcs.interconect
		.hip_tx_clkout_pcs       (altgx_internal_hip_tx_clkout_0_interconect),            //       hip_tx_clkout_pcs.interconect
		.rate_hip                (pcie_internal_hip_rate_ext_interconect),                //                rate_hip.interconect
		.clk500_out              (reset_controller_internal_clk500_out_interconect),      //              clk500_out.interconect
		.clk250_out              (reset_controller_internal_clk250_out_interconect),      //              clk250_out.interconect
		.core_clk_out            (pcie_core_clk_clk),                                     //            core_clk_out.clk
		.rc_pll_locked           (pipe_interface_internal_rc_pll_locked_interconect),     //           rc_pll_locked.interconect
		.gxb_powerdown_pcs       (pipe_interface_internal_gxb_powerdown_pcs_interconect), //       gxb_powerdown_pcs.interconect
		.pll_powerdown_pcs       (),                                                      //       pll_powerdown_pcs.interconect
		.pclk_central_hip        (pipe_interface_internal_pclk_central_hip_interconect),  //        pclk_central_hip.interconect
		.pclk_ch0_hip            (pipe_interface_internal_pclk_ch0_hip_interconect),      //            pclk_ch0_hip.interconect
		.rateswitch_pcs          (),                                                      //          rateswitch_pcs.interconect
		.pll_fixed_clk_hip       (pipe_interface_internal_pll_fixed_clk_hip_interconect), //       pll_fixed_clk_hip.interconect
		.pcie_rstn               (pcie_rstn_export),                                      //               pcie_rstn.interconect
		.rc_areset               (pipe_interface_internal_rc_areset_interconect),         //               rc_areset.interconect
		.txdata0_hip             (pcie_internal_hip_txdata0_ext_interconect),             //             txdata0_hip.interconect
		.txdatak0_hip            (pcie_internal_hip_txdatak0_ext_interconect),            //            txdatak0_hip.interconect
		.powerdown0_hip          (pcie_internal_hip_powerdown0_ext_interconect),          //          powerdown0_hip.interconect
		.rxpolarity0_hip         (pcie_internal_hip_rxpolarity0_ext_interconect),         //         rxpolarity0_hip.interconect
		.txcompl0_hip            (pcie_internal_hip_txcompl0_ext_interconect),            //            txcompl0_hip.interconect
		.txdetectrx0_hip         (pcie_internal_hip_txdetectrx0_ext_interconect),         //         txdetectrx0_hip.interconect
		.txelecidle0_hip         (pcie_internal_hip_txelecidle0_ext_interconect),         //         txelecidle0_hip.interconect
		.rxdata_hip              (pipe_interface_internal_rxdata_hip),                    //            rxdata_hip_0.interconect
		.rxdatak_hip             (pipe_interface_internal_rxdatak_hip),                   //           rxdatak_hip_0.interconect
		.rxstatus_hip            (pipe_interface_internal_rxstatus_hip),                  //          rxstatus_hip_0.interconect
		.powerdown_pcs           (pipe_interface_internal_powerdown_pcs_interconect),     //           powerdown_pcs.interconect
		.rxdata_pcs              (altgx_internal_rx_dataout_interconect),                 //              rxdata_pcs.interconect
		.phystatus_pcs           (altgx_internal_pipephydonestatus_interconect),          //           phystatus_pcs.interconect
		.rxelecidle_pcs          (altgx_internal_pipeelecidle_interconect),               //          rxelecidle_pcs.interconect
		.rxvalid_pcs             (altgx_internal_pipedatavalid_interconect),              //             rxvalid_pcs.interconect
		.rxdatak_pcs             (altgx_internal_rx_ctrldetect_interconect),              //             rxdatak_pcs.interconect
		.rxstatus_pcs            (altgx_internal_pipestatus_interconect),                 //            rxstatus_pcs.interconect
		.txdata_pcs              (pipe_interface_internal_txdata_pcs_interconect),        //              txdata_pcs.interconect
		.rxpolarity_pcs          (pipe_interface_internal_rxpolarity_pcs_interconect),    //          rxpolarity_pcs.interconect
		.txcompl_pcs             (pipe_interface_internal_txcompl_pcs_interconect),       //             txcompl_pcs.interconect
		.txdatak_pcs             (pipe_interface_internal_txdatak_pcs_interconect),       //             txdatak_pcs.interconect
		.txdetectrx_pcs          (pipe_interface_internal_txdetectrx_pcs_interconect),    //          txdetectrx_pcs.interconect
		.txelecidle_pcs          (pipe_interface_internal_txelecidle_pcs_interconect),    //          txelecidle_pcs.interconect
		.phystatus_hip           (pipe_interface_internal_phystatus_hip),                 //         phystatus_hip_0.interconect
		.rxelecidle_hip          (pipe_interface_internal_rxelecidle_hip),                //        rxelecidle_hip_0.interconect
		.rxvalid_hip             (pipe_interface_internal_rxvalid_hip),                   //           rxvalid_hip_0.interconect
		.rateswitchbaseclock_pcs ()                                                       // rateswitchbaseclock_pcs.interconect
	);
	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("both"),
		.SYNC_DEPTH              (2),
		.RESET_REQUEST_PRESENT   (0)
	) rst_controller (
		.reset_in0  (~pcie_core_reset_reset_n),       // reset_in0.reset
		.clk        (pcie_core_clk_clk),              //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req  (),                               // (terminated)
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);
	assign pcie_internal_hip_dl_ltssm_int_interconect = { pcie_internal_hip_dl_ltssm[4:0] };
	assign pipe_interface_internal_rxdatak_hip_0_interconect = { pipe_interface_internal_rxdatak_hip[0] };
	assign pcie_internal_hip_eidle_infer_sel_0_interconect = { pcie_internal_hip_eidle_infer_sel[2:0] };
	assign pipe_interface_internal_rxdata_hip_0_interconect = { pipe_interface_internal_rxdata_hip[7:0] };
	assign pipe_interface_internal_rxvalid_hip_0_interconect = { pipe_interface_internal_rxvalid_hip[0] };
	assign pipe_interface_internal_rxelecidle_hip_0_interconect = { pipe_interface_internal_rxelecidle_hip[0] };
	assign pipe_interface_internal_phystatus_hip_0_interconect = { pipe_interface_internal_phystatus_hip[0] };
	assign pipe_interface_internal_rxstatus_hip_0_interconect = { pipe_interface_internal_rxstatus_hip[2:0] };
endmodule