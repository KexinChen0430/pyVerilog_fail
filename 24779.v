module bsg_sync_sync_``width_p``_unit                           \
  (                                                             \
   input oclk_i                                                 \
   , input  [width_p-1:0] iclk_data_i                           \
   , output [width_p-1:0] oclk_data_o // after sync flops       \
   );                                                           \
                                                                \
   `rp_group (bss_bank)                                         \
   `rp_place (hier bss_1 0 0)                                   \
   `rp_endgroup (bss_bank)                                      \
                                                                \
  genvar i;                                                     \
                                                                \
   logic [width_p-1:0] bsg_SYNC_2_r;                            \
                                                                \
   assign oclk_data_o = bsg_SYNC_2_r;                           \
                                                                \
   for (i = 0; i < width_p; i = i + 1)                          \
     begin : bss_unit                                           \
       `rp_group(bss_1)                                         \
       `rp_fill(0 0 UX)                                         \
       `rp_array_dir(up)                                        \
       `rp_endgroup(bss_1)                                      \
       SC7P5T_SYNC2SDFFQX2_SSC14SL hard_sync_int                \
         (.D   (iclk_data_i[i])                                 \
         ,.CLK (oclk_i)                                         \
         ,.SI  (1'b0)                                           \
         ,.SE  (1'b0)                                           \
         ,.Q   (bsg_SYNC_2_r[i])                                \
         );                                                     \
     end                                                        \
                                                                \
endmodule