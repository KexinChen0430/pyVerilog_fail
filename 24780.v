module bsg_sync_sync #(parameter `BSG_INV_PARAM(width_p ))
   (
      input oclk_i
    , input  [width_p-1:0] iclk_data_i
    , output [width_p-1:0] oclk_data_o // after sync flops
    );
   genvar   i;
   // synopsys translate_off
 /*
   initial
     begin
        $display("%m: instantiating bss of size %d",width_p);
     end
  */
   // synopsys translate_on
   for (i = 0; i < (width_p/`bss_max_block); i = i + 1)
     begin : maxb
        bsg_sync_sync_8_unit bss8
            (.oclk_i
             ,.iclk_data_i(iclk_data_i[i*`bss_max_block+:`bss_max_block])
             ,.oclk_data_o(oclk_data_o[i*`bss_max_block+:`bss_max_block])
             );
     end
   `bss_if_clause(1) else
     `bss_if_clause(2) else
       `bss_if_clause(3) else
         `bss_if_clause(4) else
           `bss_if_clause(5) else
             `bss_if_clause(6) else
               `bss_if_clause(7)
endmodule