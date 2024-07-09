module bsg_mul_comp42_rep_rep #(parameter blocks_p=0
                                , width_p=0
                                , group_vec_p=0
                                , harden_p=1
                                )
   // we do this so that it is easy to combine vectors of results from blocks
   (input [3:0][width_p-1:0] i
    ,input cr_i
    ,output cl_o
    ,output [width_p-1:0] c_o
    ,output [width_p-1:0] s_o
    );
   genvar j;
   wire [blocks_p:0] carries;
   for (j = 0; j < blocks_p;j=j+1)
     begin: rof
        localparam group_end_lp   = (group_vec_p >> ((j+1) << 3 )) & 8'hFF;
        localparam group_start_lp = (group_vec_p >> ((j  ) << 3 )) & 8'hFF;
        wire [3:0][group_end_lp-group_start_lp-1:0] t;
        assign t[0] = i[0][group_end_lp-1:group_start_lp];
        assign t[1] = i[1][group_end_lp-1:group_start_lp];
        assign t[2] = i[2][group_end_lp-1:group_start_lp];
        assign t[3] = i[3][group_end_lp-1:group_start_lp];
        bsg_mul_comp42_rep #(.blocks_p(group_end_lp-group_start_lp)) cr
          (.i(t)
           ,.cr_i(carries[j]  )
           ,.cl_o(carries[j+1])
           ,.c_o(c_o[group_end_lp-1:group_start_lp])
           ,.s_o(s_o[group_end_lp-1:group_start_lp])
           );
     end
   assign cl_o = carries[blocks_p];
   assign carries[0] = cr_i;
endmodule