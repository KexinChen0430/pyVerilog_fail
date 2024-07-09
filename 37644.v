module)?
fifo_same_clock_fill  #( .DATA_WIDTH(8),.DATA_DEPTH(5))
    wresp_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (fifo_wd_rd_dly),
        .re           (wresp_re), // not allowing RE next cycle after bvalid
        .data_in      ({bid_in[5:0],bresp_in[1:0]}),
        .data_out     ({bid[5:0],bresp[1:0]}),
        .nempty       (), //bvalid),
        .half_full    (), //),
        .under        (), //wresp_under),       // output reg
        .over         (), //wresp_over),        // output reg
        .wcount       (), //wresp_wcount),      // output[3:0] reg
        .rcount       (), //wresp_rcount),      // output[3:0] reg
        .wnum_in_fifo (), // wresp_num_in_fifo) // output[3:0]
        .rnum_in_fifo (wresp_num_in_fifo)       // wresp_num_in_fifo) // output[3:0]
    );
endmodule