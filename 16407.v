module BUFMR (
  O,
  I
);
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
    reg notifier;
`endif
  output O;
  input I;
  buf B1 (O, I);
  specify
  ( I => O) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
  $period (posedge I, 0:0:0, notifier);
`endif
  specparam PATHPULSE$ = 0;
  endspecify
endmodule