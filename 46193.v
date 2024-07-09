module timer (
	/********** Ê±ÖÓÓë¸´Î» **********/
	input  wire					clk,	   // Ê±ÖÓ
	input  wire					reset,	   // Òì²½¸´Î»
	/********** ×ÜÏß½Ó¿Ú **********/
	input  wire					cs_,	   // Æ¬ÏÈ
	input  wire					as_,	   // µØÖ·Ñ¡Í¨
	input  wire					rw,		   // Read / Write
	input  wire [`TimerAddrBus] addr,	   // µØÖ·
	input  wire [`WordDataBus]	wr_data,   // Ð´Êý¾Ý
	output reg	[`WordDataBus]	rd_data,   // ¶ÁÈ¡Êý¾Ý
	output reg					rdy_,	   // ¥ì¥Ç¥£
	/********** ÖÐ¶ÏÊä³ö **********/
	output reg					irq		   // ÖÐ¶ÏÇëÇó£¨¿ØÖÆ¼Ä´æÆ÷ 1£©
);
	/********** ¿ØÖÆ¼Ä´æÆ÷ **********/
	// ¿ØÖÆ¼Ä´æÆ÷ 0 : ¿ØÖÆ
	reg							mode;	   //Ä£Ê½
	reg							start;	   // ÆðÊ¼Î»
	// ¿ØÖÆ¼Ä´æÆ÷ 2 : µ½ÆÚÖµ
	reg [`WordDataBus]			expr_val;  // µ½ÆÚÖµ
	// ¿ØÖÆ¼Ä´æÆ÷ 3 : ¼ÆÊýÆ÷
	reg [`WordDataBus]			counter;   // ¼ÆÊýÆ÷
	/********** µ½ÆÚ±êÖ¾ **********/
	wire expr_flag = ((start == `ENABLE) && (counter == expr_val)) ?
					 `ENABLE : `DISABLE;
	/********** ¶¨Ê±Æ÷¿ØÖÆ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* Òì²½¸´Î» */
			rd_data	 <= #1 `WORD_DATA_W'h0;
			rdy_	 <= #1 `DISABLE_;
			start	 <= #1 `DISABLE;
			mode	 <= #1 `TIMER_MODE_ONE_SHOT;
			irq		 <= #1 `DISABLE;
			expr_val <= #1 `WORD_DATA_W'h0;
			counter	 <= #1 `WORD_DATA_W'h0;
		end else begin
			/* ×¼±¸¾ÍÐøÐ÷ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_	 <= #1 `ENABLE_;
			end else begin
				rdy_	 <= #1 `DISABLE_;
			end
			/* ¶Á·ÃÎÊ */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `READ)) begin
				case (addr)
					`TIMER_ADDR_CTRL	: begin // ¿ØÖÆ¼Ä´æÆ÷ 0
						rd_data	 <= #1 {{`WORD_DATA_W-2{1'b0}}, mode, start};
					end
					`TIMER_ADDR_INTR	: begin // ¿ØÖÆ¼Ä´æÆ÷ 1
						rd_data	 <= #1 {{`WORD_DATA_W-1{1'b0}}, irq};
					end
					`TIMER_ADDR_EXPR	: begin // ¿ØÖÆ¼Ä´æÆ÷ 2
						rd_data	 <= #1 expr_val;
					end
					`TIMER_ADDR_COUNTER : begin // ¿ØÖÆ¼Ä´æÆ÷ 3
						rd_data	 <= #1 counter;
					end
				endcase
			end else begin
				rd_data	 <= #1 `WORD_DATA_W'h0;
			end
			/* Ð´·ÃÎÊ */
			// ¿ØÖÆ¼Ä´æÆ÷ 0
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
				(rw == `WRITE) && (addr == `TIMER_ADDR_CTRL)) begin
				start	 <= #1 wr_data[`TimerStartLoc];
				mode	 <= #1 wr_data[`TimerModeLoc];
			end else if ((expr_flag == `ENABLE)	 &&
						 (mode == `TIMER_MODE_ONE_SHOT)) begin
				start	 <= #1 `DISABLE;
			end
			// ¿ØÖÆ¼Ä´æÆ÷ 1
			if (expr_flag == `ENABLE) begin
				irq		 <= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
						 (rw == `WRITE) && (addr ==	 `TIMER_ADDR_INTR)) begin
				irq		 <= #1 wr_data[`TimerIrqLoc];
			end
			// ¿ØÖÆ¼Ä´æÆ÷ 2
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
				(rw == `WRITE) && (addr == `TIMER_ADDR_EXPR)) begin
				expr_val <= #1 wr_data;
			end
			// ¿ØÖÆ¼Ä´æÆ÷ 3
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) &&
				(rw == `WRITE) && (addr == `TIMER_ADDR_COUNTER)) begin
				counter	 <= #1 wr_data;
			end else if (expr_flag == `ENABLE) begin
				counter	 <= #1 `WORD_DATA_W'h0;
			end else if (start == `ENABLE) begin
				counter	 <= #1 counter + 1'd1;
			end
		end
	end
endmodule