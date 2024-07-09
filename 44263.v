module bsg_sync_sync_``width_p``_unit                           \
  (                                                             \
   input oclk_i                                                 \
   , input  [width_p-1:0] iclk_data_i                           \
   , output [width_p-1:0] oclk_data_o // after sync flops       \
   );                                                           \
                                                                \
                                                                \
   `rp_group (bss_bank)                                         \
   `rp_place (hier bss_1 0 0)                                   \
   `rp_place (hier bss_2 1 0)                                   \
   `rp_endgroup (bss_bank)                                      \
                                                                \
   logic [width_p-1:0] bsg_SYNC_1_r;                            \
   logic [width_p-1:0] bsg_SYNC_2_r;                            \
                                                                \
   assign oclk_data_o = bsg_SYNC_2_r;                           \
                                                                \
   always_ff @(posedge oclk_i)                                  \
     begin                                                      \
        `rp_group(bss_1)                                        \
        `rp_fill(0 0 UX)                                        \
        `rp_array_dir(up)                                       \
        `rp_endgroup(bss_1)                                     \
        bsg_SYNC_1_r <= iclk_data_i;                            \
     end                                                        \
                                                                \
   always_ff @(posedge oclk_i)                                  \
     begin                                                      \
        `rp_group(bss_2)                                        \
        `rp_fill(0 0 UX)                                        \
        `rp_array_dir(up)                                       \
        `rp_endgroup(bss_2)                                     \
        bsg_SYNC_2_r <= bsg_SYNC_1_r;                           \
     end                                                        \
                                                                \
endmodule