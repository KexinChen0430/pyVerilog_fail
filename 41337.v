module demoscene(input wire clk,
        input wire [DIN_N-1:0] din, output wire [DOUT_N-1:0] dout);
    parameter DIN_N = `DIN_N;
    parameter DOUT_N = `DOUT_N;
    //assign dout = 8'b10101010;
    demoscene_scroll dut(.clk(clk), .din(din), .dout(dout));
endmodule