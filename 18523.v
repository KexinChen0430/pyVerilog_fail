module Sign_Ext_Imm (
	result,
	operand,
	enable
);
	`include "definition/Definition.v"
	output				[WORD-1:0]								result;
	input				[WORD-1:0]								operand;
	input														enable;
	Sign_Ext_Return standin(
		.result(result),
		.operand(operand),
		.size(IMM_EXT_CONSTANT),
		.signage(enable)
	);
endmodule