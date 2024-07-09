module
	addition addition (busADD, busA, busB, zADD, oADD, cADD, nADD);
	// Running the GUI part of simulation
	additiontester tester (busADD, busA, busB, zADD, oADD, cADD, nADD);
	// file for gtkwave
	initial
	begin
		$dumpfile("additiontest.vcd");
		$dumpvars(1, addition);
	end
endmodule