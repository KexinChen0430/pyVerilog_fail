module or1200_mult_mac(
	// Clock and reset
	clk, rst,
	// Multiplier/MAC interface
	ex_freeze, id_macrc_op, macrc_op, a, b, mac_op, alu_op, result, mac_stall_r,
	// SPR interface
	spr_cs, spr_write, spr_addr, spr_dat_i, spr_dat_o
);
parameter width = `OR1200_OPERAND_WIDTH;
// I/O
// Clock and reset
input				clk;
input				rst;
// Multiplier/MAC interface
input				ex_freeze;
input				id_macrc_op;
input				macrc_op;
input	[width-1:0]		a;
input	[width-1:0]		b;
input	[`OR1200_MACOP_WIDTH-1:0]	mac_op;
input	[`OR1200_ALUOP_WIDTH-1:0]	alu_op;
output	[width-1:0]		result;
output				mac_stall_r;
// SPR interface
input				spr_cs;
input				spr_write;
input	[31:0]			spr_addr;
input	[31:0]			spr_dat_i;
output	[31:0]			spr_dat_o;
// Internal wires and regs
`ifdef OR1200_MULT_IMPLEMENTED
reg	[width-1:0]		result;
reg	[2*width-1:0]		mul_prod_r;
`else
wire	[width-1:0]		result;
wire	[2*width-1:0]		mul_prod_r;
`endif
wire	[2*width-1:0]		mul_prod;
wire	[`OR1200_MACOP_WIDTH-1:0]	mac_op;
`ifdef OR1200_MAC_IMPLEMENTED
reg	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r1;
reg	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r2;
reg	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r3;
reg				mac_stall_r;
reg	[2*width-1:0]		mac_r;
`else
wire	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r1;
wire	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r2;
wire	[`OR1200_MACOP_WIDTH-1:0]	mac_op_r3;
wire				mac_stall_r;
wire	[2*width-1:0]		mac_r;
`endif
wire	[width-1:0]		x;
wire	[width-1:0]		y;
wire				spr_maclo_we;
wire				spr_machi_we;
wire				alu_op_div_divu;
wire				alu_op_div;
reg				div_free;
`ifdef OR1200_IMPL_DIV
wire	[width-1:0]		div_tmp;
reg	[5:0]			div_cntr;
`endif
// Combinatorial logic
`ifdef OR1200_MAC_IMPLEMENTED
assign spr_maclo_we = spr_cs & spr_write & spr_addr[`OR1200_MAC_ADDR];
assign spr_machi_we = spr_cs & spr_write & !spr_addr[`OR1200_MAC_ADDR];
assign spr_dat_o = spr_addr[`OR1200_MAC_ADDR] ? mac_r[31:0] : mac_r[63:32];
`else
assign spr_maclo_we = 1'b0;
assign spr_machi_we = 1'b0;
assign spr_dat_o = 32'h0000_0000;
`endif
`ifdef OR1200_LOWPWR_MULT
assign x = (alu_op_div & a[31]) ? ~a + 1'b1 : alu_op_div_divu | (alu_op == `OR1200_ALUOP_MUL) | (|mac_op) ? a : 32'h0000_0000;
assign y = (alu_op_div & b[31]) ? ~b + 1'b1 : alu_op_div_divu | (alu_op == `OR1200_ALUOP_MUL) | (|mac_op) ? b : 32'h0000_0000;
`else
assign x = alu_op_div & a[31] ? ~a + 32'b1 : a;
assign y = alu_op_div & b[31] ? ~b + 32'b1 : b;
`endif
`ifdef OR1200_IMPL_DIV
assign alu_op_div = (alu_op == `OR1200_ALUOP_DIV);
assign alu_op_div_divu = alu_op_div | (alu_op == `OR1200_ALUOP_DIVU);
assign div_tmp = mul_prod_r[63:32] - y;
`else
assign alu_op_div = 1'b0;
assign alu_op_div_divu = 1'b0;
`endif
`ifdef OR1200_MULT_IMPLEMENTED
// Select result of current ALU operation to be forwarded
// to next instruction and to WB stage
always @(alu_op or mul_prod_r or mac_r or a or b)
	casex(alu_op)	// synopsys parallel_case
`ifdef OR1200_IMPL_DIV
		`OR1200_ALUOP_DIV:
			result = a[31] ^ b[31] ? ~mul_prod_r[31:0] + 1'b1 : mul_prod_r[31:0];
		`OR1200_ALUOP_DIVU,
`endif
		`OR1200_ALUOP_MUL: begin
			result = mul_prod_r[31:0];
		end
		default:
`ifdef OR1200_MAC_SHIFTBY
			result = mac_r[`OR1200_MAC_SHIFTBY+31:`OR1200_MAC_SHIFTBY];
`else
			result = mac_r[31:0];
`endif
	endcase
// Instantiation of the multiplier
`ifdef OR1200_ASIC_MULTP2_32X32
or1200_amultp2_32x32 or1200_amultp2_32x32(
	.X(x),
	.Y(y),
	.RST(rst),
	.CLK(clk),
	.P(mul_prod)
);
`else // OR1200_ASIC_MULTP2_32X32
or1200_gmultp2_32x32 or1200_gmultp2_32x32(
	.X(x),
	.Y(y),
	.RST(rst),
	.CLK(clk),
	.P(mul_prod)
);
`endif // OR1200_ASIC_MULTP2_32X32
// Registered output from the multiplier and
// an optional divider
always @(posedge rst or posedge clk)
	if (rst) begin
		mul_prod_r <= #1 64'h0000_0000_0000_0000;
		div_free <= #1 1'b1;
`ifdef OR1200_IMPL_DIV
		div_cntr <= #1 6'b00_0000;
`endif
	end
`ifdef OR1200_IMPL_DIV
	else if (|div_cntr) begin
		if (div_tmp[31])
			mul_prod_r <= #1 {mul_prod_r[62:0], 1'b0};
		else
			mul_prod_r <= #1 {div_tmp[30:0], mul_prod_r[31:0], 1'b1};
		div_cntr <= #1 div_cntr - 1'b1;
	end
	else if (alu_op_div_divu && div_free) begin
		mul_prod_r <= #1 {31'b0, x[31:0], 1'b0};
		div_cntr <= #1 6'b10_0000;
		div_free <= #1 1'b0;
	end
`endif // OR1200_IMPL_DIV
	else if (div_free | !ex_freeze) begin
		mul_prod_r <= #1 mul_prod[63:0];
		div_free <= #1 1'b1;
	end
`else // OR1200_MULT_IMPLEMENTED
assign result = {width{1'b0}};
assign mul_prod = {2*width{1'b0}};
assign mul_prod_r = {2*width{1'b0}};
`endif // OR1200_MULT_IMPLEMENTED
`ifdef OR1200_MAC_IMPLEMENTED
// Propagation of l.mac opcode
always @(posedge clk or posedge rst)
	if (rst)
		mac_op_r1 <= #1 `OR1200_MACOP_WIDTH'b0;
	else
		mac_op_r1 <= #1 mac_op;
// Propagation of l.mac opcode
always @(posedge clk or posedge rst)
	if (rst)
		mac_op_r2 <= #1 `OR1200_MACOP_WIDTH'b0;
	else
		mac_op_r2 <= #1 mac_op_r1;
// Propagation of l.mac opcode
always @(posedge clk or posedge rst)
	if (rst)
		mac_op_r3 <= #1 `OR1200_MACOP_WIDTH'b0;
	else
		mac_op_r3 <= #1 mac_op_r2;
// Implementation of MAC
always @(posedge rst or posedge clk)
	if (rst)
		mac_r <= #1 64'h0000_0000_0000_0000;
`ifdef OR1200_MAC_SPR_WE
	else if (spr_maclo_we)
		mac_r[31:0] <= #1 spr_dat_i;
	else if (spr_machi_we)
		mac_r[63:32] <= #1 spr_dat_i;
`endif
	else if (mac_op_r3 == `OR1200_MACOP_MAC)
		mac_r <= #1 mac_r + mul_prod_r;
	else if (mac_op_r3 == `OR1200_MACOP_MSB)
		mac_r <= #1 mac_r - mul_prod_r;
	else if (macrc_op & !ex_freeze)
		mac_r <= #1 64'h0000_0000_0000_0000;
// Stall CPU if l.macrc is in ID and MAC still has to process l.mac instructions
// in EX stage (e.g. inside multiplier)
// This stall signal is also used by the divider.
always @(posedge rst or posedge clk)
	if (rst)
		mac_stall_r <= #1 1'b0;
	else
		mac_stall_r <= #1 (|mac_op | (|mac_op_r1) | (|mac_op_r2)) & id_macrc_op
`ifdef OR1200_IMPL_DIV
				| (|div_cntr)
`endif
				;
`else // OR1200_MAC_IMPLEMENTED
assign mac_stall_r = 1'b0;
assign mac_r = {2*width{1'b0}};
assign mac_op_r1 = `OR1200_MACOP_WIDTH'b0;
assign mac_op_r2 = `OR1200_MACOP_WIDTH'b0;
assign mac_op_r3 = `OR1200_MACOP_WIDTH'b0;
`endif // OR1200_MAC_IMPLEMENTED
endmodule