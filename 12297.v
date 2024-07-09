module my_NDI1MUX_NI (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "SLICE_X6Y100";
    (* LOC=LOC, BEL="D6LUT" *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) lutd (
            .Q(dout[0]),
            .Q31(),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
    (* LOC=LOC, BEL="C6LUT" *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) lutc (
            .Q(dout[1]),
            .Q31(),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
    (* LOC=LOC, BEL="B6LUT" *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) lutb (
            .Q(dout[2]),
            .Q31(),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
    (* LOC=LOC, BEL="A6LUT" *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) luta (
            .Q(dout[3]),
            .Q31(),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
endmodule