module alu
  (
   input [2:0]      alu_control,
   input [7:0]      alu_AI,
   input [7:0]      alu_BI,
   input            alu_carry_in,
   output reg [7:0] alu_Y,
   output reg       alu_carry_out,
   output reg       alu_overflow
   );
`include "params.vh"
  reg [8:0]        add_result;  // 9-bits to keep track of the carry
  reg              add_carry_out;
  reg              add_overflow;
  reg              sr_carry_out;
  // Mux out the intended operation
  always @(*) begin
    case ( alu_control )
      ADD: begin
        add_result = {1'b0, alu_AI} + {1'b0, alu_BI} + {8'd0, alu_carry_in};
        add_carry_out = add_result[8];
        alu_Y = add_result[7:0];
        alu_overflow = add_overflow;
      end
      SR: begin
        alu_Y = {alu_carry_in, alu_AI[7:1]};
        sr_carry_out = alu_AI[0];
        alu_overflow = 1'b0;
      end
      AND: begin
        alu_Y = alu_AI & alu_BI;
        alu_overflow = 1'b0;
      end
      OR: begin
        alu_Y = alu_AI | alu_BI;
        alu_overflow = 1'b0;
      end
      XOR: begin
        alu_Y = alu_AI ^ alu_BI;
        alu_overflow = 1'b0;
      end
      default: begin end
    endcase // case ( ctrl )
  end
  // Mux out the carry bit - note that only ADD and SR have any effect on this
  // value
  always @(*) begin
    case ( alu_control )
      ADD: begin
        alu_carry_out = add_carry_out;
      end
      SR: begin
        alu_carry_out = sr_carry_out;
      end
      default: begin
        alu_carry_out = 1'b0;
      end
    endcase // case ( alu_control )
  end
  // Compute the overflow output
  always @(*) begin
    // The overflow condition is logically
    // ((NOT A[7] AND NOT B[7]) AND ADD[7]) OR (A[7] AND B[7] AND NOT ADD[7])
    // Which is equivalent to
    // (A[7] XNOR B[7]) AND (A[7] XOR ADD[7])
    add_overflow = (~(alu_AI[7] ^ alu_BI[7])) & (alu_AI[7] ^ alu_Y[7]);
  end
endmodule