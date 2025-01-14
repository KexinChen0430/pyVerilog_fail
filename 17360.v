module or1200_immu_tlb(
	// Rst and clk
	clk, rst,
	// I/F for translation
	tlb_en, vaddr, hit, ppn, uxe, sxe, ci,
`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
	// SPR access
	spr_cs, spr_write, spr_addr, spr_dat_i, spr_dat_o
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_OPERAND_WIDTH;
// I/O
// Clock and reset
input				clk;
input				rst;
// I/F for translation
input				tlb_en;
input	[aw-1:0]		vaddr;
output				hit;
output	[31:`OR1200_IMMU_PS]	ppn;
output				uxe;
output				sxe;
output				ci;
`ifdef OR1200_BIST
// RAM BIST
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif
// SPR access
input				spr_cs;
input				spr_write;
input	[31:0]			spr_addr;
input	[31:0]			spr_dat_i;
output	[31:0]			spr_dat_o;
// Internal wires and regs
wire	[`OR1200_ITLB_TAG]	vpn;
wire				v;
wire	[`OR1200_ITLB_INDXW-1:0]	tlb_index;
wire				tlb_mr_en;
wire				tlb_mr_we;
wire	[`OR1200_ITLBMRW-1:0]	tlb_mr_ram_in;
wire	[`OR1200_ITLBMRW-1:0]	tlb_mr_ram_out;
wire				tlb_tr_en;
wire				tlb_tr_we;
wire	[`OR1200_ITLBTRW-1:0]	tlb_tr_ram_in;
wire	[`OR1200_ITLBTRW-1:0]	tlb_tr_ram_out;
// BIST
`ifdef OR1200_BIST
wire                        itlb_mr_ram_si;
wire                        itlb_mr_ram_so;
wire                        itlb_tr_ram_si;
wire                        itlb_tr_ram_so;
`endif
// Implemented bits inside match and translate registers
// itlbwYmrX: vpn 31-19  v 0
// itlbwYtrX: ppn 31-13  uxe 7  sxe 6
// itlb memory width:
// 19 bits for ppn
// 13 bits for vpn
// 1 bit for valid
// 2 bits for protection
// 1 bit for cache inhibit
// Enable for Match registers
assign tlb_mr_en = tlb_en | (spr_cs & !spr_addr[`OR1200_ITLB_TM_ADDR]);
// Write enable for Match registers
assign tlb_mr_we = spr_cs & spr_write & !spr_addr[`OR1200_ITLB_TM_ADDR];
// Enable for Translate registers
assign tlb_tr_en = tlb_en | (spr_cs & spr_addr[`OR1200_ITLB_TM_ADDR]);
// Write enable for Translate registers
assign tlb_tr_we = spr_cs & spr_write & spr_addr[`OR1200_ITLB_TM_ADDR];
// Output to SPRS unit
assign spr_dat_o = (!spr_write & !spr_addr[`OR1200_ITLB_TM_ADDR]) ?
			{vpn, tlb_index & {`OR1200_ITLB_INDXW{v}}, {`OR1200_ITLB_TAGW-7{1'b0}}, 1'b0, 5'b00000, v} :
		(!spr_write & spr_addr[`OR1200_ITLB_TM_ADDR]) ?
			{ppn, {`OR1200_IMMU_PS-8{1'b0}}, uxe, sxe, {4{1'b0}}, ci, 1'b0} :
			32'h00000000;
// Assign outputs from Match registers
assign {vpn, v} = tlb_mr_ram_out;
// Assign to Match registers inputs
assign tlb_mr_ram_in = {spr_dat_i[`OR1200_ITLB_TAG], spr_dat_i[`OR1200_ITLBMR_V_BITS]};
// Assign outputs from Translate registers
assign {ppn, uxe, sxe, ci} = tlb_tr_ram_out;
// Assign to Translate registers inputs
assign tlb_tr_ram_in = {spr_dat_i[31:`OR1200_IMMU_PS],
			spr_dat_i[`OR1200_ITLBTR_UXE_BITS],
			spr_dat_i[`OR1200_ITLBTR_SXE_BITS],
			spr_dat_i[`OR1200_ITLBTR_CI_BITS]};
// Generate hit
assign hit = (vpn == vaddr[`OR1200_ITLB_TAG]) & v;
// TLB index is normally vaddr[18:13]. If it is SPR access then index is
// spr_addr[5:0].
assign tlb_index = spr_cs ? spr_addr[`OR1200_ITLB_INDXW-1:0] : vaddr[`OR1200_ITLB_INDX];
`ifdef OR1200_BIST
assign itlb_mr_ram_si = mbist_si_i;
assign itlb_tr_ram_si = itlb_mr_ram_so;
assign mbist_so_o = itlb_tr_ram_so;
`endif
// Instantiation of ITLB Match Registers
or1200_spram_64x14 itlb_mr_ram(
	.clk(clk),
	.rst(rst),
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(itlb_mr_ram_si),
	.mbist_so_o(itlb_mr_ram_so),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.ce(tlb_mr_en),
	.we(tlb_mr_we),
	.oe(1'b1),
	.addr(tlb_index),
	.di(tlb_mr_ram_in),
	.doq(tlb_mr_ram_out)
);
// Instantiation of ITLB Translate Registers
or1200_spram_64x22 itlb_tr_ram(
	.clk(clk),
	.rst(rst),
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(itlb_tr_ram_si),
	.mbist_so_o(itlb_tr_ram_so),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.ce(tlb_tr_en),
	.we(tlb_tr_we),
	.oe(1'b1),
	.addr(tlb_index),
	.di(tlb_tr_ram_in),
	.doq(tlb_tr_ram_out)
);
endmodule