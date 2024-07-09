module demonstrator, what would be the
	// cts output is unused.
	assign	cts_n = 1'b0;
	// }}}
	// Finally--the unit under test--now that we've set up all the wires
	// to run/test it.
	wbuart	#(INITIAL_UART_SETUP)
	wbuarti(i_clk, pwr_reset,
		wb_stb, wb_stb, 1'b1, wb_addr, wb_data, 4'hf,
		uart_stall, uart_ack, uart_data,
		1'b1, o_uart_tx, cts_n, rts_n_ignored,
		ignored_rx_int, tx_int,
		ignored_rxfifo_int, txfifo_int);
endmodule