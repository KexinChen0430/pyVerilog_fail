module my_SRL16E_8 (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, BEL="D6LUT" *)
    SRL16E #(
        ) lutd2 (
            .Q(dout[7]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
    (* LOC=LOC, BEL="D6LUT" *)
    SRL16E #(
        ) lutd1 (
            .Q(dout[6]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
endmodule