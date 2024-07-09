module bsg_mem_1r1w_sync #(parameter `BSG_INV_PARAM(width_p)
                           , parameter `BSG_INV_PARAM(els_p)
                           , parameter read_write_same_addr_p=0
                           , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                           , parameter harden_p=0
                           , parameter disable_collision_warning_p=0
                           , parameter enable_clock_gating_p=0
                           )
   (input   clk_i
    , input reset_i
    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i
    // currently unused
    , input                      r_v_i
    , input [addr_width_lp-1:0]  r_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
    );
   wire clk_lo;
   if (enable_clock_gating_p)
     begin
       bsg_clkgate_optional icg
         (.clk_i( clk_i )
         ,.en_i( w_v_i | r_v_i )
         ,.bypass_i( 1'b0 )
         ,.gated_clock_o( clk_lo )
         );
     end
   else
     begin
       assign clk_lo = clk_i;
     end
   bsg_mem_1r1w_sync_synth
     #(.width_p(width_p)
       ,.els_p(els_p)
       ,.read_write_same_addr_p(read_write_same_addr_p)
       ,.harden_p(harden_p)
       ) synth
       (.clk_i( clk_lo )
       ,.reset_i
       ,.w_v_i
       ,.w_addr_i
       ,.w_data_i
       ,.r_v_i
       ,.r_addr_i
       ,.r_data_o
       );
   //synopsys translate_off
   initial
     begin
	// we warn if els_p >= 16 because it is a good candidate for hardening
	// and we warn for width_p >= 128 because this starts to add up to some real memory
	if ((els_p >= 16) || (width_p >= 128) || (width_p*els_p > 256))
          $display("## %L: instantiating width_p=%d, els_p=%d, read_write_same_addr_p=%d, harden_p=%d (%m)",width_p,els_p,read_write_same_addr_p,harden_p);
	if (disable_collision_warning_p)
	  $display("## %L: disable_collision_warning_p is set; you should not have this on unless you have broken code. fix it!\n");
     end
   always_ff @(posedge clk_lo)
     if (w_v_i)
       begin
          assert ((reset_i === 'X) || (reset_i === 1'b1) || (w_addr_i < els_p))
            else $error("Invalid address %x to %m of size %x\n", w_addr_i, els_p);
          assert ((reset_i === 'X) || (reset_i === 1'b1) || ~(r_addr_i == w_addr_i && w_v_i && r_v_i && !read_write_same_addr_p && !disable_collision_warning_p))
            else
              begin
                 $error("X'ing matched read address %x (%m)",r_addr_i);
              end
       end
   //synopsys translate_on
endmodule