module uart_ctrl (
	/********** NbN & Zbg **********/
	input  wire				   clk,		 // NbN
	input  wire				   reset,	 // ñ¯úZbg
	/********** oXC^tF[X **********/
	input  wire				   cs_,		 // `bvZNg
	input  wire				   as_,		 // AhXXg[u
	input  wire				   rw,		 // Read / Write
	input  wire [`UartAddrBus] addr,	 // AhX
	input  wire [`WordDataBus] wr_data,	 // «Ýf[^
	output reg	[`WordDataBus] rd_data,	 // ÇÝoµf[^
	output reg				   rdy_,	 // fB
	/********** èÝ **********/
	output reg				   irq_rx,	 // óM®¹èÝi§äWX^ 0j
	output reg				   irq_tx,	 // M®¹èÝi§äWX^ 0j
	/********** §äM **********/
	// óM§ä
	input  wire				   rx_busy,	 // óMtOi§äWX^ 0j
	input  wire				   rx_end,	 // óM®¹M
	input  wire [`ByteDataBus] rx_data,	 // óMf[^
	// M§ä
	input  wire				   tx_busy,	 // MtOi§äWX^ 0j
	input  wire				   tx_end,	 // M®¹M
	output reg				   tx_start, // MJnM
	output reg	[`ByteDataBus] tx_data	 // Mf[^
);
	/********** §äWc^ **********/
	// §äWX^ 1 : óMf[^
	reg [`ByteDataBus]		   rx_buf;	 // óMobt@
	/********** UART§ä_ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ñ¯úZbg */
			rd_data	 <= #1 `WORD_DATA_W'h0;
			rdy_	 <= #1 `DISABLE_;
			irq_rx	 <= #1 `DISABLE;
			irq_tx	 <= #1 `DISABLE;
			rx_buf	 <= #1 `BYTE_DATA_W'h0;
			tx_start <= #1 `DISABLE;
			tx_data	 <= #1 `BYTE_DATA_W'h0;
	   end else begin
			/* fBÌ¶¬ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_	 <= #1 `ENABLE_;
			end else begin
				rdy_	 <= #1 `DISABLE_;
			end
			/* ÇÝoµANZX */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `READ)) begin
				case (addr)
					`UART_ADDR_STATUS	 : begin // §äWX^ 0
						rd_data	 <= #1 {{`WORD_DATA_W-4{1'b0}},
										tx_busy, rx_busy, irq_tx, irq_rx};
					end
					`UART_ADDR_DATA		 : begin // §äWX^ 1
						rd_data	 <= #1 {{`BYTE_DATA_W*2{1'b0}}, rx_buf};
					end
				endcase
			end else begin
				rd_data	 <= #1 `WORD_DATA_W'h0;
			end
			/* «ÝANZX */
			// §äWX^ 0 : M®¹èÝ
			if (tx_end == `ENABLE) begin
				irq_tx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_tx<= #1 wr_data[`UartCtrlIrqTx];
			end
			// §äWX^ 0 : óM®¹èÝ
			if (rx_end == `ENABLE) begin
				irq_rx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_rx<= #1 wr_data[`UartCtrlIrqRx];
			end
			// §äWX^ 1
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
				(rw == `WRITE) && (addr == `UART_ADDR_DATA)) begin // MJn
				tx_start <= #1 `ENABLE;
				tx_data	 <= #1 wr_data[`BYTE_MSB:`LSB];
			end else begin
				tx_start <= #1 `DISABLE;
				tx_data	 <= #1 `BYTE_DATA_W'h0;
			end
			/* óMf[^ÌæèÝ */
			if (rx_end == `ENABLE) begin
				rx_buf	 <= #1 rx_data;
			end
		end
	end
endmodule