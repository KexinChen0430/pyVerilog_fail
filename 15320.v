module __primitive_pushr1 #(
  parameter in0N = `intN,
  parameter in1N = `intN,
  parameter out0N = `intN
)(
  `sync_ports,
  `input(stream, in0N, 0),
  `input(simple, in1N, 1),
  `output(stream, out0N, 0)
);
    assign out0 = { in0, in1 };
    assign out0_valid = in_valid & in0_valid;
    assign in0_ready = out0_ready;
    assign in_ready = in_valid & out0_ready;
    assign out_valid = `true;
endmodule