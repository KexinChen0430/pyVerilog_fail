module stratixii_io (
                     datain,
                     ddiodatain,
                     oe,
                     outclk,
                     outclkena,
                     inclk,
                     inclkena,
                     areset,
                     sreset,
                     ddioinclk,
                     delayctrlin,
                     offsetctrlin,
                     dqsupdateen,
                     linkin,
                     terminationcontrol,
                     devclrn,
                     devpor,
                     devoe,
                     padio,
                     combout,
                     regout,
                     ddioregout,
                     dqsbusout,
                     linkout
                    );
parameter operation_mode = "input";
parameter ddio_mode = "none";
parameter open_drain_output = "false";
parameter bus_hold = "false";
parameter output_register_mode = "none";
parameter output_async_reset = "none";
parameter output_power_up = "low";
parameter output_sync_reset = "none";
parameter tie_off_output_clock_enable = "false";
parameter oe_register_mode = "none";
parameter oe_async_reset = "none";
parameter oe_power_up = "low";
parameter oe_sync_reset = "none";
parameter tie_off_oe_clock_enable = "false";
parameter input_register_mode = "none";
parameter input_async_reset = "none";
parameter input_power_up = "low";
parameter input_sync_reset = "none";
parameter extend_oe_disable = "false";
parameter dqs_input_frequency = "10000 ps";
parameter dqs_out_mode = "none";
parameter dqs_delay_buffer_mode = "low";
parameter dqs_phase_shift = 0;
parameter inclk_input = "normal";
parameter ddioinclk_input = "negated_inclk";
parameter dqs_offsetctrl_enable = "false";
parameter dqs_ctrl_latches_enable = "false";
parameter dqs_edge_detect_enable = "false";
parameter gated_dqs = "false";
parameter sim_dqs_intrinsic_delay = 0;
parameter sim_dqs_delay_increment = 0;
parameter sim_dqs_offset_increment = 0;
parameter lpm_type = "stratixii_io";
input datain;
input ddiodatain;
input oe;
input outclk;
input outclkena;
input inclk;
input inclkena;
input areset;
input sreset;
input ddioinclk;
input [5:0] delayctrlin;
input [5:0] offsetctrlin;
input dqsupdateen;
input linkin;
input [13:0] terminationcontrol;
input devclrn;
input devpor;
input devoe;
inout padio;
output combout;
output regout;
output ddioregout;
output dqsbusout;
output linkout;
tri1 devclrn;
tri1 devpor;
tri1 devoe;
wire      oe_reg_out, oe_pulse_reg_out;
wire      in_reg_out, in_ddio0_reg_out, in_ddio1_reg_out;
wire      out_reg_out, out_ddio_reg_out;
wire      out_clk_ena, oe_clk_ena;
wire      tmp_datain;
wire      ddio_data;
wire      oe_out;
wire      outclk_delayed;
wire      para_ddioinclk_input;
wire      neg_ireg_clk;
wire      para_gated_dqs;
assign para_ddioinclk_input = ddioinclk_input == "dqsb_bus" ? 1'b1 : 1'b0;
assign neg_ireg_clk = para_ddioinclk_input === 1'b1 ? !ddioinclk : inclk;
assign para_gated_dqs = gated_dqs == "true" ? 1'b1 : 1'b0;
assign out_clk_ena = (tie_off_output_clock_enable == "false") ? outclkena : 1'b1;
assign oe_clk_ena = (tie_off_oe_clock_enable == "false") ? outclkena : 1'b1;
   //input register
   stratixii_io_register in_reg (
                                 .regout(in_reg_out),
                                 .clk(inclk),
                                 .ena(inclkena),
                                 .datain(padio),
                                 .areset(areset),
                                 .sreset(sreset),
                                 .devpor(devpor),
                                 .devclrn(devclrn)
                                );
   defparam in_reg.async_reset = input_async_reset;
   defparam in_reg.sync_reset = input_sync_reset;
   defparam in_reg.power_up = input_power_up;
   // in_ddio0_reg
   stratixii_io_register in_ddio0_reg (
                                       .regout(in_ddio0_reg_out),
                                       .clk(!neg_ireg_clk),
                                       .ena (inclkena),
                                       .datain(padio),
                                       .areset(areset),
                                       .sreset(sreset),
                                       .devpor(devpor),
                                       .devclrn(devclrn)
                                      );
   defparam in_ddio0_reg.async_reset = input_async_reset;
   defparam in_ddio0_reg.sync_reset = input_sync_reset;
   defparam in_ddio0_reg.power_up = input_power_up;
   // in_ddio1_latch
   stratixii_io_latch in_ddio1_reg (
                                       .regout(in_ddio1_reg_out),
                                       .clk(inclk),
                                       .ena(inclkena),
                                       .datain(in_ddio0_reg_out),
                                       .areset(areset),
                                       .sreset(1'b0),
                                       .devpor(devpor),
                                       .devclrn(devclrn)
                                      );
   defparam in_ddio1_reg.async_reset = input_async_reset;
   defparam in_ddio1_reg.sync_reset = "none"; // this register has no sync_reset
   defparam in_ddio1_reg.power_up = input_power_up;
   // out_reg
   stratixii_io_register out_reg (
                                  .regout(out_reg_out),
                                  .clk(outclk),
                                  .ena(out_clk_ena),
                                  .datain(datain),
                                  .areset(areset),
                                  .sreset(sreset),
                                  .devpor(devpor),
                                  .devclrn(devclrn)
                                 );
   defparam out_reg.async_reset = output_async_reset;
   defparam out_reg.sync_reset = output_sync_reset;
   defparam out_reg.power_up = output_power_up;
   // out ddio reg
   stratixii_io_register out_ddio_reg (
                                       .regout(out_ddio_reg_out),
                                       .clk(outclk),
                                       .ena(out_clk_ena),
                                       .datain(ddiodatain),
                                       .areset(areset),
                                       .sreset(sreset),
                                       .devpor(devpor),
                                       .devclrn(devclrn)
                                      );
   defparam out_ddio_reg.async_reset = output_async_reset;
   defparam out_ddio_reg.sync_reset = output_sync_reset;
   defparam out_ddio_reg.power_up = output_power_up;
   // oe reg
   stratixii_io_register oe_reg (
                                 .regout (oe_reg_out),
                                 .clk(outclk),
                                 .ena(oe_clk_ena),
                                 .datain(oe),
                                 .areset(areset),
                                 .sreset(sreset),
                                 .devpor(devpor),
                                 .devclrn(devclrn)
                                );
   defparam oe_reg.async_reset = oe_async_reset;
   defparam oe_reg.sync_reset = oe_sync_reset;
   defparam oe_reg.power_up = oe_power_up;
   // oe_pulse reg
   stratixii_io_register oe_pulse_reg (
                                       .regout(oe_pulse_reg_out),
                                       .clk(!outclk),
                                       .ena(oe_clk_ena),
                                       .datain(oe_reg_out),
                                       .areset(areset),
                                       .sreset(sreset),
                                       .devpor(devpor),
                                       .devclrn(devclrn)
                                      );
   defparam oe_pulse_reg.async_reset = oe_async_reset;
   defparam oe_pulse_reg.sync_reset = oe_sync_reset;
   defparam oe_pulse_reg.power_up = oe_power_up;
   assign oe_out = (oe_register_mode == "register") ?
		   (extend_oe_disable == "true" ? oe_pulse_reg_out && oe_reg_out : oe_reg_out) : oe;
   stratixii_and1    sel_delaybuf (.Y(outclk_delayed), .IN1(outclk));
   stratixii_mux21   ddio_data_mux (
                          .MO (ddio_data),
                          .A (out_ddio_reg_out),
                          .B (out_reg_out),
                          .S (outclk_delayed)
                         );
   assign tmp_datain = (ddio_mode == "output" || ddio_mode == "bidir") ?
                ddio_data : ((operation_mode == "output" || operation_mode == "bidir") ?
                   ((output_register_mode == "register") ? out_reg_out : datain) : 'b0);
   // timing info in case output and/or input are not registered.
   stratixii_asynch_io inst1 (
                              .datain(tmp_datain),
                              .oe(oe_out),
                              .regin(in_reg_out),
                              .ddioregin(in_ddio1_reg_out),
                              .padio(padio),
                              .delayctrlin(delayctrlin),
                              .offsetctrlin(offsetctrlin),
							  .dqsupdateen(dqsupdateen),
							  .dqsbusout(dqsbusout),
                              .combout(combout),
                              .regout(regout),
                              .ddioregout(ddioregout)
                             );
   defparam inst1.operation_mode = operation_mode;
   defparam inst1.bus_hold = bus_hold;
   defparam inst1.open_drain_output = open_drain_output;
   defparam inst1.dqs_input_frequency = dqs_input_frequency;
   defparam inst1.dqs_out_mode = dqs_out_mode;
   defparam inst1.dqs_delay_buffer_mode = dqs_delay_buffer_mode;
   defparam inst1.dqs_phase_shift = dqs_phase_shift;
   defparam inst1.dqs_offsetctrl_enable = dqs_offsetctrl_enable;
   defparam inst1.dqs_ctrl_latches_enable = dqs_ctrl_latches_enable;
   defparam inst1.dqs_edge_detect_enable = dqs_edge_detect_enable;
   defparam inst1.sim_dqs_intrinsic_delay = sim_dqs_intrinsic_delay;
   defparam inst1.sim_dqs_delay_increment = sim_dqs_delay_increment;
   defparam inst1.sim_dqs_offset_increment = sim_dqs_offset_increment;
   defparam inst1.gated_dqs = gated_dqs;
endmodule