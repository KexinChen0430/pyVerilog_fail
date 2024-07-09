module my_SRL16E_4 (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, BEL="D6LUT" *)
    SRL16E #(
        ) lutd (
            .Q(dout[3]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
    (* LOC=LOC, BEL="C6LUT" *)
    SRL16E #(
        ) lutc (
            .Q(dout[2]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
    (* LOC=LOC, BEL="B6LUT" *)
    SRL16E #(
        ) lutb (
            .Q(dout[1]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
    (* LOC=LOC, BEL="A6LUT" *)
    SRL16E #(
        ) luta (
            .Q(dout[0]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
endmodule