module
	xorGate xorGate (busADD, busA, busB);
	// Running the GUI part of simulation
	xorGatetester tester (busADD, busA, busB);
	// file for gtkwave
	initial
	begin
		$dumpfile("xorGatetest.vcd");
		$dumpvars(1, xorGate);
	end
endmodule