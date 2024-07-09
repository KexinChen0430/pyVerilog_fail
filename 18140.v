module branch_jump (
	output branch_taken,
	output [31:0] branch_target,
	output jump,
	output [31:0] jump_target,
	input [31:0] inst,
	input [31:0] pc,
	input [31:0] rd1,
	input [31:0] alu_out
);
	wire [6:0] opcode = inst[6:0];
	wire [2:0] funct3 = inst[9:7];
	wire [11:0] split_imm = {inst[31:27], inst[16:10]};
	wire [31:0] sext_split_imm = split_imm[11] ? {20'hFFFFF, split_imm} : {20'h0, split_imm};
	assign jump = (opcode == `OPCODE_J ||
	               opcode == `OPCODE_JAL ||
	               opcode == `OPCODE_JALR);
	wire [31:0] j_offset = inst[31] ? {6'h3F, inst[31:7], 1'b0} : {6'h0, inst[31:7], 1'b0};
	assign jump_target = (opcode == `OPCODE_J || opcode == `OPCODE_JAL) ? j_offset + pc : rd1;
	/* branch */
	assign branch_target = pc + ($signed(sext_split_imm) << 1);
	reg branch_sat;
	always @ (*) begin
		case (funct3)
			`F3_BEQ: branch_sat = (alu_out == 0);
			`F3_BNE: branch_sat = (alu_out != 0);
			`F3_BLT: branch_sat = (alu_out == 1);
			`F3_BGE: branch_sat = (alu_out != 1);
			`F3_BLTU: branch_sat = (alu_out == 1);
			`F3_BGEU: branch_sat = (alu_out != 1);
			default: branch_sat = 0;
		endcase
	end
	assign branch_taken = branch_sat && (opcode == `OPCODE_BRANCH);
endmodule