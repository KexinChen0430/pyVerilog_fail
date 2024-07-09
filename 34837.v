module
	wire [15:0] headphone_left, headphone_right, linein_left, linein_right;
	wire new_sample;
	adau1761_izedboard(
	 .clk_48(clk_48),
	 .AC_GPIO1(AC_GPIO1),
	 .AC_GPIO2(AC_GPIO2),
	 .AC_GPIO3(AC_GPIO3),
	 .hphone_l(headphone_left),
	 .hphone_r(headphone_right),
	 .AC_SDA(AC_SDA),
	 .AC_ADR0(AC_ADR0),
	 .AC_ADR1(AC_ADR1),
	 .AC_GPIO0(AC_GPIO0),
	 .AC_MCLK(AC_MCLK),
	 .AC_SCK(AC_SCK),
	 .line_in_l(linein_left),
	 .line_in_r(linein_right),
	 .new_sample(new_sample)
	);
	fpga_top(
			  .clk(clk),
           .led(throwaway),
           .bluetooth_rxd(bt1),
           .bluetooth_txd(bt2),
           .display_rgb1(display_rgb1),
           .display_rgb2(display_rgb2),
           .display_addr(display_addr),
           .display_clk(display_clk),
           .display_oe(display_oe),
           .display_lat(display_lat),
           .usb_rxd(usb_rxd),
           .usb_txd(usb_txd),
			  .height(height),
			  .mode(mode),
			  .on_off(on_off),
			  .sysclk(CLK_OUT1),
			  .uartclk(CLK_OUT4),
			  .uart_active(uart_active),
			  .pll_locked(LOCKED));
	wire [15:0] filter_out_left, filter_out_right;
	SystolicFilter(clk_48, new_sample, linein_left, filter_out_left);
	SystolicFilter(clk_48, new_sample, linein_right, filter_out_right);
	assign headphone_left = (filter_onoff) ? filter_out_left : linein_left;
	assign headphone_right = (filter_onoff) ? filter_out_right : linein_right;
endmodule