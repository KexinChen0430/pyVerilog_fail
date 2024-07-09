module handling the write requests
  // outputs valid when dir == 0 (b is writing)
  wptr_full #(ASIZE)
  b_wptr_inst
    (
     .wclk     (b_clk),
     .wrst_n   (b_rst_n),
     .winc     (b_winc),
     .wq2_rptr (a2b_rptr),
     .awfull   (b_afull),
     .wfull    (b_full),
     .waddr    (b_waddr),
     .wptr     (b_wptr)
     );
  // dir == 1 read pointer on b side calculation
  rptr_empty #(ASIZE)
  b_rptr_inst
    (
     .rclk     (b_clk),
     .rrst_n   (b_rst_n),
     .rinc     (b_rinc),
     .rq2_wptr (a2b_wptr),
     .arempty  (b_aempty),
     .rempty   (b_empty),
     .raddr    (b_raddr),
     .rptr     (b_rptr)
     );
  // FIFO RAM
  fifomem_dp #(DSIZE, ASIZE, FALLTHROUGH)
  fifomem_dp
    (
     .a_clk   (a_clk),
     .a_wdata (a_wdata),
     .a_rdata (a_rdata),
     .a_addr  (a_addr),
     .a_rinc  (a_rinc & !a_dir),
     .a_winc  (a_winc & a_dir),
     .b_clk   (b_clk),
     .b_wdata (b_wdata),
     .b_rdata (b_rdata),
     .b_addr  (b_addr),
     .b_rinc  (b_rinc & !b_dir),
     .b_winc  (b_winc & b_dir)
     );
endmodule