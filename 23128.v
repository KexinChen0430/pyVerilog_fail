module sgdma_rx_desc_address_fifo (
                                    // inputs:
                                     clk,
                                     desc_address_fifo_data,
                                     desc_address_fifo_rdreq,
                                     desc_address_fifo_wrreq,
                                     reset,
                                    // outputs:
                                     desc_address_fifo_empty,
                                     desc_address_fifo_full,
                                     desc_address_fifo_q
                                  )
;
  output           desc_address_fifo_empty;
  output           desc_address_fifo_full;
  output  [ 31: 0] desc_address_fifo_q;
  input            clk;
  input   [ 31: 0] desc_address_fifo_data;
  input            desc_address_fifo_rdreq;
  input            desc_address_fifo_wrreq;
  input            reset;
  wire             desc_address_fifo_empty;
  wire             desc_address_fifo_full;
  wire    [ 31: 0] desc_address_fifo_q;
  scfifo sgdma_rx_desc_address_fifo_desc_address_fifo
    (
      .aclr (reset),
      .clock (clk),
      .data (desc_address_fifo_data),
      .empty (desc_address_fifo_empty),
      .full (desc_address_fifo_full),
      .q (desc_address_fifo_q),
      .rdreq (desc_address_fifo_rdreq),
      .wrreq (desc_address_fifo_wrreq)
    );
  defparam sgdma_rx_desc_address_fifo_desc_address_fifo.add_ram_output_register = "ON",
           sgdma_rx_desc_address_fifo_desc_address_fifo.intended_device_family = "STRATIXIV",
           sgdma_rx_desc_address_fifo_desc_address_fifo.lpm_numwords = 2,
           sgdma_rx_desc_address_fifo_desc_address_fifo.lpm_showahead = "OFF",
           sgdma_rx_desc_address_fifo_desc_address_fifo.lpm_type = "scfifo",
           sgdma_rx_desc_address_fifo_desc_address_fifo.lpm_width = 32,
           sgdma_rx_desc_address_fifo_desc_address_fifo.lpm_widthu = 1,
           sgdma_rx_desc_address_fifo_desc_address_fifo.overflow_checking = "ON",
           sgdma_rx_desc_address_fifo_desc_address_fifo.underflow_checking = "ON",
           sgdma_rx_desc_address_fifo_desc_address_fifo.use_eab = "OFF";
endmodule