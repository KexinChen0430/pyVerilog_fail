module tb();
reg [15:0] menc_raw;
reg [15:0] stator_offset;
wire [47:0] current_targets;
wire [15:0] a_tgt = current_targets[15:0];
wire [15:0] b_tgt = current_targets[31:16];
wire [15:0] c_tgt = current_targets[47:32];
reg [31:0] amps_float;
wire c;
sim_clk #(125) clk_125(c);
commutator dut(.*);
initial begin
  $dumpfile("commutator.lxt");
  $dumpvars();
  menc_raw = 16'd0;
  stator_offset = 16'h0;
  wait(~c);
  wait(c);
  wait(~c);
  wait(c);
  menc_raw = 16'd300;
  amps_float = 32'h3f800000;
  #200;
  $finish();
end
endmodule