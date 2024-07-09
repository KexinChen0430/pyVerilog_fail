module manager */
	Manager manager(
		.clk(SYS_CLK),
		.rst_n(PB[1]),
		.p_mosi(wPMosi),
		.p_miso(wPMiso),
		.p_valid(wPValid),
		.sha_reset_n(wShaResetN),
		.sha_init(wShaInit),
		.sha_next(wShaNext),
		.sha_mode(wShaMode),
		.sha_block(wShaBlock),
		.sha_digest(wShaDigest)
	);
	/* SHA-256 Module */
	sha256_core shainst(
		.clk(SYS_CLK),
		.reset_n(wShaResetN),
		.init(wShaInit),
		.next(wShaNext),
		.mode(wShaMode),
		.block(wShaBlock),
		.ready(),
		.digest(wShaDigest),
		.digest_valid()
	);
	/* Activity LED for SPI */
	ActivityLED act1(
		.clk(SYS_CLK),
		.rst_n(PB[1]),
		.sig_in(I2C_SCL),
		.led_out(wUserLed[0])
	);
	/* Activity LED for SHA-256 */
	ActivityLED act2(
		.clk(SYS_CLK),
		.rst_n(PB[1]),
		.sig_in(wShaInit),
		.led_out(wUserLed[1])
	);
endmodule