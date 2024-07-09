module musb_pc_register(
    input               clk,        // main clock
    input               rst,        // main reset
    input       [31:0]  if_new_pc,  // New PC.
    input               if_stall,   // Stall signal (freeze the registered value).
    output  reg [31:0]  if_pc       // PC to Instruction Memory/ICache
    );
    // A simple register
    // Do not update PC if IF stage is stalled.
    always @(posedge clk ) begin
        if_pc <= (rst) ? `MUSB_VECTOR_BASE_RESET : ((if_stall) ? if_pc : if_new_pc);
    end
endmodule