module
	// leda B_1202 on 2 clocks in this unit detected
	assign rd_data =
	// synopsys translate_off
	(r_rd_addr >= 8) ? ~(12'b0) :
	// synopsys translate_on
	data[r_rd_addr];
endmodule