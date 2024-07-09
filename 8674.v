module must to accept SRIO packet from DSP side,
        save data (which was in packet) in DDR (on current time in FIFO),
        and send response packet with data (if was get NREAD request);
        In this part we accept packet by SRIO IP (srio_ip),
        transfer data into srio_response, save their in FIFO and
        transfer it back
    */
    srio_response srio_rx(
        .log_clk            ( log_clk     ),
        .log_rst            ( log_rst     ),
        .src_id             ( deviceid    ),
        .id_override        ( 1'b0        ),
        // Regs with request data (from DSP to FPGA)
        .axis_iorx_tvalid   ( iorx_tvalid ),
        .axis_iorx_tready   ( iorx_tready ),
        .axis_iorx_tlast    ( iorx_tlast  ),
        .axis_iorx_tdata    ( iorx_tdata  ),
        .axis_iorx_tkeep    ( iorx_tkeep  ),
        .axis_iorx_tuser    ( iorx_tuser  ),
        // Regs with response data (from FPGA to DSP)
        .axis_iotx_tvalid   ( iotx_tvalid ),
        .axis_iotx_tlast    ( iotx_tlast  ),
        .axis_iotx_tdata    ( iotx_tdata  ),
        .axis_iotx_tkeep    ( iotx_tkeep  ),
        .axis_iotx_tuser    ( iotx_tuser  ),
        .axis_iotx_tready   ( iotx_tready )
    );
    srio_gen2_0 srio_ip(
        .sys_clkp                      ( sys_clkp                ),
        .sys_clkn                      ( sys_clkn                ),
        .sys_rst                       ( sys_rst                 ),
        // all clocks as output in shared logic mode
        .log_clk_out                   ( log_clk                 ),
        .phy_clk_out                   ( phy_clk                 ),
        .gt_clk_out                    ( gt_clk                  ),
        .gt_pcs_clk_out                ( gt_pcs_clk              ),
        .drpclk_out                    ( drpclk                  ),
        .refclk_out                    ( refclk                  ),
        .clk_lock_out                  ( clk_lock                ),
        // all resets as output in shared logic mode
        .log_rst_out                   ( log_rst                 ),
        .phy_rst_out                   ( phy_rst                 ),
        .buf_rst_out                   ( buf_rst                 ),
        .cfg_rst_out                   ( cfg_rst                 ),
        .gt_pcs_rst_out                ( gt_pcs_rst              ),
        .gt0_qpll_clk_out              ( gt0_qpll_clk_out        ),
        .gt0_qpll_out_refclk_out       ( gt0_qpll_out_refclk_out ),
        // Serial IO Interface
        .srio_rxn0                     ( srio_rxn0               ),
        .srio_rxp0                     ( srio_rxp0               ),
        .srio_rxn1                     ( srio_rxn1               ),
        .srio_rxp1                     ( srio_rxp1               ),
        /*.srio_rxn2                     ( srio_rxn2               ),
        .srio_rxp2                     ( srio_rxp2               ),
        .srio_rxn3                     ( srio_rxn3               ),
        .srio_rxp3                     ( srio_rxp3               ),*/
        .srio_txn0                     ( srio_txn0               ),
        .srio_txp0                     ( srio_txp0               ),
        .srio_txn1                     ( srio_txn1               ),
        .srio_txp1                     ( srio_txp1               ),
        /*.srio_txn2                     ( srio_txn2               ),
        .srio_txp2                     ( srio_txp2               ),
        .srio_txn3                     ( srio_txn3               ),
        .srio_txp3                     ( srio_txp3               ),*/
        // LOG User I/O Interface
        .s_axis_iotx_tvalid            ( iotx_tvalid             ),
        .s_axis_iotx_tready            ( iotx_tready             ), // output
        .s_axis_iotx_tlast             ( iotx_tlast              ),
        .s_axis_iotx_tdata             ( iotx_tdata              ),
        .s_axis_iotx_tkeep             ( iotx_tkeep              ),
        .s_axis_iotx_tuser             ( iotx_tuser              ),
        .m_axis_iorx_tvalid            ( iorx_tvalid             ),
        .m_axis_iorx_tready            ( iorx_tready             ), // input
        .m_axis_iorx_tlast             ( iorx_tlast              ),
        .m_axis_iorx_tdata             ( iorx_tdata              ),
        .m_axis_iorx_tkeep             ( iorx_tkeep              ),
        .m_axis_iorx_tuser             ( iorx_tuser              ),
        // Maintenance Port Interface
        .s_axi_maintr_rst              ( maintr_rst              ),
        .s_axi_maintr_awvalid          ( maintr_awvalid          ),
        .s_axi_maintr_awready          ( maintr_awready          ),
        .s_axi_maintr_awaddr           ( maintr_awaddr           ),
        .s_axi_maintr_wvalid           ( maintr_wvalid           ),
        .s_axi_maintr_wready           ( maintr_wready           ),
        .s_axi_maintr_wdata            ( maintr_wdata            ),
        .s_axi_maintr_bvalid           ( maintr_bvalid           ),
        .s_axi_maintr_bready           ( maintr_bready           ),
        .s_axi_maintr_bresp            ( maintr_bresp            ),
        .s_axi_maintr_arvalid          ( maintr_arvalid          ),
        .s_axi_maintr_arready          ( maintr_arready          ),
        .s_axi_maintr_araddr           ( maintr_araddr           ),
        .s_axi_maintr_rvalid           ( maintr_rvalid           ),
        .s_axi_maintr_rready           ( maintr_rready           ),
        .s_axi_maintr_rdata            ( maintr_rdata            ),
        .s_axi_maintr_rresp            ( maintr_rresp            ),
        // PHY control signa
        .sim_train_en                  ( sim_train_en            ),
        .phy_mce                       ( phy_mce                 ),
        .phy_link_reset                ( phy_link_reset          ),
        .force_reinit                  ( force_reinit            ),
        // Core debug signals
        .phy_rcvd_mce                  ( phy_rcvd_mce            ),
        .phy_rcvd_link_reset           ( phy_rcvd_link_reset     ),
        .phy_debug                     ( phy_debug               ),
        .gtrx_disperr_or               ( gtrx_disperr_or         ),
        .gtrx_notintable_or            ( gtrx_notintable_or      ),
        // Side band signals
        .port_error                    ( port_error              ),
        .port_timeout                  ( port_timeout            ),
        .srio_host                     ( srio_host               ),
        // LOG Informational signals
        .port_decode_error             ( port_decode_error       ),
        .deviceid                      ( deviceid                ),
        .idle2_selected                ( idle2_selected          ),
        .phy_lcl_master_enable_out     (), // these are side band output only signals
        .buf_lcl_response_only_out     (),
        .buf_lcl_tx_flow_control_out   (),
        .buf_lcl_phy_buf_stat_out      (),
        .phy_lcl_phy_next_fm_out       (),
        .phy_lcl_phy_last_ack_out      (),
        .phy_lcl_phy_rewind_out        (),
        .phy_lcl_phy_rcvd_buf_stat_out (),
        .phy_lcl_maint_only_out        (),
        // PHY Informational signals
        .port_initialized              ( port_init               ),
        .link_initialized              ( link_init               ),
        .idle_selected                 ( idle_selected           ),
        .mode_1x                       ( mode_1x                 )
    );
endmodule