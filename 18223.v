module common_main_module #(
	parameter CLK_HZ = 0,
) (
	input clk,
	input n_reset,
	/* SPI bus */
	input spi_mosi,
	inout spi_miso,
	input spi_sck,
	input spi_ss,
	/* Profibus and status */
	input pb_rx,
	output pb_rx_error,
	output pb_rx_irq_edge,
	output pb_rx_irq_level,
	output pb_tx,
	output pb_tx_active,
	output pb_tx_error,
	/* Status and debugging */
	output led,
`ifdef DEBUG
	output debug,
`endif
);
	wire miso;
	wire sck;
	wire ss;
	wire rx_error;
	wire rx_irq_edge;
	wire rx_irq_level;
	wire tx;
	wire tx_error;
	wire rx_active;
	wire tx_active;
`ifdef DEBUG
	wire debug_w;
`endif
	profibus_phy pb(
		.clk(clk),
		.n_reset(n_reset),
		.rx_irq_edge(rx_irq_edge),
		.rx_irq_level(rx_irq_level),
		.mosi(spi_mosi),
		.miso(miso),
		.sck(spi_sck),
		.ss(spi_ss),
		.rx(pb_rx),
		.rx_active(rx_active),
		.rx_error(rx_error),
		.tx(tx),
		.tx_active(tx_active),
		.tx_error(tx_error),
`ifdef DEBUG
		.debug(debug_w),
`endif
	);
	bufif0(spi_miso,		miso,			spi_ss);
	bufif0(pb_rx_error,		rx_error,		0);
	bufif0(pb_rx_irq_edge,	rx_irq_edge,	0);
	bufif0(pb_rx_irq_level,	rx_irq_level,	0);
	bufif0(pb_tx,			tx,				0);
	bufif0(pb_tx_active,	tx_active,		0);
	bufif0(pb_tx_error,		tx_error,		0);
`ifdef DEBUG
	bufif0(debug,			debug_w,		0);
`endif
	wire led_w;
	wire led_enable;
	assign led_enable = tx_active | rx_active;
	led_blink #(
		.BLINK_ON_CLKS(CLK_HZ / 10),
		.BLINK_OFF_CLKS(CLK_HZ / 35),
	) led_blink (
		.clk(clk),
		.n_reset(n_reset),
		.enable(led_enable),
		.led(led_w),
	);
	bufif0(led, led_w, 0);
endmodule