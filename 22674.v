module hardcopyiii_input_phase_alignment (
      datain,
      clk,
      delayctrlin,
      phasectrlin,
      areset,
      enainputcycledelay,
      enaphasetransferreg,                          // new in 1.19
  	phaseinvertctrl,
      devclrn,
      devpor,
      dffin,
      dff1t,
      dataout
  );
  parameter use_phasectrlin   = "true";
  parameter phase_setting     = 0;
  parameter delay_buffer_mode = "high";
  parameter power_up          = "low";
  parameter async_mode        = "none";
  parameter add_input_cycle_delay           = "false";
  parameter bypass_output_register          = "false";
  parameter add_phase_transfer_reg        = "false"; // new in 1.19
  parameter invert_phase                    = "false"; // new in 1.26
  parameter sim_low_buffer_intrinsic_delay  = 350;
  parameter sim_high_buffer_intrinsic_delay = 175;
  parameter sim_buffer_delay_increment      = 10;
  parameter lpm_type = "hardcopyiii_input_phase_alignment";
  input        datain;
  input        clk;
  input [5:0]  delayctrlin;
  input [3:0]  phasectrlin;
  input        areset;
  input        enainputcycledelay;
  input        enaphasetransferreg;
  input        phaseinvertctrl;
  input        devclrn;
  input        devpor;
  output       dataout;
  output       dffin;               // buried port
  output       dff1t;               // buried port
 // LOCAL_PARAMETERS_BEGIN
  parameter sim_intrinsic_delay = (delay_buffer_mode == "low") ? sim_low_buffer_intrinsic_delay
                                   : sim_high_buffer_intrinsic_delay;
 // LOCAL_PARAMETERS_END
  tri1 devclrn;
  tri1 devpor;
  // int signals
  wire        phasectrl_clkout;
  wire        delayed_clk;
  // IO registers
  // common
  reg         adatasdata_in_r;
  reg         aload_in_r;
  wire        datain_q;
  wire        cycledelay_q;
  wire        cycledelay_mux_out;
  wire        cycledelay_mux_out_dly;
  wire        dlyclk_d;
  wire        dlyclk_q;
  wire        tmp_dataout;
  // buffer layer
  wire        datain_in;
  wire        clk_in;
  wire [5:0]  delayctrlin_in;
  wire [3:0]  phasectrlin_in;
  wire        areset_in;
  wire        enainputcycledelay_in;
  wire        enaphasetransferreg_in;
  wire        devclrn_in, devpor_in;
  wire        phaseinvertctrl_in;
  assign phaseinvertctrl_in = (phaseinvertctrl === 1'b1) ? 1'b1 : 1'b0;
  assign datain_in =  (datain === 1'b1) ? 1'b1 : 1'b0;
  assign clk_in =  clk;
  assign areset_in =  (areset === 1'b1) ? 1'b1 : 1'b0;
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
  assign enainputcycledelay_in = (enainputcycledelay === 1'b1) ? 1'b1 : 1'b0;
  assign enaphasetransferreg_in = (enaphasetransferreg === 1'b1) ? 1'b1 : 1'b0;
  assign devclrn_in = (devclrn === 1'b0) ? 1'b0 : 1'b1;
  assign devpor_in  = (devpor  === 1'b0) ? 1'b0 : 1'b1;
  // delay chain
  hardcopyiii_ddr_delay_chain_s m_delay_chain(
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
  assign delayed_clk = (invert_phase == "true") ? (~phasectrl_clkout) :
                       (invert_phase == "false") ? phasectrl_clkout :
                       (phaseinvertctrl_in === 1'b1) ? (~phasectrl_clkout) : phasectrl_clkout;
  // primary output
  assign dataout = tmp_dataout;
  assign tmp_dataout = (bypass_output_register == "true") ? dlyclk_d : dlyclk_q;
  // add phase transfer data path mux
  assign dlyclk_d = (add_phase_transfer_reg == "true")  ? cycledelay_mux_out_dly :
                    (add_phase_transfer_reg == "false") ? cycledelay_mux_out :
                    (enaphasetransferreg_in === 1'b1)   ? cycledelay_mux_out_dly : cycledelay_mux_out;
  // enaoutputcycledelay data path mux
  assign cycledelay_mux_out = (add_input_cycle_delay == "true")  ? cycledelay_q :
                              (add_input_cycle_delay == "false") ? datain_q :
                              (enainputcycledelay_in === 1'b1)   ? cycledelay_q : datain_q;
  // resolve reset modes
  always @(areset_in)
  begin
      if(async_mode == "clear")
      begin
          aload_in_r   = areset_in;
          adatasdata_in_r = 1'b0;
      end
      else if(async_mode == "preset")
      begin
          aload_in_r   = areset_in;
          adatasdata_in_r = 1'b1;
      end
      else  // async_mode == "none"
      begin
          aload_in_r   = 1'b0;
          adatasdata_in_r = 1'b0;
      end
  end
  // Datain Register
  hardcopyiii_ddr_io_reg  datain_reg(
                        .d(datain_in),
                        .clk(delayed_clk),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(datain_q)
                    );
           defparam datain_reg.power_up = power_up;
  // Cycle Delay Register
  hardcopyiii_ddr_io_reg  cycledelay_reg(
                        .d(datain_q),
                        .clk(delayed_clk),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(cycledelay_q)
                    );
           defparam cycledelay_reg.power_up = power_up;
  // assign #300 cycledelay_mux_out_dly = cycledelay_mux_out;  replaced by neg reg
  // Transfer Register  - clocked by negative edge
  hardcopyiii_ddr_io_reg  transfer_reg(
                        .d(cycledelay_mux_out),
                        .clk(~delayed_clk),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(cycledelay_mux_out_dly)
                    );
           defparam transfer_reg.power_up = power_up;
  // Register clocked by actually by clk_in
  hardcopyiii_ddr_io_reg  dlyclk_reg(
                        .d(dlyclk_d),
                        .clk(clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(dlyclk_q)
                    );
           defparam dlyclk_reg.power_up = power_up;
  endmodule