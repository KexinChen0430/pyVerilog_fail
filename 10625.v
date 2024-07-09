module stratixv_read_fifo (
                           datain,
                           wclk,
                           we,
                           rclk,
                           re,
                           areset,
                           plus2,
                           dataout
                          );
    parameter use_half_rate_read = "false";
    parameter sim_wclk_pre_delay = 0;
    input [1:0] datain;
    input wclk;
    input we;
    input rclk;
    input re;
    input areset;
    input plus2;
    output [3:0]dataout;
    stratixv_read_fifo_encrypted inst (
    	.datain(datain),
        .wclk(wclk),
        .we(we),
        .rclk(rclk),
        .re(re),
        .areset(areset),
        .plus2(plus2),
        .dataout(dataout));
    defparam inst.use_half_rate_read = use_half_rate_read;
    defparam inst.sim_wclk_pre_delay = sim_wclk_pre_delay;
endmodule