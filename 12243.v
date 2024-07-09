module ledput
);
// ============================================================================
// SW0 controls IOBUF.I
assign io_i = sw[0];
// SW1 controls IOBUF.T
assign io_t = sw[1];
// SW2 controls OBUF.I (JC.3)
assign jc3  = sw[2];
// LED0 swdicates IOBUF.O
assign led[0] = io_o;
// LED1 is connected to JC.1
assign led[1] = jc1;
// Unused IOs - SW->LED passthrough.
assign led[15:2] = {sw[15:3], 1'd0};
endmodule