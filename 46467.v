module r_mat_regs (
  row_sel_R,
  col_sel_R_mux_i_m3_lut6_2_O6,
  col_sel_R_mux_i_m3_lut6_2_O5,
  single_in_r_R_mux,
  wr_en_AQ_sel,
  col_sel_R,
  col_sel_R_int,
  out_R_i,
  out_R_r,
  wr_en_R,
  N_28_i,
  clk,
  N_30_i,
  N_32_i,
  N_34_i,
  N_383_i,
  N_384_i,
  N_385_i,
  N_386_i,
  N_387_i,
  N_388_i,
  N_389_i,
  N_390_i,
  N_391_i,
  N_392_i,
  N_393_i,
  N_394_i,
  N_395_i,
  N_396_i,
  N_397_i,
  N_398_i,
  N_399_i,
  N_400_i,
  N_401_i
)
;
input [1:0] row_sel_R ;
input [0:0] col_sel_R_mux_i_m3_lut6_2_O6 ;
input [0:0] col_sel_R_mux_i_m3_lut6_2_O5 ;
input [11:11] single_in_r_R_mux ;
input [0:0] wr_en_AQ_sel ;
input [1:0] col_sel_R ;
input [1:0] col_sel_R_int ;
output [47:12] out_R_i ;
output [47:0] out_R_r ;
input wr_en_R ;
input N_28_i ;
input clk ;
input N_30_i ;
input N_32_i ;
input N_34_i ;
input N_383_i ;
input N_384_i ;
input N_385_i ;
input N_386_i ;
input N_387_i ;
input N_388_i ;
input N_389_i ;
input N_390_i ;
input N_391_i ;
input N_392_i ;
input N_393_i ;
input N_394_i ;
input N_395_i ;
input N_396_i ;
input N_397_i ;
input N_398_i ;
input N_399_i ;
input N_400_i ;
input N_401_i ;
wire wr_en_R ;
wire N_28_i ;
wire clk ;
wire N_30_i ;
wire N_32_i ;
wire N_34_i ;
wire N_383_i ;
wire N_384_i ;
wire N_385_i ;
wire N_386_i ;
wire N_387_i ;
wire N_388_i ;
wire N_389_i ;
wire N_390_i ;
wire N_391_i ;
wire N_392_i ;
wire N_393_i ;
wire N_394_i ;
wire N_395_i ;
wire N_396_i ;
wire N_397_i ;
wire N_398_i ;
wire N_399_i ;
wire N_400_i ;
wire N_401_i ;
wire [11:0] mat_r_reg_3_3;
wire [11:0] mat_r_reg_3_2;
wire [11:0] mat_r_reg_3_1;
wire [11:0] mat_r_reg_2_2;
wire [11:0] mat_r_reg_2_1;
wire [11:0] mat_r_reg_1_1;
wire [11:0] mat_i_reg_3_2;
wire [11:0] mat_i_reg_3_1;
wire [11:0] mat_i_reg_3_0;
wire [11:0] mat_i_reg_2_1;
wire [11:0] mat_i_reg_2_0;
wire [11:0] mat_i_reg_1_0;
wire VCC ;
wire mat_i_reg_1_0_1_sqmuxa ;
wire mat_i_reg_3_0_1_sqmuxa ;
wire mat_r_reg_1_1_1_sqmuxa ;
wire mat_i_reg_3_1_1_sqmuxa ;
wire mat_i_reg_2_0_1_sqmuxa ;
wire mat_i_reg_3_2_1_sqmuxa ;
wire mat_r_reg_2_2_1_sqmuxa ;
wire mat_r_reg_3_3_1_sqmuxa ;
wire mat_i_reg_2_1_1_sqmuxa ;
wire mat_i_reg_2_1_1_sqmuxa_lut6_2_O5 ;
wire GND ;
// @19:70
  FDE \mat_r_reg_3_3_Z[0]  (
	.Q(mat_r_reg_3_3[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[1]  (
	.Q(mat_r_reg_3_3[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[2]  (
	.Q(mat_r_reg_3_3[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[3]  (
	.Q(mat_r_reg_3_3[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[4]  (
	.Q(mat_r_reg_3_3[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[5]  (
	.Q(mat_r_reg_3_3[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[6]  (
	.Q(mat_r_reg_3_3[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[7]  (
	.Q(mat_r_reg_3_3[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[8]  (
	.Q(mat_r_reg_3_3[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[9]  (
	.Q(mat_r_reg_3_3[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[10]  (
	.Q(mat_r_reg_3_3[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_3_Z[11]  (
	.Q(mat_r_reg_3_3[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_r_reg_3_3_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[0]  (
	.Q(mat_r_reg_3_2[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[1]  (
	.Q(mat_r_reg_3_2[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[2]  (
	.Q(mat_r_reg_3_2[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[3]  (
	.Q(mat_r_reg_3_2[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[4]  (
	.Q(mat_r_reg_3_2[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[5]  (
	.Q(mat_r_reg_3_2[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[6]  (
	.Q(mat_r_reg_3_2[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[7]  (
	.Q(mat_r_reg_3_2[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[8]  (
	.Q(mat_r_reg_3_2[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[9]  (
	.Q(mat_r_reg_3_2[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[10]  (
	.Q(mat_r_reg_3_2[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_2_Z[11]  (
	.Q(mat_r_reg_3_2[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[0]  (
	.Q(mat_r_reg_3_1[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[1]  (
	.Q(mat_r_reg_3_1[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[2]  (
	.Q(mat_r_reg_3_1[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[3]  (
	.Q(mat_r_reg_3_1[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[4]  (
	.Q(mat_r_reg_3_1[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[5]  (
	.Q(mat_r_reg_3_1[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[6]  (
	.Q(mat_r_reg_3_1[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[7]  (
	.Q(mat_r_reg_3_1[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[8]  (
	.Q(mat_r_reg_3_1[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[9]  (
	.Q(mat_r_reg_3_1[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[10]  (
	.Q(mat_r_reg_3_1[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_3_1_Z[11]  (
	.Q(mat_r_reg_3_1[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[0]  (
	.Q(mat_r_reg_2_2[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[1]  (
	.Q(mat_r_reg_2_2[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[2]  (
	.Q(mat_r_reg_2_2[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[3]  (
	.Q(mat_r_reg_2_2[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[4]  (
	.Q(mat_r_reg_2_2[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[5]  (
	.Q(mat_r_reg_2_2[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[6]  (
	.Q(mat_r_reg_2_2[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[7]  (
	.Q(mat_r_reg_2_2[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[8]  (
	.Q(mat_r_reg_2_2[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[9]  (
	.Q(mat_r_reg_2_2[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[10]  (
	.Q(mat_r_reg_2_2[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_2_Z[11]  (
	.Q(mat_r_reg_2_2[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_r_reg_2_2_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[0]  (
	.Q(mat_r_reg_2_1[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[1]  (
	.Q(mat_r_reg_2_1[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[2]  (
	.Q(mat_r_reg_2_1[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[3]  (
	.Q(mat_r_reg_2_1[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[4]  (
	.Q(mat_r_reg_2_1[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[5]  (
	.Q(mat_r_reg_2_1[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[6]  (
	.Q(mat_r_reg_2_1[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[7]  (
	.Q(mat_r_reg_2_1[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[8]  (
	.Q(mat_r_reg_2_1[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[9]  (
	.Q(mat_r_reg_2_1[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[10]  (
	.Q(mat_r_reg_2_1[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_2_1_Z[11]  (
	.Q(mat_r_reg_2_1[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[0]  (
	.Q(mat_r_reg_1_1[0]),
	.D(N_28_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[1]  (
	.Q(mat_r_reg_1_1[1]),
	.D(N_30_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[2]  (
	.Q(mat_r_reg_1_1[2]),
	.D(N_32_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[3]  (
	.Q(mat_r_reg_1_1[3]),
	.D(N_34_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[4]  (
	.Q(mat_r_reg_1_1[4]),
	.D(N_383_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[5]  (
	.Q(mat_r_reg_1_1[5]),
	.D(N_384_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[6]  (
	.Q(mat_r_reg_1_1[6]),
	.D(N_385_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[7]  (
	.Q(mat_r_reg_1_1[7]),
	.D(N_386_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[8]  (
	.Q(mat_r_reg_1_1[8]),
	.D(N_387_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[9]  (
	.Q(mat_r_reg_1_1[9]),
	.D(N_388_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[10]  (
	.Q(mat_r_reg_1_1[10]),
	.D(N_389_i),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_r_reg_1_1_Z[11]  (
	.Q(mat_r_reg_1_1[11]),
	.D(single_in_r_R_mux[11]),
	.C(clk),
	.CE(mat_r_reg_1_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[0]  (
	.Q(mat_i_reg_3_2[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[1]  (
	.Q(mat_i_reg_3_2[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[2]  (
	.Q(mat_i_reg_3_2[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[3]  (
	.Q(mat_i_reg_3_2[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[4]  (
	.Q(mat_i_reg_3_2[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[5]  (
	.Q(mat_i_reg_3_2[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[6]  (
	.Q(mat_i_reg_3_2[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[7]  (
	.Q(mat_i_reg_3_2[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[8]  (
	.Q(mat_i_reg_3_2[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[9]  (
	.Q(mat_i_reg_3_2[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[10]  (
	.Q(mat_i_reg_3_2[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_2_Z[11]  (
	.Q(mat_i_reg_3_2[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_3_2_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[0]  (
	.Q(mat_i_reg_3_1[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[1]  (
	.Q(mat_i_reg_3_1[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[2]  (
	.Q(mat_i_reg_3_1[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[3]  (
	.Q(mat_i_reg_3_1[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[4]  (
	.Q(mat_i_reg_3_1[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[5]  (
	.Q(mat_i_reg_3_1[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[6]  (
	.Q(mat_i_reg_3_1[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[7]  (
	.Q(mat_i_reg_3_1[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[8]  (
	.Q(mat_i_reg_3_1[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[9]  (
	.Q(mat_i_reg_3_1[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[10]  (
	.Q(mat_i_reg_3_1[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_1_Z[11]  (
	.Q(mat_i_reg_3_1[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_3_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[0]  (
	.Q(mat_i_reg_3_0[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[1]  (
	.Q(mat_i_reg_3_0[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[2]  (
	.Q(mat_i_reg_3_0[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[3]  (
	.Q(mat_i_reg_3_0[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[4]  (
	.Q(mat_i_reg_3_0[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[5]  (
	.Q(mat_i_reg_3_0[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[6]  (
	.Q(mat_i_reg_3_0[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[7]  (
	.Q(mat_i_reg_3_0[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[8]  (
	.Q(mat_i_reg_3_0[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[9]  (
	.Q(mat_i_reg_3_0[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[10]  (
	.Q(mat_i_reg_3_0[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_3_0_Z[11]  (
	.Q(mat_i_reg_3_0[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_3_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[0]  (
	.Q(mat_i_reg_2_1[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[1]  (
	.Q(mat_i_reg_2_1[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[2]  (
	.Q(mat_i_reg_2_1[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[3]  (
	.Q(mat_i_reg_2_1[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[4]  (
	.Q(mat_i_reg_2_1[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[5]  (
	.Q(mat_i_reg_2_1[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[6]  (
	.Q(mat_i_reg_2_1[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[7]  (
	.Q(mat_i_reg_2_1[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[8]  (
	.Q(mat_i_reg_2_1[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[9]  (
	.Q(mat_i_reg_2_1[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[10]  (
	.Q(mat_i_reg_2_1[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_1_Z[11]  (
	.Q(mat_i_reg_2_1[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_2_1_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[0]  (
	.Q(mat_i_reg_2_0[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[1]  (
	.Q(mat_i_reg_2_0[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[2]  (
	.Q(mat_i_reg_2_0[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[3]  (
	.Q(mat_i_reg_2_0[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[4]  (
	.Q(mat_i_reg_2_0[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[5]  (
	.Q(mat_i_reg_2_0[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[6]  (
	.Q(mat_i_reg_2_0[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[7]  (
	.Q(mat_i_reg_2_0[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[8]  (
	.Q(mat_i_reg_2_0[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[9]  (
	.Q(mat_i_reg_2_0[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[10]  (
	.Q(mat_i_reg_2_0[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_2_0_Z[11]  (
	.Q(mat_i_reg_2_0[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_2_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[0]  (
	.Q(mat_i_reg_1_0[0]),
	.D(N_390_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[1]  (
	.Q(mat_i_reg_1_0[1]),
	.D(N_391_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[2]  (
	.Q(mat_i_reg_1_0[2]),
	.D(N_392_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[3]  (
	.Q(mat_i_reg_1_0[3]),
	.D(N_393_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[4]  (
	.Q(mat_i_reg_1_0[4]),
	.D(N_394_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[5]  (
	.Q(mat_i_reg_1_0[5]),
	.D(N_395_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[6]  (
	.Q(mat_i_reg_1_0[6]),
	.D(N_396_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[7]  (
	.Q(mat_i_reg_1_0[7]),
	.D(N_397_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[8]  (
	.Q(mat_i_reg_1_0[8]),
	.D(N_398_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[9]  (
	.Q(mat_i_reg_1_0[9]),
	.D(N_399_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[10]  (
	.Q(mat_i_reg_1_0[10]),
	.D(N_400_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:70
  FDE \mat_i_reg_1_0_Z[11]  (
	.Q(mat_i_reg_1_0[11]),
	.D(N_401_i),
	.C(clk),
	.CE(mat_i_reg_1_0_1_sqmuxa)
);
// @19:65
  LUT6 \vector_out_r_1_2[35]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[0]),
	.I3(mat_r_reg_3_2[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[12])
);
defparam \vector_out_r_1_2[35] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[12]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[11]),
	.I3(mat_i_reg_3_1[11]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[35])
);
defparam \vector_out_i_1_3[12] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[13]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[10]),
	.I3(mat_i_reg_3_1[10]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[34])
);
defparam \vector_out_i_1_3[13] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[14]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[9]),
	.I3(mat_i_reg_3_1[9]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[33])
);
defparam \vector_out_i_1_3[14] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[17]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[6]),
	.I3(mat_i_reg_3_1[6]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[30])
);
defparam \vector_out_i_1_3[17] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[18]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[5]),
	.I3(mat_i_reg_3_1[5]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[29])
);
defparam \vector_out_i_1_3[18] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[19]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[4]),
	.I3(mat_i_reg_3_1[4]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[28])
);
defparam \vector_out_i_1_3[19] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[20]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[3]),
	.I3(mat_i_reg_3_1[3]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[27])
);
defparam \vector_out_i_1_3[20] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[21]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[2]),
	.I3(mat_i_reg_3_1[2]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[26])
);
defparam \vector_out_i_1_3[21] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[22]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[1]),
	.I3(mat_i_reg_3_1[1]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[25])
);
defparam \vector_out_i_1_3[22] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[23]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[0]),
	.I3(mat_i_reg_3_1[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[24])
);
defparam \vector_out_i_1_3[23] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[34]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[1]),
	.I3(mat_r_reg_3_2[1]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[13])
);
defparam \vector_out_r_1_2[34] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[32]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[3]),
	.I3(mat_r_reg_3_2[3]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[15])
);
defparam \vector_out_r_1_2[32] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[33]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[2]),
	.I3(mat_r_reg_3_2[2]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[14])
);
defparam \vector_out_r_1_2[33] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[30]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[5]),
	.I3(mat_r_reg_3_2[5]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[17])
);
defparam \vector_out_r_1_2[30] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[28]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[7]),
	.I3(mat_r_reg_3_2[7]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[19])
);
defparam \vector_out_r_1_2[28] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[29]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[6]),
	.I3(mat_r_reg_3_2[6]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[18])
);
defparam \vector_out_r_1_2[29] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[26]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[9]),
	.I3(mat_r_reg_3_2[9]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[21])
);
defparam \vector_out_r_1_2[26] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[27]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[8]),
	.I3(mat_r_reg_3_2[8]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[20])
);
defparam \vector_out_r_1_2[27] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[24]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[11]),
	.I3(mat_r_reg_3_2[11]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[23])
);
defparam \vector_out_r_1_2[24] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[25]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[10]),
	.I3(mat_r_reg_3_2[10]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[22])
);
defparam \vector_out_r_1_2[25] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[16]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[7]),
	.I3(mat_i_reg_3_1[7]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[31])
);
defparam \vector_out_i_1_3[16] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1_2[31]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_r_reg_2_2[4]),
	.I3(mat_r_reg_3_2[4]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[16])
);
defparam \vector_out_r_1_2[31] .INIT=64'hFC300000A820A820;
// @19:66
  LUT6 \vector_out_i_1_3[15]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I2(mat_i_reg_2_1[8]),
	.I3(mat_i_reg_3_1[8]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[32])
);
defparam \vector_out_i_1_3[15] .INIT=64'hFC300000A820A820;
// @19:65
  LUT6 \vector_out_r_1[43]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[4]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[4])
);
defparam \vector_out_r_1[43] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[44]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[3]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[3])
);
defparam \vector_out_r_1[44] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[46]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[1]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[1])
);
defparam \vector_out_r_1[46] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[47]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[0]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[0])
);
defparam \vector_out_r_1[47] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNILK8E1[11]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[11]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[23])
);
defparam \mat_i_reg_3_2_RNILK8E1[11] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNIKJ8E1[10]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[10]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[22])
);
defparam \mat_i_reg_3_2_RNIKJ8E1[10] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNIC0IC1[9]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[9]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[21])
);
defparam \mat_i_reg_3_2_RNIC0IC1[9] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[39]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[8]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[8])
);
defparam \vector_out_r_1[39] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[37]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[10]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[10])
);
defparam \vector_out_r_1[37] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[38]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[9]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[9])
);
defparam \vector_out_r_1[38] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[40]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[7]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[7])
);
defparam \vector_out_r_1[40] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[41]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[6]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[6])
);
defparam \vector_out_r_1[41] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[42]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[5]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[5])
);
defparam \vector_out_r_1[42] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI5PHC1[2]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[2]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[14])
);
defparam \mat_i_reg_3_2_RNI5PHC1[2] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[45]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[2]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[2])
);
defparam \vector_out_r_1[45] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNIBVHC1[8]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[8]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[20])
);
defparam \mat_i_reg_3_2_RNIBVHC1[8] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNIAUHC1[7]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[7]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[19])
);
defparam \mat_i_reg_3_2_RNIAUHC1[7] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI9THC1[6]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[6]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[18])
);
defparam \mat_i_reg_3_2_RNI9THC1[6] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI8SHC1[5]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[5]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[17])
);
defparam \mat_i_reg_3_2_RNI8SHC1[5] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI7RHC1[4]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[4]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[16])
);
defparam \mat_i_reg_3_2_RNI7RHC1[4] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI6QHC1[3]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[3]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[15])
);
defparam \mat_i_reg_3_2_RNI6QHC1[3] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI4OHC1[1]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[1]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[13])
);
defparam \mat_i_reg_3_2_RNI4OHC1[1] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \mat_i_reg_3_2_RNI3NHC1[0]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_i_reg_3_2[0]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_i[12])
);
defparam \mat_i_reg_3_2_RNI3NHC1[0] .INIT=64'hF000000080808080;
// @19:65
  LUT6 \vector_out_r_1[36]  (
	.I0(col_sel_R[0]),
	.I1(col_sel_R[1]),
	.I2(mat_r_reg_3_3[11]),
	.I3(col_sel_R_int[0]),
	.I4(col_sel_R_int[1]),
	.I5(wr_en_AQ_sel[0]),
	.O(out_R_r[11])
);
defparam \vector_out_r_1[36] .INIT=64'hF000000080808080;
// @19:66
  LUT5 \vector_out_i_1_3[9]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[2]),
	.I3(mat_i_reg_2_0[2]),
	.I4(mat_i_reg_3_0[2]),
	.O(out_R_i[38])
);
defparam \vector_out_i_1_3[9] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[10]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[1]),
	.I3(mat_i_reg_2_0[1]),
	.I4(mat_i_reg_3_0[1]),
	.O(out_R_i[37])
);
defparam \vector_out_i_1_3[10] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[7]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[4]),
	.I3(mat_i_reg_2_0[4]),
	.I4(mat_i_reg_3_0[4]),
	.O(out_R_i[40])
);
defparam \vector_out_i_1_3[7] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[8]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[3]),
	.I3(mat_i_reg_2_0[3]),
	.I4(mat_i_reg_3_0[3]),
	.O(out_R_i[39])
);
defparam \vector_out_i_1_3[8] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[5]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[6]),
	.I3(mat_i_reg_2_0[6]),
	.I4(mat_i_reg_3_0[6]),
	.O(out_R_i[42])
);
defparam \vector_out_i_1_3[5] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[6]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[5]),
	.I3(mat_i_reg_2_0[5]),
	.I4(mat_i_reg_3_0[5]),
	.O(out_R_i[41])
);
defparam \vector_out_i_1_3[6] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[3]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[8]),
	.I3(mat_i_reg_2_0[8]),
	.I4(mat_i_reg_3_0[8]),
	.O(out_R_i[44])
);
defparam \vector_out_i_1_3[3] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[4]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[7]),
	.I3(mat_i_reg_2_0[7]),
	.I4(mat_i_reg_3_0[7]),
	.O(out_R_i[43])
);
defparam \vector_out_i_1_3[4] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[1]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[10]),
	.I3(mat_i_reg_2_0[10]),
	.I4(mat_i_reg_3_0[10]),
	.O(out_R_i[46])
);
defparam \vector_out_i_1_3[1] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[2]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[9]),
	.I3(mat_i_reg_2_0[9]),
	.I4(mat_i_reg_3_0[9]),
	.O(out_R_i[45])
);
defparam \vector_out_i_1_3[2] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[0]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[11]),
	.I3(mat_i_reg_2_0[11]),
	.I4(mat_i_reg_3_0[11]),
	.O(out_R_i[47])
);
defparam \vector_out_i_1_3[0] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[12]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[11]),
	.I3(mat_r_reg_2_1[11]),
	.I4(mat_r_reg_3_1[11]),
	.O(out_R_r[35])
);
defparam \vector_out_r_1_3[12] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[15]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[8]),
	.I3(mat_r_reg_2_1[8]),
	.I4(mat_r_reg_3_1[8]),
	.O(out_R_r[32])
);
defparam \vector_out_r_1_3[15] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[14]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[9]),
	.I3(mat_r_reg_2_1[9]),
	.I4(mat_r_reg_3_1[9]),
	.O(out_R_r[33])
);
defparam \vector_out_r_1_3[14] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[13]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[10]),
	.I3(mat_r_reg_2_1[10]),
	.I4(mat_r_reg_3_1[10]),
	.O(out_R_r[34])
);
defparam \vector_out_r_1_3[13] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[18]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[5]),
	.I3(mat_r_reg_2_1[5]),
	.I4(mat_r_reg_3_1[5]),
	.O(out_R_r[29])
);
defparam \vector_out_r_1_3[18] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[17]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[6]),
	.I3(mat_r_reg_2_1[6]),
	.I4(mat_r_reg_3_1[6]),
	.O(out_R_r[30])
);
defparam \vector_out_r_1_3[17] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[16]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[7]),
	.I3(mat_r_reg_2_1[7]),
	.I4(mat_r_reg_3_1[7]),
	.O(out_R_r[31])
);
defparam \vector_out_r_1_3[16] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[21]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[2]),
	.I3(mat_r_reg_2_1[2]),
	.I4(mat_r_reg_3_1[2]),
	.O(out_R_r[26])
);
defparam \vector_out_r_1_3[21] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[20]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[3]),
	.I3(mat_r_reg_2_1[3]),
	.I4(mat_r_reg_3_1[3]),
	.O(out_R_r[27])
);
defparam \vector_out_r_1_3[20] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[19]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[4]),
	.I3(mat_r_reg_2_1[4]),
	.I4(mat_r_reg_3_1[4]),
	.O(out_R_r[28])
);
defparam \vector_out_r_1_3[19] .INIT=32'hECA86420;
// @19:66
  LUT5 \vector_out_i_1_3[11]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_i_reg_1_0[0]),
	.I3(mat_i_reg_2_0[0]),
	.I4(mat_i_reg_3_0[0]),
	.O(out_R_i[36])
);
defparam \vector_out_i_1_3[11] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[23]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[0]),
	.I3(mat_r_reg_2_1[0]),
	.I4(mat_r_reg_3_1[0]),
	.O(out_R_r[24])
);
defparam \vector_out_r_1_3[23] .INIT=32'hECA86420;
// @19:65
  LUT5 \vector_out_r_1_3[22]  (
	.I0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.I2(mat_r_reg_1_1[1]),
	.I3(mat_r_reg_2_1[1]),
	.I4(mat_r_reg_3_1[1]),
	.O(out_R_r[25])
);
defparam \vector_out_r_1_3[22] .INIT=32'hECA86420;
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_11_0 (
	.O(out_R_r[47]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(single_in_r_R_mux[11]),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_10_0 (
	.O(out_R_r[46]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_389_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_9_0 (
	.O(out_R_r[45]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_388_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_8_0 (
	.O(out_R_r[44]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_387_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_7_0 (
	.O(out_R_r[43]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_386_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_6_0 (
	.O(out_R_r[42]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_385_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_5_0 (
	.O(out_R_r[41]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_384_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_4_0 (
	.O(out_R_r[40]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_383_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_3_0 (
	.O(out_R_r[39]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_34_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_2_0 (
	.O(out_R_r[38]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_32_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_1_0 (
	.O(out_R_r[37]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_30_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
// @19:70
  RAM32X1S mat_r_reg_0_mat_r_reg_0_0_0 (
	.O(out_R_r[36]),
	.A0(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.A1(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.A2(GND),
	.A3(GND),
	.A4(GND),
	.D(N_28_i),
	.WCLK(clk),
	.WE(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
// @19:70
  LUT5 mat_i_reg_2_1_1_sqmuxa_lut6_2_o6 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_2_1_1_sqmuxa)
);
defparam mat_i_reg_2_1_1_sqmuxa_lut6_2_o6.INIT=32'h00200000;
// @19:70
  LUT3 mat_i_reg_2_1_1_sqmuxa_lut6_2_o5 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.O(mat_i_reg_2_1_1_sqmuxa_lut6_2_O5)
);
defparam mat_i_reg_2_1_1_sqmuxa_lut6_2_o5.INIT=8'h10;
// @19:70
  LUT5 mat_r_reg_2_2_1_sqmuxa_lut6_2_o6 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_r_reg_2_2_1_sqmuxa)
);
defparam mat_r_reg_2_2_1_sqmuxa_lut6_2_o6.INIT=32'h00400000;
// @19:70
  LUT5 mat_r_reg_2_2_1_sqmuxa_lut6_2_o5 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_r_reg_3_3_1_sqmuxa)
);
defparam mat_r_reg_2_2_1_sqmuxa_lut6_2_o5.INIT=32'h80000000;
// @19:70
  LUT5 mat_i_reg_2_0_1_sqmuxa_lut6_2_o6 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_2_0_1_sqmuxa)
);
defparam mat_i_reg_2_0_1_sqmuxa_lut6_2_o6.INIT=32'h00100000;
// @19:70
  LUT5 mat_i_reg_2_0_1_sqmuxa_lut6_2_o5 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_3_2_1_sqmuxa)
);
defparam mat_i_reg_2_0_1_sqmuxa_lut6_2_o5.INIT=32'h40000000;
// @19:70
  LUT5 mat_r_reg_1_1_1_sqmuxa_lut6_2_o6 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_r_reg_1_1_1_sqmuxa)
);
defparam mat_r_reg_1_1_1_sqmuxa_lut6_2_o6.INIT=32'h00002000;
// @19:70
  LUT5 mat_r_reg_1_1_1_sqmuxa_lut6_2_o5 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_3_1_1_sqmuxa)
);
defparam mat_r_reg_1_1_1_sqmuxa_lut6_2_o5.INIT=32'h20000000;
// @19:70
  LUT5 mat_i_reg_1_0_1_sqmuxa_lut6_2_o6 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_1_0_1_sqmuxa)
);
defparam mat_i_reg_1_0_1_sqmuxa_lut6_2_o6.INIT=32'h00001000;
// @19:70
  LUT5 mat_i_reg_1_0_1_sqmuxa_lut6_2_o5 (
	.I0(row_sel_R[0]),
	.I1(row_sel_R[1]),
	.I2(wr_en_R),
	.I3(col_sel_R_mux_i_m3_lut6_2_O6[0]),
	.I4(col_sel_R_mux_i_m3_lut6_2_O5[0]),
	.O(mat_i_reg_3_0_1_sqmuxa)
);
defparam mat_i_reg_1_0_1_sqmuxa_lut6_2_o5.INIT=32'h10000000;
endmodule