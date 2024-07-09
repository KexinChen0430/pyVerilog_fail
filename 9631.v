module that accesses the chip's oscillator
        //"2.08" specifies the operating frequency, 2.03 MHz. Other clock frequencies can be found in the MachX02's documentation
	OSCH #("2.08") osc_int (
                .STDBY(1'b0),	      //Specifies active state
		.OSC(clk),	      //Outputs clock signal to 'clk' net
		.SEDSTDBY()           //Leaves SEDSTDBY pin unconnected
	);
	clock_counter divider1 (
		.reset_n(reset_n),
		.clk_i(clk),
		.clk_o(clk_slow)
	);
	ADCinterface ADC1 (
		.clk(clk),
		.reset_n(reset_n),
		.CS_n(CS_o),
		.RD_n(RD_o),
		.WR_n(WR_o)
	);
	digit_state_machine DSM1 (
		.units(units_place),
		.tens(tens_place),
		.hundreds(hundreds_place),
		.thousands(thousands_place),
		.reset_n(reset_n),
                .clk(clk_slow),
		.digit_select(digit),
		.data(data_o),
		.decimal_point(decimal_point)
	);
	decoder d1(
		.data(data_o),
		.segments(segments)
	);
endmodule