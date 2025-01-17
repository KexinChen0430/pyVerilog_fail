module or1200_rf(
	// Clock and reset
	clk, rst,
	// Write i/f
	supv, wb_freeze, addrw, dataw, we, flushpipe,
	// Read i/f
	id_freeze, addra, addrb, dataa, datab, rda, rdb,
	// Debug
	spr_cs, spr_write, spr_addr, spr_dat_i, spr_dat_o
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_REGFILE_ADDR_WIDTH;
// I/O
// Clock and reset
input				clk;
input				rst;
// Write i/f
input				supv;
input				wb_freeze;
input	[aw-1:0]		addrw;
input	[dw-1:0]		dataw;
input				we;
input				flushpipe;
// Read i/f
input				id_freeze;
input	[aw-1:0]		addra;
input	[aw-1:0]		addrb;
output	[dw-1:0]		dataa;
output	[dw-1:0]		datab;
input				rda;
input				rdb;
// SPR access for debugging purposes
input				spr_cs;
input				spr_write;
input	[31:0]			spr_addr;
input	[31:0]			spr_dat_i;
output	[31:0]			spr_dat_o;
// Internal wires and regs
wire	[dw-1:0]		from_rfa;
wire	[dw-1:0]		from_rfb;
reg	[dw:0]			dataa_saved;
reg	[dw:0]			datab_saved;
wire	[aw-1:0]		rf_addra;
wire	[aw-1:0]		rf_addrw;
wire	[dw-1:0]		rf_dataw;
wire				rf_we;
wire				spr_valid;
wire				rf_ena;
wire				rf_enb;
reg				rf_we_allow;
// SPR access is valid when spr_cs is asserted and
// SPR address matches GPR addresses
assign spr_valid = spr_cs & (spr_addr[10:5] == `OR1200_SPR_RF);
// SPR data output is always from RF A
assign spr_dat_o = from_rfa;
// Operand A comes from RF or from saved A register
assign dataa = (dataa_saved[32]) ? dataa_saved[31:0] : from_rfa;
// Operand B comes from RF or from saved B register
assign datab = (datab_saved[32]) ? datab_saved[31:0] : from_rfb;
// RF A read address is either from SPRS or normal from CPU control
assign rf_addra = (spr_valid & !spr_write) ? spr_addr[4:0] : addra;
// RF write address is either from SPRS or normal from CPU control
assign rf_addrw = (spr_valid & spr_write) ? spr_addr[4:0] : addrw;
// RF write data is either from SPRS or normal from CPU datapath
assign rf_dataw = (spr_valid & spr_write) ? spr_dat_i : dataw;
// RF write enable is either from SPRS or normal from CPU control
always @(posedge rst or posedge clk)
	if (rst)
		rf_we_allow <= #1 1'b1;
	else if (~wb_freeze)
		rf_we_allow <= #1 ~flushpipe;
assign rf_we = ((spr_valid & spr_write) | (we & ~wb_freeze)) & rf_we_allow & (supv | (|rf_addrw));
// CS RF A asserted when instruction reads operand A and ID stage
// is not stalled
assign rf_ena = rda & ~id_freeze | spr_valid;	// probably works with fixed binutils
// assign rf_ena = 1'b1;			// does not work with single-stepping
//assign rf_ena = ~id_freeze | spr_valid;	// works with broken binutils
// CS RF B asserted when instruction reads operand B and ID stage
// is not stalled
assign rf_enb = rdb & ~id_freeze | spr_valid;
// assign rf_enb = 1'b1;
//assign rf_enb = ~id_freeze | spr_valid;	// works with broken binutils
// Stores operand from RF_A into temp reg when pipeline is frozen
always @(posedge clk or posedge rst)
	if (rst) begin
		dataa_saved <= #1 33'b0;
	end
	else if (id_freeze & !dataa_saved[32]) begin
		dataa_saved <= #1 {1'b1, from_rfa};
	end
	else if (!id_freeze)
		dataa_saved <= #1 33'b0;
// Stores operand from RF_B into temp reg when pipeline is frozen
always @(posedge clk or posedge rst)
	if (rst) begin
		datab_saved <= #1 33'b0;
	end
	else if (id_freeze & !datab_saved[32]) begin
		datab_saved <= #1 {1'b1, from_rfb};
	end
	else if (!id_freeze)
		datab_saved <= #1 33'b0;
`ifdef OR1200_RFRAM_TWOPORT
// Instantiation of register file two-port RAM A
or1200_tpram_32x32 rf_a(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_ena),
	.we_a(1'b0),
	.oe_a(1'b1),
	.addr_a(rf_addra),
	.di_a(32'h0000_0000),
	.do_a(from_rfa),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we),
	.we_b(rf_we),
	.oe_b(1'b0),
	.addr_b(rf_addrw),
	.di_b(rf_dataw),
	.do_b()
);
// Instantiation of register file two-port RAM B
or1200_tpram_32x32 rf_b(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_enb),
	.we_a(1'b0),
	.oe_a(1'b1),
	.addr_a(addrb),
	.di_a(32'h0000_0000),
	.do_a(from_rfb),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we),
	.we_b(rf_we),
	.oe_b(1'b0),
	.addr_b(rf_addrw),
	.di_b(rf_dataw),
	.do_b()
);
`else
`ifdef OR1200_RFRAM_DUALPORT
// Instantiation of register file two-port RAM A
or1200_dpram_32x32 rf_a(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_ena),
	.oe_a(1'b1),
	.addr_a(rf_addra),
	.do_a(from_rfa),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we),
	.we_b(rf_we),
	.addr_b(rf_addrw),
	.di_b(rf_dataw)
);
// Instantiation of register file two-port RAM B
or1200_dpram_32x32 rf_b(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_enb),
	.oe_a(1'b1),
	.addr_a(addrb),
	.do_a(from_rfb),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we),
	.we_b(rf_we),
	.addr_b(rf_addrw),
	.di_b(rf_dataw)
);
`else
`ifdef OR1200_RFRAM_GENERIC
// Instantiation of generic (flip-flop based) register file
or1200_rfram_generic rf_a(
	// Clock and reset
	.clk(clk),
	.rst(rst),
	// Port A
	.ce_a(rf_ena),
	.addr_a(rf_addra),
	.do_a(from_rfa),
	// Port B
	.ce_b(rf_enb),
	.addr_b(addrb),
	.do_b(from_rfb),
	// Port W
	.ce_w(rf_we),
	.we_w(rf_we),
	.addr_w(rf_addrw),
	.di_w(rf_dataw)
);
`else
// RFRAM type not specified
initial begin
	$display("Define RFRAM type.");
	$finish;
end
`endif
`endif
`endif
endmodule