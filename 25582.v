module channelizer_256_subsystem2 (
  input ready_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output [1-1:0] valid_out,
  output [1-1:0] last_out,
  output [8-1:0] data_out
);
  wire [1-1:0] relational_op_net;
  wire [8-1:0] counter_op_net;
  wire fir_compiler_7_2_1_s_axis_config_tready_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] inverter_op_net;
  wire [8-1:0] constant_op_net;
  wire [1-1:0] constant1_op_net;
  wire [1-1:0] delay_q_net;
  assign valid_out = inverter_op_net;
  assign last_out = relational_op_net;
  assign data_out = counter_op_net;
  assign fir_compiler_7_2_1_s_axis_config_tready_net = ready_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_39c35f37c7 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_constant_b7c50d0aca constant1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant1_op_net)
  );
  channelizer_256_xlcounter_free #(
    .core_name0("channelizer_256_c_counter_binary_v12_0_2"),
    .op_arith(`xlUnsigned),
    .op_width(8)
  )
  counter (
    .clr(1'b0),
    .rst(logical_y_net),
    .en(fir_compiler_7_2_1_s_axis_config_tready_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  sysgen_delay_9d893c921a delay (
    .clr(1'b0),
    .d(constant1_op_net),
    .rst(logical_y_net),
    .en(relational_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_inverter_692c4e9d5f inverter (
    .clr(1'b0),
    .ip(delay_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
  sysgen_relational_004edd55c3 relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(constant_op_net),
    .b(counter_op_net),
    .op(relational_op_net)
  );
endmodule