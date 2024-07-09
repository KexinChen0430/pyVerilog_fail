module SRLC32E (
  output Q,
  output Q31,
  input [4:0] A,
  input CE,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_CLK_INVERTED" *)
  input CLK,
  input D
);
  parameter [31:0] INIT = 32'h00000000;
  parameter [0:0] IS_CLK_INVERTED = 1'b0;
  reg [31:0] r = INIT;
  assign Q31 = r[31];
  assign Q = r[A];
  generate
    if (IS_CLK_INVERTED) begin
      always @(negedge CLK) if (CE) r <= { r[30:0], D };
    end
    else
      always @(posedge CLK) if (CE) r <= { r[30:0], D };
  endgenerate
  specify
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L912
    $setup(D , posedge CLK &&& !IS_CLK_INVERTED, 173);
    $setup(D , negedge CLK &&&  IS_CLK_INVERTED, 173);
    // https://github.com/SymbiFlow/prjxray-db/blob/23c8b0851f979f0799318eaca90174413a46b257/artix7/timings/slicel.sdf#L248
    $setup(CE, posedge CLK &&& !IS_CLK_INVERTED, 109);
    $setup(CE, negedge CLK &&&  IS_CLK_INVERTED, 109);
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L905
    if (!IS_CLK_INVERTED && CE) (posedge CLK => (Q : 1'bx)) = 1472;
    if ( IS_CLK_INVERTED && CE) (negedge CLK => (Q : 1'bx)) = 1472;
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L904
    if (!IS_CLK_INVERTED && CE) (posedge CLK => (Q31 : 1'bx)) = 1114;
    if ( IS_CLK_INVERTED && CE) (negedge CLK => (Q31 : 1'bx)) = 1114;
    (A[0] => Q) = 642;
    (A[1] => Q) = 631;
    (A[2] => Q) = 472;
    (A[3] => Q) = 407;
    (A[4] => Q) = 238;
  endspecify
endmodule