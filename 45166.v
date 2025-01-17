module bsg_mem_1rw_sync_mask_write_bit #( parameter `BSG_INV_PARAM(width_p )
                                        , parameter `BSG_INV_PARAM(els_p )
                                        , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
                                        )
  ( input                       clk_i
  , input                       reset_i
  , input [width_p-1:0]         data_i
  , input [addr_width_lp-1:0]   addr_i
  , input                       v_i
  , input [width_p-1:0]         w_mask_i
  , input                       w_i
  , output logic [width_p-1:0]  data_o
  );
  wire unused = reset_i;
  // TODO: Define more hardened macro configs here
  `bsg_mem_1rw_sync_mask_write_bit_macro(64,15)        else
  `bsg_mem_1rw_sync_mask_write_bit_macro(64,7)         else
  `bsg_mem_1rw_sync_mask_write_bit_macro(64,96)        else
  `bsg_mem_1rw_sync_mask_write_bit_macro_banks(64,96)  else
    begin: notmacro
      bsg_mem_1rw_sync_mask_write_bit_synth #(.width_p(width_p), .els_p(els_p))
        synth
          (.*);
    end // block: notmacro
  // synopsys translate_off
  always_ff @(posedge clk_i)
    begin
      if (v_i)
        assert (addr_i < els_p)
          else $error("Invalid address %x to %m of size %x\n", addr_i, els_p);
    end
  initial
    begin
      $display("## %L: instantiating width_p=%d, els_p=%d (%m)",width_p,els_p);
    end
// synopsys translate_on
endmodule