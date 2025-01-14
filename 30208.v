module address_generator_tb;
    parameter MEM_ADDR_WIDTH = 24;
    parameter STRAND_PARAM_WIDTH = 16;
    reg clk = 0;
    reg rst_n = 1;
    reg [STRAND_PARAM_WIDTH-1:0] strand_offset = 0;
    reg [STRAND_PARAM_WIDTH-1:0] strand_idx = 0;
    reg [STRAND_PARAM_WIDTH-1:0] strand_length = 100;
    wire [MEM_ADDR_WIDTH-1:0] addr;
    // UUT
    address_generator #(MEM_ADDR_WIDTH) ag_inst (
            .clk(clk),
            .rst_n(rst_n),
            .strand_offset(strand_offset),
            .strand_idx(strand_idx),
            .strand_length(strand_length),
            .addr(addr)
        );
    // Clock process
    always #10 clk = !clk;
    // Test process
    initial begin
        $dumpfile("address_generator_tb.vcd");
        $dumpvars(0, address_generator_tb);
        #10 rst_n = 0;
        #10 rst_n = 1;
        #10 strand_offset = 320;
        strand_idx = 1;
        #20 strand_idx = 50;
        #20 strand_idx = 99;
        #20 strand_idx = 100;
        #20 strand_idx = 101;
        #20 strand_offset = 640;
        strand_idx = 1;
        #20 strand_idx = 50;
        #20 strand_idx = 100;
        #20 strand_idx = 101;
        #500 $finish;
    end
endmodule