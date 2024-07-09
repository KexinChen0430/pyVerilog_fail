module pid_controller_dfc330003e (
  clk_1,
  ce_1,
  en_acc,
  rst_acc,
  kd,
  ki,
  kp,
  err,
  pwm
);
  input clk_1;
  input ce_1;
  input en_acc;
  input rst_acc;
  input [31:0] kd;
  input [31:0] ki;
  input [31:0] kp;
  input [31:0] err;
  output [31:0] pwm;
  wire clk_1_net;
  wire ce_1_net;
  wire [31:0] addsub1_s_net;
  wire [31:0] addsub2_s_net;
  wire [31:0] delay_q_net_x0;
  wire [31:0] delay1_q_net;
  wire [31:0] mult_p_net;
  wire [31:0] mult1_p_net;
  wire [31:0] mult2_p_net;
  wire logical1_y_net;
  wire rst_net;
  wire [31:0] kd_net;
  wire [31:0] ki_net;
  wire [31:0] kp_net;
  wire [31:0] addsub_s_net;
  wire [31:0] addsub3_s_net;
  wire [31:0] accumulator_q_net;
  assign clk_1_net = clk_1;
  assign ce_1_net = ce_1;
  assign logical1_y_net = en_acc;
  assign rst_net = rst_acc;
  assign kd_net = kd;
  assign ki_net = ki;
  assign kp_net = kp;
  assign addsub_s_net = err;
  assign pwm = addsub3_s_net;
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
  addsub1 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .a(addsub_s_net),
    .b(delay1_q_net),
    .s(addsub1_s_net)
  );
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
    .core_name0("ip_pid_controller_c_addsub_v12_0_1"),
    .extra_registers(0),
    .full_s_arith(2),
    .full_s_width(33),
    .latency(0),
    .overflow(1),
    .quantization(1),
    .s_arith(`xlSigned),
    .s_bin_pt(16),
    .s_width(32))
  addsub2 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .a(mult1_p_net),
    .b(mult2_p_net),
    .s(addsub2_s_net)
  );
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
    .core_name0("ip_pid_controller_c_addsub_v12_0_1"),
    .extra_registers(0),
    .full_s_arith(2),
    .full_s_width(33),
    .latency(0),
    .overflow(1),
    .quantization(1),
    .s_arith(`xlSigned),
    .s_bin_pt(16),
    .s_width(32))
  addsub3 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .en(1'b1),
    .a(accumulator_q_net),
    .b(addsub2_s_net),
    .s(addsub3_s_net)
  );
  xldelay_ip_pid_controller #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32))
  delay (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .rst(1'b1),
    .d(addsub_s_net),
    .en(logical1_y_net),
    .q(delay_q_net_x0)
  );
  xldelay_ip_pid_controller #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32))
  delay1 (
    .ce(ce_1_net),
    .clk(clk_1_net),
    .rst(1'b1),
    .d(delay_q_net_x0),
    .en(logical1_y_net),
    .q(delay1_q_net)
  );
  xlmult_ip_pid_controller #(
    .a_arith(`xlSigned),
    .a_bin_pt(16),
    .a_width(32),
    .b_arith(`xlSigned),
    .b_bin_pt(16),
    .b_width(32),
    .c_a_type(0),
    .c_a_width(32),
    .c_b_type(0),
    .c_b_width(32),
    .c_baat(32),
    .c_output_width(64),
    .c_type(0),
    .core_name0("ip_pid_controller_mult_gen_v12_0_0"),
    .extra_registers(1),
    .multsign(2),
    .overflow(2),
    .p_arith(`xlSigned),
    .p_bin_pt(16),
    .p_width(32),
    .quantization(1))
  mult (
    .core_ce(ce_1_net),
    .core_clk(clk_1_net),
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(addsub_s_net),
    .b(ki_net),
    .p(mult_p_net)
  );
  xlmult_ip_pid_controller #(
    .a_arith(`xlSigned),
    .a_bin_pt(16),
    .a_width(32),
    .b_arith(`xlSigned),
    .b_bin_pt(16),
    .b_width(32),
    .c_a_type(0),
    .c_a_width(32),
    .c_b_type(0),
    .c_b_width(32),
    .c_baat(32),
    .c_output_width(64),
    .c_type(0),
    .core_name0("ip_pid_controller_mult_gen_v12_0_0"),
    .extra_registers(1),
    .multsign(2),
    .overflow(2),
    .p_arith(`xlSigned),
    .p_bin_pt(16),
    .p_width(32),
    .quantization(1))
  mult1 (
    .core_ce(ce_1_net),
    .core_clk(clk_1_net),
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(addsub_s_net),
    .b(kp_net),
    .p(mult1_p_net)
  );
  xlmult_ip_pid_controller #(
    .a_arith(`xlSigned),
    .a_bin_pt(16),
    .a_width(32),
    .b_arith(`xlSigned),
    .b_bin_pt(16),
    .b_width(32),
    .c_a_type(0),
    .c_a_width(32),
    .c_b_type(0),
    .c_b_width(32),
    .c_baat(32),
    .c_output_width(64),
    .c_type(0),
    .core_name0("ip_pid_controller_mult_gen_v12_0_0"),
    .extra_registers(1),
    .multsign(2),
    .overflow(2),
    .p_arith(`xlSigned),
    .p_bin_pt(16),
    .p_width(32),
    .quantization(1))
  mult2 (
    .core_ce(ce_1_net),
    .core_clk(clk_1_net),
    .ce(ce_1_net),
    .clk(clk_1_net),
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(addsub1_s_net),
    .b(kd_net),
    .p(mult2_p_net)
  );
  accumulator_0c8f1c90b9 accumulator (
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .rst(rst_net),
    .en(logical1_y_net),
    .err(mult_p_net),
    .pwm(accumulator_q_net)
  );
endmodule