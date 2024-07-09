module ALU(
  input [31:0] A,B,
  input [4:0] ALUop,
  output reg [31:0] Out
);
wire [4:0] shamt;
assign shamt = B[4:0];
always @(*)
  case(ALUop)
    `ALU_ADD:     Out = A+B;
    `ALU_SUB:     Out = A-B;
    `ALU_AND:     Out = A & B;
    `ALU_OR:      Out = A | B;
    `ALU_XOR:     Out = A ^ B;
    `ALU_SLT:     Out = ($signed(A)<$signed(B)) ? 32'd1 : 32'd0;
    `ALU_SLTU:    Out = (A<B) ? 32'd1 : 32'd0;
    `ALU_SLL:     Out = A << shamt;
    `ALU_SRA:     Out = $signed(A) >>> $signed(shamt);
    `ALU_SRL:     Out = A >> shamt;
    `ALU_COPY_B:  Out = B;
    `ALU_EQ:      Out = (A==B) ? 32'd1 : 32'd0;
    `ALU_NE:      Out = (A!=B) ? 32'd1 : 32'd0;
    `ALU_LT:      Out = ($signed(A) < $signed(B))  ? 32'd1 : 32'd0;
    `ALU_GE:      Out = ($signed(A) >= $signed(B))  ? 32'd1 : 32'd0;
    `ALU_LTU:     Out = (A < B)  ? 32'd1 : 32'd0;
    `ALU_GEU:     Out = (A >= B)  ? 32'd1 : 32'd0;
    default:      Out = 32'd0;
  endcase
endmodule