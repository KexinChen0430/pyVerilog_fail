module Preshift (
	boperand,
	bamount,
	btype,
	bopcode,
	immediate,
	reg1,
	reg2,
	reg3,
	shift_I,
	shift_IR,
	shift_type,
	swapshift,
	amount,
	enable
);
	`include "definition/Definition.v"
	output		reg		[WORD-1:0]				boperand;		// the argument to be shifted or swapped by the butterfly unit
	output		reg		[WORD-1:0]				bamount;		// the amount or control bits by which to shift in the butterfly unit
	output		reg		[WORD-1:0]				btype;			// whether to do a shift or swap type operation
	output		reg		[WORD-1:0]				bopcode;		// what type of swap or shift operation
	input				[WORD-1:0]				immediate;		// the immedaite value in the instruction
	input				[WORD-1:0]				reg1;			// reg1
	input				[WORD-1:0]				reg2;			// reg2
	input				[WORD-1:0]				reg3;			// reg3
	input				[WORD-1:0]				shift_I;		// the instruction-immediate value
	input				[WIDTH_SHIFT_IR-1:0]	shift_IR;		// the instruction flag indicating if a shift is controlled by an imm or reg value
	input				[WIDTH_SHIFT_TYPE-1:0]	shift_type;		// the instruction code indicating the kind of shift/rotate
	input										swapshift;		// choose between swap or shift operations
	input				[WORD-1:0]				amount;			// the control path value dictating a swap
	input										enable;			// if false just pass reg2 through this and the butterfly unit unharmed
	always @(*) begin
		if(enable) begin
			case(swapshift)
				PS_SWAP: begin
					boperand	<= reg1 | immediate;
					bamount		<= amount;
					btype		<= PS_SWAP;
					bopcode		<= 0;
				end
				PS_SHIFT: begin
					boperand	<= reg2;
					case(shift_IR)
						IMM:	bamount <= shift_I;
						REG:	bamount <= reg3;
						default	bamount <= 0;
					endcase
					btype		<= PS_SHIFT;
					bopcode		<= shift_type;
				end
				default: begin
					boperand	<= 0;
					bamount		<= 0;
					btype		<= 0;
					bopcode		<= 0;
				end
			endcase
		end
		else begin
			boperand	<= reg2;
			bamount		<= 0;
			btype		<= PS_SWAP;
			bopcode		<= 0;
		end
	end
endmodule