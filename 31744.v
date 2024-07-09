module id_stage (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire					 clk,			 // ¥¯¥í¥Ã¥¯
	input  wire					 reset,			 // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** GPR¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus]	 gpr_rd_data_0,	 // Õi¤ß³ö¤·¥Ç©`¥¿ 0
	input  wire [`WordDataBus]	 gpr_rd_data_1,	 // Õi¤ß³ö¤·¥Ç©`¥¿ 1
	output wire [`RegAddrBus]	 gpr_rd_addr_0,	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 0
	output wire [`RegAddrBus]	 gpr_rd_addr_1,	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 1
	/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
	// EX¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
	input  wire					 ex_en,			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire [`WordDataBus]	 ex_fwd_data,	 // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
	input  wire [`RegAddrBus]	 ex_dst_addr,	 // ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire					 ex_gpr_we_,	 // ø¤­Þz¤ßÓÐ¿
	// MEM¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
	input  wire [`WordDataBus]	 mem_fwd_data,	 // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
	/********** ÖÆÓù¥ì¥¸¥¹¥¿¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`CpuExeModeBus] exe_mode,		 // gÐÐ¥â©`¥É
	input  wire [`WordDataBus]	 creg_rd_data,	 // Õi¤ß³ö¤·¥Ç©`¥¿
	output wire [`RegAddrBus]	 creg_rd_addr,	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire					 stall,			 // ¥¹¥È©`¥ë
	input  wire					 flush,			 // ¥Õ¥é¥Ã¥·¥å
	output wire [`WordAddrBus]	 br_addr,		 // ·Öáª¥¢¥É¥ì¥¹
	output wire					 br_taken,		 // ·Öáª¤Î³ÉÁ¢
	output wire					 ld_hazard,		 // ¥í©`¥É¥Ï¥¶©`¥É
	/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus]	 if_pc,			 // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire [`WordDataBus]	 if_insn,		 // ÃüÁî
	input  wire					 if_en,			 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output wire [`WordAddrBus]	 id_pc,			 // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	output wire					 id_en,			 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	output wire [`AluOpBus]		 id_alu_op,		 // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`WordDataBus]	 id_alu_in_0,	 // ALUÈëÁ¦ 0
	output wire [`WordDataBus]	 id_alu_in_1,	 // ALUÈëÁ¦ 1
	output wire					 id_br_flag,	 // ·Öáª¥Õ¥é¥°
	output wire [`MemOpBus]		 id_mem_op,		 // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`WordDataBus]	 id_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	output wire [`CtrlOpBus]	 id_ctrl_op,	 // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`RegAddrBus]	 id_dst_addr,	 // GPRø¤­Þz¤ß¥¢¥É¥ì¥¹
	output wire					 id_gpr_we_,	 // GPRø¤­Þz¤ßÓÐ¿
	output wire [`IsaExpBus]	 id_exp_code	 // ÀýÍâ¥³©`¥É
);
	/********** ¥Ç¥³©`¥ÉÐÅºÅ **********/
	wire  [`AluOpBus]			 alu_op;		 // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire  [`WordDataBus]		 alu_in_0;		 // ALUÈëÁ¦ 0
	wire  [`WordDataBus]		 alu_in_1;		 // ALUÈëÁ¦ 1
	wire						 br_flag;		 // ·Öáª¥Õ¥é¥°
	wire  [`MemOpBus]			 mem_op;		 // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire  [`WordDataBus]		 mem_wr_data;	 // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	wire  [`CtrlOpBus]			 ctrl_op;		 // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire  [`RegAddrBus]			 dst_addr;		 // GPRø¤­Þz¤ß¥¢¥É¥ì¥¹
	wire						 gpr_we_;		 // GPRø¤­Þz¤ßÓÐ¿
	wire  [`IsaExpBus]			 exp_code;		 // ÀýÍâ¥³©`¥É
	/********** ¥Ç¥³©`¥À **********/
	decoder decoder (
		/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.if_pc			(if_pc),		  // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.if_insn		(if_insn),		  // ÃüÁî
		.if_en			(if_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		/********** GPR¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.gpr_rd_data_0	(gpr_rd_data_0),  // Õi¤ß³ö¤·¥Ç©`¥¿ 0
		.gpr_rd_data_1	(gpr_rd_data_1),  // Õi¤ß³ö¤·¥Ç©`¥¿ 1
		.gpr_rd_addr_0	(gpr_rd_addr_0),  // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 0
		.gpr_rd_addr_1	(gpr_rd_addr_1),  // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 1
		/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
		// ID¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
		.id_en			(id_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.id_dst_addr	(id_dst_addr),	  // ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.id_gpr_we_		(id_gpr_we_),	  // ø¤­Þz¤ßÓÐ¿
		.id_mem_op		(id_mem_op),	  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		// EX¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
		.ex_en			(ex_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_fwd_data	(ex_fwd_data),	  // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		.ex_dst_addr	(ex_dst_addr),	  // ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_		(ex_gpr_we_),	  // ø¤­Þz¤ßÓÐ¿
		// MEM¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
		.mem_fwd_data	(mem_fwd_data),	  // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		/********** ÖÆÓù¥ì¥¸¥¹¥¿¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.exe_mode		(exe_mode),		  // gÐÐ¥â©`¥É
		.creg_rd_data	(creg_rd_data),	  // Õi¤ß³ö¤·¥Ç©`¥¿
		.creg_rd_addr	(creg_rd_addr),	  // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
		/********** ¥Ç¥³©`¥ÉÐÅºÅ **********/
		.alu_op			(alu_op),		  // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
		.alu_in_0		(alu_in_0),		  // ALUÈëÁ¦ 0
		.alu_in_1		(alu_in_1),		  // ALUÈëÁ¦ 1
		.br_addr		(br_addr),		  // ·Öáª¥¢¥É¥ì¥¹
		.br_taken		(br_taken),		  // ·Öáª¤Î³ÉÁ¢
		.br_flag		(br_flag),		  // ·Öáª¥Õ¥é¥°
		.mem_op			(mem_op),		  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.mem_wr_data	(mem_wr_data),	  // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ctrl_op		(ctrl_op),		  // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
		.dst_addr		(dst_addr),		  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.gpr_we_		(gpr_we_),		  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.exp_code		(exp_code),		  // ÀýÍâ¥³©`¥É
		.ld_hazard		(ld_hazard)		  // ¥í©`¥É¥Ï¥¶©`¥É
	);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	id_reg id_reg (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),			  // ¥¯¥í¥Ã¥¯
		.reset			(reset),		  // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ¥Ç¥³©`¥É½Y¹û **********/
		.alu_op			(alu_op),		  // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
		.alu_in_0		(alu_in_0),		  // ALUÈëÁ¦ 0
		.alu_in_1		(alu_in_1),		  // ALUÈëÁ¦ 1
		.br_flag		(br_flag),		  // ·Öáª¥Õ¥é¥°
		.mem_op			(mem_op),		  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.mem_wr_data	(mem_wr_data),	  // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ctrl_op		(ctrl_op),		  // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
		.dst_addr		(dst_addr),		  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.gpr_we_		(gpr_we_),		  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.exp_code		(exp_code),		  // ÀýÍâ¥³©`¥É
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall			(stall),		  // ¥¹¥È©`¥ë
		.flush			(flush),		  // ¥Õ¥é¥Ã¥·¥å
		/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.if_pc			(if_pc),		  // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.if_en			(if_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.id_pc			(id_pc),		  // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.id_en			(id_en),		  // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.id_alu_op		(id_alu_op),	  // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_alu_in_0	(id_alu_in_0),	  // ALUÈëÁ¦ 0
		.id_alu_in_1	(id_alu_in_1),	  // ALUÈëÁ¦ 1
		.id_br_flag		(id_br_flag),	  // ·Öáª¥Õ¥é¥°
		.id_mem_op		(id_mem_op),	  // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_mem_wr_data (id_mem_wr_data), // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.id_ctrl_op		(id_ctrl_op),	  // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_dst_addr	(id_dst_addr),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.id_gpr_we_		(id_gpr_we_),	  // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.id_exp_code	(id_exp_code)	  // ÀýÍâ¥³©`¥É
	);
endmodule