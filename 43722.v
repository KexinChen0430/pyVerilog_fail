module or1200_dmmu_tlb(
	// Rst and clk
	clk, rst,
	// I/F for translation
	tlb_en, vaddr, hit, ppn, uwe, ure, swe, sre, ci,
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
output	[31:`OR1200_DMMU_PS]	ppn;
output				uwe;
output				ure;
output				swe;
output				sre;
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
wire	[`OR1200_DTLB_TAG]	vpn;
wire				v;
wire	[`OR1200_DTLB_INDXW-1:0]	tlb_index;
wire				tlb_mr_en;
wire				tlb_mr_we;
wire	[`OR1200_DTLBMRW-1:0]	tlb_mr_ram_in;
wire	[`OR1200_DTLBMRW-1:0]	tlb_mr_ram_out;
wire				tlb_tr_en;
wire				tlb_tr_we;
wire	[`OR1200_DTLBTRW-1:0]	tlb_tr_ram_in;
wire	[`OR1200_DTLBTRW-1:0]	tlb_tr_ram_out;
`ifdef OR1200_BIST
// RAM BIST
wire				mbist_mr_so;
wire				mbist_tr_so;
wire				mbist_mr_si = mbist_si_i;
wire				mbist_tr_si = mbist_mr_so;
assign				mbist_so_o = mbist_tr_so;
`endif
// Implemented bits inside match and translate registers
// dtlbwYmrX: vpn 31-19  v 0
// dtlbwYtrX: ppn 31-13  swe 9  sre 8  uwe 7  ure 6
// dtlb memory width:
// 19 bits for ppn
// 13 bits for vpn
// 1 bit for valid
// 4 bits for protection
// 1 bit for cache inhibit
// Enable for Match registers
assign tlb_mr_en = tlb_en | (spr_cs & !spr_addr[`OR1200_DTLB_TM_ADDR]);
// Write enable for Match registers
assign tlb_mr_we = spr_cs & spr_write & !spr_addr[`OR1200_DTLB_TM_ADDR];
// Enable for Translate registers
assign tlb_tr_en = tlb_en | (spr_cs & spr_addr[`OR1200_DTLB_TM_ADDR]);
// Write enable for Translate registers
assign tlb_tr_we = spr_cs & spr_write & spr_addr[`OR1200_DTLB_TM_ADDR];
// Output to SPRS unit
assign spr_dat_o = (spr_cs & !spr_write & !spr_addr[`OR1200_DTLB_TM_ADDR]) ?
			{vpn, tlb_index & {`OR1200_DTLB_INDXW{v}}, {`OR1200_DTLB_TAGW-7{1'b0}}, 1'b0, 5'b00000, v} :
		(spr_cs & !spr_write & spr_addr[`OR1200_DTLB_TM_ADDR]) ?
			{ppn, {`OR1200_DMMU_PS-10{1'b0}}, swe, sre, uwe, ure, {4{1'b0}}, ci, 1'b0} :
			32'h00000000;
// Assign outputs from Match registers
assign {vpn, v} = tlb_mr_ram_out;
// Assign to Match registers inputs
assign tlb_mr_ram_in = {spr_dat_i[`OR1200_DTLB_TAG], spr_dat_i[`OR1200_DTLBMR_V_BITS]};
// Assign outputs from Translate registers
assign {ppn, swe, sre, uwe, ure, ci} = tlb_tr_ram_out;
// Assign to Translate registers inputs
assign tlb_tr_ram_in = {spr_dat_i[31:`OR1200_DMMU_PS],
			spr_dat_i[`OR1200_DTLBTR_SWE_BITS],
			spr_dat_i[`OR1200_DTLBTR_SRE_BITS],
			spr_dat_i[`OR1200_DTLBTR_UWE_BITS],
			spr_dat_i[`OR1200_DTLBTR_URE_BITS],
			spr_dat_i[`OR1200_DTLBTR_CI_BITS]};
// Generate hit
assign hit = (vpn == vaddr[`OR1200_DTLB_TAG]) & v;
// TLB index is normally vaddr[18:13]. If it is SPR access then index is
// spr_addr[5:0].
assign tlb_index = spr_cs ? spr_addr[`OR1200_DTLB_INDXW-1:0] : vaddr[`OR1200_DTLB_INDX];
// Instantiation of DTLB Match Registers
or1200_spram_64x14 dtlb_mr_ram(
	.clk(clk),
	.rst(rst),
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(mbist_mr_si),
	.mbist_so_o(mbist_mr_so),
	.mbist_ctrl_i(mbist_ctrl_i),
`endif
	.ce(tlb_mr_en),
	.we(tlb_mr_we),
	.oe(1'b1),
	.addr(tlb_index),
	.di(tlb_mr_ram_in),
	.doq(tlb_mr_ram_out)
);
// Instantiation of DTLB Translate Registers
or1200_spram_64x24 dtlb_tr_ram(
	.clk(clk),
	.rst(rst),
`ifdef OR1200_BIST
	// RAM BIST
	.mbist_si_i(mbist_tr_si),
	.mbist_so_o(mbist_tr_so),
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