module __primitive_read_array #(
  parameter in0AN = `addrN,
  parameter in0DN = `intN,
  parameter in1N = `intN,
  parameter out1N = `intN,
  parameter out0AN = `addrN,
  parameter out0DN = `intN
)(
  `sync_ports,
  `input(Array, (in0AN, in0DN), 0),
  `input(simple, in1N, 1),
  `output(Array, (out0AN, out0DN), 0),
  `output(simple, out1N, 1)
);
    reg pending;
    wire buf_ready;
    // three-way setup:
    //   1. <- ready
    //   2. -> valid (active)
    //   3. <- addr, we, di (success)
    wire active = in_valid & buf_ready & !pending & nrst;
    wire success = active & in0_valid;
    assign in0_addr = success ? in1 : out0_addr;
    assign in0_we = !success & out0_we;
    assign in0_di = out0_di;
    assign out0 = in0;
    assign in0_ready = active | out0_ready;
    assign out0_valid = !active & in0_valid;
    assign in_ready = active & in0_valid;
    transparent_buffer #(.N(out1N))
      buffer(.clk(clk),
             .nrst(nrst),
             .in0(in0),
             .in0_valid(in0_valid & !pending),
             .in0_ready(buf_ready),
             .out0(out1),
             .out0_valid(out_valid),
             .out0_ready(out_ready));
    always @(posedge clk) begin
        if(!nrst) `reset(pending);
        else if(in_ready) pending <= out0_ready;
    end
endmodule