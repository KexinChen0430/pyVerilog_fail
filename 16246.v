module itself.  Note that we haven't
	// connected the reset wire.  Transmitting is as simple as setting
	// the stb value (here set to tx_empty_n) and the data.  When these
	// are both set on the same clock that tx_busy is low, the transmitter
	// will move on to the next data byte.  Really, the only thing magical
	// here is that tx_empty_n wire--thus, if there's anything in the FIFO,
	// we read it here.  (You might notice above, we register a read any
	// time (tx_empty_n) and (!tx_busy) are both true---the condition for
	// starting to transmit a new byte.)
	txuart	#(.INITIAL_SETUP(INITIAL_SETUP)) tx(i_clk, 1'b0, uart_setup,
			r_tx_break, (tx_empty_n), tx_data,
			cts_n, o_uart_tx, tx_busy);
	// }}}
`endif
	// wb_tx_data
	// {{{
	// Now that we are done with the chain, pick some wires for the user
	// to read on any read of the transmit port.
	// This port is different from reading from the receive port, since
	// there are no side effects.  (Reading from the receive port advances
	// the receive FIFO, here only writing to the transmit port advances the
	// transmit FIFO--hence the read values are free for ... whatever.)
	// We choose here to provide information about the transmit FIFO
	// (txf_err, txf_half_full, txf_full_n), information about the current
	// voltage on the line (o_uart_tx)--and even the voltage on the receive
	// line (ck_uart), as well as our current setting of the break and
	// whether or not we are actively transmitting.
	assign	wb_tx_data = { 16'h00,
			i_cts_n, txf_status[1:0], txf_err,
			ck_uart, o_uart_tx, tx_break, (tx_busy|txf_status[0]),
			(tx_busy|txf_status[0])?txf_wb_data:8'b00};
	// }}}
	// }}}
	////////////////////////////////////////////////////////////////////////
	// Bus / register handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	// wb_fifo_data
	// {{{
	// Each of the FIFO's returns a 16 bit status value.  This value tells
	// us both how big the FIFO is, as well as how much of the FIFO is in
	// use.  Let's merge those two status words together into a word we
	// can use when reading about the FIFO.
	assign	wb_fifo_data = { txf_status, rxf_status };
	// }}}
	// r_wb_addr
	// {{{
	// You may recall from above that reads take two clocks.  Hence, we
	// need to delay the address decoding for a clock until the data is
	// ready.  We do that here.
	always @(posedge i_clk)
		r_wb_addr <= i_wb_addr;
	// }}}
	// r_wb_ack
	// {{{
	initial	r_wb_ack = 1'b0;
	always @(posedge i_clk) // We'll ACK in two clocks
		r_wb_ack <= i_wb_stb;
	// }}}
	// o_wb_ack
	// {{{
	initial	o_wb_ack = 1'b0;
	always @(posedge i_clk) // Okay, time to set the ACK
		o_wb_ack <= i_wb_cyc && r_wb_ack;
	// }}}
	// o_wb_data
	// {{{
	// Finally, set the return data.  This data must be valid on the same
	// clock o_wb_ack is high.  On all other clocks, it is irrelelant--since
	// no one cares, no one is reading it, it gets lost in the mux in the
	// interconnect, etc.  For this reason, we can just simplify our logic.
	always @(posedge i_clk)
	casez(r_wb_addr)
	UART_SETUP: o_wb_data <= { 1'b0, uart_setup };
	UART_FIFO:  o_wb_data <= wb_fifo_data;
	UART_RXREG: o_wb_data <= wb_rx_data;
	UART_TXREG: o_wb_data <= wb_tx_data;
	endcase
	// }}}
	// o_wb_stall
	// {{{
	// This device never stalls.  Sure, it takes two clocks, but they are
	// pipelined, and nothing stalls that pipeline.  (Creates FIFO errors,
	// perhaps, but doesn't stall the pipeline.)  Hence, we can just
	// set this value to zero.
	assign	o_wb_stall = 1'b0;
	// }}}
	// }}}
	// Make verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_data[31] };
	// verilator lint_on UNUSED
	// }}}
endmodule