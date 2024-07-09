module my_ADI1MUX_BDI1 (input clk, input [15:0] din, output [15:0] dout);
    parameter LOC = "";
    parameter BELO="C6LUT";
    parameter BELI="A6LUT";
    wire mc31c;
    //wire da = din[6];
    (* LOC=LOC, BEL=BELO *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) lutb (
            .Q(dout[0]),
            .Q31(mc31c),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(din[7]));
    (* LOC=LOC, BEL=BELI *)
    SRLC32E #(
            .INIT(32'h00000000),
            .IS_CLK_INVERTED(1'b0)
        ) luta (
            .Q(dout[1]),
            .Q31(dout[2]),
            .A(din[4:0]),
            .CE(din[5]),
            .CLK(din[6]),
            .D(mc31c));
endmodule