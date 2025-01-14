module or1200_sb(
	// RISC clock, reset
	clk, rst,
	// Internal RISC bus (DC<->SB)
	dcsb_dat_i, dcsb_adr_i, dcsb_cyc_i, dcsb_stb_i, dcsb_we_i, dcsb_sel_i, dcsb_cab_i,
	dcsb_dat_o, dcsb_ack_o, dcsb_err_o,
	// BIU bus
	sbbiu_dat_o, sbbiu_adr_o, sbbiu_cyc_o, sbbiu_stb_o, sbbiu_we_o, sbbiu_sel_o, sbbiu_cab_o,
	sbbiu_dat_i, sbbiu_ack_i, sbbiu_err_i
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_OPERAND_WIDTH;
// RISC clock, reset
input			clk;		// RISC clock
input			rst;		// RISC reset
// Internal RISC bus (DC<->SB)
input	[dw-1:0]	dcsb_dat_i;	// input data bus
input	[aw-1:0]	dcsb_adr_i;	// address bus
input			dcsb_cyc_i;	// WB cycle
input			dcsb_stb_i;	// WB strobe
input			dcsb_we_i;	// WB write enable
input			dcsb_cab_i;	// CAB input
input	[3:0]		dcsb_sel_i;	// byte selects
output	[dw-1:0]	dcsb_dat_o;	// output data bus
output			dcsb_ack_o;	// ack output
output			dcsb_err_o;	// err output
// BIU bus
output	[dw-1:0]	sbbiu_dat_o;	// output data bus
output	[aw-1:0]	sbbiu_adr_o;	// address bus
output			sbbiu_cyc_o;	// WB cycle
output			sbbiu_stb_o;	// WB strobe
output			sbbiu_we_o;	// WB write enable
output			sbbiu_cab_o;	// CAB input
output	[3:0]		sbbiu_sel_o;	// byte selects
input	[dw-1:0]	sbbiu_dat_i;	// input data bus
input			sbbiu_ack_i;	// ack output
input			sbbiu_err_i;	// err output
`ifdef OR1200_SB_IMPLEMENTED
// Internal wires and regs
wire	[4+dw+aw-1:0]	fifo_dat_i;	// FIFO data in
wire	[4+dw+aw-1:0]	fifo_dat_o;	// FIFO data out
wire			fifo_wr;
wire			fifo_rd;
wire			fifo_full;
wire			fifo_empty;
wire			sel_sb;
reg			outstanding_store;
reg			fifo_wr_ack;
// FIFO data in/out
assign fifo_dat_i = {dcsb_sel_i, dcsb_dat_i, dcsb_adr_i};
assign {sbbiu_sel_o, sbbiu_dat_o, sbbiu_adr_o} = sel_sb ? fifo_dat_o : {dcsb_sel_i, dcsb_dat_i, dcsb_adr_i};
// Control
assign fifo_wr = dcsb_cyc_i & dcsb_stb_i & dcsb_we_i & ~fifo_full & ~fifo_wr_ack;
assign fifo_rd = ~outstanding_store;
assign dcsb_dat_o = sbbiu_dat_i;
assign dcsb_ack_o = sel_sb ? fifo_wr_ack : sbbiu_ack_i;
assign dcsb_err_o = sel_sb ? 1'b0 : sbbiu_err_i;	// SB never returns error
assign sbbiu_cyc_o = sel_sb ? outstanding_store : dcsb_cyc_i;
assign sbbiu_stb_o = sel_sb ? outstanding_store : dcsb_stb_i;
assign sbbiu_we_o = sel_sb ? 1'b1 : dcsb_we_i;
assign sbbiu_cab_o = sel_sb ? 1'b0 : dcsb_cab_i;
assign sel_sb = ~fifo_empty | (fifo_empty & outstanding_store); // | fifo_wr;
// Store buffer FIFO instantiation
or1200_sb_fifo or1200_sb_fifo (
	.clk_i(clk),
	.rst_i(rst),
	.dat_i(fifo_dat_i),
	.wr_i(fifo_wr),
	.rd_i(fifo_rd),
	.dat_o(fifo_dat_o),
	.full_o(fifo_full),
	.empty_o(fifo_empty)
);
// fifo_rd
always @(posedge clk or posedge rst)
	if (rst)
		outstanding_store <= #1 1'b0;
	else if (sbbiu_ack_i)
		outstanding_store <= #1 1'b0;
	else if (sel_sb | fifo_wr)
		outstanding_store <= #1 1'b1;
// fifo_wr_ack
always @(posedge clk or posedge rst)
	if (rst)
		fifo_wr_ack <= #1 1'b0;
	else if (fifo_wr)
		fifo_wr_ack <= #1 1'b1;
	else
		fifo_wr_ack <= #1 1'b0;
`else	// !OR1200_SB_IMPLEMENTED
assign sbbiu_dat_o = dcsb_dat_i;
assign sbbiu_adr_o = dcsb_adr_i;
assign sbbiu_cyc_o = dcsb_cyc_i;
assign sbbiu_stb_o = dcsb_stb_i;
assign sbbiu_we_o = dcsb_we_i;
assign sbbiu_cab_o = dcsb_cab_i;
assign sbbiu_sel_o = dcsb_sel_i;
assign dcsb_dat_o = sbbiu_dat_i;
assign dcsb_ack_o = sbbiu_ack_i;
assign dcsb_err_o = sbbiu_err_i;
`endif
endmodule