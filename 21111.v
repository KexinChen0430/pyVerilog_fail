module my_SRL16E (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    parameter BEL="A6LUT";
    (* LOC=LOC, BEL=BEL, KEEP, DONT_TOUCH *)
    SRL16E #(
        ) SRL16E (
            .Q(dout[0]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .CE(din[4]),
            .CLK(din[5]),
            .D(din[6]));
endmodule