module my_RAM64X1S (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    parameter BEL="A6LUT";
    (* LOC=LOC, BEL=BEL, KEEP, DONT_TOUCH *)
    RAM64X1S #(
        ) RAM64X1S (
            .O(dout[0]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .A5(din[5]),
            .D(din[6]),
            .WCLK(clk),
            .WE(din[0]));
endmodule