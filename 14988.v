module control(
    input [5:0]op,
    input [5:0]funct,
    output reg [1:0]RegDst,
    output reg RegWrite,
    output reg ALUSrc,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg [1:0]Jump,
    output reg Branch,
    output reg Equal,
    output reg JumpLink,
    output reg [3:0]ALUCtrl
);
    // RegDst 0 : select from rt, 1 : select from rd
    // RegWrite 0 : None, 1 : Write data into register file
    // ALUSrc 0 : the second operand of ALU come from register file, 1 : come
    // from immediate number.
    // MemRead read data out from memory.
    // MemWrite write data into memory
    // MemtoReg output of memory write into registe file
    always @* begin
     case(op)
        6'h08 : begin //addi
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b0001; // add
            end
        6'h0C : begin //andi
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b0011; // and
            end
        6'h0D : begin //ori
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b0100; // or
            end
        6'h0E : begin //xori
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b0101; // xor
            end
        6'h0F : begin //lui
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b1000; // lui
            end
        6'h23 : begin //lw
            `CONTROL_SIGNAL <= 12'b0011101000X0;
            ALUCtrl <= 4'b0001; // add
            end
        6'h2B : begin //sw
            `CONTROL_SIGNAL <= 12'bXX01011000X0;
            ALUCtrl <= 4'b0001; // add
            end
        6'h04 : begin //beq
            `CONTROL_SIGNAL <= 12'b000000000100;
            ALUCtrl <= 4'b0010; // sub
            end
        6'h05 : begin //bne
            `CONTROL_SIGNAL <= 12'b000000000110;
            ALUCtrl <= 4'b0010; // sub
            end
        6'h0A : begin //slti
            `CONTROL_SIGNAL <= 12'b0011000000X0;
            ALUCtrl <= 4'b1001; // slt
            end
        6'h02 : begin //j
            `CONTROL_SIGNAL <= 12'bXX0X000010X0;
            ALUCtrl <= 4'b0000;
            end
        6'h03 : begin //jal
            `CONTROL_SIGNAL <= 12'b101X000010X1;
            ALUCtrl <= 4'b0000;
            end
        6'h00 :  //R-Type
            case(funct)
                6'd32 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0001; // add
                    end
                6'd34 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0010; // sub
                    end
                6'd36 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0011; // and
                    end
                6'd37 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0100; // or
                    end
                6'd38 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0101; // xor
                    end
                6'd39 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0110; // nor
                    end
                6'd42 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b1001; // slt
                    end
                6'd02 : begin
                    `CONTROL_SIGNAL <= 12'b0110000000X0;
                    ALUCtrl <= 4'b0111; // srl
                    end
                6'd08 : begin  // jr
                    `CONTROL_SIGNAL <= 12'b000000010XX0;
                    ALUCtrl <= 4'b0000;
                    end
                6'd09 : begin  // jalr
                    `CONTROL_SIGNAL <= 12'b011000010XX1;
                    ALUCtrl <= 4'b0000;
                    end
                default : begin
                    `CONTROL_SIGNAL <= 12'b0;
                    ALUCtrl <= 4'b0; // xor
                    end
            endcase
        default : begin
            `CONTROL_SIGNAL <= 12'b0;
            ALUCtrl <= 4'b0; // xor
            end
    endcase
 end
endmodule