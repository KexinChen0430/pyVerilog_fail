module gpr (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,				   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,			   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** Õi¤ß³ö¤·¥Ý©`¥È 0 **********/
	input  wire [`RegAddrBus]  rd_addr_0,		   // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
	output wire [`WordDataBus] rd_data_0,		   // Õi¤ß³ö¤·¥Ç©`¥¿
	/********** Õi¤ß³ö¤·¥Ý©`¥È 1 **********/
	input  wire [`RegAddrBus]  rd_addr_1,		   // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
	output wire [`WordDataBus] rd_data_1,		   // Õi¤ß³ö¤·¥Ç©`¥¿
	/********** ø¤­Þz¤ß¥Ý©`¥È **********/
	input  wire				   we_,				   // ø¤­Þz¤ßÓÐ¿
	input  wire [`RegAddrBus]  wr_addr,			   // ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire [`WordDataBus] wr_data			   // ø¤­Þz¤ß¥Ç©`¥¿
);
	/********** ÄÚ²¿ÐÅºÅ **********/
	reg [`WordDataBus]		   gpr [`REG_NUM-1:0]; // ¥ì¥¸¥¹¥¿ÅäÁÐ
	integer					   i;				   // ¥¤¥Æ¥ì©`¥¿
	/********** Õi¤ß³ö¤·¥¢¥¯¥»¥¹ (Write After Read) **********/
	// Õi¤ß³ö¤·¥Ý©`¥È 0
	assign rd_data_0 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_0)) ?
					   wr_data : gpr[rd_addr_0];
	// Õi¤ß³ö¤·¥Ý©`¥È 1
	assign rd_data_1 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_1)) ?
					   wr_data : gpr[rd_addr_1];
	/********** ø¤­Þz¤ß¥¢¥¯¥»¥¹ **********/
	always @ (posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			for (i = 0; i < `REG_NUM; i = i + 1) begin
				gpr[i]		 <= #1 `WORD_DATA_W'h0;
			end
		end else begin
			/* ø¤­Þz¤ß¥¢¥¯¥»¥¹ */
			if (we_ == `ENABLE_) begin
				gpr[wr_addr] <= #1 wr_data;
			end
		end
	end
endmodule