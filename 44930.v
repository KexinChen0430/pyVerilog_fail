module bsg_mul_16_16 #(parameter harden_p=0)
   (input   [15:0] x_i
    , input [15:0] y_i
    , input signed_i   // signed multiply
    , output [31:0] z_o
    );
   wire [8:0][2:0] SDN;
   // booth encoding
   bsg_mul_SDN #(.width_p(16)) sdn (.x_i, .signed_i, .SDN_o(SDN));
   wire [24:0]     c30, s30;
   wire [25:0]     c74, s74;
   wire [1:0][3:0] cl;
   wire [2:0] 	   verify_zero;
   // handle first four rows of partial products
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (4)
       ,.width_p      (25)
       // 5 6 8 6
       // 25 20  14 6 0
       // 19 14  e  6 0
       ,.group_vec_p  (40'h19_14_0e_06_00)
       ,.y_p          (0)
       ,.y_size_p     (16)
       ,.S_above_vec_p(100'b0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010)
       ,.dot_bar_vec_p(100'b0000_1000_0000_0100_0000____0011_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (100'b0111_0111_0011_0011_0001____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100)
       ,.one_vec_p    (100'b1000_0000_0100_0000_0010____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr0
       (.SDN_i({SDN[3:0],3'b000}), .y_i, .cr_i(1'b0), .cl_o(verify_zero[0]), .c_o(c30 [24 :0]), .s_o(s30[24:0]), .signed_i);
   // handle second four rows of partial products
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (4)
       ,.width_p      (26)
       // 6 6 6 8
       // 26 20  14 8 0
       // 1a 14  e  8 0
       ,.group_vec_p  (40'h1a_14_0e_08_00)
       ,.y_p          (-2)
       ,.y_size_p     (16)
       ,.S_above_vec_p(104'b0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010_0000_0001)
       ,.dot_bar_vec_p(104'b1000_0000_0100_0000_0010_0000____0001_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (104'b0111_0011_0011_0001_0001_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100_1111_1110)
       ,.one_vec_p    (104'b0000_0100_0000_0010_0000_0001____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr1
       (.SDN_i({SDN[7:3]}), .y_i, .cr_i(1'b0), .cl_o(verify_zero[1]), .c_o(c74 [25 :0]), .s_o(s74[25:0]), .signed_i);
   // now we merge the two rows of partial products with a single row of 4:2 compressors
   wire [3:0]      ci_local;
   wire [25:0]     c42_c, c42_s;
   // group vec shows where we should segment the CSA's to allow for rp groups 26, 20, 14, 8, 0
   bsg_mul_comp42_rep_rep #(.blocks_p(4), .group_vec_p(40'h1a_14_0e_08_00),. width_p(26)) crr
     (.i({   {c74[24:0], 1'b0}
             ,  s74[25:0]
             , {6'b0, c30[24:5]}
             , {7'b0, s30[24:6]}
             }
         )
      ,.cr_i(1'b0)
      ,.cl_o(verify_zero[2])
      ,.c_o(c42_c[25:0])
      ,.s_o(c42_s[25:0])
      );
   wire [17:0]        gb_c, gb_s;
   bsg_mul_green_block #(.width_p(16)
                         ,.harden_p(harden_p)
                         ) gb
     (
      .SDN_i(SDN[8:7])
      ,.y_i (y_i)
      ,.s_i (c42_s[25:8])
      ,.s2_i(c42_c[24:7])
      ,.c_o (gb_c)
      ,.s_o (gb_s)
      );
   wire [31:0]        sum_a = {      gb_s[17:0],  c42_s[7:0],       s30[5:0]};
   wire [31:0]        sum_b = {gb_c[16:0], 1'b0, c42_c[6:0], 1'b0, c30[4:0], 1'b0};
   // complete adder with propagation
   assign z_o = sum_a + sum_b;
endmodule