module bsg_mem_2r1w #(parameter `BSG_INV_PARAM(width_p)
                      , parameter `BSG_INV_PARAM(els_p)
                      , parameter read_write_same_addr_p=0
                      , parameter addr_width_lp=$clog2(els_p)
                      )
   (input   w_clk_i
    , input w_reset_i
    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [width_p-1:0]       w_data_i
    , input                      r0_v_i
    , input [addr_width_lp-1:0]  r0_addr_i
    , output logic [width_p-1:0] r0_data_o
    , input                      r1_v_i
    , input [addr_width_lp-1:0]  r1_addr_i
    , output logic [width_p-1:0] r1_data_o
    );
    `bsg_mem_2r1w_macro(32,32)
     else
       begin: notmacro
	  bsg_mem_2r1w_synth
	    #(.width_p(width_p)
	      ,.els_p(els_p)
	      ,.read_write_same_addr_p(read_write_same_addr_p)
	      ) synth
	      (.*);
       end
// synopsys translate_off
   always_ff @(posedge w_clk_i)
     if (w_v_i)
       begin
          assert (w_addr_i < els_p)
            else $error("Invalid address %x to %m of size %x\n", w_addr_i, els_p);
          assert (~(r0_addr_i == w_addr_i && w_v_i && r0_v_i && !read_write_same_addr_p))
            else $error("%m: Attempt to read and write same address");
          assert (~(r1_addr_i == w_addr_i && w_v_i && r1_v_i && !read_write_same_addr_p))
            else $error("%m: Attempt to read and write same address");
       end
   initial
     begin
        $display("## %L: instantiating width_p=%d, els_p=%d, read_write_same_addr_p=%d (%m)",width_p,els_p,read_write_same_addr_p);
     end
// synopsys translate_on
endmodule