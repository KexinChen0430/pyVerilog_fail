module my_RAM64X1S_2_mux (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    assign dout[0] = din[0] ? oa : ob;
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM64X1S #(
        ) ramb (
            .O(ob),
            .A0(din[0]),
            .A1(din[0]),
            .A2(din[0]),
            .A3(din[0]),
            .A4(din[0]),
            .A5(din[0]),
            .D(din[0]),
            .WCLK(clk),
            .WE(din[0]));
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM64X1S #(
        ) rama (
            .O(oa),
            .A0(din[0]),
            .A1(din[0]),
            .A2(din[0]),
            .A3(din[0]),
            .A4(din[0]),
            .A5(din[0]),
            .D(din[0]),
            .WCLK(clk),
            .WE(din[0]));
endmodule