module execute_block ( IMM_i, A_i, rB_i, rC_i, MUXED_B_i, S_MUX_ALUIN_i,
        FW_X_i, FW_W_i, S_FW_A_i, S_FW_B_i, muxed_dest, muxed_B, S_MUX_DEST_i,
    .OP({\OP[4] , \OP[3] , \OP[2] , \OP[1] , \OP[0] }), ALUW_i, DOUT, stall_o,
        Clock, Reset );
  input [31:0] IMM_i;
  input [31:0] A_i;
  input [4:0] rB_i;
  input [4:0] rC_i;
  input [31:0] MUXED_B_i;
  input [31:0] FW_X_i;
  input [31:0] FW_W_i;
  input [1:0] S_FW_A_i;
  input [1:0] S_FW_B_i;
  output [4:0] muxed_dest;
  output [31:0] muxed_B;
  input [1:0] S_MUX_DEST_i;
  input [12:0] ALUW_i;
  output [31:0] DOUT;
  input S_MUX_ALUIN_i, \OP[4] , \OP[3] , \OP[2] , \OP[1] , \OP[0] , Clock,
         Reset;
  output stall_o;
  wire   n5, n3;
  wire   [31:0] FWB2alu;
  wire   [31:0] FWA2alu;
  mux21_3 ALUIN_MUX ( .IN0({muxed_B[31:1], n5}), .IN1(IMM_i), .CTRL(
        S_MUX_ALUIN_i), .OUT1({FWB2alu[31:22], n3, FWB2alu[20:0]}) );
  real_alu_DATA_SIZE32 ALU ( .IN1(FWA2alu), .IN2({FWB2alu[31:22], n3,
        FWB2alu[20:0]}), .ALUW_i(ALUW_i), .DOUT(DOUT), .stall_o(stall_o),
        .Clock(Clock), .Reset(Reset) );
  mux41_MUX_SIZE5 MUXDEST ( .IN0({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .IN1(rC_i),
        .IN2(rB_i), .IN3({1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .CTRL(S_MUX_DEST_i),
        .OUT1(muxed_dest) );
  mux41_MUX_SIZE32_2 MUX_FWA ( .IN0(A_i), .IN1(FW_X_i), .IN2(FW_W_i), .IN3({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CTRL(S_FW_A_i),
        .OUT1(FWA2alu) );
  mux41_MUX_SIZE32_1 MUX_FWB ( .IN0(MUXED_B_i), .IN1(FW_X_i), .IN2(FW_W_i),
        .IN3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CTRL(S_FW_B_i), .OUT1({muxed_B[31:1], n5}) );
  CLKBUF_X1 U5 ( .A(n5), .Z(muxed_B[0]) );
endmodule