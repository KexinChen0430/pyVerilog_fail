module \$__XILINX_SHIFTX (A, B, Y);
  parameter A_SIGNED = 0;
  parameter B_SIGNED = 0;
  parameter A_WIDTH = 1;
  parameter B_WIDTH = 1;
  parameter Y_WIDTH = 1;
  (* force_downto *)
  input [A_WIDTH-1:0] A;
  (* force_downto *)
  input [B_WIDTH-1:0] B;
  (* force_downto *)
  output [Y_WIDTH-1:0] Y;
  parameter [A_WIDTH-1:0] _TECHMAP_CONSTMSK_A_ = 0;
  parameter [A_WIDTH-1:0] _TECHMAP_CONSTVAL_A_ = 0;
  parameter [B_WIDTH-1:0] _TECHMAP_CONSTMSK_B_ = 0;
  parameter [B_WIDTH-1:0] _TECHMAP_CONSTVAL_B_ = 0;
  function integer A_WIDTH_trimmed;
    input integer start;
  begin
    A_WIDTH_trimmed = start;
    while (A_WIDTH_trimmed > 0 && _TECHMAP_CONSTMSK_A_[A_WIDTH_trimmed-1] && _TECHMAP_CONSTVAL_A_[A_WIDTH_trimmed-1] === 1'bx)
      A_WIDTH_trimmed = A_WIDTH_trimmed - 1;
  end
  endfunction
  generate
    genvar i, j;
    // Bit-blast
    if (Y_WIDTH > 1) begin
      for (i = 0; i < Y_WIDTH; i++)
        \$__XILINX_SHIFTX  #(.A_SIGNED(A_SIGNED), .B_SIGNED(B_SIGNED), .A_WIDTH(A_WIDTH-Y_WIDTH+1), .B_WIDTH(B_WIDTH), .Y_WIDTH(1'd1)) bitblast (.A(A[A_WIDTH-Y_WIDTH+i:i]), .B(B), .Y(Y[i]));
    end
    // If the LSB of B is constant zero (and Y_WIDTH is 1) then
    //   we can optimise by removing every other entry from A
    //   and popping the constant zero from B
    else if (_TECHMAP_CONSTMSK_B_[0] && !_TECHMAP_CONSTVAL_B_[0]) begin
      wire [(A_WIDTH+1)/2-1:0] A_i;
      for (i = 0; i < (A_WIDTH+1)/2; i++)
        assign A_i[i] = A[i*2];
      \$__XILINX_SHIFTX  #(.A_SIGNED(A_SIGNED), .B_SIGNED(B_SIGNED), .A_WIDTH((A_WIDTH+1'd1)/2'd2), .B_WIDTH(B_WIDTH-1'd1), .Y_WIDTH(Y_WIDTH)) _TECHMAP_REPLACE_ (.A(A_i), .B(B[B_WIDTH-1:1]), .Y(Y));
    end
    // Trim off any leading 1'bx -es in A
    else if (_TECHMAP_CONSTMSK_A_[A_WIDTH-1] && _TECHMAP_CONSTVAL_A_[A_WIDTH-1] === 1'bx) begin
      localparam A_WIDTH_new = A_WIDTH_trimmed(A_WIDTH-1);
      \$__XILINX_SHIFTX  #(.A_SIGNED(A_SIGNED), .B_SIGNED(B_SIGNED), .A_WIDTH(A_WIDTH_new), .B_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) _TECHMAP_REPLACE_ (.A(A[A_WIDTH_new-1:0]), .B(B), .Y(Y));
    end
    else if (A_WIDTH < `MIN_MUX_INPUTS) begin
      wire _TECHMAP_FAIL_ = 1;
    end
    else if (A_WIDTH == 2) begin
      MUXF7 fpga_hard_mux (.I0(A[0]), .I1(A[1]), .S(B[0]), .O(Y));
    end
    else if (A_WIDTH <= 4) begin
      wire [4-1:0] Ax;
      if (A_WIDTH == 4)
        assign Ax = A;
      else
        // Rather than extend with 1'bx which gets flattened to 1'b0
        // causing the "don't care" status to get lost, extend with
        // the same driver of F7B.I0 so that we can optimise F7B away
        // later
        assign Ax = {A[1], A};
      \$__XILINX_MUXF78 fpga_hard_mux (.I0(Ax[0]), .I1(Ax[2]), .I2(Ax[1]), .I3(Ax[3]), .S0(B[1]), .S1(B[0]), .O(Y));
    end
    // Note that the following decompositions are 'backwards' in that
    // the LSBs are placed on the hard resources, and the soft resources
    // are used for MSBs.
    // This has the effect of more effectively utilising the hard mux;
    // take for example a 5:1 multiplexer, currently this would map as:
    //     A[0] \___  __                             A[0] \__  __
    //     A[4] /   \|  \       whereas the more     A[1] /  \|  \
    //     A[1] _____|   |      obvious mapping      A[2] \___|   |
    //     A[2] _____|   |--    of MSBs to hard      A[3] /   |   |__
    //     A[3]______|   |      resources would      A[4] ____|   |
    //               |__/       lead to:             1'bx ____|   |
    //                ||                                      |__/
    //                ||                                       ||
    //              B[1:0]                                   B[1:2]
    // Expectation would be that the 'forward' mapping (right) is more
    // area efficient (consider a 9:1 multiplexer using 2x4:1 multiplexers
    // on its I0 and I1 inputs, and A[8] and 1'bx on its I2 and I3 inputs)
    // but that the 'backwards' mapping (left) is more delay efficient
    // since smaller LUTs are faster than wider ones.
    else if (A_WIDTH <= 8) begin
      wire [8-1:0] Ax = {{{8-A_WIDTH}{1'bx}}, A};
      wire T0 = B[2] ? Ax[4] : Ax[0];
      wire T1 = B[2] ? Ax[5] : Ax[1];
      wire T2 = B[2] ? Ax[6] : Ax[2];
      wire T3 = B[2] ? Ax[7] : Ax[3];
      \$__XILINX_MUXF78 fpga_hard_mux (.I0(T0), .I1(T2), .I2(T1), .I3(T3), .S0(B[1]), .S1(B[0]), .O(Y));
    end
    else if (A_WIDTH <= 16) begin
      wire [16-1:0] Ax = {{{16-A_WIDTH}{1'bx}}, A};
      wire T0 = B[2] ? B[3] ? Ax[12] : Ax[4]
                     : B[3] ? Ax[ 8] : Ax[0];
      wire T1 = B[2] ? B[3] ? Ax[13] : Ax[5]
                     : B[3] ? Ax[ 9] : Ax[1];
      wire T2 = B[2] ? B[3] ? Ax[14] : Ax[6]
                     : B[3] ? Ax[10] : Ax[2];
      wire T3 = B[2] ? B[3] ? Ax[15] : Ax[7]
                     : B[3] ? Ax[11] : Ax[3];
      \$__XILINX_MUXF78 fpga_hard_mux (.I0(T0), .I1(T2), .I2(T1), .I3(T3), .S0(B[1]), .S1(B[0]), .O(Y));
    end
    else begin
      localparam num_mux16 = (A_WIDTH+15) / 16;
      localparam clog2_num_mux16 = $clog2(num_mux16);
      wire [num_mux16-1:0] T;
      wire [num_mux16*16-1:0] Ax = {{(num_mux16*16-A_WIDTH){1'bx}}, A};
      for (i = 0; i < num_mux16; i++)
        \$__XILINX_SHIFTX  #(
          .A_SIGNED(A_SIGNED),
          .B_SIGNED(B_SIGNED),
          .A_WIDTH(16),
          .B_WIDTH(4),
          .Y_WIDTH(Y_WIDTH)
        ) fpga_mux (
          .A(Ax[i*16+:16]),
          .B(B[3:0]),
          .Y(T[i])
        );
      \$__XILINX_SHIFTX  #(
          .A_SIGNED(A_SIGNED),
          .B_SIGNED(B_SIGNED),
          .A_WIDTH(num_mux16),
          .B_WIDTH(clog2_num_mux16),
          .Y_WIDTH(Y_WIDTH)
      ) _TECHMAP_REPLACE_ (
          .A(T),
          .B(B[B_WIDTH-1-:clog2_num_mux16]),
          .Y(Y));
    end
  endgenerate
endmodule