module
// Instantiation of Data Cache
or1200_dc_top or1200_dc_top(
	.clk(clk),
	.rst(rst),
	// DC and QMEM
	.dc_en(dc_en),
	.dcqmem_adr_i(dcqmem_adr_i),
	.dcqmem_cycstb_i(dcqmem_cycstb_i),
	.dcqmem_ci_i(dcqmem_ci_i),
	.dcqmem_we_i(dcqmem_we_i),
	.dcqmem_sel_i(dcqmem_sel_i),
	.dcqmem_tag_i(dcqmem_tag_i),
	.dcqmem_dat_i(dcqmem_dat_i),
	.dcqmem_dat_o(dcqmem_dat_o),
	.dcqmem_ack_o(dcqmem_ack_o),
	.dcqmem_rty_o(dcqmem_rty_o),
	.dcqmem_err_o(dcqmem_err_o),
	.dcqmem_tag_o(dcqmem_tag_o),
	// SPR access
	.spr_cs(spr_cs),
	.spr_write(spr_write),
	.spr_dat_i(spr_dat_i[`OR1200_DCINDXH:`OR1200_DCLS]),
	// DC and BIU
	.dcsb_dat_o(dcsb_dat_o),
	.dcsb_adr_o(dcsb_adr_o),
	.dcsb_cyc_o(dcsb_cyc_o),
	.dcsb_stb_o(dcsb_stb_o),
	.dcsb_we_o(dcsb_we_o),
	.dcsb_sel_o(dcsb_sel_o),
	.dcsb_cab_o(dcsb_cab_o),
	.dcsb_dat_i(dcsb_dat_i),
	.dcsb_ack_i(dcsb_ack_i),
	.dcsb_err_i(dcsb_err_i),
        .tag_v(tag_v),
	.tag(tag),
	.from_dcram(from_dcram),
	.dc_addr(dc_addr),
	.dcram_we(dcram_we),
	.to_dcram(to_dcram),
	.dctag_addr(dctag_addr),
	.dctag_en(dctag_en),
	.dctag_we(dctag_we),
	.dctag_v(dctag_v)
);
// Instantiation of DC main memory
or1200_dc_ram or1200_dc_ram(
	.clk(clk),
	.rst(rst),
	.addr(dc_addr[`OR1200_DCINDXH:2]),
	.en(dc_en),
	.we(dcram_we),
	.datain(to_dcram),
	.dataout(from_dcram)
);
// Instantiation of DC TAG memory
or1200_dc_tag or1200_dc_tag(
	.clk(clk),
	.rst(rst),
	.addr(dctag_addr),
	.en(dctag_en),
	.we(dctag_we),
	.datain({dc_addr[31:`OR1200_DCTAGL], dctag_v}),
	.tag_v(tag_v),
	.tag(tag)
);
endmodule