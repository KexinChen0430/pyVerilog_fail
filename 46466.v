module mat_regs (
  col_sel_AQ2_mux_i_m3_lut6_2_O6,
  col_sel_AQ2_mux_i_m3_lut6_2_O5,
  col_sel_AQ_int,
  w_col_sel_AQ_mux_i_m3_lut6_2_O6,
  w_col_sel_AQ_mux_i_m3_lut6_2_O5,
  vec_out_r_AQ_0,
  vec_in_r_AQ_mux_0_4,
  vec_in_r_AQ_mux_0_9,
  vec_in_r_AQ_mux_0_6,
  vec_in_r_AQ_mux_0_0,
  vec_in_r_AQ_mux_0_1,
  vec_in_r_AQ_mux_0_2,
  vec_in_r_AQ_mux_0_3,
  vec_in_r_AQ_mux_0_10,
  vec_in_r_AQ_mux_0_7,
  vec_in_r_AQ_mux_0_8,
  vec_out_r_AQ_3,
  vec_in_r_AQ_mux_3,
  out_Q_r,
  vec_out_r_AQ_2,
  vec_out_r_AQ_1,
  vec_in_r_AQ_mux_2,
  vec_in_r_AQ_mux_1,
  vec_out_i_AQ_0,
  vec_in_i_AQ_mux_0_5,
  vec_in_i_AQ_mux_0_10,
  vec_in_i_AQ_mux_0_7,
  vec_in_i_AQ_mux_0_0,
  vec_in_i_AQ_mux_0_1,
  vec_in_i_AQ_mux_0_4,
  vec_in_i_AQ_mux_0_6,
  vec_in_i_AQ_mux_0_11,
  vec_in_i_AQ_mux_0_8,
  vec_in_i_AQ_mux_0_9,
  vec_out_i_AQ_3,
  vec_in_i_AQ_mux_3,
  out_Q_i,
  vec_out_i_AQ_2,
  vec_out_i_AQ_1,
  vec_in_i_AQ_mux_2,
  vec_in_i_AQ_mux_1,
  row_sel_AQ,
  single_out_r_AQ2_1,
  single_out_r_AQ2_6,
  single_out_r_AQ2_4,
  single_out_r_AQ2_0,
  single_out_i_AQ2_1,
  single_out_i_AQ2_5,
  single_out_i_AQ2_4,
  single_out_i_AQ2_0,
  single_out_i_AQ2_11,
  single_out_i_AQ_1,
  single_out_i_AQ_0,
  single_out_i_AQ_8,
  single_out_i_AQ_10,
  single_out_i_AQ_11,
  single_out_i_AQ_9,
  single_out_i_AQ_4,
  single_out_r_AQ_4,
  single_out_r_AQ_2,
  single_out_r_AQ_7,
  single_out_r_AQ_1,
  single_out_r_AQ_0,
  clk,
  wr_en_AQ_mux_i_m3_lut6_2_O6,
  N_507,
  N_508,
  N_505,
  N_506,
  N_645,
  N_641,
  N_637,
  N_632,
  N_628,
  N_624,
  N_623,
  N_622,
  N_612,
  N_607,
  N_606,
  N_605,
  N_597,
  N_596,
  N_595,
  N_586,
  N_585,
  N_584,
  N_583,
  N_582,
  N_571,
  N_568,
  N_567,
  N_566,
  N_555,
  N_552,
  N_549
)
;
input [0:0] col_sel_AQ2_mux_i_m3_lut6_2_O6 ;
input [0:0] col_sel_AQ2_mux_i_m3_lut6_2_O5 ;
input [1:0] col_sel_AQ_int ;
input [0:0] w_col_sel_AQ_mux_i_m3_lut6_2_O6 ;
input [0:0] w_col_sel_AQ_mux_i_m3_lut6_2_O5 ;
output [11:0] vec_out_r_AQ_0 ;
input vec_in_r_AQ_mux_0_4 ;
input vec_in_r_AQ_mux_0_9 ;
input vec_in_r_AQ_mux_0_6 ;
input vec_in_r_AQ_mux_0_0 ;
input vec_in_r_AQ_mux_0_1 ;
input vec_in_r_AQ_mux_0_2 ;
input vec_in_r_AQ_mux_0_3 ;
input vec_in_r_AQ_mux_0_10 ;
input vec_in_r_AQ_mux_0_7 ;
input vec_in_r_AQ_mux_0_8 ;
output [11:0] vec_out_r_AQ_3 ;
input [11:0] vec_in_r_AQ_mux_3 ;
output [47:0] out_Q_r ;
output [11:0] vec_out_r_AQ_2 ;
output [11:0] vec_out_r_AQ_1 ;
input [11:0] vec_in_r_AQ_mux_2 ;
input [11:0] vec_in_r_AQ_mux_1 ;
output [11:0] vec_out_i_AQ_0 ;
input vec_in_i_AQ_mux_0_5 ;
input vec_in_i_AQ_mux_0_10 ;
input vec_in_i_AQ_mux_0_7 ;
input vec_in_i_AQ_mux_0_0 ;
input vec_in_i_AQ_mux_0_1 ;
input vec_in_i_AQ_mux_0_4 ;
input vec_in_i_AQ_mux_0_6 ;
input vec_in_i_AQ_mux_0_11 ;
input vec_in_i_AQ_mux_0_8 ;
input vec_in_i_AQ_mux_0_9 ;
output [11:0] vec_out_i_AQ_3 ;
input [11:0] vec_in_i_AQ_mux_3 ;
output [47:0] out_Q_i ;
output [11:0] vec_out_i_AQ_2 ;
output [11:0] vec_out_i_AQ_1 ;
input [11:0] vec_in_i_AQ_mux_2 ;
input [11:0] vec_in_i_AQ_mux_1 ;
input [1:0] row_sel_AQ ;
output single_out_r_AQ2_1 ;
output single_out_r_AQ2_6 ;
output single_out_r_AQ2_4 ;
output single_out_r_AQ2_0 ;
output single_out_i_AQ2_1 ;
output single_out_i_AQ2_5 ;
output single_out_i_AQ2_4 ;
output single_out_i_AQ2_0 ;
output single_out_i_AQ2_11 ;
output single_out_i_AQ_1 ;
output single_out_i_AQ_0 ;
output single_out_i_AQ_8 ;
output single_out_i_AQ_10 ;
output single_out_i_AQ_11 ;
output single_out_i_AQ_9 ;
output single_out_i_AQ_4 ;
output single_out_r_AQ_4 ;
output single_out_r_AQ_2 ;
output single_out_r_AQ_7 ;
output single_out_r_AQ_1 ;
output single_out_r_AQ_0 ;
input clk ;
input wr_en_AQ_mux_i_m3_lut6_2_O6 ;
input N_507 ;
input N_508 ;
input N_505 ;
input N_506 ;
output N_645 ;
output N_641 ;
output N_637 ;
output N_632 ;
output N_628 ;
output N_624 ;
output N_623 ;
output N_622 ;
output N_612 ;
output N_607 ;
output N_606 ;
output N_605 ;
output N_597 ;
output N_596 ;
output N_595 ;
output N_586 ;
output N_585 ;
output N_584 ;
output N_583 ;
output N_582 ;
output N_571 ;
output N_568 ;
output N_567 ;
output N_566 ;
output N_555 ;
output N_552 ;
output N_549 ;
wire vec_in_r_AQ_mux_0_4 ;
wire vec_in_r_AQ_mux_0_9 ;
wire vec_in_r_AQ_mux_0_6 ;
wire vec_in_r_AQ_mux_0_0 ;
wire vec_in_r_AQ_mux_0_1 ;
wire vec_in_r_AQ_mux_0_2 ;
wire vec_in_r_AQ_mux_0_3 ;
wire vec_in_r_AQ_mux_0_10 ;
wire vec_in_r_AQ_mux_0_7 ;
wire vec_in_r_AQ_mux_0_8 ;
wire vec_in_i_AQ_mux_0_5 ;
wire vec_in_i_AQ_mux_0_10 ;
wire vec_in_i_AQ_mux_0_7 ;
wire vec_in_i_AQ_mux_0_0 ;
wire vec_in_i_AQ_mux_0_1 ;
wire vec_in_i_AQ_mux_0_4 ;
wire vec_in_i_AQ_mux_0_6 ;
wire vec_in_i_AQ_mux_0_11 ;
wire vec_in_i_AQ_mux_0_8 ;
wire vec_in_i_AQ_mux_0_9 ;
wire single_out_r_AQ2_1 ;
wire single_out_r_AQ2_6 ;
wire single_out_r_AQ2_4 ;
wire single_out_r_AQ2_0 ;
wire single_out_i_AQ2_1 ;
wire single_out_i_AQ2_5 ;
wire single_out_i_AQ2_4 ;
wire single_out_i_AQ2_0 ;
wire single_out_i_AQ2_11 ;
wire single_out_i_AQ_1 ;
wire single_out_i_AQ_0 ;
wire single_out_i_AQ_8 ;
wire single_out_i_AQ_10 ;
wire single_out_i_AQ_11 ;
wire single_out_i_AQ_9 ;
wire single_out_i_AQ_4 ;
wire single_out_r_AQ_4 ;
wire single_out_r_AQ_2 ;
wire single_out_r_AQ_7 ;
wire single_out_r_AQ_1 ;
wire single_out_r_AQ_0 ;
wire clk ;
wire wr_en_AQ_mux_i_m3_lut6_2_O6 ;
wire N_507 ;
wire N_508 ;
wire N_505 ;
wire N_506 ;
wire N_645 ;
wire N_641 ;
wire N_637 ;
wire N_632 ;
wire N_628 ;
wire N_624 ;
wire N_623 ;
wire N_622 ;
wire N_612 ;
wire N_607 ;
wire N_606 ;
wire N_605 ;
wire N_597 ;
wire N_596 ;
wire N_595 ;
wire N_586 ;
wire N_585 ;
wire N_584 ;
wire N_583 ;
wire N_582 ;
wire N_571 ;
wire N_568 ;
wire N_567 ;
wire N_566 ;
wire N_555 ;
wire N_552 ;
wire N_549 ;
wire [1:0] mat_r_1_I_47_DOC;
wire [1:0] mat_r_1_I_47_DOD;
wire [1:0] mat_r_1_I_45_DOC;
wire [1:0] mat_r_1_I_45_DOD;
wire [1:0] mat_r_1_I_43_DOC;
wire [1:0] mat_r_1_I_43_DOD;
wire [1:0] mat_r_1_I_41_DOC;
wire [1:0] mat_r_1_I_41_DOD;
wire [1:0] mat_r_1_I_39_DOC;
wire [1:0] mat_r_1_I_39_DOD;
wire [1:0] mat_r_1_I_37_DOC;
wire [1:0] mat_r_1_I_37_DOD;
wire [1:0] mat_r_1_I_35_DOC;
wire [1:0] mat_r_1_I_35_DOD;
wire [1:0] mat_r_1_I_33_DOC;
wire [1:0] mat_r_1_I_33_DOD;
wire [1:0] mat_r_1_I_31_DOC;
wire [1:0] mat_r_1_I_31_DOD;
wire [1:0] mat_r_1_I_29_DOC;
wire [1:0] mat_r_1_I_29_DOD;
wire [1:0] mat_r_1_I_27_DOC;
wire [1:0] mat_r_1_I_27_DOD;
wire [1:0] mat_r_1_I_25_DOC;
wire [1:0] mat_r_1_I_25_DOD;
wire [1:0] mat_r_1_I_23_DOC;
wire [1:0] mat_r_1_I_23_DOD;
wire [1:0] mat_r_1_I_21_DOC;
wire [1:0] mat_r_1_I_21_DOD;
wire [1:0] mat_r_1_I_19_DOC;
wire [1:0] mat_r_1_I_19_DOD;
wire [1:0] mat_r_1_I_17_DOC;
wire [1:0] mat_r_1_I_17_DOD;
wire [1:0] mat_r_1_I_15_DOC;
wire [1:0] mat_r_1_I_15_DOD;
wire [1:0] mat_r_1_I_13_DOC;
wire [1:0] mat_r_1_I_13_DOD;
wire [1:0] mat_r_1_I_11_DOC;
wire [1:0] mat_r_1_I_11_DOD;
wire [1:0] mat_r_1_I_9_DOC;
wire [1:0] mat_r_1_I_9_DOD;
wire [1:0] mat_r_1_I_7_DOC;
wire [1:0] mat_r_1_I_7_DOD;
wire [1:0] mat_r_1_I_5_DOC;
wire [1:0] mat_r_1_I_5_DOD;
wire [1:0] mat_r_1_I_3_DOC;
wire [1:0] mat_r_1_I_3_DOD;
wire [1:0] mat_r_1_I_1_DOC;
wire [1:0] mat_r_1_I_1_DOD;
wire [1:0] mat_i_1_I_47_DOC;
wire [1:0] mat_i_1_I_47_DOD;
wire [1:0] mat_i_1_I_45_DOC;
wire [1:0] mat_i_1_I_45_DOD;
wire [1:0] mat_i_1_I_43_DOC;
wire [1:0] mat_i_1_I_43_DOD;
wire [1:0] mat_i_1_I_41_DOC;
wire [1:0] mat_i_1_I_41_DOD;
wire [1:0] mat_i_1_I_39_DOC;
wire [1:0] mat_i_1_I_39_DOD;
wire [1:0] mat_i_1_I_37_DOC;
wire [1:0] mat_i_1_I_37_DOD;
wire [1:0] mat_i_1_I_35_DOC;
wire [1:0] mat_i_1_I_35_DOD;
wire [1:0] mat_i_1_I_33_DOC;
wire [1:0] mat_i_1_I_33_DOD;
wire [1:0] mat_i_1_I_31_DOC;
wire [1:0] mat_i_1_I_31_DOD;
wire [1:0] mat_i_1_I_29_DOC;
wire [1:0] mat_i_1_I_29_DOD;
wire [1:0] mat_i_1_I_27_DOC;
wire [1:0] mat_i_1_I_27_DOD;
wire [1:0] mat_i_1_I_25_DOC;
wire [1:0] mat_i_1_I_25_DOD;
wire [1:0] mat_i_1_I_23_DOC;
wire [1:0] mat_i_1_I_23_DOD;
wire [1:0] mat_i_1_I_21_DOC;
wire [1:0] mat_i_1_I_21_DOD;
wire [1:0] mat_i_1_I_19_DOC;
wire [1:0] mat_i_1_I_19_DOD;
wire [1:0] mat_i_1_I_17_DOC;
wire [1:0] mat_i_1_I_17_DOD;
wire [1:0] mat_i_1_I_15_DOC;
wire [1:0] mat_i_1_I_15_DOD;
wire [1:0] mat_i_1_I_13_DOC;
wire [1:0] mat_i_1_I_13_DOD;
wire [1:0] mat_i_1_I_11_DOC;
wire [1:0] mat_i_1_I_11_DOD;
wire [1:0] mat_i_1_I_9_DOC;
wire [1:0] mat_i_1_I_9_DOD;
wire [1:0] mat_i_1_I_7_DOC;
wire [1:0] mat_i_1_I_7_DOD;
wire [1:0] mat_i_1_I_5_DOC;
wire [1:0] mat_i_1_I_5_DOD;
wire [1:0] mat_i_1_I_3_DOC;
wire [1:0] mat_i_1_I_3_DOD;
wire [1:0] mat_i_1_I_1_DOC;
wire [1:0] mat_i_1_I_1_DOD;
wire GND ;
wire VCC ;
// @22:45
  RAM32M mat_r_1_I_47 (
	.DOA({out_Q_r[8], out_Q_r[5]}),
	.DOB({vec_out_r_AQ_3[8], vec_out_r_AQ_3[5]}),
	.DOC(mat_r_1_I_47_DOC[1:0]),
	.DOD(mat_r_1_I_47_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[8], vec_in_r_AQ_mux_3[5]}),
	.DIB({vec_in_r_AQ_mux_3[8], vec_in_r_AQ_mux_3[5]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_47.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_47.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_47.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_47.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_45 (
	.DOA({out_Q_r[41], out_Q_r[19]}),
	.DOB({vec_out_r_AQ_0[5], vec_out_r_AQ_2[7]}),
	.DOC(mat_r_1_I_45_DOC[1:0]),
	.DOD(mat_r_1_I_45_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_4, vec_in_r_AQ_mux_2[7]}),
	.DIB({vec_in_r_AQ_mux_0_4, vec_in_r_AQ_mux_2[7]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_45.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_45.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_45.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_45.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_43 (
	.DOA({out_Q_r[46], out_Q_r[2]}),
	.DOB({vec_out_r_AQ_0[10], vec_out_r_AQ_3[2]}),
	.DOC(mat_r_1_I_43_DOC[1:0]),
	.DOD(mat_r_1_I_43_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_9, vec_in_r_AQ_mux_3[2]}),
	.DIB({vec_in_r_AQ_mux_0_9, vec_in_r_AQ_mux_3[2]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_43.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_43.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_43.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_43.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_41 (
	.DOA({out_Q_r[32], out_Q_r[20]}),
	.DOB({vec_out_r_AQ_1[8], vec_out_r_AQ_2[8]}),
	.DOC(mat_r_1_I_41_DOC[1:0]),
	.DOD(mat_r_1_I_41_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_1[8], vec_in_r_AQ_mux_2[8]}),
	.DIB({vec_in_r_AQ_mux_1[8], vec_in_r_AQ_mux_2[8]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_41.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_41.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_41.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_41.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_39 (
	.DOA({out_Q_r[43], out_Q_r[21]}),
	.DOB({vec_out_r_AQ_0[7], vec_out_r_AQ_2[9]}),
	.DOC(mat_r_1_I_39_DOC[1:0]),
	.DOD(mat_r_1_I_39_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_6, vec_in_r_AQ_mux_2[9]}),
	.DIB({vec_in_r_AQ_mux_0_6, vec_in_r_AQ_mux_2[9]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_39.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_39.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_39.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_39.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_37 (
	.DOA({out_Q_r[26], out_Q_r[35]}),
	.DOB({vec_out_r_AQ_1[2], vec_out_r_AQ_1[11]}),
	.DOC(mat_r_1_I_37_DOC[1:0]),
	.DOD(mat_r_1_I_37_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_1[2], vec_in_r_AQ_mux_1[11]}),
	.DIB({vec_in_r_AQ_mux_1[2], vec_in_r_AQ_mux_1[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_37.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_37.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_37.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_37.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_35 (
	.DOA({out_Q_r[22], out_Q_r[18]}),
	.DOB({vec_out_r_AQ_2[10], vec_out_r_AQ_2[6]}),
	.DOC(mat_r_1_I_35_DOC[1:0]),
	.DOD(mat_r_1_I_35_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_2[10], vec_in_r_AQ_mux_2[6]}),
	.DIB({vec_in_r_AQ_mux_2[10], vec_in_r_AQ_mux_2[6]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_35.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_35.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_35.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_35.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_33 (
	.DOA({out_Q_r[36], out_Q_r[23]}),
	.DOB({vec_out_r_AQ_0[0], vec_out_r_AQ_2[11]}),
	.DOC(mat_r_1_I_33_DOC[1:0]),
	.DOD(mat_r_1_I_33_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({N_507, vec_in_r_AQ_mux_2[11]}),
	.DIB({N_507, vec_in_r_AQ_mux_2[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_33.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_33.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_33.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_33.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_31 (
	.DOA({out_Q_r[10], out_Q_r[37]}),
	.DOB({vec_out_r_AQ_3[10], vec_out_r_AQ_0[1]}),
	.DOC(mat_r_1_I_31_DOC[1:0]),
	.DOD(mat_r_1_I_31_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[10], vec_in_r_AQ_mux_0_0}),
	.DIB({vec_in_r_AQ_mux_3[10], vec_in_r_AQ_mux_0_0}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_31.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_31.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_31.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_31.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_29 (
	.DOA({out_Q_r[24], out_Q_r[11]}),
	.DOB({vec_out_r_AQ_1[0], vec_out_r_AQ_3[11]}),
	.DOC(mat_r_1_I_29_DOC[1:0]),
	.DOD(mat_r_1_I_29_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_1[0], vec_in_r_AQ_mux_3[11]}),
	.DIB({vec_in_r_AQ_mux_1[0], vec_in_r_AQ_mux_3[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_29.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_29.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_29.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_29.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_27 (
	.DOA({out_Q_r[38], out_Q_r[25]}),
	.DOB({vec_out_r_AQ_0[2], vec_out_r_AQ_1[1]}),
	.DOC(mat_r_1_I_27_DOC[1:0]),
	.DOD(mat_r_1_I_27_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_1, vec_in_r_AQ_mux_1[1]}),
	.DIB({vec_in_r_AQ_mux_0_1, vec_in_r_AQ_mux_1[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_27.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_27.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_27.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_27.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_25 (
	.DOA({out_Q_r[12], out_Q_r[39]}),
	.DOB({vec_out_r_AQ_2[0], vec_out_r_AQ_0[3]}),
	.DOC(mat_r_1_I_25_DOC[1:0]),
	.DOD(mat_r_1_I_25_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_2[0], vec_in_r_AQ_mux_0_2}),
	.DIB({vec_in_r_AQ_mux_2[0], vec_in_r_AQ_mux_0_2}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_25.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_25.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_25.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_25.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_23 (
	.DOA({out_Q_r[9], out_Q_r[13]}),
	.DOB({vec_out_r_AQ_3[9], vec_out_r_AQ_2[1]}),
	.DOC(mat_r_1_I_23_DOC[1:0]),
	.DOD(mat_r_1_I_23_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[9], vec_in_r_AQ_mux_2[1]}),
	.DIB({vec_in_r_AQ_mux_3[9], vec_in_r_AQ_mux_2[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_23.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_23.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_23.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_23.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_21 (
	.DOA({out_Q_r[40], out_Q_r[27]}),
	.DOB({vec_out_r_AQ_0[4], vec_out_r_AQ_1[3]}),
	.DOC(mat_r_1_I_21_DOC[1:0]),
	.DOD(mat_r_1_I_21_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_3, vec_in_r_AQ_mux_1[3]}),
	.DIB({vec_in_r_AQ_mux_0_3, vec_in_r_AQ_mux_1[3]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_21.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_21.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_21.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_21.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_19 (
	.DOA({out_Q_r[14], out_Q_r[0]}),
	.DOB({vec_out_r_AQ_2[2], vec_out_r_AQ_3[0]}),
	.DOC(mat_r_1_I_19_DOC[1:0]),
	.DOD(mat_r_1_I_19_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_2[2], vec_in_r_AQ_mux_3[0]}),
	.DIB({vec_in_r_AQ_mux_2[2], vec_in_r_AQ_mux_3[0]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_19.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_19.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_19.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_19.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_17 (
	.DOA({out_Q_r[6], out_Q_r[34]}),
	.DOB({vec_out_r_AQ_3[6], vec_out_r_AQ_1[10]}),
	.DOC(mat_r_1_I_17_DOC[1:0]),
	.DOD(mat_r_1_I_17_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[6], vec_in_r_AQ_mux_1[10]}),
	.DIB({vec_in_r_AQ_mux_3[6], vec_in_r_AQ_mux_1[10]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_17.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_17.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_17.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_17.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_15 (
	.DOA({out_Q_r[42], out_Q_r[1]}),
	.DOB({vec_out_r_AQ_0[6], vec_out_r_AQ_3[1]}),
	.DOC(mat_r_1_I_15_DOC[1:0]),
	.DOD(mat_r_1_I_15_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({N_508, vec_in_r_AQ_mux_3[1]}),
	.DIB({N_508, vec_in_r_AQ_mux_3[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_15.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_15.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_15.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_15.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_13 (
	.DOA({out_Q_r[7], out_Q_r[47]}),
	.DOB({vec_out_r_AQ_3[7], vec_out_r_AQ_0[11]}),
	.DOC(mat_r_1_I_13_DOC[1:0]),
	.DOD(mat_r_1_I_13_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[7], vec_in_r_AQ_mux_0_10}),
	.DIB({vec_in_r_AQ_mux_3[7], vec_in_r_AQ_mux_0_10}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_13.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_13.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_13.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_13.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_11 (
	.DOA({out_Q_r[30], out_Q_r[17]}),
	.DOB({vec_out_r_AQ_1[6], vec_out_r_AQ_2[5]}),
	.DOC(mat_r_1_I_11_DOC[1:0]),
	.DOD(mat_r_1_I_11_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_1[6], vec_in_r_AQ_mux_2[5]}),
	.DIB({vec_in_r_AQ_mux_1[6], vec_in_r_AQ_mux_2[5]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_11.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_11.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_11.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_11.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_9 (
	.DOA({out_Q_r[44], out_Q_r[31]}),
	.DOB({vec_out_r_AQ_0[8], vec_out_r_AQ_1[7]}),
	.DOC(mat_r_1_I_9_DOC[1:0]),
	.DOD(mat_r_1_I_9_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_0_7, vec_in_r_AQ_mux_1[7]}),
	.DIB({vec_in_r_AQ_mux_0_7, vec_in_r_AQ_mux_1[7]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_9.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_9.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_9.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_9.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_7 (
	.DOA({out_Q_r[3], out_Q_r[45]}),
	.DOB({vec_out_r_AQ_3[3], vec_out_r_AQ_0[9]}),
	.DOC(mat_r_1_I_7_DOC[1:0]),
	.DOD(mat_r_1_I_7_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[3], vec_in_r_AQ_mux_0_8}),
	.DIB({vec_in_r_AQ_mux_3[3], vec_in_r_AQ_mux_0_8}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_7.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_7.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_7.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_7.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_5 (
	.DOA({out_Q_r[4], out_Q_r[28]}),
	.DOB({vec_out_r_AQ_3[4], vec_out_r_AQ_1[4]}),
	.DOC(mat_r_1_I_5_DOC[1:0]),
	.DOD(mat_r_1_I_5_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_3[4], vec_in_r_AQ_mux_1[4]}),
	.DIB({vec_in_r_AQ_mux_3[4], vec_in_r_AQ_mux_1[4]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_5.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_5.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_5.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_5.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_3 (
	.DOA({out_Q_r[15], out_Q_r[33]}),
	.DOB({vec_out_r_AQ_2[3], vec_out_r_AQ_1[9]}),
	.DOC(mat_r_1_I_3_DOC[1:0]),
	.DOD(mat_r_1_I_3_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_2[3], vec_in_r_AQ_mux_1[9]}),
	.DIB({vec_in_r_AQ_mux_2[3], vec_in_r_AQ_mux_1[9]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_3.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_3.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_3.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_3.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_r_1_I_1 (
	.DOA({out_Q_r[29], out_Q_r[16]}),
	.DOB({vec_out_r_AQ_1[5], vec_out_r_AQ_2[4]}),
	.DOC(mat_r_1_I_1_DOC[1:0]),
	.DOD(mat_r_1_I_1_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_r_AQ_mux_1[5], vec_in_r_AQ_mux_2[4]}),
	.DIB({vec_in_r_AQ_mux_1[5], vec_in_r_AQ_mux_2[4]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_r_1_I_1.INIT_A=64'h0000000000000000;
defparam mat_r_1_I_1.INIT_B=64'h0000000000000000;
defparam mat_r_1_I_1.INIT_C=64'h0000000000000000;
defparam mat_r_1_I_1.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_47 (
	.DOA({out_Q_i[8], out_Q_i[5]}),
	.DOB({vec_out_i_AQ_3[8], vec_out_i_AQ_3[5]}),
	.DOC(mat_i_1_I_47_DOC[1:0]),
	.DOD(mat_i_1_I_47_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[8], vec_in_i_AQ_mux_3[5]}),
	.DIB({vec_in_i_AQ_mux_3[8], vec_in_i_AQ_mux_3[5]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_47.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_47.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_47.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_47.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_45 (
	.DOA({out_Q_i[41], out_Q_i[19]}),
	.DOB({vec_out_i_AQ_0[5], vec_out_i_AQ_2[7]}),
	.DOC(mat_i_1_I_45_DOC[1:0]),
	.DOD(mat_i_1_I_45_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_5, vec_in_i_AQ_mux_2[7]}),
	.DIB({vec_in_i_AQ_mux_0_5, vec_in_i_AQ_mux_2[7]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_45.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_45.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_45.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_45.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_43 (
	.DOA({out_Q_i[46], out_Q_i[2]}),
	.DOB({vec_out_i_AQ_0[10], vec_out_i_AQ_3[2]}),
	.DOC(mat_i_1_I_43_DOC[1:0]),
	.DOD(mat_i_1_I_43_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_10, vec_in_i_AQ_mux_3[2]}),
	.DIB({vec_in_i_AQ_mux_0_10, vec_in_i_AQ_mux_3[2]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_43.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_43.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_43.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_43.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_41 (
	.DOA({out_Q_i[32], out_Q_i[20]}),
	.DOB({vec_out_i_AQ_1[8], vec_out_i_AQ_2[8]}),
	.DOC(mat_i_1_I_41_DOC[1:0]),
	.DOD(mat_i_1_I_41_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_1[8], vec_in_i_AQ_mux_2[8]}),
	.DIB({vec_in_i_AQ_mux_1[8], vec_in_i_AQ_mux_2[8]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_41.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_41.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_41.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_41.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_39 (
	.DOA({out_Q_i[43], out_Q_i[21]}),
	.DOB({vec_out_i_AQ_0[7], vec_out_i_AQ_2[9]}),
	.DOC(mat_i_1_I_39_DOC[1:0]),
	.DOD(mat_i_1_I_39_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_7, vec_in_i_AQ_mux_2[9]}),
	.DIB({vec_in_i_AQ_mux_0_7, vec_in_i_AQ_mux_2[9]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_39.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_39.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_39.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_39.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_37 (
	.DOA({out_Q_i[26], out_Q_i[35]}),
	.DOB({vec_out_i_AQ_1[2], vec_out_i_AQ_1[11]}),
	.DOC(mat_i_1_I_37_DOC[1:0]),
	.DOD(mat_i_1_I_37_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_1[2], vec_in_i_AQ_mux_1[11]}),
	.DIB({vec_in_i_AQ_mux_1[2], vec_in_i_AQ_mux_1[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_37.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_37.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_37.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_37.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_35 (
	.DOA({out_Q_i[22], out_Q_i[18]}),
	.DOB({vec_out_i_AQ_2[10], vec_out_i_AQ_2[6]}),
	.DOC(mat_i_1_I_35_DOC[1:0]),
	.DOD(mat_i_1_I_35_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_2[10], vec_in_i_AQ_mux_2[6]}),
	.DIB({vec_in_i_AQ_mux_2[10], vec_in_i_AQ_mux_2[6]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_35.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_35.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_35.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_35.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_33 (
	.DOA({out_Q_i[36], out_Q_i[23]}),
	.DOB({vec_out_i_AQ_0[0], vec_out_i_AQ_2[11]}),
	.DOC(mat_i_1_I_33_DOC[1:0]),
	.DOD(mat_i_1_I_33_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_0, vec_in_i_AQ_mux_2[11]}),
	.DIB({vec_in_i_AQ_mux_0_0, vec_in_i_AQ_mux_2[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_33.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_33.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_33.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_33.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_31 (
	.DOA({out_Q_i[10], out_Q_i[37]}),
	.DOB({vec_out_i_AQ_3[10], vec_out_i_AQ_0[1]}),
	.DOC(mat_i_1_I_31_DOC[1:0]),
	.DOD(mat_i_1_I_31_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[10], vec_in_i_AQ_mux_0_1}),
	.DIB({vec_in_i_AQ_mux_3[10], vec_in_i_AQ_mux_0_1}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_31.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_31.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_31.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_31.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_29 (
	.DOA({out_Q_i[24], out_Q_i[11]}),
	.DOB({vec_out_i_AQ_1[0], vec_out_i_AQ_3[11]}),
	.DOC(mat_i_1_I_29_DOC[1:0]),
	.DOD(mat_i_1_I_29_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_1[0], vec_in_i_AQ_mux_3[11]}),
	.DIB({vec_in_i_AQ_mux_1[0], vec_in_i_AQ_mux_3[11]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_29.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_29.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_29.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_29.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_27 (
	.DOA({out_Q_i[38], out_Q_i[25]}),
	.DOB({vec_out_i_AQ_0[2], vec_out_i_AQ_1[1]}),
	.DOC(mat_i_1_I_27_DOC[1:0]),
	.DOD(mat_i_1_I_27_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({N_505, vec_in_i_AQ_mux_1[1]}),
	.DIB({N_505, vec_in_i_AQ_mux_1[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_27.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_27.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_27.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_27.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_25 (
	.DOA({out_Q_i[12], out_Q_i[39]}),
	.DOB({vec_out_i_AQ_2[0], vec_out_i_AQ_0[3]}),
	.DOC(mat_i_1_I_25_DOC[1:0]),
	.DOD(mat_i_1_I_25_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_2[0], N_506}),
	.DIB({vec_in_i_AQ_mux_2[0], N_506}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_25.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_25.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_25.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_25.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_23 (
	.DOA({out_Q_i[9], out_Q_i[13]}),
	.DOB({vec_out_i_AQ_3[9], vec_out_i_AQ_2[1]}),
	.DOC(mat_i_1_I_23_DOC[1:0]),
	.DOD(mat_i_1_I_23_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[9], vec_in_i_AQ_mux_2[1]}),
	.DIB({vec_in_i_AQ_mux_3[9], vec_in_i_AQ_mux_2[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_23.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_23.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_23.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_23.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_21 (
	.DOA({out_Q_i[40], out_Q_i[27]}),
	.DOB({vec_out_i_AQ_0[4], vec_out_i_AQ_1[3]}),
	.DOC(mat_i_1_I_21_DOC[1:0]),
	.DOD(mat_i_1_I_21_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_4, vec_in_i_AQ_mux_1[3]}),
	.DIB({vec_in_i_AQ_mux_0_4, vec_in_i_AQ_mux_1[3]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_21.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_21.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_21.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_21.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_19 (
	.DOA({out_Q_i[14], out_Q_i[0]}),
	.DOB({vec_out_i_AQ_2[2], vec_out_i_AQ_3[0]}),
	.DOC(mat_i_1_I_19_DOC[1:0]),
	.DOD(mat_i_1_I_19_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_2[2], vec_in_i_AQ_mux_3[0]}),
	.DIB({vec_in_i_AQ_mux_2[2], vec_in_i_AQ_mux_3[0]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_19.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_19.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_19.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_19.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_17 (
	.DOA({out_Q_i[6], out_Q_i[34]}),
	.DOB({vec_out_i_AQ_3[6], vec_out_i_AQ_1[10]}),
	.DOC(mat_i_1_I_17_DOC[1:0]),
	.DOD(mat_i_1_I_17_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[6], vec_in_i_AQ_mux_1[10]}),
	.DIB({vec_in_i_AQ_mux_3[6], vec_in_i_AQ_mux_1[10]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_17.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_17.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_17.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_17.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_15 (
	.DOA({out_Q_i[42], out_Q_i[1]}),
	.DOB({vec_out_i_AQ_0[6], vec_out_i_AQ_3[1]}),
	.DOC(mat_i_1_I_15_DOC[1:0]),
	.DOD(mat_i_1_I_15_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_6, vec_in_i_AQ_mux_3[1]}),
	.DIB({vec_in_i_AQ_mux_0_6, vec_in_i_AQ_mux_3[1]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_15.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_15.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_15.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_15.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_13 (
	.DOA({out_Q_i[7], out_Q_i[47]}),
	.DOB({vec_out_i_AQ_3[7], vec_out_i_AQ_0[11]}),
	.DOC(mat_i_1_I_13_DOC[1:0]),
	.DOD(mat_i_1_I_13_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[7], vec_in_i_AQ_mux_0_11}),
	.DIB({vec_in_i_AQ_mux_3[7], vec_in_i_AQ_mux_0_11}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_13.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_13.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_13.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_13.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_11 (
	.DOA({out_Q_i[30], out_Q_i[17]}),
	.DOB({vec_out_i_AQ_1[6], vec_out_i_AQ_2[5]}),
	.DOC(mat_i_1_I_11_DOC[1:0]),
	.DOD(mat_i_1_I_11_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_1[6], vec_in_i_AQ_mux_2[5]}),
	.DIB({vec_in_i_AQ_mux_1[6], vec_in_i_AQ_mux_2[5]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_11.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_11.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_11.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_11.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_9 (
	.DOA({out_Q_i[44], out_Q_i[31]}),
	.DOB({vec_out_i_AQ_0[8], vec_out_i_AQ_1[7]}),
	.DOC(mat_i_1_I_9_DOC[1:0]),
	.DOD(mat_i_1_I_9_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_0_8, vec_in_i_AQ_mux_1[7]}),
	.DIB({vec_in_i_AQ_mux_0_8, vec_in_i_AQ_mux_1[7]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_9.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_9.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_9.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_9.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_7 (
	.DOA({out_Q_i[3], out_Q_i[45]}),
	.DOB({vec_out_i_AQ_3[3], vec_out_i_AQ_0[9]}),
	.DOC(mat_i_1_I_7_DOC[1:0]),
	.DOD(mat_i_1_I_7_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[3], vec_in_i_AQ_mux_0_9}),
	.DIB({vec_in_i_AQ_mux_3[3], vec_in_i_AQ_mux_0_9}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_7.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_7.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_7.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_7.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_5 (
	.DOA({out_Q_i[4], out_Q_i[28]}),
	.DOB({vec_out_i_AQ_3[4], vec_out_i_AQ_1[4]}),
	.DOC(mat_i_1_I_5_DOC[1:0]),
	.DOD(mat_i_1_I_5_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_3[4], vec_in_i_AQ_mux_1[4]}),
	.DIB({vec_in_i_AQ_mux_3[4], vec_in_i_AQ_mux_1[4]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_5.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_5.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_5.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_5.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_3 (
	.DOA({out_Q_i[15], out_Q_i[33]}),
	.DOB({vec_out_i_AQ_2[3], vec_out_i_AQ_1[9]}),
	.DOC(mat_i_1_I_3_DOC[1:0]),
	.DOD(mat_i_1_I_3_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_2[3], vec_in_i_AQ_mux_1[9]}),
	.DIB({vec_in_i_AQ_mux_2[3], vec_in_i_AQ_mux_1[9]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_3.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_3.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_3.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_3.INIT_D=64'h0000000000000000;
// @22:45
  RAM32M mat_i_1_I_1 (
	.DOA({out_Q_i[29], out_Q_i[16]}),
	.DOB({vec_out_i_AQ_1[5], vec_out_i_AQ_2[4]}),
	.DOC(mat_i_1_I_1_DOC[1:0]),
	.DOD(mat_i_1_I_1_DOD[1:0]),
	.ADDRA({GND, GND, GND, col_sel_AQ2_mux_i_m3_lut6_2_O5[0], col_sel_AQ2_mux_i_m3_lut6_2_O6[0]}),
	.ADDRB({GND, GND, GND, col_sel_AQ_int[1:0]}),
	.ADDRC({GND, GND, GND, GND, GND}),
	.ADDRD({GND, GND, GND, w_col_sel_AQ_mux_i_m3_lut6_2_O5[0], w_col_sel_AQ_mux_i_m3_lut6_2_O6[0]}),
	.DIA({vec_in_i_AQ_mux_1[5], vec_in_i_AQ_mux_2[4]}),
	.DIB({vec_in_i_AQ_mux_1[5], vec_in_i_AQ_mux_2[4]}),
	.DIC({GND, GND}),
	.DID({GND, GND}),
	.WCLK(clk),
	.WE(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam mat_i_1_I_1.INIT_A=64'h0000000000000000;
defparam mat_i_1_I_1.INIT_B=64'h0000000000000000;
defparam mat_i_1_I_1.INIT_C=64'h0000000000000000;
defparam mat_i_1_I_1.INIT_D=64'h0000000000000000;
// @22:57
  LUT6 \single_out_r2_3_i_m3[3]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[3]),
	.I3(out_Q_r[15]),
	.I4(out_Q_r[27]),
	.I5(out_Q_r[39]),
	.O(N_645)
);
defparam \single_out_r2_3_i_m3[3] .INIT=64'hF7D5B391E6C4A280;
// @22:57
  LUT6 \single_out_r2_3_i_m3[4]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[4]),
	.I3(out_Q_r[40]),
	.I4(out_Q_r[16]),
	.I5(out_Q_r[28]),
	.O(N_641)
);
defparam \single_out_r2_3_i_m3[4] .INIT=64'hF7E6D5C4B3A29180;
// @22:55
  LUT6 \single_out_r_3_i_m3[4]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[4]),
	.I3(vec_out_r_AQ_3[4]),
	.I4(vec_out_r_AQ_1[4]),
	.I5(vec_out_r_AQ_2[4]),
	.O(N_637)
);
defparam \single_out_r_3_i_m3[4] .INIT=64'hFE76BA32DC549810;
// @22:57
  LUT6 \single_out_r2_3_i_m3[11]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[11]),
	.I3(out_Q_r[23]),
	.I4(out_Q_r[35]),
	.I5(out_Q_r[47]),
	.O(N_632)
);
defparam \single_out_r2_3_i_m3[11] .INIT=64'hF7D5B391E6C4A280;
// @22:56
  LUT6 \single_out_i_3_i_m3[5]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[5]),
	.I3(vec_out_i_AQ_1[5]),
	.I4(vec_out_i_AQ_2[5]),
	.I5(vec_out_i_AQ_3[5]),
	.O(N_628)
);
defparam \single_out_i_3_i_m3[5] .INIT=64'hFEBADC9876325410;
// @22:55
  LUT6 \single_out_r_3_i_m3[11]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[11]),
	.I3(vec_out_r_AQ_1[11]),
	.I4(vec_out_r_AQ_2[11]),
	.I5(vec_out_r_AQ_3[11]),
	.O(N_624)
);
defparam \single_out_r_3_i_m3[11] .INIT=64'hFEBADC9876325410;
// @22:55
  LUT6 \single_out_r_3_i_m3[7]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[7]),
	.I3(vec_out_r_AQ_3[7]),
	.I4(vec_out_r_AQ_1[7]),
	.I5(vec_out_r_AQ_2[7]),
	.O(N_623)
);
defparam \single_out_r_3_i_m3[7] .INIT=64'hFE76BA32DC549810;
// @22:55
  LUT6 \single_out_r_3_i_m3[0]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[0]),
	.I3(vec_out_r_AQ_1[0]),
	.I4(vec_out_r_AQ_2[0]),
	.I5(vec_out_r_AQ_3[0]),
	.O(N_622)
);
defparam \single_out_r_3_i_m3[0] .INIT=64'hFEBADC9876325410;
// @22:58
  LUT6 \single_out_i2_3_i_m3[8]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[8]),
	.I3(out_Q_i[32]),
	.I4(out_Q_i[44]),
	.I5(out_Q_i[20]),
	.O(N_612)
);
defparam \single_out_i2_3_i_m3[8] .INIT=64'hF7B3E6A2D591C480;
// @22:57
  LUT6 \single_out_r2_3_i_m3[10]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[10]),
	.I3(out_Q_r[22]),
	.I4(out_Q_r[46]),
	.I5(out_Q_r[34]),
	.O(N_607)
);
defparam \single_out_r2_3_i_m3[10] .INIT=64'hF7D5E6C4B391A280;
// @22:57
  LUT6 \single_out_r2_3_i_m3[9]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[9]),
	.I3(out_Q_r[21]),
	.I4(out_Q_r[33]),
	.I5(out_Q_r[45]),
	.O(N_606)
);
defparam \single_out_r2_3_i_m3[9] .INIT=64'hF7D5B391E6C4A280;
// @22:57
  LUT6 \single_out_r2_3_i_m3[0]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[12]),
	.I3(out_Q_r[24]),
	.I4(out_Q_r[36]),
	.I5(out_Q_r[0]),
	.O(N_605)
);
defparam \single_out_r2_3_i_m3[0] .INIT=64'hFDB9ECA875316420;
// @22:55
  LUT6 \single_out_r_3_i_m3[10]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[10]),
	.I3(vec_out_r_AQ_2[10]),
	.I4(vec_out_r_AQ_3[10]),
	.I5(vec_out_r_AQ_1[10]),
	.O(N_597)
);
defparam \single_out_r_3_i_m3[10] .INIT=64'hFEDC7654BA983210;
// @22:55
  LUT6 \single_out_r_3_i_m3[9]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_3[9]),
	.I3(vec_out_r_AQ_0[9]),
	.I4(vec_out_r_AQ_1[9]),
	.I5(vec_out_r_AQ_2[9]),
	.O(N_596)
);
defparam \single_out_r_3_i_m3[9] .INIT=64'hF7E6B3A2D5C49180;
// @22:55
  LUT6 \single_out_r_3_i_m3[6]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[6]),
	.I3(vec_out_r_AQ_1[6]),
	.I4(vec_out_r_AQ_3[6]),
	.I5(vec_out_r_AQ_2[6]),
	.O(N_595)
);
defparam \single_out_r_3_i_m3[6] .INIT=64'hFEBA7632DC985410;
// @22:58
  LUT6 \single_out_i2_3_i_m3[10]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[10]),
	.I3(out_Q_i[22]),
	.I4(out_Q_i[46]),
	.I5(out_Q_i[34]),
	.O(N_586)
);
defparam \single_out_i2_3_i_m3[10] .INIT=64'hF7D5E6C4B391A280;
// @22:58
  LUT6 \single_out_i2_3_i_m3[9]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[9]),
	.I3(out_Q_i[21]),
	.I4(out_Q_i[33]),
	.I5(out_Q_i[45]),
	.O(N_585)
);
defparam \single_out_i2_3_i_m3[9] .INIT=64'hF7D5B391E6C4A280;
// @22:58
  LUT6 \single_out_i2_3_i_m3[7]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[7]),
	.I3(out_Q_i[43]),
	.I4(out_Q_i[19]),
	.I5(out_Q_i[31]),
	.O(N_584)
);
defparam \single_out_i2_3_i_m3[7] .INIT=64'hF7E6D5C4B3A29180;
// @22:58
  LUT6 \single_out_i2_3_i_m3[6]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[6]),
	.I3(out_Q_i[30]),
	.I4(out_Q_i[42]),
	.I5(out_Q_i[18]),
	.O(N_583)
);
defparam \single_out_i2_3_i_m3[6] .INIT=64'hF7B3E6A2D591C480;
// @22:58
  LUT6 \single_out_i2_3_i_m3[3]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[3]),
	.I3(out_Q_i[15]),
	.I4(out_Q_i[27]),
	.I5(out_Q_i[39]),
	.O(N_582)
);
defparam \single_out_i2_3_i_m3[3] .INIT=64'hF7D5B391E6C4A280;
// @22:57
  LUT6 \single_out_r2_3_i_m3[6]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[6]),
	.I3(out_Q_r[30]),
	.I4(out_Q_r[42]),
	.I5(out_Q_r[18]),
	.O(N_571)
);
defparam \single_out_r2_3_i_m3[6] .INIT=64'hF7B3E6A2D591C480;
// @22:56
  LUT6 \single_out_i_3_i_m3[7]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[7]),
	.I3(vec_out_i_AQ_3[7]),
	.I4(vec_out_i_AQ_1[7]),
	.I5(vec_out_i_AQ_2[7]),
	.O(N_568)
);
defparam \single_out_i_3_i_m3[7] .INIT=64'hFE76BA32DC549810;
// @22:56
  LUT6 \single_out_i_3_i_m3[6]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[6]),
	.I3(vec_out_i_AQ_1[6]),
	.I4(vec_out_i_AQ_3[6]),
	.I5(vec_out_i_AQ_2[6]),
	.O(N_567)
);
defparam \single_out_i_3_i_m3[6] .INIT=64'hFEBA7632DC985410;
// @22:56
  LUT6 \single_out_i_3_i_m3[3]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_2[3]),
	.I3(vec_out_i_AQ_3[3]),
	.I4(vec_out_i_AQ_0[3]),
	.I5(vec_out_i_AQ_1[3]),
	.O(N_566)
);
defparam \single_out_i_3_i_m3[3] .INIT=64'hFD75EC64B931A820;
// @22:58
  LUT6 \single_out_i2_3_i_m3[2]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[14]),
	.I3(out_Q_i[26]),
	.I4(out_Q_i[38]),
	.I5(out_Q_i[2]),
	.O(N_555)
);
defparam \single_out_i2_3_i_m3[2] .INIT=64'hFDB9ECA875316420;
// @22:57
  LUT6 \single_out_r2_3_i_m3[8]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[8]),
	.I3(out_Q_r[32]),
	.I4(out_Q_r[44]),
	.I5(out_Q_r[20]),
	.O(N_552)
);
defparam \single_out_r2_3_i_m3[8] .INIT=64'hF7B3E6A2D591C480;
// @22:56
  LUT6 \single_out_i_3_i_m3[2]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[2]),
	.I3(vec_out_i_AQ_1[2]),
	.I4(vec_out_i_AQ_2[2]),
	.I5(vec_out_i_AQ_3[2]),
	.O(N_549)
);
defparam \single_out_i_3_i_m3[2] .INIT=64'hFEBADC9876325410;
// @22:57
  LUT6 \single_out_r2_3[2]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[14]),
	.I3(out_Q_r[26]),
	.I4(out_Q_r[38]),
	.I5(out_Q_r[2]),
	.O(single_out_r_AQ2_1)
);
defparam \single_out_r2_3[2] .INIT=64'hFDB9ECA875316420;
// @22:55
  LUT6 \single_out_r_3[5]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[5]),
	.I3(vec_out_r_AQ_1[5]),
	.I4(vec_out_r_AQ_2[5]),
	.I5(vec_out_r_AQ_3[5]),
	.O(single_out_r_AQ_4)
);
defparam \single_out_r_3[5] .INIT=64'hFEBADC9876325410;
// @22:55
  LUT6 \single_out_r_3[3]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_2[3]),
	.I3(vec_out_r_AQ_3[3]),
	.I4(vec_out_r_AQ_0[3]),
	.I5(vec_out_r_AQ_1[3]),
	.O(single_out_r_AQ_2)
);
defparam \single_out_r_3[3] .INIT=64'hFD75EC64B931A820;
// @22:58
  LUT6 \single_out_i2_3[1]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[1]),
	.I3(out_Q_i[13]),
	.I4(out_Q_i[25]),
	.I5(out_Q_i[37]),
	.O(single_out_i_AQ2_1)
);
defparam \single_out_i2_3[1] .INIT=64'hF7D5B391E6C4A280;
// @22:56
  LUT6 \single_out_i_3[1]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[1]),
	.I3(vec_out_i_AQ_1[1]),
	.I4(vec_out_i_AQ_2[1]),
	.I5(vec_out_i_AQ_3[1]),
	.O(single_out_i_AQ_1)
);
defparam \single_out_i_3[1] .INIT=64'hFEBADC9876325410;
// @22:58
  LUT6 \single_out_i2_3[5]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[29]),
	.I3(out_Q_i[41]),
	.I4(out_Q_i[5]),
	.I5(out_Q_i[17]),
	.O(single_out_i_AQ2_5)
);
defparam \single_out_i2_3[5] .INIT=64'hFBEA7362D9C85140;
// @22:57
  LUT6 \single_out_r2_3[7]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[7]),
	.I3(out_Q_r[43]),
	.I4(out_Q_r[19]),
	.I5(out_Q_r[31]),
	.O(single_out_r_AQ2_6)
);
defparam \single_out_r2_3[7] .INIT=64'hF7E6D5C4B3A29180;
// @22:56
  LUT6 \single_out_i_3[0]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[0]),
	.I3(vec_out_i_AQ_1[0]),
	.I4(vec_out_i_AQ_2[0]),
	.I5(vec_out_i_AQ_3[0]),
	.O(single_out_i_AQ_0)
);
defparam \single_out_i_3[0] .INIT=64'hFEBADC9876325410;
// @22:58
  LUT6 \single_out_i2_3[4]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[4]),
	.I3(out_Q_i[40]),
	.I4(out_Q_i[16]),
	.I5(out_Q_i[28]),
	.O(single_out_i_AQ2_4)
);
defparam \single_out_i2_3[4] .INIT=64'hF7E6D5C4B3A29180;
// @22:58
  LUT6 \single_out_i2_3[0]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[12]),
	.I3(out_Q_i[24]),
	.I4(out_Q_i[36]),
	.I5(out_Q_i[0]),
	.O(single_out_i_AQ2_0)
);
defparam \single_out_i2_3[0] .INIT=64'hFDB9ECA875316420;
// @22:57
  LUT6 \single_out_r2_3[5]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[29]),
	.I3(out_Q_r[41]),
	.I4(out_Q_r[5]),
	.I5(out_Q_r[17]),
	.O(single_out_r_AQ2_4)
);
defparam \single_out_r2_3[5] .INIT=64'hFBEA7362D9C85140;
// @22:57
  LUT6 \single_out_r2_3[1]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_r[1]),
	.I3(out_Q_r[13]),
	.I4(out_Q_r[25]),
	.I5(out_Q_r[37]),
	.O(single_out_r_AQ2_0)
);
defparam \single_out_r2_3[1] .INIT=64'hF7D5B391E6C4A280;
// @22:56
  LUT6 \single_out_i_3[8]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[8]),
	.I3(vec_out_i_AQ_1[8]),
	.I4(vec_out_i_AQ_3[8]),
	.I5(vec_out_i_AQ_2[8]),
	.O(single_out_i_AQ_8)
);
defparam \single_out_i_3[8] .INIT=64'hFEBA7632DC985410;
// @22:56
  LUT6 \single_out_i_3[10]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[10]),
	.I3(vec_out_i_AQ_2[10]),
	.I4(vec_out_i_AQ_3[10]),
	.I5(vec_out_i_AQ_1[10]),
	.O(single_out_i_AQ_10)
);
defparam \single_out_i_3[10] .INIT=64'hFEDC7654BA983210;
// @22:58
  LUT6 \single_out_i2_3[11]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(out_Q_i[11]),
	.I3(out_Q_i[23]),
	.I4(out_Q_i[35]),
	.I5(out_Q_i[47]),
	.O(single_out_i_AQ2_11)
);
defparam \single_out_i2_3[11] .INIT=64'hF7D5B391E6C4A280;
// @22:56
  LUT6 \single_out_i_3[11]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[11]),
	.I3(vec_out_i_AQ_1[11]),
	.I4(vec_out_i_AQ_2[11]),
	.I5(vec_out_i_AQ_3[11]),
	.O(single_out_i_AQ_11)
);
defparam \single_out_i_3[11] .INIT=64'hFEBADC9876325410;
// @22:56
  LUT6 \single_out_i_3[9]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_3[9]),
	.I3(vec_out_i_AQ_0[9]),
	.I4(vec_out_i_AQ_1[9]),
	.I5(vec_out_i_AQ_2[9]),
	.O(single_out_i_AQ_9)
);
defparam \single_out_i_3[9] .INIT=64'hF7E6B3A2D5C49180;
// @22:56
  LUT6 \single_out_i_3[4]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_i_AQ_0[4]),
	.I3(vec_out_i_AQ_3[4]),
	.I4(vec_out_i_AQ_1[4]),
	.I5(vec_out_i_AQ_2[4]),
	.O(single_out_i_AQ_4)
);
defparam \single_out_i_3[4] .INIT=64'hFE76BA32DC549810;
// @22:55
  LUT6 \single_out_r_3[8]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[8]),
	.I3(vec_out_r_AQ_1[8]),
	.I4(vec_out_r_AQ_3[8]),
	.I5(vec_out_r_AQ_2[8]),
	.O(single_out_r_AQ_7)
);
defparam \single_out_r_3[8] .INIT=64'hFEBA7632DC985410;
// @22:55
  LUT6 \single_out_r_3[2]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[2]),
	.I3(vec_out_r_AQ_1[2]),
	.I4(vec_out_r_AQ_2[2]),
	.I5(vec_out_r_AQ_3[2]),
	.O(single_out_r_AQ_1)
);
defparam \single_out_r_3[2] .INIT=64'hFEBADC9876325410;
// @22:55
  LUT6 \single_out_r_3[1]  (
	.I0(row_sel_AQ[1]),
	.I1(row_sel_AQ[0]),
	.I2(vec_out_r_AQ_0[1]),
	.I3(vec_out_r_AQ_1[1]),
	.I4(vec_out_r_AQ_2[1]),
	.I5(vec_out_r_AQ_3[1]),
	.O(single_out_r_AQ_0)
);
defparam \single_out_r_3[1] .INIT=64'hFEBADC9876325410;
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
endmodule