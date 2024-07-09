module
	 .bs_chain_tdo_i(1'b0), // from Boundary Scan Chain
	 .mbist_tdo_i(1'b0)     // from Mbist Chain
);
`elsif FPGA_TAP
`ifdef ALTERA_FPGA
altera_virtual_jtag tap_top(
	.tck_o(jtag_tck),
	.debug_tdo_o(debug_tdo),
	.tdi_o(debug_tdi),
	.test_logic_reset_o(test_logic_reset),
	.run_test_idle_o(),
	.shift_dr_o(shift_dr),
	.capture_dr_o(capture_dr),
	.pause_dr_o(pause_dr),
	.update_dr_o(update_dr),
	.debug_select_o(debug_select)
);
`elsif XILINX_FPGA
minsoc_xilinx_internal_jtag tap_top(
	.tck_o( jtag_tck ),
	.debug_tdo_i( debug_tdo ),
	.tdi_o( debug_tdi ),
	.test_logic_reset_o( test_logic_reset ),
	.run_test_idle_o( ),
	.shift_dr_o( shift_dr ),
	.capture_dr_o( capture_dr ),
	.pause_dr_o( pause_dr ),
	.update_dr_o( update_dr ),
	.debug_select_o( debug_select )
);
`endif // !FPGA_TAP
`endif // !GENERIC_TAP
// Instantiation of the OR1200 RISC
or1200_top or1200_top (
	// Common
	.rst_i		( wb_rst ),
	.clk_i		( wb_clk ),
`ifdef OR1200_CLMODE_1TO2
	.clmode_i	( 2'b01 ),
`else
`ifdef OR1200_CLMODE_1TO4
	.clmode_i	( 2'b11 ),
`else
	.clmode_i	( 2'b00 ),
`endif
`endif
	// WISHBONE Instruction Master
	.iwb_clk_i	( wb_clk ),
	.iwb_rst_i	( wb_rst ),
	.iwb_cyc_o	( wb_rim_cyc_o ),
	.iwb_adr_o	( wb_rim_adr_o ),
	.iwb_dat_i	( wb_rif_dat_i ),
	.iwb_dat_o	( wb_rim_dat_o ),
	.iwb_sel_o	( wb_rim_sel_o ),
	.iwb_ack_i	( wb_rif_ack_i ),
	.iwb_err_i	( wb_rim_err_i ),
	.iwb_rty_i	( wb_rim_rty_i ),
	.iwb_we_o	( wb_rim_we_o  ),
	.iwb_stb_o	( wb_rim_stb_o ),
	// WISHBONE Data Master
	.dwb_clk_i	( wb_clk ),
	.dwb_rst_i	( wb_rst ),
	.dwb_cyc_o	( wb_rdm_cyc_o ),
	.dwb_adr_o	( wb_rdm_adr_o ),
	.dwb_dat_i	( wb_rdm_dat_i ),
	.dwb_dat_o	( wb_rdm_dat_o ),
	.dwb_sel_o	( wb_rdm_sel_o ),
	.dwb_ack_i	( wb_rdm_ack_i ),
	.dwb_err_i	( wb_rdm_err_i ),
	.dwb_rty_i	( wb_rdm_rty_i ),
	.dwb_we_o	( wb_rdm_we_o  ),
	.dwb_stb_o	( wb_rdm_stb_o ),
	// Debug
	.dbg_stall_i	( dbg_stall ),
	.dbg_dat_i	( dbg_dat_dbg ),
	.dbg_adr_i	( dbg_adr ),
	.dbg_ewt_i	( 1'b0 ),
	.dbg_lss_o	( dbg_lss ),
	.dbg_is_o	( dbg_is ),
	.dbg_wp_o	( dbg_wp ),
	.dbg_bp_o	( dbg_bp ),
	.dbg_dat_o	( dbg_dat_risc ),
	.dbg_ack_o	( dbg_ack ),
	.dbg_stb_i	( dbg_op[2] ),
	.dbg_we_i	( dbg_op[0] ),
	// Power Management
	.pm_clksd_o	( ),
	.pm_cpustall_i	( 1'b0 ),
	.pm_dc_gate_o	( ),
	.pm_ic_gate_o	( ),
	.pm_dmmu_gate_o	( ),
	.pm_immu_gate_o	( ),
	.pm_tt_gate_o	( ),
	.pm_cpu_gate_o	( ),
	.pm_wakeup_o	( ),
	.pm_lvolt_o	( ),
	// Interrupts
	.pic_ints_i	( pic_ints )
);
// Startup OR1k
`ifdef START_UP
OR1K_startup OR1K_startup0
(
    .wb_adr_i(wb_fs_adr_i[6:2]),
    .wb_stb_i(wb_fs_stb_i),
    .wb_cyc_i(wb_fs_cyc_i),
    .wb_dat_o(wb_fs_dat_o),
    .wb_ack_o(wb_fs_ack_o),
    .wb_clk(wb_clk),
    .wb_rst(wb_rst)
);
spi_flash_top #
(
   .divider(0),
   .divider_len(2)
)
spi_flash_top0
(
   .wb_clk_i(wb_clk),
   .wb_rst_i(wb_rst),
   .wb_adr_i(wb_sp_adr_i[4:2]),
   .wb_dat_i(wb_sp_dat_i),
   .wb_dat_o(wb_sp_dat_o),
   .wb_sel_i(wb_sp_sel_i),
   .wb_we_i(wb_sp_we_i),
   .wb_stb_i(wb_sp_stb_i),
   .wb_cyc_i(wb_sp_cyc_i),
   .wb_ack_o(wb_sp_ack_o),
   .mosi_pad_o(spi_flash_mosi),
   .miso_pad_i(spi_flash_miso),
   .sclk_pad_o(spi_flash_sclk),
   .ss_pad_o(spi_flash_ss)
);
`else
assign wb_fs_dat_o = 32'h0000_0000;
assign wb_fs_ack_o = 1'b0;
assign wb_sp_dat_o = 32'h0000_0000;
assign wb_sp_ack_o = 1'b0;
`endif
// Instantiation of the SRAM controller
minsoc_onchip_ram_top #
(
    .adr_width(`MEMORY_ADR_WIDTH)     //16 blocks of 2048 bytes memory 32768
)
onchip_ram_top (
	// WISHBONE common
	.wb_clk_i	( wb_clk ),
	.wb_rst_i	( wb_rst ),
	// WISHBONE slave
	.wb_dat_i	( wb_ss_dat_i ),
	.wb_dat_o	( wb_ss_dat_o ),
	.wb_adr_i	( wb_ss_adr_i ),
	.wb_sel_i	( wb_ss_sel_i ),
	.wb_we_i	( wb_ss_we_i  ),
	.wb_cyc_i	( wb_ss_cyc_i ),
	.wb_stb_i	( wb_ss_stb_i ),
	.wb_ack_o	( wb_ss_ack_o ),
	.wb_err_o	( wb_ss_err_o )
);
// Instantiation of the UART16550
`ifdef UART
uart_top uart_top (
	// WISHBONE common
	.wb_clk_i	( wb_clk ),
	.wb_rst_i	( wb_rst ),
	// WISHBONE slave
	.wb_adr_i	( wb_us_adr_i[4:0] ),
	.wb_dat_i	( wb_us_dat_i ),
	.wb_dat_o	( wb_us_dat_o ),
	.wb_we_i	( wb_us_we_i  ),
	.wb_stb_i	( wb_us_stb_i ),
	.wb_cyc_i	( wb_us_cyc_i ),
	.wb_ack_o	( wb_us_ack_o ),
	.wb_sel_i	( wb_us_sel_i ),
	// Interrupt request
	.int_o		( pic_ints[`APP_INT_UART] ),
	// UART signals
	// serial input/output
	.stx_pad_o	( uart_stx ),
	.srx_pad_i	( uart_srx ),
	// modem signals
	.rts_pad_o	( ),
	.cts_pad_i	( 1'b0 ),
	.dtr_pad_o	( ),
	.dsr_pad_i	( 1'b0 ),
	.ri_pad_i	( 1'b0 ),
	.dcd_pad_i	( 1'b0 )
);
`else
assign wb_us_dat_o = 32'h0000_0000;
assign wb_us_ack_o = 1'b0;
`endif
// Instantiation of the GPIO
`ifdef GPIO
gpio_top #( .gw(`GPIO_IOS + 1) )
gpio_top_inst (
	// WISHBONE common
	.wb_clk_i	( wb_clk ),
	.wb_rst_i	( wb_rst ),
	// WISHBONE slave
	.wb_adr_i	( wb_gpio_adr_i[4:0] ),
	.wb_dat_i	( wb_gpio_dat_i ),
	.wb_dat_o	( wb_gpio_dat_o ),
	.wb_we_i	   ( wb_gpio_we_i  ),
	.wb_stb_i	( wb_gpio_stb_i ),
	.wb_cyc_i	( wb_gpio_cyc_i ),
	.wb_ack_o	( wb_gpio_ack_o ),
	.wb_sel_i	( wb_gpio_sel_i ),
	// Interrupt request
	.wb_inta_o		( pic_ints[`APP_INT_GPIO] ),
	// GPIO external signals
	.ext_pad_o	( ext_pad_o ),
	.ext_pad_i	( ext_pad_i ),
	.ext_padoe_o( ext_pad_oe_o )
);
minsoc_spartan_3a_starter_kit_ios #( .gpio_num(`GPIO_IOS + 1),
	 `ifdef GPIO_HAS_INPUT_PINS
	     .i_line_num(`GPIO_NUM_INPUT),
	 `endif
	 `ifdef GPIO_HAS_OUTPUT_PINS
        .o_line_num(`GPIO_NUM_OUTPUT),
	 `endif
	 `ifdef GPIO_HAS_BIDIR_PINS
	     .io_line_num(`GPIO_NUM_BIDIR)
	 `endif
) minsoc_spartan_3a_starter_kit_ios_inst_0 (
    .ext_pad_o( ext_pad_o ),
    .ext_pad_oe( ext_pad_oe_o ),
    .ext_pad_i( ext_pad_i ),
	 `ifdef GPIO_HAS_INPUT_PINS
	     .i_pins( i_pins ),
	 `else
	     .i_pins( ),
	 `endif
	 `ifdef GPIO_HAS_OUTPUT_PINS
	     .o_pins( o_pins ),
	 `else
	     .o_pins( ),
	 `endif
	 `ifdef GPIO_HAS_BIDIR_PINS
	     .io_pins( io_pins )
	 `else
	     .io_pins( )
	 `endif
);
`else
assign wb_gpio_dat_o = 32'h0000_0000;
assign wb_gpio_ack_o = 1'b0;
`endif
// Instantiation of the Ethernet 10/100 MAC
`ifdef ETHERNET
eth_top eth_top (
	// WISHBONE common
	.wb_clk_i	( wb_clk ),
	.wb_rst_i	( wb_rst ),
	// WISHBONE slave
	.wb_dat_i	( wb_es_dat_i ),
	.wb_dat_o	( wb_es_dat_o ),
	.wb_adr_i	( wb_es_adr_i[11:2] ),
	.wb_sel_i	( wb_es_sel_i ),
	.wb_we_i	( wb_es_we_i  ),
	.wb_cyc_i	( wb_es_cyc_i ),
	.wb_stb_i	( wb_es_stb_i ),
	.wb_ack_o	( wb_es_ack_o ),
	.wb_err_o	( wb_es_err_o ),
	// WISHBONE master
	.m_wb_adr_o	( wb_em_adr_o ),
	.m_wb_sel_o	( wb_em_sel_o ),
	.m_wb_we_o	( wb_em_we_o  ),
	.m_wb_dat_o	( wb_em_dat_o ),
	.m_wb_dat_i	( wb_em_dat_i ),
	.m_wb_cyc_o	( wb_em_cyc_o ),
	.m_wb_stb_o	( wb_em_stb_o ),
	.m_wb_ack_i	( wb_em_ack_i ),
	.m_wb_err_i	( wb_em_err_i ),
	// TX
	.mtx_clk_pad_i	( eth_tx_clk ),
	.mtxd_pad_o	( eth_txd ),
	.mtxen_pad_o	( eth_tx_en ),
	.mtxerr_pad_o	( eth_tx_er ),
	// RX
	.mrx_clk_pad_i	( eth_rx_clk ),
	.mrxd_pad_i	( eth_rxd ),
	.mrxdv_pad_i	( eth_rx_dv ),
	.mrxerr_pad_i	( eth_rx_er ),
	.mcoll_pad_i	( eth_col ),
	.mcrs_pad_i	( eth_crs ),
	// MIIM
	.mdc_pad_o	( eth_mdc ),
	.md_pad_i	( eth_mdio ),
	.md_pad_o	( eth_mdo ),
	.md_padoe_o	( eth_mdoe ),
	// Interrupt
	.int_o		( pic_ints[`APP_INT_ETH] )
);
`else
assign wb_es_dat_o = 32'h0000_0000;
assign wb_es_ack_o = 1'b0;
assign wb_em_adr_o = 32'h0000_0000;
assign wb_em_sel_o = 4'h0;
assign wb_em_we_o = 1'b0;
assign wb_em_dat_o = 32'h0000_0000;
assign wb_em_cyc_o = 1'b0;
assign wb_em_stb_o = 1'b0;
`endif
// Instantiation of the Traffic COP
minsoc_tc_top #(`APP_ADDR_DEC_W,
	 `APP_ADDR_SRAM,
	 `APP_ADDR_DEC_W,
	 `APP_ADDR_FLASH,
	 `APP_ADDR_DECP_W,
	 `APP_ADDR_PERIP,
	 `APP_ADDR_DEC_W,
	 `APP_ADDR_SPI,
	 `APP_ADDR_ETH,
	 `APP_ADDR_AUDIO,
	 `APP_ADDR_UART,
	 `APP_ADDR_PS2,
	 `APP_ADDR_GPIO,
	 `APP_ADDR_RES2
	) tc_top (
	// WISHBONE common
	.wb_clk_i	( wb_clk ),
	.wb_rst_i	( wb_rst ),
	// WISHBONE Initiator 0
	.i0_wb_cyc_i	( 1'b0 ),
	.i0_wb_stb_i	( 1'b0 ),
	.i0_wb_adr_i	( 32'h0000_0000 ),
	.i0_wb_sel_i	( 4'b0000 ),
	.i0_wb_we_i	( 1'b0 ),
	.i0_wb_dat_i	( 32'h0000_0000 ),
	.i0_wb_dat_o	( ),
	.i0_wb_ack_o	( ),
	.i0_wb_err_o	( ),
	// WISHBONE Initiator 1
	.i1_wb_cyc_i	( wb_em_cyc_o ),
	.i1_wb_stb_i	( wb_em_stb_o ),
	.i1_wb_adr_i	( wb_em_adr_o ),
	.i1_wb_sel_i	( wb_em_sel_o ),
	.i1_wb_we_i	( wb_em_we_o  ),
	.i1_wb_dat_i	( wb_em_dat_o ),
	.i1_wb_dat_o	( wb_em_dat_i ),
	.i1_wb_ack_o	( wb_em_ack_i ),
	.i1_wb_err_o	( wb_em_err_i ),
	// WISHBONE Initiator 2
	.i2_wb_cyc_i	( 1'b0 ),
	.i2_wb_stb_i	( 1'b0 ),
	.i2_wb_adr_i	( 32'h0000_0000 ),
	.i2_wb_sel_i	( 4'b0000 ),
	.i2_wb_we_i	( 1'b0 ),
	.i2_wb_dat_i	( 32'h0000_0000 ),
	.i2_wb_dat_o	( ),
	.i2_wb_ack_o	( ),
	.i2_wb_err_o	( ),
	// WISHBONE Initiator 3
	.i3_wb_cyc_i	( wb_dm_cyc_o ),
	.i3_wb_stb_i	( wb_dm_stb_o ),
	.i3_wb_adr_i	( wb_dm_adr_o ),
	.i3_wb_sel_i	( wb_dm_sel_o ),
	.i3_wb_we_i	( wb_dm_we_o  ),
	.i3_wb_dat_i	( wb_dm_dat_o ),
	.i3_wb_dat_o	( wb_dm_dat_i ),
	.i3_wb_ack_o	( wb_dm_ack_i ),
	.i3_wb_err_o	( wb_dm_err_i ),
	// WISHBONE Initiator 4
	.i4_wb_cyc_i	( wb_rdm_cyc_o ),
	.i4_wb_stb_i	( wb_rdm_stb_o ),
	.i4_wb_adr_i	( wb_rdm_adr_o ),
	.i4_wb_sel_i	( wb_rdm_sel_o ),
	.i4_wb_we_i	( wb_rdm_we_o  ),
	.i4_wb_dat_i	( wb_rdm_dat_o ),
	.i4_wb_dat_o	( wb_rdm_dat_i ),
	.i4_wb_ack_o	( wb_rdm_ack_i ),
	.i4_wb_err_o	( wb_rdm_err_i ),
	// WISHBONE Initiator 5
	.i5_wb_cyc_i	( wb_rim_cyc_o ),
	.i5_wb_stb_i	( wb_rim_stb_o ),
	.i5_wb_adr_i	( wb_rim_adr_o ),
	.i5_wb_sel_i	( wb_rim_sel_o ),
	.i5_wb_we_i	( wb_rim_we_o  ),
	.i5_wb_dat_i	( wb_rim_dat_o ),
	.i5_wb_dat_o	( wb_rim_dat_i ),
	.i5_wb_ack_o	( wb_rim_ack_i ),
	.i5_wb_err_o	( wb_rim_err_i ),
	// WISHBONE Initiator 6
	.i6_wb_cyc_i	( 1'b0 ),
	.i6_wb_stb_i	( 1'b0 ),
	.i6_wb_adr_i	( 32'h0000_0000 ),
	.i6_wb_sel_i	( 4'b0000 ),
	.i6_wb_we_i	( 1'b0 ),
	.i6_wb_dat_i	( 32'h0000_0000 ),
	.i6_wb_dat_o	( ),
	.i6_wb_ack_o	( ),
	.i6_wb_err_o	( ),
	// WISHBONE Initiator 7
	.i7_wb_cyc_i	( 1'b0 ),
	.i7_wb_stb_i	( 1'b0 ),
	.i7_wb_adr_i	( 32'h0000_0000 ),
	.i7_wb_sel_i	( 4'b0000 ),
	.i7_wb_we_i	( 1'b0 ),
	.i7_wb_dat_i	( 32'h0000_0000 ),
	.i7_wb_dat_o	( ),
	.i7_wb_ack_o	( ),
	.i7_wb_err_o	( ),
	// WISHBONE Target 0
	.t0_wb_cyc_o	( wb_ss_cyc_i ),
	.t0_wb_stb_o	( wb_ss_stb_i ),
	.t0_wb_adr_o	( wb_ss_adr_i ),
	.t0_wb_sel_o	( wb_ss_sel_i ),
	.t0_wb_we_o	( wb_ss_we_i  ),
	.t0_wb_dat_o	( wb_ss_dat_i ),
	.t0_wb_dat_i	( wb_ss_dat_o ),
	.t0_wb_ack_i	( wb_ss_ack_o ),
	.t0_wb_err_i	( wb_ss_err_o ),
	// WISHBONE Target 1
	.t1_wb_cyc_o	( wb_fs_cyc_i ),
	.t1_wb_stb_o	( wb_fs_stb_i ),
	.t1_wb_adr_o	( wb_fs_adr_i ),
	.t1_wb_sel_o	( wb_fs_sel_i ),
	.t1_wb_we_o	( wb_fs_we_i  ),
	.t1_wb_dat_o	( wb_fs_dat_i ),
	.t1_wb_dat_i	( wb_fs_dat_o ),
	.t1_wb_ack_i	( wb_fs_ack_o ),
	.t1_wb_err_i	( wb_fs_err_o ),
	// WISHBONE Target 2
	.t2_wb_cyc_o	( wb_sp_cyc_i ),
	.t2_wb_stb_o	( wb_sp_stb_i ),
	.t2_wb_adr_o	( wb_sp_adr_i ),
	.t2_wb_sel_o	( wb_sp_sel_i ),
	.t2_wb_we_o	( wb_sp_we_i  ),
	.t2_wb_dat_o	( wb_sp_dat_i ),
	.t2_wb_dat_i	( wb_sp_dat_o ),
	.t2_wb_ack_i	( wb_sp_ack_o ),
	.t2_wb_err_i	( wb_sp_err_o ),
	// WISHBONE Target 3
	.t3_wb_cyc_o	( wb_es_cyc_i ),
	.t3_wb_stb_o	( wb_es_stb_i ),
	.t3_wb_adr_o	( wb_es_adr_i ),
	.t3_wb_sel_o	( wb_es_sel_i ),
	.t3_wb_we_o	( wb_es_we_i  ),
	.t3_wb_dat_o	( wb_es_dat_i ),
	.t3_wb_dat_i	( wb_es_dat_o ),
	.t3_wb_ack_i	( wb_es_ack_o ),
	.t3_wb_err_i	( wb_es_err_o ),
	// WISHBONE Target 4
	.t4_wb_cyc_o	( ),
	.t4_wb_stb_o	( ),
	.t4_wb_adr_o	( ),
	.t4_wb_sel_o	( ),
	.t4_wb_we_o	( ),
	.t4_wb_dat_o	( ),
	.t4_wb_dat_i	( 32'h0000_0000 ),
	.t4_wb_ack_i	( 1'b0 ),
	.t4_wb_err_i	( 1'b1 ),
	// WISHBONE Target 5
	.t5_wb_cyc_o	( wb_us_cyc_i ),
	.t5_wb_stb_o	( wb_us_stb_i ),
	.t5_wb_adr_o	( wb_us_adr_i ),
	.t5_wb_sel_o	( wb_us_sel_i ),
	.t5_wb_we_o	( wb_us_we_i  ),
	.t5_wb_dat_o	( wb_us_dat_i ),
	.t5_wb_dat_i	( wb_us_dat_o ),
	.t5_wb_ack_i	( wb_us_ack_o ),
	.t5_wb_err_i	( wb_us_err_o ),
	// WISHBONE Target 6
	.t6_wb_cyc_o	( ),
	.t6_wb_stb_o	( ),
	.t6_wb_adr_o	( ),
	.t6_wb_sel_o	( ),
	.t6_wb_we_o	( ),
	.t6_wb_dat_o	( ),
	.t6_wb_dat_i	( 32'h0000_0000 ),
	.t6_wb_ack_i	( 1'b0 ),
	.t6_wb_err_i	( 1'b1 ),
	// WISHBONE Target 7
	.t7_wb_cyc_o	( wb_gpio_cyc_i ),
	.t7_wb_stb_o	( wb_gpio_stb_i ),
	.t7_wb_adr_o	( wb_gpio_adr_i ),
	.t7_wb_sel_o	( wb_gpio_sel_i ),
	.t7_wb_we_o	   ( wb_gpio_we_i  ),
	.t7_wb_dat_o	( wb_gpio_dat_i ),
	.t7_wb_dat_i	( wb_gpio_dat_o ),
	.t7_wb_ack_i	( wb_gpio_ack_o ),
	.t7_wb_err_i	( wb_gpio_err_o ),
	// WISHBONE Target 8
	.t8_wb_cyc_o	( ),
	.t8_wb_stb_o	( ),
	.t8_wb_adr_o	( ),
	.t8_wb_sel_o	( ),
	.t8_wb_we_o	( ),
	.t8_wb_dat_o	( ),
	.t8_wb_dat_i	( 32'h0000_0000 ),
	.t8_wb_ack_i	( 1'b0 ),
	.t8_wb_err_i	( 1'b1 )
);
//initial begin
//  $dumpvars(0);
//  $dumpfile("dump.vcd");
//end
endmodule