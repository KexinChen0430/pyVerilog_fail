module roi_prop_a(input clk, input [255:0] din, output [255:0] dout);
    assign dout[0] = din[0] & din[1];
    //(* LOC="D19", KEEP, DONT_TOUCH *)
    (* KEEP, DONT_TOUCH *)
    IOBUF #(
        .DRIVE(8),
        .IBUF_LOW_PWR("TRUE"),
        .IOSTANDARD("DEFAULT"),
        .SLEW("SLOW")
    ) dut (
        .O(dout[1]),
        .I(din[0]),
        .T(din[1]));
endmodule