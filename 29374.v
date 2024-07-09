module
dp_ram rm_fifo(
	// Write port
	.a_clk(wb_clk_i), .a_wr(fifo_wr), .a_addr(fifo_wr_addr),
	.a_din(fifo_din), .a_dout(),
	// Read port
	.b_clk(wb_clk_i), .b_wr(1'b0), .b_addr(fifo_rd_addr),
	.b_din(16'b0), .b_dout(fifo_dout)
);
endmodule