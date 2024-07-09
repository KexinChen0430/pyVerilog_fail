module if_id(
    input wire clk,
    input wire rst,
    //input
    //Instruction
    input wire[31:0] insAddr_i,
    input wire[31:0] ins_i, //000000 00001 00010 00011 000001 00001
    //Control
    input wire bubble_i,
    input wire pauseControl_i,
    input wire flush_i,
    //Exception
    input wire[3:0] exception_i,
    input wire[31:0] badVAddr_i,
    //output
    //Instruction
    output reg[31:0] insAddr_o,
    output reg[31:0] ins_o,
    //Exception
    output reg[3:0] exception_o,
    output reg[31:0] badVAddr_o,
    output reg insValid_o
    );
    wire[31:0] insAddr = insAddr_o;
    wire[31:0] ins = ins_o;
    wire[3:0] exception = exception_o;
    wire[31:0] badVAddr = badVAddr_o;
    wire insValid = insValid_o;
    always @(posedge clk) begin
        if (rst == `Enable) begin
            insAddr_o <= `ZeroWord;
            ins_o <= `ZeroWord;
            exception_o <= `EXC_NONE;
            badVAddr_o <= `ZeroWord;
            insValid_o <= `Disable;
        end else if (pauseControl_i == `PAUSE_CONTROLED) begin
            insAddr_o <= insAddr;
            ins_o <= ins;
            exception_o <= exception;
            badVAddr_o <= badVAddr;
            insValid_o <= insValid;
        end else if (flush_i == `Enable) begin
            insAddr_o <= `ZeroWord;
            ins_o <= `ZeroWord;
            exception_o <= `EXC_NONE;
            badVAddr_o <= `ZeroWord;
            insValid_o <= `Disable;
        end else if (bubble_i == `Enable) begin
            insAddr_o <= insAddr;
            ins_o <= ins;
            exception_o <= exception;
            badVAddr_o <= badVAddr;
            insValid_o <= insValid;
        end else begin
            insAddr_o <= insAddr_i;
            ins_o <= ins_i;
            //ins_o <= 32'b00000000001000100001100000100001;
            exception_o <= exception_i;
            badVAddr_o <= badVAddr_i;
            insValid_o <= `Enable;
        end
    end
endmodule