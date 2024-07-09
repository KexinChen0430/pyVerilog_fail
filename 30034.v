module id_stage (
	/********** NbN & Zbg **********/
	input  wire					 clk,			 // NbN
	input  wire					 reset,			 // ñ¯úZbg
	/********** GPRC^tF[X **********/
	input  wire [`WordDataBus]	 gpr_rd_data_0,	 // ÇÝoµf[^ 0
	input  wire [`WordDataBus]	 gpr_rd_data_1,	 // ÇÝoµf[^ 1
	output wire [`RegAddrBus]	 gpr_rd_addr_0,	 // ÇÝoµAhX 0
	output wire [`RegAddrBus]	 gpr_rd_addr_1,	 // ÇÝoµAhX 1
	/********** tH[fBO **********/
	// EXXe[W©çÌtH[fBO
	input  wire					 ex_en,			// pCvCf[^ÌLø
	input  wire [`WordDataBus]	 ex_fwd_data,	 // tH[fBOf[^
	input  wire [`RegAddrBus]	 ex_dst_addr,	 // «ÝAhX
	input  wire					 ex_gpr_we_,	 // «ÝLø
	// MEMXe[W©çÌtH[fBO
	input  wire [`WordDataBus]	 mem_fwd_data,	 // tH[fBOf[^
	/********** §äWX^C^tF[X **********/
	input  wire [`CpuExeModeBus] exe_mode,		 // Às[h
	input  wire [`WordDataBus]	 creg_rd_data,	 // ÇÝoµf[^
	output wire [`RegAddrBus]	 creg_rd_addr,	 // ÇÝoµAhX
	/********** pCvC§äM **********/
	input  wire					 stall,			 // Xg[
	input  wire					 flush,			 // tbV
	output wire [`WordAddrBus]	 br_addr,		 // ªòAhX
	output wire					 br_taken,		 // ªòÌ¬§
	output wire					 ld_hazard,		 // [hnU[h
	/********** IF/IDpCvCWX^ **********/
	input  wire [`WordAddrBus]	 if_pc,			 // vOJE^
	input  wire [`WordDataBus]	 if_insn,		 // ½ß
	input  wire					 if_en,			 // pCvCf[^ÌLø
	/********** ID/EXpCvCWX^ **********/
	output wire [`WordAddrBus]	 id_pc,			 // vOJE^
	output wire					 id_en,			 // pCvCf[^ÌLø
	output wire [`AluOpBus]		 id_alu_op,		 // ALUIy[V
	output wire [`WordDataBus]	 id_alu_in_0,	 // ALUüÍ 0
	output wire [`WordDataBus]	 id_alu_in_1,	 // ALUüÍ 1
	output wire					 id_br_flag,	 // ªòtO
	output wire [`MemOpBus]		 id_mem_op,		 // Iy[V
	output wire [`WordDataBus]	 id_mem_wr_data, // «Ýf[^
	output wire [`CtrlOpBus]	 id_ctrl_op,	 // §äIy[V
	output wire [`RegAddrBus]	 id_dst_addr,	 // GPR«ÝAhX
	output wire					 id_gpr_we_,	 // GPR«ÝLø
	output wire [`IsaExpBus]	 id_exp_code	 // áOR[h
);
	/********** fR[hM **********/
	wire  [`AluOpBus]			 alu_op;		 // ALUIy[V
	wire  [`WordDataBus]		 alu_in_0;		 // ALUüÍ 0
	wire  [`WordDataBus]		 alu_in_1;		 // ALUüÍ 1
	wire						 br_flag;		 // ªòtO
	wire  [`MemOpBus]			 mem_op;		 // Iy[V
	wire  [`WordDataBus]		 mem_wr_data;	 // «Ýf[^
	wire  [`CtrlOpBus]			 ctrl_op;		 // §äIy[V
	wire  [`RegAddrBus]			 dst_addr;		 // GPR«ÝAhX
	wire						 gpr_we_;		 // GPR«ÝLø
	wire  [`IsaExpBus]			 exp_code;		 // áOR[h
	/********** fR[_ **********/
	decoder decoder (
		/********** IF/IDpCvCWX^ **********/
		.if_pc			(if_pc),		  // vOJE^
		.if_insn		(if_insn),		  // ½ß
		.if_en			(if_en),		  // pCvCf[^ÌLø
		/********** GPRC^tF[X **********/
		.gpr_rd_data_0	(gpr_rd_data_0),  // ÇÝoµf[^ 0
		.gpr_rd_data_1	(gpr_rd_data_1),  // ÇÝoµf[^ 1
		.gpr_rd_addr_0	(gpr_rd_addr_0),  // ÇÝoµAhX 0
		.gpr_rd_addr_1	(gpr_rd_addr_1),  // ÇÝoµAhX 1
		/********** tH[fBO **********/
		// IDXe[W©çÌtH[fBO
		.id_en			(id_en),		  // pCvCf[^ÌLø
		.id_dst_addr	(id_dst_addr),	  // «ÝAhX
		.id_gpr_we_		(id_gpr_we_),	  // «ÝLø
		.id_mem_op		(id_mem_op),	  // Iy[V
		// EXXe[W©çÌtH[fBO
		.ex_en			(ex_en),		  // pCvCf[^ÌLø
		.ex_fwd_data	(ex_fwd_data),	  // tH[fBOf[^
		.ex_dst_addr	(ex_dst_addr),	  // «ÝAhX
		.ex_gpr_we_		(ex_gpr_we_),	  // «ÝLø
		// MEMXe[W©çÌtH[fBO
		.mem_fwd_data	(mem_fwd_data),	  // tH[fBOf[^
		/********** §äWX^C^tF[X **********/
		.exe_mode		(exe_mode),		  // Às[h
		.creg_rd_data	(creg_rd_data),	  // ÇÝoµf[^
		.creg_rd_addr	(creg_rd_addr),	  // ÇÝoµAhX
		/********** fR[hM **********/
		.alu_op			(alu_op),		  // ALUIy[V
		.alu_in_0		(alu_in_0),		  // ALUüÍ 0
		.alu_in_1		(alu_in_1),		  // ALUüÍ 1
		.br_addr		(br_addr),		  // ªòAhX
		.br_taken		(br_taken),		  // ªòÌ¬§
		.br_flag		(br_flag),		  // ªòtO
		.mem_op			(mem_op),		  // Iy[V
		.mem_wr_data	(mem_wr_data),	  // «Ýf[^
		.ctrl_op		(ctrl_op),		  // §äIy[V
		.dst_addr		(dst_addr),		  // ÄpWX^«ÝAhX
		.gpr_we_		(gpr_we_),		  // ÄpWX^«ÝLø
		.exp_code		(exp_code),		  // áOR[h
		.ld_hazard		(ld_hazard)		  // [hnU[h
	);
	/********** pCvCWX^ **********/
	id_reg id_reg (
		/********** NbN & Zbg **********/
		.clk			(clk),			  // NbN
		.reset			(reset),		  // ñ¯úZbg
		/********** fR[hÊ **********/
		.alu_op			(alu_op),		  // ALUIy[V
		.alu_in_0		(alu_in_0),		  // ALUüÍ 0
		.alu_in_1		(alu_in_1),		  // ALUüÍ 1
		.br_flag		(br_flag),		  // ªòtO
		.mem_op			(mem_op),		  // Iy[V
		.mem_wr_data	(mem_wr_data),	  // «Ýf[^
		.ctrl_op		(ctrl_op),		  // §äIy[V
		.dst_addr		(dst_addr),		  // ÄpWX^«ÝAhX
		.gpr_we_		(gpr_we_),		  // ÄpWX^«ÝLø
		.exp_code		(exp_code),		  // áOR[h
		/********** pCvC§äM **********/
		.stall			(stall),		  // Xg[
		.flush			(flush),		  // tbV
		/********** IF/IDpCvCWX^ **********/
		.if_pc			(if_pc),		  // vOJE^
		.if_en			(if_en),		  // pCvCf[^ÌLø
		/********** ID/EXpCvCWX^ **********/
		.id_pc			(id_pc),		  // vOJE^
		.id_en			(id_en),		  // pCvCf[^ÌLø
		.id_alu_op		(id_alu_op),	  // ALUIy[V
		.id_alu_in_0	(id_alu_in_0),	  // ALUüÍ 0
		.id_alu_in_1	(id_alu_in_1),	  // ALUüÍ 1
		.id_br_flag		(id_br_flag),	  // ªòtO
		.id_mem_op		(id_mem_op),	  // Iy[V
		.id_mem_wr_data (id_mem_wr_data), // «Ýf[^
		.id_ctrl_op		(id_ctrl_op),	  // §äIy[V
		.id_dst_addr	(id_dst_addr),	  // ÄpWX^«ÝAhX
		.id_gpr_we_		(id_gpr_we_),	  // ÄpWX^«ÝLø
		.id_exp_code	(id_exp_code)	  // áOR[h
	);
endmodule