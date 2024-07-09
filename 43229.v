module pippo_lsu(
    clk, rst,
	lsu_uops, addrbase, addrofs, reg_zero,
    lsu_datain, lsu_dataout,
    lsu_stall, lsu_done,
    lsu_addr,
    set_atomic, clear_atomic,
    so,
    cr0_lsu,
    cr0_lsu_we,
    sig_align, sig_dbuserr,
	dimx_adr_o, dimx_rqt_o, dimx_we_o, dimx_sel_o, dimx_dat_o,
	dimx_dat_i, dimx_ack_i, dimx_err_i
);
parameter dw = `OPERAND_WIDTH;
// I/O
input       clk;
input       rst;
// Internal i/f
input	[31:0]		addrbase;
input	[31:0]		addrofs;
input               reg_zero;
input	[dw-1:0]	lsu_datain;
input	[`LSUUOPS_WIDTH-1:0]	lsu_uops;
input               set_atomic;
input               clear_atomic;
output	[dw-1:0]	lsu_dataout;
output  [31:0]      lsu_addr;
output				lsu_stall;
output				lsu_done;
output				sig_align;
output				sig_dbuserr;
// update CR for atomic memory access
input               so;
output  [3:0]       cr0_lsu;
output              cr0_lsu_we;
// External i/f to DC
output	[31:0]		dimx_adr_o;
output				dimx_rqt_o;
output				dimx_we_o;
output	[3:0]		dimx_sel_o;
output	[31:0]		dimx_dat_o;
input	[31:0]		dimx_dat_i;
input				dimx_ack_i;
input				dimx_err_i;
// Internal wires/regs
reg	[3:0]			dimx_sel_o;
wire [31:0]         lsu_addr;
wire [3:0]          lsu_op;
wire                atomic_success;
assign lsu_addr = reg_zero ? addrofs : (addrbase + addrofs) ;     // [TBD]to check address overflow?
// D-side IMX interface
// Note: the protocol is differnt than i-IMX
//  1, the request assert until the completion of data transaction
//  2, [TBD] eliminate address response(!rty_i)
// Store Operation
//      cycle 1:
//          master - send out rqt_valid(rqt_o)/addr_o/data_o/sel_o
//          slave - address decoding and if hit, give back addrack(!rty_i)
//      cycle 2..:
//          slave - register data, and give dat_ack(ack_i), dictate transaction complete successfully
//          master - disassert rqt_valid
// Load Operation
//      cycle 1:
//          master - send out rqt_valid(rqt_o)/addr_o/sel_o
//          slave - address decoding and if hit, give back addrack(!rty_i)
//      cycle 2..:
//          slave - send dat, and give dat_ack(ack_i), dictate transaction complete successfully
//          master - disassert rqt_valid, register dat_i, and diassert lsu_stall(advanced write-back)
assign dimx_rqt_o = (!dimx_ack_i) & ((|lsu_op) & !clear_atomic | atomic_success) & (!sig_align);
assign dimx_adr_o = lsu_addr;
// (all store inst. except stwcx.) | (successful stwcx.)
assign dimx_we_o = (lsu_op[3] & !clear_atomic) | atomic_success;
// data selector for big-endian implementation: selector rule see specification
always @(lsu_op or dimx_adr_o)
	casex({lsu_op, dimx_adr_o[1:0]})
		{`LSUOP_STB, 2'b00} : dimx_sel_o = 4'b1000;
		{`LSUOP_STB, 2'b01} : dimx_sel_o = 4'b0100;
		{`LSUOP_STB, 2'b10} : dimx_sel_o = 4'b0010;
		{`LSUOP_STB, 2'b11} : dimx_sel_o = 4'b0001;
		{`LSUOP_STH, 2'b00}, {`LSUOP_STHB, 2'b00} : dimx_sel_o = 4'b1100;
		{`LSUOP_STH, 2'b10}, {`LSUOP_STHB, 2'b10} : dimx_sel_o = 4'b0011;
		{`LSUOP_STW, 2'b00}, {`LSUOP_STWB, 2'b00} : dimx_sel_o = 4'b1111;
		{`LSUOP_LBZ, 2'b00} : dimx_sel_o = 4'b1000;
		{`LSUOP_LBZ, 2'b01} : dimx_sel_o = 4'b0100;
		{`LSUOP_LBZ, 2'b10} : dimx_sel_o = 4'b0010;
		{`LSUOP_LBZ, 2'b11} : dimx_sel_o = 4'b0001;
		{`LSUOP_LHZ, 2'b00}, {`LSUOP_LHA, 2'b00}, {`LSUOP_LHZB, 2'b00} : dimx_sel_o = 4'b1100;
		{`LSUOP_LHZ, 2'b10}, {`LSUOP_LHA, 2'b10}, {`LSUOP_LHZB, 2'b10} : dimx_sel_o = 4'b0011;
		{`LSUOP_LWZ, 2'b00}, {`LSUOP_LWZB, 2'b00} : dimx_sel_o = 4'b1111;
		default : dimx_sel_o = 4'b1111;
	endcase
// Pipeline Control Signals
// lsu_stall assert until the completion of data transaction.
assign lsu_stall = (|lsu_op) & !dimx_ack_i;
assign lsu_done = (|lsu_op) & dimx_ack_i;
// atomic memory access
//  [TBV] the timing of clear flag;
reg flag_atomic;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        flag_atomic <= #1 1'b0;
    end
    else begin
        if (set_atomic)
            flag_atomic <= #1 1'b1;
        else if(flag_atomic & clear_atomic)
            flag_atomic <= #1 1'b0;
    end
end
assign atomic_success = flag_atomic & clear_atomic;
// CR update for atomic memory access
// [TBV] the timing of CR write back;
reg cr0_eq;
assign cr0_lsu_we = clear_atomic & dimx_ack_i;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        cr0_eq <= #1 1'b0;
    end
    else begin
        if (clear_atomic)
            cr0_eq <= #1 flag_atomic;
    end
end
assign cr0_lsu = {2'b00, cr0_eq, so};
// uops to op transfer
// lsu_uops[4] indicate updated access, currently not implemented
assign lsu_op = lsu_uops[3:0];
// memory-to-regfile aligner
lsu_mem2reg lsu_mem2reg(
	.addr(dimx_adr_o[1:0]),
	.lsu_op(lsu_op),
	.memdata(dimx_dat_i),
	.regdata(lsu_dataout)
);
// regfile-to-memory aligner
lsu_reg2mem lsu_reg2mem(
        .addr(dimx_adr_o[1:0]),
        .lsu_op(lsu_op),
        .regdata(lsu_datain),
        .memdata(dimx_dat_o)
);
// except request
assign sig_align =
        ((lsu_op == `LSUOP_STH) | (lsu_op == `LSUOP_STHB) | (lsu_op == `LSUOP_LHZ) |
            (lsu_op == `LSUOP_LHZB) | (lsu_op == `LSUOP_LHA)) & dimx_adr_o[0] |
        ((lsu_op == `LSUOP_STW) | (lsu_op == `LSUOP_STWB) | (lsu_op == `LSUOP_LWZ) |
            (lsu_op == `LSUOP_LWZB)) & |dimx_adr_o[1:0];
assign sig_dbuserr = dimx_ack_i & dimx_err_i;
endmodule