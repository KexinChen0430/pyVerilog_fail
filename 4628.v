module: based around a Dual port distributed ram
// data is written in and the read only starts once the da/sa have been
// stored.  Can cope with a gap of one cycle between packets.
address_swap address_swap (
   .axi_tclk                  (axi_tclk),
   .axi_tresetn               (axi_tresetn),
   .enable_address_swap       (enable_address_swap),
   .rx_axis_fifo_tdata        (rx_axis_tdata_int),
   .rx_axis_fifo_tvalid       (rx_axis_tvalid_int),
   .rx_axis_fifo_tlast        (rx_axis_tlast_int),
   .rx_axis_fifo_tready       (rx_axis_tready_int),
   .tx_axis_fifo_tdata        (tx_axis_as_tdata),
   .tx_axis_fifo_tvalid       (tx_axis_as_tvalid),
   .tx_axis_fifo_tlast        (tx_axis_as_tlast),
   .tx_axis_fifo_tready       (tx_axis_as_tready)
);
endmodule