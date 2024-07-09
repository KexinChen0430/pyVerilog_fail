module qr_wrapper (
  out_Q_r,
  out_Q_i,
  out_R_i,
  out_R_r,
  in_A_r,
  in_A_i,
  clk,
  rst,
  valid_out,
  ready,
  request_out,
  start,
  reduced_matrix
)
;
output [47:0] out_Q_r ;
output [47:0] out_Q_i ;
output [47:12] out_R_i ;
output [47:0] out_R_r ;
input [47:0] in_A_r ;
input [47:0] in_A_i ;
input clk ;
input rst ;
output valid_out ;
output ready ;
input request_out ;
input start ;
input reduced_matrix ;
wire clk ;
wire rst ;
wire valid_out ;
wire ready ;
wire request_out ;
wire start ;
wire reduced_matrix ;
wire [1:0] col_sel_AQ;
wire [1:0] col_sel_AQ_4;
wire [1:0] col_sel_R;
wire [1:0] state;
wire [1:0] state_ns;
wire start_QR ;
wire start_QR_0 ;
wire wr_A_QR ;
wire wr_A_QR_0 ;
wire valid_out_0 ;
wire ready_0 ;
wire red_mat_reg ;
wire red_mat_reg_0 ;
wire N_14_i ;
wire N_16_i ;
wire N_26 ;
wire done_QR ;
wire N_50 ;
wire N_49 ;
wire N_48 ;
wire N_47 ;
wire GND ;
wire VCC ;
// @27:104
  FDC start_QR_Z (
	.Q(start_QR),
	.D(start_QR_0),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC wr_A_QR_Z (
	.Q(wr_A_QR),
	.D(wr_A_QR_0),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC valid_out_Z (
	.Q(valid_out),
	.D(valid_out_0),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC ready_Z (
	.Q(ready),
	.D(ready_0),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC red_mat_reg_Z (
	.Q(red_mat_reg),
	.D(red_mat_reg_0),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \col_sel_AQ_Z[1]  (
	.Q(col_sel_AQ[1]),
	.D(col_sel_AQ_4[1]),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \col_sel_R_Z[0]  (
	.Q(col_sel_R[0]),
	.D(N_14_i),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \col_sel_R_Z[1]  (
	.Q(col_sel_R[1]),
	.D(N_16_i),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \col_sel_AQ_Z[0]  (
	.Q(col_sel_AQ[0]),
	.D(col_sel_AQ_4[0]),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \state_Z[0]  (
	.Q(state[0]),
	.D(state_ns[0]),
	.C(clk),
	.CLR(rst)
);
// @27:104
  FDC \state_Z[1]  (
	.Q(state[1]),
	.D(state_ns[1]),
	.C(clk),
	.CLR(rst)
);
// @27:114
  LUT6_L \col_sel_AQ_4_0[1]  (
	.I0(request_out),
	.I1(start),
	.I2(col_sel_AQ[1]),
	.I3(col_sel_AQ[0]),
	.I4(state[0]),
	.I5(state[1]),
	.LO(col_sel_AQ_4[1])
);
defparam \col_sel_AQ_4_0[1] .INIT=64'h0FF0F0F00FF01010;
// @27:104
  LUT6_L start_QR_e (
	.I0(red_mat_reg),
	.I1(col_sel_AQ[1]),
	.I2(col_sel_AQ[0]),
	.I3(start_QR),
	.I4(state[0]),
	.I5(state[1]),
	.LO(start_QR_0)
);
defparam start_QR_e.INIT=64'hFF000000FFE0FF00;
// @27:104
  LUT3 \state_ns_1_0_.m8_0_o2  (
	.I0(red_mat_reg),
	.I1(col_sel_AQ[1]),
	.I2(col_sel_AQ[0]),
	.O(N_26)
);
defparam \state_ns_1_0_.m8_0_o2 .INIT=8'h1F;
// @27:104
  LUT5_L ready_e (
	.I0(request_out),
	.I1(start),
	.I2(ready),
	.I3(state[0]),
	.I4(state[1]),
	.LO(ready_0)
);
defparam ready_e.INIT=32'hF0F0F011;
// @27:104
  LUT5_L red_mat_reg_e (
	.I0(reduced_matrix),
	.I1(start),
	.I2(red_mat_reg),
	.I3(state[0]),
	.I4(state[1]),
	.LO(red_mat_reg_0)
);
defparam red_mat_reg_e.INIT=32'hF0F0F0B8;
// @27:104
  LUT5_L \state_ns_1_0_.m5_0_m5  (
	.I0(request_out),
	.I1(start),
	.I2(state[0]),
	.I3(state[1]),
	.I4(N_26),
	.LO(state_ns[0])
);
defparam \state_ns_1_0_.m5_0_m5 .INIT=32'hF0FE000E;
// @27:114
  LUT5_L \col_sel_AQ_4_0[0]  (
	.I0(request_out),
	.I1(start),
	.I2(col_sel_AQ[0]),
	.I3(state[0]),
	.I4(state[1]),
	.LO(col_sel_AQ_4[0])
);
defparam \col_sel_AQ_4_0[0] .INIT=32'h0FF00F10;
// @27:104
  LUT6_L \col_sel_R_RNO[1]  (
	.I0(request_out),
	.I1(start),
	.I2(state[0]),
	.I3(state[1]),
	.I4(col_sel_R[0]),
	.I5(col_sel_R[1]),
	.LO(N_16_i)
);
defparam \col_sel_R_RNO[1] .INIT=64'h0FFDFFFDF0000000;
// @27:104
  LUT5_L \col_sel_R_RNO[0]  (
	.I0(request_out),
	.I1(start),
	.I2(state[0]),
	.I3(state[1]),
	.I4(col_sel_R[0]),
	.LO(N_14_i)
);
defparam \col_sel_R_RNO[0] .INIT=32'h0FFDF000;
// @27:104
  LUT6_L valid_out_e (
	.I0(request_out),
	.I1(start),
	.I2(valid_out),
	.I3(state[0]),
	.I4(state[1]),
	.I5(N_26),
	.LO(valid_out_0)
);
defparam valid_out_e.INIT=64'hF0F0F0F200F0F0F2;
// @27:104
  LUT6_L \state_ns_1_0_.m8_0  (
	.I0(request_out),
	.I1(start),
	.I2(done_QR),
	.I3(state[0]),
	.I4(state[1]),
	.I5(N_26),
	.LO(state_ns[1])
);
defparam \state_ns_1_0_.m8_0 .INIT=64'hFF0F0022000FFF22;
// @27:104
  LUT5_L wr_A_QR_e (
	.I0(start),
	.I1(wr_A_QR),
	.I2(state[0]),
	.I3(state[1]),
	.I4(N_26),
	.LO(wr_A_QR_0)
);
defparam wr_A_QR_e.INIT=32'hCCCECC0E;
//@27:104
// @27:84
  qr_decomp qr_decomp_inst (
	.out_Q_r(out_Q_r[47:0]),
	.out_Q_i(out_Q_i[47:0]),
	.col_sel_R(col_sel_R[1:0]),
	.out_R_i(out_R_i[47:12]),
	.out_R_r(out_R_r[47:0]),
	.col_sel_AQ(col_sel_AQ[1:0]),
	.in_A_r(in_A_r[47:0]),
	.in_A_i(in_A_i[47:0]),
	.clk(clk),
	.rst(rst),
	.wr_A_QR(wr_A_QR),
	.start_QR(start_QR),
	.done_QR(done_QR),
	.red_mat_reg_0(red_mat_reg)
);
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule