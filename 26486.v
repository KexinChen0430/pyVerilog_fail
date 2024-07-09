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
  // FIFO RAM interface
  assign o_ram_a_clk   = a_clk;
  assign o_ram_a_wdata = a_wdata;
  assign a_rdata  = i_ram_a_rdata;
  assign o_ram_a_addr  = a_addr;
  assign o_ram_a_rinc  = a_rinc & !a_dir;
  assign o_ram_a_winc  = a_winc & a_dir;
  assign o_ram_b_clk   = b_clk;
  assign o_ram_b_wdata = b_wdata;
  assign b_rdata  = i_ram_b_rdata;
  assign o_ram_b_addr  = b_addr;
  assign o_ram_b_rinc  = b_rinc & !b_dir;
  assign o_ram_b_winc  = b_winc & b_dir;
endmodule