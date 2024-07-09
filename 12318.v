module
	// Credit: http://www.johnloomis.org/digitallab/ps2lab1/ps2lab1.html
	keyboard keybd(
		.keyboard_clk(PS2_CLK),
		.keyboard_data(PS2_DAT),
		.clock50(CLOCK_50),
		.reset(0),
		.read(read),
		.scan_ready(scan_ready),
		.scan_code(scan_code)
		);
	// Module to regulate keyboard input
	// Credit: http://www.johnloomis.org/digitallab/ps2lab1/ps2lab1.html
	oneshot pulser(
		.pulse_out(read),
		.trigger_in(scan_ready),
		.clk(CLOCK_50)
		);
	// Module to output info to the seven-segment displays
	sevenseg ss(
		.seg0(HEX0),
		.seg1(HEX1),
		.seg2(HEX2),
		.seg3(HEX3),
		.seg4(HEX4),
		.seg5(HEX5),
		.seg6(HEX6),
		.seg7(HEX7),
		.score_p1(p1_score),
		.score_p2(p2_score),
		.winner(winner)
		);
endmodule