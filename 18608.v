module bsg_fsb_node_level_shift_node_domain #(parameter `BSG_INV_PARAM(ring_width_p ))
(
  input  en_ls_i,
  input  clk_i,
  input  reset_i,
  output clk_o,
  output reset_o,
  output                    fsb_v_i_o,
  output [ring_width_p-1:0] fsb_data_i_o,
  input                     fsb_yumi_o_i,
  input                     fsb_v_o_i,
  input  [ring_width_p-1:0] fsb_data_o_i,
  output                    fsb_ready_i_o,
  output                    node_v_i_o,
  output [ring_width_p-1:0] node_data_i_o,
  input                     node_ready_o_i,
  input                     node_v_o_i,
  input  [ring_width_p-1:0] node_data_o_i,
  output                    node_yumi_i_o
);
// Level Shift Clock
bsg_level_shift_up_down_sink #(.width_p(1)) clk_ls_inst
(
  .v1_en_i(1'b1),
  .v0_data_i(clk_i),
  .v1_data_o(clk_o)
);
// Level Shift Reset
bsg_level_shift_up_down_sink #(.width_p(1)) reset_ls_inst
(
  .v1_en_i(1'b1),
  .v0_data_i(reset_i),
  .v1_data_o(reset_o)
);
// NODE v_o --> FSB v_i
bsg_level_shift_up_down_source #(.width_p(1)) n2f_v_ls_inst
(
  .v0_en_i(en_ls_i),
  .v0_data_i(node_v_o_i),
  .v1_data_o(fsb_v_i_o)
);
// NODE data_o --> FSB data_i
bsg_level_shift_up_down_source #(.width_p(ring_width_p)) n2f_data_ls_inst
(
  .v0_en_i(en_ls_i),
  .v0_data_i(node_data_o_i),
  .v1_data_o(fsb_data_i_o)
);
// FSB yumi_o --> NODE yumi_i
bsg_level_shift_up_down_sink #(.width_p(1)) f2n_yumi_ls_inst
(
  .v1_en_i(en_ls_i),
  .v0_data_i(fsb_yumi_o_i),
  .v1_data_o(node_yumi_i_o)
);
// FSB v_o --> NODE v_i
bsg_level_shift_up_down_sink #(.width_p(1)) f2n_v_ls_inst
(
  .v1_en_i(en_ls_i),
  .v0_data_i(fsb_v_o_i),
  .v1_data_o(node_v_i_o)
);
// FSB data_o --> NODE data_i
bsg_level_shift_up_down_sink #(.width_p(ring_width_p)) f2n_data_ls_inst
(
  .v1_en_i(en_ls_i),
  .v0_data_i(fsb_data_o_i),
  .v1_data_o(node_data_i_o)
);
// NODE ready_o --> FSB ready_i
bsg_level_shift_up_down_source #(.width_p(1)) n2f_ready_ls_inst
(
  .v0_en_i(en_ls_i),
  .v0_data_i(node_ready_o_i),
  .v1_data_o(fsb_ready_i_o)
);
endmodule