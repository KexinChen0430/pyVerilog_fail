module channelizer_512_frame_reverse (
  input ready_out,
  input valid_in,
  input [32-1:0] data_in,
  input last_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output [1-1:0] valid_out,
  output [32-1:0] data_out,
  output [1-1:0] last_out
);
  wire ce_net;
  wire [1-1:0] constant1_op_net;
  wire [1-1:0] logical_y_net_x0;
  wire [32-1:0] dual_port_ram_doutb_net;
  wire [1-1:0] delay1_q_net;
  wire ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  wire fir_compiler_7_2_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire fir_compiler_7_2_1_m_axis_data_tlast_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire [32-1:0] constant_op_net;
  wire [1-1:0] constant2_op_net;
  wire [10-1:0] counter_op_net;
  wire [1-1:0] logical1_y_net;
  wire [10-1:0] counter2_op_net;
  wire [1-1:0] delay_q_net;
  wire [32-1:0] dual_port_ram_douta_net;
  assign valid_out = logical_y_net_x0;
  assign data_out = dual_port_ram_doutb_net;
  assign last_out = delay1_q_net;
  assign ifft_fast_fourier_transform_8_1_s_axis_data_tready_net = ready_out;
  assign fir_compiler_7_2_1_m_axis_data_tvalid_net = valid_in;
  assign concat_y_net = data_in;
  assign fir_compiler_7_2_1_m_axis_data_tlast_net = last_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_a73b1fb775 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_constant_915e72fd48 constant1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant1_op_net)
  );
  sysgen_constant_99adba9c32 constant2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant2_op_net)
  );
  channelizer_512_xlcounter_free #(
    .core_name0("channelizer_512_c_counter_binary_v12_0_0"),
    .op_arith(`xlUnsigned),
    .op_width(10)
  )
  counter (
    .clr(1'b0),
    .rst(logical_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  channelizer_512_xlcounter_free #(
    .core_name0("channelizer_512_c_counter_binary_v12_0_1"),
    .op_arith(`xlUnsigned),
    .op_width(10)
  )
  counter2 (
    .clr(1'b0),
    .rst(logical_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter2_op_net)
  );
  sysgen_delay_c7ad5db0a4 delay (
    .clr(1'b0),
    .d(constant2_op_net),
    .rst(logical_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_delay_3f371878da delay1 (
    .clr(1'b0),
    .d(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .rst(logical_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay1_q_net)
  );
  channelizer_512_xldpram #(
    .c_address_width_a(10),
    .c_address_width_b(10),
    .c_width_a(32),
    .c_width_b(32),
    .core_name0("channelizer_512_blk_mem_gen_v8_2_0"),
    .latency(1)
  )
  dual_port_ram (
    .addra(counter_op_net),
    .dina(concat_y_net),
    .wea(logical1_y_net),
    .addrb(counter2_op_net),
    .dinb(constant_op_net),
    .web(constant1_op_net),
    .rsta(logical_y_net),
    .rstb(logical_y_net),
    .ena(logical1_y_net),
    .enb(logical1_y_net),
    .a_clk(clk_net),
    .a_ce(ce_net),
    .b_clk(clk_net),
    .b_ce(ce_net),
    .douta(dual_port_ram_douta_net),
    .doutb(dual_port_ram_doutb_net)
  );
  sysgen_logical_a89dba00a2 logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(delay_q_net),
    .d1(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .y(logical_y_net_x0)
  );
  sysgen_logical_a89dba00a2 logical1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .d1(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .y(logical1_y_net)
  );
endmodule