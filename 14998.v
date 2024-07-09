module that accesses our chip's oscillator
	OSCH #("2.08") osc_int (					//"2.03" specifies the operating frequency, 2.03 MHz. Other clock frequencies can be found in the MachX02's documentation
		.STDBY(1'b0),							//Specifies active state
		.OSC(clk),							//Outputs clock signal to 'clk' net
		.SEDSTDBY());							//Leaves SEDSTDBY pin unconnected
	clock_counter counter_1(
		.clk_i(clk),
		.reset_n(reset_n),
		.clk_o(clk_slow)
		);
	ADCinterface int(
		.reset_n(reset_n),
		.clk(clk),
		.CS_n(CS_n),
		.RD_n(RD_n),
		.WR_n(WR_n)
	);
	Sec6_SM FSM_1(
		.clk_i(clk_slow),
		.reset_n(reset_n),
		.sel(sel),
		.digit(digit)
		);
	interpretADC interp(
		.ADCData(ADCData),
		.voltage(voltage)
	);
	determineNum det(
		.sel(sel),
		.ADCData(voltage),
	//	.reset_n(reset_n),
		.dispNum(dispNum)
		);
	sevenSeg segDecoder(
		.data(dispNum),
		.segments(segments)
		);
endmodule