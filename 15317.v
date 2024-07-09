module __primitive_ap01 #(
  parameter in0N = `intN,
  parameter out1N = `intN,
  parameter out0N = 0
)(
  `sync_ports,
  `input(stream, in0N, 0),
  `output(stream, out0N, 0),
  `output(simple, out1N, 1)
);
    assign out0 = in0 >> out1N;
    assign out1 = in0;
    assign out0_valid = in0_valid;
    assign out_valid = in0_valid && `valid(out1);
    assign in0_ready = out0_ready & out_ready;
    assign in_ready = `true;
endmodule