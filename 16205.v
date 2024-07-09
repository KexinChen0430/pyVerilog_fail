module.
	keypressed K1 (.clock(CLOCK_50),			// 50 MHz FPGA Clock
						.reset(KEY[0]),			// Master Reset - Pushbutton Key 0
						.enable_in(KEY[1]),		// Enable - Pushbutton Key 1
						.enable_out(enable));	// Connect to the enable input port of the counter.
	counter16bit C1 (.clock(CLOCK_50),				// 50 MHz FPGA Clock
						  .enable(enable),				// Driven by the enable_out port from the keypressed FSM
						  .clear(KEY[0]),					// Master Reset - Pushbutton key 0
						  .disp(SW[5]),					// Disp - DIP switch 5
						  .dir(SW[4]),						// Dir - DIP switch 2
						  .countValue(SW[3:0]),			// countValue - DIP switches (3:0)
						  .outputValue(hexDigits));	// hexDigits - Connect to the seven-segment displays
// INSTANTIATE FOUR INSTANCES OF YOUR 7-SEGMENT DISPLAY DRIVER.
// EACH ONE SHOULD ACCEPT A FOUR-BIT VALUE THAT CORRESPONDS TO ONE HEX DIGIT OF THE COUNTER VALUE.
// THE OUTPUTS OF THE DISPLAY DRIVERS SHOULD CORRESPOND TO A SET OF DRIVERS FOR THE 7-SEGMENT DISPLAYS.
// FOLLOW THE "NAMED ASSIGNMENT" APPROACH USED IN KEYPRESSED AND COUNTER16BIT.
	sevensegdecoder_always S0 (.digit(hexDigits[3:0]),
										.drivers(HEX0));
	sevensegdecoder_always S1 (.digit(hexDigits[7:4]),
										.drivers(HEX1));
	sevensegdecoder_always S2 (.digit(hexDigits[11:8]),
										.drivers(HEX2));
	sevensegdecoder_always S3 (.digit(hexDigits[15:12]),
										.drivers(HEX3));
endmodule