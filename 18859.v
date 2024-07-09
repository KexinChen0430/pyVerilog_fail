module or1200_dc_tag(
	// Clock and reset
	clk, rst,
`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
	// Internal i/f
	addr, en, we, datain, tag_v, tag
);
parameter dw = `OR1200_DCTAG_W;
parameter aw = `OR1200_DCTAG;
// I/O
input				clk;
input				rst;
input	[aw-1:0]		addr;
input				en;
input				we;
input	[dw-1:0]		datain;
output				tag_v;
output	[dw-2:0]		tag;
`ifdef OR1200_BIST
// RAM BIST
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif
`ifdef OR1200_NO_DC
// Data cache not implemented
assign tag = {dw-1{1'b0}};
assign tag_v = 1'b0;
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif
`else
// Instantiation of TAG RAM block
`ifdef OR1200_DC_1W_4KB
or1200_spram_256x21 dc_tag0(
`endif
`ifdef OR1200_DC_1W_8KB
or1200_spram_512x20 dc_tag0(
`endif
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(mbist_si_i),
	.mbist_so_o(mbist_so_o),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.clk(clk),
	.rst(rst),
	.ce(en),
	.we(we),
	.oe(1'b1),
	.addr(addr),
	.di(datain),
	.doq({tag, tag_v})
);
`endif
endmodule