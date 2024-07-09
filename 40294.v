module uart (
	/********** NbN & Zbg **********/
	input  wire				   clk,		 // NbN
	input  wire				   reset,	 // ñ¯úZbg
	/********** oXC^tF[X **********/
	input  wire				   cs_,		 // `bvZNg
	input  wire				   as_,		 // AhXXg[u
	input  wire				   rw,		 // Read / Write
	input  wire [`UartAddrBus] addr,	 // AhX
	input  wire [`WordDataBus] wr_data,	 // «Ýf[^
	output wire [`WordDataBus] rd_data,	 // ÇÝoµf[^
	output wire				   rdy_,	 // fB
	/********** èÝ **********/
	output wire				   irq_rx,	 // óM®¹èÝ
	output wire				   irq_tx,	 // M®¹èÝ
	/********** UARTóMM	**********/
	input  wire				   rx,		 // UARTóMM
	output wire				   tx		 // UARTMM
);
	/********** §äM **********/
	// óM§ä
	wire					   rx_busy;	 // óMtO
	wire					   rx_end;	 // óM®¹M
	wire [`ByteDataBus]		   rx_data;	 // óMf[^
	// M§ä
	wire					   tx_busy;	 // MtO
	wire					   tx_end;	 // M®¹M
	wire					   tx_start; // MJnM
	wire [`ByteDataBus]		   tx_data;	 // Mf[^
	/********** UART§äW[ **********/
	uart_ctrl uart_ctrl (
		/********** NbN & Zbg **********/
		.clk	  (clk),	   // NbN
		.reset	  (reset),	   // ñ¯úZbg
		/********** Host Interface **********/
		.cs_	  (cs_),	   // `bvZNg
		.as_	  (as_),	   // AhXXg[u
		.rw		  (rw),		   // Read / Write
		.addr	  (addr),	   // AhX
		.wr_data  (wr_data),   // «Ýf[^
		.rd_data  (rd_data),   // ÇÝoµf[^
		.rdy_	  (rdy_),	   // fB
		/********** Interrupt  **********/
		.irq_rx	  (irq_rx),	   // óM®¹èÝ
		.irq_tx	  (irq_tx),	   // M®¹èÝ
		/********** §äM **********/
		// óM§ä
		.rx_busy  (rx_busy),   // óMtO
		.rx_end	  (rx_end),	   // óM®¹M
		.rx_data  (rx_data),   // óMf[^
		// M§ä
		.tx_busy  (tx_busy),   // MtO
		.tx_end	  (tx_end),	   // M®¹M
		.tx_start (tx_start),  // MJnM
		.tx_data  (tx_data)	   // Mf[^
	);
	/********** UARTMW[ **********/
	uart_tx uart_tx (
		/********** NbN & Zbg **********/
		.clk	  (clk),	   // NbN
		.reset	  (reset),	   // ñ¯úZbg
		/********** §äM **********/
		.tx_start (tx_start),  // MJnM
		.tx_data  (tx_data),   // Mf[^
		.tx_busy  (tx_busy),   // MtO
		.tx_end	  (tx_end),	   // M®¹M
		/********** Transmit Signal **********/
		.tx		  (tx)		   // UARTMM
	);
	/********** UARTóMW[ **********/
	uart_rx uart_rx (
		/********** NbN & Zbg **********/
		.clk	  (clk),	   // NbN
		.reset	  (reset),	   // ñ¯úZbg
		/********** §äM **********/
		.rx_busy  (rx_busy),   // óMtO
		.rx_end	  (rx_end),	   // óM®¹M
		.rx_data  (rx_data),   // óMf[^
		/********** Receive Signal **********/
		.rx		  (rx)		   // UARTóMM
	);
endmodule