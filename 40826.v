module bsg_dram_clk_gen #
  (parameter num_lines_p        = 1
  ,parameter downsample_width_p = 8
  ,parameter num_adgs_p         = 1
  ,parameter version_p          = 2)      // alternative, use version_p = 2
  (input  bsg_tag_s         bsg_osc_tag_i
  ,input  bsg_tag_s         bsg_osc_trigger_tag_i // used only by version_p = 2
  ,input  bsg_tag_s         bsg_ds_tag_i
  ,input                    async_osc_reset_i
  ,output                   osc_clk_o
  ,output                   div_clk_o
  ,input  [num_lines_p-1:0] dly_clk_i
  ,output [num_lines_p-1:0] dly_clk_o);
  genvar i;
  localparam debug_level_lp = 0;
  // Clock Generator (CG) Instance
// if statement is nice but messes up naming in bsg_clk_gen_timing.tcl .. fix later
// maybe by adding unused input to bsg_clk_gen_osc
/*
  if (version_p == 1)
    begin: v1
       bsg_clk_gen_osc #(.num_adgs_p(num_adgs_p))  clk_gen_osc_inst
         (
          .bsg_tag_i          (bsg_osc_tag_i    )
          ,.async_reset_i     (async_osc_reset_i)
          ,.clk_o             (osc_clk_out      )
          );
    end
  else
    begin: v2
 */
  bsg_clk_gen_osc #
    (.num_adgs_p        ( num_adgs_p            ))
  clk_gen_osc_inst
    (.bsg_tag_i         ( bsg_osc_tag_i         )
    ,.bsg_tag_trigger_i ( bsg_osc_trigger_tag_i )
    ,.async_reset_i     ( async_osc_reset_i     )
    ,.clk_o             ( osc_clk_o             ));
/*    end */
  `declare_bsg_clk_gen_ds_tag_payload_s(downsample_width_p)
  bsg_clk_gen_ds_tag_payload_s ds_tag_payload_r;
  wire ds_tag_payload_new_r;
  // fixme: maybe wire up a default and deal with reset issue?
  // downsampler bsg_tag interface
  bsg_tag_client #
    (.width_p       ( $bits(bsg_clk_gen_ds_tag_payload_s) )
    ,.default_p     ( 0                                   )
    ,.harden_p      ( 1                                   ))
  btc_ds
    (.bsg_tag_i(bsg_ds_tag_i)
    ,.recv_clk_i    ( osc_clk_o            )
    ,.recv_reset_i  ( 1'b0                 )   // node must be programmed by bsg tag
    ,.recv_new_r_o  ( ds_tag_payload_new_r )   // we don't require notification
    ,.recv_data_r_o ( ds_tag_payload_r     ));
  if (debug_level_lp > 1)
  always @(negedge osc_clk_o)
    if (ds_tag_payload_new_r)
      $display("## bsg_clk_gen downsampler received configuration state: %b",ds_tag_payload_r);
  // clock downsampler
  // we allow the clock downsample reset to be accessed via bsg_tag; this way
  // we can turn it off by holding reset high to save power.
  bsg_counter_clock_downsample #
    (.width_p  ( downsample_width_p     )
    ,.harden_p (1)                      )
  clk_gen_ds_inst
    (.clk_i    ( osc_clk_o              )
    ,.reset_i  ( ds_tag_payload_r.reset )
    ,.val_i    ( ds_tag_payload_r.val   )
    ,.clk_r_o  ( div_clk_o              ));
  generate
    for(i=0;i<num_lines_p;i=i+1) begin:dly_line
      bsg_dly_line #
        (.num_adgs_p        ( num_adgs_p            ))
      dly_line_inst
        (.bsg_tag_i         ( bsg_osc_tag_i         )
        ,.bsg_tag_trigger_i ( bsg_osc_trigger_tag_i )
        ,.async_reset_i     ( async_osc_reset_i     )
        ,.clk_i             ( dly_clk_i[i]          )
        ,.clk_o             ( dly_clk_o[i]          ));
    end
  endgenerate
endmodule