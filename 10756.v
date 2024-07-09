module \$__XILINX_SHREG_ (input C, input D, input [31:0] L, input E, output Q, output SO);
  parameter DEPTH = 0;
  parameter [DEPTH-1:0] INIT = 0;
  parameter CLKPOL = 1;
  parameter ENPOL = 2;
  // shregmap's INIT parameter shifts out LSB first;
  // however Xilinx expects MSB first
  function [DEPTH-1:0] brev;
    input [DEPTH-1:0] din;
    integer i;
    begin
      for (i = 0; i < DEPTH; i=i+1)
        brev[i] = din[DEPTH-1-i];
    end
  endfunction
  localparam [DEPTH-1:0] INIT_R = brev(INIT);
  parameter _TECHMAP_CONSTMSK_L_ = 0;
  wire CE;
  generate
    if (ENPOL == 0)
      assign CE = ~E;
    else if (ENPOL == 1)
      assign CE = E;
    else
      assign CE = 1'b1;
    if (DEPTH == 1) begin
      if (CLKPOL)
          FDRE #(.INIT(INIT_R)) _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .CE(CE), .R(1'b0));
      else
          FDRE_1 #(.INIT(INIT_R)) _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .CE(CE), .R(1'b0));
    end else
    if (DEPTH <= 16) begin
      SRL16E #(.INIT(INIT_R), .IS_CLK_INVERTED(~CLKPOL[0])) _TECHMAP_REPLACE_ (.A0(L[0]), .A1(L[1]), .A2(L[2]), .A3(L[3]), .CE(CE), .CLK(C), .D(D), .Q(Q));
    end else
    if (DEPTH > 17 && DEPTH <= 32) begin
      SRLC32E #(.INIT(INIT_R), .IS_CLK_INVERTED(~CLKPOL[0])) _TECHMAP_REPLACE_ (.A(L[4:0]), .CE(CE), .CLK(C), .D(D), .Q(Q));
    end else
    if (DEPTH > 33 && DEPTH <= 64) begin
      wire T0, T1, T2;
      SRLC32E #(.INIT(INIT_R[32-1:0]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_0 (.A(L[4:0]), .CE(CE), .CLK(C), .D(D), .Q(T0), .Q31(T1));
      \$__XILINX_SHREG_ #(.DEPTH(DEPTH-32), .INIT(INIT[DEPTH-32-1:0]), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl_1 (.C(C), .D(T1), .L(L), .E(E), .Q(T2));
      if (&_TECHMAP_CONSTMSK_L_)
        assign Q = T2;
      else
        MUXF7 fpga_mux_0 (.O(Q), .I0(T0), .I1(T2), .S(L[5]));
    end else
    if (DEPTH > 65 && DEPTH <= 96) begin
      wire T0, T1, T2, T3, T4, T5, T6;
      SRLC32E #(.INIT(INIT_R[32-1: 0]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_0 (.A(L[4:0]), .CE(CE), .CLK(C), .D( D), .Q(T0), .Q31(T1));
      SRLC32E #(.INIT(INIT_R[64-1:32]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_1 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T1), .Q(T2), .Q31(T3));
      \$__XILINX_SHREG_ #(.DEPTH(DEPTH-64), .INIT(INIT[DEPTH-64-1:0]), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl_2 (.C(C), .D(T3), .L(L[4:0]), .E(E), .Q(T4));
      if (&_TECHMAP_CONSTMSK_L_)
        assign Q = T4;
      else
        \$__XILINX_MUXF78 fpga_hard_mux (.I0(T0), .I1(T2), .I2(T4), .I3(1'bx), .S0(L[5]), .S1(L[6]), .O(Q));
    end else
    if (DEPTH > 97 && DEPTH < 128) begin
      wire T0, T1, T2, T3, T4, T5, T6, T7, T8;
      SRLC32E #(.INIT(INIT_R[32-1: 0]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_0 (.A(L[4:0]), .CE(CE), .CLK(C), .D( D), .Q(T0), .Q31(T1));
      SRLC32E #(.INIT(INIT_R[64-1:32]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_1 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T1), .Q(T2), .Q31(T3));
      SRLC32E #(.INIT(INIT_R[96-1:64]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_2 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T3), .Q(T4), .Q31(T5));
      \$__XILINX_SHREG_ #(.DEPTH(DEPTH-96), .INIT(INIT[DEPTH-96-1:0]), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl_3 (.C(C), .D(T5), .L(L[4:0]), .E(E), .Q(T6));
      if (&_TECHMAP_CONSTMSK_L_)
        assign Q = T6;
      else
        \$__XILINX_MUXF78 fpga_hard_mux (.I0(T0), .I1(T2), .I2(T4), .I3(T6), .S0(L[5]), .S1(L[6]), .O(Q));
    end
    else if (DEPTH == 128) begin
      wire T0, T1, T2, T3, T4, T5, T6;
      SRLC32E #(.INIT(INIT_R[ 32-1: 0]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_0 (.A(L[4:0]), .CE(CE), .CLK(C), .D( D), .Q(T0), .Q31(T1));
      SRLC32E #(.INIT(INIT_R[ 64-1:32]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_1 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T1), .Q(T2), .Q31(T3));
      SRLC32E #(.INIT(INIT_R[ 96-1:64]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_2 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T3), .Q(T4), .Q31(T5));
      SRLC32E #(.INIT(INIT_R[128-1:96]), .IS_CLK_INVERTED(~CLKPOL[0])) fpga_srl_3 (.A(L[4:0]), .CE(CE), .CLK(C), .D(T5), .Q(T6), .Q31(SO));
      if (&_TECHMAP_CONSTMSK_L_)
        assign Q = T6;
      else
        \$__XILINX_MUXF78 fpga_hard_mux (.I0(T0), .I1(T2), .I2(T4), .I3(T6), .S0(L[5]), .S1(L[6]), .O(Q));
    end
    // For fixed length, if just 1 over a convenient value, decompose
    else if (DEPTH <= 129 && &_TECHMAP_CONSTMSK_L_) begin
      wire T;
      \$__XILINX_SHREG_ #(.DEPTH(DEPTH-1), .INIT(INIT[DEPTH-1:1]), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl      (.C(C), .D(D), .L({32{1'b1}}), .E(E), .Q(T));
      \$__XILINX_SHREG_ #(.DEPTH(1),       .INIT(INIT[0]),         .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl_last (.C(C), .D(T), .L(L), .E(E), .Q(Q));
    end
    // For variable length, if just 1 over a convenient value, then bump up one more
    else if (DEPTH < 129 && ~&_TECHMAP_CONSTMSK_L_)
      \$__XILINX_SHREG_ #(.DEPTH(DEPTH+1), .INIT({INIT,1'b0}), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) _TECHMAP_REPLACE_ (.C(C), .D(D), .L(L), .E(E), .Q(Q));
    else begin
      localparam depth0 = 128;
      localparam num_srl128 = DEPTH / depth0;
      localparam depthN = DEPTH % depth0;
      wire [num_srl128 + (depthN > 0 ? 1 : 0) - 1:0] T;
      wire [num_srl128 + (depthN > 0 ? 1 : 0) :0] S;
      assign S[0] = D;
      genvar i;
      for (i = 0; i < num_srl128; i++)
        \$__XILINX_SHREG_ #(.DEPTH(depth0), .INIT(INIT[DEPTH-1-i*depth0-:depth0]), .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl      (.C(C), .D(S[i]),          .L(L[$clog2(depth0)-1:0]), .E(E), .Q(T[i]), .SO(S[i+1]));
      if (depthN > 0)
        \$__XILINX_SHREG_ #(.DEPTH(depthN), .INIT(INIT[depthN-1:0]),               .CLKPOL(CLKPOL), .ENPOL(ENPOL)) fpga_srl_last (.C(C), .D(S[num_srl128]), .L(L[$clog2(depth0)-1:0]), .E(E), .Q(T[num_srl128]));
      if (&_TECHMAP_CONSTMSK_L_)
        assign Q = T[num_srl128 + (depthN > 0 ? 1 : 0) - 1];
      else
        assign Q = T[L[DEPTH-1:$clog2(depth0)]];
    end
  endgenerate
endmodule