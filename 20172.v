module SRL16 (
  output Q,
  input A0, A1, A2, A3,
  (* clkbuf_sink *)
  input CLK,
  input D
);
  parameter [15:0] INIT = 16'h0000;
  reg [15:0] r = INIT;
  assign Q = r[{A3,A2,A1,A0}];
  always @(posedge CLK) r <= { r[14:0], D };
  specify
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L905
    (posedge CLK => (Q : 1'bx)) = 1472;
    // Max delay from: https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLM_R.sdf#L912
    $setup(D , posedge CLK, 173);
    (A0 => Q) = 631;
    (A1 => Q) = 472;
    (A2 => Q) = 407;
    (A3 => Q) = 238;
  endspecify
endmodule