module
	rippleDown myCounter (clk, rst_n, out);
	// Running the GUI part of simulation
	rippleDown_Tester aTester (clk, rst_n, out);
	// file for gtkwave
	initial
	begin
		$dumpfile("rippleDown.vcd");
		$dumpvars(1, myCounter);
	end
endmodule