module my_RAM256X1S (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM256X1S #(
        ) RAM256X1S (
            .O(dout[0]),
            .A({din[0], din[7:0]}),
            .D(din[0]),
            .WCLK(din[1]),
            .WE(din[2]));
endmodule