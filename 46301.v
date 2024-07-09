module bsg_launch_sync_sync_``EDGE``_``bits``_unit                      \
  (input             iclk_i                                             \
  ,input             iclk_reset_i                                       \
  ,input             oclk_i                                             \
  ,input  [bits-1:0] iclk_data_i                                        \
  ,output [bits-1:0] iclk_data_o                                        \
  ,output [bits-1:0] oclk_data_o                                        \
  );                                                                    \
                                                                        \
  genvar i;                                                             \
                                                                        \
  logic [bits-1:0] bsg_SYNC_LNCH_r;                                     \
  logic [bits-1:0] bsg_SYNC_2_r;                                        \
                                                                        \
  assign iclk_data_o = bsg_SYNC_LNCH_r;                                 \
  assign oclk_data_o = bsg_SYNC_2_r;                                    \
                                                                        \
  always_ff @(EDGE iclk_i)                                              \
    begin                                                               \
      if (iclk_reset_i)                                                 \
        bsg_SYNC_LNCH_r <= {bits{1'b0}};                                \
      else                                                              \
        bsg_SYNC_LNCH_r <= iclk_data_i;                                 \
    end                                                                 \
                                                                        \
  for (i = 0; i < bits; i = i + 1)                                      \
    begin : blss_unit                                                   \
      SDFFYQ2D_X2N_A7P5PP96PTS_C16 hard_sync_int                        \
        (.D  (bsg_SYNC_LNCH_r[i])                                       \
        ,.CK (oclk_i)                                                   \
        ,.SI (1'b0)                                                     \
        ,.SE (1'b0)                                                     \
        ,.Q  (bsg_SYNC_2_r[i])                                          \
        );                                                              \
    end                                                                 \
                                                                        \
endmodule