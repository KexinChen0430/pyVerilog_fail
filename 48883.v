module bsg_mem_1rw_sync #(parameter `BSG_INV_PARAM(width_p)
                          , parameter `BSG_INV_PARAM(els_p)
                          , parameter addr_width_lp=$clog2(els_p)
                          // whether to substitute a 1r1w
                          , parameter substitute_1r1w_p=1)
   (input   clk_i
    , input reset_i
    , input [width_p-1:0] data_i
    , input [addr_width_lp-1:0] addr_i
    , input v_i
    , input w_i
    , output logic [width_p-1:0]  data_o
    );
   `bsg_mem_1rw_sync_macro(2048,32,11,32,8) else
   `bsg_mem_1rw_sync_macro(1024,32,10,32,8) else
   `bsg_mem_1rw_sync_macro(256,128,8,128,4) else
     `bsg_mem_1rw_sync_macro_rf(128,74,7,74,2) else
     `bsg_mem_1rw_sync_macro_rf(128,73,7,74,2) else
     `bsg_mem_1rw_sync_macro_rf(128,72,7,72,2) else
     `bsg_mem_1rw_sync_macro_rf(128,71,7,72,2) else
     `bsg_mem_1rw_sync_macro_rf(128,70,7,70,2) else
     `bsg_mem_1rw_sync_macro_rf(128,69,7,70,2) else
     `bsg_mem_1rw_sync_macro_rf(128,68,7,68,2) else
     `bsg_mem_1rw_sync_macro_rf(128,67,7,68,2) else
     `bsg_mem_1rw_sync_macro_rf(128,66,7,66,2) else
     `bsg_mem_1rw_sync_macro_rf(128,65,7,66,2) else
     `bsg_mem_1rw_sync_macro_rf(128,64,7,64,2) else
     `bsg_mem_1rw_sync_macro_rf(128,63,7,64,2) else
     `bsg_mem_1rw_sync_macro_rf(128,62,7,62,2) else
     `bsg_mem_1rw_sync_macro_rf(128,61,7,62,2) else
     begin : z
        // we substitute a 1r1w macro
        // fixme: theoretically there may be
        // a more efficient way to generate a 1rw synthesized ram
        if (substitute_1r1w_p)
          begin: s1r1w
             logic [width_p-1:0] data_lo;
             bsg_mem_1r1w #(.width_p(width_p)
                            ,.els_p(els_p)
                            ,.read_write_same_addr_p(0)
                            ) mem
               (.w_clk_i   (clk_i)
                ,.w_reset_i(reset_i)
                ,.w_v_i    (v_i & w_i)
                ,.w_addr_i (addr_i)
                ,.w_data_i (data_i)
                ,.r_addr_i (addr_i)
                ,.r_v_i    (v_i & ~w_i)
                ,.r_data_o (data_lo)
                );
             // register output data to convert sync to async
             always_ff @(posedge clk_i)
               data_o <= data_lo;
         end // block: subst
        else
          begin: notmacro
             bsg_mem_1rw_sync_synth
               # (.width_p(width_p)
                ,.els_p(els_p)
                ) synth
                 (.*);
          end // block: notmacro
     end // block: z
   // synopsys translate_off
   initial
     begin
        $display("## %L: instantiating width_p=%d, els_p=%d, substitute_1r1w_p=%d (%m)",width_p,els_p,substitute_1r1w_p);
     end
   // synopsys translate_on
endmodule