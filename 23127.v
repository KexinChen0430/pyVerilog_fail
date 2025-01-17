module sgdma_rx_command_fifo (
                               // inputs:
                                clk,
                                command_fifo_data,
                                command_fifo_rdreq,
                                command_fifo_wrreq,
                                reset,
                               // outputs:
                                command_fifo_empty,
                                command_fifo_full,
                                command_fifo_q
                             )
;
  output           command_fifo_empty;
  output           command_fifo_full;
  output  [103: 0] command_fifo_q;
  input            clk;
  input   [103: 0] command_fifo_data;
  input            command_fifo_rdreq;
  input            command_fifo_wrreq;
  input            reset;
  wire             command_fifo_empty;
  wire             command_fifo_full;
  wire    [103: 0] command_fifo_q;
  scfifo sgdma_rx_command_fifo_command_fifo
    (
      .aclr (reset),
      .clock (clk),
      .data (command_fifo_data),
      .empty (command_fifo_empty),
      .full (command_fifo_full),
      .q (command_fifo_q),
      .rdreq (command_fifo_rdreq),
      .wrreq (command_fifo_wrreq)
    );
  defparam sgdma_rx_command_fifo_command_fifo.add_ram_output_register = "ON",
           sgdma_rx_command_fifo_command_fifo.intended_device_family = "STRATIXIV",
           sgdma_rx_command_fifo_command_fifo.lpm_numwords = 2,
           sgdma_rx_command_fifo_command_fifo.lpm_showahead = "OFF",
           sgdma_rx_command_fifo_command_fifo.lpm_type = "scfifo",
           sgdma_rx_command_fifo_command_fifo.lpm_width = 104,
           sgdma_rx_command_fifo_command_fifo.lpm_widthu = 1,
           sgdma_rx_command_fifo_command_fifo.overflow_checking = "ON",
           sgdma_rx_command_fifo_command_fifo.underflow_checking = "ON",
           sgdma_rx_command_fifo_command_fifo.use_eab = "ON";
endmodule