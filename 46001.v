module speed_computation_8d613ce520 (
  clk_1,
  ce_1,
  speed_cnt,
  speed_rpm
);
  input clk_1;
  input ce_1;
  input [31:0] speed_cnt;
  output [31:0] speed_rpm;
  wire clk_1_net;
  wire ce_1_net;
  wire [31:0] constant_op_net_x0;
  wire [37:0] divide_op_net;
  wire [31:0] motor_speed_net;
  wire [31:0] convert_dout_net_x0;
  assign clk_1_net = clk_1;
  assign ce_1_net = ce_1;
  assign motor_speed_net = speed_cnt;
  assign speed_rpm = convert_dout_net_x0;
  sysgen_constant_61a644b4c8  constant_x0 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net_x0)
  );
  xlconvert_ip_pid_controller #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(6),
    .din_width(38),
    .dout_arith(2),
    .dout_bin_pt(16),
    .dout_width(32),
    .latency(1),
    .overflow(`xlSaturate),
    .quantization(`xlTruncate))
  convert (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .din(divide_op_net),
    .dout(convert_dout_net_x0)
  );
  xldivider_generator_c21cb25008addda87fe275acdfb605e1  divide (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .a_tvalid(1'b1),
    .b_tvalid(1'b1),
    .a(constant_op_net_x0),
    .b(motor_speed_net),
    .op(divide_op_net)
  );
endmodule