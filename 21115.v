module my_RAM64X2S (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM64X2S #(
        ) RAM64X2S (
            .O0(dout[0]),
            .O1(dout[1]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .A5(din[5]),
            .D0(din[6]),
            .D1(din[7]),
            .WCLK(clk),
            .WE(din[1]));
endmodule