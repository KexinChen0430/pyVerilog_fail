module
	DE1_SoCPhaseII DE1_SoCPhaseII (CLOCK_50, LEDR, SW, KEY);
	// Running the GUI part of simulation
	DE1_SoCPhaseIItester tester (CLOCK_50, LEDR, SW, KEY);
	// file for gtkwave
	initial
	begin
		$dumpfile("PhaseIItest.vcd");
		$dumpvars(1, DE1_SoCPhaseII);
	end
endmodule