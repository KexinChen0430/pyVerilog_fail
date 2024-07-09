module or1200_ic_top_wrapper(
	// Rst, clk and clock control
	clk, rst,
	// External i/f
	icbiu_dat_o, icbiu_adr_o, icbiu_cyc_o, icbiu_stb_o, icbiu_we_o, icbiu_sel_o, icbiu_cab_o,
	icbiu_dat_i, icbiu_ack_i, icbiu_err_i,
	// Internal i/f
	ic_en,
	icqmem_adr_i, icqmem_cycstb_i, icqmem_ci_i,
	icqmem_sel_i, icqmem_tag_i,
	icqmem_dat_o, icqmem_ack_o, icqmem_rty_o, icqmem_err_o, icqmem_tag_o,
`ifdef OR1200_BIST
	// RAM BIST
	mbist_si_i, mbist_so_o, mbist_ctrl_i,
`endif
	// SPRs
	spr_cs, spr_write, spr_dat_i
);
parameter dw = `OR1200_OPERAND_WIDTH;
// I/O
// Clock and reset
input				clk;
input				rst;
// External I/F
output	[dw-1:0]		icbiu_dat_o;
output	[31:0]			icbiu_adr_o;
output				icbiu_cyc_o;
output				icbiu_stb_o;
output				icbiu_we_o;
output	[3:0]			icbiu_sel_o;
output				icbiu_cab_o;
input	[dw-1:0]		icbiu_dat_i;
input				icbiu_ack_i;
input				icbiu_err_i;
// Internal I/F
input				ic_en;
input	[31:0]			icqmem_adr_i;
input				icqmem_cycstb_i;
input				icqmem_ci_i;
input	[3:0]			icqmem_sel_i;
input	[3:0]			icqmem_tag_i;
output	[dw-1:0]		icqmem_dat_o;
output				icqmem_ack_o;
output				icqmem_rty_o;
output				icqmem_err_o;
output	[3:0]			icqmem_tag_o;
`ifdef OR1200_BIST
// RAM BIST
input mbist_si_i;
input [`OR1200_MBIST_CTRL_WIDTH - 1:0] mbist_ctrl_i;
output mbist_so_o;
`endif
// SPR access
input   			spr_cs;
input				spr_write;
input	[31:0]			spr_dat_i;
// Internal wires and regs
wire				tag_v;
wire	[`OR1200_ICTAG_W-2:0]	tag;
wire	[dw-1:0]		to_icram;
wire	[dw-1:0]		from_icram;
wire	[3:0]			icram_we;
wire				ictag_we;
wire	[31:0]			ic_addr;
reg				tagcomp_miss;
wire	[`OR1200_ICINDXH:`OR1200_ICLS]	ictag_addr;
wire				ictag_en;
wire				ictag_v;
`ifdef OR1200_BIST
// RAM BIST
wire				mbist_ram_so;
wire				mbist_tag_so;
wire				mbist_ram_si = mbist_si_i;
wire				mbist_tag_si = mbist_ram_so;
assign				mbist_so_o = mbist_tag_so;
`endif
assign icbiu_dat_o = 32'h00000000;
assign icbiu_we_o = 1'b0;
assign icram_we[3:1] = 3'b0;
assign icqmem_tag_o = icqmem_err_o ? `OR1200_ITAG_BE : icqmem_tag_i;
// Instantiation of IC top
or1200_ic_top or1200_ic_top(
	.clk(clk),
	.rst(rst),
	// IC and QMEM
	.ic_en(ic_en),
	.icqmem_adr_i(icqmem_adr_i),
	.icqmem_cycstb_i(icqmem_cycstb_i),
	.icqmem_sel_i(icqmem_sel_i),
	.icqmem_dat_o(icqmem_dat_o),
	.icqmem_ack_o(icqmem_ack_o),
	.icqmem_rty_o(icqmem_rty_o),
	.icqmem_err_o(icqmem_err_o),
	// SPR access
	.spr_cs(spr_cs),
	.spr_write(spr_write),
	.spr_dat_i(spr_dat_i[`OR1200_ICINDXH:`OR1200_ICLS]),
	// IC and BIU
	.icbiu_adr_o(icbiu_adr_o),
	.icbiu_cyc_o(icbiu_cyc_o),
	.icbiu_stb_o(icbiu_stb_o),
	.icbiu_sel_o(icbiu_sel_o),
	.icbiu_cab_o(icbiu_cab_o),
	.icbiu_dat_i(icbiu_dat_i),
	.icbiu_ack_i(icbiu_ack_i),
	.icbiu_err_i(icbiu_err_i),
        .ic_addr(ic_addr),
        .icram_we(icram_we[0]),
        .to_icram(to_icram),
        .from_icram(from_icram),
        .ictag_addr(ictag_addr),
        .ictag_en(ictag_en),
        .ictag_we(ictag_we),
        .ictag_v(ictag_v),
        .tag_v(tag_v),
        .tag(tag)
);
// Instantiation of IC main memory
or1200_ic_ram or1200_ic_ram(
	.clk(clk),
	.rst(rst),
	.addr(ic_addr[`OR1200_ICINDXH:2]),
	.en(ic_en),
	.we(icram_we),
	.datain(icbiu_dat_i),
	.dataout(from_icram)
);
// Instantiation of IC TAG memory
or1200_ic_tag or1200_ic_tag(
	.clk(clk),
	.rst(rst),
	.addr(ictag_addr),
	.en(ictag_en),
	.we(ictag_we),
	.datain({ic_addr[31:`OR1200_ICTAGL], ictag_v}),
	.tag_v(tag_v),
	.tag(tag)
);
endmodule