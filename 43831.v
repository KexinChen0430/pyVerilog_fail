module ALU #(parameter WIDTH=8) (
		input wire		[WIDTH - 1 : 0] 	op1,
		input wire		[WIDTH - 1 : 0] 	op2,
		input wire		[`ALUCTLW - 1: 0]	ctl,
		input wire		[`FWIDTH - 1 : 0]	flags_in,
		output wire		[WIDTH - 1 : 0] 	result,
		output wire		[`FWIDTH - 1 : 0]	flags_out
    );
	/* internal signals */
	reg [`FWIDTH - 1 : 0] flags;
	reg [WIDTH - 1 : 0] alu_out;
	wire msb1, msb2, msb3;
	/* ALU output */
	assign flags_out = flags;
	assign result = alu_out;
	/* internal wiring */
	assign msb1 = op1[WIDTH - 1];
	assign msb2 = op2[WIDTH - 1];
	assign msb3 = result[WIDTH - 1];
	/* ALU multiplexer and behaviour */
	always @(*) begin
		flags = {`FWIDTH{1'b0}};
		case(ctl)
			3'b000:	begin	/* add: op1 + op2 */
					/* sum and carry */
					{flags[`CARRY_FLAG], alu_out} = op1 + op2;
					/* overflow detect */
					flags[`OVERFLOW_FLAG] =	((~msb1) & (~msb2) & msb3)
											| (msb1 & msb2 & (~msb3));
					/* negative flag */
					flags[`NEGATIVE_FLAG] = msb3;
				end
			3'b001:	begin	/* add with carry: op1 + op2 + carry_in */
					/* sum and carry */
					{flags[`CARRY_FLAG], alu_out} = op1 + op2 + flags_in[`CARRY_FLAG];
					/* overflow detect */
					flags[`OVERFLOW_FLAG] =	((~msb1) & (~msb2) & msb3)
											| (msb1 & msb2 & (~msb3));
					/* negative flag */
					flags[`NEGATIVE_FLAG] = msb3;
				end
			3'b010:	begin	/* subtract: op2 - op1 */
					{flags[`CARRY_FLAG], alu_out} = op2 - op1;
					/* overflow detect */
					flags[`OVERFLOW_FLAG] =	((~msb1) & (~msb2) & msb3)
											| (msb1 & msb2 & (~msb3));
					/* negative flag */
					flags[`NEGATIVE_FLAG] = msb3;
				end
			3'b011:	begin	/* subtract with carry */
					{flags[`CARRY_FLAG], alu_out} = op2 - op1 - flags_in[`CARRY_FLAG];
					/* overflow detect */
					flags[`OVERFLOW_FLAG] =	((~msb1) & (~msb2) & msb3)
											| (msb1 & msb2 & (~msb3));
					/* negative flag */
					flags[`NEGATIVE_FLAG] = msb3;
				end
			3'b100:	begin	/* nand */
					alu_out = ~(op1 & op2);
				end
			3'b101:	begin	/* nor */
					alu_out = ~(op1 | op2);
				end
			3'b110:	begin	/* xor */
					alu_out = op1 ^ op2;
				end
			3'b111:	begin	/* shift right arithmetic */
					alu_out = {op1[WIDTH - 1], op1[WIDTH - 1 : 1]};
					flags[`CARRY_FLAG] = op1[0];
				end
			default:
				alu_out = {WIDTH{1'b0}};
		endcase
		flags[`ZERO_FLAG] = ~|alu_out;
	end
endmodule