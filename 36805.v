module uparc_alu(
	alu_op,
	a,
	b,
	result,
	ovflow
);
/* Inputs */
input wire [`UPARC_ALUOP_WIDTH-1:0] alu_op;
input wire [`UPARC_REG_WIDTH-1:0] a;
input wire [`UPARC_REG_WIDTH-1:0] b;
/* Outputs */
output reg [`UPARC_REG_WIDTH-1:0] result;
output wire ovflow;	/* Integer overflow */
/** Internal wires **/
wire [`UPARC_REG_WIDTH-1:0] b_mux;
wire [`UPARC_REG_WIDTH-1:0] a_plus_b;
wire [`UPARC_REG_WIDTH-1:0] a_or_b;
assign b_mux = (alu_op != `UPARC_ALUOP_SUB ? b : (~b) + 1);
assign a_plus_b = a + b_mux;
assign a_or_b = a | b;
/* Integer overflow */
assign ovflow = ~(a[`UPARC_REG_WIDTH-1] ^ b_mux[`UPARC_REG_WIDTH-1]) &
	(a[`UPARC_REG_WIDTH-1] ^ result[`UPARC_REG_WIDTH-1]);
always @(*)
begin
	case(alu_op)
	`UPARC_ALUOP_ADD:  result = a_plus_b;
	`UPARC_ALUOP_SUB:  result = a_plus_b;
	`UPARC_ALUOP_SLL:  result = a << b[4:0];
	`UPARC_ALUOP_SRL:  result = $unsigned(a) >> b[4:0];
	`UPARC_ALUOP_SRA:  result = $signed(a) >>> b[4:0];
	`UPARC_ALUOP_AND:  result = a & b;
	`UPARC_ALUOP_OR:   result = a_or_b;
	`UPARC_ALUOP_XOR:  result = a ^ b;
	`UPARC_ALUOP_NOR:  result = ~a_or_b;
	`UPARC_ALUOP_SLT:  result = ($signed(a) < $signed(b) ?
		{{(`UPARC_REG_WIDTH-1){1'b0}}, 1'b1} : {(`UPARC_REG_WIDTH){1'b0}});
	`UPARC_ALUOP_SLTU: result = ($unsigned(a) < $unsigned(b) ?
		{{(`UPARC_REG_WIDTH-1){1'b0}}, 1'b1} : {(`UPARC_REG_WIDTH){1'b0}});
	default: result = {(`UPARC_REG_WIDTH){1'b0}};
	endcase
end
endmodule