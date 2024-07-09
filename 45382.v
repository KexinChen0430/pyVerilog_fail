module
	ALUnit ALUnit (clk, control, busADD, busA, busB, zero, overflow, carryout, negative);
	// Running the GUI part of simulation
	ALUnittester tester (clk, control, busADD, busA, busB, zero, overflow, carryout, negative);
	// file for gtkwave
	initial
	begin
		$dumpfile("ALUnittest.vcd");
		$dumpvars(1, ALUnit);
	end
endmodule