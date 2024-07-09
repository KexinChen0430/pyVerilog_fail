module __primitive_ap20 #(
  parameter in0N = `intN,
  parameter in1N = `intN,
  parameter in2N = `intN,
  parameter out0N = in0N + in1N + in2N
)(
  `sync_ports,
  `input(simple, in0N, 0),
  `input(simple, in1N, 1),
  `input(stream, in2N, 2),
  `output(stream, out0N, 0)
);
    assign out0 = { in0, in1, in2 };
    assign out0_valid = in_valid & in2_valid;
    assign in2_ready = out0_ready;
    assign in_ready = in_valid & out0_ready;
    assign out_valid = `true;
endmodule