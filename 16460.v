module peripheral_clock_crossing_upstream_fifo (
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
                                                  wrusedw
                                               )
;
  output  [ 32: 0] q;
  output           rdempty;
  output  [  5: 0] wrusedw;
  input            aclr;
  input   [ 32: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;
  wire    [ 32: 0] q;
  wire             rdempty;
  wire    [  5: 0] wrusedw;
  dcfifo upstream_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdreq (rdreq),
      .wrclk (wrclk),
      .wrreq (wrreq),
      .wrusedw (wrusedw)
    );
  defparam upstream_fifo.intended_device_family = "STRATIXIV",
           upstream_fifo.lpm_numwords = 64,
           upstream_fifo.lpm_showahead = "OFF",
           upstream_fifo.lpm_type = "dcfifo",
           upstream_fifo.lpm_width = 33,
           upstream_fifo.lpm_widthu = 6,
           upstream_fifo.overflow_checking = "ON",
           upstream_fifo.rdsync_delaypipe = 5,
           upstream_fifo.underflow_checking = "ON",
           upstream_fifo.use_eab = "ON",
           upstream_fifo.wrsync_delaypipe = 5;
endmodule