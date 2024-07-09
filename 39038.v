module if_reg (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,		   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,	   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Õ¥§¥Ã¥Á¥Ç©`¥¿ **********/
	input  wire [`WordDataBus] insn,	   // ¥Õ¥§¥Ã¥Á¤·¤¿ÃüÁî
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,	   // ¥¹¥È©`¥ë
	input  wire				   flush,	   // ¥Õ¥é¥Ã¥·¥å
	input  wire [`WordAddrBus] new_pc,	   // ÐÂ¤·¤¤¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire				   br_taken,   // ·Öáª¤Î³ÉÁ¢
	input  wire [`WordAddrBus] br_addr,	   // ·ÖáªÏÈ¥¢¥É¥ì¥¹
	/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output reg	[`WordAddrBus] if_pc,	   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	output reg	[`WordDataBus] if_insn,	   // ÃüÁî
	output reg				   if_en	   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			if_pc	<= #1 `RESET_VECTOR;
			if_insn <= #1 `ISA_NOP;
			if_en	<= #1 `DISABLE;
		end else begin
			/* ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿¤Î¸üÐÂ */
			if (stall == `DISABLE) begin
				if (flush == `ENABLE) begin				// ¥Õ¥é¥Ã¥·¥å
					if_pc	<= #1 new_pc;
					if_insn <= #1 `ISA_NOP;
					if_en	<= #1 `DISABLE;
				end else if (br_taken == `ENABLE) begin // ·Öáª¤Î³ÉÁ¢
					if_pc	<= #1 br_addr;
					if_insn <= #1 insn;
					if_en	<= #1 `ENABLE;
				end else begin							// ´Î¤Î¥¢¥É¥ì¥¹
					if_pc	<= #1 if_pc + 1'd1;
					if_insn <= #1 insn;
					if_en	<= #1 `ENABLE;
				end
			end
		end
	end
endmodule