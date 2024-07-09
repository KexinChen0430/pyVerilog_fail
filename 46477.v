module inner_prod (
  out_inner_prod_i,
  out_inner_prod_r,
  in_a_inner_prod_sel,
  single_out_r_AQ_7,
  single_out_r_AQ_0,
  single_out_r_AQ_1,
  single_out_r_AQ_4,
  single_out_r_AQ_2,
  in_b_inner_prod_sel,
  vec_in_r_AQ_mux_0_6,
  vec_in_r_AQ_mux_0_7,
  vec_in_r_AQ_mux_0_0,
  vec_in_r_AQ_mux_0_9,
  vec_in_r_AQ_mux_0_1,
  vec_in_r_AQ_mux_0_8,
  vec_in_r_AQ_mux_0_4,
  vec_in_r_AQ_mux_0_3,
  vec_in_r_AQ_mux_0_2,
  vec_in_r_AQ_mux_0_10,
  vec_in_i_AQ_mux_0_7,
  vec_in_i_AQ_mux_0_1,
  vec_in_i_AQ_mux_0_0,
  vec_in_i_AQ_mux_0_6,
  vec_in_i_AQ_mux_0_8,
  vec_in_i_AQ_mux_0_10,
  vec_in_i_AQ_mux_0_5,
  vec_in_i_AQ_mux_0_9,
  vec_in_i_AQ_mux_0_4,
  vec_in_i_AQ_mux_0_11,
  single_out_i_AQ_1,
  single_out_i_AQ_0,
  single_out_i_AQ_8,
  single_out_i_AQ_10,
  single_out_i_AQ_9,
  single_out_i_AQ_4,
  single_out_i_AQ_11,
  output_iv,
  single_out_r_AQ2_4,
  single_out_r_AQ2_0,
  single_out_r_AQ2_1,
  single_out_r_AQ2_6,
  output_iv_0_4,
  output_iv_0_7,
  output_iv_0_0,
  output_iv_0_9,
  output_iv_0_1,
  output_iv_0_6,
  output_iv_0_3,
  output_iv_0_2,
  output_iv_0_8,
  out_r_vec_sub_0,
  out_i_vec_sub_0,
  single_out_i_AQ2_0,
  single_out_i_AQ2_5,
  single_out_i_AQ2_4,
  single_out_i_AQ2_1,
  single_out_i_AQ2_11,
  start_inner_prod,
  red_mat_reg,
  clk,
  rst,
  done_inner_prod,
  N_623,
  N_568,
  N_622,
  N_507,
  N_549,
  N_505,
  N_597,
  N_567,
  N_596,
  N_628,
  N_637,
  N_566,
  N_506,
  N_585,
  N_584,
  N_612,
  N_583,
  N_595,
  N_508,
  N_501,
  N_605,
  N_624,
  N_607,
  N_552,
  N_555,
  N_586,
  N_645,
  N_641,
  N_582,
  N_606,
  N_632,
  N_500,
  N_571
)
;
output [11:0] out_inner_prod_i ;
output [11:0] out_inner_prod_r ;
input [0:0] in_a_inner_prod_sel ;
input single_out_r_AQ_7 ;
input single_out_r_AQ_0 ;
input single_out_r_AQ_1 ;
input single_out_r_AQ_4 ;
input single_out_r_AQ_2 ;
input [0:0] in_b_inner_prod_sel ;
input vec_in_r_AQ_mux_0_6 ;
input vec_in_r_AQ_mux_0_7 ;
input vec_in_r_AQ_mux_0_0 ;
input vec_in_r_AQ_mux_0_9 ;
input vec_in_r_AQ_mux_0_1 ;
input vec_in_r_AQ_mux_0_8 ;
input vec_in_r_AQ_mux_0_4 ;
input vec_in_r_AQ_mux_0_3 ;
input vec_in_r_AQ_mux_0_2 ;
input vec_in_r_AQ_mux_0_10 ;
input vec_in_i_AQ_mux_0_7 ;
input vec_in_i_AQ_mux_0_1 ;
input vec_in_i_AQ_mux_0_0 ;
input vec_in_i_AQ_mux_0_6 ;
input vec_in_i_AQ_mux_0_8 ;
input vec_in_i_AQ_mux_0_10 ;
input vec_in_i_AQ_mux_0_5 ;
input vec_in_i_AQ_mux_0_9 ;
input vec_in_i_AQ_mux_0_4 ;
input vec_in_i_AQ_mux_0_11 ;
input single_out_i_AQ_1 ;
input single_out_i_AQ_0 ;
input single_out_i_AQ_8 ;
input single_out_i_AQ_10 ;
input single_out_i_AQ_9 ;
input single_out_i_AQ_4 ;
input single_out_i_AQ_11 ;
input [10:0] output_iv ;
input single_out_r_AQ2_4 ;
input single_out_r_AQ2_0 ;
input single_out_r_AQ2_1 ;
input single_out_r_AQ2_6 ;
input output_iv_0_4 ;
input output_iv_0_7 ;
input output_iv_0_0 ;
input output_iv_0_9 ;
input output_iv_0_1 ;
input output_iv_0_6 ;
input output_iv_0_3 ;
input output_iv_0_2 ;
input output_iv_0_8 ;
input [11:11] out_r_vec_sub_0 ;
input [11:11] out_i_vec_sub_0 ;
input single_out_i_AQ2_0 ;
input single_out_i_AQ2_5 ;
input single_out_i_AQ2_4 ;
input single_out_i_AQ2_1 ;
input single_out_i_AQ2_11 ;
input start_inner_prod ;
input red_mat_reg ;
input clk ;
input rst ;
output done_inner_prod ;
input N_623 ;
input N_568 ;
input N_622 ;
input N_507 ;
input N_549 ;
input N_505 ;
input N_597 ;
input N_567 ;
input N_596 ;
input N_628 ;
input N_637 ;
input N_566 ;
input N_506 ;
input N_585 ;
input N_584 ;
input N_612 ;
input N_583 ;
input N_595 ;
input N_508 ;
input N_501 ;
input N_605 ;
input N_624 ;
input N_607 ;
input N_552 ;
input N_555 ;
input N_586 ;
input N_645 ;
input N_641 ;
input N_582 ;
input N_606 ;
input N_632 ;
input N_500 ;
input N_571 ;
wire single_out_r_AQ_7 ;
wire single_out_r_AQ_0 ;
wire single_out_r_AQ_1 ;
wire single_out_r_AQ_4 ;
wire single_out_r_AQ_2 ;
wire vec_in_r_AQ_mux_0_6 ;
wire vec_in_r_AQ_mux_0_7 ;
wire vec_in_r_AQ_mux_0_0 ;
wire vec_in_r_AQ_mux_0_9 ;
wire vec_in_r_AQ_mux_0_1 ;
wire vec_in_r_AQ_mux_0_8 ;
wire vec_in_r_AQ_mux_0_4 ;
wire vec_in_r_AQ_mux_0_3 ;
wire vec_in_r_AQ_mux_0_2 ;
wire vec_in_r_AQ_mux_0_10 ;
wire vec_in_i_AQ_mux_0_7 ;
wire vec_in_i_AQ_mux_0_1 ;
wire vec_in_i_AQ_mux_0_0 ;
wire vec_in_i_AQ_mux_0_6 ;
wire vec_in_i_AQ_mux_0_8 ;
wire vec_in_i_AQ_mux_0_10 ;
wire vec_in_i_AQ_mux_0_5 ;
wire vec_in_i_AQ_mux_0_9 ;
wire vec_in_i_AQ_mux_0_4 ;
wire vec_in_i_AQ_mux_0_11 ;
wire single_out_i_AQ_1 ;
wire single_out_i_AQ_0 ;
wire single_out_i_AQ_8 ;
wire single_out_i_AQ_10 ;
wire single_out_i_AQ_9 ;
wire single_out_i_AQ_4 ;
wire single_out_i_AQ_11 ;
wire single_out_r_AQ2_4 ;
wire single_out_r_AQ2_0 ;
wire single_out_r_AQ2_1 ;
wire single_out_r_AQ2_6 ;
wire output_iv_0_4 ;
wire output_iv_0_7 ;
wire output_iv_0_0 ;
wire output_iv_0_9 ;
wire output_iv_0_1 ;
wire output_iv_0_6 ;
wire output_iv_0_3 ;
wire output_iv_0_2 ;
wire output_iv_0_8 ;
wire single_out_i_AQ2_0 ;
wire single_out_i_AQ2_5 ;
wire single_out_i_AQ2_4 ;
wire single_out_i_AQ2_1 ;
wire single_out_i_AQ2_11 ;
wire start_inner_prod ;
wire red_mat_reg ;
wire clk ;
wire rst ;
wire done_inner_prod ;
wire N_623 ;
wire N_568 ;
wire N_622 ;
wire N_507 ;
wire N_549 ;
wire N_505 ;
wire N_597 ;
wire N_567 ;
wire N_596 ;
wire N_628 ;
wire N_637 ;
wire N_566 ;
wire N_506 ;
wire N_585 ;
wire N_584 ;
wire N_612 ;
wire N_583 ;
wire N_595 ;
wire N_508 ;
wire N_501 ;
wire N_605 ;
wire N_624 ;
wire N_607 ;
wire N_552 ;
wire N_555 ;
wire N_586 ;
wire N_645 ;
wire N_641 ;
wire N_582 ;
wire N_606 ;
wire N_632 ;
wire N_500 ;
wire N_571 ;
wire [11:0] mult_out_i;
wire [10:1] un2_pre_out;
wire [11:0] acc_i_2;
wire [2:0] pipe_counter;
wire [1:0] state;
wire [2:0] in_counter;
wire [2:1] pipe_counter_4_0_a2;
wire [0:0] state_i_0;
wire [11:0] in_a_i_reg;
wire [11:0] in_a_i_reg_2;
wire [11:0] in_a_r_reg;
wire [8:1] in_a_r_reg_3;
wire [1:0] state_ns;
wire [11:0] in_b_i_reg;
wire [11:0] in_b_i_reg_2;
wire [11:0] in_b_r_reg;
wire [11:1] in_b_r_reg_2;
wire [11:0] mult_out_r;
wire [10:1] un2_pre_out_0;
wire acc_clear ;
wire un2_pre_out_s_11_0 ;
wire VCC ;
wire acc_enable ;
wire un1_state_4_0_0_lut6_2_O6 ;
wire acc_enable_0 ;
wire in_reg_enable_fsm_0_sqmuxa ;
wire un1_state_8_0_0_a2_lut6_2_O5 ;
wire un7_acc_enable_lut6_2_O6 ;
wire acc_clear_0 ;
wire in_counter_5_43_i_i_a2 ;
wire N_113_i_0 ;
wire in_reg_enable_fsm ;
wire in_reg_enable_fsm_0 ;
wire done ;
wire N_516_i_0 ;
wire N_518_i ;
wire N_519_i_0 ;
wire N_520_i ;
wire N_523_i ;
wire N_193_i ;
wire N_524_i ;
wire N_183_i ;
wire N_195_i ;
wire N_191_i ;
wire N_26_i ;
wire N_24_i ;
wire N_22_i ;
wire N_20_i ;
wire N_18_i ;
wire N_16_i ;
wire N_14_i ;
wire N_12_i ;
wire N_10_i ;
wire N_8_i ;
wire N_6_i ;
wire N_4_i ;
wire N_521_i ;
wire N_517_i_0 ;
wire N_522_i ;
wire N_185_i ;
wire un2_pre_out_s_11 ;
wire N_27 ;
wire N_26 ;
wire N_25 ;
wire GND ;
// @25:108
  FDC \in_counter_Z[2]  (
	.Q(in_counter[2]),
	.D(in_counter_5_43_i_i_a2),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \in_counter_Z[1]  (
	.Q(in_counter[1]),
	.D(N_113_i_0),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \in_counter_Z[0]  (
	.Q(in_counter[0]),
	.D(state_i_0[0]),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \pipe_counter_Z[2]  (
	.Q(pipe_counter[2]),
	.D(pipe_counter_4_0_a2[2]),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \pipe_counter_Z[1]  (
	.Q(pipe_counter[1]),
	.D(pipe_counter_4_0_a2[1]),
	.C(clk),
	.CLR(rst)
);
// @25:108
  LUT4 \in_counter_RNO[1]  (
	.I0(in_counter[0]),
	.I1(state[0]),
	.I2(in_counter[1]),
	.I3(un1_state_4_0_0_lut6_2_O6),
	.O(N_113_i_0)
);
defparam \in_counter_RNO[1] .INIT=16'h88F0;
// @25:108
  FDCE \pipe_counter_Z[0]  (
	.Q(pipe_counter[0]),
	.D(in_reg_enable_fsm_0_sqmuxa),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_8_0_0_a2_lut6_2_O5)
);
// @25:108
  FDC in_reg_enable_fsm_Z (
	.Q(in_reg_enable_fsm),
	.D(in_reg_enable_fsm_0),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC done_Z (
	.Q(done_inner_prod),
	.D(done),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC acc_enable_Z (
	.Q(acc_enable),
	.D(acc_enable_0),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDP acc_clear_Z (
	.Q(acc_clear),
	.D(acc_clear_0),
	.C(clk),
	.PRE(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[0]  (
	.Q(in_a_i_reg[0]),
	.D(in_a_i_reg_2[0]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[1]  (
	.Q(in_a_i_reg[1]),
	.D(in_a_i_reg_2[1]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[2]  (
	.Q(in_a_i_reg[2]),
	.D(N_516_i_0),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[3]  (
	.Q(in_a_i_reg[3]),
	.D(N_518_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[4]  (
	.Q(in_a_i_reg[4]),
	.D(in_a_i_reg_2[4]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[5]  (
	.Q(in_a_i_reg[5]),
	.D(in_a_i_reg_2[5]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[6]  (
	.Q(in_a_i_reg[6]),
	.D(N_519_i_0),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[7]  (
	.Q(in_a_i_reg[7]),
	.D(N_520_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[8]  (
	.Q(in_a_i_reg[8]),
	.D(in_a_i_reg_2[8]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[9]  (
	.Q(in_a_i_reg[9]),
	.D(in_a_i_reg_2[9]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[10]  (
	.Q(in_a_i_reg[10]),
	.D(in_a_i_reg_2[10]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_i_reg_Z[11]  (
	.Q(in_a_i_reg[11]),
	.D(in_a_i_reg_2[11]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[3]  (
	.Q(in_a_r_reg[3]),
	.D(in_a_r_reg_3[3]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[4]  (
	.Q(in_a_r_reg[4]),
	.D(in_a_r_reg_3[4]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[5]  (
	.Q(in_a_r_reg[5]),
	.D(in_a_r_reg_3[5]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[6]  (
	.Q(in_a_r_reg[6]),
	.D(N_523_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[7]  (
	.Q(in_a_r_reg[7]),
	.D(N_193_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[8]  (
	.Q(in_a_r_reg[8]),
	.D(in_a_r_reg_3[8]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[9]  (
	.Q(in_a_r_reg[9]),
	.D(N_524_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[10]  (
	.Q(in_a_r_reg[10]),
	.D(N_183_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[11]  (
	.Q(in_a_r_reg[11]),
	.D(N_195_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[0]  (
	.Q(in_a_r_reg[0]),
	.D(N_191_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[1]  (
	.Q(in_a_r_reg[1]),
	.D(in_a_r_reg_3[1]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_a_r_reg_Z[2]  (
	.Q(in_a_r_reg[2]),
	.D(in_a_r_reg_3[2]),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \state_Z[0]  (
	.Q(state[0]),
	.D(state_ns[0]),
	.C(clk),
	.CLR(rst)
);
// @25:108
  FDC \state_Z[1]  (
	.Q(state[1]),
	.D(state_ns[1]),
	.C(clk),
	.CLR(rst)
);
// @25:181
  FDCE \acc_i_Z[11]  (
	.Q(out_inner_prod_i[11]),
	.D(acc_i_2[11]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[10]  (
	.Q(out_inner_prod_i[10]),
	.D(acc_i_2[10]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[9]  (
	.Q(out_inner_prod_i[9]),
	.D(acc_i_2[9]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[8]  (
	.Q(out_inner_prod_i[8]),
	.D(acc_i_2[8]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[7]  (
	.Q(out_inner_prod_i[7]),
	.D(acc_i_2[7]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[6]  (
	.Q(out_inner_prod_i[6]),
	.D(acc_i_2[6]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[5]  (
	.Q(out_inner_prod_i[5]),
	.D(acc_i_2[5]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[4]  (
	.Q(out_inner_prod_i[4]),
	.D(acc_i_2[4]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[3]  (
	.Q(out_inner_prod_i[3]),
	.D(acc_i_2[3]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[2]  (
	.Q(out_inner_prod_i[2]),
	.D(acc_i_2[2]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[1]  (
	.Q(out_inner_prod_i[1]),
	.D(acc_i_2[1]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_i_Z[0]  (
	.Q(out_inner_prod_i[0]),
	.D(acc_i_2[0]),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[11]  (
	.Q(out_inner_prod_r[11]),
	.D(N_26_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[10]  (
	.Q(out_inner_prod_r[10]),
	.D(N_24_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[9]  (
	.Q(out_inner_prod_r[9]),
	.D(N_22_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[8]  (
	.Q(out_inner_prod_r[8]),
	.D(N_20_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[7]  (
	.Q(out_inner_prod_r[7]),
	.D(N_18_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[6]  (
	.Q(out_inner_prod_r[6]),
	.D(N_16_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[5]  (
	.Q(out_inner_prod_r[5]),
	.D(N_14_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[4]  (
	.Q(out_inner_prod_r[4]),
	.D(N_12_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[3]  (
	.Q(out_inner_prod_r[3]),
	.D(N_10_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[2]  (
	.Q(out_inner_prod_r[2]),
	.D(N_8_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[1]  (
	.Q(out_inner_prod_r[1]),
	.D(N_6_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:181
  FDCE \acc_r_Z[0]  (
	.Q(out_inner_prod_r[0]),
	.D(N_4_i),
	.C(clk),
	.CLR(rst),
	.CE(un7_acc_enable_lut6_2_O6)
);
// @25:158
  FDC \in_b_i_reg_Z[11]  (
	.Q(in_b_i_reg[11]),
	.D(in_b_i_reg_2[11]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[10]  (
	.Q(in_b_i_reg[10]),
	.D(in_b_i_reg_2[10]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[9]  (
	.Q(in_b_i_reg[9]),
	.D(in_b_i_reg_2[9]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[8]  (
	.Q(in_b_i_reg[8]),
	.D(in_b_i_reg_2[8]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[7]  (
	.Q(in_b_i_reg[7]),
	.D(in_b_i_reg_2[7]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[6]  (
	.Q(in_b_i_reg[6]),
	.D(in_b_i_reg_2[6]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[5]  (
	.Q(in_b_i_reg[5]),
	.D(in_b_i_reg_2[5]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[4]  (
	.Q(in_b_i_reg[4]),
	.D(in_b_i_reg_2[4]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[3]  (
	.Q(in_b_i_reg[3]),
	.D(N_521_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[2]  (
	.Q(in_b_i_reg[2]),
	.D(N_517_i_0),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[1]  (
	.Q(in_b_i_reg[1]),
	.D(in_b_i_reg_2[1]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_i_reg_Z[0]  (
	.Q(in_b_i_reg[0]),
	.D(in_b_i_reg_2[0]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[11]  (
	.Q(in_b_r_reg[11]),
	.D(in_b_r_reg_2[11]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[10]  (
	.Q(in_b_r_reg[10]),
	.D(in_b_r_reg_2[10]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[9]  (
	.Q(in_b_r_reg[9]),
	.D(in_b_r_reg_2[9]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[8]  (
	.Q(in_b_r_reg[8]),
	.D(in_b_r_reg_2[8]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[7]  (
	.Q(in_b_r_reg[7]),
	.D(in_b_r_reg_2[7]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[6]  (
	.Q(in_b_r_reg[6]),
	.D(N_522_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[5]  (
	.Q(in_b_r_reg[5]),
	.D(in_b_r_reg_2[5]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[4]  (
	.Q(in_b_r_reg[4]),
	.D(in_b_r_reg_2[4]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[3]  (
	.Q(in_b_r_reg[3]),
	.D(in_b_r_reg_2[3]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[2]  (
	.Q(in_b_r_reg[2]),
	.D(in_b_r_reg_2[2]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[1]  (
	.Q(in_b_r_reg[1]),
	.D(in_b_r_reg_2[1]),
	.C(clk),
	.CLR(rst)
);
// @25:158
  FDC \in_b_r_reg_Z[0]  (
	.Q(in_b_r_reg[0]),
	.D(N_185_i),
	.C(clk),
	.CLR(rst)
);
// @25:158
  LUT5_L \in_a_r_reg_RNO[7]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_623),
	.I4(vec_in_r_AQ_mux_0_6),
	.LO(N_193_i)
);
defparam \in_a_r_reg_RNO[7] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[8]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_r_AQ_7),
	.I4(vec_in_r_AQ_mux_0_7),
	.LO(in_a_r_reg_3[8])
);
defparam \in_a_r_reg_3_cZ[8] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[1]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_r_AQ_0),
	.I4(vec_in_r_AQ_mux_0_0),
	.LO(in_a_r_reg_3[1])
);
defparam \in_a_r_reg_3_cZ[1] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_i_reg_RNO[7]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_568),
	.I4(vec_in_i_AQ_mux_0_7),
	.LO(N_520_i)
);
defparam \in_a_i_reg_RNO[7] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_r_reg_RNO[0]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_622),
	.I4(N_507),
	.LO(N_191_i)
);
defparam \in_a_r_reg_RNO[0] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[1]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_1),
	.I4(vec_in_i_AQ_mux_0_1),
	.LO(in_a_i_reg_2[1])
);
defparam \in_a_i_reg_2_cZ[1] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[0]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_0),
	.I4(vec_in_i_AQ_mux_0_0),
	.LO(in_a_i_reg_2[0])
);
defparam \in_a_i_reg_2_cZ[0] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_i_reg_RNO[2]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_549),
	.I4(N_505),
	.LO(N_516_i_0)
);
defparam \in_a_i_reg_RNO[2] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_r_reg_RNO[10]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_597),
	.I4(vec_in_r_AQ_mux_0_9),
	.LO(N_183_i)
);
defparam \in_a_r_reg_RNO[10] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_i_reg_RNO[6]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_567),
	.I4(vec_in_i_AQ_mux_0_6),
	.LO(N_519_i_0)
);
defparam \in_a_i_reg_RNO[6] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[2]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_r_AQ_1),
	.I4(vec_in_r_AQ_mux_0_1),
	.LO(in_a_r_reg_3[2])
);
defparam \in_a_r_reg_3_cZ[2] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_r_reg_RNO[9]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_596),
	.I4(vec_in_r_AQ_mux_0_8),
	.LO(N_524_i)
);
defparam \in_a_r_reg_RNO[9] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[8]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_8),
	.I4(vec_in_i_AQ_mux_0_8),
	.LO(in_a_i_reg_2[8])
);
defparam \in_a_i_reg_2_cZ[8] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[10]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_10),
	.I4(vec_in_i_AQ_mux_0_10),
	.LO(in_a_i_reg_2[10])
);
defparam \in_a_i_reg_2_cZ[10] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[5]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_628),
	.I4(vec_in_i_AQ_mux_0_5),
	.LO(in_a_i_reg_2[5])
);
defparam \in_a_i_reg_2_cZ[5] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[5]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_r_AQ_4),
	.I4(vec_in_r_AQ_mux_0_4),
	.LO(in_a_r_reg_3[5])
);
defparam \in_a_r_reg_3_cZ[5] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[4]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_637),
	.I4(vec_in_r_AQ_mux_0_3),
	.LO(in_a_r_reg_3[4])
);
defparam \in_a_r_reg_3_cZ[4] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[9]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_9),
	.I4(vec_in_i_AQ_mux_0_9),
	.LO(in_a_i_reg_2[9])
);
defparam \in_a_i_reg_2_cZ[9] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[4]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_i_AQ_4),
	.I4(vec_in_i_AQ_mux_0_4),
	.LO(in_a_i_reg_2[4])
);
defparam \in_a_i_reg_2_cZ[4] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_a_r_reg_3_cZ[3]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(single_out_r_AQ_2),
	.I4(vec_in_r_AQ_mux_0_2),
	.LO(in_a_r_reg_3[3])
);
defparam \in_a_r_reg_3_cZ[3] .INIT=32'hFC54A800;
// @25:158
  LUT5_L \in_a_i_reg_RNO[3]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_566),
	.I4(N_506),
	.LO(N_518_i)
);
defparam \in_a_i_reg_RNO[3] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[9]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[9]),
	.I4(N_585),
	.LO(in_b_i_reg_2[9])
);
defparam \in_b_i_reg_2_cZ[9] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[5]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[5]),
	.I4(single_out_r_AQ2_4),
	.LO(in_b_r_reg_2[5])
);
defparam \in_b_r_reg_2_cZ[5] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[7]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[7]),
	.I4(N_584),
	.LO(in_b_i_reg_2[7])
);
defparam \in_b_i_reg_2_cZ[7] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[8]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[8]),
	.I4(N_612),
	.LO(in_b_i_reg_2[8])
);
defparam \in_b_i_reg_2_cZ[8] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[6]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[6]),
	.I4(N_583),
	.LO(in_b_i_reg_2[6])
);
defparam \in_b_i_reg_2_cZ[6] .INIT=32'hA8FC0054;
// @25:158
  LUT5_L \in_a_r_reg_RNO[6]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_595),
	.I4(N_508),
	.LO(N_523_i)
);
defparam \in_a_r_reg_RNO[6] .INIT=32'hFC54A800;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[1]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[1]),
	.I4(single_out_r_AQ2_0),
	.LO(in_b_r_reg_2[1])
);
defparam \in_b_r_reg_2_cZ[1] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[0]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[0]),
	.I4(single_out_i_AQ2_0),
	.LO(in_b_i_reg_2[0])
);
defparam \in_b_i_reg_2_cZ[0] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[5]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_4),
	.I4(single_out_i_AQ2_5),
	.LO(in_b_i_reg_2[5])
);
defparam \in_b_i_reg_2_cZ[5] .INIT=32'hA8FC0054;
// @25:158
  LUT5_L \in_b_r_reg_RNO[0]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_501),
	.I4(N_605),
	.LO(N_185_i)
);
defparam \in_b_r_reg_RNO[0] .INIT=32'hA8FC0054;
// @25:158
  LUT5_L \in_a_r_reg_RNO[11]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(vec_in_r_AQ_mux_0_10),
	.I4(N_624),
	.LO(N_195_i)
);
defparam \in_a_r_reg_RNO[11] .INIT=32'hFCA85400;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[4]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[4]),
	.I4(single_out_i_AQ2_4),
	.LO(in_b_i_reg_2[4])
);
defparam \in_b_i_reg_2_cZ[4] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[10]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[10]),
	.I4(N_607),
	.LO(in_b_r_reg_2[10])
);
defparam \in_b_r_reg_2_cZ[10] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_a_i_reg_2_cZ[11]  (
	.I0(in_a_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(vec_in_i_AQ_mux_0_11),
	.I4(single_out_i_AQ_11),
	.LO(in_a_i_reg_2[11])
);
defparam \in_a_i_reg_2_cZ[11] .INIT=32'hFCA85400;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[8]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_7),
	.I4(N_552),
	.LO(in_b_r_reg_2[8])
);
defparam \in_b_r_reg_2_cZ[8] .INIT=32'hA8FC0054;
// @25:158
  LUT5_L \in_b_i_reg_RNO[2]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[2]),
	.I4(N_555),
	.LO(N_517_i_0)
);
defparam \in_b_i_reg_RNO[2] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[1]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_0),
	.I4(single_out_i_AQ2_1),
	.LO(in_b_i_reg_2[1])
);
defparam \in_b_i_reg_2_cZ[1] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[10]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_9),
	.I4(N_586),
	.LO(in_b_i_reg_2[10])
);
defparam \in_b_i_reg_2_cZ[10] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[3]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv[3]),
	.I4(N_645),
	.LO(in_b_r_reg_2[3])
);
defparam \in_b_r_reg_2_cZ[3] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[2]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_1),
	.I4(single_out_r_AQ2_1),
	.LO(in_b_r_reg_2[2])
);
defparam \in_b_r_reg_2_cZ[2] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[7]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_6),
	.I4(single_out_r_AQ2_6),
	.LO(in_b_r_reg_2[7])
);
defparam \in_b_r_reg_2_cZ[7] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[4]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_3),
	.I4(N_641),
	.LO(in_b_r_reg_2[4])
);
defparam \in_b_r_reg_2_cZ[4] .INIT=32'hA8FC0054;
// @25:158
  LUT5_L \in_b_i_reg_RNO[3]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_2),
	.I4(N_582),
	.LO(N_521_i)
);
defparam \in_b_i_reg_RNO[3] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[9]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(output_iv_0_8),
	.I4(N_606),
	.LO(in_b_r_reg_2[9])
);
defparam \in_b_r_reg_2_cZ[9] .INIT=32'hA8FC0054;
// @25:164
  LUT5_L \in_b_r_reg_2_cZ[11]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(out_r_vec_sub_0[11]),
	.I4(N_632),
	.LO(in_b_r_reg_2[11])
);
defparam \in_b_r_reg_2_cZ[11] .INIT=32'hFCA85400;
// @25:164
  LUT5_L \in_b_i_reg_2_cZ[11]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(out_i_vec_sub_0[11]),
	.I4(single_out_i_AQ2_11),
	.LO(in_b_i_reg_2[11])
);
defparam \in_b_i_reg_2_cZ[11] .INIT=32'hFCA85400;
// @25:158
  LUT5_L \in_b_r_reg_RNO[6]  (
	.I0(in_b_inner_prod_sel[0]),
	.I1(in_reg_enable_fsm),
	.I2(start_inner_prod),
	.I3(N_500),
	.I4(N_571),
	.LO(N_522_i)
);
defparam \in_b_r_reg_RNO[6] .INIT=32'hA8FC0054;
// @25:181
  LUT5_L \acc_r_RNO[7]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[7]),
	.I4(un2_pre_out_s_11),
	.LO(N_18_i)
);
defparam \acc_r_RNO[7] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[6]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[6]),
	.I4(un2_pre_out_s_11),
	.LO(N_16_i)
);
defparam \acc_r_RNO[6] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[5]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[5]),
	.I4(un2_pre_out_s_11),
	.LO(N_14_i)
);
defparam \acc_r_RNO[5] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[4]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[4]),
	.I4(un2_pre_out_s_11),
	.LO(N_12_i)
);
defparam \acc_r_RNO[4] .INIT=32'h33011300;
// @25:181
  LUT6_L \acc_r_RNO[0]  (
	.I0(mult_out_r[0]),
	.I1(mult_out_r[11]),
	.I2(out_inner_prod_r[0]),
	.I3(acc_clear),
	.I4(out_inner_prod_r[11]),
	.I5(un2_pre_out_s_11),
	.LO(N_4_i)
);
defparam \acc_r_RNO[0] .INIT=64'h005A007B0012005A;
// @25:181
  LUT5_L \acc_r_RNO[9]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[9]),
	.I4(un2_pre_out_s_11),
	.LO(N_22_i)
);
defparam \acc_r_RNO[9] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[3]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[3]),
	.I4(un2_pre_out_s_11),
	.LO(N_10_i)
);
defparam \acc_r_RNO[3] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[2]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[2]),
	.I4(un2_pre_out_s_11),
	.LO(N_8_i)
);
defparam \acc_r_RNO[2] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[1]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out[1]),
	.I4(un2_pre_out_s_11),
	.LO(N_6_i)
);
defparam \acc_r_RNO[1] .INIT=32'h33011300;
// @25:181
  LUT5_L \acc_r_RNO[10]  (
	.I0(mult_out_r[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_r[11]),
	.I3(un2_pre_out_0[10]),
	.I4(un2_pre_out_s_11),
	.LO(N_24_i)
);
defparam \acc_r_RNO[10] .INIT=32'h33011300;
// @25:185
  LUT6_L \acc_i_2_cZ[0]  (
	.I0(mult_out_i[0]),
	.I1(out_inner_prod_i[0]),
	.I2(mult_out_i[11]),
	.I3(acc_clear),
	.I4(out_inner_prod_i[11]),
	.I5(un2_pre_out_s_11_0),
	.LO(acc_i_2[0])
);
defparam \acc_i_2_cZ[0] .INIT=64'h0066006F00060066;
// @25:108
  LUT6_L \state_ns_0_0[1]  (
	.I0(pipe_counter[2]),
	.I1(in_counter[2]),
	.I2(in_counter[0]),
	.I3(state[1]),
	.I4(state[0]),
	.I5(red_mat_reg),
	.LO(state_ns[1])
);
defparam \state_ns_0_0[1] .INIT=64'hF0F05500CCCC5500;
// @25:108
  LUT4_L done_e (
	.I0(pipe_counter[2]),
	.I1(state[1]),
	.I2(done_inner_prod),
	.I3(state[0]),
	.LO(done)
);
defparam done_e.INIT=16'hF0C8;
// @25:108
  LUT6_L \state_ns_0_0[0]  (
	.I0(in_counter[2]),
	.I1(in_counter[0]),
	.I2(state[1]),
	.I3(state[0]),
	.I4(red_mat_reg),
	.I5(start_inner_prod),
	.LO(state_ns[0])
);
defparam \state_ns_0_0[0] .INIT=64'h330F550F33005500;
// @25:108
  LUT5_L in_reg_enable_fsm_e (
	.I0(state[1]),
	.I1(state[0]),
	.I2(in_reg_enable_fsm),
	.I3(start_inner_prod),
	.I4(in_reg_enable_fsm_0_sqmuxa),
	.LO(in_reg_enable_fsm_0)
);
defparam in_reg_enable_fsm_e.INIT=32'h3333F1F0;
// @25:185
  LUT5_L \acc_i_2_cZ[8]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out[8]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[8])
);
defparam \acc_i_2_cZ[8] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[4]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[4]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[4])
);
defparam \acc_i_2_cZ[4] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[7]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[7]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[7])
);
defparam \acc_i_2_cZ[7] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[3]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[3]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[3])
);
defparam \acc_i_2_cZ[3] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[5]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[5]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[5])
);
defparam \acc_i_2_cZ[5] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[1]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[1]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[1])
);
defparam \acc_i_2_cZ[1] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[2]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[2]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[2])
);
defparam \acc_i_2_cZ[2] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[9]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[9]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[9])
);
defparam \acc_i_2_cZ[9] .INIT=32'h33011300;
// @25:185
  LUT5_L \acc_i_2_cZ[6]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_0[6]),
	.I4(un2_pre_out_s_11_0),
	.LO(acc_i_2[6])
);
defparam \acc_i_2_cZ[6] .INIT=32'h33011300;
//@25:108
// @25:195
  complex_mult_pipe_prod cp_mult (
	.mult_out_r(mult_out_r[11:0]),
	.mult_out_i(mult_out_i[11:0]),
	.in_a_r_reg(in_a_r_reg[11:0]),
	.in_b_r_reg(in_b_r_reg[11:0]),
	.in_a_i_reg(in_a_i_reg[11:0]),
	.in_b_i_reg(in_b_i_reg[11:0]),
	.clk(clk)
);
// @25:207
  add_subZ0_add_r add_r (
	.mult_out_r(mult_out_r[11:0]),
	.out_inner_prod_r(out_inner_prod_r[11:0]),
	.un2_pre_out_10(un2_pre_out_0[10]),
	.un2_pre_out_9(un2_pre_out[9]),
	.un2_pre_out_7(un2_pre_out[7]),
	.un2_pre_out_6(un2_pre_out[6]),
	.un2_pre_out_5(un2_pre_out[5]),
	.un2_pre_out_4(un2_pre_out[4]),
	.un2_pre_out_3(un2_pre_out[3]),
	.un2_pre_out_2(un2_pre_out[2]),
	.un2_pre_out_1(un2_pre_out[1]),
	.acc_clear(acc_clear),
	.un2_pre_out_s_11(un2_pre_out_s_11),
	.N_26_i(N_26_i),
	.N_20_i(N_20_i)
);
// @25:215
  add_subZ0_add_r_1 add_i (
	.mult_out_i(mult_out_i[11:0]),
	.out_inner_prod_i(out_inner_prod_i[11:0]),
	.un2_pre_out_10(un2_pre_out[10]),
	.un2_pre_out_9(un2_pre_out_0[9]),
	.un2_pre_out_8(un2_pre_out[8]),
	.un2_pre_out_7(un2_pre_out_0[7]),
	.un2_pre_out_6(un2_pre_out_0[6]),
	.un2_pre_out_5(un2_pre_out_0[5]),
	.un2_pre_out_4(un2_pre_out_0[4]),
	.un2_pre_out_3(un2_pre_out_0[3]),
	.un2_pre_out_2(un2_pre_out_0[2]),
	.un2_pre_out_1(un2_pre_out_0[1]),
	.un2_pre_out_s_11_0(un2_pre_out_s_11_0)
);
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
// @26:363
  LUT4 \in_counter_RNICR971_o6[1]  (
	.I0(in_counter[1]),
	.I1(in_counter[2]),
	.I2(state[0]),
	.I3(un1_state_4_0_0_lut6_2_O6),
	.O(in_counter_5_43_i_i_a2)
);
defparam \in_counter_RNICR971_o6[1] .INIT=16'hA0CC;
// @26:363
  LUT3 \in_counter_RNICR971_o5[1]  (
	.I0(in_counter[0]),
	.I1(state[0]),
	.I2(un1_state_4_0_0_lut6_2_O6),
	.O(state_i_0[0])
);
defparam \in_counter_RNICR971_o5[1] .INIT=8'h3A;
// @25:117
  LUT4 \pipe_counter_4_0_a2_lut6_2_o6[2]  (
	.I0(pipe_counter[1]),
	.I1(pipe_counter[2]),
	.I2(state[0]),
	.I3(un1_state_8_0_0_a2_lut6_2_O5),
	.O(pipe_counter_4_0_a2[2])
);
defparam \pipe_counter_4_0_a2_lut6_2_o6[2] .INIT=16'h0ACC;
// @25:117
  LUT4 \pipe_counter_4_0_a2_lut6_2_o5[2]  (
	.I0(pipe_counter[0]),
	.I1(pipe_counter[1]),
	.I2(state[0]),
	.I3(un1_state_8_0_0_a2_lut6_2_O5),
	.O(pipe_counter_4_0_a2[1])
);
defparam \pipe_counter_4_0_a2_lut6_2_o5[2] .INIT=16'h0ACC;
// @25:188
  LUT2 un7_acc_enable_lut6_2_o6 (
	.I0(acc_enable),
	.I1(acc_clear),
	.O(un7_acc_enable_lut6_2_O6)
);
defparam un7_acc_enable_lut6_2_o6.INIT=4'hE;
// @25:188
  LUT4 un7_acc_enable_lut6_2_o5 (
	.I0(state[1]),
	.I1(state[0]),
	.I2(acc_clear),
	.I3(start_inner_prod),
	.O(acc_clear_0)
);
defparam un7_acc_enable_lut6_2_o5.INIT=16'hB1A0;
// @25:117
  LUT4 un1_state_8_0_0_a2_lut6_2_o6 (
	.I0(in_counter[2]),
	.I1(in_counter[0]),
	.I2(state[0]),
	.I3(red_mat_reg),
	.O(in_reg_enable_fsm_0_sqmuxa)
);
defparam un1_state_8_0_0_a2_lut6_2_o6.INIT=16'hC0A0;
// @25:117
  LUT5 un1_state_8_0_0_a2_lut6_2_o5 (
	.I0(in_counter[2]),
	.I1(in_counter[0]),
	.I2(state[1]),
	.I3(state[0]),
	.I4(red_mat_reg),
	.O(un1_state_8_0_0_a2_lut6_2_O5)
);
defparam un1_state_8_0_0_a2_lut6_2_o5.INIT=32'hFCF0FAF0;
// @25:117
  LUT3 un1_state_4_0_0_lut6_2_o6 (
	.I0(state[1]),
	.I1(state[0]),
	.I2(start_inner_prod),
	.O(un1_state_4_0_0_lut6_2_O6)
);
defparam un1_state_4_0_0_lut6_2_o6.INIT=8'hDC;
// @25:117
  LUT4 un1_state_4_0_0_lut6_2_o5 (
	.I0(acc_enable),
	.I1(pipe_counter[2]),
	.I2(state[1]),
	.I3(state[0]),
	.O(acc_enable_0)
);
defparam un1_state_4_0_0_lut6_2_o5.INIT=16'hFF2A;
// @25:185
  LUT4 \acc_i_2_lut6_2_o6[11]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out_s_11_0),
	.O(acc_i_2[11])
);
defparam \acc_i_2_lut6_2_o6[11] .INIT=16'h3220;
// @25:185
  LUT5 \acc_i_2_lut6_2_o5[11]  (
	.I0(mult_out_i[11]),
	.I1(acc_clear),
	.I2(out_inner_prod_i[11]),
	.I3(un2_pre_out[10]),
	.I4(un2_pre_out_s_11_0),
	.O(acc_i_2[10])
);
defparam \acc_i_2_lut6_2_o5[11] .INIT=32'h33011300;
endmodule