module containing reg, parity gen, and comparator
	receive DUT2(clk, data, data_out, data_valid);
	// Clock feeding counter and both regs, period set to 100
	clk #(100) DUT3(clk_en, clk);
	// Using similar inputs as ctr_tb.v
	initial begin
		enable = 0;
		clear = 0;
		clk_en = 1;
		#10 clear = 1;
		#40 clear = 0;
		#50 enable = 1;
		#400 enable = 0;
		#100 enable = 1;
		#500 clear = 1;
		#60 clear = 0;
	end
endmodule