module Butterfly_Unit (
	result,
	operand,
	amount,
	shift_type,
	opcode
);
	`include "definition/Definition.v"
	output		reg		[WORD-1:0]	result;
	input				[WORD-1:0]	operand;
	input				[WORD-1:0]	amount;
	input				[WORD-1:0]	shift_type;
	input				[WORD-1:0]	opcode;
				wire	[((WORD/2)*LOGWORD)-1:0]	control_rotate;
				wire	[((WORD/2)*LOGWORD)-1:0]	control_swap;
				wire	[(WORD/2)-1:0]				control_const	[LOGWORD-1:0];	// control for 1 bit strings
				wire	[(WORD/2)-1:0]				control_exp		[LOGWORD-1:0];	// control for exponential strings
				wire	[(WORD/2)-1:0]				control_array	[LOGWORD-1:0];	// control for full array
				wire	[((WORD/2)*LOGWORD)-1:0]	control_bfly;					// control input to inverse butterfly
				wire	[WORD-1:0]					emit;
				wire	[WORD-1:0]					mask;
				wire	[WORD-1:0]					rotor;
	genvar i;
	genvar j;
	generate
		for(i=0; i<LOGWORD; i=i+1) begin : GEN_CONTROL
			assign control_const[i] = control_swap[(i+1)*(WORD/2)-1:(i*(WORD/2))];
			assign control_exp[i] = (shift_type==TYPE_CONST) ? {(1<<i){control_const[i][0]}} : control_rotate[((i+1)*(WORD/2))-1:(i*(WORD/2))];
			assign control_array[i] = {((WORD/2)/(1<<i)){control_exp[i][(1<<i)-1:0]}} ;
			assign control_bfly[((i+1)*WORD/2)-1:((i+0)*WORD/2)] = control_array[i];
		end
	endgenerate
	InvButterfly datapath (
		.outword(rotor),
		.inword(operand),
		.control(control_bfly)
	);
	RotateControl controlpath (
		.emit(emit),
		.control(control_rotate),
		.rotate(amount)
	);
	generate
		for(i=0; i<LOGWORD; i=i+1) begin : GEN_SWAP
			assign control_swap[i*(WORD/2)] = amount[i];
		end
	endgenerate
	assign mask = (&amount[WORD-1:LOGWORD]) || (&(~amount[WORD-1:LOGWORD])) ? emit : {WORD{1'b1}};
	// either the sign extends or the number is too large
	// if the number is too large the mask gets saturated
	always @(*) begin
		case(shift_type)
			TYPE_CONST:					result	<= rotor;
			TYPE_EXP:
				case(opcode)
					SHIFT_LOGICAL:		result	<= rotor & ~mask;
					SHIFT_ANTILOGICAL:	result	<= rotor | mask;
					SHIFT_ARITHMETIC:	result	<= amount[WORD-1] ?
						(rotor & (~mask)) | ({WORD{operand[     0]}} & mask) :	// shift left
						(rotor & (~mask)) | ({WORD{operand[WORD-1]}} & mask) ;	// shift right
					SHIFT_CIRCULAR:		result	<= rotor;
					default:			result	<= rotor;
				endcase
			default:					result	<= rotor;
		endcase
	end
endmodule