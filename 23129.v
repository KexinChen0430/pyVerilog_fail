module sgdma_rx_status_token_fifo (
                                    // inputs:
                                     clk,
                                     reset,
                                     status_token_fifo_data,
                                     status_token_fifo_rdreq,
                                     status_token_fifo_wrreq,
                                    // outputs:
                                     status_token_fifo_empty,
                                     status_token_fifo_full,
                                     status_token_fifo_q
                                  )
;
  output           status_token_fifo_empty;
  output           status_token_fifo_full;
  output  [ 23: 0] status_token_fifo_q;
  input            clk;
  input            reset;
  input   [ 23: 0] status_token_fifo_data;
  input            status_token_fifo_rdreq;
  input            status_token_fifo_wrreq;
  wire             status_token_fifo_empty;
  wire             status_token_fifo_full;
  wire    [ 23: 0] status_token_fifo_q;
  scfifo sgdma_rx_status_token_fifo_status_token_fifo
    (
      .aclr (reset),
      .clock (clk),
      .data (status_token_fifo_data),
      .empty (status_token_fifo_empty),
      .full (status_token_fifo_full),
      .q (status_token_fifo_q),
      .rdreq (status_token_fifo_rdreq),
      .wrreq (status_token_fifo_wrreq)
    );
  defparam sgdma_rx_status_token_fifo_status_token_fifo.add_ram_output_register = "ON",
           sgdma_rx_status_token_fifo_status_token_fifo.intended_device_family = "STRATIXIV",
           sgdma_rx_status_token_fifo_status_token_fifo.lpm_numwords = 2,
           sgdma_rx_status_token_fifo_status_token_fifo.lpm_showahead = "OFF",
           sgdma_rx_status_token_fifo_status_token_fifo.lpm_type = "scfifo",
           sgdma_rx_status_token_fifo_status_token_fifo.lpm_width = 24,
           sgdma_rx_status_token_fifo_status_token_fifo.lpm_widthu = 1,
           sgdma_rx_status_token_fifo_status_token_fifo.overflow_checking = "ON",
           sgdma_rx_status_token_fifo_status_token_fifo.underflow_checking = "ON",
           sgdma_rx_status_token_fifo_status_token_fifo.use_eab = "ON";
endmodule