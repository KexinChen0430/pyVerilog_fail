module uart_ctrl (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,		 // ¥¯¥í¥Ã¥¯
	input  wire				   reset,	 // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire				   cs_,		 // ¥Á¥Ã¥×¥»¥ì¥¯¥È
	input  wire				   as_,		 // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	input  wire				   rw,		 // Read / Write
	input  wire [`UartAddrBus] addr,	 // ¥¢¥É¥ì¥¹
	input  wire [`WordDataBus] wr_data,	 // ø¤­Þz¤ß¥Ç©`¥¿
	output reg	[`WordDataBus] rd_data,	 // Õi¤ß³ö¤·¥Ç©`¥¿
	output reg				   rdy_,	 // ¥ì¥Ç¥£
	/********** ¸î¤êÞz¤ß **********/
	output reg				   irq_rx,	 // ÊÜÐÅÍêÁË¸î¤êÞz¤ß£¨ÖÆÓù¥ì¥¸¥¹¥¿ 0£©
	output reg				   irq_tx,	 // ËÍÐÅÍêÁË¸î¤êÞz¤ß£¨ÖÆÓù¥ì¥¸¥¹¥¿ 0£©
	/********** ÖÆÓùÐÅºÅ **********/
	// ÊÜÐÅÖÆÓù
	input  wire				   rx_busy,	 // ÊÜÐÅÖÐ¥Õ¥é¥°£¨ÖÆÓù¥ì¥¸¥¹¥¿ 0£©
	input  wire				   rx_end,	 // ÊÜÐÅÍêÁËÐÅºÅ
	input  wire [`ByteDataBus] rx_data,	 // ÊÜÐÅ¥Ç©`¥¿
	// ËÍÐÅÖÆÓù
	input  wire				   tx_busy,	 // ËÍÐÅÖÐ¥Õ¥é¥°£¨ÖÆÓù¥ì¥¸¥¹¥¿ 0£©
	input  wire				   tx_end,	 // ËÍÐÅÍêÁËÐÅºÅ
	output reg				   tx_start, // ËÍÐÅé_Ê¼ÐÅºÅ
	output reg	[`ByteDataBus] tx_data	 // ËÍÐÅ¥Ç©`¥¿
);
	/********** ÖÆÓù¥ì¥¸¥Ä¥¿ **********/
	// ÖÆÓù¥ì¥¸¥¹¥¿ 1 : ËÍÊÜÐÅ¥Ç©`¥¿
	reg [`ByteDataBus]		   rx_buf;	 // ÊÜÐÅ¥Ð¥Ã¥Õ¥¡
	/********** UARTÖÆÓùÕÀí **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			rd_data	 <= #1 `WORD_DATA_W'h0;
			rdy_	 <= #1 `DISABLE_;
			irq_rx	 <= #1 `DISABLE;
			irq_tx	 <= #1 `DISABLE;
			rx_buf	 <= #1 `BYTE_DATA_W'h0;
			tx_start <= #1 `DISABLE;
			tx_data	 <= #1 `BYTE_DATA_W'h0;
	   end else begin
			/* ¥ì¥Ç¥£¤ÎÉú³É */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_	 <= #1 `ENABLE_;
			end else begin
				rdy_	 <= #1 `DISABLE_;
			end
			/* Õi¤ß³ö¤·¥¢¥¯¥»¥¹ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `READ)) begin
				case (addr)
					`UART_ADDR_STATUS	 : begin // ÖÆÓù¥ì¥¸¥¹¥¿ 0
						rd_data	 <= #1 {{`WORD_DATA_W-4{1'b0}},
										tx_busy, rx_busy, irq_tx, irq_rx};
					end
					`UART_ADDR_DATA		 : begin // ÖÆÓù¥ì¥¸¥¹¥¿ 1
						rd_data	 <= #1 {{`BYTE_DATA_W*2{1'b0}}, rx_buf};
					end
				endcase
			end else begin
				rd_data	 <= #1 `WORD_DATA_W'h0;
			end
			/* ø¤­Þz¤ß¥¢¥¯¥»¥¹ */
			// ÖÆÓù¥ì¥¸¥¹¥¿ 0 : ËÍÐÅÍêÁË¸î¤êÞz¤ß
			if (tx_end == `ENABLE) begin
				irq_tx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_tx<= #1 wr_data[`UartCtrlIrqTx];
			end
			// ÖÆÓù¥ì¥¸¥¹¥¿ 0 : ÊÜÐÅÍêÁË¸î¤êÞz¤ß
			if (rx_end == `ENABLE) begin
				irq_rx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_rx<= #1 wr_data[`UartCtrlIrqRx];
			end
			// ÖÆÓù¥ì¥¸¥¹¥¿ 1
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
				(rw == `WRITE) && (addr == `UART_ADDR_DATA)) begin // ËÍÐÅé_Ê¼
				tx_start <= #1 `ENABLE;
				tx_data	 <= #1 wr_data[`BYTE_MSB:`LSB];
			end else begin
				tx_start <= #1 `DISABLE;
				tx_data	 <= #1 `BYTE_DATA_W'h0;
			end
			/* ÊÜÐÅ¥Ç©`¥¿¤ÎÈ¡¤êÞz¤ß */
			if (rx_end == `ENABLE) begin
				rx_buf	 <= #1 rx_data;
			end
		end
	end
endmodule