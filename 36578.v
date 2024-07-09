module id_ex(
    input wire clk,
    input wire rst,
    //input
    //ID
    input wire[31:0] insAddr_i,
    input wire nextInDelaySlot_i,
    //EX
    input wire[31:0] operand1_i,
    input wire[31:0] operand2_i,
    input wire[4:0] aluOp_i,
    //MEM
    input wire[31:0] storeData_i,
    input wire[2:0] memOp_i,
    //WB
    input wire writeReg_i,
    input wire[4:0] writeRegAddr_i,
    input wire writeRegHiLo_i,
    input wire writeCP0_i,
    input wire[4:0] writeCP0Addr_i,
    //Exception
    input wire insValid_i,
    input wire inDelaySlot_i,
    input wire[3:0] exception_i,
    input wire[31:0] badVAddr_i,
    //Control
    input wire pauseControl_i,
    input wire flush_i,
    input wire bubble_i,
    //output
    //ID
    output reg[31:0] insAddr_o,
    output reg nextInDelaySlot_o,
    //EX
    output reg[31:0] operand1_o,
    output reg[31:0] operand2_o,
    output reg[4:0] aluOp_o,
    //MEM
    output reg[31:0] storeData_o,
    output reg[2:0] memOp_o,
    //WB
    output reg writeReg_o,
    output reg[4:0] writeRegAddr_o,
    output reg writeRegHiLo_o,
    output reg writeCP0_o,
    output reg[4:0] writeCP0Addr_o,
    //Exception
    output reg insValid_o,
    output reg inDelaySlot_o,
    output reg[3:0] exception_o,
    output reg[31:0] badVAddr_o
    );
    //ID
    wire[31:0] insAddr = insAddr_o;
    wire nextInDelaySlot = nextInDelaySlot_o;
    //EX
    wire[31:0] operand1 = operand1_o;
    wire[31:0] operand2 = operand2_o;
    wire[4:0] aluOp = aluOp_o;
    //MEM
    wire[31:0] storeData = storeData_o;
    wire[2:0] ramOp = memOp_o;
    //WB
    wire writeReg = writeReg_o;
    wire[4:0] writeRegAddr = writeRegAddr_o;
    wire writeRegHiLo = writeRegHiLo_o;
    wire writeCP0 = writeCP0_o;
    wire[4:0] writeCP0Addr = writeCP0Addr_o;
    //Exception
    wire insValid = insValid_o;
    wire inDelaySlot = inDelaySlot_o;
    wire[3:0] exception = exception_o;
    wire[31:0] badVAddr = badVAddr_o;
    always @(posedge clk) begin
        if (rst == `Enable) begin
            //ID
                insAddr_o <= `ZeroWord;
                nextInDelaySlot_o <= `Disable;
            //EX
                operand1_o <= `ZeroWord;
                operand2_o <= `ZeroWord;
                aluOp_o <= `ALU_NOP_OP;
            //MEM
                storeData_o <= `ZeroWord;
                memOp_o <= `MEM_NOP_OP;
            //WB
                writeReg_o <= `Disable;
                writeRegAddr_o <= 5'h0;
                writeRegHiLo_o <= `Disable;
                writeCP0_o <= `Disable;
                writeCP0Addr_o <= `CP0_NoAddr;
            //Exception
                insValid_o <= `Disable;
                inDelaySlot_o <= `Disable;
                exception_o <= `EXC_NONE;
                badVAddr_o <= `ZeroWord;
        end else if (pauseControl_i == `PAUSE_CONTROLED) begin
            //ID
                insAddr_o <= insAddr;
                nextInDelaySlot_o <= nextInDelaySlot;
            //EX
                operand1_o <= operand1;
                operand2_o <= operand2;
                aluOp_o <= aluOp;
            //MEM
                storeData_o <= storeData;
                memOp_o <= ramOp;
            //WB
                writeReg_o <= writeReg;
                writeRegAddr_o <= writeRegAddr;
                writeRegHiLo_o <= writeRegHiLo;
                writeCP0_o <= writeCP0;
                writeCP0Addr_o <= writeCP0Addr;
            //Exception
                insValid_o <= insValid;
                inDelaySlot_o <= inDelaySlot;
                exception_o <= exception;
                badVAddr_o <= badVAddr;
        end else if (flush_i == `Enable) begin
            //ID
                insAddr_o <= `ZeroWord;
                nextInDelaySlot_o <= `Disable;
            //EX
                operand1_o <= `ZeroWord;
                operand2_o <= `ZeroWord;
                aluOp_o <= `ALU_NOP_OP;
            //MEM
                storeData_o <= `ZeroWord;
                memOp_o <= `MEM_NOP_OP;
            //WB
                writeReg_o <= `Disable;
                writeRegAddr_o <= 5'h0;
                writeRegHiLo_o <= `Disable;
                writeCP0_o <= `Disable;
                writeCP0Addr_o <= `CP0_NoAddr;
            //Exception
                insValid_o <= `Disable;
                inDelaySlot_o <= `Disable;
                exception_o <= `EXC_NONE;
                badVAddr_o <= `ZeroWord;
        end else if (bubble_i == `Enable) begin
            //ID
                insAddr_o <= `ZeroWord;
                nextInDelaySlot_o <= `Disable;
            //EX
                operand1_o <= `ZeroWord;
                operand2_o <= `ZeroWord;
                aluOp_o <= `ALU_NOP_OP;
            //MEM
                storeData_o <= `ZeroWord;
                memOp_o <= `MEM_NOP_OP;
            //WB
                writeReg_o <= `Disable;
                writeRegAddr_o <= 5'h0;
                writeRegHiLo_o <= `Disable;
                writeCP0_o <= `Disable;
                writeCP0Addr_o <= `CP0_NoAddr;
            //Exception
                insValid_o <= `Disable;
                inDelaySlot_o <= `Disable;
                exception_o <= `EXC_NONE;
                badVAddr_o <= `ZeroWord;
        end else begin
            //ID
                insAddr_o <= insAddr_i;
                nextInDelaySlot_o <= nextInDelaySlot_i;
            //EX
                operand1_o <= operand1_i;
                operand2_o <= operand2_i;
                aluOp_o <= aluOp_i;
            //MEM
                storeData_o <= storeData_i;
                memOp_o <= memOp_i;
            //WB
                writeReg_o <= writeReg_i;
                writeRegAddr_o <= writeRegAddr_i;
                writeRegHiLo_o <= writeRegHiLo_i;
                writeCP0_o <= writeCP0_i;
                writeCP0Addr_o <= writeCP0Addr_i;
            //Exception
                insValid_o <= insValid_i;
                inDelaySlot_o <= inDelaySlot_i;
                exception_o <= exception_i;
                badVAddr_o <= badVAddr_i;
        end
    end
endmodule