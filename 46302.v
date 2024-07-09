module bsg_launch_sync_sync #(parameter `BSG_INV_PARAM(width_p)
                              , parameter use_negedge_for_launch_p = 0)
   (input iclk_i
    , input iclk_reset_i
    , input oclk_i
    , input  [width_p-1:0] iclk_data_i
    , output [width_p-1:0] iclk_data_o // after launch flop
    , output [width_p-1:0] oclk_data_o // after sync flops
    );
   genvar i;
   // synopsys translate_off
   initial assert (iclk_reset_i !== 'z)
     else
       begin
          $error("%m iclk_reset should be connected");
          $finish();
       end
   // synopsys translate_on
   if (use_negedge_for_launch_p)
     begin: n
        for (i = 0; i < (width_p/`blss_max_block); i = i + 1)
          begin : maxb
             bsg_launch_sync_sync_negedge_8_unit blss
                 (.iclk_i
                  ,.iclk_reset_i
                  ,.oclk_i
                  ,.iclk_data_i(iclk_data_i[i*`blss_max_block+:`blss_max_block])
                  ,.iclk_data_o(iclk_data_o[i*`blss_max_block+:`blss_max_block])
                  ,.oclk_data_o(oclk_data_o[i*`blss_max_block+:`blss_max_block])
                  );
          end
        `blss_if_clause(negedge,1) else
          `blss_if_clause(negedge,2) else
            `blss_if_clause(negedge,3) else
              `blss_if_clause(negedge,4) else
                `blss_if_clause(negedge,5) else
                  `blss_if_clause(negedge,6) else
                    `blss_if_clause(negedge,7)
     end
   else
     begin: p
        for (i = 0; i < (width_p/`blss_max_block); i = i + 1)
          begin : maxb
             bsg_launch_sync_sync_posedge_8_unit blss
                 (.iclk_i
                  ,.iclk_reset_i
                  ,.oclk_i
                  ,.iclk_data_i(iclk_data_i[i*`blss_max_block+:`blss_max_block])
                  ,.iclk_data_o(iclk_data_o[i*`blss_max_block+:`blss_max_block])
                  ,.oclk_data_o(oclk_data_o[i*`blss_max_block+:`blss_max_block])
                  );
          end
        `blss_if_clause(posedge,1) else
          `blss_if_clause(posedge,2) else
            `blss_if_clause(posedge,3) else
              `blss_if_clause(posedge,4) else
                `blss_if_clause(posedge,5) else
                  `blss_if_clause(posedge,6) else
                    `blss_if_clause(posedge,7)
     end
endmodule