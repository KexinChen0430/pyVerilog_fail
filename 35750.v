module channelizer_512_reset_register (
  input [1-1:0] set_stb,
  input [8-1:0] set_addr,
  input clk_1,
  input ce_1,
  output [1-1:0] reset_out
);
  wire [1-1:0] delay_q_net;
  wire [1-1:0] set_stb_in_net;
  wire [8-1:0] set_addr_in_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] constant_op_net;
  wire [2-1:0] counter_op_net;
  wire [1-1:0] relational1_op_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] relational_op_net;
  wire [8-1:0] address_op_net;
  wire [2-1:0] address1_op_net;
  assign reset_out = delay_q_net;
  assign set_stb_in_net = set_stb;
  assign set_addr_in_net = set_addr;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_99adba9c32 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  channelizer_512_xlcounter_free #(
    .core_name0("channelizer_512_c_counter_binary_v12_0_3"),
    .op_arith(`xlUnsigned),
    .op_width(2)
  )
  counter (
    .clr(1'b0),
    .rst(relational1_op_net),
    .en(delay_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  sysgen_delay_3f371878da delay (
    .clr(1'b0),
    .d(constant_op_net),
    .rst(relational1_op_net),
    .en(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_logical_a89dba00a2 logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(set_stb_in_net),
    .d1(relational_op_net),
    .y(logical_y_net)
  );
  sysgen_relational_474ec871e5 relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(set_addr_in_net),
    .b(address_op_net),
    .op(relational_op_net)
  );
  sysgen_relational_80afcc882d relational1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(counter_op_net),
    .b(address1_op_net),
    .op(relational1_op_net)
  );
  sysgen_constant_870c02eef2 address (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(address_op_net)
  );
  sysgen_constant_1385bcdaec address1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(address1_op_net)
  );
endmodule