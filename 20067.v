module
		.rst(reset),                      // Synchronous reset
		.rx(Rx),                          // Incoming serial line
		.tx(Tx),                          // Outgoing serial line
		.transmit(transmit),              // Signal to transmit
		.tx_byte(tx_byte),                // Byte to transmit
		.received(received),              // Indicated that a byte has been received
		.rx_byte(rx_byte),                // Byte received
		.is_receiving(is_receiving),      // Low when receive line is idle
		.is_transmitting(is_transmitting),// Low when transmit line is idle
		.recv_error(recv_error)           // Indicates error in receiving packet.
	);
	always @(posedge CLK_100MHz) begin
		if (received) begin
			tx_byte <= rx_byte;
			transmit <= 1;
		end
		if (is_transmitting) begin
			transmit <= 0;
		end
	end
endmodule