module bsg_mul_B4B_rep_rep
  #(parameter blocks_p      =  1
    , parameter width_p     =  0
    , parameter group_vec_p =  0
    , parameter `BSG_INV_PARAM(y_p         )
    , parameter y_size_p    = 16
    , parameter S_above_vec_p = 0
    , parameter dot_bar_vec_p = 0
    , parameter B_vec_p     = 0
    , parameter one_vec_p   = 0
    , parameter harden_p    = 1'b0
    )
   ( input [4:0][2:0] SDN_i
     , input cr_i
     , input [y_size_p-1:0] y_i
     , input signed_i
     , output cl_o
     , output [width_p-1:0] c_o
     , output [width_p-1:0] s_o
     );
   genvar j;
   wire [blocks_p:0] carries;
   for (j = 0; j < blocks_p; j=j+1)
     begin: rof
        localparam group_end_lp      = (group_vec_p >> ((j+1) << 3 )) & 8'hFF;
        localparam group_start_lp    = (group_vec_p >> ((j  ) << 3 )) & 8'hFF;
        localparam [31:0] blocks_lp  = group_end_lp-group_start_lp;
        bsg_mul_B4B_rep
          #(.blocks_p(blocks_lp)
            ,.y_p          (y_p+group_start_lp   )
            ,.y_size_p     (y_size_p             )
            ,.S_above_vec_p(S_above_vec_p[4*group_end_lp-1:4*group_start_lp])
            ,.dot_bar_vec_p(dot_bar_vec_p[4*group_end_lp-1:4*group_start_lp])
            ,.B_vec_p      (B_vec_p      [4*group_end_lp-1:4*group_start_lp])
            ,.one_vec_p    (one_vec_p    [4*group_end_lp-1:4*group_start_lp])
            ,.harden_p (harden_p)
            ) br
          (.SDN_i
           ,.cr_i(carries[j])
           ,.y_i
           ,.signed_i
           ,.cl_o(carries[j+1])
           ,.c_o(c_o[group_end_lp-1:group_start_lp])
           ,.s_o(s_o[group_end_lp-1:group_start_lp])
           );
     end
   assign carries[0] = cr_i;
   assign cl_o = carries[blocks_p];
endmodule