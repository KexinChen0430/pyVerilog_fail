module decoder (
	/********** IF/IDpCvCWX^ **********/
	input  wire [`WordAddrBus]	 if_pc,			 // vOJE^
	input  wire [`WordDataBus]	 if_insn,		 // ½ß
	input  wire					 if_en,			 // pCvCf[^ÌLø
	/********** GPRC^tF[X **********/
	input  wire [`WordDataBus]	 gpr_rd_data_0, // ÇÝoµf[^ 0
	input  wire [`WordDataBus]	 gpr_rd_data_1, // ÇÝoµf[^ 1
	output wire [`RegAddrBus]	 gpr_rd_addr_0, // ÇÝoµAhX 0
	output wire [`RegAddrBus]	 gpr_rd_addr_1, // ÇÝoµAhX 1
	/********** tH[fBO **********/
	// IDXe[W©çÌtH[fBO
	input  wire					 id_en,			// pCvCf[^ÌLø
	input  wire [`RegAddrBus]	 id_dst_addr,	// «ÝAhX
	input  wire					 id_gpr_we_,	// «ÝLø
	input  wire [`MemOpBus]		 id_mem_op,		// Iy[V
	// EXXe[W©çÌtH[fBO
	input  wire					 ex_en,			// pCvCf[^ÌLø
	input  wire [`RegAddrBus]	 ex_dst_addr,	// «ÝAhX
	input  wire					 ex_gpr_we_,	// «ÝLø
	input  wire [`WordDataBus]	 ex_fwd_data,	// tH[fBOf[^
	// MEMXe[W©çÌtH[fBO
	input  wire [`WordDataBus]	 mem_fwd_data,	// tH[fBOf[^
	/********** §äWX^C^tF[X **********/
	input  wire [`CpuExeModeBus] exe_mode,		// Às[h
	input  wire [`WordDataBus]	 creg_rd_data,	// ÇÝoµf[^
	output wire [`RegAddrBus]	 creg_rd_addr,	// ÇÝoµAhX
	/********** fR[hÊ **********/
	output reg	[`AluOpBus]		 alu_op,		// ALUIy[V
	output reg	[`WordDataBus]	 alu_in_0,		// ALUüÍ 0
	output reg	[`WordDataBus]	 alu_in_1,		// ALUüÍ 1
	output reg	[`WordAddrBus]	 br_addr,		// ªòAhX
	output reg					 br_taken,		// ªòÌ¬§
	output reg					 br_flag,		// ªòtO
	output reg	[`MemOpBus]		 mem_op,		// Iy[V
	output wire [`WordDataBus]	 mem_wr_data,	// «Ýf[^
	output reg	[`CtrlOpBus]	 ctrl_op,		// §äIy[V
	output reg	[`RegAddrBus]	 dst_addr,		// ÄpWX^«ÝAhX
	output reg					 gpr_we_,		// ÄpWX^«ÝLø
	output reg	[`IsaExpBus]	 exp_code,		// áOR[h
	output reg					 ld_hazard		// [hnU[h
);
	/********** ½ßtB[h **********/
	wire [`IsaOpBus]	op		= if_insn[`IsaOpLoc];	  // IyR[h
	wire [`RegAddrBus]	ra_addr = if_insn[`IsaRaAddrLoc]; // RaAhX
	wire [`RegAddrBus]	rb_addr = if_insn[`IsaRbAddrLoc]; // RbAhX
	wire [`RegAddrBus]	rc_addr = if_insn[`IsaRcAddrLoc]; // RcAhX
	wire [`IsaImmBus]	imm		= if_insn[`IsaImmLoc];	  // ¦l
	/********** ¦l **********/
	// g£
	wire [`WordDataBus] imm_s = {{`ISA_EXT_W{imm[`ISA_IMM_MSB]}}, imm};
	// [g£
	wire [`WordDataBus] imm_u = {{`ISA_EXT_W{1'b0}}, imm};
	/********** WX^ÌÇÝoµAhX **********/
	assign gpr_rd_addr_0 = ra_addr; // ÄpWX^ÇÝoµAhX 0
	assign gpr_rd_addr_1 = rb_addr; // ÄpWX^ÇÝoµAhX 1
	assign creg_rd_addr	 = ra_addr; // §äWX^ÇÝoµAhX
	/********** ÄpWX^ÌÇÝoµf[^ **********/
	reg			[`WordDataBus]	ra_data;						  // ÈµRa
	wire signed [`WordDataBus]	s_ra_data = $signed(ra_data);	  // t«Ra
	reg			[`WordDataBus]	rb_data;						  // ÈµRb
	wire signed [`WordDataBus]	s_rb_data = $signed(rb_data);	  // t«Rb
	assign mem_wr_data = rb_data; // «Ýf[^
	/********** AhX **********/
	wire [`WordAddrBus] ret_addr  = if_pc + 1'b1;					 // ßèÔn
	wire [`WordAddrBus] br_target = if_pc + imm_s[`WORD_ADDR_MSB:0]; // ªòæ
	wire [`WordAddrBus] jr_target = ra_data[`WordAddrLoc];		   // Wvæ
	/********** tH[fBO **********/
	always @(*) begin
		/* RaWX^ */
		if ((id_en == `ENABLE) && (id_gpr_we_ == `ENABLE_) &&
			(id_dst_addr == ra_addr)) begin
			ra_data = ex_fwd_data;	 // EXXe[W©çÌtH[fBO
		end else if ((ex_en == `ENABLE) && (ex_gpr_we_ == `ENABLE_) &&
					 (ex_dst_addr == ra_addr)) begin
			ra_data = mem_fwd_data;	 // MEMXe[W©çÌtH[fBO
		end else begin
			ra_data = gpr_rd_data_0; // WX^t@C©çÌÇÝoµ
		end
		/* RbWX^ */
		if ((id_en == `ENABLE) && (id_gpr_we_ == `ENABLE_) &&
			(id_dst_addr == rb_addr)) begin
			rb_data = ex_fwd_data;	 // EXXe[W©çÌtH[fBO
		end else if ((ex_en == `ENABLE) && (ex_gpr_we_ == `ENABLE_) &&
					 (ex_dst_addr == rb_addr)) begin
			rb_data = mem_fwd_data;	 // MEMXe[W©çÌtH[fBO
		end else begin
			rb_data = gpr_rd_data_1; // WX^t@C©çÌÇÝoµ
		end
	end
	/********** [hnU[hÌo **********/
	always @(*) begin
		if ((id_en == `ENABLE) && (id_mem_op == `MEM_OP_LDW) &&
			((id_dst_addr == ra_addr) || (id_dst_addr == rb_addr))) begin
			ld_hazard = `ENABLE;  // [hnU[h
		end else begin
			ld_hazard = `DISABLE; // nU[hÈµ
		end
	end
	/********** ½ßÌfR[h **********/
	always @(*) begin
		/* ftHgl */
		alu_op	 = `ALU_OP_NOP;
		alu_in_0 = ra_data;
		alu_in_1 = rb_data;
		br_taken = `DISABLE;
		br_flag	 = `DISABLE;
		br_addr	 = {`WORD_ADDR_W{1'b0}};
		mem_op	 = `MEM_OP_NOP;
		ctrl_op	 = `CTRL_OP_NOP;
		dst_addr = rb_addr;
		gpr_we_	 = `DISABLE_;
		exp_code = `ISA_EXP_NO_EXP;
		/* IyR[hÌ»è */
		if (if_en == `ENABLE) begin
			case (op)
				/* _Z½ß */
				`ISA_OP_ANDR  : begin // WX^¯mÌ_Ï
					alu_op	 = `ALU_OP_AND;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ANDI  : begin // WX^Æ¦lÌ_Ï
					alu_op	 = `ALU_OP_AND;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ORR	  : begin // WX^¯mÌ_a
					alu_op	 = `ALU_OP_OR;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ORI	  : begin // WX^Æ¦lÌ_a
					alu_op	 = `ALU_OP_OR;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_XORR  : begin // WX^¯mÌr¼I_a
					alu_op	 = `ALU_OP_XOR;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_XORI  : begin // WX^Æ¦lÌr¼I_a
					alu_op	 = `ALU_OP_XOR;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				/* ZpZ½ß */
				`ISA_OP_ADDSR : begin // WX^¯mÌt«ÁZ
					alu_op	 = `ALU_OP_ADDS;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDSI : begin // WX^Æ¦lÌt«ÁZ
					alu_op	 = `ALU_OP_ADDS;
					alu_in_1 = imm_s;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDUR : begin // WX^¯mÌÈµÁZ
					alu_op	 = `ALU_OP_ADDU;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDUI : begin // WX^Æ¦lÌÈµÁZ
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SUBSR : begin // WX^¯mÌt«¸Z
					alu_op	 = `ALU_OP_SUBS;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SUBUR : begin // WX^¯mÌÈµ¸Z
					alu_op	 = `ALU_OP_SUBU;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				/* Vtg½ß */
				`ISA_OP_SHRLR : begin // WX^¯mÌ_EVtg
					alu_op	 = `ALU_OP_SHRL;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHRLI : begin // WX^Æ¦lÌ_EVtg
					alu_op	 = `ALU_OP_SHRL;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHLLR : begin // WX^¯mÌ_¶Vtg
					alu_op	 = `ALU_OP_SHLL;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHLLI : begin // WX^Æ¦lÌ_¶Vtg
					alu_op	 = `ALU_OP_SHLL;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				/* ªò½ß */
				`ISA_OP_BE	  : begin // WX^¯mÌt«äriRa == Rbj
					br_addr	 = br_target;
					br_taken = (ra_data == rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BNE	  : begin // WX^¯mÌt«äriRa != Rbj
					br_addr	 = br_target;
					br_taken = (ra_data != rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BSGT  : begin // WX^¯mÌt«äriRa < Rbj
					br_addr	 = br_target;
					br_taken = (s_ra_data < s_rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BUGT  : begin // WX^¯mÌÈµäriRa < Rbj
					br_addr	 = br_target;
					br_taken = (ra_data < rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_JMP	  : begin // ³ðªò
					br_addr	 = jr_target;
					br_taken = `ENABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_CALL  : begin // R[
					alu_in_0 = {ret_addr, {`BYTE_OFFSET_W{1'b0}}};
					br_addr	 = jr_target;
					br_taken = `ENABLE;
					br_flag	 = `ENABLE;
					dst_addr = `REG_ADDR_W'd31;
					gpr_we_	 = `ENABLE_;
				end
				/* ANZX½ß */
				`ISA_OP_LDW	  : begin // [hÇÝoµ
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					mem_op	 = `MEM_OP_LDW;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_STW	  : begin // [h«Ý
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					mem_op	 = `MEM_OP_STW;
				end
				/* VXeR[½ß */
				`ISA_OP_TRAP  : begin // gbv
					exp_code = `ISA_EXP_TRAP;
				end
				/* Á ½ß */
				`ISA_OP_RDCR  : begin // §äWX^ÌÇÝoµ
					if (exe_mode == `CPU_KERNEL_MODE) begin
						alu_in_0 = creg_rd_data;
						gpr_we_	 = `ENABLE_;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				`ISA_OP_WRCR  : begin // §äWX^ÖÌ«Ý
					if (exe_mode == `CPU_KERNEL_MODE) begin
						ctrl_op	 = `CTRL_OP_WRCR;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				`ISA_OP_EXRT  : begin // áO©çÌA
					if (exe_mode == `CPU_KERNEL_MODE) begin
						ctrl_op	 = `CTRL_OP_EXRT;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				/* »Ì¼Ì½ß */
				default		  : begin // ¢è`½ß
					exp_code = `ISA_EXP_UNDEF_INSN;
				end
			endcase
		end
	end
endmodule