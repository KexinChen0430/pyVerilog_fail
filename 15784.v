module bsg_mem_3r1w_sync #( parameter `BSG_INV_PARAM(width_p )
                          , parameter `BSG_INV_PARAM(els_p )
                          , parameter read_write_same_addr_p = 0
                          , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
                          , parameter harden_p = 1
                          )
  ( input clk_i
  , input reset_i
  , input                     w_v_i
  , input [addr_width_lp-1:0] w_addr_i
  , input [width_p-1:0]       w_data_i
  , input                      r0_v_i
  , input [addr_width_lp-1:0]  r0_addr_i
  , output logic [width_p-1:0] r0_data_o
  , input                      r1_v_i
  , input [addr_width_lp-1:0]  r1_addr_i
  , output logic [width_p-1:0] r1_data_o
  , input                      r2_v_i
  , input [addr_width_lp-1:0]  r2_addr_i
  , output logic [width_p-1:0] r2_data_o
  );
  wire unused = reset_i;
  // TODO: Define more hardened macro configs here
  `bsg_mem_3r1w_sync_macro(32,64,1) else
  //`bsg_mem_3r1w_sync_macro(32,32,2) else
  // no hardened version found
   begin: notmacro
     bsg_mem_3r1w_sync_synth #(.width_p(width_p), .els_p(els_p), .read_write_same_addr_p(read_write_same_addr_p))
      synth
       (.*);
   end // block: notmacro
  //synopsys translate_off
  always_ff @(negedge clk_i)
    if (w_v_i)
    begin
      assert (w_addr_i < els_p)
        else $error("Invalid address %x to %m of size %x\n", w_addr_i, els_p);
      assert (~(r0_addr_i == w_addr_i && r0_v_i && !read_write_same_addr_p))
        else $error("%m: port 0 Attempt to read and write same address");
      assert (~(r1_addr_i == w_addr_i && r1_v_i && !read_write_same_addr_p))
        else $error("%m: port 1 Attempt to read and write same address");
      assert (~(r2_addr_i == w_addr_i && r2_v_i && !read_write_same_addr_p))
        else $error("%m: port 2 Attempt to read and write same address");
    end
  initial
    begin
      $display("## %L: instantiating width_p=%d, els_p=%d, read_write_same_addr_p=%d, harden_p=%d (%m)",width_p,els_p,read_write_same_addr_p,harden_p);
    end
  //synopsys translate_on
endmodule