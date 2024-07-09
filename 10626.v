module stratixv_read_fifo_read_enable (
                           re,
                           rclk,
                           plus2,
                           areset,
                           reout,
                           plus2out
                          );
    parameter use_stalled_read_enable = "false";
    input re;
    input rclk;
    input plus2;
    input areset;
    output reout;
    output plus2out;
    stratixv_read_fifo_read_enable_encrypted inst (
    	.re(re),
    	.rclk(rclk),
    	.plus2(plus2),
    	.areset(areset),
    	.reout(reout),
    	.plus2out(plus2out));
    defparam inst.use_stalled_read_enable = use_stalled_read_enable;
endmodule