module ALUTestbench;
   reg [31:0] inputA, inputB;
   reg [2:0] ALUop;
   wire [31:0] result;
   wire zero;
   ALU UUT(inputA, inputB, ALUop, result, zero);
   initial begin
       #20 inputA = 5;
           inputB = 6;
           ALUop = 3'b000;
       #40 inputA = 5;
           inputB = 6;
           ALUop = 3'b001;
       #40 inputA = 5;
           inputB = 6;
           ALUop = 3'b010;
       #40 inputA = 5;
           inputB = 6;
           ALUop = 3'b110;
       #40 inputA = 5;
           inputB = 6;
           ALUop = 3'b011;
       #40 inputA = 9;
           inputB = 3;
           ALUop = 3'b011;
       #40 inputA = 6;
           inputB = 6;
           ALUop = 3'b001;
       #40 inputA = -8;
           inputB = 6;
           ALUop = 3'b001;
   end
   initial
       #340 $stop;
endmodule