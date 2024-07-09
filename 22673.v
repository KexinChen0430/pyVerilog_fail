module hardcopyiii_output_phase_alignment (
      datain,
      clk,
      delayctrlin,
      phasectrlin,
      areset,
      sreset,
      clkena,
      enaoutputcycledelay,
      enaphasetransferreg,
  	  phaseinvertctrl,
      delaymode,
      dutycycledelayctrlin,
      devclrn,
      devpor,
      dffin,
      dff1t,
      dffddiodataout,
      dataout
  );
  parameter operation_mode    = "ddio_out";
  parameter use_phasectrlin   = "true";
  parameter phase_setting     = 0;          // <0..10>
  parameter delay_buffer_mode = "high";
  parameter power_up          = "low";
  parameter async_mode        = "none";
  parameter sync_mode         = "none";
  parameter add_output_cycle_delay          = "false";
  parameter use_delayed_clock               = "false";  // new in 1.21
  parameter add_phase_transfer_reg          = "false";  // <false,true,dynamic>
  parameter use_phasectrl_clock             = "true";   // new in 1.21
  parameter use_primary_clock               = "true";   // new in 1.21
  parameter invert_phase                    = "false";  // new in 1.26
  parameter phase_setting_for_delayed_clock = 2;        // new in 1.28
  parameter bypass_input_register           = "false";  // new in 1.36
  parameter sim_low_buffer_intrinsic_delay  = 350;
  parameter sim_high_buffer_intrinsic_delay = 175;
  parameter sim_buffer_delay_increment      = 10;
  // new in STRATIXIV: ww30.2008
  parameter duty_cycle_delay_mode = "none";
  parameter sim_dutycycledelayctrlin_falling_delay_0 =  0 ;
  parameter sim_dutycycledelayctrlin_falling_delay_1 =  25 ;
  parameter sim_dutycycledelayctrlin_falling_delay_10 =  250 ;
  parameter sim_dutycycledelayctrlin_falling_delay_11 =  275 ;
  parameter sim_dutycycledelayctrlin_falling_delay_12 =  300 ;
  parameter sim_dutycycledelayctrlin_falling_delay_13 =  325 ;
  parameter sim_dutycycledelayctrlin_falling_delay_14 =  350 ;
  parameter sim_dutycycledelayctrlin_falling_delay_15 =  375 ;
  parameter sim_dutycycledelayctrlin_falling_delay_2 =  50 ;
  parameter sim_dutycycledelayctrlin_falling_delay_3 =  75 ;
  parameter sim_dutycycledelayctrlin_falling_delay_4 =  100 ;
  parameter sim_dutycycledelayctrlin_falling_delay_5 =  125 ;
  parameter sim_dutycycledelayctrlin_falling_delay_6 =  150 ;
  parameter sim_dutycycledelayctrlin_falling_delay_7 =  175 ;
  parameter sim_dutycycledelayctrlin_falling_delay_8 =  200 ;
  parameter sim_dutycycledelayctrlin_falling_delay_9 =  225 ;
  parameter sim_dutycycledelayctrlin_rising_delay_0 =  0 ;
  parameter sim_dutycycledelayctrlin_rising_delay_1 =  25 ;
  parameter sim_dutycycledelayctrlin_rising_delay_10 =  250 ;
  parameter sim_dutycycledelayctrlin_rising_delay_11 =  275 ;
  parameter sim_dutycycledelayctrlin_rising_delay_12 =  300 ;
  parameter sim_dutycycledelayctrlin_rising_delay_13 =  325 ;
  parameter sim_dutycycledelayctrlin_rising_delay_14 =  350 ;
  parameter sim_dutycycledelayctrlin_rising_delay_15 =  375 ;
  parameter sim_dutycycledelayctrlin_rising_delay_2 =  50 ;
  parameter sim_dutycycledelayctrlin_rising_delay_3 =  75 ;
  parameter sim_dutycycledelayctrlin_rising_delay_4 =  100 ;
  parameter sim_dutycycledelayctrlin_rising_delay_5 =  125 ;
  parameter sim_dutycycledelayctrlin_rising_delay_6 =  150 ;
  parameter sim_dutycycledelayctrlin_rising_delay_7 =  175 ;
  parameter sim_dutycycledelayctrlin_rising_delay_8 =  200 ;
  parameter sim_dutycycledelayctrlin_rising_delay_9 =  225 ;
  parameter lpm_type = "hardcopyiii_output_phase_alignment";
  // INPUT PORTS
  input [1:0]  datain;
  input        clk;
  input [5:0]  delayctrlin;
  input [3:0]  phasectrlin;
  input        areset;
  input        sreset;
  input        clkena;
  input        enaoutputcycledelay;
  input        enaphasetransferreg;
  input        phaseinvertctrl;
  // new in STRATIXIV: ww30.2008
  input        delaymode;
  input [3:0]  dutycycledelayctrlin;
  input        devclrn;
  input        devpor;
  // OUTPUT PORTS
  output       dataout;
  output [1:0] dffin;               // buried port
  output [1:0] dff1t;               // buried port
  output       dffddiodataout;      // buried port
 // LOCAL_PARAMETERS_BEGIN
  parameter sim_intrinsic_delay = (delay_buffer_mode == "low") ? sim_low_buffer_intrinsic_delay
                                   : sim_high_buffer_intrinsic_delay;
 // LOCAL_PARAMETERS_END
  tri1 devclrn;
  tri1 devpor;
  // int signals on clock paths
  wire        clk_in_delayed;
  wire        clk_in_mux;
  wire        phasectrl_clkout;
  wire        phaseinvertctrl_out;
  // IO registers
  // common
  reg         adatasdata_in_r;   //sync reset - common for transfer and output reg
  reg         sclr_in_r;
  reg         sload_in_r;
  wire        sclr_in;
  wire        sload_in;
  wire        adatasdata_in;
  reg         clrn_in_r;         //async reset - common for all registers
  reg         prn_in_r;
  wire        datain_q;
  wire        ddio_datain_q;
  wire        cycledelay_q;
  wire        ddio_cycledelay_q;
  wire        cycledelay_mux_out;
  wire        ddio_cycledelay_mux_out;
  wire        bypass_input_reg_mux_out;
  wire        ddio_bypass_input_reg_mux_out;
  // transfer delay now by negative clk
  wire        transfer_q;
  wire        ddio_transfer_q;
  // Duty Cycle Delay
  wire        dcd_in;
  wire        dcd_out;
  wire        dcd_both;
  reg         dcd_both_gnd;
  reg         dcd_both_vcc;
  wire        dcd_fallnrise;
  reg         dcd_fallnrise_gnd;
  reg         dcd_fallnrise_vcc;
  integer     dcd_table_rising[0:15];
  integer     dcd_table_falling[0:15];
  integer     dcd_dly_setting;
  integer     dcd_rising_dly;
  integer     dcd_falling_dly;
  wire        dlyclk_clk;
  wire        dlyclk_d;
  wire        dlyclk_q;
  wire        ddio_dlyclk_d;
  wire        ddio_dlyclk_q;
  wire        ddio_out_clk_mux;
  wire        ddio_out_lo_q;
  wire        ddio_out_hi_q;
  wire        dlyclk_clkena_in;     // shared
  wire        dlyclk_extended_q;
  wire        dlyclk_extended_clk;
  wire        normal_dataout;
  wire        extended_dataout;
  wire        ddio_dataout;
  wire        tmp_dataout;
  // buffer layer
  wire [1:0]  datain_in;
  wire        clk_in;
  wire [5:0]  delayctrlin_in;
  wire [3:0]  phasectrlin_in;
  wire        areset_in;
  wire        sreset_in;
  wire        clkena_in;
  wire        enaoutputcycledelay_in;
  wire        enaphasetransferreg_in;
  wire        devclrn_in, devpor_in;
  wire        phaseinvertctrl_in;
  wire        delaymode_in;
  wire [3:0]  dutycycledelayctrlin_in;
  assign  devclrn_in = (devclrn === 1'b0) ? 1'b0 : 1'b1;
  assign  devpor_in  = (devpor  === 1'b0) ? 1'b0 : 1'b1;
  assign datain_in =  datain;
  assign clk_in =  clk;
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
  assign areset_in =  (areset === 1'b1) ? 1'b1 : 1'b0;
  assign sreset_in =  (sreset === 1'b1) ? 1'b1 : 1'b0;
  assign clkena_in =  (clkena === 1'b1) ? 1'b1 : 1'b0;
  assign enaoutputcycledelay_in = (enaoutputcycledelay === 1'b1) ? 1'b1 : 1'b0;
  assign enaphasetransferreg_in = (enaphasetransferreg === 1'b1) ? 1'b1 : 1'b0;
  assign phaseinvertctrl_in = (phaseinvertctrl === 1'b1) ? 1'b1 : 1'b0;
  assign delaymode_in = (delaymode === 1'b1) ? 1'b1 : 1'b0;
  assign dutycycledelayctrlin_in[0] = (dutycycledelayctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
  assign dutycycledelayctrlin_in[1] = (dutycycledelayctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
  assign dutycycledelayctrlin_in[2] = (dutycycledelayctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
  assign dutycycledelayctrlin_in[3] = (dutycycledelayctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
  // delay chain for clk_in delay
  hardcopyiii_ddr_delay_chain_s m_clk_in_delay_chain(
                          .clk(clk_in),
                          .delayctrlin(delayctrlin_in),
                          .phasectrlin(phasectrlin_in),
                          .delayed_clkout(clk_in_delayed)
                          );
  defparam m_clk_in_delay_chain.phase_setting               = phase_setting_for_delayed_clock;
  defparam m_clk_in_delay_chain.use_phasectrlin             = "false";
  defparam m_clk_in_delay_chain.sim_buffer_intrinsic_delay  = sim_intrinsic_delay;
  defparam m_clk_in_delay_chain.sim_buffer_delay_increment  = sim_buffer_delay_increment;
  // clock source for datain and cycle delay registers
  assign clk_in_mux = (use_delayed_clock == "true") ? clk_in_delayed : clk_in;
  // delay chain for phase control
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
  defparam m_delay_chain.phasectrlin_limit           = (use_primary_clock == "true") ? 10 : 7;
  // primary outputs
  assign normal_dataout   = dlyclk_q;
  assign extended_dataout = dlyclk_q | dlyclk_extended_q;    // oe port is active low
  assign ddio_dataout     = (ddio_out_clk_mux === 1'b1) ? ddio_out_hi_q : ddio_out_lo_q;
  assign tmp_dataout      = (operation_mode == "ddio_out") ? ddio_dataout :
                            (operation_mode == "extended_oe" || operation_mode == "extended_rtena") ? extended_dataout :
                            (operation_mode == "output" || operation_mode == "oe" || operation_mode == "rtena") ? normal_dataout
                            : 1'bz;
  assign dataout = tmp_dataout;
  assign #1 ddio_out_clk_mux = dlyclk_clk;  // symbolic T4 to remove glitch on data_h
  assign #2 ddio_out_lo_q = dlyclk_q;      // symbolic 2 T4 to remove glitch on data_l
  assign    ddio_out_hi_q = ddio_dlyclk_q;
  // resolve reset/areset modes
  initial begin
      adatasdata_in_r = (sync_mode == "preset") ? 1'b1: 1'b0;
      sclr_in_r       = 1'b0;
      sload_in_r      = 1'b0;
      clrn_in_r       = 1'b1;
      prn_in_r        = 1'b1;
  end
  always @(areset_in)
  begin
      if (async_mode == "clear")
      begin
          clrn_in_r       = ~areset_in;
      end
      else if (async_mode == "preset")
      begin
          prn_in_r        = ~areset_in;
      end
  end
  always @(sreset_in)
  begin
      if (sync_mode == "clear")
      begin
          sclr_in_r       = sreset_in;
      end
      else if(sync_mode == "preset")
      begin
          sload_in_r      = sreset_in;
      end
  end
  assign sclr_in   = (operation_mode == "rtena" || operation_mode == "extended_rtena") ? 1'b0 : sclr_in_r;
  assign sload_in  = (operation_mode == "rtena" || operation_mode == "extended_rtena") ? 1'b0 : sload_in_r;
  assign adatasdata_in    = adatasdata_in_r;
  assign dlyclk_clkena_in = (operation_mode == "rtena" || operation_mode == "extended_rtena") ? 1'b1 : clkena_in;
  // Datain Register
  hardcopyiii_ddr_io_reg  datain_reg(
                        .d(datain_in[0]),
                        .clk(clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(datain_q)
                    );
           defparam datain_reg.power_up = power_up;
  // DDIO Datain Register
  hardcopyiii_ddr_io_reg  ddio_datain_reg(
                        .d(datain_in[1]),
                        .clk(clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(ddio_datain_q)
                    );
           defparam ddio_datain_reg.power_up = power_up;
  // Cycle Delay Register
  hardcopyiii_ddr_io_reg  cycledelay_reg(
                        .d(datain_q),
                        .clk(clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(cycledelay_q)
                    );
           defparam cycledelay_reg.power_up = power_up;
  // DDIO Cycle Delay Register
  hardcopyiii_ddr_io_reg  ddio_cycledelay_reg(
                        .d(ddio_datain_q),
                        .clk(clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(ddio_cycledelay_q)
                    );
           defparam ddio_cycledelay_reg.power_up = power_up;
  // enaoutputcycledelay data path mux
  assign cycledelay_mux_out = (add_output_cycle_delay == "true")  ? cycledelay_q :
                              (add_output_cycle_delay == "false") ? datain_q :
                              (enaoutputcycledelay_in === 1'b1)   ? cycledelay_q : datain_q;
  // input register bypass mux
  assign bypass_input_reg_mux_out = (bypass_input_register == "true") ? datain_in[0] : cycledelay_mux_out;
  //assign #300 transfer_q = cycledelay_mux_out;
  // transfer delay is implemented with negative register in rev1.26
  hardcopyiii_ddr_io_reg  transferdelay_reg(
                        .d(bypass_input_reg_mux_out),
                        .clk(~clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(sclr_in),
                        .sload(sload_in),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(transfer_q)
                    );
           defparam transferdelay_reg.power_up = power_up;
  // add phase transfer (true/false/dynamic) data path mux
  assign dlyclk_d = (add_phase_transfer_reg == "true")  ? transfer_q :
                    (add_phase_transfer_reg == "false") ? bypass_input_reg_mux_out :
                    (enaphasetransferreg_in === 1'b1)   ? transfer_q : bypass_input_reg_mux_out;
  // clock mux for the output register
  assign phaseinvertctrl_out = (invert_phase == "true") ? (~phasectrl_clkout) :
                               (invert_phase == "false") ? phasectrl_clkout :
                       (phaseinvertctrl_in === 1'b1) ? (~phasectrl_clkout) : phasectrl_clkout;
 // Duty Cycle Delay
  assign dcd_in = (use_phasectrl_clock == "true") ? phaseinvertctrl_out : clk_in_mux;
  initial
  begin
     dcd_table_rising[0] = sim_dutycycledelayctrlin_rising_delay_0;
     dcd_table_rising[1] = sim_dutycycledelayctrlin_rising_delay_1;
     dcd_table_rising[2] = sim_dutycycledelayctrlin_rising_delay_2;
     dcd_table_rising[3] = sim_dutycycledelayctrlin_rising_delay_3;
     dcd_table_rising[4] = sim_dutycycledelayctrlin_rising_delay_4;
     dcd_table_rising[5] = sim_dutycycledelayctrlin_rising_delay_5;
     dcd_table_rising[6] = sim_dutycycledelayctrlin_rising_delay_6;
     dcd_table_rising[7] = sim_dutycycledelayctrlin_rising_delay_7;
     dcd_table_rising[8] = sim_dutycycledelayctrlin_rising_delay_8;
     dcd_table_rising[9] = sim_dutycycledelayctrlin_rising_delay_9;
     dcd_table_rising[10] = sim_dutycycledelayctrlin_rising_delay_10;
     dcd_table_rising[11] = sim_dutycycledelayctrlin_rising_delay_11;
     dcd_table_rising[12] = sim_dutycycledelayctrlin_rising_delay_12;
     dcd_table_rising[13] = sim_dutycycledelayctrlin_rising_delay_13;
     dcd_table_rising[14] = sim_dutycycledelayctrlin_rising_delay_14;
     dcd_table_rising[15] = sim_dutycycledelayctrlin_rising_delay_15;
     dcd_table_falling[0] = sim_dutycycledelayctrlin_falling_delay_0;
     dcd_table_falling[1] = sim_dutycycledelayctrlin_falling_delay_1;
     dcd_table_falling[2] = sim_dutycycledelayctrlin_falling_delay_2;
     dcd_table_falling[3] = sim_dutycycledelayctrlin_falling_delay_3;
     dcd_table_falling[4] = sim_dutycycledelayctrlin_falling_delay_4;
     dcd_table_falling[5] = sim_dutycycledelayctrlin_falling_delay_5;
     dcd_table_falling[6] = sim_dutycycledelayctrlin_falling_delay_6;
     dcd_table_falling[7] = sim_dutycycledelayctrlin_falling_delay_7;
     dcd_table_falling[8] = sim_dutycycledelayctrlin_falling_delay_8;
     dcd_table_falling[9] = sim_dutycycledelayctrlin_falling_delay_9;
     dcd_table_falling[10] = sim_dutycycledelayctrlin_falling_delay_10;
     dcd_table_falling[11] = sim_dutycycledelayctrlin_falling_delay_11;
     dcd_table_falling[12] = sim_dutycycledelayctrlin_falling_delay_12;
     dcd_table_falling[13] = sim_dutycycledelayctrlin_falling_delay_13;
     dcd_table_falling[14] = sim_dutycycledelayctrlin_falling_delay_14;
     dcd_table_falling[15] = sim_dutycycledelayctrlin_falling_delay_15;
     dcd_dly_setting = 0;
     dcd_rising_dly  = 0;
     dcd_falling_dly = 0;
  end
  always @(dutycycledelayctrlin_in)
  begin
     dcd_dly_setting = dutycycledelayctrlin_in;
 	 dcd_rising_dly  = dcd_table_rising[dcd_dly_setting];
 	 dcd_falling_dly = dcd_table_falling[dcd_dly_setting];
  end
  always @(dcd_in)
  begin
     dcd_both_gnd <= dcd_in;
     if (dcd_in === 1'b0)
     begin
         dcd_both_vcc <= #(dcd_falling_dly) dcd_in;
         dcd_fallnrise_gnd <= #(dcd_falling_dly) dcd_in;
         dcd_fallnrise_vcc <= dcd_in;
     end
     else
     begin
         dcd_both_vcc <= #(dcd_rising_dly) dcd_in;
         dcd_fallnrise_gnd <= dcd_in;
         dcd_fallnrise_vcc <= #(dcd_rising_dly) dcd_in;
     end
  end
  assign dcd_both = (delaymode_in === 1'b1) ? dcd_both_vcc : dcd_both_gnd;
  assign dcd_fallnrise = (delaymode_in === 1'b1) ? dcd_fallnrise_vcc : dcd_fallnrise_gnd;
  assign dlyclk_clk = (duty_cycle_delay_mode == "both") ? dcd_both :
                      (duty_cycle_delay_mode == "fallnrise") ? dcd_fallnrise : dcd_in;
  // Output Register clocked by phasectrl_clk
  hardcopyiii_ddr_io_reg  dlyclk_reg(
                        .d(dlyclk_d),
                        .clk(dlyclk_clk),
                        .ena(dlyclk_clkena_in),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(sclr_in),
                        .sload(sload_in),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(dlyclk_q)
                    );
           defparam dlyclk_reg.power_up = power_up;
  // enaoutputcycledelay data path mux - DDIO
  assign ddio_cycledelay_mux_out = (add_output_cycle_delay == "true")  ? ddio_cycledelay_q :
                                   (add_output_cycle_delay == "false") ? ddio_datain_q :
                                   (enaoutputcycledelay_in === 1'b1)   ? ddio_cycledelay_q : ddio_datain_q;
                                   // input register bypass mux
  assign ddio_bypass_input_reg_mux_out = (bypass_input_register == "true") ? datain_in[1] : ddio_cycledelay_mux_out;
  //assign #300 ddio_transfer_q = ddio_cycledelay_mux_out;
  // transfer delay is implemented with negative register in rev1.26
  hardcopyiii_ddr_io_reg  ddio_transferdelay_reg(
                        .d(ddio_bypass_input_reg_mux_out),
                        .clk(~clk_in_mux),
                        .ena(1'b1),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(sclr_in),
                        .sload(sload_in),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(ddio_transfer_q)
                    );
           defparam ddio_transferdelay_reg.power_up = power_up;
  // add phase transfer data path mux
  assign ddio_dlyclk_d = (add_phase_transfer_reg == "true")  ? ddio_transfer_q :
                         (add_phase_transfer_reg == "false") ? ddio_bypass_input_reg_mux_out :
                         (enaphasetransferreg_in === 1'b1)   ? ddio_transfer_q : ddio_bypass_input_reg_mux_out;
  // Output Register clocked by phasectrl_clk
  hardcopyiii_ddr_io_reg  ddio_dlyclk_reg(
                        .d(ddio_dlyclk_d),
                        .clk(dlyclk_clk),
                        .ena(dlyclk_clkena_in),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(sclr_in),
                        .sload(sload_in),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(ddio_dlyclk_q)
                    );
           defparam ddio_dlyclk_reg.power_up = power_up;
  // Extension Register
  assign dlyclk_extended_clk = ~dlyclk_clk;
  hardcopyiii_ddr_io_reg  dlyclk_extended_reg(
                        .d(dlyclk_q),
                        .clk(dlyclk_extended_clk),
                        .ena(dlyclk_clkena_in),
                        .clrn(clrn_in_r),
                        .prn(prn_in_r),
                        .aload(1'b0),
                        .asdata(adatasdata_in),
                        .sclr(sclr_in),
                        .sload(sload_in),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(dlyclk_extended_q)
                    );
           defparam dlyclk_extended_reg.power_up = power_up;
  endmodule