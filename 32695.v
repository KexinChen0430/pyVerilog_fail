module minsoc_tc_top (
	wb_clk_i,
	wb_rst_i,
	i0_wb_cyc_i,
	i0_wb_stb_i,
	i0_wb_adr_i,
	i0_wb_sel_i,
	i0_wb_we_i,
	i0_wb_dat_i,
	i0_wb_dat_o,
	i0_wb_ack_o,
	i0_wb_err_o,
	i0_wb_cti_i,
	i0_wb_bte_i,
	i1_wb_cyc_i,
	i1_wb_stb_i,
	i1_wb_adr_i,
	i1_wb_sel_i,
	i1_wb_we_i,
	i1_wb_dat_i,
	i1_wb_dat_o,
	i1_wb_ack_o,
	i1_wb_err_o,
	i1_wb_cti_i,
	i1_wb_bte_i,
	i2_wb_cyc_i,
	i2_wb_stb_i,
	i2_wb_adr_i,
	i2_wb_sel_i,
	i2_wb_we_i,
	i2_wb_dat_i,
	i2_wb_dat_o,
	i2_wb_ack_o,
	i2_wb_err_o,
	i2_wb_cti_i,
	i2_wb_bte_i,
	i3_wb_cyc_i,
	i3_wb_stb_i,
	i3_wb_adr_i,
	i3_wb_sel_i,
	i3_wb_we_i,
	i3_wb_dat_i,
	i3_wb_dat_o,
	i3_wb_ack_o,
	i3_wb_err_o,
	i3_wb_cti_i,
	i3_wb_bte_i,
	i4_wb_cyc_i,
	i4_wb_stb_i,
	i4_wb_adr_i,
	i4_wb_sel_i,
	i4_wb_we_i,
	i4_wb_dat_i,
	i4_wb_dat_o,
	i4_wb_ack_o,
	i4_wb_err_o,
	i4_wb_cti_i,
	i4_wb_bte_i,
	i5_wb_cyc_i,
	i5_wb_stb_i,
	i5_wb_adr_i,
	i5_wb_sel_i,
	i5_wb_we_i,
	i5_wb_dat_i,
	i5_wb_dat_o,
	i5_wb_ack_o,
	i5_wb_err_o,
	i5_wb_cti_i,
	i5_wb_bte_i,
	i6_wb_cyc_i,
	i6_wb_stb_i,
	i6_wb_adr_i,
	i6_wb_sel_i,
	i6_wb_we_i,
	i6_wb_dat_i,
	i6_wb_dat_o,
	i6_wb_ack_o,
	i6_wb_err_o,
	i6_wb_cti_i,
	i6_wb_bte_i,
	i7_wb_cyc_i,
	i7_wb_stb_i,
	i7_wb_adr_i,
	i7_wb_sel_i,
	i7_wb_we_i,
	i7_wb_dat_i,
	i7_wb_dat_o,
	i7_wb_ack_o,
	i7_wb_err_o,
	i7_wb_cti_i,
	i7_wb_bte_i,
	t0_wb_cyc_o,
	t0_wb_stb_o,
	t0_wb_adr_o,
	t0_wb_sel_o,
	t0_wb_we_o,
	t0_wb_dat_o,
	t0_wb_dat_i,
	t0_wb_ack_i,
	t0_wb_err_i,
	t0_wb_cti_o,
	t0_wb_bte_o,
	t1_wb_cyc_o,
	t1_wb_stb_o,
	t1_wb_adr_o,
	t1_wb_sel_o,
	t1_wb_we_o,
	t1_wb_dat_o,
	t1_wb_dat_i,
	t1_wb_ack_i,
	t1_wb_err_i,
	t1_wb_cti_o,
	t1_wb_bte_o,
	t2_wb_cyc_o,
	t2_wb_stb_o,
	t2_wb_adr_o,
	t2_wb_sel_o,
	t2_wb_we_o,
	t2_wb_dat_o,
	t2_wb_dat_i,
	t2_wb_ack_i,
	t2_wb_err_i,
	t2_wb_cti_o,
	t2_wb_bte_o,
	t3_wb_cyc_o,
	t3_wb_stb_o,
	t3_wb_adr_o,
	t3_wb_sel_o,
	t3_wb_we_o,
	t3_wb_dat_o,
	t3_wb_dat_i,
	t3_wb_ack_i,
	t3_wb_err_i,
	t3_wb_cti_o,
	t3_wb_bte_o,
	t4_wb_cyc_o,
	t4_wb_stb_o,
	t4_wb_adr_o,
	t4_wb_sel_o,
	t4_wb_we_o,
	t4_wb_dat_o,
	t4_wb_dat_i,
	t4_wb_ack_i,
	t4_wb_err_i,
	t4_wb_cti_o,
	t4_wb_bte_o,
	t5_wb_cyc_o,
	t5_wb_stb_o,
	t5_wb_adr_o,
	t5_wb_sel_o,
	t5_wb_we_o,
	t5_wb_dat_o,
	t5_wb_dat_i,
	t5_wb_ack_i,
	t5_wb_err_i,
	t5_wb_cti_o,
	t5_wb_bte_o,
	t6_wb_cyc_o,
	t6_wb_stb_o,
	t6_wb_adr_o,
	t6_wb_sel_o,
	t6_wb_we_o,
	t6_wb_dat_o,
	t6_wb_dat_i,
	t6_wb_ack_i,
	t6_wb_err_i,
	t6_wb_cti_o,
	t6_wb_bte_o,
	t7_wb_cyc_o,
	t7_wb_stb_o,
	t7_wb_adr_o,
	t7_wb_sel_o,
	t7_wb_we_o,
	t7_wb_dat_o,
	t7_wb_dat_i,
	t7_wb_ack_i,
	t7_wb_err_i,
	t7_wb_cti_o,
	t7_wb_bte_o,
	t8_wb_cyc_o,
	t8_wb_stb_o,
	t8_wb_adr_o,
	t8_wb_sel_o,
	t8_wb_we_o,
	t8_wb_dat_o,
	t8_wb_dat_i,
	t8_wb_ack_i,
	t8_wb_err_i,
	t8_wb_cti_o,
	t8_wb_bte_o
);
// Parameters
parameter		t0_addr_w = 4;
parameter		t0_addr = 4'd8;
parameter		t1_addr_w = 4;
parameter		t1_addr = 4'd0;
parameter		t28c_addr_w = 4;
parameter		t28_addr = 4'd0;
parameter		t28i_addr_w = 4;
parameter		t2_addr = 4'd1;
parameter		t3_addr = 4'd2;
parameter		t4_addr = 4'd3;
parameter		t5_addr = 4'd4;
parameter		t6_addr = 4'd5;
parameter		t7_addr = 4'd6;
parameter		t8_addr = 4'd7;
// I/O Ports
input			wb_clk_i;
input			wb_rst_i;
// WB slave i/f connecting initiator 0
input			i0_wb_cyc_i;
input			i0_wb_stb_i;
input	[`TC_AW-1:0]	i0_wb_adr_i;
input	[`TC_BSW-1:0]	i0_wb_sel_i;
input			i0_wb_we_i;
input	[`TC_DW-1:0]	i0_wb_dat_i;
output	[`TC_DW-1:0]	i0_wb_dat_o;
output			i0_wb_ack_o;
output			i0_wb_err_o;
input	[2:0]		i0_wb_cti_i;
input	[1:0]		i0_wb_bte_i;
// WB slave i/f connecting initiator 1
input			i1_wb_cyc_i;
input			i1_wb_stb_i;
input	[`TC_AW-1:0]	i1_wb_adr_i;
input	[`TC_BSW-1:0]	i1_wb_sel_i;
input			i1_wb_we_i;
input	[`TC_DW-1:0]	i1_wb_dat_i;
output	[`TC_DW-1:0]	i1_wb_dat_o;
output			i1_wb_ack_o;
output			i1_wb_err_o;
input	[2:0]		i1_wb_cti_i;
input	[1:0]		i1_wb_bte_i;
// WB slave i/f connecting initiator 2
input			i2_wb_cyc_i;
input			i2_wb_stb_i;
input	[`TC_AW-1:0]	i2_wb_adr_i;
input	[`TC_BSW-1:0]	i2_wb_sel_i;
input			i2_wb_we_i;
input	[`TC_DW-1:0]	i2_wb_dat_i;
output	[`TC_DW-1:0]	i2_wb_dat_o;
output			i2_wb_ack_o;
output			i2_wb_err_o;
input	[2:0]		i2_wb_cti_i;
input	[1:0]		i2_wb_bte_i;
// WB slave i/f connecting initiator 3
input			i3_wb_cyc_i;
input			i3_wb_stb_i;
input	[`TC_AW-1:0]	i3_wb_adr_i;
input	[`TC_BSW-1:0]	i3_wb_sel_i;
input			i3_wb_we_i;
input	[`TC_DW-1:0]	i3_wb_dat_i;
output	[`TC_DW-1:0]	i3_wb_dat_o;
output			i3_wb_ack_o;
output			i3_wb_err_o;
input	[2:0]		i3_wb_cti_i;
input	[1:0]		i3_wb_bte_i;
// WB slave i/f connecting initiator 4
input			i4_wb_cyc_i;
input			i4_wb_stb_i;
input	[`TC_AW-1:0]	i4_wb_adr_i;
input	[`TC_BSW-1:0]	i4_wb_sel_i;
input			i4_wb_we_i;
input	[`TC_DW-1:0]	i4_wb_dat_i;
output	[`TC_DW-1:0]	i4_wb_dat_o;
output			i4_wb_ack_o;
output			i4_wb_err_o;
input	[2:0]		i4_wb_cti_i;
input	[1:0]		i4_wb_bte_i;
// WB slave i/f connecting initiator 5
input			i5_wb_cyc_i;
input			i5_wb_stb_i;
input	[`TC_AW-1:0]	i5_wb_adr_i;
input	[`TC_BSW-1:0]	i5_wb_sel_i;
input			i5_wb_we_i;
input	[`TC_DW-1:0]	i5_wb_dat_i;
output	[`TC_DW-1:0]	i5_wb_dat_o;
output			i5_wb_ack_o;
output			i5_wb_err_o;
input	[2:0]		i5_wb_cti_i;
input	[1:0]		i5_wb_bte_i;
// WB slave i/f connecting initiator 6
input			i6_wb_cyc_i;
input			i6_wb_stb_i;
input	[`TC_AW-1:0]	i6_wb_adr_i;
input	[`TC_BSW-1:0]	i6_wb_sel_i;
input			i6_wb_we_i;
input	[`TC_DW-1:0]	i6_wb_dat_i;
output	[`TC_DW-1:0]	i6_wb_dat_o;
output			i6_wb_ack_o;
output			i6_wb_err_o;
input	[2:0]		i6_wb_cti_i;
input	[1:0]		i6_wb_bte_i;
// WB slave i/f connecting initiator 7
input			i7_wb_cyc_i;
input			i7_wb_stb_i;
input	[`TC_AW-1:0]	i7_wb_adr_i;
input	[`TC_BSW-1:0]	i7_wb_sel_i;
input			i7_wb_we_i;
input	[`TC_DW-1:0]	i7_wb_dat_i;
output	[`TC_DW-1:0]	i7_wb_dat_o;
output			i7_wb_ack_o;
output			i7_wb_err_o;
input	[2:0]		i7_wb_cti_i;
input	[1:0]		i7_wb_bte_i;
// WB master i/f connecting target 0
output			t0_wb_cyc_o;
output			t0_wb_stb_o;
output	[`TC_AW-1:0]	t0_wb_adr_o;
output	[`TC_BSW-1:0]	t0_wb_sel_o;
output			t0_wb_we_o;
output	[`TC_DW-1:0]	t0_wb_dat_o;
input	[`TC_DW-1:0]	t0_wb_dat_i;
input			t0_wb_ack_i;
input			t0_wb_err_i;
output	[2:0]		t0_wb_cti_o;
output	[1:0]		t0_wb_bte_o;
// WB master i/f connecting target 1
output			t1_wb_cyc_o;
output			t1_wb_stb_o;
output	[`TC_AW-1:0]	t1_wb_adr_o;
output	[`TC_BSW-1:0]	t1_wb_sel_o;
output			t1_wb_we_o;
output	[`TC_DW-1:0]	t1_wb_dat_o;
input	[`TC_DW-1:0]	t1_wb_dat_i;
input			t1_wb_ack_i;
input			t1_wb_err_i;
output	[2:0]		t1_wb_cti_o;
output	[1:0]		t1_wb_bte_o;
// WB master i/f connecting target 2
output			t2_wb_cyc_o;
output			t2_wb_stb_o;
output	[`TC_AW-1:0]	t2_wb_adr_o;
output	[`TC_BSW-1:0]	t2_wb_sel_o;
output			t2_wb_we_o;
output	[`TC_DW-1:0]	t2_wb_dat_o;
input	[`TC_DW-1:0]	t2_wb_dat_i;
input			t2_wb_ack_i;
input			t2_wb_err_i;
output	[2:0]		t2_wb_cti_o;
output	[1:0]		t2_wb_bte_o;
// WB master i/f connecting target 3
output			t3_wb_cyc_o;
output			t3_wb_stb_o;
output	[`TC_AW-1:0]	t3_wb_adr_o;
output	[`TC_BSW-1:0]	t3_wb_sel_o;
output			t3_wb_we_o;
output	[`TC_DW-1:0]	t3_wb_dat_o;
input	[`TC_DW-1:0]	t3_wb_dat_i;
input			t3_wb_ack_i;
input			t3_wb_err_i;
output	[2:0]		t3_wb_cti_o;
output	[1:0]		t3_wb_bte_o;
// WB master i/f connecting target 4
output			t4_wb_cyc_o;
output			t4_wb_stb_o;
output	[`TC_AW-1:0]	t4_wb_adr_o;
output	[`TC_BSW-1:0]	t4_wb_sel_o;
output			t4_wb_we_o;
output	[`TC_DW-1:0]	t4_wb_dat_o;
input	[`TC_DW-1:0]	t4_wb_dat_i;
input			t4_wb_ack_i;
input			t4_wb_err_i;
output	[2:0]		t4_wb_cti_o;
output	[1:0]		t4_wb_bte_o;
// WB master i/f connecting target 5
output			t5_wb_cyc_o;
output			t5_wb_stb_o;
output	[`TC_AW-1:0]	t5_wb_adr_o;
output	[`TC_BSW-1:0]	t5_wb_sel_o;
output			t5_wb_we_o;
output	[`TC_DW-1:0]	t5_wb_dat_o;
input	[`TC_DW-1:0]	t5_wb_dat_i;
input			t5_wb_ack_i;
input			t5_wb_err_i;
output	[2:0]		t5_wb_cti_o;
output	[1:0]		t5_wb_bte_o;
// WB master i/f connecting target 6
output			t6_wb_cyc_o;
output			t6_wb_stb_o;
output	[`TC_AW-1:0]	t6_wb_adr_o;
output	[`TC_BSW-1:0]	t6_wb_sel_o;
output			t6_wb_we_o;
output	[`TC_DW-1:0]	t6_wb_dat_o;
input	[`TC_DW-1:0]	t6_wb_dat_i;
input			t6_wb_ack_i;
input			t6_wb_err_i;
output	[2:0]		t6_wb_cti_o;
output	[1:0]		t6_wb_bte_o;
// WB master i/f connecting target 7
output			t7_wb_cyc_o;
output			t7_wb_stb_o;
output	[`TC_AW-1:0]	t7_wb_adr_o;
output	[`TC_BSW-1:0]	t7_wb_sel_o;
output			t7_wb_we_o;
output	[`TC_DW-1:0]	t7_wb_dat_o;
input	[`TC_DW-1:0]	t7_wb_dat_i;
input			t7_wb_ack_i;
input			t7_wb_err_i;
output	[2:0]		t7_wb_cti_o;
output	[1:0]		t7_wb_bte_o;
// WB master i/f connecting target 8
output			t8_wb_cyc_o;
output			t8_wb_stb_o;
output	[`TC_AW-1:0]	t8_wb_adr_o;
output	[`TC_BSW-1:0]	t8_wb_sel_o;
output			t8_wb_we_o;
output	[`TC_DW-1:0]	t8_wb_dat_o;
input	[`TC_DW-1:0]	t8_wb_dat_i;
input			t8_wb_ack_i;
input			t8_wb_err_i;
output	[2:0]		t8_wb_cti_o;
output	[1:0]		t8_wb_bte_o;
// Internal wires & registers
// Outputs for initiators from both mi_to_st blocks
wire	[`TC_DW-1:0]	xi0_wb_dat_o;
wire			xi0_wb_ack_o;
wire			xi0_wb_err_o;
wire	[`TC_DW-1:0]	xi1_wb_dat_o;
wire			xi1_wb_ack_o;
wire			xi1_wb_err_o;
wire	[`TC_DW-1:0]	xi2_wb_dat_o;
wire			xi2_wb_ack_o;
wire			xi2_wb_err_o;
wire	[`TC_DW-1:0]	xi3_wb_dat_o;
wire			xi3_wb_ack_o;
wire			xi3_wb_err_o;
wire	[`TC_DW-1:0]	xi4_wb_dat_o;
wire			xi4_wb_ack_o;
wire			xi4_wb_err_o;
wire	[`TC_DW-1:0]	xi5_wb_dat_o;
wire			xi5_wb_ack_o;
wire			xi5_wb_err_o;
wire	[`TC_DW-1:0]	xi6_wb_dat_o;
wire			xi6_wb_ack_o;
wire			xi6_wb_err_o;
wire	[`TC_DW-1:0]	xi7_wb_dat_o;
wire			xi7_wb_ack_o;
wire			xi7_wb_err_o;
wire	[`TC_DW-1:0]	yi0_wb_dat_o;
wire			yi0_wb_ack_o;
wire			yi0_wb_err_o;
wire	[`TC_DW-1:0]	yi1_wb_dat_o;
wire			yi1_wb_ack_o;
wire			yi1_wb_err_o;
wire	[`TC_DW-1:0]	yi2_wb_dat_o;
wire			yi2_wb_ack_o;
wire			yi2_wb_err_o;
wire	[`TC_DW-1:0]	yi3_wb_dat_o;
wire			yi3_wb_ack_o;
wire			yi3_wb_err_o;
wire	[`TC_DW-1:0]	yi4_wb_dat_o;
wire			yi4_wb_ack_o;
wire			yi4_wb_err_o;
wire	[`TC_DW-1:0]	yi5_wb_dat_o;
wire			yi5_wb_ack_o;
wire			yi5_wb_err_o;
wire	[`TC_DW-1:0]	yi6_wb_dat_o;
wire			yi6_wb_ack_o;
wire			yi6_wb_err_o;
wire	[`TC_DW-1:0]	yi7_wb_dat_o;
wire			yi7_wb_ack_o;
wire			yi7_wb_err_o;
// Intermediate signals connecting peripheral channel's
// mi_to_st and si_to_mt blocks.
wire			z_wb_cyc_i;
wire			z_wb_stb_i;
wire	[`TC_AW-1:0]	z_wb_adr_i;
wire	[`TC_BSW-1:0]	z_wb_sel_i;
wire			z_wb_we_i;
wire	[`TC_DW-1:0]	z_wb_dat_i;
wire	[`TC_DW-1:0]	z_wb_dat_t;
wire			z_wb_ack_t;
wire			z_wb_err_t;
wire	[2:0]		z_wb_cti_i;
wire	[1:0]		z_wb_bte_i;
// Outputs for initiators are ORed from both mi_to_st blocks
assign i0_wb_dat_o = xi0_wb_dat_o | yi0_wb_dat_o;
assign i0_wb_ack_o = xi0_wb_ack_o | yi0_wb_ack_o;
assign i0_wb_err_o = xi0_wb_err_o | yi0_wb_err_o;
assign i1_wb_dat_o = xi1_wb_dat_o | yi1_wb_dat_o;
assign i1_wb_ack_o = xi1_wb_ack_o | yi1_wb_ack_o;
assign i1_wb_err_o = xi1_wb_err_o | yi1_wb_err_o;
assign i2_wb_dat_o = xi2_wb_dat_o | yi2_wb_dat_o;
assign i2_wb_ack_o = xi2_wb_ack_o | yi2_wb_ack_o;
assign i2_wb_err_o = xi2_wb_err_o | yi2_wb_err_o;
assign i3_wb_dat_o = xi3_wb_dat_o | yi3_wb_dat_o;
assign i3_wb_ack_o = xi3_wb_ack_o | yi3_wb_ack_o;
assign i3_wb_err_o = xi3_wb_err_o | yi3_wb_err_o;
assign i4_wb_dat_o = xi4_wb_dat_o | yi4_wb_dat_o;
assign i4_wb_ack_o = xi4_wb_ack_o | yi4_wb_ack_o;
assign i4_wb_err_o = xi4_wb_err_o | yi4_wb_err_o;
assign i5_wb_dat_o = xi5_wb_dat_o | yi5_wb_dat_o;
assign i5_wb_ack_o = xi5_wb_ack_o | yi5_wb_ack_o;
assign i5_wb_err_o = xi5_wb_err_o | yi5_wb_err_o;
assign i6_wb_dat_o = xi6_wb_dat_o | yi6_wb_dat_o;
assign i6_wb_ack_o = xi6_wb_ack_o | yi6_wb_ack_o;
assign i6_wb_err_o = xi6_wb_err_o | yi6_wb_err_o;
assign i7_wb_dat_o = xi7_wb_dat_o | yi7_wb_dat_o;
assign i7_wb_ack_o = xi7_wb_ack_o | yi7_wb_ack_o;
assign i7_wb_err_o = xi7_wb_err_o | yi7_wb_err_o;
// From initiators to target 0
tc_mi_to_st #(t0_addr_w, t0_addr,
	0, t0_addr_w, t0_addr) t0_ch(
	.wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i),
	.i0_wb_cyc_i(i0_wb_cyc_i),
	.i0_wb_stb_i(i0_wb_stb_i),
	.i0_wb_adr_i(i0_wb_adr_i),
	.i0_wb_sel_i(i0_wb_sel_i),
	.i0_wb_we_i(i0_wb_we_i),
	.i0_wb_dat_i(i0_wb_dat_i),
	.i0_wb_dat_o(xi0_wb_dat_o),
	.i0_wb_ack_o(xi0_wb_ack_o),
	.i0_wb_err_o(xi0_wb_err_o),
	.i0_wb_cti_i(i0_wb_cti_i),
	.i0_wb_bte_i(i0_wb_bte_i),
	.i1_wb_cyc_i(i1_wb_cyc_i),
	.i1_wb_stb_i(i1_wb_stb_i),
	.i1_wb_adr_i(i1_wb_adr_i),
	.i1_wb_sel_i(i1_wb_sel_i),
	.i1_wb_we_i(i1_wb_we_i),
	.i1_wb_dat_i(i1_wb_dat_i),
	.i1_wb_dat_o(xi1_wb_dat_o),
	.i1_wb_ack_o(xi1_wb_ack_o),
	.i1_wb_err_o(xi1_wb_err_o),
	.i1_wb_cti_i(i1_wb_cti_i),
	.i1_wb_bte_i(i1_wb_bte_i),
	.i2_wb_cyc_i(i2_wb_cyc_i),
	.i2_wb_stb_i(i2_wb_stb_i),
	.i2_wb_adr_i(i2_wb_adr_i),
	.i2_wb_sel_i(i2_wb_sel_i),
	.i2_wb_we_i(i2_wb_we_i),
	.i2_wb_dat_i(i2_wb_dat_i),
	.i2_wb_dat_o(xi2_wb_dat_o),
	.i2_wb_ack_o(xi2_wb_ack_o),
	.i2_wb_err_o(xi2_wb_err_o),
	.i2_wb_cti_i(i2_wb_cti_i),
	.i2_wb_bte_i(i2_wb_bte_i),
	.i3_wb_cyc_i(i3_wb_cyc_i),
	.i3_wb_stb_i(i3_wb_stb_i),
	.i3_wb_adr_i(i3_wb_adr_i),
	.i3_wb_sel_i(i3_wb_sel_i),
	.i3_wb_we_i(i3_wb_we_i),
	.i3_wb_dat_i(i3_wb_dat_i),
	.i3_wb_dat_o(xi3_wb_dat_o),
	.i3_wb_ack_o(xi3_wb_ack_o),
	.i3_wb_err_o(xi3_wb_err_o),
	.i3_wb_cti_i(i3_wb_cti_i),
	.i3_wb_bte_i(i3_wb_bte_i),
	.i4_wb_cyc_i(i4_wb_cyc_i),
	.i4_wb_stb_i(i4_wb_stb_i),
	.i4_wb_adr_i(i4_wb_adr_i),
	.i4_wb_sel_i(i4_wb_sel_i),
	.i4_wb_we_i(i4_wb_we_i),
	.i4_wb_dat_i(i4_wb_dat_i),
	.i4_wb_dat_o(xi4_wb_dat_o),
	.i4_wb_ack_o(xi4_wb_ack_o),
	.i4_wb_err_o(xi4_wb_err_o),
	.i4_wb_cti_i(i4_wb_cti_i),
	.i4_wb_bte_i(i4_wb_bte_i),
	.i5_wb_cyc_i(i5_wb_cyc_i),
	.i5_wb_stb_i(i5_wb_stb_i),
	.i5_wb_adr_i(i5_wb_adr_i),
	.i5_wb_sel_i(i5_wb_sel_i),
	.i5_wb_we_i(i5_wb_we_i),
	.i5_wb_dat_i(i5_wb_dat_i),
	.i5_wb_dat_o(xi5_wb_dat_o),
	.i5_wb_ack_o(xi5_wb_ack_o),
	.i5_wb_err_o(xi5_wb_err_o),
	.i5_wb_cti_i(i5_wb_cti_i),
	.i5_wb_bte_i(i5_wb_bte_i),
	.i6_wb_cyc_i(i6_wb_cyc_i),
	.i6_wb_stb_i(i6_wb_stb_i),
	.i6_wb_adr_i(i6_wb_adr_i),
	.i6_wb_sel_i(i6_wb_sel_i),
	.i6_wb_we_i(i6_wb_we_i),
	.i6_wb_dat_i(i6_wb_dat_i),
	.i6_wb_dat_o(xi6_wb_dat_o),
	.i6_wb_ack_o(xi6_wb_ack_o),
	.i6_wb_err_o(xi6_wb_err_o),
	.i6_wb_cti_i(i6_wb_cti_i),
	.i6_wb_bte_i(i6_wb_bte_i),
	.i7_wb_cyc_i(i7_wb_cyc_i),
	.i7_wb_stb_i(i7_wb_stb_i),
	.i7_wb_adr_i(i7_wb_adr_i),
	.i7_wb_sel_i(i7_wb_sel_i),
	.i7_wb_we_i(i7_wb_we_i),
	.i7_wb_dat_i(i7_wb_dat_i),
	.i7_wb_dat_o(xi7_wb_dat_o),
	.i7_wb_ack_o(xi7_wb_ack_o),
	.i7_wb_err_o(xi7_wb_err_o),
	.i7_wb_cti_i(i7_wb_cti_i),
	.i7_wb_bte_i(i7_wb_bte_i),
	.t0_wb_cyc_o(t0_wb_cyc_o),
	.t0_wb_stb_o(t0_wb_stb_o),
	.t0_wb_adr_o(t0_wb_adr_o),
	.t0_wb_sel_o(t0_wb_sel_o),
	.t0_wb_we_o(t0_wb_we_o),
	.t0_wb_dat_o(t0_wb_dat_o),
	.t0_wb_dat_i(t0_wb_dat_i),
	.t0_wb_ack_i(t0_wb_ack_i),
	.t0_wb_err_i(t0_wb_err_i),
	.t0_wb_cti_o(t0_wb_cti_o),
	.t0_wb_bte_o(t0_wb_bte_o)
);
// From initiators to targets 1-8 (upper part)
tc_mi_to_st #(t1_addr_w, t1_addr,
	1, t28c_addr_w, t28_addr) t18_ch_upper(
	.wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i),
	.i0_wb_cyc_i(i0_wb_cyc_i),
	.i0_wb_stb_i(i0_wb_stb_i),
	.i0_wb_adr_i(i0_wb_adr_i),
	.i0_wb_sel_i(i0_wb_sel_i),
	.i0_wb_we_i(i0_wb_we_i),
	.i0_wb_dat_i(i0_wb_dat_i),
	.i0_wb_dat_o(yi0_wb_dat_o),
	.i0_wb_ack_o(yi0_wb_ack_o),
	.i0_wb_err_o(yi0_wb_err_o),
	.i0_wb_cti_i(i0_wb_cti_i),
	.i0_wb_bte_i(i0_wb_bte_i),
	.i1_wb_cyc_i(i1_wb_cyc_i),
	.i1_wb_stb_i(i1_wb_stb_i),
	.i1_wb_adr_i(i1_wb_adr_i),
	.i1_wb_sel_i(i1_wb_sel_i),
	.i1_wb_we_i(i1_wb_we_i),
	.i1_wb_dat_i(i1_wb_dat_i),
	.i1_wb_dat_o(yi1_wb_dat_o),
	.i1_wb_ack_o(yi1_wb_ack_o),
	.i1_wb_err_o(yi1_wb_err_o),
	.i1_wb_cti_i(i1_wb_cti_i),
	.i1_wb_bte_i(i1_wb_bte_i),
	.i2_wb_cyc_i(i2_wb_cyc_i),
	.i2_wb_stb_i(i2_wb_stb_i),
	.i2_wb_adr_i(i2_wb_adr_i),
	.i2_wb_sel_i(i2_wb_sel_i),
	.i2_wb_we_i(i2_wb_we_i),
	.i2_wb_dat_i(i2_wb_dat_i),
	.i2_wb_dat_o(yi2_wb_dat_o),
	.i2_wb_ack_o(yi2_wb_ack_o),
	.i2_wb_err_o(yi2_wb_err_o),
	.i2_wb_cti_i(i2_wb_cti_i),
	.i2_wb_bte_i(i2_wb_bte_i),
	.i3_wb_cyc_i(i3_wb_cyc_i),
	.i3_wb_stb_i(i3_wb_stb_i),
	.i3_wb_adr_i(i3_wb_adr_i),
	.i3_wb_sel_i(i3_wb_sel_i),
	.i3_wb_we_i(i3_wb_we_i),
	.i3_wb_dat_i(i3_wb_dat_i),
	.i3_wb_dat_o(yi3_wb_dat_o),
	.i3_wb_ack_o(yi3_wb_ack_o),
	.i3_wb_err_o(yi3_wb_err_o),
	.i3_wb_cti_i(i3_wb_cti_i),
	.i3_wb_bte_i(i3_wb_bte_i),
	.i4_wb_cyc_i(i4_wb_cyc_i),
	.i4_wb_stb_i(i4_wb_stb_i),
	.i4_wb_adr_i(i4_wb_adr_i),
	.i4_wb_sel_i(i4_wb_sel_i),
	.i4_wb_we_i(i4_wb_we_i),
	.i4_wb_dat_i(i4_wb_dat_i),
	.i4_wb_dat_o(yi4_wb_dat_o),
	.i4_wb_ack_o(yi4_wb_ack_o),
	.i4_wb_err_o(yi4_wb_err_o),
	.i4_wb_cti_i(i4_wb_cti_i),
	.i4_wb_bte_i(i4_wb_bte_i),
	.i5_wb_cyc_i(i5_wb_cyc_i),
	.i5_wb_stb_i(i5_wb_stb_i),
	.i5_wb_adr_i(i5_wb_adr_i),
	.i5_wb_sel_i(i5_wb_sel_i),
	.i5_wb_we_i(i5_wb_we_i),
	.i5_wb_dat_i(i5_wb_dat_i),
	.i5_wb_dat_o(yi5_wb_dat_o),
	.i5_wb_ack_o(yi5_wb_ack_o),
	.i5_wb_err_o(yi5_wb_err_o),
	.i5_wb_cti_i(i5_wb_cti_i),
	.i5_wb_bte_i(i5_wb_bte_i),
	.i6_wb_cyc_i(i6_wb_cyc_i),
	.i6_wb_stb_i(i6_wb_stb_i),
	.i6_wb_adr_i(i6_wb_adr_i),
	.i6_wb_sel_i(i6_wb_sel_i),
	.i6_wb_we_i(i6_wb_we_i),
	.i6_wb_dat_i(i6_wb_dat_i),
	.i6_wb_dat_o(yi6_wb_dat_o),
	.i6_wb_ack_o(yi6_wb_ack_o),
	.i6_wb_err_o(yi6_wb_err_o),
	.i6_wb_cti_i(i6_wb_cti_i),
	.i6_wb_bte_i(i6_wb_bte_i),
	.i7_wb_cyc_i(i7_wb_cyc_i),
	.i7_wb_stb_i(i7_wb_stb_i),
	.i7_wb_adr_i(i7_wb_adr_i),
	.i7_wb_sel_i(i7_wb_sel_i),
	.i7_wb_we_i(i7_wb_we_i),
	.i7_wb_dat_i(i7_wb_dat_i),
	.i7_wb_dat_o(yi7_wb_dat_o),
	.i7_wb_ack_o(yi7_wb_ack_o),
	.i7_wb_err_o(yi7_wb_err_o),
	.i7_wb_cti_i(i7_wb_cti_i),
	.i7_wb_bte_i(i7_wb_bte_i),
	.t0_wb_cyc_o(z_wb_cyc_i),
	.t0_wb_stb_o(z_wb_stb_i),
	.t0_wb_adr_o(z_wb_adr_i),
	.t0_wb_sel_o(z_wb_sel_i),
	.t0_wb_we_o(z_wb_we_i),
	.t0_wb_dat_o(z_wb_dat_i),
	.t0_wb_dat_i(z_wb_dat_t),
	.t0_wb_ack_i(z_wb_ack_t),
	.t0_wb_err_i(z_wb_err_t),
	.t0_wb_cti_o(z_wb_cti_i),
	.t0_wb_bte_o(z_wb_bte_i)
);
// From initiators to targets 1-8 (lower part)
tc_si_to_mt #(t1_addr_w, t1_addr, t28i_addr_w, t2_addr, t3_addr,
	t4_addr, t5_addr, t6_addr, t7_addr, t8_addr) t18_ch_lower(
	.i0_wb_cyc_i(z_wb_cyc_i),
	.i0_wb_stb_i(z_wb_stb_i),
	.i0_wb_adr_i(z_wb_adr_i),
	.i0_wb_sel_i(z_wb_sel_i),
	.i0_wb_we_i(z_wb_we_i),
	.i0_wb_dat_i(z_wb_dat_i),
	.i0_wb_dat_o(z_wb_dat_t),
	.i0_wb_ack_o(z_wb_ack_t),
	.i0_wb_err_o(z_wb_err_t),
	.i0_wb_cti_i(z_wb_cti_i),
	.i0_wb_bte_i(z_wb_bte_i),
	.t0_wb_cyc_o(t1_wb_cyc_o),
	.t0_wb_stb_o(t1_wb_stb_o),
	.t0_wb_adr_o(t1_wb_adr_o),
	.t0_wb_sel_o(t1_wb_sel_o),
	.t0_wb_we_o(t1_wb_we_o),
	.t0_wb_dat_o(t1_wb_dat_o),
	.t0_wb_dat_i(t1_wb_dat_i),
	.t0_wb_ack_i(t1_wb_ack_i),
	.t0_wb_err_i(t1_wb_err_i),
	.t0_wb_cti_o(t1_wb_cti_o),
	.t0_wb_bte_o(t1_wb_bte_o),
	.t1_wb_cyc_o(t2_wb_cyc_o),
	.t1_wb_stb_o(t2_wb_stb_o),
	.t1_wb_adr_o(t2_wb_adr_o),
	.t1_wb_sel_o(t2_wb_sel_o),
	.t1_wb_we_o(t2_wb_we_o),
	.t1_wb_dat_o(t2_wb_dat_o),
	.t1_wb_dat_i(t2_wb_dat_i),
	.t1_wb_ack_i(t2_wb_ack_i),
	.t1_wb_err_i(t2_wb_err_i),
	.t1_wb_cti_o(t2_wb_cti_o),
	.t1_wb_bte_o(t2_wb_bte_o),
	.t2_wb_cyc_o(t3_wb_cyc_o),
	.t2_wb_stb_o(t3_wb_stb_o),
	.t2_wb_adr_o(t3_wb_adr_o),
	.t2_wb_sel_o(t3_wb_sel_o),
	.t2_wb_we_o(t3_wb_we_o),
	.t2_wb_dat_o(t3_wb_dat_o),
	.t2_wb_dat_i(t3_wb_dat_i),
	.t2_wb_ack_i(t3_wb_ack_i),
	.t2_wb_err_i(t3_wb_err_i),
	.t2_wb_cti_o(t3_wb_cti_o),
	.t2_wb_bte_o(t3_wb_bte_o),
	.t3_wb_cyc_o(t4_wb_cyc_o),
	.t3_wb_stb_o(t4_wb_stb_o),
	.t3_wb_adr_o(t4_wb_adr_o),
	.t3_wb_sel_o(t4_wb_sel_o),
	.t3_wb_we_o(t4_wb_we_o),
	.t3_wb_dat_o(t4_wb_dat_o),
	.t3_wb_dat_i(t4_wb_dat_i),
	.t3_wb_ack_i(t4_wb_ack_i),
	.t3_wb_err_i(t4_wb_err_i),
	.t3_wb_cti_o(t4_wb_cti_o),
	.t3_wb_bte_o(t4_wb_bte_o),
	.t4_wb_cyc_o(t5_wb_cyc_o),
	.t4_wb_stb_o(t5_wb_stb_o),
	.t4_wb_adr_o(t5_wb_adr_o),
	.t4_wb_sel_o(t5_wb_sel_o),
	.t4_wb_we_o(t5_wb_we_o),
	.t4_wb_dat_o(t5_wb_dat_o),
	.t4_wb_dat_i(t5_wb_dat_i),
	.t4_wb_ack_i(t5_wb_ack_i),
	.t4_wb_err_i(t5_wb_err_i),
	.t4_wb_cti_o(t5_wb_cti_o),
	.t4_wb_bte_o(t5_wb_bte_o),
	.t5_wb_cyc_o(t6_wb_cyc_o),
	.t5_wb_stb_o(t6_wb_stb_o),
	.t5_wb_adr_o(t6_wb_adr_o),
	.t5_wb_sel_o(t6_wb_sel_o),
	.t5_wb_we_o(t6_wb_we_o),
	.t5_wb_dat_o(t6_wb_dat_o),
	.t5_wb_dat_i(t6_wb_dat_i),
	.t5_wb_ack_i(t6_wb_ack_i),
	.t5_wb_err_i(t6_wb_err_i),
	.t5_wb_cti_o(t6_wb_cti_o),
	.t5_wb_bte_o(t6_wb_bte_o),
	.t6_wb_cyc_o(t7_wb_cyc_o),
	.t6_wb_stb_o(t7_wb_stb_o),
	.t6_wb_adr_o(t7_wb_adr_o),
	.t6_wb_sel_o(t7_wb_sel_o),
	.t6_wb_we_o(t7_wb_we_o),
	.t6_wb_dat_o(t7_wb_dat_o),
	.t6_wb_dat_i(t7_wb_dat_i),
	.t6_wb_ack_i(t7_wb_ack_i),
	.t6_wb_err_i(t7_wb_err_i),
	.t6_wb_cti_o(t7_wb_cti_o),
	.t6_wb_bte_o(t7_wb_bte_o),
	.t7_wb_cyc_o(t8_wb_cyc_o),
	.t7_wb_stb_o(t8_wb_stb_o),
	.t7_wb_adr_o(t8_wb_adr_o),
	.t7_wb_sel_o(t8_wb_sel_o),
	.t7_wb_we_o(t8_wb_we_o),
	.t7_wb_dat_o(t8_wb_dat_o),
	.t7_wb_dat_i(t8_wb_dat_i),
	.t7_wb_ack_i(t8_wb_ack_i),
	.t7_wb_err_i(t8_wb_err_i),
	.t7_wb_cti_o(t8_wb_cti_o),
	.t7_wb_bte_o(t8_wb_bte_o),
);
endmodule