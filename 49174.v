module uparc_execute(
	clk,
	nrst,
	/* CU signals */
	i_pc_p0,
	i_pc_p1,
	i_exec_stall,
	i_mem_stall,
	i_fetch_stall,
	i_wait_stall,
	o_overfl_error,
	o_addr_error,
	o_syscall_trap,
	o_break_trap,
	i_nullify,
	/* Coprocessor 0 */
	i_cop0_op,
	i_cop0_cop,
	i_cop0_reg_val,
	/* Integer multiplication and division unit */
	i_imuldiv_rd_val,
	i_imuldiv_rd_valid,
	/* Decoded instr */
	i_rd_no,
	i_rs_val,
	i_rt_val,
	i_imm,
	i_alu_op,
	i_alu_inpt,
	i_alu_ovf_ex,
	i_jump,
	i_jump_link,
	i_sw_trap,
	i_lsu_op,
	i_lsu_lns,
	i_lsu_ext,
	/* Stage output */
	o_rd_no,
	o_alu_result,
	o_jump_addr,
	o_jump_valid,
	o_lsu_op,
	o_lsu_lns,
	o_lsu_ext,
	o_mem_data
);
`include "uparc_reg_names.vh"
`include "uparc_decode_const.vh"
/* Inputs */
input wire				clk;
input wire				nrst;
/* CU signals */
input wire [`UPARC_ADDR_WIDTH-1:0]	i_pc_p0;
input wire [`UPARC_ADDR_WIDTH-1:0]	i_pc_p1;
input wire				i_exec_stall;
input wire				i_mem_stall;
input wire				i_fetch_stall;
input wire				i_wait_stall;
output wire				o_overfl_error;
output wire				o_addr_error;
output reg				o_syscall_trap;
output reg				o_break_trap;
input wire				i_nullify;
/* Coprocessor 0 */
input wire				i_cop0_op;
input wire [`UPARC_REGNO_WIDTH-1:0]	i_cop0_cop;
input wire [`UPARC_REG_WIDTH-1:0]	i_cop0_reg_val;
/* Integer multiplication and division unit */
input wire [`UPARC_REG_WIDTH-1:0]	i_imuldiv_rd_val;
input wire				i_imuldiv_rd_valid;
/* Decoded instr */
input wire [`UPARC_REGNO_WIDTH-1:0]	i_rd_no;
input wire [`UPARC_REG_WIDTH-1:0]	i_rs_val;
input wire [`UPARC_REG_WIDTH-1:0]	i_rt_val;
input wire [`UPARC_DATA_WIDTH-1:0]	i_imm;
input wire [`UPARC_ALUOP_WIDTH-1:0]	i_alu_op;
input wire [4:0]			i_alu_inpt;
input wire				i_alu_ovf_ex;
input wire [4:0]			i_jump;
input wire				i_jump_link;
input wire [`UPARC_SWTRP_WIDTH-1:0]	i_sw_trap;
input wire [`UPARC_LSUOP_WIDTH-1:0]	i_lsu_op;
input wire				i_lsu_lns;
input wire				i_lsu_ext;
/* Stage output */
output wire [`UPARC_REGNO_WIDTH-1:0]	o_rd_no;
output wire [`UPARC_REG_WIDTH-1:0]	o_alu_result;
output wire [`UPARC_ADDR_WIDTH-1:0]	o_jump_addr;
output wire				o_jump_valid;
output reg [`UPARC_LSUOP_WIDTH-1:0]	o_lsu_op;
output reg				o_lsu_lns;
output reg				o_lsu_ext;
output reg [`UPARC_DATA_WIDTH-1:0]	o_mem_data;
wire core_stall = i_exec_stall || i_mem_stall || i_fetch_stall || i_wait_stall;
assign o_jump_addr = alu_result;
assign o_overfl_error = ovflow_en && ovflow;
assign o_addr_error = (branch_taken && |alu_result[1:0] ? 1'b1 : 1'b0);
reg jump_instr;				/* Current operation is jump */
reg branch_taken;			/* Set if branch taken */
reg branch_link;			/* Branch requires link */
reg [`UPARC_REGNO_WIDTH-1:0] rd_no;	/* Captured destination register number */
reg [`UPARC_ADDR_WIDTH-1:0] pc_p0;	/* Captured PC of instruction after delay slot */
/* ALU interconnect */
reg [`UPARC_ALUOP_WIDTH-1:0]	alu_op;
reg [`UPARC_REG_WIDTH-1:0]	a;
reg [`UPARC_REG_WIDTH-1:0]	b;
reg				ovflow_en;
wire [`UPARC_REG_WIDTH-1:0]	alu_result;
wire				ovflow;
/* Capture destination register */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
		rd_no <= {(`UPARC_REGNO_WIDTH){1'b0}};
	else if(!core_stall)
		rd_no <= !i_nullify ? i_rd_no : {(`UPARC_REGNO_WIDTH){1'b0}};
end
/* ALU operation */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		alu_op <= `UPARC_ALUOP_ADD;
		a <= {(`UPARC_REG_WIDTH){1'b0}};
		b <= {(`UPARC_REG_WIDTH){1'b0}};
		ovflow_en <= 1'b0;
	end
	else if(!core_stall)
	begin
		alu_op <= i_alu_op;
		ovflow_en <= !i_nullify ? i_alu_ovf_ex : 1'b0;
		case(i_alu_inpt)
		DECODE_ALU_INPT_RTRS: begin
			a <= i_rt_val;
			b <= i_rs_val;
		end
		DECODE_ALU_INPT_RSIMM: begin
			a <= i_rs_val;
			b <= i_imm;
		end
		DECODE_ALU_INPT_RTIMM: begin
			a <= i_rt_val;
			b <= i_imm;
		end
		DECODE_ALU_INPT_PCIMM: begin
			a <= i_pc_p1;
			b <= i_imm;
		end
		default: begin /* DECODE_ALU_INPT_RSRT */
			a <= i_rs_val;
			b <= (i_cop0_op && i_cop0_cop == `UPARC_COP0_MF ? i_cop0_reg_val : i_rt_val);
		end
		endcase
	end
end
/* LSU operation */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		o_lsu_op <= `UPARC_LSU_IDLE;
		o_lsu_lns <= 1'b0;
		o_lsu_ext <= 1'b0;
		o_mem_data <= {(`UPARC_DATA_WIDTH){1'b0}};
	end
	else if(!core_stall && !i_nullify)
	begin
		o_lsu_op <= i_lsu_op;
		o_lsu_lns <= i_lsu_lns;
		o_lsu_ext <= i_lsu_ext;
		if(i_lsu_op != `UPARC_LSU_IDLE) /* Pass only when needed */
			o_mem_data <= i_rt_val;
	end
	else if(!core_stall)
		o_lsu_op <= `UPARC_LSU_IDLE;
end
/* Evaluate branch */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		branch_taken <= 1'b0;
		branch_link <= 1'b0;
		jump_instr <= 1'b0;
		pc_p0 <= {(`UPARC_ADDR_WIDTH){1'b0}};
	end
	else if(!core_stall && !i_nullify)
	begin
		branch_link <= i_jump_link;
		jump_instr <= i_jump != DECODE_JUMPT_NONE ? 1'b1 : 1'b0;
		pc_p0 <= i_pc_p0;
		case(i_jump)
		DECODE_JUMPT_J, DECODE_JUMPT_JR: branch_taken <= 1'b1;
		DECODE_JUMPT_BLTZ: branch_taken <= i_rs_val[31];
		DECODE_JUMPT_BGEZ: branch_taken <= ~i_rs_val[31];
		DECODE_JUMPT_BEQ: branch_taken <= i_rs_val == i_rt_val;
		DECODE_JUMPT_BNE: branch_taken <= i_rs_val != i_rt_val;
		DECODE_JUMPT_BLEZ: branch_taken <= i_rs_val[31] || ~|i_rs_val;
		DECODE_JUMPT_BGTZ: branch_taken <= !i_rs_val[31] && |i_rs_val;
		default: branch_taken <= 1'b0;
		endcase
	end
	else if(!core_stall)
		branch_taken <= 1'b0;
end
/* Software traps */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		o_syscall_trap <= 1'b0;
		o_break_trap <= 1'b0;
	end
	else if(!core_stall && !i_nullify)
	begin
		o_syscall_trap <= (i_sw_trap == `UPARC_SWTRP_SYSCALL ? 1'b1 : 1'b0);
		o_break_trap <= (i_sw_trap == `UPARC_SWTRP_BREAK ? 1'b1 : 1'b0);
	end
	else if(!core_stall)
	begin
		o_syscall_trap <= 1'b0;
		o_break_trap <= 1'b0;
	end
end
/* Set outputs */
assign o_rd_no = jump_instr && !branch_taken ? R0 : rd_no;
assign o_jump_valid = branch_taken;
assign o_alu_result = jump_instr && branch_link ? pc_p0 :
			i_imuldiv_rd_valid ? i_imuldiv_rd_val : alu_result;
/* ALU instance */
uparc_alu alu(
	.alu_op(alu_op),
	.a(a),
	.b(b),
	.result(alu_result),
	.ovflow(ovflow)
);
endmodule