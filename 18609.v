module alu (
	input clock,
	input [7:0] opcode,
	input [`BITS-1:0] tos,
	input [`BITS-1:0] nos,
	output [`BITS-1:0] alu_tos,
	output [`BITS-1:0] alu_nos);
	reg [`BITS-1:0] _tos;
	reg [`BITS-1:0] _nos;
	reg [`BITS*2-1:0] _mul;
	assign alu_tos = _tos;
	assign alu_nos = _nos;
	always @(posedge clock) begin
	case(opcode)
	// math
	8'b0000_0100:
		_tos <= - tos;
	8'b0000_0101:
		_tos <= nos + tos;
	8'b0000_0110:
		begin
			_mul = nos * tos;
			_tos <= _mul[`BITS-1:0];
			_nos <= _mul[(`BITS*2)-1:`BITS];
		end
	8'b0000_0111:
		begin
			_tos <= nos / tos;
			_nos <= nos % tos;
		end
	// logic
	8'b0000_1000:
		_tos <= ~ tos;
	8'b0000_1001:
		_tos <= nos & tos;
	8'b0000_1010:
		_tos <= nos | tos;
	8'b0000_1011:
		_tos <= nos ^ tos;
	default:
		_tos <= tos;
	endcase
	end
endmodule