module
uart SERIAL(
	.clk(CLK),
	.rx(serial_in),
	.tx(serial_out),
	.par_en(1'b0),
	.tx_req(TXD_ENABLE),
	.tx_end(TXD_DONE_2),
	.tx_data(TXD[7:0]),
	.rx_ready(RXD_START),
	.rx_data(RXD)
);
endmodule