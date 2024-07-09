module itself.  Note that we haven't
	// connected the reset wire.  Transmitting is as simple as setting
	// the stb value (here set to tx_empty_n) and the data.  When these
	// are both set on the same clock that tx_busy is low, the transmitter
	// will move on to the next data byte.  Really, the only thing magical
	// here is that tx_empty_n wire--thus, if there's anything in the FIFO,
	// we read it here.  (You might notice above, we register a read any
	// time (tx_empty_n) and (!tx_busy) are both true---the condition for
	// starting to transmit a new byte.)
	txuart	#(.INITIAL_SETUP(INITIAL_SETUP)) tx(S_AXI_ACLK, 1'b0, uart_setup,
			r_tx_break, (tx_empty_n), tx_data,
			cts_n, o_uart_tx, tx_busy);
`endif
`endif	// FORMAL
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
	assign	axil_tx_data = { 16'h00,
			i_cts_n, txf_status[1:0], txf_err,
			ck_uart, o_uart_tx, tx_break, (tx_busy|txf_status[0]),
			(tx_busy|txf_status[0])?txf_axil_data:8'b00};
	// }}}
	/////////////////////////////////////////
	// FIFO return
	// {{{
	/////////////////////////////////////////
	// Each of the FIFO's returns a 16 bit status value.  This value tells
	// us both how big the FIFO is, as well as how much of the FIFO is in
	// use.  Let's merge those two status words together into a word we
	// can use when reading about the FIFO.
	assign	axil_fifo_data = { txf_status, rxf_status };
	// }}}
	/////////////////////////////////////////
	// Final read register
	// {{{
	/////////////////////////////////////////
	// You may recall from above that reads take two clocks.  Hence, we
	// need to delay the address decoding for a clock until the data is
	// ready.  We do that here.
	initial	r_preread = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		r_preread <= 0;
	else if (axil_read_ready)
		r_preread   <= 1;
	else if (!S_AXI_RVALID || S_AXI_RREADY)
		r_preread   <= 0;
	always @(posedge S_AXI_ACLK)
	if (axil_read_ready)
		r_axil_addr <= arskd_addr;
	// Finally, set the return data.  This data must be valid on the same
	// clock S_AXI_RVALID is high.  On all other clocks, it is
	// irrelelant--since no one cares, no one is reading it, it gets lost
	// in the mux in the interconnect, etc.  For this reason, we can just
	// simplify our logic.
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_RVALID || S_AXI_RREADY)
	begin
		casez(r_axil_addr)
		UART_SETUP: axil_read_data <= { 1'b0, uart_setup };
		UART_FIFO:  axil_read_data <= axil_fifo_data;
		UART_RXREG: axil_read_data <= axil_rx_data;
		UART_TXREG: axil_read_data <= axil_tx_data;
		endcase
		if (OPT_LOWPOWER && !r_preread)
			axil_read_data <= 0;
	end
	// }}}
	function [C_AXI_DATA_WIDTH-1:0]	apply_wstrb;
		input	[C_AXI_DATA_WIDTH-1:0]		prior_data;
		input	[C_AXI_DATA_WIDTH-1:0]		new_data;
		input	[C_AXI_DATA_WIDTH/8-1:0]	wstrb;
		integer	k;
		for(k=0; k<C_AXI_DATA_WIDTH/8; k=k+1)
		begin
			apply_wstrb[k*8 +: 8]
				= wstrb[k] ? new_data[k*8 +: 8] : prior_data[k*8 +: 8];
		end
	endfunction
	// }}}
	////////////////////////////////////////////////////////////////////////
	// Veri1ator lint-check
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, S_AXI_AWPROT, S_AXI_ARPROT,
			S_AXI_ARADDR[ADDRLSB-1:0],
			S_AXI_AWADDR[ADDRLSB-1:0], new_setup[31] };
	// Verilator lint_on  UNUSED
	// }}}
