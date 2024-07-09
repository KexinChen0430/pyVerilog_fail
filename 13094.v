module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					s2f_width_check ( .error(1'b1) );
		end
	endgenerate
	spw_babasu_hps_0_fpga_interfaces fpga_interfaces (
		.h2f_rst_n   (h2f_rst_n),   //      h2f_reset.reset_n
		.h2f_axi_clk (h2f_axi_clk), //  h2f_axi_clock.clk
		.h2f_AWID    (h2f_AWID),    // h2f_axi_master.awid
		.h2f_AWADDR  (h2f_AWADDR),  //               .awaddr
		.h2f_AWLEN   (h2f_AWLEN),   //               .awlen
		.h2f_AWSIZE  (h2f_AWSIZE),  //               .awsize
		.h2f_AWBURST (h2f_AWBURST), //               .awburst
		.h2f_AWLOCK  (h2f_AWLOCK),  //               .awlock
		.h2f_AWCACHE (h2f_AWCACHE), //               .awcache
		.h2f_AWPROT  (h2f_AWPROT),  //               .awprot
		.h2f_AWVALID (h2f_AWVALID), //               .awvalid
		.h2f_AWREADY (h2f_AWREADY), //               .awready
		.h2f_WID     (h2f_WID),     //               .wid
		.h2f_WDATA   (h2f_WDATA),   //               .wdata
		.h2f_WSTRB   (h2f_WSTRB),   //               .wstrb
		.h2f_WLAST   (h2f_WLAST),   //               .wlast
		.h2f_WVALID  (h2f_WVALID),  //               .wvalid
		.h2f_WREADY  (h2f_WREADY),  //               .wready
		.h2f_BID     (h2f_BID),     //               .bid
		.h2f_BRESP   (h2f_BRESP),   //               .bresp
		.h2f_BVALID  (h2f_BVALID),  //               .bvalid
		.h2f_BREADY  (h2f_BREADY),  //               .bready
		.h2f_ARID    (h2f_ARID),    //               .arid
		.h2f_ARADDR  (h2f_ARADDR),  //               .araddr
		.h2f_ARLEN   (h2f_ARLEN),   //               .arlen
		.h2f_ARSIZE  (h2f_ARSIZE),  //               .arsize
		.h2f_ARBURST (h2f_ARBURST), //               .arburst
		.h2f_ARLOCK  (h2f_ARLOCK),  //               .arlock
		.h2f_ARCACHE (h2f_ARCACHE), //               .arcache
		.h2f_ARPROT  (h2f_ARPROT),  //               .arprot
		.h2f_ARVALID (h2f_ARVALID), //               .arvalid
		.h2f_ARREADY (h2f_ARREADY), //               .arready
		.h2f_RID     (h2f_RID),     //               .rid
		.h2f_RDATA   (h2f_RDATA),   //               .rdata
		.h2f_RRESP   (h2f_RRESP),   //               .rresp
		.h2f_RLAST   (h2f_RLAST),   //               .rlast
		.h2f_RVALID  (h2f_RVALID),  //               .rvalid
		.h2f_RREADY  (h2f_RREADY)   //               .rready
	);
	spw_babasu_hps_0_hps_io hps_io (
		.mem_a       (mem_a),       // memory.mem_a
		.mem_ba      (mem_ba),      //       .mem_ba
		.mem_ck      (mem_ck),      //       .mem_ck
		.mem_ck_n    (mem_ck_n),    //       .mem_ck_n
		.mem_cke     (mem_cke),     //       .mem_cke
		.mem_cs_n    (mem_cs_n),    //       .mem_cs_n
		.mem_ras_n   (mem_ras_n),   //       .mem_ras_n
		.mem_cas_n   (mem_cas_n),   //       .mem_cas_n
		.mem_we_n    (mem_we_n),    //       .mem_we_n
		.mem_reset_n (mem_reset_n), //       .mem_reset_n
		.mem_dq      (mem_dq),      //       .mem_dq
		.mem_dqs     (mem_dqs),     //       .mem_dqs
		.mem_dqs_n   (mem_dqs_n),   //       .mem_dqs_n
		.mem_odt     (mem_odt),     //       .mem_odt
		.mem_dm      (mem_dm),      //       .mem_dm
		.oct_rzqin   (oct_rzqin)    //       .oct_rzqin
	);
endmodule