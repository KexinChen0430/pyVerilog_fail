module arriaiigz_termination (
	rup,rdn,terminationclock,terminationclear,terminationenable,
	serializerenable,terminationcontrolin,
	scanin, scanen,
	otherserializerenable,
	devclrn,devpor,
	incrup,incrdn,
	serializerenableout,
	terminationcontrol,terminationcontrolprobe,
	scanout,
	shiftregisterprobe
);
parameter runtime_control = "false";
parameter allow_serial_data_from_core = "false";
parameter power_down = "true";
parameter test_mode = "false";
parameter enable_parallel_termination = "false";
parameter enable_calclk_divider= "false";  // replaced by below to remove
parameter clock_divider_enable = "false";
parameter enable_pwrupmode_enser_for_usrmode = "false"; // to remove
parameter bypass_enser_logic   = "false";               // to remove
parameter bypass_rt_calclk     = "false";  //RTEST3
parameter enable_rt_scan_mode  = "false";               // to remove
parameter enable_loopback      = "false";
parameter force_rtcalen_for_pllbiasen = "false";
parameter enable_rt_sm_loopback       = "false"; // RTEST4
parameter select_vrefl_values         = 0;
parameter select_vrefh_values         = 0;
parameter divide_intosc_by            = 2;
parameter use_usrmode_clear_for_configmode = "false";
parameter lpm_type = "arriaiigz_termination";
input       rup;
input       rdn;
input       terminationclock;
input       terminationclear;
input       terminationenable;
input       serializerenable;           // ENSERUSR
input       terminationcontrolin;
input       scanin;                                     // to remove
input       scanen;
input [8:0] otherserializerenable;
input       devclrn;
input       devpor;
output incrup;
output incrdn;
output serializerenableout;
output terminationcontrol;
output terminationcontrolprobe;
output shiftregisterprobe;
output scanout;
tri1 devclrn;
tri1 devpor;
// HW outputs
wire compout_rup_core, compout_rdn_core;
wire ser_data_io, ser_data_core;
// HW inputs
wire usr_clk, cal_clk, rscal_clk, cal_clken, cal_nclr;
// gated user control
reg  enserusr_reg, clkenusr_reg, nclrusr_reg;  // registered by neg clk
wire enserusr_gated;                           // (enserusr & !clkenusr) - for P2S, S2P to shift
wire clkenusr_gated;                           // (enserusr & clkenusr) - for calibration
wire nclrusr_gated;                            // (enserusr | nclrusr): enserusr = 1 forces no clear
// clk divider
wire clkdiv_out;
// generating calclk and clkenout - 1 cycle latency
reg calclken_reg;
//wire clkenout;
// legality check on enser
reg  enser_checked;
// Shift Register
reg [6:0]  sreg_bit_out;
reg        sreg_bit_BIT_0;
reg        sreg_vshift_bit_out;
reg        sreg_bit0_next;
reg        sreg_vshift_bit_tmp;
reg        sreg_rscaldone_prev, sreg_rscaldone_prev1, sregn_rscaldone_out;
reg        sreg_bit6_prev;
// nreg before SA-ADC
wire       regn_rup_in, regn_rdn_in;
reg [6:0]  regn_compout_rup, regn_compout_rdn;
reg        regn_compout_rup_extra, regn_compout_rdn_extra; // extra is bit[8] accomodate last move
// SA-ADC
wire [6:0] sa_octcaln_out_tmp;       // this + _extra ==> code
wire [6:0] sa_octcalp_out_tmp;
wire [6:0] sa_octcaln_out_tmp_extra;
wire [6:0] sa_octcalp_out_tmp_extra;
wire [6:0] sa_octcaln_out;  // RUP - NMOS
wire [6:0] sa_octcalp_out;  // RDN - PMOS
wire [6:0] sa_octcaln_in, sa_octcalp_in;
// ENSER
wire       enser_out;
wire       enser_gen_out;
reg [5:0]  enser_cnt;
reg        enser_gen_usr_out;
// RT State Machine
wire       rtsm_rup_in, rtsm_rdn_in;
wire       rtsm_rtena_in, rtsm_rscaldone_in;
wire       rtsm_caldone_out;
wire [3:0] rtsm_rtoffsetp_out, rtsm_rtoffsetn_out;
wire [2:0] rtsm_sel_rup_vref_out, rtsm_sel_rdn_vref_out;
// RT State Machine Scan Chain
wire       rtsm_sc_clk;
wire       rtsm_sc_in;
reg  [17:0] rtsm_sc_out_reg;
wire [17:0] rtsm_sc_out_reg_d;
wire [17:0] rtsm_sc_lpbk_mux;
// RT Adder/Sub
wire [6:0] rtas_rs_rpcdp_in, rtas_rs_rpcdn_in;
wire [6:0] rtas_rtoffsetp_in, rtas_rtoffsetn_in;
wire [6:0] rtas_rs_rpcdp_out, rtas_rs_rpcdn_out;
wire [6:0] rtas_rt_rpcdp_out, rtas_rt_rpcdn_out;
// P2S
wire [6:0] p2s_rs_rpcdp_in, p2s_rs_rpcdn_in;
wire [6:0] p2s_rt_rpcdp_in, p2s_rt_rpcdn_in;
wire       p2s_ser_data_out;
wire       p2s_clk_ser_data;
reg        p2s_enser_reg;
wire [27:0] p2s_parallel_code;
wire [27:0] p2s_shift_d;
reg [27:0] p2s_shift_regs;
// timing
wire       rup_ipd;
wire       rdn_ipd;
wire       terminationclock_ipd;
wire       terminationclear_ipd;
wire       terminationenable_ipd;
wire       serializerenable_ipd;
wire       terminationcontrolin_ipd;
wire [8:0] otherserializerenable_ipd;
// primary outputs
assign incrup = (enable_loopback == "true") ? terminationenable_ipd : compout_rup_core;
assign incrdn = (enable_loopback == "true") ? terminationclear_ipd  : compout_rdn_core;
assign serializerenableout     = (enable_loopback == "true") ? serializerenable : enser_gen_usr_out;
assign terminationcontrol      = ser_data_io;
assign terminationcontrolprobe = (enable_loopback == "true") ? serializerenable_ipd : ser_data_core;
assign shiftregisterprobe      = (enable_loopback == "true") ? terminationclock_ipd : sreg_vshift_bit_out;
// disabled comparator when calibration is not enabled
assign compout_rup_core = (calclken_reg === 1'b1) ? rup : 1'bx;
assign compout_rdn_core = (calclken_reg === 1'b1) ? rdn : 1'bx;
assign ser_data_io   = (allow_serial_data_from_core == "true") ? terminationcontrolin : p2s_ser_data_out;
assign ser_data_core = p2s_ser_data_out;
// primary inputs
assign usr_clk   = terminationclock_ipd;
// gating the enserusr, clken and nclrusr ----------------------------------------------------
initial begin
    enserusr_reg = 1'b0;
    clkenusr_reg = 1'b0;
    nclrusr_reg  = 1'b1;
end
always @(negedge usr_clk)
begin
    if (serializerenable_ipd === 1'b1)
       enserusr_reg <= 1'b1;
    else
       enserusr_reg <= 1'b0;
    if (terminationenable_ipd === 1'b1)
        clkenusr_reg <= 1'b1;
    else
        clkenusr_reg <= 1'b0;
    if (terminationclear_ipd === 1'b1)  // active low to high
        nclrusr_reg  <= 1'b0;
    else
        nclrusr_reg  <= 1'b1;
end
assign enserusr_gated = enserusr_reg & ~clkenusr_reg;  // code transfer (P2S and S2P)
assign clkenusr_gated = enserusr_reg & clkenusr_reg;   // calibration
assign nclrusr_gated  = enserusr_reg | nclrusr_reg;    // active low
// clk divider ----------------------------------------------------------------
arriaiigz_termination_aux_clock_div m_gen_calclk (
    .clk(usr_clk),
    .reset(~clkenusr_gated),
    .clkout(clkdiv_out));
defparam m_gen_calclk.clk_divide_by = 20; // user clock is of 20 Mhz updated from 100;
defparam m_gen_calclk.extra_latency = 4;  // 5th rising edge after reset
// generating clkenout - a registered version of clkensur_gated ---------------
initial calclken_reg = 1'b0;
always @(negedge clkdiv_out or negedge clkenusr_gated)
begin
    if (clkenusr_gated == 1'b0)
        calclken_reg <= 1'b0;
    else
        calclken_reg <= 1'b1;
end
//assign clkenout = calclken_reg;
// generating cal_clkout - 1 cycle latency of divided clock     ---------------
assign cal_clk   = calclken_reg & clkdiv_out;
assign cal_nclr  = nclrusr_gated;   // active low
assign cal_clken = clkenusr_gated;
assign rscal_clk = cal_clk & (~sregn_rscaldone_out);
// legality check on enser
initial begin
    enser_checked = 1'b0;
end
always @(posedge usr_clk)
begin
    if (serializerenable === 1'b1 && terminationenable === 1'b0)
    begin
        if (otherserializerenable[0] === 1'b1 || otherserializerenable[1] === 1'b1 ||
            otherserializerenable[2] === 1'b1 || otherserializerenable[3] === 1'b1 ||
            otherserializerenable[4] === 1'b1 || otherserializerenable[5] === 1'b1 ||
            otherserializerenable[6] === 1'b1 || otherserializerenable[7] === 1'b1 ||
            otherserializerenable[8] === 1'b1)
        begin
            if (enser_checked === 1'b0)
            begin
            	$display ("Warning: serializizerable and some bits of otherserializerenable are asserted at time %t ps. This is not allowed in hardware data transfer time", $realtime);
            	$display ("Time: %0t  Instance: %m", $time);
            	enser_checked <= 1'b1;
            end
        end
        else
        begin
            enser_checked <= 1'b0;  // for another check
        end
    end
    else
    begin
        enser_checked <= 1'b0;  // for another check
    end
end
// SHIFT regiter
// ICD BIT_7 .. BIT_1 ===> sreg_bit_out[6..0];
// ICD BIT_0          ===> sreg_bit_BIT_0;
initial begin
    sreg_bit6_prev           = 1'b1;
    sreg_bit_out             = 6'b000000;
    sreg_bit0_next           = 1'b0;
    sreg_bit_BIT_0           = 1'b0;
    sreg_vshift_bit_tmp      = 1'b0;
    sreg_vshift_bit_out      = 1'b0;        // sending to shiftreg_probe
    sregn_rscaldone_out      = 1'b0;
    sreg_rscaldone_prev      = 1'b0;
    sreg_rscaldone_prev1     = 1'b0;
end
always @(posedge rscal_clk or negedge cal_nclr)
begin
    if (cal_nclr == 1'b0)
    begin
        sreg_bit6_prev           <= 1'b1;
        sreg_bit_out             <= 6'b000000;
        sreg_bit0_next           <= 1'b0;
        sreg_bit_BIT_0           <= 1'b0;
        sreg_vshift_bit_tmp      <= 1'b0;
        sreg_vshift_bit_out      <= 1'b0;
        sreg_rscaldone_prev      <= 1'b0;
        sreg_rscaldone_prev1     <= 1'b0;
    end
    else if (cal_clken == 1'b1)
    begin
        sreg_bit_out[6] <= sreg_bit6_prev;
        sreg_bit_out[5:0]   <= sreg_bit_out[6:1];
        sreg_bit0_next  <= sreg_bit_out[0];    // extra latency for ICD BIT_0
        sreg_bit_BIT_0  <= sreg_bit0_next;
        sreg_vshift_bit_tmp <= sreg_bit_out[0];
        sreg_vshift_bit_out <= sreg_bit_out[0] | sreg_vshift_bit_tmp;
        sreg_bit6_prev  <= 1'b0;
    end
    // might falling outside of 10 cycles
    if (sreg_vshift_bit_tmp == 1'b1)
        sreg_rscaldone_prev  <= 1'b1;
    sreg_rscaldone_prev1 <= sreg_rscaldone_prev;
end
always @(negedge rscal_clk or negedge cal_nclr)
begin
    if (cal_nclr == 1'b0)
        sregn_rscaldone_out <= 1'b0;
    else // if (cal_clken == 1'b1) - outside of 10 cycles
    begin
        if (sreg_rscaldone_prev1 == 1'b1 && sregn_rscaldone_out == 1'b0)
            sregn_rscaldone_out <= 1'b1;
    end
end
// nreg and SA-ADC:
//    RDN_vol < ref_voltage < RUP_voltage
//    after reset, ref_voltage=VCCN/2; after ref_voltage_shift, ref_voltage=neighbor(VCCN/2)
//    at 0 code, RUP=VCCN so voltage_compare_out for RUP = 0
//               RDN=GND  so voltage compare out for RDN = 0
assign regn_rup_in = rup;
assign regn_rdn_in = ~rdn;   // inverted --------------------------
initial begin
    regn_compout_rup = 6'b00000;
    regn_compout_rdn = 6'b00000;
    regn_compout_rup_extra = 1'b0;
    regn_compout_rdn_extra = 1'b0;
end
always @(negedge rscal_clk or negedge cal_nclr)
begin
    if (cal_nclr == 1'b0)
    begin
        regn_compout_rup <= 6'b00000;
        regn_compout_rdn <= 6'b00000;
        regn_compout_rup_extra <= 1'b0;
        regn_compout_rdn_extra <= 1'b0;
    end
    else
    begin
        // rup
        if (sreg_bit_BIT_0 == 1'b1)
            regn_compout_rup_extra <= regn_rup_in;
        if (sreg_bit_out[0] == 1'b1)
            regn_compout_rup[0] <= regn_rup_in;
        if (sreg_bit_out[1] == 1'b1)
            regn_compout_rup[1] <= regn_rup_in;
        if (sreg_bit_out[2] == 1'b1)
            regn_compout_rup[2] <= regn_rup_in;
        if (sreg_bit_out[3] == 1'b1)
            regn_compout_rup[3] <= regn_rup_in;
        if (sreg_bit_out[4] == 1'b1)
            regn_compout_rup[4] <= regn_rup_in;
        if (sreg_bit_out[5] == 1'b1)
            regn_compout_rup[5] <= regn_rup_in;
        if (sreg_bit_out[6] == 1'b1)
            regn_compout_rup[6] <= regn_rup_in;
        // rdn
        if (sreg_bit_BIT_0 == 1'b1)
            regn_compout_rdn_extra <= regn_rdn_in;
        if (sreg_bit_out[0] == 1'b1)
            regn_compout_rdn[0] <= regn_rdn_in;
        if (sreg_bit_out[1] == 1'b1)
            regn_compout_rdn[1] <= regn_rdn_in;
        if (sreg_bit_out[2] == 1'b1)
            regn_compout_rdn[2] <= regn_rdn_in;
        if (sreg_bit_out[3] == 1'b1)
            regn_compout_rdn[3] <= regn_rdn_in;
        if (sreg_bit_out[4] == 1'b1)
            regn_compout_rdn[4] <= regn_rdn_in;
        if (sreg_bit_out[5] == 1'b1)
            regn_compout_rdn[5] <= regn_rdn_in;
        if (sreg_bit_out[6] == 1'b1)
            regn_compout_rdn[6] <= regn_rdn_in;
    end
end
assign sa_octcaln_in = sreg_bit_out;
assign sa_octcalp_in = sreg_bit_out;
// RUP - octcaln_in == 1 = (pin_voltage < ref_voltage): clear the bit setting
assign sa_octcaln_out_tmp_extra = (cal_nclr == 1'b0) ? 1'b0 :
                                  (sreg_bit_BIT_0 == 1'b1) ? 1'b1: regn_compout_rup_extra;
assign sa_octcaln_out_tmp[0] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[0] == 1'b1) ? 1'b1: regn_compout_rup[0];
assign sa_octcaln_out_tmp[1] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[1] == 1'b1) ? 1'b1: regn_compout_rup[1];
assign sa_octcaln_out_tmp[2] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[2] == 1'b1) ? 1'b1: regn_compout_rup[2];
assign sa_octcaln_out_tmp[3] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[3] == 1'b1) ? 1'b1: regn_compout_rup[3];
assign sa_octcaln_out_tmp[4] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[4] == 1'b1) ? 1'b1: regn_compout_rup[4];
assign sa_octcaln_out_tmp[5] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[5] == 1'b1) ? 1'b1: regn_compout_rup[5];
assign sa_octcaln_out_tmp[6] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcaln_in[6] == 1'b1) ? 1'b1: regn_compout_rup[6];
// RDN - octcalp_in == 1 = (pin_voltage > ref_voltage): clear the bit setting
assign sa_octcalp_out_tmp_extra = (cal_nclr == 1'b0) ? 1'b0 :
                                  (sreg_bit_BIT_0 == 1'b1) ? 1'b1: regn_compout_rdn_extra;
assign sa_octcalp_out_tmp[0] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[0] == 1'b1) ? 1'b1: regn_compout_rdn[0];
assign sa_octcalp_out_tmp[1] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[1] == 1'b1) ? 1'b1: regn_compout_rdn[1];
assign sa_octcalp_out_tmp[2] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[2] == 1'b1) ? 1'b1: regn_compout_rdn[2];
assign sa_octcalp_out_tmp[3] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[3] == 1'b1) ? 1'b1: regn_compout_rdn[3];
assign sa_octcalp_out_tmp[4] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[4] == 1'b1) ? 1'b1: regn_compout_rdn[4];
assign sa_octcalp_out_tmp[5] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[5] == 1'b1) ? 1'b1: regn_compout_rdn[5];
assign sa_octcalp_out_tmp[6] = (cal_nclr == 1'b0) ? 1'b0 :
                           (sa_octcalp_in[6] == 1'b1) ? 1'b1: regn_compout_rdn[6];
assign sa_octcaln_out = sa_octcaln_out_tmp + sa_octcaln_out_tmp_extra;
assign sa_octcalp_out = sa_octcalp_out_tmp + sa_octcalp_out_tmp_extra;
// ENSER
assign enser_out = (runtime_control == "true") ? enser_gen_usr_out : enser_gen_out;
// user mode
initial enser_gen_usr_out = 1'b0;
always @(negedge usr_clk)
begin
    enser_gen_usr_out <= serializerenable;
end
// for powerup mode
assign enser_gen_out = (enser_cnt > 6'd00 && enser_cnt < 6'd31) ? 1'b1 : 1'b0;
initial begin
    enser_cnt = 'b0;
end
always @(posedge usr_clk or posedge sregn_rscaldone_out)
begin
    if (sregn_rscaldone_out == 1'b0)
        enser_cnt <= 6'b000000;
    else if (enser_cnt < 6'd63)
        enser_cnt <= enser_cnt + 6'b000001;
end
// RT SM
assign rtsm_rup_in = rup;
assign rtsm_rdn_in = rdn;
assign rtsm_rtena_in = (enable_parallel_termination == "true") ? 1'b1 : 1'b0;
assign rtsm_rscaldone_in = sregn_rscaldone_out;
arriaiigz_rt_sm m_rt_sm(
	.rup(rtsm_rup_in),
	.rdn(rtsm_rdn_in),
	.clk(cal_clk),
	.clken(cal_clken),
	.clr(~cal_nclr),
	.rtena(rtsm_rtena_in),
	.rscaldone(rtsm_rscaldone_in),
	.rtoffsetp(rtsm_rtoffsetp_out),
	.rtoffsetn(rtsm_rtoffsetn_out),
	.caldone(rtsm_caldone_out),
	.sel_rup_vref(rtsm_sel_rup_vref_out),
	.sel_rdn_vref(rtsm_sel_rdn_vref_out)
);
// RT State Machine Scan Chain
initial rtsm_sc_out_reg = 'b0;
assign rtsm_sc_clk = (bypass_rt_calclk == "true") ? cal_clk : cal_clk; // : rtcal_clk
assign rtsm_sc_in = terminationcontrolin_ipd;
//TEST4&RTEST3 not implemented  - requires identical RT_SM
assign rtsm_sc_lpbk_mux = (bypass_rt_calclk == "true" && enable_rt_sm_loopback == "true") ?
                          18'bx : 18'bx;
assign rtsm_sc_out_reg_d[17] = (bypass_rt_calclk == "true" && scanen === 1'b0) ? rtsm_sc_in
                              : rtsm_sc_lpbk_mux[17];
assign rtsm_sc_out_reg_d[16:0] = (bypass_rt_calclk == "true" && scanen === 1'b0) ? rtsm_sc_out_reg[17:1]
                              : rtsm_sc_lpbk_mux[16:0];
assign scanout = rtsm_sc_out_reg[0];
always @(posedge rtsm_sc_clk or negedge cal_nclr)
begin
    if (cal_nclr == 1'b0)
        rtsm_sc_out_reg <= 'b0;
    else
        rtsm_sc_out_reg <= rtsm_sc_out_reg_d;
end
// RT Adder/Sub
assign rtas_rs_rpcdp_in = sa_octcalp_out;
assign rtas_rs_rpcdn_in = sa_octcaln_out;
assign rtas_rtoffsetp_in = {4'b0000, rtsm_rtoffsetp_out[2:0]};
assign rtas_rtoffsetn_in = {4'b0000, rtsm_rtoffsetn_out[2:0]};
assign rtas_rs_rpcdp_out = rtas_rs_rpcdp_in;
assign rtas_rs_rpcdn_out = rtas_rs_rpcdn_in;
assign  rtas_rt_rpcdn_out = (rtsm_rtoffsetn_out[3] == 1'b0) ? (rtas_rs_rpcdn_in + rtas_rtoffsetn_in) :
                            (rtas_rs_rpcdn_in - rtas_rtoffsetn_in);
assign  rtas_rt_rpcdp_out = (rtsm_rtoffsetp_out[3] == 1'b0) ? (rtas_rs_rpcdp_in + rtas_rtoffsetp_in) :
                            (rtas_rs_rpcdp_in - rtas_rtoffsetp_in);
// P2S ------------------------------------------------------------------------
// during calibration - enser_reg = 0
//       caldone generating a rising pulse on clk_ser_data: shift_regs read in D (parallel_load)
// during serial shift - enser_reg = 1 for 28 cycles
//       28-bit are barrel-shifting
assign p2s_rs_rpcdp_in = rtas_rs_rpcdp_out;
assign p2s_rs_rpcdn_in = rtas_rs_rpcdn_out;
assign p2s_rt_rpcdp_in = rtas_rt_rpcdp_out;
assign p2s_rt_rpcdn_in = rtas_rt_rpcdn_out;
// serial shift clock
assign p2s_clk_ser_data = (enserusr_gated === 1'b1) ? (~usr_clk) :  // serial mode
                          (calclken_reg === 1'b1) ? (rtsm_caldone_out & sregn_rscaldone_out) : 1'b1; // one pulse for pload
// load D of shift register through - mux selection enser_reg
initial p2s_enser_reg = 1'b1; // load parallel code into D of shift reg - cleared by pllbiasen
always @(negedge usr_clk)
begin
    p2s_enser_reg <= ~calclken_reg;
end
assign p2s_parallel_code = {p2s_rs_rpcdp_in,p2s_rs_rpcdn_in,p2s_rt_rpcdp_in,p2s_rt_rpcdn_in};
assign p2s_shift_d = (p2s_enser_reg === 1'b1) ? {p2s_shift_regs[26:0], p2s_shift_regs[27]} : p2s_parallel_code;
// shifting - cleared by PLLBIASEN
initial p2s_shift_regs = 'b0;
always @(posedge p2s_clk_ser_data)
begin
    p2s_shift_regs <= p2s_shift_d;
end
assign p2s_ser_data_out = (enserusr_gated === 1'b1) ? p2s_shift_regs[27] : 1'bx;
// timing - input path
buf        buf_rup_ipd (rup_ipd,rup);
buf        buf_rdn_ipd (rdn_ipd,rdn);
buf        buf_terminationclock_ipd (terminationclock_ipd,terminationclock);
buf        buf_terminationclear_ipd (terminationclear_ipd,terminationclear);
buf        buf_terminationenable_ipd (terminationenable_ipd, terminationenable);
buf        buf_serializerenable_ipd (serializerenable_ipd,serializerenable);
buf        buf_terminationcontrolin_ipd (terminationcontrolin_ipd,terminationcontrolin);
buf        buf_otherserializerenable_ipd [8:0] (otherserializerenable_ipd,otherserializerenable);
endmodule