module qr_decomp_ctl (
  col_sel_AQ_int,
  col_sel_AQ2_int,
  row_sel_AQ,
  state_5,
  state_8,
  state_3,
  in_b_inner_prod_sel,
  w_col_sel_AQ_int,
  col_sel_R_int,
  row_sel_R,
  in_a_inner_prod_sel,
  vec_in_AQ_sel,
  single_in_R_sel,
  single_in_R_sel_0,
  wr_en_AQ_sel,
  wr_en_AQ_sel_0,
  in_b_vec_mult_sel,
  red_mat_reg,
  rst,
  done_inv_sqrt,
  N_512_i,
  done_inner_prod,
  start_inv_sqrt,
  clk,
  start_inner_prod,
  wr_en_AQ_int,
  wr_en_R,
  w_in_a_vec_sub,
  done_QR,
  start_QR,
  red_mat_reg_0
)
;
output [1:0] col_sel_AQ_int ;
output [1:0] col_sel_AQ2_int ;
output [1:0] row_sel_AQ ;
output state_5 ;
output state_8 ;
output state_3 ;
output [0:0] in_b_inner_prod_sel ;
output [1:0] w_col_sel_AQ_int ;
output [1:0] col_sel_R_int ;
output [1:0] row_sel_R ;
output [0:0] in_a_inner_prod_sel ;
output [1:0] vec_in_AQ_sel ;
output [0:0] single_in_R_sel ;
input [0:0] single_in_R_sel_0 ;
output [0:0] wr_en_AQ_sel ;
input [0:0] wr_en_AQ_sel_0 ;
output [0:0] in_b_vec_mult_sel ;
output red_mat_reg ;
input rst ;
input done_inv_sqrt ;
output N_512_i ;
input done_inner_prod ;
output start_inv_sqrt ;
input clk ;
output start_inner_prod ;
output wr_en_AQ_int ;
output wr_en_R ;
output w_in_a_vec_sub ;
output done_QR ;
input start_QR ;
input red_mat_reg_0 ;
wire state_5 ;
wire state_8 ;
wire state_3 ;
wire red_mat_reg ;
wire rst ;
wire done_inv_sqrt ;
wire N_512_i ;
wire done_inner_prod ;
wire start_inv_sqrt ;
wire clk ;
wire start_inner_prod ;
wire wr_en_AQ_int ;
wire wr_en_R ;
wire w_in_a_vec_sub ;
wire done_QR ;
wire start_QR ;
wire red_mat_reg_0 ;
wire [7:0] state;
wire [2:0] mult_counter;
wire [5:5] state_ns_2_tz;
wire [7:1] state_ns;
wire [0:0] in_b_inner_prod_sel_0;
wire [1:0] w_col_sel_AQ_int_4_i_m2_i_m3;
wire [1:0] col_sel_R_int_4_i_m2_i_m3;
wire [0:0] in_a_inner_prod_sel_0;
wire [1:1] j_RNO;
wire VCC ;
wire N_676 ;
wire N_210_i ;
wire N_526 ;
wire row_sel_R_0_sqmuxa ;
wire row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_O5 ;
wire N_662 ;
wire N_201_2 ;
wire N_706 ;
wire N_686 ;
wire N_495 ;
wire N_503 ;
wire N_652 ;
wire un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_O6 ;
wire un1_state_10_0_o6_0_o2_lut6_2_O6 ;
wire N_653 ;
wire start_inv_sqrt_0 ;
wire un1_state_23_0_0_o2_lut6_2_O6 ;
wire N_513_i ;
wire N_218_i ;
wire un1_state_33_0_0 ;
wire N_220_i ;
wire start_inner_prod_0 ;
wire wr_en_AQ_int_0 ;
wire un1_state_29_0_0 ;
wire N_514_i ;
wire wr_en_R_0 ;
wire w_in_a_vec_sub_0 ;
wire pre_red_mat_reg ;
wire done ;
wire N_214_i ;
wire N_216_i ;
wire N_231_i ;
wire N_201_i ;
wire N_196_3 ;
wire N_106_1 ;
wire N_527 ;
wire N_106_2 ;
wire N_123 ;
wire N_122 ;
wire N_121 ;
wire N_120 ;
wire N_119 ;
wire N_118 ;
wire N_117 ;
wire N_116 ;
wire N_115 ;
wire GND ;
// @20:112
  FDC \w_col_sel_AQ_int_Z[1]  (
	.Q(w_col_sel_AQ_int[1]),
	.D(w_col_sel_AQ_int_4_i_m2_i_m3[1]),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \w_col_sel_AQ_int_Z[0]  (
	.Q(w_col_sel_AQ_int[0]),
	.D(w_col_sel_AQ_int_4_i_m2_i_m3[0]),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \col_sel_R_int_Z[1]  (
	.Q(col_sel_R_int[1]),
	.D(col_sel_R_int_4_i_m2_i_m3[1]),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \col_sel_R_int_Z[0]  (
	.Q(col_sel_R_int[0]),
	.D(col_sel_R_int_4_i_m2_i_m3[0]),
	.C(clk),
	.CLR(rst)
);
// @20:154
  LUT5 \w_col_sel_AQ_int_4_i_m2_i_m3_cZ[0]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(state[7]),
	.I2(col_sel_AQ_int[0]),
	.I3(w_col_sel_AQ_int[0]),
	.I4(un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_O6),
	.O(w_col_sel_AQ_int_4_i_m2_i_m3[0])
);
defparam \w_col_sel_AQ_int_4_i_m2_i_m3_cZ[0] .INIT=32'hE2E2FF00;
// @20:154
  LUT5 \w_col_sel_AQ_int_4_i_m2_i_m3_cZ[1]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(state[7]),
	.I2(col_sel_AQ_int[1]),
	.I3(w_col_sel_AQ_int[1]),
	.I4(un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_O6),
	.O(w_col_sel_AQ_int_4_i_m2_i_m3[1])
);
defparam \w_col_sel_AQ_int_4_i_m2_i_m3_cZ[1] .INIT=32'hE2E2FF00;
// @20:154
  LUT5 \col_sel_R_int_4_i_m2_i_m3_cZ[0]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(state_5),
	.I2(col_sel_AQ_int[0]),
	.I3(col_sel_R_int[0]),
	.I4(un1_state_23_0_0_o2_lut6_2_O6),
	.O(col_sel_R_int_4_i_m2_i_m3[0])
);
defparam \col_sel_R_int_4_i_m2_i_m3_cZ[0] .INIT=32'hE2E2FF00;
// @20:154
  LUT5 \col_sel_R_int_4_i_m2_i_m3_cZ[1]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(state_5),
	.I2(col_sel_AQ_int[1]),
	.I3(col_sel_R_int[1]),
	.I4(un1_state_23_0_0_o2_lut6_2_O6),
	.O(col_sel_R_int_4_i_m2_i_m3[1])
);
defparam \col_sel_R_int_4_i_m2_i_m3_cZ[1] .INIT=32'hE2E2FF00;
// @20:112
  FDCE \row_sel_R_Z[0]  (
	.Q(row_sel_R[0]),
	.D(col_sel_AQ_int[0]),
	.C(clk),
	.CLR(rst),
	.CE(row_sel_R_0_sqmuxa)
);
// @20:112
  FDCE \row_sel_R_Z[1]  (
	.Q(row_sel_R[1]),
	.D(col_sel_AQ_int[1]),
	.C(clk),
	.CLR(rst),
	.CE(row_sel_R_0_sqmuxa)
);
// @20:112
  FDP \in_b_inner_prod_sel_Z[0]  (
	.Q(in_b_inner_prod_sel[0]),
	.D(in_b_inner_prod_sel_0[0]),
	.C(clk),
	.PRE(rst)
);
// @20:112
  FDCE \row_sel_AQ2_Z[0]  (
	.Q(row_sel_AQ[0]),
	.D(N_218_i),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_33_0_0)
);
// @20:112
  FDCE \row_sel_AQ2_Z[1]  (
	.Q(row_sel_AQ[1]),
	.D(N_220_i),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_33_0_0)
);
// @20:112
  FDC start_inner_prod_Z (
	.Q(start_inner_prod),
	.D(start_inner_prod_0),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDP \in_a_inner_prod_sel_Z[0]  (
	.Q(in_a_inner_prod_sel[0]),
	.D(in_a_inner_prod_sel_0[0]),
	.C(clk),
	.PRE(rst)
);
// @20:112
  FDC wr_en_AQ_int_Z (
	.Q(wr_en_AQ_int),
	.D(wr_en_AQ_int_0),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDCE \mult_counter_Z[0]  (
	.Q(mult_counter[0]),
	.D(un1_state_23_0_0_o2_lut6_2_O6),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_29_0_0)
);
// @20:112
  FDCE \mult_counter_Z[1]  (
	.Q(mult_counter[1]),
	.D(N_513_i),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_29_0_0)
);
// @20:112
  FDCE \mult_counter_Z[2]  (
	.Q(mult_counter[2]),
	.D(N_514_i),
	.C(clk),
	.CLR(rst),
	.CE(un1_state_29_0_0)
);
// @20:112
  FDC wr_en_R_Z (
	.Q(wr_en_R),
	.D(wr_en_R_0),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDCE \vec_in_AQ_sel_Z[0]  (
	.Q(vec_in_AQ_sel[0]),
	.D(state_5),
	.C(clk),
	.CLR(rst),
	.CE(row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_O5)
);
// @20:112
  FDCE \vec_in_AQ_sel_Z[1]  (
	.Q(vec_in_AQ_sel[1]),
	.D(state[2]),
	.C(clk),
	.CLR(rst),
	.CE(row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_O5)
);
// @20:112
  FDC w_in_a_vec_sub_Z (
	.Q(w_in_a_vec_sub),
	.D(w_in_a_vec_sub_0),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC start_inv_sqrt_Z (
	.Q(start_inv_sqrt),
	.D(start_inv_sqrt_0),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \single_in_R_sel_Z[0]  (
	.Q(single_in_R_sel[0]),
	.D(single_in_R_sel_0[0]),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC pre_red_mat_reg_Z (
	.Q(red_mat_reg),
	.D(pre_red_mat_reg),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC done_Z (
	.Q(done_QR),
	.D(done),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \wr_en_AQ_sel_Z[0]  (
	.Q(wr_en_AQ_sel[0]),
	.D(wr_en_AQ_sel_0[0]),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \k_Z[0]  (
	.Q(col_sel_AQ_int[0]),
	.D(N_214_i),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \k_Z[1]  (
	.Q(col_sel_AQ_int[1]),
	.D(N_216_i),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \j_Z[0]  (
	.Q(col_sel_AQ2_int[0]),
	.D(N_231_i),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDC \j_Z[1]  (
	.Q(col_sel_AQ2_int[1]),
	.D(j_RNO[1]),
	.C(clk),
	.CLR(rst)
);
// @20:156
  FDP \state_Z[8]  (
	.Q(state_8),
	.D(N_201_i),
	.C(clk),
	.PRE(rst)
);
// @20:184
  FDC \state_Z[7]  (
	.Q(state[7]),
	.D(state_ns[1]),
	.C(clk),
	.CLR(rst)
);
// @20:199
  FDC \state_Z[6]  (
	.Q(state[6]),
	.D(state_ns[2]),
	.C(clk),
	.CLR(rst)
);
// @20:208
  FDC \state_Z[5]  (
	.Q(state_5),
	.D(state_ns[3]),
	.C(clk),
	.CLR(rst)
);
// @20:221
  FDC \state_Z[4]  (
	.Q(state[4]),
	.D(state_ns[4]),
	.C(clk),
	.CLR(rst)
);
// @20:248
  FDC \state_Z[3]  (
	.Q(state_3),
	.D(state_ns[5]),
	.C(clk),
	.CLR(rst)
);
// @20:265
  FDC \state_Z[2]  (
	.Q(state[2]),
	.D(state_ns[6]),
	.C(clk),
	.CLR(rst)
);
// @20:276
  FDC \state_Z[1]  (
	.Q(state[1]),
	.D(state_ns[7]),
	.C(clk),
	.CLR(rst)
);
// @20:308
  FDC \state_Z[0]  (
	.Q(state[0]),
	.D(N_210_i),
	.C(clk),
	.CLR(rst)
);
// @20:112
  FDPE \in_b_vec_mult_sel_Z[0]  (
	.Q(in_b_vec_mult_sel[0]),
	.D(row_sel_R_0_sqmuxa),
	.C(clk),
	.PRE(rst),
	.CE(un1_state_23_0_0_o2_lut6_2_O6)
);
// @20:154
  LUT6 un1_state_29_0_0_cZ (
	.I0(done_inner_prod),
	.I1(state[1]),
	.I2(state[2]),
	.I3(state[4]),
	.I4(state_5),
	.I5(done_inv_sqrt),
	.O(un1_state_29_0_0)
);
defparam un1_state_29_0_0_cZ.INIT=64'hFFFFFFECFFECFFEC;
// @20:112
  LUT5_L \mult_counter_RNO[2]  (
	.I0(mult_counter[1]),
	.I1(done_inner_prod),
	.I2(state[2]),
	.I3(state_5),
	.I4(done_inv_sqrt),
	.LO(N_514_i)
);
defparam \mult_counter_RNO[2] .INIT=32'h002A2A2A;
// @20:112
  LUT6_L \state_ns_0[5]  (
	.I0(state_3),
	.I1(state[1]),
	.I2(mult_counter[2]),
	.I3(state_ns_2_tz[5]),
	.I4(N_526),
	.I5(N_676),
	.LO(state_ns[5])
);
defparam \state_ns_0[5] .INIT=64'hFFFFFFFFEAAAC000;
// @20:112
  LUT6_L \row_sel_AQ2_RNO[0]  (
	.I0(start_QR),
	.I1(state[1]),
	.I2(mult_counter[2]),
	.I3(state_8),
	.I4(row_sel_AQ[0]),
	.I5(N_676),
	.LO(N_218_i)
);
defparam \row_sel_AQ2_RNO[0] .INIT=64'h000000000000153F;
// @20:112
  LUT6_L \in_a_inner_prod_sel_e[0]  (
	.I0(state_3),
	.I1(state[7]),
	.I2(state_8),
	.I3(in_a_inner_prod_sel[0]),
	.I4(N_676),
	.I5(N_652),
	.LO(in_a_inner_prod_sel_0[0])
);
defparam \in_a_inner_prod_sel_e[0] .INIT=64'hFEFEFEFEFEFEFFEE;
// @20:154
  LUT6 un1_state_33_0_0_cZ (
	.I0(state_3),
	.I1(start_QR),
	.I2(state[7]),
	.I3(state_8),
	.I4(N_706),
	.I5(N_676),
	.O(un1_state_33_0_0)
);
defparam un1_state_33_0_0_cZ.INIT=64'hFFFFFFFFFFFFFEFA;
// @20:154
  LUT6_L un1_state_28_i_0_3 (
	.I0(state[7]),
	.I1(done_inner_prod),
	.I2(state[2]),
	.I3(state_5),
	.I4(state_8),
	.I5(N_662),
	.LO(N_196_3)
);
defparam un1_state_28_i_0_3.INIT=64'hFFFFFFFFFFFFFFBA;
// @20:112
  LUT6_L \state_ns_0[2]  (
	.I0(state[6]),
	.I1(state[7]),
	.I2(done_inner_prod),
	.I3(red_mat_reg),
	.I4(row_sel_AQ[1]),
	.I5(row_sel_AQ[0]),
	.LO(state_ns[2])
);
defparam \state_ns_0[2] .INIT=64'hCECECE0A0A0A0A0A;
// @20:112
  LUT6_L \state_ns_0[6]  (
	.I0(state_3),
	.I1(done_inner_prod),
	.I2(state[2]),
	.I3(red_mat_reg),
	.I4(row_sel_AQ[1]),
	.I5(row_sel_AQ[0]),
	.LO(state_ns[6])
);
defparam \state_ns_0[6] .INIT=64'hBABABA3030303030;
// @20:154
  LUT6 \j_RNO_0[1]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(state[1]),
	.I2(state[4]),
	.I3(mult_counter[2]),
	.I4(col_sel_AQ_int[1]),
	.I5(col_sel_AQ_int[0]),
	.O(N_106_1)
);
defparam \j_RNO_0[1] .INIT=64'h00008800F8000000;
// @20:112
  LUT4_L w_in_a_vec_sub_e (
	.I0(done_inner_prod),
	.I1(state[1]),
	.I2(state[2]),
	.I3(w_in_a_vec_sub),
	.LO(w_in_a_vec_sub_0)
);
defparam w_in_a_vec_sub_e.INIT=16'hB3A0;
// @20:112
  LUT6_L \k_RNO[0]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(red_mat_reg),
	.I2(mult_counter[2]),
	.I3(state_8),
	.I4(col_sel_AQ_int[0]),
	.I5(N_495),
	.LO(N_214_i)
);
defparam \k_RNO[0] .INIT=64'h00FF0000001F00E0;
// @20:112
  LUT4_L \state_ns_0[3]  (
	.I0(state[6]),
	.I1(done_inner_prod),
	.I2(state_5),
	.I3(done_inv_sqrt),
	.LO(state_ns[3])
);
defparam \state_ns_0[3] .INIT=16'h88F8;
// @20:112
  LUT4_L pre_red_mat_reg_e (
	.I0(red_mat_reg_0),
	.I1(start_QR),
	.I2(red_mat_reg),
	.I3(state_8),
	.LO(pre_red_mat_reg)
);
defparam pre_red_mat_reg_e.INIT=16'hB8F0;
// @20:112
  LUT3_L done_e (
	.I0(done_QR),
	.I1(state[0]),
	.I2(state_8),
	.LO(done)
);
defparam done_e.INIT=8'hCE;
// @20:154
  LUT6 un1_state_1_sqmuxa_3_0_o2_0 (
	.I0(col_sel_AQ2_int[1]),
	.I1(red_mat_reg),
	.I2(mult_counter[2]),
	.I3(state_8),
	.I4(col_sel_AQ_int[1]),
	.I5(N_495),
	.O(N_652)
);
defparam un1_state_1_sqmuxa_3_0_o2_0.INIT=64'hFF00FF00FFE0FFC0;
// @20:154
  LUT6 \state_RNI7A6I2[4]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(state[4]),
	.I2(red_mat_reg),
	.I3(col_sel_AQ_int[1]),
	.I4(col_sel_AQ_int[0]),
	.I5(N_495),
	.O(N_527)
);
defparam \state_RNI7A6I2[4] .INIT=64'h000C0000050D0505;
// @20:112
  LUT5_L \state_ns_0[1]  (
	.I0(start_QR),
	.I1(state[7]),
	.I2(state_8),
	.I3(N_526),
	.I4(N_503),
	.LO(state_ns[1])
);
defparam \state_ns_0[1] .INIT=32'hECA0FFFF;
// @20:156
  LUT6_L \state_RNO[8]  (
	.I0(state[0]),
	.I1(state[6]),
	.I2(start_QR),
	.I3(state[2]),
	.I4(state_5),
	.I5(N_201_2),
	.LO(N_201_i)
);
defparam \state_RNO[8] .INIT=64'h0000000000000023;
// @20:112
  LUT6_L wr_en_AQ_int_e (
	.I0(wr_en_AQ_int),
	.I1(state[6]),
	.I2(state[2]),
	.I3(mult_counter[2]),
	.I4(un1_state_10_0_o6_0_o2_lut6_2_O6),
	.I5(N_653),
	.LO(wr_en_AQ_int_0)
);
defparam wr_en_AQ_int_e.INIT=64'hAAAAAAAAABAAA8A8;
// @20:112
  LUT5_L wr_en_R_e (
	.I0(state[6]),
	.I1(wr_en_R),
	.I2(state[2]),
	.I3(state[4]),
	.I4(N_196_3),
	.LO(wr_en_R_0)
);
defparam wr_en_R_e.INIT=32'hCCCCDDD8;
// @20:154
  LUT6_L \j_RNO_1[1]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(state[1]),
	.I2(mult_counter[2]),
	.I3(state_8),
	.I4(col_sel_AQ_int[0]),
	.I5(N_527),
	.LO(N_106_2)
);
defparam \j_RNO_1[1] .INIT=64'hF0FAF0FA002A000A;
// @20:112
  LUT4_L \k_RNO[1]  (
	.I0(state_8),
	.I1(col_sel_AQ_int[1]),
	.I2(col_sel_AQ_int[0]),
	.I3(N_503),
	.LO(N_216_i)
);
defparam \k_RNO[1] .INIT=16'h4414;
// @20:112
  LUT6_L \row_sel_AQ2_RNO[1]  (
	.I0(start_QR),
	.I1(state_8),
	.I2(row_sel_AQ[1]),
	.I3(row_sel_AQ[0]),
	.I4(N_706),
	.I5(N_676),
	.LO(N_220_i)
);
defparam \row_sel_AQ2_RNO[1] .INIT=64'h0000000000000770;
// @20:112
  LUT6_L start_inner_prod_e (
	.I0(start_QR),
	.I1(state_8),
	.I2(start_inner_prod),
	.I3(un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_O6),
	.I4(N_706),
	.I5(N_676),
	.LO(start_inner_prod_0)
);
defparam start_inner_prod_e.INIT=64'hFFFFFFFFFFFF88B8;
// @20:154
  LUT6_L \j_RNO_cZ[1]  (
	.I0(col_sel_AQ2_int[1]),
	.I1(state[4]),
	.I2(state_8),
	.I3(N_495),
	.I4(N_106_1),
	.I5(N_106_2),
	.LO(j_RNO[1])
);
defparam \j_RNO_cZ[1] .INIT=64'hFFFFFFFFFFFF0200;
// @20:112
  LUT6_L \j_RNO[0]  (
	.I0(mult_counter[2]),
	.I1(state_8),
	.I2(col_sel_AQ_int[0]),
	.I3(N_495),
	.I4(N_686),
	.I5(N_527),
	.LO(N_231_i)
);
defparam \j_RNO[0] .INIT=64'h0000111100003313;
//@20:112
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
// @20:154
  LUT4 un1_state_23_0_0_o2_lut6_2_o6 (
	.I0(done_inner_prod),
	.I1(state[2]),
	.I2(state_5),
	.I3(done_inv_sqrt),
	.O(un1_state_23_0_0_o2_lut6_2_O6)
);
defparam un1_state_23_0_0_o2_lut6_2_o6.INIT=16'hF888;
// @20:154
  LUT5 un1_state_23_0_0_o2_lut6_2_o5 (
	.I0(mult_counter[0]),
	.I1(done_inner_prod),
	.I2(state[2]),
	.I3(state_5),
	.I4(done_inv_sqrt),
	.O(N_513_i)
);
defparam un1_state_23_0_0_o2_lut6_2_o5.INIT=32'h002A2A2A;
// @20:154
  LUT2 un1_state_25_0_0_o2_lut6_2_o6 (
	.I0(state_5),
	.I1(state_8),
	.O(N_653)
);
defparam un1_state_25_0_0_o2_lut6_2_o6.INIT=4'hE;
// @20:154
  LUT5 un1_state_25_0_0_o2_lut6_2_o5 (
	.I0(state[6]),
	.I1(done_inner_prod),
	.I2(state_5),
	.I3(start_inv_sqrt),
	.I4(state_8),
	.O(start_inv_sqrt_0)
);
defparam un1_state_25_0_0_o2_lut6_2_o5.INIT=32'hAAAAAFA8;
// @20:154
  LUT2 un1_state_10_0_o6_0_o2_lut6_2_o6 (
	.I0(state[1]),
	.I1(state[4]),
	.O(un1_state_10_0_o6_0_o2_lut6_2_O6)
);
defparam un1_state_10_0_o6_0_o2_lut6_2_o6.INIT=4'hE;
// @20:154
  LUT4 un1_state_10_0_o6_0_o2_lut6_2_o5 (
	.I0(state[1]),
	.I1(done_inner_prod),
	.I2(state[2]),
	.I3(mult_counter[2]),
	.O(state_ns[7])
);
defparam un1_state_10_0_o6_0_o2_lut6_2_o5.INIT=16'hC0EA;
// @20:154
  LUT2 un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_o6 (
	.I0(state_3),
	.I1(state[7]),
	.O(un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_O6)
);
defparam un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_o6.INIT=4'hE;
// @20:154
  LUT5 un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_o5 (
	.I0(state_3),
	.I1(state[7]),
	.I2(state_8),
	.I3(in_b_inner_prod_sel[0]),
	.I4(N_652),
	.O(in_b_inner_prod_sel_0[0])
);
defparam un1_state_1_sqmuxa_3_0_o6_0_o2_lut6_2_o5.INIT=32'hFEFEFFEE;
// @20:154
  LUT2 \j_RNID3171_o6[0]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(state[1]),
	.O(N_495)
);
defparam \j_RNID3171_o6[0] .INIT=4'h7;
// @20:154
  LUT5 \j_RNID3171_o5[0]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(col_sel_AQ2_int[1]),
	.I2(state[1]),
	.I3(red_mat_reg),
	.I4(mult_counter[2]),
	.O(N_503)
);
defparam \j_RNID3171_o5[0] .INIT=32'h5F7FFFFF;
// @20:154
  LUT2 un1_state_1_sqmuxa_4_0_0_a3_lut6_2_o6 (
	.I0(state[1]),
	.I1(mult_counter[2]),
	.O(N_706)
);
defparam un1_state_1_sqmuxa_4_0_0_a3_lut6_2_o6.INIT=4'h8;
// @20:154
  LUT5 un1_state_1_sqmuxa_4_0_0_a3_lut6_2_o5 (
	.I0(col_sel_AQ2_int[0]),
	.I1(state[1]),
	.I2(state[4]),
	.I3(mult_counter[2]),
	.I4(col_sel_AQ_int[0]),
	.O(N_686)
);
defparam un1_state_1_sqmuxa_4_0_0_a3_lut6_2_o5.INIT=32'h11550155;
// @20:112
  LUT2 \state_ns_0_a2_lut6_2_o6[4]  (
	.I0(state[4]),
	.I1(mult_counter[2]),
	.O(N_662)
);
defparam \state_ns_0_a2_lut6_2_o6[4] .INIT=4'h2;
// @20:112
  LUT4 \state_ns_0_a2_lut6_2_o5[4]  (
	.I0(state_3),
	.I1(state[7]),
	.I2(state[4]),
	.I3(state[1]),
	.O(N_201_2)
);
defparam \state_ns_0_a2_lut6_2_o5[4] .INIT=16'hFFFE;
// @20:210
  LUT2 row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_o6 (
	.I0(state_5),
	.I1(done_inv_sqrt),
	.O(row_sel_R_0_sqmuxa)
);
defparam row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_o6.INIT=4'h8;
// @20:210
  LUT5 row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_o5 (
	.I0(done_inner_prod),
	.I1(state[2]),
	.I2(state_5),
	.I3(state_8),
	.I4(done_inv_sqrt),
	.O(row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_O5)
);
defparam row_sel_R_0_sqmuxa_0_a6_0_a2_lut6_2_o5.INIT=32'hFFF8FF88;
// @13:37
  LUT2 \state_RNI5VEU_o6[4]  (
	.I0(rst),
	.I1(state[4]),
	.O(N_512_i)
);
defparam \state_RNI5VEU_o6[4] .INIT=4'h4;
// @13:37
  LUT4 \state_RNI5VEU_o5[4]  (
	.I0(state[4]),
	.I1(mult_counter[2]),
	.I2(state_5),
	.I3(done_inv_sqrt),
	.O(state_ns[4])
);
defparam \state_RNI5VEU_o5[4] .INIT=16'hF222;
// @20:112
  LUT3 \state_ns_0_o3_lut6_2_o6[1]  (
	.I0(red_mat_reg),
	.I1(row_sel_AQ[1]),
	.I2(row_sel_AQ[0]),
	.O(N_526)
);
defparam \state_ns_0_o3_lut6_2_o6[1] .INIT=8'h1F;
// @20:112
  LUT3 \state_ns_0_o3_lut6_2_o5[1]  (
	.I0(col_sel_AQ2_int[0]),
	.I1(col_sel_AQ2_int[1]),
	.I2(red_mat_reg),
	.O(state_ns_2_tz[5])
);
defparam \state_ns_0_o3_lut6_2_o5[1] .INIT=8'h57;
// @20:112
  LUT5 \state_ns_0_a2_0_lut6_2_o6[5]  (
	.I0(state[4]),
	.I1(red_mat_reg),
	.I2(mult_counter[2]),
	.I3(col_sel_AQ_int[1]),
	.I4(col_sel_AQ_int[0]),
	.O(N_676)
);
defparam \state_ns_0_a2_0_lut6_2_o6[5] .INIT=32'h0020A0A0;
// @20:112
  LUT5 \state_ns_0_a2_0_lut6_2_o5[5]  (
	.I0(state[4]),
	.I1(red_mat_reg),
	.I2(mult_counter[2]),
	.I3(col_sel_AQ_int[1]),
	.I4(col_sel_AQ_int[0]),
	.O(N_210_i)
);
defparam \state_ns_0_a2_0_lut6_2_o5[5] .INIT=32'hA0800000;
endmodule