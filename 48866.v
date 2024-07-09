module id_reg (
	/********** NbN & Zbg **********/
	input  wire				   clk,			   // NbN
	input  wire				   reset,		   // ñ¯úZbg
	/********** fR[hÊ **********/
	input  wire [`AluOpBus]	   alu_op,		   // ALUIy[V
	input  wire [`WordDataBus] alu_in_0,	   // ALUüÍ 0
	input  wire [`WordDataBus] alu_in_1,	   // ALUüÍ 1
	input  wire				   br_flag,		   // ªòtO
	input  wire [`MemOpBus]	   mem_op,		   // Iy[V
	input  wire [`WordDataBus] mem_wr_data,	   // «Ýf[^
	input  wire [`CtrlOpBus]   ctrl_op,		   // §äIy[V
	input  wire [`RegAddrBus]  dst_addr,	   // ÄpWX^«ÝAhX
	input  wire				   gpr_we_,		   // ÄpWX^«ÝLø
	input  wire [`IsaExpBus]   exp_code,	   // áOR[h
	/********** pCvC§äM **********/
	input  wire				   stall,		   // Xg[
	input  wire				   flush,		   // tbV
	/********** IF/IDpCvCWX^ **********/
	input  wire [`WordAddrBus] if_pc,		   // vOJE^
	input  wire				   if_en,		   // pCvCf[^ÌLø
	/********** ID/EXpCvCWX^ **********/
	output reg	[`WordAddrBus] id_pc,		   // vOJE^
	output reg				   id_en,		   // pCvCf[^ÌLø
	output reg	[`AluOpBus]	   id_alu_op,	   // ALUIy[V
	output reg	[`WordDataBus] id_alu_in_0,	   // ALUüÍ 0
	output reg	[`WordDataBus] id_alu_in_1,	   // ALUüÍ 1
	output reg				   id_br_flag,	   // ªòtO
	output reg	[`MemOpBus]	   id_mem_op,	   // Iy[V
	output reg	[`WordDataBus] id_mem_wr_data, // «Ýf[^
	output reg	[`CtrlOpBus]   id_ctrl_op,	   // §äIy[V
	output reg	[`RegAddrBus]  id_dst_addr,	   // ÄpWX^«ÝAhX
	output reg				   id_gpr_we_,	   // ÄpWX^«ÝLø
	output reg [`IsaExpBus]	   id_exp_code	   // áOR[h
);
	/********** pCvCWX^ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ñ¯úZbg */
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
			/* pCvCWX^ÌXV */
			if (stall == `DISABLE) begin
				if (flush == `ENABLE) begin // tbV
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
				end else begin				// Ìf[^
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