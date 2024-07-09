module ada_iaif_stage(
    input               clk,        // main clock
    input               rst,        // main reset
    input       [31:0]  pc_in,      // New PC.
    input               if_stall,   // Stall signal
    output  reg [31:0]  pc_out      // PC to IF stage
    );
    // A simple register
    // Do not update PC if IF stage is stalled.
    always @(posedge clk ) begin
        pc_out <= (rst) ? `ADA_RESET_DEFAULT : ((if_stall) ? pc_out : pc_in);
    end
endmodule