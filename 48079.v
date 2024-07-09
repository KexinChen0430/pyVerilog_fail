module outputs)
   // End of automatics
   input 		testmux_sel;
   output [159:0] 	dout;
   wire [159:0] 	dout_array;
   wire [159:0] 	dout_scan;
// Code starts here
   bw_r_rf16x160 bw_r_rf16x160 (.dout	(dout_array[159:0]),
				/*AUTOINST*/
				// Outputs
				.so_w	(so_w),
				.so_r	(so_r),
				// Inputs
				.din	(din[159:0]),
				.rd_adr	(rd_adr[3:0]),
				.wr_adr	(wr_adr[3:0]),
				.read_en(read_en),
				.wr_en	(wr_en),
				.rst_tri_en(rst_tri_en),
				.word_wen(word_wen[3:0]),
				.byte_wen(byte_wen[19:0]),
				.rd_clk	(rd_clk),
				.wr_clk	(wr_clk),
				.se	(se),
				.si_r	(si_r),
				.si_w	(si_w),
				.reset_l(reset_l),
				.sehold	(sehold));
   // testmux for DFT
   assign 		dout = testmux_sel ? dout_scan : dout_array;
   dff_ns #(160) dout_scan_ff (.din(dout_array),
			       .clk(rd_clk),
			       .q(dout_scan));
endmodule