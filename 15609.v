module mem_stage (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,			   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,		   // ¥¹¥È©`¥ë
	input  wire				   flush,		   // ¥Õ¥é¥Ã¥·¥å
	output wire				   busy,		   // ¥Ó¥¸©`ÐÅºÅ
	/********** ¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
	output wire [`WordDataBus] fwd_data,	   // ¥Õ¥©¥ï©`¥Ç¥£¥ó¥°¥Ç©`¥¿
	/********** SPM¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus] spm_rd_data,	   // Õi¤ß³ö¤·¥Ç©`¥¿
	output wire [`WordAddrBus] spm_addr,	   // ¥¢¥É¥ì¥¹
	output wire				   spm_as_,		   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output wire				   spm_rw,		   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus] spm_wr_data,	   // ø¤­Þz¤ß¥Ç©`¥¿
	/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus] bus_rd_data,	   // Õi¤ß³ö¤·¥Ç©`¥¿
	input  wire				   bus_rdy_,	   // ¥ì¥Ç¥£
	input  wire				   bus_grnt_,	   // ¥Ð¥¹¥°¥é¥ó¥È
	output wire				   bus_req_,	   // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
	output wire [`WordAddrBus] bus_addr,	   // ¥¢¥É¥ì¥¹
	output wire				   bus_as_,		   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output wire				   bus_rw,		   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus] bus_wr_data,	   // ø¤­Þz¤ß¥Ç©`¥¿
	/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus] ex_pc,		   // ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	input  wire				   ex_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire				   ex_br_flag,	   // ·Öáª¥Õ¥é¥°
	input  wire [`MemOpBus]	   ex_mem_op,	   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`WordDataBus] ex_mem_wr_data, // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
	input  wire [`CtrlOpBus]   ex_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`RegAddrBus]  ex_dst_addr,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire				   ex_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	input  wire [`IsaExpBus]   ex_exp_code,	   // ÀýÍâ¥³©`¥É
	input  wire [`WordDataBus] ex_out,		   // IÀí½Y¹û
	/********** MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	output wire [`WordAddrBus] mem_pc,		   // ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
	output wire				   mem_en,		   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	output wire				   mem_br_flag,	   // ·Öáª¥Õ¥é¥°
	output wire [`CtrlOpBus]   mem_ctrl_op,	   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	output wire [`RegAddrBus]  mem_dst_addr,   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
	output wire				   mem_gpr_we_,	   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
	output wire [`IsaExpBus]   mem_exp_code,   // ÀýÍâ¥³©`¥É
	output wire [`WordDataBus] mem_out		   // IÀí½Y¹û
);
	/********** ÄÚ²¿ÐÅºÅ **********/
	wire [`WordDataBus]		   rd_data;		   // Õi¤ß³ö¤·¥Ç©`¥¿
	wire [`WordAddrBus]		   addr;		   // ¥¢¥É¥ì¥¹
	wire					   as_;			   // ¥¢¥É¥ì¥¹ÓÐ¿
	wire					   rw;			   // Õi¤ß£¯ø¤­
	wire [`WordDataBus]		   wr_data;		   // ø¤­Þz¤ß¥Ç©`¥¿
	wire [`WordDataBus]		   out;			   // ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û
	wire					   miss_align;	   // ¥ß¥¹¥¢¥é¥¤¥ó
	/********** ½Y¹û¤Î¥Õ¥©¥ï©`¥Ç¥£¥ó¥° **********/
	assign fwd_data	 = out;
	/********** ¥á¥â¥ê¥¢¥¯¥»¥¹ÖÆÓù¥æ¥Ë¥Ã¥È **********/
	mem_ctrl mem_ctrl (
		/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.ex_en			(ex_en),			   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_mem_op		(ex_mem_op),		   // ¥á¥â¥ê¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_mem_wr_data (ex_mem_wr_data),	   // ¥á¥â¥êø¤­Þz¤ß¥Ç©`¥¿
		.ex_out			(ex_out),			   // IÀí½Y¹û
		/********** ¥á¥â¥ê¥¢¥¯¥»¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.rd_data		(rd_data),			   // Õi¤ß³ö¤·¥Ç©`¥¿
		.addr			(addr),				   // ¥¢¥É¥ì¥¹
		.as_			(as_),				   // ¥¢¥É¥ì¥¹ÓÐ¿
		.rw				(rw),				   // Õi¤ß£¯ø¤­
		.wr_data		(wr_data),			   // ø¤­Þz¤ß¥Ç©`¥¿
		/********** ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û **********/
		.out			(out),				   // ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û
		.miss_align		(miss_align)		   // ¥ß¥¹¥¢¥é¥¤¥ó
	);
	/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	bus_if bus_if (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk		 (clk),					   // ¥¯¥í¥Ã¥¯
		.reset		 (reset),				   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall		 (stall),				   // ¥¹¥È©`¥ë
		.flush		 (flush),				   // ¥Õ¥é¥Ã¥·¥åÐÅºÅ
		.busy		 (busy),				   // ¥Ó¥¸©`ÐÅºÅ
		/********** CPU¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.addr		 (addr),				   // ¥¢¥É¥ì¥¹
		.as_		 (as_),					   // ¥¢¥É¥ì¥¹ÓÐ¿
		.rw			 (rw),					   // Õi¤ß£¯ø¤­
		.wr_data	 (wr_data),				   // ø¤­Þz¤ß¥Ç©`¥¿
		.rd_data	 (rd_data),				   // Õi¤ß³ö¤·¥Ç©`¥¿
		/********** ¥¹¥¯¥é¥Ã¥Á¥Ñ¥Ã¥É¥á¥â¥ê¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.spm_rd_data (spm_rd_data),			   // Õi¤ß³ö¤·¥Ç©`¥¿
		.spm_addr	 (spm_addr),			   // ¥¢¥É¥ì¥¹
		.spm_as_	 (spm_as_),				   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.spm_rw		 (spm_rw),				   // Õi¤ß£¯ø¤­
		.spm_wr_data (spm_wr_data),			   // ø¤­Þz¤ß¥Ç©`¥¿
		/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
		.bus_rd_data (bus_rd_data),			   // Õi¤ß³ö¤·¥Ç©`¥¿
		.bus_rdy_	 (bus_rdy_),			   // ¥ì¥Ç¥£
		.bus_grnt_	 (bus_grnt_),			   // ¥Ð¥¹¥°¥é¥ó¥È
		.bus_req_	 (bus_req_),			   // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
		.bus_addr	 (bus_addr),			   // ¥¢¥É¥ì¥¹
		.bus_as_	 (bus_as_),				   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
		.bus_rw		 (bus_rw),				   // Õi¤ß£¯ø¤­
		.bus_wr_data (bus_wr_data)			   // ø¤­Þz¤ß¥Ç©`¥¿
	);
	/********** MEM¥¹¥Æ©`¥¸¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	mem_reg mem_reg (
		/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
		.clk		  (clk),				   // ¥¯¥í¥Ã¥¯
		.reset		  (reset),				   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
		/********** ¥á¥â¥ê¥¢¥¯¥»¥¹½Y¹û **********/
		.out		  (out),				   // ½Y¹û
		.miss_align	  (miss_align),			   // ¥ß¥¹¥¢¥é¥¤¥ó
		/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
		.stall		  (stall),				   // ¥¹¥È©`¥ë
		.flush		  (flush),				   // ¥Õ¥é¥Ã¥·¥å
		/********** EX/MEM¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.ex_pc		  (ex_pc),				   // ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
		.ex_en		  (ex_en),				   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.ex_br_flag	  (ex_br_flag),			   // ·Öáª¥Õ¥é¥°
		.ex_ctrl_op	  (ex_ctrl_op),			   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.ex_dst_addr  (ex_dst_addr),		   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.ex_gpr_we_	  (ex_gpr_we_),			   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.ex_exp_code  (ex_exp_code),		   // ÀýÍâ¥³©`¥É
		/********** MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
		.mem_pc		  (mem_pc),				   // ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
		.mem_en		  (mem_en),				   // ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
		.mem_br_flag  (mem_br_flag),		   // ·Öáª¥Õ¥é¥°
		.mem_ctrl_op  (mem_ctrl_op),		   // ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
		.mem_dst_addr (mem_dst_addr),		   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ß¥¢¥É¥ì¥¹
		.mem_gpr_we_  (mem_gpr_we_),		   // øÓÃ¥ì¥¸¥¹¥¿ø¤­Þz¤ßÓÐ¿
		.mem_exp_code (mem_exp_code),		   // ÀýÍâ¥³©`¥É
		.mem_out	  (mem_out)				   // IÀí½Y¹û
	);
endmodule