module outputs)
wire			cpu_rx_en_ff;		// From u_dff_cpu_rx_en_ff of dff_ns.v
wire			cpu_tx_en_ff;		// From u_dff_cpu_tx_en_ff of dff_ns.v
wire			issue_rdq_pop;		// From u_issue of jbi_min_rq_issue.v
wire			issue_rhq_pop;		// From u_issue of jbi_min_rq_issue.v
wire [`JBI_RDQ_ADDR_WIDTH-1:0]rdq_raddr;	// From u_rdq_ctl of jbi_min_rq_rdq_ctl.v
wire			rdq_rd_en;		// From u_rdq_ctl of jbi_min_rq_rdq_ctl.v
wire [`JBI_RDQ_WIDTH-1:0]rdq_rdata;		// From u_rdq_buf of jbi_min_rq_rdq_buf.v
wire [`JBI_RDQ_ADDR_WIDTH-1:0]rdq_waddr;	// From u_rdq_ctl of jbi_min_rq_rdq_ctl.v
wire			rdq_wr_en;		// From u_rdq_ctl of jbi_min_rq_rdq_ctl.v
wire			rhq_csn_rd;		// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
wire			rhq_csn_wr;		// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
wire			rhq_drdy;		// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
wire [`JBI_RHQ_ADDR_WIDTH-1:0]rhq_raddr;	// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
wire [`JBI_RHQ_WIDTH-1:0]rhq_rdata;		// From u_rhq_buf of jbi_min_rq_rhq_buf.v
wire			rhq_rdata_rw;		// From u_issue of jbi_min_rq_issue.v
wire			rhq_rdata_tag_byps;	// From u_rhq_tag of jbi_min_rq_tag.v
wire [`JBI_RHQ_ADDR_WIDTH-1:0]rhq_tag_raddr;	// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
wire [`JBI_RHQ_ADDR_WIDTH-1:0]rhq_waddr;	// From u_rhq_ctl of jbi_min_rq_rhq_ctl.v
// End of automatics
// Local signal declarations
// Code start here
// Flop Sync Pulses
/* dff_ns AUTO_TEMPLATE (
 .din(cpu_rx_en),
 .clk(cpu_clk),
 .q(cpu_rx_en_ff),
 ); */
dff_ns #(1) u_dff_cpu_rx_en_ff (/*AUTOINST*/
				// Outputs
				.q	(cpu_rx_en_ff),		 // Templated
				// Inputs
				.din	(cpu_rx_en),		 // Templated
				.clk	(cpu_clk));		 // Templated
/* dff_ns AUTO_TEMPLATE (
 .din(cpu_tx_en),
 .clk(cpu_clk),
 .q(cpu_tx_en_ff),
 ); */
dff_ns #(1) u_dff_cpu_tx_en_ff (/*AUTOINST*/
				// Outputs
				.q	(cpu_tx_en_ff),		 // Templated
				// Inputs
				.din	(cpu_tx_en),		 // Templated
				.clk	(cpu_clk));		 // Templated
// Request Issue Block
/* jbi_min_rq_issue AUTO_TEMPLATE (
 .cpu_rx_en	(cpu_rx_en_ff),
 .biq_drdy      (1'b0),
 .biq_rdata_data ({`JBI_BIQ_DATA_WIDTH{1'b0}}),
 .biq_rdata_ecc  ({`JBI_BIQ_ECC_WIDTH{1'b0}}),
 .issue_biq_\(.*\) (),
 ); */
jbi_min_rq_issue u_issue (/*AUTOINST*/
			  // Outputs
			  .issue_rhq_pop(issue_rhq_pop),
			  .issue_rdq_pop(issue_rdq_pop),
			  .rhq_rdata_rw	(rhq_rdata_rw),
			  .issue_biq_data_pop(),		 // Templated
			  .issue_biq_hdr_pop(),			 // Templated
			  .jbi_sctag_req_vld(jbi_sctag_req_vld),
			  .jbi_sctag_req(jbi_sctag_req[31:0]),
			  .jbi_scbuf_ecc(jbi_scbuf_ecc[6:0]),
			  // Inputs
			  .clk		(clk),
			  .rst_l	(rst_l),
			  .cpu_clk	(cpu_clk),
			  .cpu_rst_l	(cpu_rst_l),
			  .cpu_rx_en	(cpu_rx_en_ff),		 // Templated
			  .csr_jbi_config2_max_wris(csr_jbi_config2_max_wris[1:0]),
			  .rhq_drdy	(rhq_drdy),
			  .rhq_rdata	(rhq_rdata[`JBI_RHQ_WIDTH-1:0]),
			  .rdq_rdata	(rdq_rdata[`JBI_RDQ_WIDTH-1:0]),
			  .biq_drdy	(1'b0),			 // Templated
			  .biq_rdata_data({`JBI_BIQ_DATA_WIDTH{1'b0}}), // Templated
			  .biq_rdata_ecc({`JBI_BIQ_ECC_WIDTH{1'b0}}), // Templated
			  .sctag_jbi_iq_dequeue(sctag_jbi_iq_dequeue),
			  .sctag_jbi_wib_dequeue(sctag_jbi_wib_dequeue));
// Request Header Queue
/* jbi_min_rq_rhq_ctl AUTO_TEMPLATE (
 .cpu_tx_en	(cpu_tx_en_ff),
 .cpu_rx_en	(cpu_rx_en_ff),
 ); */
jbi_min_rq_rhq_ctl u_rhq_ctl (/*AUTOINST*/
			      // Outputs
			      .min_csr_err_l2_to(min_csr_err_l2_to),
			      .min_csr_perf_blk_q(min_csr_perf_blk_q[3:0]),
			      .rhq_full	(rhq_full),
			      .rhq_drdy	(rhq_drdy),
			      .rhq_csn_wr(rhq_csn_wr),
			      .rhq_csn_rd(rhq_csn_rd),
			      .rhq_waddr(rhq_waddr[`JBI_RHQ_ADDR_WIDTH-1:0]),
			      .rhq_raddr(rhq_raddr[`JBI_RHQ_ADDR_WIDTH-1:0]),
			      .rhq_tag_raddr(rhq_tag_raddr[`JBI_RHQ_ADDR_WIDTH-1:0]),
			      // Inputs
			      .clk	(clk),
			      .rst_l	(rst_l),
			      .cpu_clk	(cpu_clk),
			      .cpu_rst_l(cpu_rst_l),
			      .cpu_tx_en(cpu_tx_en_ff),		 // Templated
			      .cpu_rx_en(cpu_rx_en_ff),		 // Templated
			      .csr_jbi_l2_timeout_timeval(csr_jbi_l2_timeout_timeval[31:0]),
			      .csr_jbi_config2_max_rd(csr_jbi_config2_max_rd[1:0]),
			      .csr_jbi_config2_max_wr(csr_jbi_config2_max_wr[3:0]),
			      .wdq_rhq_push(wdq_rhq_push),
			      .issue_rhq_pop(issue_rhq_pop),
			      .rhq_rdata_rw(rhq_rdata_rw),
			      .rhq_rdata_tag_byps(rhq_rdata_tag_byps),
			      .mout_scb_jbus_rd_ack(mout_scb_jbus_rd_ack),
			      .mout_scb_jbus_wr_ack(mout_scb_jbus_wr_ack));
jbi_min_rq_rhq_buf u_rhq_buf (/*AUTOINST*/
			      // Outputs
			      .rhq_rdata(rhq_rdata[`JBI_RHQ_WIDTH-1:0]),
			      // Inputs
			      .clk	(clk),
			      .cpu_clk	(cpu_clk),
			      .hold	(hold),
			      .csr_16x65array_margin(csr_16x65array_margin[4:0]),
			      .testmux_sel(testmux_sel),
			      .rhq_csn_wr(rhq_csn_wr),
			      .rhq_csn_rd(rhq_csn_rd),
			      .rhq_waddr(rhq_waddr[`JBI_RHQ_ADDR_WIDTH-1:0]),
			      .rhq_raddr(rhq_raddr[`JBI_RHQ_ADDR_WIDTH-1:0]),
			      .wdq_rhq_wdata(wdq_rhq_wdata[`JBI_RHQ_WIDTH-1:0]));
/* jbi_min_rq_tag AUTO_TEMPLATE (
 .raddr (rhq_tag_raddr[]),
 .tag_byps_in (wdq_rq_tag_byps),
 .tag_in (wrtrk_new_wri_tag[]),
 .csn_wr (rhq_csn_wr),
 .waddr (rhq_waddr[]),
 .c_tag_byps_out (rhq_rdata_tag_byps),
 .cpu_rx_en	(cpu_rx_en_ff),
 ); */
jbi_min_rq_tag u_rhq_tag (/*AUTOINST*/
			  // Outputs
			  .c_tag_byps_out(rhq_rdata_tag_byps),	 // Templated
			  // Inputs
			  .clk		(clk),
			  .rst_l	(rst_l),
			  .cpu_clk	(cpu_clk),
			  .cpu_rst_l	(cpu_rst_l),
			  .cpu_rx_en	(cpu_rx_en_ff),		 // Templated
			  .wrtrk_oldest_wri_tag(wrtrk_oldest_wri_tag[`JBI_WRI_TAG_WIDTH-1:0]),
			  .raddr	(rhq_tag_raddr[3:0]),	 // Templated
			  .tag_byps_in	(wdq_rq_tag_byps),	 // Templated
			  .tag_in	(wrtrk_new_wri_tag[`JBI_WRI_TAG_WIDTH-1:0]), // Templated
			  .csn_wr	(rhq_csn_wr),		 // Templated
			  .waddr	(rhq_waddr[3:0]));	 // Templated
// Request Data Queue
/* jbi_min_rq_rdq_ctl AUTO_TEMPLATE (
 .cpu_tx_en	(cpu_tx_en_ff),
 .cpu_rx_en	(cpu_rx_en_ff),
 ); */
jbi_min_rq_rdq_ctl u_rdq_ctl (/*AUTOINST*/
			      // Outputs
			      .rdq_full	(rdq_full),
			      .rdq_wr_en(rdq_wr_en),
			      .rdq_rd_en(rdq_rd_en),
			      .rdq_waddr(rdq_waddr[`JBI_RDQ_ADDR_WIDTH-1:0]),
			      .rdq_raddr(rdq_raddr[`JBI_RDQ_ADDR_WIDTH-1:0]),
			      // Inputs
			      .clk	(clk),
			      .rst_l	(rst_l),
			      .cpu_clk	(cpu_clk),
			      .cpu_rst_l(cpu_rst_l),
			      .cpu_tx_en(cpu_tx_en_ff),		 // Templated
			      .cpu_rx_en(cpu_rx_en_ff),		 // Templated
			      .wdq_rdq_push(wdq_rdq_push),
			      .issue_rdq_pop(issue_rdq_pop));
jbi_min_rq_rdq_buf u_rdq_buf (/*AUTOINST*/
			      // Outputs
			      .rdq_rdata(rdq_rdata[`JBI_RDQ_WIDTH-1:0]),
			      // Inputs
			      .clk	(clk),
			      .cpu_clk	(cpu_clk),
			      .arst_l	(arst_l),
			      .hold	(hold),
			      .rst_tri_en(rst_tri_en),
			      .rdq_wr_en(rdq_wr_en),
			      .rdq_rd_en(rdq_rd_en),
			      .rdq_waddr(rdq_waddr[`JBI_RDQ_ADDR_WIDTH-1:0]),
			      .rdq_raddr(rdq_raddr[`JBI_RDQ_ADDR_WIDTH-1:0]),
			      .wdq_rdq_wdata(wdq_rdq_wdata[`JBI_RDQ_WIDTH-1:0]));
// Request Header Queue
/* zzecc_sctag_pgen_32b AUTO_TEMPLATE (
 .dout (),
 .parity (biq_wdata_ecc@[]),
 .din (bsc_jbi_sctag_req_ff[((@+1)*32-1):(@*32)]),
 ); */
//zzecc_sctag_pgen_32b u_biq_ecc0 (/*AUTOINST*/);
//zzecc_sctag_pgen_32b u_biq_ecc1 (/*AUTOINST*/);
/* jbi_min_rq_biq_ctl AUTO_TEMPLATE (
 .cpu_tx_en	(cpu_tx_en_ff),
 .cpu_rx_en	(cpu_rx_en_ff),
 ); */
//jbi_min_rq_biq_ctl u_biq_ctl (/*AUTOINST*/);
//jbi_min_rq_biq_buf u_biq_buf (/*AUTOINST*/);
endmodule