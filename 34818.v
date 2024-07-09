module instantions here.
	vendingmachine V1 (.clock(CLOCK_50),
							.enable(enable),
							.reset(KEY[0]),
							.coin(SW[1:0]),
							.mode(SW[2]),
							.quarter_counter(quarter_counter),
							.dime_counter(dime_counter),
							.nickel_counter(nickel_counter),
							.dimenickelLEDon(LED[3]),
							.dimeLEDon(LED[1]),
							.nickelLEDon(LED[0]),
							.vendLEDon(LED[2]));
	sevensegdecoder_always S0 (.digit(nickel_counter[3:0]),
										.drivers(HEX0));
	sevensegdecoder_always S1 (.digit(nickel_counter[7:4]),
										.drivers(HEX1));
	sevensegdecoder_always S2 (.digit(dime_counter[3:0]),
										.drivers(HEX2));
	sevensegdecoder_always S3 (.digit(dime_counter[7:4]),
										.drivers(HEX3));
	sevensegdecoder_always S4 (.digit(quarter_counter[3:0]),
										.drivers(HEX4));
	sevensegdecoder_always S5 (.digit(quarter_counter[7:4]),
										.drivers(HEX5));
endmodule