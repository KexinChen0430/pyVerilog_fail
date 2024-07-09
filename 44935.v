module bsg_mul_B4B_rep #(parameter [31:0] blocks_p=1
                         ,parameter `BSG_INV_PARAM(y_p      )
                         // size is required so VCS does not freak out
                         ,parameter [31:0] y_size_p = 16
                         ,parameter S_above_vec_p=0
                         ,parameter dot_bar_vec_p=0
                         ,parameter B_vec_p=0
                         ,parameter one_vec_p=0
                         ,parameter harden_p=0)
   ( input [4:0][2:0] SDN_i
     , input                 cr_i
     , input [y_size_p-1:0]  y_i
     , input                 signed_i
     , output                cl_o
     , output [blocks_p-1:0] c_o
     , output [blocks_p-1:0] s_o
     );
   genvar i;
   initial assert (y_p != -1) else $error("invalid input for y_p");
   localparam y_shift_p = 2+7;
   // sign extend if signed value
   // wire [16+8:-2-7] y_pad = { 8'b0, y_i, 9'b0 };
   wire [y_size_p+8+y_shift_p:0] y_pad = { { 8 { y_i[y_size_p-1] & signed_i }}, y_i, 9'b0 };
   wire [blocks_p-1:0][3:0][1:0]   y_in;
   for (i = 0; i < blocks_p; i=i+1)
     begin: wiring
        // the localparams are required to overcome some absurdity in VCS
        // where it is using >> 32 bit values to represent the constants
        // and then they are not correctly interpreted as small signed numbers
        localparam [31:0] x7 = y_shift_p+y_p+i-6;
        localparam [31:0] x6 = y_shift_p+y_p+i-6-1;
        localparam [31:0] x5 = y_shift_p+y_p+i-4;
        localparam [31:0] x4 = y_shift_p+y_p+i-4-1;
        localparam [31:0] x3 = y_shift_p+y_p+i-2;
        localparam [31:0] x2 = y_shift_p+y_p+i-2-1;
        localparam [31:0] x1 = y_shift_p+y_p+i;
        localparam [31:0] x0 = y_shift_p+y_p+i-1;
/*
        wire [3:0][1:0]   y_in = {
                                  {y_pad[x7],y_pad[x6]}
                                  , {y_pad[x5],y_pad[x4]}
                                  , {y_pad[x3],y_pad[x2]}
                                  , {y_pad[x1 ],y_pad[x0]}
                                  };
*/
        assign y_in[i][0] = {y_pad[x1], y_pad[x0]};
        assign y_in[i][1] = {y_pad[x3], y_pad[x2]};
        assign y_in[i][2] = {y_pad[x5], y_pad[x4]};
        assign y_in[i][3] = {y_pad[x7], y_pad[x6]};
     end // block: rof
   // this little nugget is what we replace using rp groups
   bsg_mul_booth_4_block_rep #(.blocks_p      (blocks_p)
                               ,.S_above_vec_p(S_above_vec_p)
                               ,.dot_bar_vec_p(dot_bar_vec_p)
                               ,.B_vec_p      (B_vec_p)
                               ,.one_vec_p    (one_vec_p)
                               ) bb4bh
     (.SDN_i
      ,.cr_i
      ,.y_vec_i(y_in)
      ,.cl_o
      ,.c_o
      ,.s_o
      );
endmodule