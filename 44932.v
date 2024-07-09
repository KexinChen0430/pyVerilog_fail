module bsg_dff_en_rep_rep #(parameter blocks_p=0
                            , width_p=0
                            , group_vec_p=0
                            , harden_p=1
                            )
   (input clk_i
    , input en_i
    , input  [width_p-1:0] data_i
    , output [width_p-1:0] data_o
    );
   genvar j;
  for (j = 0; j < blocks_p;j=j+1)
     begin: rof
        localparam group_end_lp   = (group_vec_p >> ((j+1) << 3 )) & 8'hFF;
        localparam group_start_lp = (group_vec_p >> ((j  ) << 3 )) & 8'hFF;
        localparam [31:0] blocks_lp  = group_end_lp-group_start_lp;
        bsg_dff_en #(.width_p(blocks_lp), .harden_p(harden_p)) bde
        (.clk_i
         ,.en_i
         ,.data_i(data_i[group_end_lp-1:group_start_lp])
         ,.data_o(data_o[group_end_lp-1:group_start_lp])
         );
     end
endmodule