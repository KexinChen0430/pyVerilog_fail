module __primitive_write_array #(
  parameter in0AN = `addrN,
  parameter in0DN = `intN,
  parameter in1N = `intN,
  parameter in2N = `intN,
  parameter out0AN = `addrN,
  parameter out0DN = `intN
)(
  `sync_ports,
  `input(Array, (in0AN, in0DN), 0),
  `input(simple, in1N, 1),
  `input(simple, in2N, 2),
  `output(Array, (out0AN, out0DN), 0)
);
    reg pending;
    // three-way setup:
    //   1. <- ready
    //   2. -> valid (active)
    //   3. <- addr, we, di (success)
    wire active = in_valid & !pending & nrst;
    wire success = active & in0_valid;
    assign in0_addr = success ? in1 : out0_addr;
    assign in0_we = success | out0_we;
    assign in0_di = success ? in2 : out0_di;
    assign out0 = in0;
    assign out_valid = `true;
    assign in0_ready = active | out0_ready;
    assign out0_valid = !active & in0_valid;
    assign in_ready = active & in0_valid;
    always @(posedge clk) begin
        if(!nrst) `reset(pending);
        else if(in_ready) pending <= out0_ready;
    end
endmodule