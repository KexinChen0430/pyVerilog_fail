module my_RAM32X1D (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM32X1D #(
        ) RAM32X1D (
            .DPO(dout[0]),
            .SPO(dout[1]),
            .A0(din[0]),
            .A1(din[1]),
            .A2(din[2]),
            .A3(din[3]),
            .A4(din[4]),
            .D(din[5]),
            .DPRA0(din[6]),
            .DPRA1(din[7]),
            .DPRA2(din[0]),
            .DPRA3(din[1]),
            .DPRA4(din[2]),
            .WCLK(din[3]),
            .WE(din[4]));
endmodule