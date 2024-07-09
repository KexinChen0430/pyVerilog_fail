module ip_pid_controller_struct (
  clk_1,
  ce_1,
  rst,
  ref_speed,
  new_motor_speed,
  motor_speed,
  kp,
  ki,
  kd,
  err,
  pwm,
  speed
);
  input clk_1;
  input ce_1;
  input rst;
  input [31:0] ref_speed;
  input new_motor_speed;
  input [31:0] motor_speed;
  input [31:0] kp;
  input [31:0] ki;
  input [31:0] kd;
  output [31:0] err;
  output [31:0] pwm;
  output [31:0] speed;
  wire clk_1_net;
  wire ce_1_net;
  wire [31:0] addsub_s_net;
  wire [31:0] convert_dout_net;
  wire [31:0] convert1_dout_net;
  wire [31:0] convert2_dout_net;
  wire [31:0] mcode_z_net;
  wire rst_net;
  wire [31:0] ref_speed_net;
  wire new_motor_speed_net;
  wire [31:0] motor_speed_net;
  wire [31:0] kp_net;
  wire [31:0] ki_net;
  wire [31:0] kd_net;
  wire [31:0] err_net;
  wire [31:0] pwm_net;
  wire [31:0] speed_net;
  wire logical1_y_net;
  wire [31:0] addsub3_s_net;
  wire [31:0] convert_dout_net_x0;
  assign clk_1_net = clk_1;
  assign ce_1_net = ce_1;
  assign rst_net = rst;
  assign ref_speed_net = ref_speed;
  assign new_motor_speed_net = new_motor_speed;
  assign motor_speed_net = motor_speed;
  assign kp_net = kp;
  assign ki_net = ki;
  assign kd_net = kd;
  assign err = err_net;
  assign pwm = pwm_net;
  assign speed = speed_net;
  assign err_net = convert_dout_net;
  assign pwm_net = convert1_dout_net;
  assign speed_net = convert_dout_net_x0;
  xladdsub_ip_pid_controller #(
    .a_arith(`xlSigned),
    .a_bin_pt(16),
    .a_width(32),
    .b_arith(`xlSigned),
    .b_bin_pt(16),
    .b_width(32),
    .c_has_c_out(0),
    .c_latency(0),
    .c_output_width(33),
    .core_name0("ip_pid_controller_c_addsub_v12_0_0"),
    .extra_registers(0),
    .full_s_arith(2),
    .full_s_width(33),
    .latency(0),
    .overflow(1),
    .quantization(1),
    .s_arith(`xlSigned),
    .s_bin_pt(16),
    .s_width(32))
  addsub (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .a(convert2_dout_net),
    .b(convert_dout_net_x0),
    .s(addsub_s_net)
  );
  xlconvert_ip_pid_controller #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(16),
    .din_width(32),
    .dout_arith(2),
    .dout_bin_pt(0),
    .dout_width(32),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlTruncate))
  convert (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .din(addsub_s_net),
    .dout(convert_dout_net)
  );
  xlconvert_ip_pid_controller #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(16),
    .din_width(32),
    .dout_arith(2),
    .dout_bin_pt(0),
    .dout_width(32),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlTruncate))
  convert1 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .din(mcode_z_net),
    .dout(convert1_dout_net)
  );
  xlconvert_ip_pid_controller #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(0),
    .din_width(32),
    .dout_arith(2),
    .dout_bin_pt(16),
    .dout_width(32),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlTruncate))
  convert2 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .din(ref_speed_net),
    .dout(convert2_dout_net)
  );
  sysgen_mcode_block_698c2b186c  mcode (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .x(addsub3_s_net),
    .z(mcode_z_net)
  );
  edge_detection_69f9d322be edge_detection (
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .in1(new_motor_speed_net),
    .out1(logical1_y_net)
  );
  pid_controller_dfc330003e pid_controller (
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .en_acc(logical1_y_net),
    .rst_acc(rst_net),
    .kd(kd_net),
    .ki(ki_net),
    .kp(kp_net),
    .err(addsub_s_net),
    .pwm(addsub3_s_net)
  );
  speed_computation_8d613ce520 speed_computation (
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .speed_cnt(motor_speed_net),
    .speed_rpm(convert_dout_net_x0)
  );
endmodule