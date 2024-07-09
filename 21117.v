module my_RAM128X1D (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM128X1D #(
            .INIT(128'h0),
            .IS_WCLK_INVERTED(1'b0)
        ) RAM128X1D (
            .DPO(dout[0]),
            .SPO(dout[1]),
            .D(din[0]),
            .WCLK(clk),
            .WE(din[2]));
endmodule