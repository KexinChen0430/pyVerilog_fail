module edge_detection_69f9d322be (
  clk_1,
  ce_1,
  in1,
  out1
);
  input clk_1;
  input ce_1;
  input in1;
  output out1;
  wire clk_1_net;
  wire ce_1_net;
  wire [7:0] constant_op_net;
  wire [7:0] counter_op_net;
  wire delay_q_net;
  wire inverter_op_net;
  wire logical_y_net;
  wire register_q_net;
  wire register1_q_net;
  wire relational_op_net;
  wire new_motor_speed_net;
  wire logical1_y_net;
  assign clk_1_net = clk_1;
  assign ce_1_net = ce_1;
  assign new_motor_speed_net = in1;
  assign out1 = logical1_y_net;
  sysgen_constant_383443dd88  constant_x0 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  xlcounter_limit_ip_pid_controller #(
    .cnt_15_0(99),
    .cnt_31_16(0),
    .cnt_47_32(0),
    .cnt_63_48(0),
    .core_name0("ip_pid_controller_c_counter_binary_v12_0_0"),
    .count_limited(1),
    .op_arith(`xlUnsigned),
    .op_width(8))
  counter (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .rst(1'b0),
    .clr(1'b0),
    .en(delay_q_net),
    .op(counter_op_net)
  );
  xldelay_ip_pid_controller #(
    .latency(25),
    .reg_retiming(0),
    .reset(0),
    .width(1))
  delay (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .en(1'b1),
    .rst(1'b1),
    .d(logical_y_net),
    .q(delay_q_net)
  );
  sysgen_inverter_91fd45ca5a  inverter (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .ip(register1_q_net),
    .op(inverter_op_net)
  );
  sysgen_logical_098c9fa070  logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(register_q_net),
    .d1(inverter_op_net),
    .y(logical_y_net)
  );
  sysgen_logical_098c9fa070  logical1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(delay_q_net),
    .d1(relational_op_net),
    .y(logical1_y_net)
  );
  xlregister_ip_pid_controller #(
    .d_width(1),
    .init_value(1'b0))
  register_x0 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .en(1'b1),
    .rst(1'b0),
    .d(new_motor_speed_net),
    .q(register_q_net)
  );
  xlregister_ip_pid_controller #(
    .d_width(1),
    .init_value(1'b0))
  register1 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .en(1'b1),
    .rst(1'b0),
    .d(new_motor_speed_net),
    .q(register1_q_net)
  );
  sysgen_relational_0c5dbda85b  relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(constant_op_net),
    .b(counter_op_net),
    .op(relational_op_net)
  );
endmodule