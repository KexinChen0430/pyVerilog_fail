module arriaiigz_dqs_enable_ctrl (
 	    dqsenablein,
 	    clk,
 	    delayctrlin,
 	    phasectrlin,
 	    enaphasetransferreg,
 	    phaseinvertctrl,
 	    devclrn, devpor,
 	    dffin,
 	    dffextenddqsenable,
 	    dqsenableout
 );
 parameter use_phasectrlin   = "true";
 parameter phase_setting     = 0;
 parameter delay_buffer_mode = "high";
 parameter level_dqs_enable  = "false";
 parameter delay_dqs_enable_by_half_cycle = "false";
 parameter add_phase_transfer_reg = "false";
 parameter invert_phase = "false";
 parameter sim_low_buffer_intrinsic_delay = 350;
 parameter sim_high_buffer_intrinsic_delay = 175;
 parameter sim_buffer_delay_increment = 10;
 parameter lpm_type = "arriaiigz_dqs_enable_ctrl";
 // INPUT PORTS
 input	     dqsenablein;
 input        clk;
 input [5:0]  delayctrlin;
 input [3:0]  phasectrlin;
 input        enaphasetransferreg;
 input        phaseinvertctrl;
 input        devclrn;
 input        devpor;
 // OUTPUT PORTS
 output       dqsenableout;
 output       dffin;
 output       dffextenddqsenable;  // buried
 // LOCAL_PARAMETERS_BEGIN
 parameter sim_intrinsic_delay = (delay_buffer_mode == "low") ? sim_low_buffer_intrinsic_delay :
                                  sim_high_buffer_intrinsic_delay;
 // LOCAL_PARAMETERS_END
 tri1 devclrn;
 tri1 devpor;
 // decoded counter
 wire [5:0]  delayctrl_bin;
 // cell delay
 integer     acell_delay;
 integer     delay_chain_len;
 integer     clk_delay;
 // int signals
 wire        phasectrl_clkout;
 wire        delayed_clk;
 wire        dqsenablein_reg_q;
 wire        dqsenablein_level_ena;
 // transfer delay
 wire        dqsenablein_reg_dly;
 wire        phasetransferdelay_mux_out;
 wire        dqsenable_delayed_regp;
 wire        dqsenable_delayed_regn;
 wire        tmp_dqsenableout;
 // BUFFER wrapper
 wire	    dqsenablein_in;
 wire        clk_in;
 wire [5:0]  delayctrlin_in;
 wire [3:0]  phasectrlin_in;
 wire        enaphasetransferreg_in;
 wire        phaseinvertctrl_in;
 wire        devclrn_in, devpor_in;
 assign phaseinvertctrl_in = (phaseinvertctrl === 1'b1) ? 1'b1 : 1'b0;
 assign dqsenablein_in     = (dqsenablein === 1'b1) ? 1'b1 : 1'b0;
 assign clk_in = clk;
 assign enaphasetransferreg_in = (enaphasetransferreg === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[5]      = (delayctrlin[5] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[4]      = (delayctrlin[4] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[3]      = (delayctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[2]      = (delayctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[1]      = (delayctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[0]      = (delayctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[3]      = (phasectrlin[3] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[2]      = (phasectrlin[2] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[1]      = (phasectrlin[1] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[0]      = (phasectrlin[0] === 1'b1) ? 1'b1 : 1'b0;
 assign  devclrn_in = (devclrn === 1'b0) ? 1'b0 : 1'b1;
 assign  devpor_in  = (devpor  === 1'b0) ? 1'b0 : 1'b1;
 // no top-level timing delays
 // specify
 //    (dqsenablein => dqsenableout) = (0,0);
 // endspecify
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
 assign delayed_clk = (invert_phase == "true")  ?  (~phasectrl_clkout) :
                      (invert_phase == "false") ?  phasectrl_clkout :
                      (phaseinvertctrl_in === 1'b1) ? (~phasectrl_clkout) : phasectrl_clkout;
 // disable data path
 arriaiigz_ddr_io_reg  dqsenablein_reg(
                       .d(dqsenablein_in),
                       .clk(clk_in),
                       .ena(1'b1),
                       .clrn(1'b1),
                       .prn(1'b1),
                       .aload(1'b0),
                       .asdata(1'b0),
                       .sclr(1'b0),
                       .sload(1'b0),
                       .devclrn(devclrn_in),
                       .devpor(devpor_in),
                       .rpt_violation(1'b1),
                       .q(dqsenablein_reg_q)
                   );
 arriaiigz_ddr_io_reg  dqsenable_transfer_reg(
                       .d(dqsenablein_reg_q),
                       .clk(~delayed_clk),
                       .ena(1'b1),
                       .clrn(1'b1),
                       .prn(1'b1),
                       .aload(1'b0),
                       .asdata(1'b0),
                       .sclr(1'b0),
                       .sload(1'b0),
                       .devclrn(devclrn_in),
                       .devpor(devpor_in),
                       .rpt_violation(1'b0),
                       .q(dqsenablein_reg_dly)
                   );
 // add phase transfer mux
 assign phasetransferdelay_mux_out =
                   (add_phase_transfer_reg == "true")  ? dqsenablein_reg_dly :
                   (add_phase_transfer_reg == "false") ? dqsenablein_reg_q :
                   (enaphasetransferreg_in === 1'b1)   ? dqsenablein_reg_dly : dqsenablein_reg_q;
 assign dqsenablein_level_ena = (level_dqs_enable == "true") ? phasetransferdelay_mux_out : dqsenablein_in;
 arriaiigz_ddr_io_reg  dqsenableout_reg(
                       .d(dqsenablein_level_ena),
                       .clk(delayed_clk),
                       .ena(1'b1),
                       .clrn(1'b1),
                       .prn(1'b1),
                       .aload(1'b0),
                       .asdata(1'b0),
                       .sclr(1'b0),
                       .sload(1'b0),
                       .devclrn(devclrn_in),
                       .devpor(devpor_in),
                       .rpt_violation(1'b1),
                       .q(dqsenable_delayed_regp)
                   );
 arriaiigz_ddr_io_reg  dqsenableout_extend_reg(
                       .d(dqsenable_delayed_regp),
                       .clk(~delayed_clk),
                       .ena(1'b1),
                       .clrn(1'b1),
                       .prn(1'b1),
                       .aload(1'b0),
                       .asdata(1'b0),
                       .sclr(1'b0),
                       .sload(1'b0),
                       .devclrn(devclrn_in),
                       .devpor(devpor_in),
                       .rpt_violation(1'b0),
                       .q(dqsenable_delayed_regn)
                   );
 assign tmp_dqsenableout = (delay_dqs_enable_by_half_cycle == "false") ? dqsenable_delayed_regp
                           : (dqsenable_delayed_regp & dqsenable_delayed_regn);
 assign dqsenableout = tmp_dqsenableout;
 endmodule