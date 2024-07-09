module peripheral_clock_crossing_downstream_fifo (
                                                   // inputs:
                                                    aclr,
                                                    data,
                                                    rdclk,
                                                    rdreq,
                                                    wrclk,
                                                    wrreq,
                                                   // outputs:
                                                    q,
                                                    rdempty,
                                                    wrfull
                                                 )
;
  output  [ 45: 0] q;
  output           rdempty;
  output           wrfull;
  input            aclr;
  input   [ 45: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;
  wire    [ 45: 0] q;
  wire             rdempty;
  wire             wrfull;
  dcfifo downstream_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdreq (rdreq),
      .wrclk (wrclk),
      .wrfull (wrfull),
      .wrreq (wrreq)
    );
  defparam downstream_fifo.intended_device_family = "STRATIXIV",
           downstream_fifo.lpm_numwords = 16,
           downstream_fifo.lpm_showahead = "OFF",
           downstream_fifo.lpm_type = "dcfifo",
           downstream_fifo.lpm_width = 46,
           downstream_fifo.lpm_widthu = 4,
           downstream_fifo.overflow_checking = "ON",
           downstream_fifo.rdsync_delaypipe = 5,
           downstream_fifo.underflow_checking = "ON",
           downstream_fifo.use_eab = "ON",
           downstream_fifo.wrsync_delaypipe = 5;
endmodule