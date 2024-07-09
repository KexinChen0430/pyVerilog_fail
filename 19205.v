module ex_stage (
	/********** NbN & Zbg **********/
	input  wire				   clk,			   // NbN
	input  wire				   reset,		   // ñ¯úZbg
	/********** pCvC§äM **********/
	input  wire				   stall,		   // Xg[
	input  wire				   flush,		   // tbV
	input  wire				   int_detect,	   // èÝo
	/********** tH[fBO **********/
	output wire [`WordDataBus] fwd_data,	   // tH[fBOf[^
	/********** ID/EXpCvCWX^ **********/
	input  wire [`WordAddrBus] id_pc,		   // vOJE^
	input  wire				   id_en,		   // pCvCf[^ÌLø
	input  wire [`AluOpBus]	   id_alu_op,	   // ALUIy[V
	input  wire [`WordDataBus] id_alu_in_0,	   // ALUüÍ 0
	input  wire [`WordDataBus] id_alu_in_1,	   // ALUüÍ 1
	input  wire				   id_br_flag,	   // ªòtO
	input  wire [`MemOpBus]	   id_mem_op,	   // Iy[V
	input  wire [`WordDataBus] id_mem_wr_data, // «Ýf[^
	input  wire [`CtrlOpBus]   id_ctrl_op,	   // §äWX^Iy[V
	input  wire [`RegAddrBus]  id_dst_addr,	   // ÄpWX^«ÝAhX
	input  wire				   id_gpr_we_,	   // ÄpWX^«ÝLø
	input  wire [`IsaExpBus]   id_exp_code,	   // áOR[h
	/********** EX/MEMpCvCWX^ **********/
	output wire [`WordAddrBus] ex_pc,		   // vOJE^
	output wire				   ex_en,		   // pCvCf[^ÌLø
	output wire				   ex_br_flag,	   // ªòtO
	output wire [`MemOpBus]	   ex_mem_op,	   // Iy[V
	output wire [`WordDataBus] ex_mem_wr_data, // «Ýf[^
	output wire [`CtrlOpBus]   ex_ctrl_op,	   // §äWX^Iy[V
	output wire [`RegAddrBus]  ex_dst_addr,	   // ÄpWX^«ÝAhX
	output wire				   ex_gpr_we_,	   // ÄpWX^«ÝLø
	output wire [`IsaExpBus]   ex_exp_code,	   // áOR[h
	output wire [`WordDataBus] ex_out		   // Ê
);
	/********** ALUÌoÍ **********/
	wire [`WordDataBus]		   alu_out;		   // ZÊ
	wire					   alu_of;		   // I[ot[
	/********** ZÊÌtH[fBO **********/
	assign fwd_data = alu_out;
	/********** ALU **********/
	alu alu (
		.in_0			(id_alu_in_0),	  // üÍ 0
		.in_1			(id_alu_in_1),	  // üÍ 1
		.op				(id_alu_op),	  // Iy[V
		.out			(alu_out),		  // oÍ
		.of				(alu_of)		  // I[ot[
	);
	/********** pCvCWX^ **********/
	ex_reg ex_reg (
		/********** NbN & Zbg **********/
		.clk			(clk),			  // NbN
		.reset			(reset),		  // ñ¯úZbg
		/********** ALUÌoÍ **********/
		.alu_out		(alu_out),		  // ZÊ
		.alu_of			(alu_of),		  // I[ot[
		/********** pCvC§äM **********/
		.stall			(stall),		  // Xg[
		.flush			(flush),		  // tbV
		.int_detect		(int_detect),	  // èÝo
		/********** ID/EXpCvCWX^ **********/
		.id_pc			(id_pc),		  // vOJE^
		.id_en			(id_en),		  // pCvCf[^ÌLø
		.id_br_flag		(id_br_flag),	  // ªòtO
		.id_mem_op		(id_mem_op),	  // Iy[V
		.id_mem_wr_data (id_mem_wr_data), // «Ýf[^
		.id_ctrl_op		(id_ctrl_op),	  // §äWX^Iy[V
		.id_dst_addr	(id_dst_addr),	  // ÄpWX^«ÝAhX
		.id_gpr_we_		(id_gpr_we_),	  // ÄpWX^«ÝLø
		.id_exp_code	(id_exp_code),	  // áOR[h
		/********** EX/MEMpCvCWX^ **********/
		.ex_pc			(ex_pc),		  // vOJE^
		.ex_en			(ex_en),		  // pCvCf[^ÌLø
		.ex_br_flag		(ex_br_flag),	  // ªòtO
		.ex_mem_op		(ex_mem_op),	  // Iy[V
		.ex_mem_wr_data (ex_mem_wr_data), // «Ýf[^
		.ex_ctrl_op		(ex_ctrl_op),	  // §äWX^Iy[V
		.ex_dst_addr	(ex_dst_addr),	  // ÄpWX^«ÝAhX
		.ex_gpr_we_		(ex_gpr_we_),	  // ÄpWX^«ÝLø
		.ex_exp_code	(ex_exp_code),	  // áOR[h
		.ex_out			(ex_out)		  // Ê
	);
endmodule