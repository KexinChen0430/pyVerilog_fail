module
	SRAM2Kby16 SRAM (clk, adx, WrEn, data);
	// Running the GUI part of simulation
	SRAMtester tester (clk, adx, WrEn, data);
	// file for gtkwave
	initial
	begin
		$dumpfile("SRAMtest.vcd");
		$dumpvars(1, SRAM);
	end
endmodule