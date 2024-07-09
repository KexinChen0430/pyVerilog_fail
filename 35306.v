module my_SRLC32E (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    parameter BEL="A6LUT";
    wire mc31c;
    (* LOC=LOC, BEL=BEL *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) lut (
            .Q(dout[0]),
            .Q31(mc31c),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
endmodule