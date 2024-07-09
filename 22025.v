module pc(
    input wire clk,
    input wire rst,
    //Branch
    input wire branchEnable_i,
    input wire[31:0] branchAddr_i,
    //Control
    input wire bubble_i,
    input wire pauseControl_i,
    input wire flush_i,
    input wire[31:0] excAddr_i,
    //Addr
    output reg[31:0] insAddr_o
    );
    wire[31:0] nextInsAddr = insAddr_o + 32'h4;
    wire[31:0] insAddr = insAddr_o;
    always @(posedge clk) begin
        if (rst == `Enable) begin
            //insAddr_o <= 32'hbfc00000 - 4;
            insAddr_o <= 32'h80000000 - 4;
        end else if (pauseControl_i == `PAUSE_CONTROLED) begin
            insAddr_o <= insAddr;
        end else if (flush_i == `Enable) begin
            insAddr_o <= excAddr_i;
        end else if (bubble_i == `Enable) begin
            insAddr_o <= insAddr;
        end else if (branchEnable_i == `Enable) begin
            insAddr_o <= branchAddr_i;
        end else begin
            insAddr_o <= nextInsAddr;
        end
    end
endmodule