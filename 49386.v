module ControlUnit(
	output [CNTRL_WIDTH-1:0] CNTRL_out,
	output [WORD_WIDTH-1:0] PC_out,
	output [WORD_WIDTH-1:0] CONST_out,
	input [INSTR_WIDTH-1:0] INSTR_in,
	input [WORD_WIDTH-1:0] INSTRM_in,
	input [3:0] FLAG_in,
	input RST_in,
	input CLK_in
	);
parameter WORD_WIDTH = 16;
parameter DR_WIDTH = 3;
parameter OPCODE_WIDTH = 7;
parameter INSTR_WIDTH = WORD_WIDTH;
parameter CNTRL_WIDTH = 3*DR_WIDTH+11;
wire [WORD_WIDTH-1:0] PC_INSTR_out, EXTNDR_out;
wire [7:0] BC_out;
ControlUnit_BranchController BC0(
		.BC_out(BC_out),
		.CNTRL_in(CNTRL_out),
		.FLAG_in(FLAG_in),
		.RST(RST_in)
		);
defparam BC0.WORD_WIDTH = WORD_WIDTH;
defparam BC0.DR_WIDTH = DR_WIDTH;
ControlUnit_Extender EX0(
	.EXTNDR_out(EXTNDR_out),
	.INSTR_in(INSTRM_in)
	);
defparam EX0.WORD_WIDTH = WORD_WIDTH;
defparam EX0.DR_WIDTH = DR_WIDTH;
ControlUnit_ProgramCounter PC0(
	.INSTR_out(PC_out),
	.INSTR_in(INSTR_in),
	.BC_in(BC_out),
	.EXTNDR_in(EXTNDR_out),
	.CLK(CLK_in)
	);
defparam PC0.WORD_WIDTH = WORD_WIDTH;
defparam PC0.DR_WIDTH = DR_WIDTH;
ControlUnit_InstructionDecoder ID0(
	.CNTRL_out(CNTRL_out),
	.INSTR_in(INSTRM_in)
	);
defparam ID0.WORD_WIDTH = WORD_WIDTH;
defparam ID0.DR_WIDTH = DR_WIDTH;
ControlUnit_ZeroFiller ZF0(
	.CONST_out(CONST_out),
	.INSTR_in(INSTRM_in)
	);
defparam ZF0.WORD_WIDTH = WORD_WIDTH;
defparam ZF0.DR_WIDTH = DR_WIDTH;
endmodule