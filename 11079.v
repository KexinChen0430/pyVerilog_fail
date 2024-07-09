module fifo_buffer_single_clock_fifo (
                                                   // inputs:
                                                    aclr,
                                                    clock,
                                                    data,
                                                    rdreq,
                                                    wrreq,
                                                   // outputs:
                                                    empty,
                                                    full,
                                                    q
                                                 )
;
  parameter FIFO_DEPTHS = 2;
  parameter FIFO_WIDTHU = 1;
  output           empty;
  output           full;
  output  [ 35: 0] q;
  input            aclr;
  input            clock;
  input   [ 35: 0] data;
  input            rdreq;
  input            wrreq;
  wire             empty;
  wire             full;
  wire    [ 35: 0] q;
  scfifo single_clock_fifo
    (
      .aclr (aclr),
      .clock (clock),
      .data (data),
      .empty (empty),
      .full (full),
      .q (q),
      .rdreq (rdreq),
      .wrreq (wrreq)
    );
  defparam single_clock_fifo.add_ram_output_register = "OFF",
           single_clock_fifo.lpm_numwords = FIFO_DEPTHS,
           single_clock_fifo.lpm_showahead = "OFF",
           single_clock_fifo.lpm_type = "scfifo",
           single_clock_fifo.lpm_width = 36,
           single_clock_fifo.lpm_widthu = FIFO_WIDTHU,
           single_clock_fifo.overflow_checking = "ON",
           single_clock_fifo.underflow_checking = "ON",
           single_clock_fifo.use_eab = "OFF";
endmodule