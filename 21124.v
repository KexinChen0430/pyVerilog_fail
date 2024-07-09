module my_RAM32X1S (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    parameter BEL="A6LUT";
    (* LOC=LOC, BEL=BEL, KEEP, DONT_TOUCH *)
    RAM32X1S #(
        ) RAM32X1S (
            .O(dout[0]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .D(din[5]),
            .WCLK(din[6]),
            .WE(din[7]));
endmodule