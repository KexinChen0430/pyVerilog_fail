module bsg_mul_csa_rep #(parameter `BSG_INV_PARAM(width_p)
                         , blocks_p="inv"
                         , group_vec_p="inv"
                         , harden_p=0)
   ( input  [width_p-1  :0] a_i
     , input  [width_p-1:0] b_i
     , input  [width_p-1:0] c_i
     , output [width_p-1:0] c_o
     , output [width_p-1:0] s_o
     );
   genvar i,j;
   for (j = 0; j < blocks_p; j=j+1)
     begin: rof
        localparam group_end_lp      = (group_vec_p >> ((j+1) << 3 )) & 8'hFF;
        localparam group_start_lp    = (group_vec_p >> ((j  ) << 3 )) & 8'hFF;
        localparam [31:0] blocks_lp  = group_end_lp-group_start_lp;
        for (i = 0; i < blocks_lp; i++)
          begin: rof
             bsg_mul_csa csa (.x_i(a_i[group_start_lp+i]), .y_i(b_i[group_start_lp+i]), .z_i(c_i[group_start_lp+i]), .c_o(c_o[group_start_lp+i]), .s_o(s_o[group_start_lp+i]));
          end
     end
endmodule