module arriaiigz_io_clock_divider (
          clk,
          phaseselect,
          delayctrlin,
          phasectrlin,
          masterin,
  	    phaseinvertctrl,
          devclrn,
          devpor,
          clkout,
          slaveout
  );
  parameter use_phasectrlin   = "true";
  parameter phase_setting     = 0;      // <0 - 7>
  parameter delay_buffer_mode = "high";
  parameter use_masterin      = "false"; // new in 1.19
  parameter invert_phase = "false";
  parameter sim_low_buffer_intrinsic_delay  = 350;
  parameter sim_high_buffer_intrinsic_delay = 175;
  parameter sim_buffer_delay_increment      = 10;
  parameter lpm_type = "arriaiigz_io_clock_divider";
  // INPUT PORTS
  input       clk;
  input       phaseselect;
  input [5:0] delayctrlin;
  input [3:0] phasectrlin;
  input       phaseinvertctrl;
  input       masterin;
  input       devclrn;
  input       devpor;
  // OUTPUT PORTS
  output       clkout;
  output       slaveout;
 // LOCAL_PARAMETERS_BEGIN
  parameter sim_intrinsic_delay = (delay_buffer_mode == "low") ? sim_low_buffer_intrinsic_delay :
                                   sim_high_buffer_intrinsic_delay;
 // LOCAL_PARAMETERS_END
  tri1 devclrn;
  tri1 devpor;
  // int signals
  wire        phasectrl_clkout;
  wire        delayed_clk;
  wire        divided_clk_in;
  reg         divided_clk;
  wire        tmp_clkout;
  // input buffer layer
  wire       clk_in, phaseselect_in;
  wire [5:0] delayctrlin_in;
  wire [3:0] phasectrlin_in;
  wire       masterin_in;
  wire       phaseinvertctrl_in;
  assign clk_in = clk;
  assign phaseselect_in = (phaseselect === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[5] = (delayctrlin[5] === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[4] = (delayctrlin[4] === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[3] = (delayctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[2] = (delayctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[1] = (delayctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
  assign delayctrlin_in[0] = (delayctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
  assign phasectrlin_in[3] = (phasectrlin[3] === 1'b1) ? 1'b1 : 1'b0;
  assign phasectrlin_in[2] = (phasectrlin[2] === 1'b1) ? 1'b1 : 1'b0;
  assign phasectrlin_in[1] = (phasectrlin[1] === 1'b1) ? 1'b1 : 1'b0;
  assign phasectrlin_in[0] = (phasectrlin[0] === 1'b1) ? 1'b1 : 1'b0;
  assign masterin_in = masterin;
  assign phaseinvertctrl_in = (phaseinvertctrl === 1'b1) ? 1'b1 : 1'b0;
  specify
      (clk => clkout) = (0,0);
  endspecify
  // delay chain
  arriaiigz_ddr_delay_chain_s m_delay_chain(
                          .clk(clk_in),
                          .delayctrlin(delayctrlin_in),
                          .phasectrlin(phasectrlin_in),
                          .delayed_clkout(phasectrl_clkout)
                          );
  defparam m_delay_chain.phase_setting               = phase_setting;
  defparam m_delay_chain.use_phasectrlin             = use_phasectrlin;
  defparam m_delay_chain.sim_buffer_intrinsic_delay  = sim_intrinsic_delay;
  defparam m_delay_chain.sim_buffer_delay_increment  = sim_buffer_delay_increment;
  defparam m_delay_chain.phasectrlin_limit           = 7;
  assign delayed_clk = (invert_phase == "true")  ?  (~phasectrl_clkout) :
                       (invert_phase == "false") ?  phasectrl_clkout :
                       (phaseinvertctrl_in === 1'b1) ? (~phasectrl_clkout) : phasectrl_clkout;
  initial
      divided_clk = 1'b0;
  assign divided_clk_in = (use_masterin == "true") ? masterin_in : divided_clk;
  always @(posedge delayed_clk)
  begin
      if (delayed_clk == 'b1)
          divided_clk <= ~divided_clk_in;
  end
  assign tmp_clkout = (phaseselect_in === 1'b1) ? ~divided_clk : divided_clk;
  assign clkout = tmp_clkout;
  assign slaveout = divided_clk;
  endmodule