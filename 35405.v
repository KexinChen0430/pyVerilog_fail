module bsg_mem_1rw_sync #(parameter `BSG_INV_PARAM(width_p)
                          , parameter `BSG_INV_PARAM(els_p)
                          , parameter latch_last_read_p=0
                          , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                          , parameter enable_clock_gating_p=0
			  , parameter verbose_if_synth_p=1
                          )
   (input   clk_i
    , input reset_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0] data_i
    , input [addr_width_lp-1:0] addr_i
    , input v_i
    , input w_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0]  data_o
    );
   wire clk_lo;
   if (enable_clock_gating_p)
     begin
       bsg_clkgate_optional icg
         (.clk_i( clk_i )
         ,.en_i( v_i )
         ,.bypass_i( 1'b0 )
         ,.gated_clock_o( clk_lo )
         );
     end
   else
     begin
       assign clk_lo = clk_i;
     end
   bsg_mem_1rw_sync_synth
     #(.width_p(width_p)
       ,.els_p(els_p)
       ,.latch_last_read_p(latch_last_read_p)
       ,.verbose_p(verbose_if_synth_p) // disables reprinting out a masked synth ram
                                       //  that has been split into many synth rams
       ) synth
    (.clk_i( clk_lo )
    ,.reset_i
    ,.data_i
    ,.addr_i
    ,.v_i
    ,.w_i
    ,.data_o
    );
endmodule