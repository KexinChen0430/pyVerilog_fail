module ag6502_alu(A, B, OP, NEG, C_IN, D_IN, R, C_OUT, V_OUT);
	input wire[7:0] A, B;
	input wire[2:0] OP;
	input wire C_IN, D_IN, NEG;
	output wire[7:0] R;
	output wire C_OUT, V_OUT;
	wire[4:0] ADD_L;
	ag6502_decimal DL({1'b0, A[3:0]} + {1'b0, B[3:0]} + C_IN, D_IN, NEG, ADD_L);
	wire CF_H = ADD_L[4];
	wire[4:0] ADD_H;
	ag6502_decimal DH({1'b0, A[7:4]} + {1'b0, B[7:4]} + CF_H, D_IN, NEG, ADD_H);
	assign
		{C_OUT,R} = (OP==`ALU_ORA)? A | B:
				(OP==`ALU_AND)? A & B:
				(OP==`ALU_EOR)? A ^ B:
				(OP==`ALU_ADC)? {ADD_H, ADD_L[3:0]}:
				(OP==`ALU_ASL)? {A[7], A[6:0], 1'b0}:
				(OP==`ALU_LSR)? {A[0], 1'b0, A[7:1]}:
				(OP==`ALU_ROL)? {A[7], A[6:0], C_IN}:
				(OP==`ALU_ROR)? {A[0], C_IN, A[7:1]}:
				8'bX;
	assign V_OUT = (A[7] == B[7]) && (A[7] != R[7]);
endmodule