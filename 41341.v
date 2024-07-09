module demoscene_scroll(input wire clk,
        input wire [DIN_N-1:0] din, output wire [DOUT_N-1:0] dout);
    parameter DIN_N = `DIN_N;
    parameter DOUT_N = `DOUT_N;
    reg [26:0] div;
    always @(posedge clk) begin
        div <= div + 1'b1;
    end
    wire randbit;
    lfsr2 lfsr(.clk(clk), .dout(randbit));
    reg [7:0] leds = 8'hCC;
    reg last;
    reg tick;
    always @(posedge clk) begin
        last <= div[23];
        tick <= div[23] ^ last;
        if (tick) begin
            leds = {leds, randbit};
        end
    end
    assign dout = leds;
endmodule