module instantiation
/* test_stub_scan AUTO_TEMPLATE (
  // Outputs
  .mux_drive_disable(),
  .mem_write_disable(),
  .sehold	(),
  .se	(se),
  .testmode_l(testmode_l),
  .mem_bypass(),
  .so_0	(so_0),
  .so_1	(),
  .so_2	(),
  // Inputs
  .ctu_tst_pre_grst_l(ctu_tst_pre_grst_l),
  .arst_l	(jbus_arst_l),
  .global_shift_enable(global_shift_enable),
  .ctu_tst_scan_disable(ctu_tst_scan_disable),
  .ctu_tst_scanmode(ctu_tst_scanmode),
  .ctu_tst_macrotest(ctu_tst_macrotest),
  .ctu_tst_short_chain(ctu_tst_short_chain),
  .long_chain_so_0(MT_long_chain_so_0),
  .short_chain_so_0(short_chain_so_0),
  .long_chain_so_1(1'b0),
  .short_chain_so_1(1'b0),
  .long_chain_so_2(1'b0),
  .short_chain_so_2(1'b0));
*/
test_stub_scan test_stub_scan (/*AUTOINST*/
			       // Outputs
			       .mux_drive_disable(),		 // Templated
			       .mem_write_disable(),		 // Templated
			       .sehold	(),			 // Templated
			       .se	(se),			 // Templated
			       .testmode_l(testmode_l),		 // Templated
			       .mem_bypass(),			 // Templated
			       .so_0	(so_0),			 // Templated
			       .so_1	(),			 // Templated
			       .so_2	(),			 // Templated
			       // Inputs
			       .ctu_tst_pre_grst_l(ctu_tst_pre_grst_l), // Templated
			       .arst_l	(jbus_arst_l),		 // Templated
			       .global_shift_enable(global_shift_enable), // Templated
			       .ctu_tst_scan_disable(ctu_tst_scan_disable), // Templated
			       .ctu_tst_scanmode(ctu_tst_scanmode), // Templated
			       .ctu_tst_macrotest(ctu_tst_macrotest), // Templated
			       .ctu_tst_short_chain(ctu_tst_short_chain), // Templated
			       .long_chain_so_0(MT_long_chain_so_0), // Templated
			       .short_chain_so_0(short_chain_so_0), // Templated
			       .long_chain_so_1(1'b0),		 // Templated
			       .short_chain_so_1(1'b0),		 // Templated
			       .long_chain_so_2(1'b0),		 // Templated
			       .short_chain_so_2(1'b0));		 // Templated
/* bw_r_efa  AUTO_TEMPLATE (
               .vpp                     (io_vpp),
               .pi_efa_prog_en          (io_pgrm_en),
               .clk                     (jbus_rclk),
               .so                  (),
               .si                  (1'b0),
               .se                  (1'b0),
 ); */
bw_r_efa u_efa(/*AUTOINST*/
	       // Outputs
	       .efa_sbc_data		(efa_sbc_data[31:0]),
	       .so			(),			 // Templated
	       // Inputs
	       .vpp			(io_vpp),		 // Templated
	       .pi_efa_prog_en		(io_pgrm_en),		 // Templated
	       .sbc_efa_read_en		(sbc_efa_read_en),
	       .sbc_efa_word_addr	(sbc_efa_word_addr[5:0]),
	       .sbc_efa_bit_addr	(sbc_efa_bit_addr[4:0]),
	       .sbc_efa_margin0_rd	(sbc_efa_margin0_rd),
	       .sbc_efa_margin1_rd	(sbc_efa_margin1_rd),
	       .pwr_ok			(pwr_ok),
	       .por_n			(por_n),
	       .sbc_efa_sup_det_rd	(sbc_efa_sup_det_rd),
	       .sbc_efa_power_down	(sbc_efa_power_down),
	       .si			(1'b0),			 // Templated
	       .se			(1'b0),			 // Templated
	       .vddo			(vddo),
	       .clk			(jbus_rclk));		 // Templated
/* efc_stdc AUTO_TEMPLATE (
                    .clk                (jbus_rclk),
); */
efc_stdc u_efa_stdc(/*AUTOINST*/
		    // Outputs
		    .efc_ctu_data_out	(efc_ctu_data_out),
		    .efc_spc1357_fuse_clk1(efc_spc1357_fuse_clk1),
		    .efc_spc1357_fuse_clk2(efc_spc1357_fuse_clk2),
		    .efc_spc0246_fuse_clk1(efc_spc0246_fuse_clk1),
		    .efc_spc0246_fuse_clk2(efc_spc0246_fuse_clk2),
		    .efc_spc1357_fuse_data(efc_spc1357_fuse_data),
		    .efc_spc0246_fuse_data(efc_spc0246_fuse_data),
		    .efc_spc7_ifuse_ashift(efc_spc7_ifuse_ashift),
		    .efc_spc7_ifuse_dshift(efc_spc7_ifuse_dshift),
		    .efc_spc7_dfuse_ashift(efc_spc7_dfuse_ashift),
		    .efc_spc7_dfuse_dshift(efc_spc7_dfuse_dshift),
		    .efc_spc6_ifuse_ashift(efc_spc6_ifuse_ashift),
		    .efc_spc6_ifuse_dshift(efc_spc6_ifuse_dshift),
		    .efc_spc6_dfuse_ashift(efc_spc6_dfuse_ashift),
		    .efc_spc6_dfuse_dshift(efc_spc6_dfuse_dshift),
		    .efc_spc5_ifuse_ashift(efc_spc5_ifuse_ashift),
		    .efc_spc5_ifuse_dshift(efc_spc5_ifuse_dshift),
		    .efc_spc5_dfuse_ashift(efc_spc5_dfuse_ashift),
		    .efc_spc5_dfuse_dshift(efc_spc5_dfuse_dshift),
		    .efc_spc4_ifuse_ashift(efc_spc4_ifuse_ashift),
		    .efc_spc4_ifuse_dshift(efc_spc4_ifuse_dshift),
		    .efc_spc4_dfuse_ashift(efc_spc4_dfuse_ashift),
		    .efc_spc4_dfuse_dshift(efc_spc4_dfuse_dshift),
		    .efc_spc3_ifuse_ashift(efc_spc3_ifuse_ashift),
		    .efc_spc3_ifuse_dshift(efc_spc3_ifuse_dshift),
		    .efc_spc3_dfuse_ashift(efc_spc3_dfuse_ashift),
		    .efc_spc3_dfuse_dshift(efc_spc3_dfuse_dshift),
		    .efc_spc2_ifuse_ashift(efc_spc2_ifuse_ashift),
		    .efc_spc2_ifuse_dshift(efc_spc2_ifuse_dshift),
		    .efc_spc2_dfuse_ashift(efc_spc2_dfuse_ashift),
		    .efc_spc2_dfuse_dshift(efc_spc2_dfuse_dshift),
		    .efc_spc1_ifuse_ashift(efc_spc1_ifuse_ashift),
		    .efc_spc1_ifuse_dshift(efc_spc1_ifuse_dshift),
		    .efc_spc1_dfuse_ashift(efc_spc1_dfuse_ashift),
		    .efc_spc1_dfuse_dshift(efc_spc1_dfuse_dshift),
		    .efc_spc0_ifuse_ashift(efc_spc0_ifuse_ashift),
		    .efc_spc0_ifuse_dshift(efc_spc0_ifuse_dshift),
		    .efc_spc0_dfuse_ashift(efc_spc0_dfuse_ashift),
		    .efc_spc0_dfuse_dshift(efc_spc0_dfuse_dshift),
		    .efc_sctag02_fuse_clk1(efc_sctag02_fuse_clk1),
		    .efc_sctag02_fuse_clk2(efc_sctag02_fuse_clk2),
		    .efc_sctag02_fuse_data(efc_sctag02_fuse_data),
		    .efc_sctag13_fuse_clk1(efc_sctag13_fuse_clk1),
		    .efc_sctag13_fuse_clk2(efc_sctag13_fuse_clk2),
		    .efc_sctag13_fuse_data(efc_sctag13_fuse_data),
		    .efc_sctag3_fuse_ashift(efc_sctag3_fuse_ashift),
		    .efc_sctag3_fuse_dshift(efc_sctag3_fuse_dshift),
		    .efc_sctag2_fuse_ashift(efc_sctag2_fuse_ashift),
		    .efc_sctag2_fuse_dshift(efc_sctag2_fuse_dshift),
		    .efc_sctag1_fuse_ashift(efc_sctag1_fuse_ashift),
		    .efc_sctag1_fuse_dshift(efc_sctag1_fuse_dshift),
		    .efc_sctag0_fuse_ashift(efc_sctag0_fuse_ashift),
		    .efc_sctag0_fuse_dshift(efc_sctag0_fuse_dshift),
		    .efc_scdata02_fuse_clk1(efc_scdata02_fuse_clk1),
		    .efc_scdata02_fuse_clk2(efc_scdata02_fuse_clk2),
		    .efc_scdata02_fuse_data(efc_scdata02_fuse_data),
		    .efc_scdata13_fuse_clk1(efc_scdata13_fuse_clk1),
		    .efc_scdata13_fuse_clk2(efc_scdata13_fuse_clk2),
		    .efc_scdata13_fuse_data(efc_scdata13_fuse_data),
		    .efc_scdata3_fuse_ashift(efc_scdata3_fuse_ashift),
		    .efc_scdata3_fuse_dshift(efc_scdata3_fuse_dshift),
		    .efc_scdata2_fuse_ashift(efc_scdata2_fuse_ashift),
		    .efc_scdata2_fuse_dshift(efc_scdata2_fuse_dshift),
		    .efc_scdata1_fuse_ashift(efc_scdata1_fuse_ashift),
		    .efc_scdata1_fuse_dshift(efc_scdata1_fuse_dshift),
		    .efc_scdata0_fuse_ashift(efc_scdata0_fuse_ashift),
		    .efc_scdata0_fuse_dshift(efc_scdata0_fuse_dshift),
		    .efc_iob_fuse_clk1	(efc_iob_fuse_clk1),
		    .efc_iob_fuse_data	(efc_iob_fuse_data),
		    .efc_iob_sernum0_dshift(efc_iob_sernum0_dshift),
		    .efc_iob_sernum1_dshift(efc_iob_sernum1_dshift),
		    .efc_iob_sernum2_dshift(efc_iob_sernum2_dshift),
		    .efc_iob_fusestat_dshift(efc_iob_fusestat_dshift),
		    .efc_iob_coreavail_dshift(efc_iob_coreavail_dshift),
		    .sbc_efa_read_en	(sbc_efa_read_en),
		    .sbc_efa_word_addr	(sbc_efa_word_addr[5:0]),
		    .sbc_efa_bit_addr	(sbc_efa_bit_addr[4:0]),
		    .sbc_efa_margin0_rd	(sbc_efa_margin0_rd),
		    .sbc_efa_margin1_rd	(sbc_efa_margin1_rd),
		    .pwr_ok		(pwr_ok),
		    .por_n		(por_n),
		    .sbc_efa_sup_det_rd	(sbc_efa_sup_det_rd),
		    .sbc_efa_power_down	(sbc_efa_power_down),
		    // Inputs
		    .clk		(jbus_rclk),		 // Templated
		    .efc_rst_l		(efc_rst_l),
		    .jbus_arst_l	(jbus_arst_l),
		    .testmode_l		(testmode_l),
		    .ctu_efc_rowaddr	(ctu_efc_rowaddr[6:0]),
		    .ctu_efc_coladdr	(ctu_efc_coladdr[4:0]),
		    .ctu_efc_read_en	(ctu_efc_read_en),
		    .ctu_efc_read_mode	(ctu_efc_read_mode[2:0]),
		    .ctu_efc_read_start	(ctu_efc_read_start),
		    .ctu_efc_fuse_bypass(ctu_efc_fuse_bypass),
		    .ctu_efc_dest_sample(ctu_efc_dest_sample),
		    .ctu_efc_data_in	(ctu_efc_data_in),
		    .ctu_efc_updatedr	(ctu_efc_updatedr),
		    .ctu_efc_shiftdr	(ctu_efc_shiftdr),
		    .ctu_efc_capturedr	(ctu_efc_capturedr),
		    .tck		(tck),
		    .spc7_efc_ifuse_data(spc7_efc_ifuse_data),
		    .spc7_efc_dfuse_data(spc7_efc_dfuse_data),
		    .spc6_efc_ifuse_data(spc6_efc_ifuse_data),
		    .spc6_efc_dfuse_data(spc6_efc_dfuse_data),
		    .spc5_efc_ifuse_data(spc5_efc_ifuse_data),
		    .spc5_efc_dfuse_data(spc5_efc_dfuse_data),
		    .spc4_efc_ifuse_data(spc4_efc_ifuse_data),
		    .spc4_efc_dfuse_data(spc4_efc_dfuse_data),
		    .spc3_efc_ifuse_data(spc3_efc_ifuse_data),
		    .spc3_efc_dfuse_data(spc3_efc_dfuse_data),
		    .spc2_efc_ifuse_data(spc2_efc_ifuse_data),
		    .spc2_efc_dfuse_data(spc2_efc_dfuse_data),
		    .spc1_efc_ifuse_data(spc1_efc_ifuse_data),
		    .spc1_efc_dfuse_data(spc1_efc_dfuse_data),
		    .spc0_efc_ifuse_data(spc0_efc_ifuse_data),
		    .spc0_efc_dfuse_data(spc0_efc_dfuse_data),
		    .sctag3_efc_fuse_data(sctag3_efc_fuse_data),
		    .sctag2_efc_fuse_data(sctag2_efc_fuse_data),
		    .sctag1_efc_fuse_data(sctag1_efc_fuse_data),
		    .sctag0_efc_fuse_data(sctag0_efc_fuse_data),
		    .scdata3_efc_fuse_data(scdata3_efc_fuse_data),
		    .scdata2_efc_fuse_data(scdata2_efc_fuse_data),
		    .scdata1_efc_fuse_data(scdata1_efc_fuse_data),
		    .scdata0_efc_fuse_data(scdata0_efc_fuse_data),
		    .efa_sbc_data	(efa_sbc_data[31:0]));
endmodule