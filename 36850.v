module or1200_lsu(
//XLNX_MODIFIED added the clock
clk,
	// Internal i/f
	addrbase, addrofs, lsu_op, lsu_datain, lsu_dataout, lsu_stall, lsu_unstall,
        du_stall, except_align, except_dtlbmiss, except_dmmufault, except_dbuserr,
	// External i/f to DC
	dcpu_adr_o, dcpu_cycstb_o, dcpu_we_o, dcpu_sel_o, dcpu_tag_o, dcpu_dat_o,
	dcpu_dat_i, dcpu_ack_i, dcpu_rty_i, dcpu_err_i, dcpu_tag_i
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_REGFILE_ADDR_WIDTH;
//XLNX_MODIFIED adding in a clock
input clk;
// I/O
// Internal i/f
input	[31:0]			addrbase;
input	[31:0]			addrofs;
input	[`OR1200_LSUOP_WIDTH-1:0]	lsu_op;
input	[dw-1:0]		lsu_datain;
output	[dw-1:0]		lsu_dataout;
output				lsu_stall;
output				lsu_unstall;
input                           du_stall;
output				except_align;
output				except_dtlbmiss;
output				except_dmmufault;
output				except_dbuserr;
// External i/f to DC
output	[31:0]			dcpu_adr_o;
output				dcpu_cycstb_o;
output				dcpu_we_o;
output	[3:0]			dcpu_sel_o;
output	[3:0]			dcpu_tag_o;
output	[31:0]			dcpu_dat_o;
input	[31:0]			dcpu_dat_i;
input				dcpu_ack_i;
input				dcpu_rty_i;
input				dcpu_err_i;
input	[3:0]			dcpu_tag_i;
`ifdef XLNX_MODIFIED
 wire [31:0]			dcpu_adr_o_temp;
 reg [31:0]			dcpu_adr_o;
 wire				except_align_temp;
 reg           except_align;
 wire				except_dtlbmiss_temp;
 reg 				except_dtlbmiss;
 wire				except_dmmufault_temp;
 reg 				except_dmmufault;
 wire				except_dbuserr_temp;
 reg 				except_dbuserr;
 wire 			lsu_stall_temp;
 reg 				lsu_stall;
 wire 			lsu_unstall_temp;
 reg 				lsu_unstall;
`endif
// Internal wires/regs
reg	[3:0]			dcpu_sel_o;
// Internal I/F assignments
`ifdef XLNX_MODIFIED
assign lsu_stall_temp = dcpu_rty_i & dcpu_cycstb_o;
always @(posedge clk)
   lsu_stall <= lsu_stall_temp;
`else
assign lsu_stall = dcpu_rty_i & dcpu_cycstb_o;
`endif
`ifdef XLNX_MODIFIED
assign lsu_unstall_temp = dcpu_ack_i;
always @(posedge clk)
    lsu_unstall <= lsu_unstall_temp;
`else
assign lsu_unstall = dcpu_ack_i;
`endif
`ifdef XLNX_MODIFIED
assign except_align_temp = ((lsu_op == `OR1200_LSUOP_SH) | (lsu_op == `OR1200_LSUOP_LHZ) | (lsu_op == `OR1200_LSUOP_LHS)) & dcpu_adr_o[0]
		|  ((lsu_op == `OR1200_LSUOP_SW) | (lsu_op == `OR1200_LSUOP_LWZ) | (lsu_op == `OR1200_LSUOP_LWS)) & |dcpu_adr_o[1:0];
always @(posedge clk)
   except_align <= except_align_temp;
`else
assign except_align = ((lsu_op == `OR1200_LSUOP_SH) | (lsu_op == `OR1200_LSUOP_LHZ) | (lsu_op == `OR1200_LSUOP_LHS)) & dcpu_adr_o[0]
		|  ((lsu_op == `OR1200_LSUOP_SW) | (lsu_op == `OR1200_LSUOP_LWZ) | (lsu_op == `OR1200_LSUOP_LWS)) & |dcpu_adr_o[1:0];
`endif
`ifdef XLNX_MODIFIED
assign except_dtlbmiss_temp = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_TE);
always @(posedge clk)
   except_dtlbmiss <= except_dtlbmiss_temp;
`else
assign except_dtlbmiss = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_TE);
`endif
`ifdef XLNX_MODIFIED
assign except_dmmufault_temp = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_PE);
always @(posedge clk)
    except_dmmufault <= except_dmmufault_temp;
