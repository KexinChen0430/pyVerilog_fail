module is not reset and even bitsteram relaod will not work, so hrst input is used just as disable paying attention
    // to other inputs, doe s not reset anything inside.
    // FPGA should not be reset /reloaded if there are any outstanding transactions not aborted
    // Current implementation counts all transactions and relies on it - not on afi_*count. TODO: Implement recovering from mismatch
    axi_hp_abort axi_hp_abort_i (
        .hclk          (hclk),              // input
        .hrst          (hrst),              // input
        .abort         (abort_or_reset),    // input
        .busy          (aborting),          // output
        .done          (abort_done_hclk),   // output reg
        .afi_awvalid   (afi_awvalid),       // input
        .afi_awready   (afi_awready),       // input
        .afi_awid      (afi_awid),          // input[5:0]
        .afi_awlen     (afi_awlen),         // input[3:0]
        .afi_wvalid_in (afi_wvalid),        // input
        .afi_wready    (afi_wready),        // input
        .afi_wvalid    (afi_wvalid_abort),  // output
        .afi_wid       (afi_wid_abort),     // output[5:0] reg
        .afi_arvalid   (afi_arvalid),       // input
        .afi_arready   (afi_arready),       // input
        .afi_arlen     (afi_arlen),         // input[3:0]
        .afi_rready_in (afi_rready),        // input
        .afi_rvalid    (afi_rvalid),        // input
        .afi_rready    (afi_rready_abort),  // output
        .afi_wlast     (afi_wlast_abort),   // output
        .afi_racount   (afi_racount),       // input[2:0]
        .afi_rcount    (afi_rcount),        // input[7:0]
        .afi_wacount   (afi_wacount),       // input[5:0]
        .afi_wcount    (afi_wcount),        // input[7:0]
        .dirty         (afi_dirty),         // output reg
        .axi_mismatch  (axi_mismatch),      // output_reg
        .debug         (abort_debug)        // output[21:0]
    );
    ahci_dma_rd_fifo #( // memory to device
        .WCNT_BITS    (21),
        .ADDRESS_BITS (3)
    ) ahci_dma_rd_fifo_i (
        .mrst         (mrst || abort_busy_mclk),     // input
        .hrst         (hrst || cmd_abort_hclk),      // input
        .mclk         (mclk),                        // input
        .hclk         (hclk),                        // input
        .wcnt         (wcount[21:1]),                // input[20:0]
        .woffs        (data_addr[2:1]),              // input[1:0]
        .start        (prd_rd),                      // input
        .din          (afi_rdata),                   // input[63:0]
        .din_av       (afi_rvalid),                  // input
        .din_av_many  (|afi_rcount[7:SAFE_RD_BITS]), // input
        .last_prd     (last_prd),                    // input
        .din_re       (data_afi_re),                 // output
        .done         (done_dev_wr),                 // output reg // @ hclk
        .done_flush   (done_flush),                  // output     // @ hclk
        .dout         (sys_out),                     // output[31:0]
        .dout_vld     (sys_dav),                     // output
        .dout_re      (sys_re),                      // input
        .last_DW      (last_h2d_data)                // output
       ,.debug_dma_h2d(debug_dma_h2d)                // output[31:0]
    );
    ahci_dma_wr_fifo #( // device to memory
        .WCNT_BITS    (21),
        .ADDRESS_BITS (3)
    ) ahci_dma_wr_fifo_i (
        .mrst         (mrst || abort_busy_mclk),     // input
        .hrst         (hrst ||cmd_abort_hclk),       // input
        .mclk         (mclk),                        // input
        .hclk         (hclk),                        // input
        .wcnt         (wcount[21:1]),                // input[20:0]
        .woffs        (data_addr[2:1]),              // input[1:0]
        .init         (cmd_start_hclk),              // input
        .start        (prd_wr),                      // input
        .dout         (afi_wdata),                   // output[63:0] reg
//        .dout_av      (), // input
        .dout_av_many (afi_wcount_many),             // input
        .last_prd     (last_prd),                    // input
        .dout_we      (afi_wvalid_data),             // output
        .dout_wstb    (afi_wstb4),                   // output[3:0] reg
        .done         (done_dev_rd),                 // output reg
        .busy         (),                            // output
        .fifo_nempty_mclk  (fifo_nempty_mclk),       // output reg
        .din          (sys_in),                      // input[31:0]
        .din_rdy      (sys_nfull),                   // output
        .din_avail    (sys_we)                       // input
    );
    // mclk -> hclk cross-clock synchronization
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) cmd_start_hclk_i (
        .rst       (mrst),            // input
        .src_clk   (mclk),            // input
        .dst_clk   (hclk),            // input
        .in_pulse  (cmd_start),       // input
        .out_pulse (cmd_start_hclk),    // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) cmd_abort_hclk_i (
        .rst       (mrst),            // input
        .src_clk   (mclk),            // input
        .dst_clk   (hclk),            // input
        .in_pulse  (abort_rq_mclk),   // input
        .out_pulse (cmd_abort_hclk),  // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) prd_start_hclk_i (
        .rst       (mrst),            // input
        .src_clk   (mclk),            // input
        .dst_clk   (hclk),            // input
        .in_pulse  (prd_start_r),     // input
        .out_pulse (prd_start_hclk),  // output
        .busy()                       // output
    );
    // hclk -> mclk;
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) cmd_done_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (cmd_done_hclk),   // input
        .out_pulse (cmd_done),        // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) ct_done_mclk_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (ct_done),         // input
        .out_pulse (ct_done_mclk),    // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) prd_done_mclk_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (prd_done_hclk),   // input
        .out_pulse (prd_done),        // output
        .busy()                       // output
    );
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) abort_done_i (
        .rst       (hrst),            // input
        .src_clk   (hclk),            // input
        .dst_clk   (mclk),            // input
        .in_pulse  (abort_done_hclk), // input
        .out_pulse (abort_done_mclk), // output
        .busy()                       // output
    );
