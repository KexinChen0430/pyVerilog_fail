module id_reg (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,			   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ç¥³©`¥É½Y¹û **********/
	input  wire [`AluOpBus]	   alu_op,		   // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] alu_in_0,	   // ALUÈëÁ¦ 0
	input  wire [`WordDataBus] alu_in_1,	   // ALUÈëÁ¦ 1
	input  wire				   br_flag,		   // ·Öáª¥Õ¥é¥°
	input  wire [`MemOpBus]	   mem_op,		   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] mem_wr_data,	   // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	input  wire [`CtrlOpBus]   ctrl_op,		   // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`RegAddrBus]  dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire				   gpr_we_,		   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	input  wire [`IsaExpBus]   exp_code,	   // ÀýÍâ¥³©`¥É
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,		   // ¥¹¥È©`¥ë
	input  wire				   flush,		   // ¥Õ¥é¥Ã¥·¥å
	/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus] if_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire				   if_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output reg	[`WordAddrBus] id_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	output reg				   id_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	output reg	[`AluOpBus]	   id_alu_op,	   // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`WordDataBus] id_alu_in_0,	   // ALUÈëÁ¦ 0
	output reg	[`WordDataBus] id_alu_in_1,	   // ALUÈëÁ¦ 1
	output reg				   id_br_flag,	   // ·Öáª¥Õ¥é¥°
	output reg	[`MemOpBus]	   id_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`WordDataBus] id_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	output reg	[`CtrlOpBus]   id_ctrl_op,	   // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
	output reg	[`RegAddrBus]  id_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	output reg				   id_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	output reg [`IsaExpBus]	   id_exp_code	   // ÀýÍâ¥³©`¥É
);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			id_pc		   <= #1 `WORD_ADDR_W'h0;
			id_en		   <= #1 `DISABLE;
			id_alu_op	   <= #1 `ALU_OP_NOP;
			id_alu_in_0	   <= #1 `WORD_DATA_W'h0;
			id_alu_in_1	   <= #1 `WORD_DATA_W'h0;
			id_br_flag	   <= #1 `DISABLE;
			id_mem_op	   <= #1 `MEM_OP_NOP;
			id_mem_wr_data <= #1 `WORD_DATA_W'h0;
			id_ctrl_op	   <= #1 `CTRL_OP_NOP;
			id_dst_addr	   <= #1 `REG_ADDR_W'd0;
			id_gpr_we_	   <= #1 `DISABLE_;
			id_exp_code	   <= #1 `ISA_EXP_NO_EXP;
		end else begin
			/* ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿¤Î¸üÐÂ */
			if (stall == `DISABLE) begin
				if (flush == `ENABLE) begin // ¥Õ¥é¥Ã¥·¥å
				   id_pc		  <= #1 `WORD_ADDR_W'h0;
				   id_en		  <= #1 `DISABLE;
				   id_alu_op	  <= #1 `ALU_OP_NOP;
				   id_alu_in_0	  <= #1 `WORD_DATA_W'h0;
				   id_alu_in_1	  <= #1 `WORD_DATA_W'h0;
				   id_br_flag	  <= #1 `DISABLE;
				   id_mem_op	  <= #1 `MEM_OP_NOP;
				   id_mem_wr_data <= #1 `WORD_DATA_W'h0;
				   id_ctrl_op	  <= #1 `CTRL_OP_NOP;
				   id_dst_addr	  <= #1 `REG_ADDR_W'd0;
				   id_gpr_we_	  <= #1 `DISABLE_;
				   id_exp_code	  <= #1 `ISA_EXP_NO_EXP;
				end else begin				// ´Î¤Î¥Ç©`¥¿
				   id_pc		  <= #1 if_pc;
				   id_en		  <= #1 if_en;
				   id_alu_op	  <= #1 alu_op;
				   id_alu_in_0	  <= #1 alu_in_0;
				   id_alu_in_1	  <= #1 alu_in_1;
				   id_br_flag	  <= #1 br_flag;
				   id_mem_op	  <= #1 mem_op;
				   id_mem_wr_data <= #1 mem_wr_data;
				   id_ctrl_op	  <= #1 ctrl_op;
				   id_dst_addr	  <= #1 dst_addr;
				   id_gpr_we_	  <= #1 gpr_we_;
				   id_exp_code	  <= #1 exp_code;
				end
			end
		end
	end
endmodule