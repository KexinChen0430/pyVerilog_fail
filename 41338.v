module demoscene_counter(input wire clk,
        input wire [DIN_N-1:0] din, output wire [DOUT_N-1:0] dout);
    parameter DIN_N = `DIN_N;
    parameter DOUT_N = `DOUT_N;
    /*
    100 MHz clock
    Lets get MSB to 1 second
    Need 27 bits
    In [3]: math.log(100e6, 2)
    Out[3]: 26.5754247590989
    */
    reg [26:0] div;
    always @(posedge clk) begin
        div <= div + 1'b1;
    end
    assign dout = div[26:19];
endmodule