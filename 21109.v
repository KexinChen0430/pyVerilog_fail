module my_RAM64X1D_2 (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM64X1D #(
            .INIT(64'h0),
            .IS_WCLK_INVERTED(1'b0)
        ) ramb (
            .DPO(dout[1]),
            .D(din[0]),
            .WCLK(clk),
            .WE(din[2]),
            .A0(din[3]),
            .A1(din[4]),
            .A2(din[5]),
            .A3(din[6]),
            .A4(din[7]),
            .A5(din[0]),
            .DPRA0(din[1]),
            .DPRA1(din[2]),
            .DPRA2(din[3]),
            .DPRA3(din[4]),
            .DPRA4(din[5]),
            .DPRA5(din[6]));
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM64X1D #(
            .INIT(64'h0),
            .IS_WCLK_INVERTED(1'b0)
        ) rama (
            .DPO(dout[0]),
            .D(din[0]),
            .WCLK(clk),
            .WE(din[2]),
            .A0(din[3]),
            .A1(din[4]),
            .A2(din[5]),
            .A3(din[6]),
            .A4(din[7]),
            .A5(din[0]),
            .DPRA0(din[1]),
            .DPRA1(din[2]),
            .DPRA2(din[3]),
            .DPRA3(din[4]),
            .DPRA4(din[5]),
            .DPRA5(din[6]));
endmodule