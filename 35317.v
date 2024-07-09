module ex_stage (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,			   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,		   // ¥¹¥È©`¥ë
	input  wire				   flush,		   // ¥Õ¥é¥Ã¥·¥å
	input  wire				   int_detect,	   // ¸î¤êÞz¤ßÊ³ö
	/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
	output wire [`WordDataBus] fwd_data,	   // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
	/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus] id_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire				   id_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire [`AluOpBus]	   id_alu_op,	   // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] id_alu_in_0,	   // ALUÈëÁ¦ 0
	input  wire [`WordDataBus] id_alu_in_1,	   // ALUÈëÁ¦ 1
	input  wire				   id_br_flag,	   // ·Öáª¥Õ¥é¥°
	input  wire [`MemOpBus]	   id_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] id_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	input  wire [`CtrlOpBus]   id_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`RegAddrBus]  id_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire				   id_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	input  wire [`IsaExpBus]   id_exp_code,	   // ÀýÍâ¥³©`¥É
	/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output wire [`WordAddrBus] ex_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	output wire				   ex_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	output wire				   ex_br_flag,	   // ·Öáª¥Õ¥é¥°
	output wire [`MemOpBus]	   ex_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`WordDataBus] ex_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	output wire [`CtrlOpBus]   ex_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`RegAddrBus]  ex_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	output wire				   ex_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	output wire [`IsaExpBus]   ex_exp_code,	   // ÀýÍâ¥³©`¥É
	output wire [`WordDataBus] ex_out		   // IÀí½Y¹û
);
	/********** ALU¤Î³öÁ¦ **********/
	wire [`WordDataBus]		   alu_out;		   // ÑÝËã½Y¹û
	wire					   alu_of;		   // ¥ª©`¥Ð¥Õ¥í©`
	/********** ÑÝËã½Y¹û¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
	assign fwd_data = alu_out;
	/********** ALU **********/
	alu alu (
		.in_0			(id_alu_in_0),	  // ÈëÁ¦ 0
		.in_1			(id_alu_in_1),	  // ÈëÁ¦ 1
		.op				(id_alu_op),	  // ¥ª¥Ú¥ì©`¥·¥ç¥ó
		.out			(alu_out),		  // ³öÁ¦
		.of				(alu_of)		  // ¥ª©`¥Ð¥Õ¥í©`
	);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	ex_reg ex_reg (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),			  // ¥¯¥í¥Ã¥¯
		.reset			(reset),		  // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ALU¤Î³öÁ¦ **********/
		.alu_out		(alu_out),		  // ÑÝËã½Y¹û
		.alu_of			(alu_of),		  // ¥ª©`¥Ð¥Õ¥í©`
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall			(stall),		  // ¥¹¥È©`¥ë
		.flush			(flush),		  // ¥Õ¥é¥Ã¥·¥å
		.int_detect		(int_detect),	  // ¸î¤êÞz¤ßÊ³ö
		/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.id_pc			(id_pc),		  // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.id_en			(id_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.id_br_flag		(id_br_flag),	  // ·Öáª¥Õ¥é¥°
		.id_mem_op		(id_mem_op),	  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_mem_wr_data (id_mem_wr_data), // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.id_ctrl_op		(id_ctrl_op),	  // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_dst_addr	(id_dst_addr),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.id_gpr_we_		(id_gpr_we_),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.id_exp_code	(id_exp_code),	  // ÀýÍâ¥³©`¥É
		/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.ex_pc			(ex_pc),		  // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.ex_en			(ex_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_br_flag		(ex_br_flag),	  // ·Öáª¥Õ¥é¥°
		.ex_mem_op		(ex_mem_op),	  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_mem_wr_data (ex_mem_wr_data), // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ex_ctrl_op		(ex_ctrl_op),	  // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_dst_addr	(ex_dst_addr),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_		(ex_gpr_we_),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.ex_exp_code	(ex_exp_code),	  // ÀýÍâ¥³©`¥É
		.ex_out			(ex_out)		  // IÀí½Y¹û
	);
endmodule