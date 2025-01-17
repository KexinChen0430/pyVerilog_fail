module outputs)
   wire			arst_l_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire			arst_l_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire			col_offset_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire			col_offset_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire [155:0]		decc_in_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire [155:0]		decc_in_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire [155:0]		decc_out_0;		// From data_array_0 of bw_r_l2d.v
   wire [155:0]		decc_out_1;		// From data_array_1 of bw_r_l2d.v
   wire			fuse_clk1_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire			fuse_clk1_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire			fuse_clk2_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire			fuse_clk2_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire			fuse_l2d_data_in_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire			fuse_l2d_data_in_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire			fuse_l2d_rden_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire			fuse_l2d_rden_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire [2:0]		fuse_l2d_rid_buf_1;	// From data_array_1 of bw_r_l2d.v
   wire [2:0]		fuse_l2d_rid_buf_2;	// From data_array_2 of bw_r_l2d.v
   wire			l2d_fuse_data_out_1;	// From data_array_1 of bw_r_l2d.v
   wire			l2d_fuse_data_out_2;	// From data_array_2 of bw_r_l2d.v
   wire			mem_write_disable_buf_1;// From data_array_1 of bw_r_l2d.v
   wire			mem_write_disable_buf_2;// From data_array_2 of bw_r_l2d.v
   wire			scan_out_1;		// From data_array_1 of bw_r_l2d.v
   wire			scan_out_2;		// From data_array_2 of bw_r_l2d.v
   wire [155:0]		scbuf_scdata_fbdecc_bot_buf_0;// From data_array_0 of bw_r_l2d.v
   wire [155:0]		scbuf_scdata_fbdecc_bot_buf_1;// From data_array_1 of bw_r_l2d.v
   wire [155:0]		scbuf_scdata_fbdecc_top_buf_0;// From data_array_0 of bw_r_l2d.v
   wire [155:0]		scbuf_scdata_fbdecc_top_buf_1;// From data_array_1 of bw_r_l2d.v
   wire [155:0]		scdata_scbuf_decc_bot_buf_1;// From data_array_1 of bw_r_l2d.v
   wire [155:0]		scdata_scbuf_decc_bot_buf_2;// From data_array_2 of bw_r_l2d.v
   wire [155:0]		scdata_scbuf_decc_top_buf_1;// From data_array_1 of bw_r_l2d.v
   wire [155:0]		scdata_scbuf_decc_top_buf_2;// From data_array_2 of bw_r_l2d.v
   wire			se_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire			se_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire			sehold_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire			sehold_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire [9:0]		set_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire [9:0]		set_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire [3:0]		word_en_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire [3:0]		word_en_buf_2;		// From data_array_2 of bw_r_l2d.v
   wire			wr_en_buf_1;		// From data_array_1 of bw_r_l2d.v
   wire			wr_en_buf_2;		// From data_array_2 of bw_r_l2d.v
   // End of automatics
   /*
    bw_r_l2d	AUTO_TEMPLATE(
    .decc_in(decc_in_buf_@"(+ @ 1)"[155:0]),
    .decc_read_in(decc_out_@"(- @ 1)"[155:0]),
    .word_en(word_en_buf_@"(+ @ 1)"[3:0]),
    .set(set_buf_@"(+ @ 1)"[9:0]),
    .col_offset(col_offset_buf_@"(+ @ 1)"),
    .wr_en(wr_en_buf_@"(+ @ 1)"),
    .decc_in_buf(decc_in_buf_@[155:0]),
    .word_en_buf(word_en_buf_@[3:0]),
    .set_buf(set_buf_@[9:0]),
    .col_offset_buf(col_offset_buf_@),
    .wr_en_buf(wr_en_buf_@),
    .way_sel_buf(way_sel_buf_@[11:0]),
    .decc_out(decc_out_@[155:0]),
    .mem_write_disable(mem_write_disable_buf_@"(+ @ 1)"),
    .l2d_fuse_data_out(l2d_fuse_data_out_@),
    .fuse_read_data_in(l2d_fuse_data_out_@"(+ @ 1)"),
    .fuse_l2d_rden(fuse_l2d_rden_buf_@"(+ @ 1)"),
    .efc_scdata_fuse_clk1(fuse_clk1_buf_@"(+ @ 1)"),
    .efc_scdata_fuse_clk2(fuse_clk2_buf_@"(+ @ 1)"),
    .fuse_l2d_rid(fuse_l2d_rid_buf_@"(+ @ 1)"[2:0]),
    .fuse_l2d_data_in(fuse_l2d_data_in_buf_@"(+ @ 1)"),
    .arst_l(arst_l_buf_@"(+ @ 1)"),
    .se(se_buf_@"(+ @ 1)"),
    .sehold(sehold_buf_@"(+ @ 1)"),
    .fuse_l2d_wren_buf(fuse_l2d_wren_buf_@[5:0]),
    .fuse_l2d_rden_buf(fuse_l2d_rden_buf_@),
    .fuse_clk1_buf(fuse_clk1_buf_@),
    .fuse_clk2_buf(fuse_clk2_buf_@),
    .fuse_l2d_rid_buf(fuse_l2d_rid_buf_@[2:0]),
    .fuse_l2d_data_in_buf(fuse_l2d_data_in_buf_@),
    .arst_l_buf(arst_l_buf_@),
    .se_buf(se_buf_@),
    .sehold_buf(sehold_buf_@),
    .mem_write_disable_buf(mem_write_disable_buf_@),
    .scbuf_scdata_fbdecc_top_buf(scbuf_scdata_fbdecc_top_buf_@[155:0]),
    .scbuf_scdata_fbdecc_bot_buf(scbuf_scdata_fbdecc_bot_buf_@[155:0]),
    .scdata_scbuf_decc_top_buf(scdata_scbuf_decc_top_buf_@[155:0]),
    .scdata_scbuf_decc_bot_buf(scdata_scbuf_decc_bot_buf_@[155:0]),
    .scbuf_scdata_fbdecc_top(scbuf_scdata_fbdecc_top_buf_@"(- @ 1)"[155:0]),
    .scbuf_scdata_fbdecc_bot(scbuf_scdata_fbdecc_bot_buf_@"(- @ 1)"[155:0]),
    .scdata_scbuf_decc_top(scdata_scbuf_decc_top_buf_@"(+ @ 1)"[155:0]),
    .scdata_scbuf_decc_bot(scdata_scbuf_decc_bot_buf_@"(+ @ 1)"[155:0]),
    .si(scan_out_@"(+ @ 1)"),
    .so(scan_out_@));
    */
   bw_r_l2d  data_array_0(
			  // Inputs
			  .scbuf_scdata_fbdecc_top(scbuf_scdata_fbdecc_top[155:0]),
			  .scbuf_scdata_fbdecc_bot(scbuf_scdata_fbdecc_bot[155:0]),
			  .decc_read_in(156'b0),
			  .way_sel({way_sel_buf_1[7:0],4'b0}),
			  .fuse_l2d_wren({fuse_l2d_wren_buf_1[3:0],2'b0}),
			  // Outputs
			  .scdata_scbuf_decc_top_buf(scdata_scbuf_decc_c6_top_buf[155:0]),
			  .scdata_scbuf_decc_bot_buf(scdata_scbuf_decc_c6_bot_buf[155:0]),
			  .word_en_buf	(),
			  .way_sel_buf	(),
			  .set_buf	(),
			  .col_offset_buf(),
			  .wr_en_buf	(),
			  .decc_in_buf	(),
			  .so(so),
			  .l2d_fuse_data_out(l2d_fuse_data_out),
			  .fuse_clk1_buf(),
			  .fuse_clk2_buf(),
			  .fuse_l2d_rid_buf(),
			  .fuse_l2d_rden_buf(),
			  .fuse_l2d_wren_buf(),
			  .fuse_l2d_data_in_buf(),
			  .arst_l_buf(),
			  .se_buf(se_buf),
			  .sehold_buf(),
			  .mem_write_disable_buf (),
			  /*AUTOINST*/
			  // Outputs
			  .decc_out	(decc_out_0[155:0]),	 // Templated
			  .scbuf_scdata_fbdecc_bot_buf(scbuf_scdata_fbdecc_bot_buf_0[155:0]), // Templated
			  .scbuf_scdata_fbdecc_top_buf(scbuf_scdata_fbdecc_top_buf_0[155:0]), // Templated
			  // Inputs
			  .arst_l	(arst_l_buf_1),		 // Templated
			  .col_offset	(col_offset_buf_1),	 // Templated
			  .decc_in	(decc_in_buf_1[155:0]),	 // Templated
			  .efc_scdata_fuse_clk1(fuse_clk1_buf_1), // Templated
			  .efc_scdata_fuse_clk2(fuse_clk2_buf_1), // Templated
			  .fuse_l2d_data_in(fuse_l2d_data_in_buf_1), // Templated
			  .fuse_l2d_rden(fuse_l2d_rden_buf_1),	 // Templated
			  .fuse_l2d_rid	(fuse_l2d_rid_buf_1[2:0]), // Templated
			  .fuse_read_data_in(l2d_fuse_data_out_1), // Templated
			  .mem_write_disable(mem_write_disable_buf_1), // Templated
			  .rclk		(rclk),
			  .scdata_scbuf_decc_bot(scdata_scbuf_decc_bot_buf_1[155:0]), // Templated
			  .scdata_scbuf_decc_top(scdata_scbuf_decc_top_buf_1[155:0]), // Templated
			  .se		(se_buf_1),		 // Templated
			  .sehold	(sehold_buf_1),		 // Templated
			  .set		(set_buf_1[9:0]),	 // Templated
			  .si		(scan_out_1),		 // Templated
			  .word_en	(word_en_buf_1[3:0]),	 // Templated
			  .wr_en	(wr_en_buf_1));		 // Templated
   bw_r_l2d  data_array_1(
			  // Inputs
			  .way_sel({way_sel_buf_2[7:0],4'b0}),
			  .fuse_l2d_wren({fuse_l2d_wren_buf_2[3:0],2'b0}),
			  /*AUTOINST*/
			  // Outputs
			  .fuse_l2d_rid_buf(fuse_l2d_rid_buf_1[2:0]), // Templated
			  .fuse_l2d_data_in_buf(fuse_l2d_data_in_buf_1), // Templated
			  .arst_l_buf	(arst_l_buf_1),		 // Templated
			  .se_buf	(se_buf_1),		 // Templated
			  .sehold_buf	(sehold_buf_1),		 // Templated
			  .fuse_l2d_rden_buf(fuse_l2d_rden_buf_1), // Templated
			  .fuse_l2d_wren_buf(fuse_l2d_wren_buf_1[5:0]), // Templated
			  .fuse_clk1_buf(fuse_clk1_buf_1),	 // Templated
			  .fuse_clk2_buf(fuse_clk2_buf_1),	 // Templated
			  .mem_write_disable_buf(mem_write_disable_buf_1), // Templated
			  .col_offset_buf(col_offset_buf_1),	 // Templated
			  .decc_in_buf	(decc_in_buf_1[155:0]),	 // Templated
			  .decc_out	(decc_out_1[155:0]),	 // Templated
			  .l2d_fuse_data_out(l2d_fuse_data_out_1), // Templated
			  .scbuf_scdata_fbdecc_bot_buf(scbuf_scdata_fbdecc_bot_buf_1[155:0]), // Templated
			  .scbuf_scdata_fbdecc_top_buf(scbuf_scdata_fbdecc_top_buf_1[155:0]), // Templated
			  .scdata_scbuf_decc_bot_buf(scdata_scbuf_decc_bot_buf_1[155:0]), // Templated
			  .scdata_scbuf_decc_top_buf(scdata_scbuf_decc_top_buf_1[155:0]), // Templated
			  .set_buf	(set_buf_1[9:0]),	 // Templated
			  .so		(scan_out_1),		 // Templated
			  .way_sel_buf	(way_sel_buf_1[11:0]),	 // Templated
			  .word_en_buf	(word_en_buf_1[3:0]),	 // Templated
			  .wr_en_buf	(wr_en_buf_1),		 // Templated
			  // Inputs
			  .arst_l	(arst_l_buf_2),		 // Templated
			  .col_offset	(col_offset_buf_2),	 // Templated
			  .decc_in	(decc_in_buf_2[155:0]),	 // Templated
			  .decc_read_in	(decc_out_0[155:0]),	 // Templated
			  .efc_scdata_fuse_clk1(fuse_clk1_buf_2), // Templated
			  .efc_scdata_fuse_clk2(fuse_clk2_buf_2), // Templated
			  .fuse_l2d_data_in(fuse_l2d_data_in_buf_2), // Templated
			  .fuse_l2d_rden(fuse_l2d_rden_buf_2),	 // Templated
			  .fuse_l2d_rid	(fuse_l2d_rid_buf_2[2:0]), // Templated
			  .fuse_read_data_in(l2d_fuse_data_out_2), // Templated
			  .mem_write_disable(mem_write_disable_buf_2), // Templated
			  .rclk		(rclk),
			  .scbuf_scdata_fbdecc_bot(scbuf_scdata_fbdecc_bot_buf_0[155:0]), // Templated
			  .scbuf_scdata_fbdecc_top(scbuf_scdata_fbdecc_top_buf_0[155:0]), // Templated
			  .scdata_scbuf_decc_bot(scdata_scbuf_decc_bot_buf_2[155:0]), // Templated
			  .scdata_scbuf_decc_top(scdata_scbuf_decc_top_buf_2[155:0]), // Templated
			  .se		(se_buf_2),		 // Templated
			  .sehold	(sehold_buf_2),		 // Templated
			  .set		(set_buf_2[9:0]),	 // Templated
			  .si		(scan_out_2),		 // Templated
			  .word_en	(word_en_buf_2[3:0]),	 // Templated
			  .wr_en	(wr_en_buf_2));		 // Templated
   bw_r_l2d  data_array_2(
			  // Inputs
			  .word_en(word_en[3:0]),
			  .way_sel(way_sel[11:0]),
			  .set(set[9:0]),
			  .col_offset(col_offset),
			  .wr_en(wr_en),
			  .decc_in(decc_in[155:0]),
			  .scdata_scbuf_decc_top(scdata_scbuf_decc_top[155:0]),
			  .scdata_scbuf_decc_bot(scdata_scbuf_decc_bot[155:0]),
			  .fuse_read_data_in(fuse_read_data_in),
			  .si(si),
			  .efc_scdata_fuse_clk1(efc_scdata_fuse_clk1),
			  .efc_scdata_fuse_clk2(efc_scdata_fuse_clk2),
			  .fuse_l2d_rid(fuse_l2d_rid[2:0]),
			  .fuse_l2d_rden(fuse_l2d_rden),
			  .fuse_l2d_wren(fuse_l2d_wren[5:0]),
			  .fuse_l2d_data_in(fuse_l2d_data_in),
			  .arst_l(arst_l),
			  .se(se),
			  .sehold(sehold),
			  .mem_write_disable(mem_write_disable),
			  // Outputs
			  .decc_out(decc_out[155:0]),
			  .scbuf_scdata_fbdecc_top_buf(scbuf_scdata_fbdecc_top_buf[155:0]),
			  .scbuf_scdata_fbdecc_bot_buf(scbuf_scdata_fbdecc_bot_buf[155:0]),
			  /*AUTOINST*/
			  // Outputs
			  .fuse_l2d_rid_buf(fuse_l2d_rid_buf_2[2:0]), // Templated
			  .fuse_l2d_data_in_buf(fuse_l2d_data_in_buf_2), // Templated
			  .arst_l_buf	(arst_l_buf_2),		 // Templated
			  .se_buf	(se_buf_2),		 // Templated
			  .sehold_buf	(sehold_buf_2),		 // Templated
			  .fuse_l2d_rden_buf(fuse_l2d_rden_buf_2), // Templated
			  .fuse_l2d_wren_buf(fuse_l2d_wren_buf_2[5:0]), // Templated
			  .fuse_clk1_buf(fuse_clk1_buf_2),	 // Templated
			  .fuse_clk2_buf(fuse_clk2_buf_2),	 // Templated
			  .mem_write_disable_buf(mem_write_disable_buf_2), // Templated
			  .col_offset_buf(col_offset_buf_2),	 // Templated
			  .decc_in_buf	(decc_in_buf_2[155:0]),	 // Templated
			  .l2d_fuse_data_out(l2d_fuse_data_out_2), // Templated
			  .scdata_scbuf_decc_bot_buf(scdata_scbuf_decc_bot_buf_2[155:0]), // Templated
			  .scdata_scbuf_decc_top_buf(scdata_scbuf_decc_top_buf_2[155:0]), // Templated
			  .set_buf	(set_buf_2[9:0]),	 // Templated
			  .so		(scan_out_2),		 // Templated
			  .way_sel_buf	(way_sel_buf_2[11:0]),	 // Templated
			  .word_en_buf	(word_en_buf_2[3:0]),	 // Templated
			  .wr_en_buf	(wr_en_buf_2),		 // Templated
			  // Inputs
			  .decc_read_in	(decc_out_1[155:0]),	 // Templated
			  .rclk		(rclk),
			  .scbuf_scdata_fbdecc_bot(scbuf_scdata_fbdecc_bot_buf_1[155:0]), // Templated
			  .scbuf_scdata_fbdecc_top(scbuf_scdata_fbdecc_top_buf_1[155:0])); // Templated
endmodule