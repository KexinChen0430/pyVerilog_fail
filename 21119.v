module my_RAM128X1S_2 (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM128X1S #(
        ) lutb (
            .O(dout[1]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .A5(din[5]),
            .A6(din[6]),
            .D(din[7]),
            .WCLK(din[0]),
            .WE(din[1]));
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM128X1S #(
        ) luta (
            .O(dout[0]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .A5(din[5]),
            .A6(din[6]),
            .D(din[7]),
            .WCLK(din[0]),
            .WE(din[1]));
endmodule