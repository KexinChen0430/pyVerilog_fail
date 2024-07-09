module ex_reg (
	/********** NbN & Zbg **********/
	input  wire				   clk,			   // NbN
	input  wire				   reset,		   // ñ¯úZbg
	/********** ALUÌoÍ **********/
	input  wire [`WordDataBus] alu_out,		   // ZÊ
	input  wire				   alu_of,		   // I[ot[
	/********** pCvC§äM **********/
	input  wire				   stall,		   // Xg[
	input  wire				   flush,		   // tbV
	input  wire				   int_detect,	   // èÝo
	/********** ID/EXpCvCWX^ **********/
	input  wire [`WordAddrBus] id_pc,		   // vOJE^
	input  wire				   id_en,		   // pCvCf[^ÌLø
	input  wire				   id_br_flag,	   // ªòtO
	input  wire [`MemOpBus]	   id_mem_op,	   // Iy[V
	input  wire [`WordDataBus] id_mem_wr_data, // «Ýf[^
	input  wire [`CtrlOpBus]   id_ctrl_op,	   // §äWX^Iy[V
	input  wire [`RegAddrBus]  id_dst_addr,	   // ÄpWX^«ÝAhX
	input  wire				   id_gpr_we_,	   // ÄpWX^«ÝLø
	input  wire [`IsaExpBus]   id_exp_code,	   // áOR[h
	/********** EX/MEMpCvCWX^ **********/
	output reg	[`WordAddrBus] ex_pc,		   // vOJE^
	output reg				   ex_en,		   // pCvCf[^ÌLø
	output reg				   ex_br_flag,	   // ªòtO
	output reg	[`MemOpBus]	   ex_mem_op,	   // Iy[V
	output reg	[`WordDataBus] ex_mem_wr_data, // «Ýf[^
	output reg	[`CtrlOpBus]   ex_ctrl_op,	   // §äWX^Iy[V
	output reg	[`RegAddrBus]  ex_dst_addr,	   // ÄpWX^«ÝAhX
	output reg				   ex_gpr_we_,	   // ÄpWX^«ÝLø
	output reg	[`IsaExpBus]   ex_exp_code,	   // áOR[h
	output reg	[`WordDataBus] ex_out		   // Ê
);
	/********** pCvCWX^ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		/* ñ¯úZbg */
		if (reset == `RESET_ENABLE) begin
			ex_pc		   <= #1 `WORD_ADDR_W'h0;
			ex_en		   <= #1 `DISABLE;
			ex_br_flag	   <= #1 `DISABLE;
			ex_mem_op	   <= #1 `MEM_OP_NOP;
			ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
			ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
			ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
			ex_gpr_we_	   <= #1 `DISABLE_;
			ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
			ex_out		   <= #1 `WORD_DATA_W'h0;
		end else begin
			/* pCvCWX^ÌXV */
			if (stall == `DISABLE) begin
				if (flush == `ENABLE) begin				  // tbV
					ex_pc		   <= #1 `WORD_ADDR_W'h0;
					ex_en		   <= #1 `DISABLE;
					ex_br_flag	   <= #1 `DISABLE;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (int_detect == `ENABLE) begin // èÝÌo
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_EXT_INT;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (alu_of == `ENABLE) begin	  // ZpI[ot[
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_OVERFLOW;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else begin							  // Ìf[^
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 id_mem_op;
					ex_mem_wr_data <= #1 id_mem_wr_data;
					ex_ctrl_op	   <= #1 id_ctrl_op;
					ex_dst_addr	   <= #1 id_dst_addr;
					ex_gpr_we_	   <= #1 id_gpr_we_;
					ex_exp_code	   <= #1 id_exp_code;
					ex_out		   <= #1 alu_out;
				end
			end
		end
	end
endmodule