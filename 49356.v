module mpx_alu
(
    input_a,
    input_b,
    func,
    result
);
// I/O
input [31:0]    input_a     /*verilator public*/;
input [31:0]    input_b     /*verilator public*/;
input [3:0]     func        /*verilator public*/;
output [31:0]   result      /*verilator public*/;
// Registers
reg [31:0]      result;
// ALU
always @ (func or input_a or input_b )
begin
   case (func)
       `ALU_SHIFTL :        result = shift_left(input_a, input_b);
       `ALU_SHIFTR :        result = shift_right(input_a, input_b);
       `ALU_SHIRTR_ARITH:   result = shift_right_arith(input_a, input_b);
       `ALU_ADD :           result = (input_a + input_b);
       `ALU_SUB :           result = (input_a - input_b);
       `ALU_AND :           result = (input_a & input_b);
       `ALU_OR :            result = (input_a | input_b);
       `ALU_XOR :           result = (input_a ^ input_b);
       `ALU_NOR :           result = (~(input_a | input_b));
       `ALU_SLT :
        begin
           if (less_than_signed(input_a, input_b) == 1'b1)
                result = 32'h00000001;
           else
                result = 32'h00000000;
        end
       `ALU_SLTE :
        begin
           if ((less_than_signed(input_a, input_b) == 1'b1) || (input_a == input_b))
                result = 32'h00000001;
           else
                result = 32'h00000000;
        end
       `ALU_SLTU :
        begin
           if (less_than(input_a, input_b) == 1'b1)
                result = 32'h00000001;
           else
                result = 32'h00000000;
        end
       default :
            result = 32'h00000000;
   endcase
end
`include "mpx_funcs.v"
endmodule