`else
assign except_dmmufault = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_PE);
`endif
`ifdef XLNX_MODIFIED
assign except_dbuserr_temp = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_BE);
always @(posedge clk)
   except_dbuserr <= except_dbuserr_temp;
`else
assign except_dbuserr = dcpu_err_i & (dcpu_tag_i == `OR1200_DTAG_BE);
`endif
// External I/F assignments
`ifdef XLNX_MODIFIED
assign dcpu_adr_o_temp = addrbase + addrofs;
always @(posedge clk)
   dcpu_adr_o <= dcpu_adr_o_temp;
`else
assign dcpu_adr_o = addrbase + addrofs;
`endif
assign dcpu_cycstb_o = du_stall | lsu_unstall | except_align ? 1'b0 : |lsu_op;
assign dcpu_we_o = lsu_op[3];
assign dcpu_tag_o = dcpu_cycstb_o ? `OR1200_DTAG_ND : `OR1200_DTAG_IDLE;
always @(lsu_op or dcpu_adr_o)
	casex({lsu_op, dcpu_adr_o[1:0]})
		{`OR1200_LSUOP_SB, 2'b00} : dcpu_sel_o = 4'b1000;
		{`OR1200_LSUOP_SB, 2'b01} : dcpu_sel_o = 4'b0100;
		{`OR1200_LSUOP_SB, 2'b10} : dcpu_sel_o = 4'b0010;
		{`OR1200_LSUOP_SB, 2'b11} : dcpu_sel_o = 4'b0001;
		{`OR1200_LSUOP_SH, 2'b00} : dcpu_sel_o = 4'b1100;
		{`OR1200_LSUOP_SH, 2'b10} : dcpu_sel_o = 4'b0011;
		{`OR1200_LSUOP_SW, 2'b00} : dcpu_sel_o = 4'b1111;
		{`OR1200_LSUOP_LBZ, 2'b00}, {`OR1200_LSUOP_LBS, 2'b00} : dcpu_sel_o = 4'b1000;
		{`OR1200_LSUOP_LBZ, 2'b01}, {`OR1200_LSUOP_LBS, 2'b01} : dcpu_sel_o = 4'b0100;
		{`OR1200_LSUOP_LBZ, 2'b10}, {`OR1200_LSUOP_LBS, 2'b10} : dcpu_sel_o = 4'b0010;
		{`OR1200_LSUOP_LBZ, 2'b11}, {`OR1200_LSUOP_LBS, 2'b11} : dcpu_sel_o = 4'b0001;
		{`OR1200_LSUOP_LHZ, 2'b00}, {`OR1200_LSUOP_LHS, 2'b00} : dcpu_sel_o = 4'b1100;
		{`OR1200_LSUOP_LHZ, 2'b10}, {`OR1200_LSUOP_LHS, 2'b10} : dcpu_sel_o = 4'b0011;
		{`OR1200_LSUOP_LWZ, 2'b00}, {`OR1200_LSUOP_LWS, 2'b00} : dcpu_sel_o = 4'b1111;
		default : dcpu_sel_o = 4'b0000;
	endcase
// Instantiation of Memory-to-regfile aligner
//XLNX_MODIFIED adding in a clock
or1200_mem2reg or1200_mem2reg(
   .clk(clk),
	.addr(dcpu_adr_o[1:0]),
	.lsu_op(lsu_op),
	.memdata(dcpu_dat_i),
	.regdata(lsu_dataout)
);
// Instantiation of Regfile-to-memory aligner
or1200_reg2mem or1200_reg2mem(
        .addr(dcpu_adr_o[1:0]),
        .lsu_op(lsu_op),
        .regdata(lsu_datain),
        .memdata(dcpu_dat_o)
);
endmodule