module.
	txuartlite #(24'd868)
		transmitter(i_clk, rx_stb, rx_data, o_uart_tx, tx_busy);
`else
	txuart	transmitter(i_clk, pwr_reset, i_setup, rx_break,
			rx_stb, rx_data, rts, o_uart_tx, tx_busy);
`endif
	// }}}
	// }}}
`endif	// OPT_DUMBECHO
endmodule