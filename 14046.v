module roi_prop_b(input clk, input [255:0] din, output [255:0] dout);
    (* LOC="D19", KEEP, DONT_TOUCH *)
    //(* KEEP, DONT_TOUCH *)
    (* KEEP, DONT_TOUCH *)
    OBUFT #(
        .DRIVE(12),
        .IOSTANDARD("DEFAULT"),
        .SLEW("SLOW")
    ) dut (
        //.O(dout[1]),
        .O(),
        .I(din[0]),
        .T(din[1]));
endmodule