`ifdef	FORMAL
	////////////////////////////////////////////////////////////////////////
	// Formal properties used in verfiying this core
	////////////////////////////////////////////////////////////////////////
	// {{{
	reg	f_past_valid;
	initial	f_past_valid = 0;
	always @(posedge S_AXI_ACLK)
		f_past_valid <= 1;
	////////////////////////////////////////////////////////////////////////
	// The AXI-lite control interface
	////////////////////////////////////////////////////////////////////////
	// {{{
	localparam	F_AXIL_LGDEPTH = 4;
	wire	[F_AXIL_LGDEPTH-1:0]	faxil_rd_outstanding,
					faxil_wr_outstanding,
					faxil_awr_outstanding;
	faxil_slave #(
		// {{{
		.C_AXI_DATA_WIDTH(C_AXI_DATA_WIDTH),
		.C_AXI_ADDR_WIDTH(C_AXI_ADDR_WIDTH),
		.F_LGDEPTH(F_AXIL_LGDEPTH),
		.F_AXI_MAXWAIT(4),
		.F_AXI_MAXDELAY(4),
		.F_AXI_MAXRSTALL(3),
		.F_OPT_COVER_BURST(4)
		// }}}
	) faxil(
		// {{{
		.i_clk(S_AXI_ACLK), .i_axi_reset_n(S_AXI_ARESETN),
		.i_axi_awvalid(S_AXI_AWVALID),
		.i_axi_awready(S_AXI_AWREADY),
		.i_axi_awaddr( S_AXI_AWADDR),
		.i_axi_awcache(4'h0),
		.i_axi_awprot( S_AXI_AWPROT),
		.i_axi_wvalid(S_AXI_WVALID),
		.i_axi_wready(S_AXI_WREADY),
		.i_axi_wdata( S_AXI_WDATA),
		.i_axi_wstrb( S_AXI_WSTRB),
		.i_axi_bvalid(S_AXI_BVALID),
		.i_axi_bready(S_AXI_BREADY),
		.i_axi_bresp( S_AXI_BRESP),
		.i_axi_arvalid(S_AXI_ARVALID),
		.i_axi_arready(S_AXI_ARREADY),
		.i_axi_araddr( S_AXI_ARADDR),
		.i_axi_arcache(4'h0),
		.i_axi_arprot( S_AXI_ARPROT),
		.i_axi_rvalid(S_AXI_RVALID),
		.i_axi_rready(S_AXI_RREADY),
		.i_axi_rdata( S_AXI_RDATA),
		.i_axi_rresp( S_AXI_RRESP),
		.f_axi_rd_outstanding(faxil_rd_outstanding),
		.f_axi_wr_outstanding(faxil_wr_outstanding),
		.f_axi_awr_outstanding(faxil_awr_outstanding)
		// }}}
		);
	always @(*)
	if (OPT_SKIDBUFFER)
	begin
		assert(faxil_awr_outstanding== (S_AXI_BVALID ? 1:0)
			+(S_AXI_AWREADY ? 0:1));
		assert(faxil_wr_outstanding == (S_AXI_BVALID ? 1:0)
			+(S_AXI_WREADY ? 0:1));
		assert(faxil_rd_outstanding == (S_AXI_RVALID ? 1:0)
			+ (r_preread ? 1:0) +(S_AXI_ARREADY ? 0:1));
	end else begin
		assert(faxil_wr_outstanding == (S_AXI_BVALID ? 1:0));
		assert(faxil_awr_outstanding == faxil_wr_outstanding);
		assert(faxil_rd_outstanding == (S_AXI_RVALID ? 1:0)
			+ (r_preread ? 1:0));
		assert(S_AXI_ARREADY == (!S_AXI_RVALID && !r_preread));
	end
`ifdef	VERIFIC
	assert property (@(posedge S_AXI_ACLK)
		disable iff (!S_AXI_ARESETN || (S_AXI_RVALID && !S_AXI_RREADY))
		S_AXI_ARVALID && S_AXI_ARREADY && S_AXI_ARADDR[3:2]== UART_SETUP
		|=> r_preread && r_axil_addr == UART_SETUP
		##1 S_AXI_RVALID && axil_read_data
						== { 1'b0, $past(uart_setup) });
	assert property (@(posedge S_AXI_ACLK)
		disable iff (!S_AXI_ARESETN || (S_AXI_RVALID && !S_AXI_RREADY))
		S_AXI_ARVALID && S_AXI_ARREADY && S_AXI_ARADDR[3:2] == UART_FIFO
		|=> r_preread && r_axil_addr == UART_FIFO
		##1 S_AXI_RVALID && axil_read_data == $past(axil_fifo_data));
	assert property (@(posedge S_AXI_ACLK)
		disable iff (!S_AXI_ARESETN || (S_AXI_RVALID && !S_AXI_RREADY))
		S_AXI_ARVALID && S_AXI_ARREADY && S_AXI_ARADDR[3:2]== UART_RXREG
		|=> r_preread && r_axil_addr == UART_RXREG
		##1 S_AXI_RVALID && axil_read_data == $past(axil_rx_data));
	assert property (@(posedge S_AXI_ACLK)
		disable iff (!S_AXI_ARESETN || (S_AXI_RVALID && !S_AXI_RREADY))
		S_AXI_ARVALID && S_AXI_ARREADY && S_AXI_ARADDR[3:2]== UART_TXREG
		|=> r_preread && r_axil_addr == UART_TXREG
		##1 S_AXI_RVALID && axil_read_data == $past(axil_tx_data));
`endif
	// Check that our low-power only logic works by verifying that anytime
	// S_AXI_RVALID is inactive, then the outgoing data is also zero.
	always @(*)
	if (OPT_LOWPOWER && !S_AXI_RVALID)
		assert(S_AXI_RDATA == 0);
	// }}}
	////////////////////////////////////////////////////////////////////////
	// Cover checks
	////////////////////////////////////////////////////////////////////////
	// {{{
	// While there are already cover properties in the formal property
	// set above, you'll probably still want to cover something
	// application specific here
	// }}}
	// }}}
`endif
endmodule