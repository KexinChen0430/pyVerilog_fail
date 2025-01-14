module memory
    #(parameter WIDTH = 7, DEPTH = 32, ADDR = 5)
    (// Globals Signals
    input  wire             clk, reset_b,
    input  wire             write,
    input  wire [ADDR -1:0] waddr, raddr,
    input  wire [WIDTH-1:0] wdata,
    output wire [WIDTH-1:0] rdata);
    integer i;
    reg [WIDTH-1:0] memory [DEPTH-1:0];
    /*************************************************************************
    assign rdata = memory [raddr]; // register file read operation
    always @(posedge clk, negedge reset_b) // register file write operation
        if (~reset_b) for (i = 0; i < DEPTH; i = i + 1) memory[i] <= 'd0;
        else if (write) memory [waddr] <= wdata;
endmodule