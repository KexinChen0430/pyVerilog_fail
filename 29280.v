module ex_reg (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,			   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ALU¤Î³öÁ¦ **********/
	input  wire [`WordDataBus] alu_out,		   // ÑÝËã½Y¹û
	input  wire				   alu_of,		   // ¥ª©`¥Ð¥Õ¥í©`
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,		   // ¥¹¥È©`¥ë
	input  wire				   flush,		   // ¥Õ¥é¥Ã¥·¥å
	input  wire				   int_detect,	   // ¸î¤êÞz¤ßÊ³ö
	/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus] id_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire				   id_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire				   id_br_flag,	   // ·Öáª¥Õ¥é¥°
	input  wire [`MemOpBus]	   id_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] id_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	input  wire [`CtrlOpBus]   id_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`RegAddrBus]  id_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire				   id_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	input  wire [`IsaExpBus]   id_exp_code,	   // ÀýÍâ¥³©`¥É
	/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output reg	[`WordAddrBus] ex_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	output reg				   ex_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	output reg				   ex_br_flag,	   // ·Öáª¥Õ¥é¥°
	output reg	[`MemOpBus]	   ex_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`WordDataBus] ex_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	output reg	[`CtrlOpBus]   ex_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`RegAddrBus]  ex_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	output reg				   ex_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	output reg	[`IsaExpBus]   ex_exp_code,	   // ÀýÍâ¥³©`¥É
	output reg	[`WordDataBus] ex_out		   // IÀí½Y¹û
);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
		if (reset == `RESET_ENABLE) begin
			ex_pc		   <= #1 `WORD_ADDR_W'h0;
			ex_en		   <= #1 `DISABLE;
			ex_br_flag	   <= #1 `DISABLE;
			ex_mem_op	   <= #1 `MEM_OP_NOP;
			ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
			ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
			ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
			ex_gpr_we_	   <= #1 `DISABLE_;
			ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
			ex_out		   <= #1 `WORD_DATA_W'h0;
		end else begin
			/* ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿¤Î¸üÐÂ */
			if (stall == `DISABLE) begin
				if (flush == `ENABLE) begin				  // ¥Õ¥é¥Ã¥·¥å
					ex_pc		   <= #1 `WORD_ADDR_W'h0;
					ex_en		   <= #1 `DISABLE;
					ex_br_flag	   <= #1 `DISABLE;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (int_detect == `ENABLE) begin // ¸î¤êÞz¤ß¤ÎÊ³ö
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_EXT_INT;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (alu_of == `ENABLE) begin	  // ËãÐg¥ª©`¥Ð¥Õ¥í©`
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_OVERFLOW;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else begin							  // ´Î¤Î¥Ç©`¥¿
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 id_mem_op;
					ex_mem_wr_data <= #1 id_mem_wr_data;
					ex_ctrl_op	   <= #1 id_ctrl_op;
					ex_dst_addr	   <= #1 id_dst_addr;
					ex_gpr_we_	   <= #1 id_gpr_we_;
					ex_exp_code	   <= #1 id_exp_code;
					ex_out		   <= #1 alu_out;
				end
			end
		end
	end
endmodule