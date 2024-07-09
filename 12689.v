module outputs)
wire [`JBI_WDQ_ADDR_WIDTH-1:0]wdq_raddr;	// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire			wdq_rd_en;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [`JBI_WDQ_WIDTH-1:0]wdq_rdata;		// From u_wdq_buf of jbi_min_wdq_buf.v
wire [`JBI_WDQ_ADDR_WIDTH-1:0]wdq_waddr;	// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [127:0]		wdq_wdata;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [6:0]		wdq_wdata_ecc0;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [6:0]		wdq_wdata_ecc1;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [6:0]		wdq_wdata_ecc2;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire [6:0]		wdq_wdata_ecc3;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
wire			wdq_wr_en;		// From u_wdq_ctl of jbi_min_wdq_ctl.v
// End of automatics
// Local signal declarations
// Code start here
jbi_min_wdq_ctl u_wdq_ctl (/*AUTOINST*/
			   // Outputs
			   .min_csr_perf_dma_wr8(min_csr_perf_dma_wr8),
			   .wdq_wr_en	(wdq_wr_en),
			   .wdq_wdata	(wdq_wdata[127:0]),
			   .wdq_wdata_ecc0(wdq_wdata_ecc0[6:0]),
			   .wdq_wdata_ecc1(wdq_wdata_ecc1[6:0]),
			   .wdq_wdata_ecc2(wdq_wdata_ecc2[6:0]),
			   .wdq_wdata_ecc3(wdq_wdata_ecc3[6:0]),
			   .wdq_waddr	(wdq_waddr[`JBI_WDQ_ADDR_WIDTH-1:0]),
			   .wdq_rd_en	(wdq_rd_en),
			   .wdq_raddr	(wdq_raddr[`JBI_WDQ_ADDR_WIDTH-1:0]),
			   .wdq_rdq0_push(wdq_rdq0_push),
			   .wdq_rdq1_push(wdq_rdq1_push),
			   .wdq_rdq2_push(wdq_rdq2_push),
			   .wdq_rdq3_push(wdq_rdq3_push),
			   .wdq_rdq_wdata(wdq_rdq_wdata[`JBI_RDQ_WIDTH-1:0]),
			   .wdq_rhq0_push(wdq_rhq0_push),
			   .wdq_rhq1_push(wdq_rhq1_push),
			   .wdq_rhq2_push(wdq_rhq2_push),
			   .wdq_rhq3_push(wdq_rhq3_push),
			   .wdq_rhq_wdata(wdq_rhq_wdata[`JBI_RHQ_WIDTH-1:0]),
			   .wdq_rq_tag_byps(wdq_rq_tag_byps),
			   .wdq_wr_vld	(wdq_wr_vld),
			   .min_aok_on	(min_aok_on),
			   .min_aok_off	(min_aok_off),
			   // Inputs
			   .clk		(clk),
			   .rst_l	(rst_l),
			   .csr_jbi_config2_iq_high(csr_jbi_config2_iq_high[3:0]),
			   .csr_jbi_config2_iq_low(csr_jbi_config2_iq_low[3:0]),
			   .csr_jbi_config2_ord_wr(csr_jbi_config2_ord_wr),
			   .csr_jbi_config2_ord_rd(csr_jbi_config2_ord_rd),
			   .io_jbi_j_ad_ff(io_jbi_j_ad_ff[127:0]),
			   .io_jbi_j_adtype_ff(io_jbi_j_adtype_ff[`JBI_ADTYPE_JID_HI:`JBI_ADTYPE_JID_LO]),
			   .parse_wdq_push(parse_wdq_push),
			   .parse_sctag_req(parse_sctag_req[2:0]),
			   .parse_hdr	(parse_hdr),
			   .parse_rw	(parse_rw),
			   .parse_subline_req(parse_subline_req),
			   .parse_install_mode(parse_install_mode),
			   .parse_data_err(parse_data_err),
			   .parse_err_nonex_rd(parse_err_nonex_rd),
			   .rdq0_full	(rdq0_full),
			   .rdq1_full	(rdq1_full),
			   .rdq2_full	(rdq2_full),
			   .rdq3_full	(rdq3_full),
			   .wdq_rdata	(wdq_rdata[`JBI_WDQ_WIDTH-1:0]),
			   .rhq0_full	(rhq0_full),
			   .rhq1_full	(rhq1_full),
			   .rhq2_full	(rhq2_full),
			   .rhq3_full	(rhq3_full));
jbi_min_wdq_buf u_wdq_buf (/*AUTOINST*/
			   // Outputs
			   .wdq_rdata	(wdq_rdata[`JBI_WDQ_WIDTH-1:0]),
			   // Inputs
			   .clk		(clk),
			   .arst_l	(arst_l),
			   .testmux_sel	(testmux_sel),
			   .hold	(hold),
			   .rst_tri_en	(rst_tri_en),
			   .wdq_wr_en	(wdq_wr_en),
			   .wdq_rd_en	(wdq_rd_en),
			   .wdq_waddr	(wdq_waddr[`JBI_WDQ_ADDR_WIDTH-1:0]),
			   .wdq_raddr	(wdq_raddr[`JBI_WDQ_ADDR_WIDTH-1:0]),
			   .wdq_wdata	(wdq_wdata[127:0]),
			   .wdq_wdata_ecc0(wdq_wdata_ecc0[6:0]),
			   .wdq_wdata_ecc1(wdq_wdata_ecc1[6:0]),
			   .wdq_wdata_ecc2(wdq_wdata_ecc2[6:0]),
			   .wdq_wdata_ecc3(wdq_wdata_ecc3[6:0]));
endmodule