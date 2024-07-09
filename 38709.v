module ctrl (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire					  clk,			// ¥¯¥í¥Ã¥¯
	input  wire					  reset,		// ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ÖÆÓù¥ì¥¸¥¹¥¿¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`RegAddrBus]	  creg_rd_addr, // Õi¤ß³ö¤·¥¢¥É¥ì¥¹
	output reg	[`WordDataBus]	  creg_rd_data, // Õi¤ß³ö¤·¥Ç©`¥¿
	output reg	[`CpuExeModeBus]  exe_mode,		// gÐÐ¥â©`¥É
	/********** ¸î¤êÞz¤ß **********/
	input  wire [`CPU_IRQ_CH-1:0] irq,			// ¸î¤êÞz¤ßÒªÇó
	output reg					  int_detect,	// ¸î¤êÞz¤ßÊ³ö
	/********** ID/EX¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus]	  id_pc,		// ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	/********** MEM/WB¥Ñ¥¤¥×¥é¥¤¥ó¥ì¥¸¥¹¥¿ **********/
	input  wire [`WordAddrBus]	  mem_pc,		// ¥×¥í¥°¥é¥ó¥«¥¦¥ó¥¿
	input  wire					  mem_en,		// ¥Ñ¥¤¥×¥é¥¤¥ó¥Ç©`¥¿¤ÎÓÐ¿
	input  wire					  mem_br_flag,	// ·Öáª¥Õ¥é¥°
	input  wire [`CtrlOpBus]	  mem_ctrl_op,	// ÖÆÓù¥ì¥¸¥¹¥¿¥ª¥Ú¥ì©`¥·¥ç¥ó
	input  wire [`RegAddrBus]	  mem_dst_addr, // ø¤­Þz¤ß¥¢¥É¥ì¥¹
	input  wire [`IsaExpBus]	  mem_exp_code, // ÀýÍâ¥³©`¥É
	input  wire [`WordDataBus]	  mem_out,		// IÀí½Y¹û
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	// ¥Ñ¥¤¥×¥é¥¤¥ó¤Î×´B
	input  wire					  if_busy,		// IF¥¹¥Æ©`¥¸¥Ó¥¸©`
	input  wire					  ld_hazard,	// ¥í©`¥É¥Ï¥¶©`¥É
	input  wire					  mem_busy,		// MEM¥¹¥Æ©`¥¸¥Ó¥¸©`
	// ¥¹¥È©`¥ëÐÅºÅ
	output wire					  if_stall,		// IF¥¹¥Æ©`¥¸¥¹¥È©`¥ë
	output wire					  id_stall,		// ID¥¹¥Æ©`¥¸¥¹¥È©`¥ë
	output wire					  ex_stall,		// EX¥¹¥Æ©`¥¸¥¹¥È©`¥ë
	output wire					  mem_stall,	// MEM¥¹¥Æ©`¥¸¥¹¥È©`¥ë
	// ¥Õ¥é¥Ã¥·¥åÐÅºÅ
	output wire					  if_flush,		// IF¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
	output wire					  id_flush,		// ID¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
	output wire					  ex_flush,		// EX¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
	output wire					  mem_flush,	// MEM¥¹¥Æ©`¥¸¥Õ¥é¥Ã¥·¥å
	output reg	[`WordAddrBus]	  new_pc		// ÐÂ¤·¤¤¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
);
	/********** ÖÆÓù¥ì¥¸¥¹¥¿ **********/
	reg							 int_en;		// 0·¬ : ¸î¤êÞz¤ßÓÐ¿
	reg	 [`CpuExeModeBus]		 pre_exe_mode;	// 1·¬ : gÐÐ¥â©`¥É
	reg							 pre_int_en;	// 1·¬ : ¸î¤êÞz¤ßÓÐ¿
	reg	 [`WordAddrBus]			 epc;			// 3·¬ : ÀýÍâ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	reg	 [`WordAddrBus]			 exp_vector;	// 4·¬ : ÀýÍâ¥Ù¥¯¥¿
	reg	 [`IsaExpBus]			 exp_code;		// 5·¬ : ÀýÍâ¥³©`¥É
	reg							 dly_flag;		// 6·¬ : ¥Ç¥£¥ì¥¤¥¹¥í¥Ã¥È¥Õ¥é¥°
	reg	 [`CPU_IRQ_CH-1:0]		 mask;			// 7·¬ : ¸î¤êÞz¤ß¥Þ¥¹¥¯
	/********** ÄÚ²¿ÐÅºÅ **********/
	reg [`WordAddrBus]		  pre_pc;			// Ç°¤Î¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
	reg						  br_flag;			// ·Öáª¥Õ¥é¥°
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	// ¥¹¥È©`¥ëÐÅºÅ
	wire   stall	 = if_busy | mem_busy;
	assign if_stall	 = stall | ld_hazard;
	assign id_stall	 = stall;
	assign ex_stall	 = stall;
	assign mem_stall = stall;
	// ¥Õ¥é¥Ã¥·¥åÐÅºÅ
	reg	   flush;
	assign if_flush	 = flush;
	assign id_flush	 = flush | ld_hazard;
	assign ex_flush	 = flush;
	assign mem_flush = flush;
	/********** ¥Ñ¥¤¥×¥é¥¤¥ó¥Õ¥é¥Ã¥·¥åÖÆÓù **********/
	always @(*) begin
		/* ¥Ç¥Õ¥©¥ë¥È */
		new_pc = `WORD_ADDR_W'h0;
		flush  = `DISABLE;
		/* ¥Ñ¥¤¥×¥é¥¤¥ó¥Õ¥é¥Ã¥·¥å */
		if (mem_en == `ENABLE) begin // ¥Ñ¥¤¥×¥é¥¤¥ó¤Î¥Ç©`¥¿¤¬ÓÐ¿
			if (mem_exp_code != `ISA_EXP_NO_EXP) begin		 // ÀýÍâ°kÉú
				new_pc = exp_vector;
				flush  = `ENABLE;
			end else if (mem_ctrl_op == `CTRL_OP_EXRT) begin // EXRTÃüÁî
				new_pc = epc;
				flush  = `ENABLE;
			end else if (mem_ctrl_op == `CTRL_OP_WRCR) begin // WRCRÃüÁî
				new_pc = mem_pc;
				flush  = `ENABLE;
			end
		end
	end
	/********** ¸î¤êÞz¤ß¤ÎÊ³ö **********/
	always @(*) begin
		if ((int_en == `ENABLE) && ((|((~mask) & irq)) == `ENABLE)) begin
			int_detect = `ENABLE;
		end else begin
			int_detect = `DISABLE;
		end
	end
	/********** Õi¤ß³ö¤·¥¢¥¯¥»¥¹ **********/
	always @(*) begin
		case (creg_rd_addr)
		   `CREG_ADDR_STATUS	 : begin // 0·¬:¥¹¥Æ©`¥¿¥¹
			   creg_rd_data = {{`WORD_DATA_W-2{1'b0}}, int_en, exe_mode};
		   end
		   `CREG_ADDR_PRE_STATUS : begin // 1·¬:ÀýÍâ°kÉúÇ°¤Î¥¹¥Æ©`¥¿¥¹
			   creg_rd_data = {{`WORD_DATA_W-2{1'b0}},
							   pre_int_en, pre_exe_mode};
		   end
		   `CREG_ADDR_PC		 : begin // 2·¬:¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
			   creg_rd_data = {id_pc, `BYTE_OFFSET_W'h0};
		   end
		   `CREG_ADDR_EPC		 : begin // 3·¬:ÀýÍâ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
			   creg_rd_data = {epc, `BYTE_OFFSET_W'h0};
		   end
		   `CREG_ADDR_EXP_VECTOR : begin // 4·¬:ÀýÍâ¥Ù¥¯¥¿
			   creg_rd_data = {exp_vector, `BYTE_OFFSET_W'h0};
		   end
		   `CREG_ADDR_CAUSE		 : begin // 5·¬:ÀýÍâÔ­Òò
			   creg_rd_data = {{`WORD_DATA_W-1-`ISA_EXP_W{1'b0}},
							   dly_flag, exp_code};
		   end
		   `CREG_ADDR_INT_MASK	 : begin // 6·¬:¸î¤êÞz¤ß¥Þ¥¹¥¯
			   creg_rd_data = {{`WORD_DATA_W-`CPU_IRQ_CH{1'b0}}, mask};
		   end
		   `CREG_ADDR_IRQ		 : begin // 6·¬:¸î¤êÞz¤ßÔ­Òò
			   creg_rd_data = {{`WORD_DATA_W-`CPU_IRQ_CH{1'b0}}, irq};
		   end
		   `CREG_ADDR_ROM_SIZE	 : begin // 7·¬:ROM¤Î¥µ¥¤¥º
			   creg_rd_data = $unsigned(`ROM_SIZE);
		   end
		   `CREG_ADDR_SPM_SIZE	 : begin // 8·¬:SPM¤Î¥µ¥¤¥º
			   creg_rd_data = $unsigned(`SPM_SIZE);
		   end
		   `CREG_ADDR_CPU_INFO	 : begin // 9·¬:CPU¤ÎÇéó
			   creg_rd_data = {`RELEASE_YEAR, `RELEASE_MONTH,
							   `RELEASE_VERSION, `RELEASE_REVISION};
		   end
		   default				 : begin // ¥Ç¥Õ¥©¥ë¥È
			   creg_rd_data = `WORD_DATA_W'h0;
		   end
		endcase
	end
	/********** CPU¤ÎÖÆÓù **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			exe_mode	 <= #1 `CPU_KERNEL_MODE;
			int_en		 <= #1 `DISABLE;
			pre_exe_mode <= #1 `CPU_KERNEL_MODE;
			pre_int_en	 <= #1 `DISABLE;
			exp_code	 <= #1 `ISA_EXP_NO_EXP;
			mask		 <= #1 {`CPU_IRQ_CH{`ENABLE}};
			dly_flag	 <= #1 `DISABLE;
			epc			 <= #1 `WORD_ADDR_W'h0;
			exp_vector	 <= #1 `WORD_ADDR_W'h0;
			pre_pc		 <= #1 `WORD_ADDR_W'h0;
			br_flag		 <= #1 `DISABLE;
		end else begin
			/* CPU¤Î×´B¤ò¸üÐÂ */
			if ((mem_en == `ENABLE) && (stall == `DISABLE)) begin
				/* PC¤È·Öáª¥Õ¥é¥°¤Î±£´æ */
				pre_pc		 <= #1 mem_pc;
				br_flag		 <= #1 mem_br_flag;
				/* CPU¤Î¥¹¥Æ©`¥¿¥¹ÖÆÓù */
				if (mem_exp_code != `ISA_EXP_NO_EXP) begin		 // ÀýÍâ°kÉú
					exe_mode	 <= #1 `CPU_KERNEL_MODE;
					int_en		 <= #1 `DISABLE;
					pre_exe_mode <= #1 exe_mode;
					pre_int_en	 <= #1 int_en;
					exp_code	 <= #1 mem_exp_code;
					dly_flag	 <= #1 br_flag;
					epc			 <= #1 pre_pc;
				end else if (mem_ctrl_op == `CTRL_OP_EXRT) begin // EXRTÃüÁî
					exe_mode	 <= #1 pre_exe_mode;
					int_en		 <= #1 pre_int_en;
				end else if (mem_ctrl_op == `CTRL_OP_WRCR) begin // WRCRÃüÁî
				   /* ÖÆÓù¥ì¥¸¥¹¥¿¤Ø¤Îø¤­Þz¤ß */
					case (mem_dst_addr)
						`CREG_ADDR_STATUS	  : begin // ¥¹¥Æ©`¥¿¥¹
							exe_mode	 <= #1 mem_out[`CregExeModeLoc];
							int_en		 <= #1 mem_out[`CregIntEnableLoc];
						end
						`CREG_ADDR_PRE_STATUS : begin // ÀýÍâ°kÉúÇ°¤Î¥¹¥Æ©`¥¿¥¹
							pre_exe_mode <= #1 mem_out[`CregExeModeLoc];
							pre_int_en	 <= #1 mem_out[`CregIntEnableLoc];
						end
						`CREG_ADDR_EPC		  : begin // ÀýÍâ¥×¥í¥°¥é¥à¥«¥¦¥ó¥¿
							epc			 <= #1 mem_out[`WordAddrLoc];
						end
						`CREG_ADDR_EXP_VECTOR : begin // ÀýÍâ¥Ù¥¯¥¿
							exp_vector	 <= #1 mem_out[`WordAddrLoc];
						end
						`CREG_ADDR_CAUSE	  : begin // ÀýÍâÔ­Òò
							dly_flag	 <= #1 mem_out[`CregDlyFlagLoc];
							exp_code	 <= #1 mem_out[`CregExpCodeLoc];
						end
						`CREG_ADDR_INT_MASK	  : begin // ¸î¤êÞz¤ß¥Þ¥¹¥¯
							mask		 <= #1 mem_out[`CPU_IRQ_CH-1:0];
						end
					endcase
				end
			end
		end
	end
endmodule