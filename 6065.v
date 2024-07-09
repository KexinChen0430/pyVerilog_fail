module or1200_ic_ram(
	// Clock and reset
	clk, rst,
`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
	// Internal i/f
	addr, en, we, datain, dataout
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_ICINDX;
// I/O
input 				clk;
input				rst;
input	[aw-1:0]		addr;
input				en;
input	[3:0]			we;
input	[dw-1:0]		datain;
output	[dw-1:0]		dataout;
`ifdef OR1200_BIST
// RAM BIST
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif
`ifdef OR1200_NO_IC
// Insn cache not implemented
assign dataout = {dw{1'b0}};
`ifdef OR1200_BIST
assign mbist_so_o = mbist_si_i;
`endif
`else
// Instantiation of IC RAM block
`ifdef OR1200_IC_1W_512B
or1200_spram_128x32 ic_ram0(
`endif
`ifdef OR1200_IC_1W_4KB
or1200_spram_1024x32 ic_ram0(
`endif
`ifdef OR1200_IC_1W_8KB
or1200_spram_2048x32 ic_ram0(
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
	.we(we[0]),
	.oe(1'b1),
	.addr(addr),
	.di(datain),
	.doq(dataout)
);
`endif
endmodule