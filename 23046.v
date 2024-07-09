module
	JohnsonCounter myCounter (clk, rst_n, out);
	// Running the GUI part of simulation
	JohnsonCounter_Tester aTester (clk, rst_n, out);
	// file for gtkwave
	initial
	begin
		$dumpfile("JohnsonCounter.vcd");
		$dumpvars(1, myCounter);
	end
endmodule