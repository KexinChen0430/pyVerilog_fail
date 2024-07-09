module top_module(
	input CLK,
	input SPI_SS,
	input SPI_SCK,
	input SPI_IO0,
	input SPI_IO1,
	input SPI_IO2,
	input SPI_IO3,
	input USBP,
	input USBN,
	output USBPU,
	output LED,
	input PIN_1,
	`DEBUGOUT PIN_2,
	input PIN_3,
	input PIN_4,
	input PIN_5,
	input PIN_6,
	input PIN_7,
	input PIN_8,
	input PIN_9,
	inout PIN_10,
	input PIN_11,
	input PIN_12,
	input PIN_13,
	input PIN_14,
	output PIN_15,
	output PIN_16,
	output PIN_17,
	output PIN_18,
	output PIN_19,
	output PIN_20,
	input PIN_21,
	input PIN_22,
	input PIN_23,
	input PIN_24,
	input PIN_25,
	input PIN_26,
	input PIN_27,
	input PIN_28,
	input PIN_29,
	input PIN_30,
	input PIN_31,
);
	wire pll_clk_out;
	wire pll_locked;
	pll_module pll(
		.clock_in(CLK),
		.clock_out(pll_clk_out),
		.locked(pll_locked),
	);
	wire n_reset;
	assign n_reset = PIN_1 & pll_locked;
	common_main_module #(
		.CLK_HZ(`PLL_HZ),
	) common (
		.clk(pll_clk_out),
		.n_reset(n_reset),
		.spi_mosi(PIN_11),
		.spi_miso(PIN_10),
		.spi_sck(PIN_12),
		.spi_ss(PIN_13),
		.pb_rx(PIN_14),
		.pb_rx_error(PIN_17),
		.pb_rx_irq_edge(PIN_19),
		.pb_rx_irq_level(PIN_20),
		.pb_tx(PIN_15),
		.pb_tx_active(PIN_16),
		.pb_tx_error(PIN_18),
		.led(LED),
`ifdef DEBUG
		.debug(PIN_2),
`endif
	);
	assign USBPU = 0; /* Disable USB */
endmodule