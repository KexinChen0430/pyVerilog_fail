module \$shiftx (A, B, Y);
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
  parameter [B_WIDTH-1:0] _TECHMAP_CONSTMSK_B_ = 0;
  parameter [B_WIDTH-1:0] _TECHMAP_CONSTVAL_B_ = 0;
  generate
    if (B_SIGNED) begin
      if (_TECHMAP_CONSTMSK_B_[B_WIDTH-1] && (_TECHMAP_CONSTVAL_B_[B_WIDTH-1] == 1'b0 || _TECHMAP_CONSTVAL_B_[B_WIDTH-1] === 1'bx))
        // Optimisation to remove B_SIGNED if sign bit of B is constant-0
        \$shiftx #(
          .A_SIGNED(A_SIGNED),
          .B_SIGNED(0),
          .A_WIDTH(A_WIDTH),
          .B_WIDTH(B_WIDTH-1'd1),
          .Y_WIDTH(Y_WIDTH)
        ) _TECHMAP_REPLACE_ (
          .A(A), .B(B[B_WIDTH-2:0]), .Y(Y)
        );
      else
        wire _TECHMAP_FAIL_ = 1;
    end
    else begin
      if (((A_WIDTH + Y_WIDTH - 1) / Y_WIDTH) < `MIN_MUX_INPUTS)
        wire _TECHMAP_FAIL_ = 1;
      else
        \$__XILINX_SHIFTX #(
          .A_SIGNED(A_SIGNED),
          .B_SIGNED(B_SIGNED),
          .A_WIDTH(A_WIDTH),
          .B_WIDTH(B_WIDTH),
          .Y_WIDTH(Y_WIDTH)
        ) _TECHMAP_REPLACE_ (
          .A(A), .B(B), .Y(Y)
        );
    end
  endgenerate
endmodule