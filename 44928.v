module bsg_mul_32_32 #(parameter harden_p=0, pipeline_p=0)
   (  input clk_i
    , input en_i
    , input   [31:0] x_i
    , input [31:0] y_i
    , input signed_i   // signed multiply
    , output [63:0] z_o
    );
   localparam width_lp = 32;
   localparam pp_lp = width_lp/2+1;
   wire [pp_lp-1:0][2:0] SDN;
   // booth encoding
   bsg_mul_SDN #(.width_p(width_lp)) sdn (.x_i, .signed_i, .SDN_o(SDN));
   // all of results of groups of 4 rows of the multiplier
   // the numbers for the bit widths indicate the size of each
   // block. we partion the array into a bunch of equal sized
   // blocks that allow for alignment in rp_groups.
   wire [      6+5+8+8+8+6-1:0]  c30, s30;    // 40:0
   wire [  1+8+6+5+8+8+8  -1:0]  c42_01c, c42_01s; //42:0->43:0 +1 is for dealing greendots
   wire [    8+6+5+8+8+8  -1:0]  c74, s74;    // 42:0
   wire [7+8+8+6+5+8+8    -1:0]  c42_03c, c42_03s;   // 57:0
   wire [  8+8+6+5+8+8    -1:0]  cB8, sB8;    // 42:0
   wire [7+8+8+6+5+8      -1:0]  c42_23c, c42_23s; //49:0
   wire [7+8+8+6+5+8      -1:0]  cFC, sFC;    // 41:0
   wire [3:0][3:0] cl;
   wire [2:0] 	   verify_zero;
   always @(verify_zero)
     assert (|verify_zero != 1'b1) else $error("unexpected carry in bsg_mul_32_32 %b", verify_zero);
   // hint: you read these strings right off of the "dot diagram"
   // the infrastructure (plus tweaking the 4:2 tree) does the rest!
   // handle first four rows of partial products
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (6)
       ,.width_p      (41)   // is this correct?
       //  6    5    8    8  8   6
       // 41 35   30   22  14  6  0
       ,.group_vec_p  (56'h29_23_1e_16_0e_06_00)
       ,.y_p          (0)
       ,.y_size_p     (32)
       ,.S_above_vec_p(164'b0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010)
       ,.dot_bar_vec_p(164'b0000_1000_0000_0100_0000____0011_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (164'b0111_0111_0011_0011_0001____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100)
       ,.one_vec_p    (164'b1000_0000_0100_0000_0010____0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr0
       (.SDN_i({SDN[3:0],3'b000}), .y_i, .cr_i(1'b0), .cl_o(verify_zero[0]), .c_o(c30 [40 :0]), .s_o(s30[40:0]), .signed_i);
   wire [7+8+8+11-1:0] gb_c, gb_s, gb_dot; // 34 bits
   // a little bit out of order with respect to the diagram;
   bsg_mul_green_booth_dots #(.width_p(32)
                              ,.blocks_p(5)
                              //   7   8    8   6   5
                              //34  27   19  11   5   0
                              //22  1B   13  0B  05  00
                              ,.group_vec_p(48'h22_1B_13_0B_05_00)
                              ,.harden_p(harden_p)
                              ) gbd
     (.SDN_i (SDN[16:15])
      ,.y_i  (y_i       )
      ,.dot_o(gb_dot    )
      );
   wire 	       crr01_cl_o_tmp;
   // 43, 35, 29, 24, 16, 8, 0
   bsg_mul_comp42_rep_rep #(.blocks_p(6), .group_vec_p(56'h2b_23_1D_18_10_08_00),. width_p(43)) crr01
     (.i({   {c74[41:0], 1'b0} // note: gotta track c74[42]
           ,  s74[42:0]
           , {7'b0, c30[40:5]}
//           , {8'b0, s30[40:6]} -- incorporate gb early to reduce # of pipeline registers
           , {gb_dot[18:11], s30[40:6]}
           }
         )
      ,.cr_i(1'b0          )
      ,.cl_o(crr01_cl_o_tmp)
      ,.c_o(c42_01c[42:0]  )
      ,.s_o(c42_01s[42:0]  )
      );
   // merge in greendot and carry left with half adder.
   assign c42_01c[43] = gb_dot[19] & crr01_cl_o_tmp;
   assign c42_01s[43] = gb_dot[19] ^ crr01_cl_o_tmp;
// handle second four rows of partial products
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (6)
       ,.width_p      (43)   // is this correct?
       //   8 6 5  8   8  8
       // 43 35 29  24 16   8  0
       // 2B 23 1D  18 10   8  0
       ,.group_vec_p  (56'h2b_23_1D_18_10_08_00)
       ,.y_p          (-2)
       ,.y_size_p     (32)
       ,.S_above_vec_p(172'b0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000__0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010_0000_0001)
       ,.dot_bar_vec_p(172'b0000_1000_0000_0100_0000_0010_0000_0001____0000_0000_0000_0000_0000_0000__0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (172'b0111_0111_0011_0011_0001_0001_0000_0000____0000_0000_0000_0000_0000_0000__0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100_1111_1110)
       ,.one_vec_p    (172'b1000_0000_0100_0000_0010_0000_0001_0000____0000_0000_0000_0000_0000_0000__0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr1
       (.SDN_i(SDN[7:3]), .y_i, .cr_i(1'b0), .cl_o(verify_zero[1]), .c_o(c74 [42 :0]), .s_o(s74[42:0]), .signed_i);
   // this is the big one
   // block sizes:     7,  8,  8,  11,  8,  8
   // block sizes:     7,  8,  8,  6   5,  8,  8
   //              50,   43, 35, 27, 21  16,  8,  0
   //               32, 2b, 23,  1b, 15  10,  8,  0
   bsg_mul_comp42_rep_rep #(.blocks_p(7), .group_vec_p(64'h32_2b_23_1b_15_10_08_00),. width_p(50)) crr03
     (.i({   {c42_23c   [40:0], 1'b0, cB8[6:0], 1'b0}
             , {c42_23s[41:0],    sB8[7:0]      }
             , {13'b0, c42_01c[43:7]}
//             , {15'b0, c42_01s[42:8]}
// we add gb_dot in here because there is space
// and when we pipeline we will need fewer registers this way
             , {gb_dot[33:20], c42_01s[43:8]}
             }
         )
      ,.cr_i(1'b0)
      ,.cl_o() // a carry out here is okay, it just falls off the end.
      ,.c_o(c42_03c[49:0])
      ,.s_o(c42_03s[49:0])
      );
   logic [49:0]                c42_03c_r, c42_03s_r;
   if (pipeline_p)
     begin : pipe
        logic [49:0][1:0] c42_03_trans, c42_03_trans_r;
        // we transpose the bits (basically zippering them)
        // so that carry bits and sum bits are stored near each other
        // in a vertical column that pitch-matches the 4:2 compressor stack
        bsg_transpose #(.width_p(50),.els_p(2)) bt (.i({c42_03c, c42_03s}), .o(c42_03_trans) );
        bsg_dff_en_rep_rep #(.blocks_p(7)
                             ,.width_p(50*2)
                             // mirrors crr03 comp42_rep_rep above
                             // everything is twice as wide because of the zippering
                             ,.group_vec_p((64'h32_2b_23_1b_15_10_08_00 << 1))
                             ,.harden_p(harden_p)
                     )
        dffe_c42_03_r (.clk_i
                       ,.en_i
                       ,.data_i(c42_03_trans)
                       ,.data_o(c42_03_trans_r)
                       );
        bsg_transpose #(.width_p(2),.els_p(50))
	bt2 (  .i(c42_03_trans_r ) ,.o({c42_03c_r      , c42_03s_r}) );
     end
   else
     begin: unpipe
        assign c42_03c_r = c42_03c;
        assign c42_03s_r = c42_03s;
     end
   // handle third four rows of partial products; this is mostly the same as the second row, but with two sub blocks flipped
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (6)
       ,.width_p      (43)   // is this correct?
       //   8  8  6  5   8  8
       // 43 35 27 21  16   8  0
       // 2B 23 1B 15  10   8  0
       ,.group_vec_p  (56'h2b_23_1B_15_10_08_00)
       ,.y_p          (-2)
       ,.y_size_p     (32)
       ,.S_above_vec_p(172'b0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010_0000_0001)
       ,.dot_bar_vec_p(172'b0000_1000_0000_0100_0000_0010_0000_0001____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (172'b0111_0111_0011_0011_0001_0001_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100_1111_1110)
       ,.one_vec_p    (172'b1000_0000_0100_0000_0010_0000_0001_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr2
       (.SDN_i(SDN[11:7]), .y_i, .cr_i(1'b0), .cl_o(verify_zero[2]), .c_o(cB8 [42 :0]), .s_o(sB8[42:0]), .signed_i);
   // 42, 35, 27, 19, 8, 0
   // 42, 35, 27, 19, 13, 8, 0
   bsg_mul_comp42_rep_rep #(.blocks_p(6), .group_vec_p(56'h2a_23_1b_13_0d_08_00),. width_p(42)) crr23
     (.i({   {cFC[40:0], 1'b0}
           ,  sFC[41:0]
           , {6'b0, cB8[42:7]}
           , {7'b0, sB8[42:8]}
           }
         )
      ,.cr_i(1'b0)
      ,.cl_o() // carry here is okay, just falls off the end
      ,.c_o(c42_23c[41:0])
      ,.s_o(c42_23s[41:0])
      );
   // handle fourth four rows of partial products; this is mostly the same as the third row, but with two sub blocks flipped, and the last
   // subblock is shortened because it does not need a final "1".
   bsg_mul_B4B_rep_rep
     #(.blocks_p      (6)
       ,.width_p      (42)   // is this correct?
       //     7 8  8  6    5   8
       // 42 35  27  19 13   8  0
       // 2A 23  1B  13 0d    8  0
       ,.group_vec_p  (56'h2a_23_1B_13_0D_08_00)
       ,.y_p          (-2)
       ,.y_size_p     (32)
       ,.S_above_vec_p(168'b0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_1000_0000_0100_0000_0010_0000_0001)
       ,.dot_bar_vec_p(168'b1000_0000_0100_0000_0010_0000_0001____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.B_vec_p      (168'b0111_0011_0011_0001_0001_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____1000_0000_1100_1000_1110_1100_1111_1110)
       ,.one_vec_p    (168'b0000_0100_0000_0010_0000_0001_0000____0000_0000_0000_0000_0000_0000_0000_0000___0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000____0000_0000_0000_0000_0000_0000_0000_0000)
       ,.harden_p(harden_p)
       ) brr3
       (.SDN_i(SDN[15:11]), .y_i, .cr_i(1'b0)
	, .cl_o()   // carry here is okay, just falls off the end.
	, .c_o(cFC [41 :0]), .s_o(sFC[41:0]), .signed_i);
   wire [10:0] gb_dot_r;
   wire [7:0]  c42_01s_r;
   wire [6:0]  c42_01c_r;
   wire [5:0]  s30_r;
   wire [4:0]  c30_r;
   if (pipeline_p)
     begin: pipe0
        bsg_dff_en #(.width_p(11)
                     ,.harden_p(harden_p)
                     )
        dffe_gb_dot_r (.clk_i
                       ,.en_i
                       ,.data_i(gb_dot[10:0])
                       ,.data_o(gb_dot_r)
                       );
        bsg_dff_en #(.width_p(8)
                     ,.harden_p(harden_p)
                     )
        dffe_c42_01s_r (.clk_i
                        ,.en_i
                        ,.data_i(c42_01s[7:0])
                        ,.data_o(c42_01s_r)
                        );
        bsg_dff_en #(.width_p(7)
                     ,.harden_p(harden_p)
                     )
        dffe_c42_01c_r (.clk_i
                        ,.en_i
                        ,.data_i(c42_01c[6:0])
                        ,.data_o(c42_01c_r)
                        );
        bsg_dff_en #(.width_p(6)
                     ,.harden_p(harden_p)
                     )
        dffe_s30_r (.clk_i
                    ,.en_i
                    ,.data_i(s30[5:0])
                    ,.data_o(s30_r)
                    );
        bsg_dff_en #(.width_p(5)
                     ,.harden_p(harden_p)
                     )
        dffe_c30_r (.clk_i
                    ,.en_i
                    ,.data_i(c30[4:0])
                    ,.data_o(c30_r)
                    );
     end
   else
     begin: unpipe0
        assign gb_dot_r = gb_dot[10:0];
        assign c42_01s_r = c42_01s[7:0];
        assign c42_01c_r = c42_01c[6:0];
        assign s30_r = s30[5:0];
        assign c30_r = c30[4:0];
     end
   bsg_mul_csa_rep #(.width_p(34)
                     ,.blocks_p(5)
                     //   7   8    8   6   5
                     //34  27   19  11   5   0
                     //22  1B   13  0B  05  00
                     ,.group_vec_p(48'h22_1B_13_0B_05_00)
                     ,.harden_p(harden_p)
                     ) gb
     (
//      .a_i (gb_dot)  -- fold in earlier so that
//        .a_i({15'b0, gb_dot[18:0]})
        .a_i({23'b0, gb_dot_r[10:0]})
        ,.b_i (c42_03s_r[49:16])
        ,.c_i( c42_03c_r[48:15])
        ,.c_o (gb_c)
        ,.s_o (gb_s)
      );
   wire [63:0]        sum_a = {      gb_s[33:0],       c42_03s_r[15:0],       c42_01s_r[7:0],       s30_r[5:0]};
   wire [63:0]        sum_b = {gb_c[32:0], 1'b0, c42_03c_r[14:0], 1'b0, c42_01c_r[6:0], 1'b0, c30_r[4:0], 1'b0};
   // complete adder with propagation
   assign z_o = sum_a + sum_b;
endmodule