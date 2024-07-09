module cpu (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire					  clk,			   // ¥¯¥í¥Ã¥¯
	input  wire					  clk_,			   // ·´Ü¥¯¥í¥Ã¥¯
	input  wire					  reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	// IF Stage
	input  wire [`WordDataBus]	  if_bus_rd_data,  // Õi¤ß³ö¤·¥Ç©`¥¿
	input  wire					  if_bus_rdy_,	   // ¥ì¥Ç¥£
	input  wire					  if_bus_grnt_,	   // ¥Ð¥¹¥°¥é¥ó¥È
	output wire					  if_bus_req_,	   // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
	output wire [`WordAddrBus]	  if_bus_addr,	   // ¥¢¥É¥ì¥¹
	output wire					  if_bus_as_,	   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output wire					  if_bus_rw,	   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus]	  if_bus_wr_data,  // ø¤­Þz¤ß¥Ç©`¥¿
	// MEM Stage
	input  wire [`WordDataBus]	  mem_bus_rd_data, // Õi¤ß³ö¤·¥Ç©`¥¿
	input  wire					  mem_bus_rdy_,	   // ¥ì¥Ç¥£
	input  wire					  mem_bus_grnt_,   // ¥Ð¥¹¥°¥é¥ó¥È
	output wire					  mem_bus_req_,	   // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
	output wire [`WordAddrBus]	  mem_bus_addr,	   // ¥¢¥É¥ì¥¹
	output wire					  mem_bus_as_,	   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output wire					  mem_bus_rw,	   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus]	  mem_bus_wr_data, // ø¤­Þz¤ß¥Ç©`¥¿
	/********** ¸î¤êÞz¤ß **********/
	input  wire [`CPU_IRQ_CH-1:0] cpu_irq		   // ¸î¤êÞz¤ßÒªÇó
);
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	// IF/ID
	wire [`WordAddrBus]			 if_pc;			 // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	wire [`WordDataBus]			 if_insn;		 // ÃüÁî
	wire						 if_en;			 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	// ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿
	wire [`WordAddrBus]			 id_pc;			 // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	wire						 id_en;			 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	wire [`AluOpBus]			 id_alu_op;		 // ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`WordDataBus]			 id_alu_in_0;	 // ALUÈëÁ¦ 0
	wire [`WordDataBus]			 id_alu_in_1;	 // ALUÈëÁ¦ 1
	wire						 id_br_flag;	 // ·Öáª¥Õ¥é¥°
	wire [`MemOpBus]			 id_mem_op;		 // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`WordDataBus]			 id_mem_wr_data; // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	wire [`CtrlOpBus]			 id_ctrl_op;	 // ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`RegAddrBus]			 id_dst_addr;	 // GPRø¤­Þz¤ß¥¢¥É¥ì¥¹
	wire						 id_gpr_we_;	 // GPRø¤­Þz¤ßÓÐ¿
	wire [`IsaExpBus]			 id_exp_code;	 // ÀýÍâ¥³©`¥É
	// EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿
	wire [`WordAddrBus]			 ex_pc;			 // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	wire						 ex_en;			 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	wire						 ex_br_flag;	 // ·Öáª¥Õ¥é¥°
	wire [`MemOpBus]			 ex_mem_op;		 // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`WordDataBus]			 ex_mem_wr_data; // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	wire [`CtrlOpBus]			 ex_ctrl_op;	 // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`RegAddrBus]			 ex_dst_addr;	 // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	wire						 ex_gpr_we_;	 // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	wire [`IsaExpBus]			 ex_exp_code;	 // ÀýÍâ¥³©`¥É
	wire [`WordDataBus]			 ex_out;		 // IÀí½Y¹û
	// MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿
	wire [`WordAddrBus]			 mem_pc;		 // ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
	wire						 mem_en;		 // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	wire						 mem_br_flag;	 // ·Öáª¥Õ¥é¥°
	wire [`CtrlOpBus]			 mem_ctrl_op;	 // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	wire [`RegAddrBus]			 mem_dst_addr;	 // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	wire						 mem_gpr_we_;	 // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	wire [`IsaExpBus]			 mem_exp_code;	 // ÀýÍâ¥³©`¥É
	wire [`WordDataBus]			 mem_out;		 // IÀí½Y¹û
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	// ¥¹¥È©`¥ëÐÅºÅ
	wire						 if_stall;		 // IF¥¹¥Æ©`¥¸
	wire						 id_stall;		 // ID¥¹¥Æ©`
	wire						 ex_stall;		 // EX¥¹¥Æ©`¥¸
	wire						 mem_stall;		 // MEM¥¹¥Æ©`¥¸
	// ¥Õ¥é¥Ã¥·¥åÐÅºÅ
	wire						 if_flush;		 // IF¥¹¥Æ©`¥¸
	wire						 id_flush;		 // ID¥¹¥Æ©`¥¸
	wire						 ex_flush;		 // EX¥¹¥Æ©`¥¸
	wire						 mem_flush;		 // MEM¥¹¥Æ©`¥¸
	// ¥Ó¥¸©`ÐÅºÅ
	wire						 if_busy;		 // IF¥¹¥Æ©`¥¸
	wire						 mem_busy;		 // MEM¥¹¥Æ©`¥¸
	// ¤½¤ÎËû¤ÎÖÆÓùÐÅºÅ
	wire [`WordAddrBus]			 new_pc;		 // ÐÂ¤·¤¤PC
	wire [`WordAddrBus]			 br_addr;		 // ·Öáª¥¢¥É¥ì¥¹
	wire						 br_taken;		 // ·Öáª¤Î³ÉÁ¢
	wire						 ld_hazard;		 // ¥í©`¥É¥Ï¥¶©`¥É
	/********** øÓÃ¥ì¥¸¥¹¥¿ÐÅºÅ **********/
	wire [`WordDataBus]			 gpr_rd_data_0;	 // Õi¤ß³ö¤·¥Ç©`¥¿ 0
	wire [`WordDataBus]			 gpr_rd_data_1;	 // Õi¤ß³ö¤·¥Ç©`¥¿ 1
	wire [`RegAddrBus]			 gpr_rd_addr_0;	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 0
	wire [`RegAddrBus]			 gpr_rd_addr_1;	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 1
	/********** ÖÆÓù¥ì¥¸¥¹¥¿ÐÅºÅ **********/
	wire [`CpuExeModeBus]		 exe_mode;		 // gÐÐ¥â©`¥É
	wire [`WordDataBus]			 creg_rd_data;	 // Õi¤ß³ö¤·¥Ç©`¥¿
	wire [`RegAddrBus]			 creg_rd_addr;	 // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
	/********** Interrupt Request **********/
	wire						 int_detect;	  // ¸î¤êÞz¤ßÊ³ö
	/********** ¥¹¥¯¥é¥Ã¥Á¥Ñ¥Ã¥É¥á¥â¥êÐÅºÅ **********/
	// IF¥¹¥Æ©`¥¸
	wire [`WordDataBus]			 if_spm_rd_data;  // Õi¤ß³ö¤·¥Ç©`¥¿
	wire [`WordAddrBus]			 if_spm_addr;	  // ¥¢¥É¥ì¥¹
	wire						 if_spm_as_;	  // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	wire						 if_spm_rw;		  // Õi¤ß£¯ø¤­
	wire [`WordDataBus]			 if_spm_wr_data;  // ø¤­Þz¤ß¥Ç©`¥¿
	// MEM¥¹¥Æ©`¥¸
	wire [`WordDataBus]			 mem_spm_rd_data; // Õi¤ß³ö¤·¥Ç©`¥¿
	wire [`WordAddrBus]			 mem_spm_addr;	  // ¥¢¥É¥ì¥¹
	wire						 mem_spm_as_;	  // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	wire						 mem_spm_rw;	  // Õi¤ß£¯ø¤­
	wire [`WordDataBus]			 mem_spm_wr_data; // ø¤­Þz¤ß¥Ç©`¥¿
	/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°ÐÅºÅ **********/
	wire [`WordDataBus]			 ex_fwd_data;	  // EX¥¹¥Æ©`¥¸
	wire [`WordDataBus]			 mem_fwd_data;	  // MEM¥¹¥Æ©`¥¸
	/********** IF¥¹¥Æ©`¥¸ **********/
	if_stage if_stage (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),				// ¥¯¥í¥Ã¥¯
		.reset			(reset),			// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** SPM¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.spm_rd_data	(if_spm_rd_data),	// Õi¤ß³ö¤·¥Ç©`¥¿
		.spm_addr		(if_spm_addr),		// ¥¢¥É¥ì¥¹
		.spm_as_		(if_spm_as_),		// ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.spm_rw			(if_spm_rw),		// Õi¤ß£¯ø¤­
		.spm_wr_data	(if_spm_wr_data),	// ø¤­Þz¤ß¥Ç©`¥¿
		/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.bus_rd_data	(if_bus_rd_data),	// Õi¤ß³ö¤·¥Ç©`¥¿
		.bus_rdy_		(if_bus_rdy_),		// ¥ì¥Ç¥£
		.bus_grnt_		(if_bus_grnt_),		// ¥Ð¥¹¥°¥é¥ó¥È
		.bus_req_		(if_bus_req_),		// ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
		.bus_addr		(if_bus_addr),		// ¥¢¥É¥ì¥¹
		.bus_as_		(if_bus_as_),		// ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.bus_rw			(if_bus_rw),		// Õi¤ß£¯ø¤­
		.bus_wr_data	(if_bus_wr_data),	// ø¤­Þz¤ß¥Ç©`¥¿
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall			(if_stall),			// ¥¹¥È©`¥ë
		.flush			(if_flush),			// ¥Õ¥é¥Ã¥·¥å
		.new_pc			(new_pc),			// ÐÂ¤·¤¤PC
		.br_taken		(br_taken),			// ·Öáª¤Î³ÉÁ¢
		.br_addr		(br_addr),			// ·ÖáªÏÈ¥¢¥É¥ì¥¹
		.busy			(if_busy),			// ¥Ó¥¸©`ÐÅºÅ
		/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.if_pc			(if_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.if_insn		(if_insn),			// ÃüÁî
		.if_en			(if_en)				// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	);
	/********** ID¥¹¥Æ©`¥¸ **********/
	id_stage id_stage (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),				// ¥¯¥í¥Ã¥¯
		.reset			(reset),			// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** GPR¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.gpr_rd_data_0	(gpr_rd_data_0),	// Õi¤ß³ö¤·¥Ç©`¥¿ 0
		.gpr_rd_data_1	(gpr_rd_data_1),	// Õi¤ß³ö¤·¥Ç©`¥¿ 1
		.gpr_rd_addr_0	(gpr_rd_addr_0),	// Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 0
		.gpr_rd_addr_1	(gpr_rd_addr_1),	// Õi¤ß³ö¤·¥¢¥É¥ì¥¹ 1
		/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
		// EX¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
		.ex_en			(ex_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_fwd_data	(ex_fwd_data),		// ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		.ex_dst_addr	(ex_dst_addr),		// ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_		(ex_gpr_we_),		// ø¤­Þz¤ßÓÐ¿
		// MEM¥¹¥Æ©`¥¸¤«¤é¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥°
		.mem_fwd_data	(mem_fwd_data),		// ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		/********** ÖÆÓù¥ì¥¸¥¹¥¿¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.exe_mode		(exe_mode),			// gÐÐ¥â©`¥É
		.creg_rd_data	(creg_rd_data),		// Õi¤ß³ö¤·¥Ç©`¥¿
		.creg_rd_addr	(creg_rd_addr),		// Õi¤ß³ö¤·¥¢¥É¥ì¥¹
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	   .stall		   (id_stall),		   // ¥¹¥È©`¥ë
		.flush			(id_flush),			// ¥Õ¥é¥Ã¥·¥å
		.br_addr		(br_addr),			// ·Öáª¥¢¥É¥ì¥¹
		.br_taken		(br_taken),			// ·Öáª¤Î³ÉÁ¢
		.ld_hazard		(ld_hazard),		// ¥í©`¥É¥Ï¥¶©`¥É
		/********** IF/ID¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.if_pc			(if_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.if_insn		(if_insn),			// ÃüÁî
		.if_en			(if_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.id_pc			(id_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.id_en			(id_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.id_alu_op		(id_alu_op),		// ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_alu_in_0	(id_alu_in_0),		// ALUÈëÁ¦ 0
		.id_alu_in_1	(id_alu_in_1),		// ALUÈëÁ¦ 1
		.id_br_flag		(id_br_flag),		// ·Öáª¥Õ¥é¥°
		.id_mem_op		(id_mem_op),		// ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_mem_wr_data (id_mem_wr_data),	// ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.id_ctrl_op		(id_ctrl_op),		// ÖÆÓù¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_dst_addr	(id_dst_addr),		// GPRø¤­Þz¤ß¥¢¥É¥ì¥¹
		.id_gpr_we_		(id_gpr_we_),		// GPRø¤­Þz¤ßÓÐ¿
		.id_exp_code	(id_exp_code)		// ÀýÍâ¥³©`¥É
	);
	/********** EX¥¹¥Æ©`¥¸ **********/
	ex_stage ex_stage (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),				// ¥¯¥í¥Ã¥¯
		.reset			(reset),			// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall			(ex_stall),			// ¥¹¥È©`¥ë
		.flush			(ex_flush),			// ¥Õ¥é¥Ã¥·¥å
		.int_detect		(int_detect),		// ¸î¤êÞz¤ßÊ³ö
		/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
		.fwd_data		(ex_fwd_data),		// ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.id_pc			(id_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.id_en			(id_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.id_alu_op		(id_alu_op),		// ALU¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_alu_in_0	(id_alu_in_0),		// ALUÈëÁ¦ 0
		.id_alu_in_1	(id_alu_in_1),		// ALUÈëÁ¦ 1
		.id_br_flag		(id_br_flag),		// ·Öáª¥Õ¥é¥°
		.id_mem_op		(id_mem_op),		// ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_mem_wr_data (id_mem_wr_data),	// ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.id_ctrl_op		(id_ctrl_op),		// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.id_dst_addr	(id_dst_addr),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.id_gpr_we_		(id_gpr_we_),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.id_exp_code	(id_exp_code),		// ÀýÍâ¥³©`¥É
		/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.ex_pc			(ex_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.ex_en			(ex_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_br_flag		(ex_br_flag),		// ·Öáª¥Õ¥é¥°
		.ex_mem_op		(ex_mem_op),		// ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_mem_wr_data (ex_mem_wr_data),	// ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ex_ctrl_op		(ex_ctrl_op),		// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_dst_addr	(ex_dst_addr),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_		(ex_gpr_we_),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.ex_exp_code	(ex_exp_code),		// ÀýÍâ¥³©`¥É
		.ex_out			(ex_out)			// IÀí½Y¹û
	);
	/********** MEM¥¹¥Æ©`¥¸ **********/
	mem_stage mem_stage (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),				// ¥¯¥í¥Ã¥¯
		.reset			(reset),			// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall			(mem_stall),		// ¥¹¥È©`¥ë
		.flush			(mem_flush),		// ¥Õ¥é¥Ã¥·¥å
		.busy			(mem_busy),			// ¥Ó¥¸©`ÐÅºÅ
		/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
		.fwd_data		(mem_fwd_data),		// ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
		/********** SPM¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.spm_rd_data	(mem_spm_rd_data),	// Õi¤ß³ö¤·¥Ç©`¥¿
		.spm_addr		(mem_spm_addr),		// ¥¢¥É¥ì¥¹
		.spm_as_		(mem_spm_as_),		// ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.spm_rw			(mem_spm_rw),		// Õi¤ß£¯ø¤­
		.spm_wr_data	(mem_spm_wr_data),	// ø¤­Þz¤ß¥Ç©`¥¿
		/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.bus_rd_data	(mem_bus_rd_data),	// Õi¤ß³ö¤·¥Ç©`¥¿
		.bus_rdy_		(mem_bus_rdy_),		// ¥ì¥Ç¥£
		.bus_grnt_		(mem_bus_grnt_),	// ¥Ð¥¹¥°¥é¥ó¥È
		.bus_req_		(mem_bus_req_),		// ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
		.bus_addr		(mem_bus_addr),		// ¥¢¥É¥ì¥¹
		.bus_as_		(mem_bus_as_),		// ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.bus_rw			(mem_bus_rw),		// Õi¤ß£¯ø¤­
		.bus_wr_data	(mem_bus_wr_data),	// ø¤­Þz¤ß¥Ç©`¥¿
		/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.ex_pc			(ex_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.ex_en			(ex_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_br_flag		(ex_br_flag),		// ·Öáª¥Õ¥é¥°
		.ex_mem_op		(ex_mem_op),		// ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_mem_wr_data (ex_mem_wr_data),	// ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ex_ctrl_op		(ex_ctrl_op),		// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_dst_addr	(ex_dst_addr),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_		(ex_gpr_we_),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.ex_exp_code	(ex_exp_code),		// ÀýÍâ¥³©`¥É
		.ex_out			(ex_out),			// IÀí½Y¹û
		/********** MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.mem_pc			(mem_pc),			// ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
		.mem_en			(mem_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.mem_br_flag	(mem_br_flag),		// ·Öáª¥Õ¥é¥°
		.mem_ctrl_op	(mem_ctrl_op),		// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.mem_dst_addr	(mem_dst_addr),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.mem_gpr_we_	(mem_gpr_we_),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.mem_exp_code	(mem_exp_code),		// ÀýÍâ¥³©`¥É
		.mem_out		(mem_out)			// IÀí½Y¹û
	);
	/********** ÖÆÓù¥æ¥Ë¥Ã¥È **********/
	ctrl ctrl (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk			(clk),				// ¥¯¥í¥Ã¥¯
		.reset			(reset),			// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ÖÆÓù¥ì¥¸¥¹¥¿¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.creg_rd_addr	(creg_rd_addr),		// Õi¤ß³ö¤·¥¢¥É¥ì¥¹
		.creg_rd_data	(creg_rd_data),		// Õi¤ß³ö¤·¥Ç©`¥¿
		.exe_mode		(exe_mode),			// gÐÐ¥â©`¥É
		/********** ¸î¤êÞz¤ß **********/
		.irq			(cpu_irq),			// ¸î¤êÞz¤ßÒªÇó
		.int_detect		(int_detect),		// ¸î¤êÞz¤ßÊ³ö
		/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.id_pc			(id_pc),			// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		/********** MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.mem_pc			(mem_pc),			// ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
		.mem_en			(mem_en),			// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.mem_br_flag	(mem_br_flag),		// ·Öáª¥Õ¥é¥°
		.mem_ctrl_op	(mem_ctrl_op),		// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.mem_dst_addr	(mem_dst_addr),		// øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.mem_exp_code	(mem_exp_code),		// ÀýÍâ¥³©`¥É
		.mem_out		(mem_out),			// IÀí½Y¹û
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		// ¥Ñ¥¤¥×¥é¥¤¥ó¤Î×´B
		.if_busy		(if_busy),			// IF¥¹¥Æ©`¥¸¥Ó¥¸©`
		.ld_hazard		(ld_hazard),		// Load¥Ï¥¶©`¥É
		.mem_busy		(mem_busy),			// MEM¥¹¥Æ©`¥¸¥Ó¥¸©`
		// ¥¹¥È©`¥ëÐÅºÅ
		.if_stall		(if_stall),			// IF¥¹¥Æ©`¥¸¥¹¥È©`¥ë
		.id_stall		(id_stall),			// ID¥¹¥Æ©`¥¸¥¹¥È©`¥ë
		.ex_stall		(ex_stall),			// EX¥¹¥Æ©`¥¸¥¹¥È©`¥ë
		.mem_stall		(mem_stall),		// MEM¥¹¥Æ©`¥¸¥¹¥È©`¥ë
		// ¥Õ¥é¥Ã¥·¥åÐÅºÅ
		.if_flush		(if_flush),			// IF¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
		.id_flush		(id_flush),			// ID¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
		.ex_flush		(ex_flush),			// EX¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
		.mem_flush		(mem_flush),		// MEM¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
		// ÐÂ¤·¤¤¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
		.new_pc			(new_pc)			// ÐÂ¤·¤¤¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	);
	/********** øÓÃ¥ì¥¸¥¹¥¿ **********/
	gpr gpr (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk	   (clk),					// ¥¯¥í¥Ã¥¯
		.reset	   (reset),					// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** Õi¤ß³ö¤·¥Ý©`¥È 0 **********/
		.rd_addr_0 (gpr_rd_addr_0),			// Õi¤ß³ö¤·¥¢¥É¥ì¥¹
		.rd_data_0 (gpr_rd_data_0),			// Õi¤ß³ö¤·¥Ç©`¥¿
		/********** Õi¤ß³ö¤·¥Ý©`¥È 1 **********/
		.rd_addr_1 (gpr_rd_addr_1),			// Õi¤ß³ö¤·¥¢¥É¥ì¥¹
		.rd_data_1 (gpr_rd_data_1),			// Õi¤ß³ö¤·¥Ç©`¥¿
		/********** ø¤­Þz¤ß¥Ý©`¥È **********/
		.we_	   (mem_gpr_we_),			// ø¤­Þz¤ßÓÐ¿
		.wr_addr   (mem_dst_addr),			// ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.wr_data   (mem_out)				// ø¤­Þz¤ß¥Ç©`¥¿
	);
	/********** ¥¹¥¯¥é¥Ã¥Á¥Ñ¥Ã¥É¥á¥â¥ê **********/
	spm spm (
		/********** ¥¯¥í¥Ã¥¯ **********/
		.clk			 (clk_),					  // ¥¯¥í¥Ã¥¯
		/********** ¥Ý©`¥ÈA : IF¥¹¥Æ©`¥¸ **********/
		.if_spm_addr	 (if_spm_addr[`SpmAddrLoc]),  // ¥¢¥É¥ì¥¹
		.if_spm_as_		 (if_spm_as_),				  // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.if_spm_rw		 (if_spm_rw),				  // Õi¤ß£¯ø¤­
		.if_spm_wr_data	 (if_spm_wr_data),			  // ø¤­Þz¤ß¥Ç©`¥¿
		.if_spm_rd_data	 (if_spm_rd_data),			  // Õi¤ß³ö¤·¥Ç©`¥¿
		/********** ¥Ý©`¥ÈB : MEM¥¹¥Æ©`¥¸ **********/
		.mem_spm_addr	 (mem_spm_addr[`SpmAddrLoc]), // ¥¢¥É¥ì¥¹
		.mem_spm_as_	 (mem_spm_as_),				  // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.mem_spm_rw		 (mem_spm_rw),				  // Õi¤ß£¯ø¤­
		.mem_spm_wr_data (mem_spm_wr_data),			  // ø¤­Þz¤ß¥Ç©`¥¿
		.mem_spm_rd_data (mem_spm_rd_data)			  // Õi¤ß³ö¤·¥Ç©`¥¿
	);
endmodule