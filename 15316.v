module __primitive_``name`` #( \
  parameter in0N = `inT``N, \
  parameter in1N = `inT``N, \
  parameter out0N = `outT``N \
)( \
  `input(simple, in0N, 0), \
  `input(simple, in1N, 1), \
  `output(simple, out0N, 0) \
); \
    assign out0 = in0 op in1; \
endmodule