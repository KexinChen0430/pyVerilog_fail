module hardcopyiii_dqs_delay_chain (
 	    dqsin,
 	    delayctrlin,
 	    offsetctrlin,
 	    dqsupdateen,
 	    phasectrlin,
 	    devclrn,
 	    devpor,
 	    dffin,
 	    dqsbusout
 );
 parameter dqs_input_frequency     = "unused" ;    // not used
 parameter use_phasectrlin         = "false";        // rev 1.21
 parameter phase_setting           = 0;              // <0 - 4>
 parameter delay_buffer_mode       = "low";
 parameter dqs_phase_shift         = 0;              // <0..36000> for TAN only
 parameter dqs_offsetctrl_enable   = "false";
 parameter dqs_ctrl_latches_enable = "false";
 // test parameters added in WYS 1.33
 parameter test_enable             = "false";
 parameter test_select             = 0;
 // Simulation parameters
 parameter sim_low_buffer_intrinsic_delay = 350;
 parameter sim_high_buffer_intrinsic_delay = 175;
 parameter sim_buffer_delay_increment      = 10;
 parameter lpm_type           = "hardcopyiii_dqs_delay_chain";
 // INPUT PORTS
 input        dqsin;
 input [5:0]  delayctrlin;
 input [5:0]  offsetctrlin;
 input        dqsupdateen;
 input [2:0]  phasectrlin;
 input        devclrn, devpor;
 // OUTPUT PORTS
 output       dqsbusout;
 output       dffin;       // buried
 // LOCAL_PARAMETERS_BEGIN
 parameter sim_intrinsic_delay = (delay_buffer_mode == "low") ? sim_low_buffer_intrinsic_delay :
                                  sim_high_buffer_intrinsic_delay;
 // LOCAL_PARAMETERS_END
 tri1 devclrn;
 tri1 devpor;
 // decoded counter
 wire [5:0]  delayctrl_bin;
 wire [5:0]  offsetctrl_bin;
 // offsetctrl after "dqs_offsetctrl_enable" mux
 wire [5:0]  offsetctrl_mux;
 // reged outputs of delay count
 reg [5:0]  delayctrl_reg;
 reg [5:0]  offsetctrl_reg;
 // delay count after latch enable mux
 wire [5:0]  delayctrl_reg_mux;
 wire [5:0]  offsetctrl_reg_mux;
 // single cell delay
 integer     tmp_delayctrl;
 integer     tmp_offsetctrl;
 integer     acell_delay;
 integer     aoffsetcell_delay;
 integer     delay_chain_len;
 integer     dqs_delay;
 reg tmp_dqsbusout;
 // Buffer Layer
 wire        dqsin_in;
 wire [5:0]  delayctrlin_in;
 wire [5:0]  offsetctrlin_in;
 wire        dqsupdateen_in;
 wire [2:0]  phasectrlin_in;
 wire [12:0] test_bus;
 wire        test_lpbk;
 wire        tmp_dqsin;  // after and with test_loopback
 assign dqsin_in = dqsin;
 assign delayctrlin_in[5] = (delayctrlin[5] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[4] = (delayctrlin[4] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[3] = (delayctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[2] = (delayctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[1] = (delayctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
 assign delayctrlin_in[0] = (delayctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[5] = (offsetctrlin[5] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[4] = (offsetctrlin[4] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[3] = (offsetctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[2] = (offsetctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[1] = (offsetctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
 assign offsetctrlin_in[0] = (offsetctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
 assign dqsupdateen_in = (dqsupdateen === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[2] = (phasectrlin[2] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[1] = (phasectrlin[1] === 1'b1) ? 1'b1 : 1'b0;
 assign phasectrlin_in[0] = (phasectrlin[0] === 1'b1) ? 1'b1 : 1'b0;
 specify
     (dqsin => dqsbusout) = (0,0);
     $setuphold(posedge dqsupdateen, delayctrlin[0], 0, 0);
 	$setuphold(posedge dqsupdateen, delayctrlin[1], 0, 0);
 	$setuphold(posedge dqsupdateen, delayctrlin[2], 0, 0);
 	$setuphold(posedge dqsupdateen, delayctrlin[3], 0, 0);
 	$setuphold(posedge dqsupdateen, delayctrlin[4], 0, 0);
 	$setuphold(posedge dqsupdateen, delayctrlin[5], 0, 0);
     $setuphold(posedge dqsupdateen, offsetctrlin[0], 0, 0);
 	$setuphold(posedge dqsupdateen, offsetctrlin[1], 0, 0);
 	$setuphold(posedge dqsupdateen, offsetctrlin[2], 0, 0);
 	$setuphold(posedge dqsupdateen, offsetctrlin[3], 0, 0);
 	$setuphold(posedge dqsupdateen, offsetctrlin[4], 0, 0);
 	$setuphold(posedge dqsupdateen, offsetctrlin[5], 0, 0);
 endspecify
 // reg
 initial begin
     delayctrl_reg = 6'b111111;
     offsetctrl_reg = 6'b111111;
     tmp_delayctrl  = 0;
     tmp_offsetctrl = 0;
     acell_delay    = 0;
 end
 always @(posedge dqsupdateen_in)
 begin
     delayctrl_reg  <= delayctrlin_in;
     offsetctrl_reg <= offsetctrl_mux;
 end
 assign offsetctrl_mux = (dqs_offsetctrl_enable == "true") ? offsetctrlin_in : delayctrlin_in;
 // mux after reg
 assign delayctrl_reg_mux  = (dqs_ctrl_latches_enable == "true") ? delayctrl_reg  : delayctrlin_in;
 assign offsetctrl_reg_mux = (dqs_ctrl_latches_enable == "true") ? offsetctrl_reg : offsetctrl_mux;
 // decode
 hardcopyiii_ddr_gray_decoder m_delayctrl_in_dec (delayctrl_reg_mux,  delayctrl_bin);
 hardcopyiii_ddr_gray_decoder m_offsetctrl_in_dec(offsetctrl_reg_mux, offsetctrl_bin);
 always @(delayctrl_bin or offsetctrl_bin or phasectrlin_in)
 begin
     tmp_delayctrl  = (delay_buffer_mode == "high" && delayctrl_bin[5] == 1'b1) ? 31 : delayctrl_bin;
     tmp_offsetctrl = (delay_buffer_mode == "high" && offsetctrl_bin[5] == 1'b1) ? 31 : offsetctrl_bin;
     // cell
     acell_delay = sim_intrinsic_delay + tmp_delayctrl * sim_buffer_delay_increment;
     if (dqs_offsetctrl_enable == "true")
         aoffsetcell_delay = sim_intrinsic_delay + tmp_offsetctrl * sim_buffer_delay_increment;
     else
         aoffsetcell_delay = acell_delay;
     // no of cells
     if (use_phasectrlin == "false")
         delay_chain_len = phase_setting;
     else if (phasectrlin_in[2] === 1'b1)
         delay_chain_len = 0;
     else
         delay_chain_len = phasectrlin_in + 3'b001;
     // total delay
     if (delay_chain_len == 0)
         dqs_delay = 0;
     else
         dqs_delay = (delay_chain_len - 1)*acell_delay + aoffsetcell_delay;
 end
 // test bus loopback
 assign test_bus  = {~dqsupdateen_in, offsetctrl_reg_mux, delayctrl_reg_mux};
 assign test_lpbk = (0 <= test_select && test_select <= 12) ? test_bus[test_select] : 1'bz;
 assign tmp_dqsin = (test_enable == "true") ? (test_lpbk & dqsin_in) : dqsin_in;
 always @(tmp_dqsin)
     tmp_dqsbusout <= #(dqs_delay) tmp_dqsin;
 pmos (dqsbusout, tmp_dqsbusout, 1'b0);
 endmodule