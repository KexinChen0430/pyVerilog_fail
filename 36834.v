module is a super-weapon for timing fix,
   // but it is tricky, think it harder when you are reading, or contact Bob Hu
  assign i_rdy = fifo_i_rdy;
  // The FIFO is bypassed when:
  wire byp = i_vld & o_rdy & (~fifo_o_vld);
  // FIFO o-ready just use the o_rdy
  assign fifo_o_rdy = o_rdy;
  // The output is valid if FIFO or input have valid
  assign o_vld = fifo_o_vld | i_vld;
  // The output data select the FIFO as high priority
  assign o_dat = fifo_o_vld ? fifo_o_dat : i_dat;
  assign fifo_i_dat  = i_dat;
  // Only pass to FIFO i-valid if FIFO is not bypassed
  assign fifo_i_vld = i_vld & (~byp);
endmodule