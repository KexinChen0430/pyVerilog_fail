module bsg_mem_1rw_sync_mask_write_byte
 #(parameter `BSG_INV_PARAM(els_p )
  ,parameter `BSG_INV_PARAM(data_width_p )
  ,parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
  ,parameter write_mask_width_lp = data_width_p>>3
  )
  (input                           clk_i
  ,input                           reset_i
  ,input                           v_i
  ,input                           w_i
  ,input [addr_width_lp-1:0]       addr_i
  ,input [data_width_p-1:0]        data_i
  ,input [write_mask_width_lp-1:0] write_mask_i
  ,output [data_width_p-1:0] data_o
  );
  wire unused = reset_i;
  `bsg_mem_1rw_sync_macro_byte(4096,64,12,8) else
  `bsg_mem_1rw_sync_macro_byte(2048,64,11,4) else
  `bsg_mem_1rw_sync_macro_byte(2048,64,11,4) else
  `bsg_mem_1rf_sync_macro_byte_banks(512,32,9,4) else
  `bsg_mem_1rf_sync_macro_byte(1024,32,10,8) else
  `bsg_mem_1rw_sync_macro_byte(1024,32,10,4) else
  // no hardened version found
    begin  : notmacro
       bsg_mem_1rw_sync_mask_write_byte_synth
	 #(.els_p(els_p), .data_width_p(data_width_p))
       synth (.*);
    end
  // synopsys translate_off
  always_comb
    assert (data_width_p % 8 == 0)
      else $error("data width should be a multiple of 8 for byte masking");
   initial
     begin
        $display("## bsg_mem_1rw_sync_mask_write_byte: instantiating data_width_p=%d, els_p=%d (%m)",data_width_p,els_p);
     end
  // synopsys translate_on
endmodule