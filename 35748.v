module channelizer_512_subsystem3 (
  input ready,
  input [1-1:0] reset_in,
  input [1-1:0] valid,
  input clk_1,
  input ce_1,
  output [1-1:0] last_out
);
  wire [1-1:0] relational_op_net;
  wire fir_compiler_7_2_1_s_axis_data_tready_net;
  wire [1-1:0] logical_y_net_x0;
  wire [1-1:0] valid_in_net;
  wire clk_net;
  wire ce_net;
  wire [9-1:0] constant_op_net;
  wire [9-1:0] counter_op_net;
  wire [1-1:0] logical_y_net;
  assign last_out = relational_op_net;
  assign fir_compiler_7_2_1_s_axis_data_tready_net = ready;
  assign logical_y_net_x0 = reset_in;
  assign valid_in_net = valid;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_9243789fee constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  channelizer_512_xlcounter_free #(
    .core_name0("channelizer_512_c_counter_binary_v12_0_2"),
    .op_arith(`xlUnsigned),
    .op_width(9)
  )
  counter (
    .clr(1'b0),
    .rst(logical_y_net_x0),
    .en(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  sysgen_logical_a89dba00a2 logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(fir_compiler_7_2_1_s_axis_data_tready_net),
    .d1(valid_in_net),
    .y(logical_y_net)
  );
  sysgen_relational_9415812ce4 relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(constant_op_net),
    .b(counter_op_net),
    .op(relational_op_net)
  );
endmodule