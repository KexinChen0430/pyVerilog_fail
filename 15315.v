module __primitive_``name`` #( \
  parameter in0N = `inT``N, \
  parameter out0N = `outT``N \
)( \
  `input(simple, in0N, 0), \
  `output(simple, out0N, 0) \
); \
    assign out0 = op in0; \
endmodule