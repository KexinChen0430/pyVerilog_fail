module
gfx_top top(
.wb_clk_i (wb_clk_i),
.wb_rst_i (wb_rst_i),
.wb_inta_o (wb_inta_o),
// Wishbone master signals (interfaces with video memory)
.wbm_write_cyc_o (wbm_write_cyc_o),
.wbm_write_stb_o (wbm_write_stb_o),
.wbm_write_cti_o (wbm_write_cti_o),
.wbm_write_bte_o (wbm_write_bte_o),
.wbm_write_we_o (wbm_write_we_o),
.wbm_write_adr_o (wbm_write_adr_o),
.wbm_write_sel_o (wbm_write_sel_o),
.wbm_write_ack_i (wbm_write_ack_i),
.wbm_write_err_i (wbm_write_err_i),
.wbm_write_dat_o (wbm_write_dat_o),
// Wishbone master signals (interfaces with video memory)
.wbm_read_cyc_o (wbm_read_cyc_o),
.wbm_read_stb_o (wbm_read_stb_o),
.wbm_read_cti_o (wbm_read_cti_o),
.wbm_read_bte_o (wbm_read_bte_o),
.wbm_read_we_o (wbm_read_we_o),
.wbm_read_adr_o (wbm_read_adr_o),
.wbm_read_sel_o (wbm_read_sel_o),
.wbm_read_ack_i (wbm_read_ack_i),
.wbm_read_err_i (wbm_read_err_i),
.wbm_read_dat_i (wbm_read_dat_i),
// Wishbone slave signals (interfaces with main bus/CPU)
.wbs_cyc_i (wbs_cyc_i),
.wbs_stb_i (wbs_stb_i),
.wbs_cti_i (wbs_cti_i),
.wbs_bte_i (wbs_bte_i),
.wbs_we_i (wbs_we_i),
.wbs_adr_i (wbs_adr_i),
.wbs_sel_i (wbs_sel_i),
.wbs_ack_o (wbs_ack_o),
.wbs_err_o (wbs_err_o),
.wbs_dat_i (wbs_dat_i),
.wbs_dat_o (wbs_dat_o)
);
defparam top.point_width    = point_width;
defparam top.subpixel_width = subpixel_width;
defparam top.fifo_depth     = fifo_depth;
endmodule