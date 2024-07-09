module
	andGate andGate (busADD, busA, busB);
	// Running the GUI part of simulation
	andGatetester tester (busADD, busA, busB);
	// file for gtkwave
	initial
	begin
		$dumpfile("andGatetest.vcd");
		$dumpvars(1, andGate);
	end
endmodule