//abort_done_hclk
reg [7:0] dbg_afi_awvalid_cntr;
reg [7:0] dbg_qwcount;
reg [7:0] dbg_qwcount_cntr;
reg [7:0] dbg_set_raddr_count;
reg [7:0] dbg_set_waddr_count;
reg       dbg_was_mismatch;
//        if (axi_set_raddr_w || axi_set_waddr_w) begin
//data_next_burst
always @ (posedge hclk) begin
    if      (hrst)            dbg_afi_awvalid_cntr <= 0;
    else if (axi_set_waddr_r) dbg_afi_awvalid_cntr <= dbg_afi_awvalid_cntr + 1;
//    if      (hrst)            dbg_last_afi_len <= 0;
    if (axi_set_raddr_w || axi_set_waddr_w) begin
    end
    if      (wcount_set)          dbg_qwcount <= wcount_plus_data_addr[14:7];
//        if      (wcount_set)          qwcount[22:7] <= {1'b0,wcount_plus_data_addr[21:7]}; // wcount[21:1] + data_addr[2:1]; //minus 1
    if       (hrst)      dbg_qwcount_cntr <= 0;
//    else if (wcount_set) dbg_qwcount_cntr <= dbg_qwcount_cntr + 1;
//    else if (data_next_burst) dbg_qwcount_cntr <= dbg_qwcount_cntr + 1;
    else if (!qwcount[22] && axi_set_addr_data_w && (|qwcount[21:7])) dbg_qwcount_cntr <= dbg_qwcount_cntr + 1;
    if       (hrst)           dbg_set_raddr_count <= 0;
//    else if (axi_set_raddr_w) dbg_set_raddr_count <= dbg_set_raddr_count + 1;
    else if (axi_set_raddr_ready && raddr_data_pend) dbg_set_raddr_count <= dbg_set_raddr_count + 1;
    if       (hrst)                                  dbg_set_waddr_count <= 0;
//    else if (axi_set_waddr_w) dbg_set_waddr_count <= dbg_set_waddr_count + 1;
//    else if (axi_set_waddr_ready && waddr_data_pend) dbg_set_waddr_count <= dbg_set_waddr_count + 1; //0x14
    else if (addr_data_rq_w) dbg_set_waddr_count <= dbg_set_waddr_count + 1; //0x14
    if      (hrst)         dbg_was_mismatch <= 0;
    else if (axi_mismatch) dbg_was_mismatch <= 1;
end
assign debug_out =  {int_data_addr [3:0],
                     qwcount_done, // prd_rd_busy,
                     afi_racount   [2:0],
                     afi_rcount    [7:0],
                     ct_busy,
                     cmd_busy,
                     afi_wacount   [5:0],
                     afi_wcount    [7:0]};
/*
assign debug_out =  {
                     qwcount[22:7],
                     dev_rd_id,
                     dev_wr_id,
                     prd_id,
                     ct_id
};
assign debug_out =  {qwcount_done,
                     2'b0,
                     dev_wr_id,
                     prd_id,
                     wcount[21:1]
};
assign debug_out1 = { //dbg_set_raddr_count[7:0],
                     qwcount_done,
                     afi_rcount[6:0],
                      //{qwcount[22], qwcount[13:7]},
                     dbg_set_waddr_count[7:0],
                     dbg_qwcount[3:0],
                     afi_alen[3:0],
                     dbg_qwcount_cntr[7:0]};
*/
assign debug_out1 = { //dbg_set_raddr_count[7:0]
                     8'b0 ,
                     dbg_was_mismatch,
                     1'b0,
                     abort_debug[21:0]}; //    {aw_count[5:0], w_count[7:0], r_count[7:0]};
endmodule