module  amm_master_qsys_with_pcie_pcie_ip_altgx_internal_alt_c3gxb_6ni8
	(
	cal_blk_clk,
	fixedclk,
	gxb_powerdown,
	hip_tx_clkout,
	pipe8b10binvpolarity,
	pipedatavalid,
	pipeelecidle,
	pipephydonestatus,
	pipestatus,
	pll_areset,
	pll_inclk,
	pll_locked,
	powerdn,
	reconfig_clk,
	reconfig_fromgxb,
	reconfig_togxb,
	rx_analogreset,
	rx_ctrldetect,
	rx_datain,
	rx_dataout,
	rx_digitalreset,
	rx_elecidleinfersel,
	rx_freqlocked,
	rx_patterndetect,
	rx_syncstatus,
	tx_clkout,
	tx_ctrlenable,
	tx_datain,
	tx_dataout,
	tx_detectrxloop,
	tx_digitalreset,
	tx_forcedispcompliance,
	tx_forceelecidle) /* synthesis synthesis_clearbox=2 */;
	input   cal_blk_clk;
	input   fixedclk;
	input   [0:0]  gxb_powerdown;
	output   [0:0]  hip_tx_clkout;
	input   [0:0]  pipe8b10binvpolarity;
	output   [0:0]  pipedatavalid;
	output   [0:0]  pipeelecidle;
	output   [0:0]  pipephydonestatus;
	output   [2:0]  pipestatus;
	input   [0:0]  pll_areset;
	input   [0:0]  pll_inclk;
	output   [0:0]  pll_locked;
	input   [1:0]  powerdn;
	input   reconfig_clk;
	output   [4:0]  reconfig_fromgxb;
	input   [3:0]  reconfig_togxb;
	input   [0:0]  rx_analogreset;
	output   [0:0]  rx_ctrldetect;
	input   [0:0]  rx_datain;
	output   [7:0]  rx_dataout;
	input   [0:0]  rx_digitalreset;
	input   [2:0]  rx_elecidleinfersel;
	output   [0:0]  rx_freqlocked;
	output   [0:0]  rx_patterndetect;
	output   [0:0]  rx_syncstatus;
	output   [0:0]  tx_clkout;
	input   [0:0]  tx_ctrlenable;
	input   [7:0]  tx_datain;
	output   [0:0]  tx_dataout;
	input   [0:0]  tx_detectrxloop;
	input   [0:0]  tx_digitalreset;
	input   [0:0]  tx_forcedispcompliance;
	input   [0:0]  tx_forceelecidle;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   cal_blk_clk;
	tri0   fixedclk;
	tri0   [0:0]  gxb_powerdown;
	tri0   [0:0]  pipe8b10binvpolarity;
	tri0   [0:0]  pll_areset;
	tri0   [1:0]  powerdn;
	tri0   reconfig_clk;
	tri0   [0:0]  rx_analogreset;
	tri0   [0:0]  rx_digitalreset;
	tri0   [2:0]  rx_elecidleinfersel;
	tri0   [0:0]  tx_ctrlenable;
	tri0   [7:0]  tx_datain;
	tri0   [0:0]  tx_detectrxloop;
	tri0   [0:0]  tx_digitalreset;
	tri0   [0:0]  tx_forcedispcompliance;
	tri0   [0:0]  tx_forceelecidle;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	parameter	starting_channel_number = 0;
	wire  [5:0]   wire_pll0_clk;
	wire  wire_pll0_fref;
	wire  wire_pll0_icdrclk;
	wire  wire_pll0_locked;
	wire  wire_cal_blk0_nonusertocmu;
	wire  wire_cent_unit0_dpriodisableout;
	wire  wire_cent_unit0_dprioout;
	wire  wire_cent_unit0_quadresetout;
	wire  [3:0]   wire_cent_unit0_rxanalogresetout;
	wire  [3:0]   wire_cent_unit0_rxcrupowerdown;
	wire  [3:0]   wire_cent_unit0_rxdigitalresetout;
	wire  [3:0]   wire_cent_unit0_rxibpowerdown;
	wire  [1599:0]   wire_cent_unit0_rxpcsdprioout;
	wire  [1199:0]   wire_cent_unit0_rxpmadprioout;
	wire  [3:0]   wire_cent_unit0_txanalogresetout;
	wire  [3:0]   wire_cent_unit0_txdetectrxpowerdown;
	wire  [3:0]   wire_cent_unit0_txdigitalresetout;
	wire  [3:0]   wire_cent_unit0_txdividerpowerdown;
	wire  [3:0]   wire_cent_unit0_txobpowerdown;
	wire  [599:0]   wire_cent_unit0_txpcsdprioout;
	wire  [1199:0]   wire_cent_unit0_txpmadprioout;
	wire  wire_receive_pcs0_cdrctrlearlyeios;
	wire  wire_receive_pcs0_cdrctrllocktorefclkout;
	wire  [399:0]   wire_receive_pcs0_dprioout;
	wire  [8:0]   wire_receive_pcs0_hipdataout;
	wire  wire_receive_pcs0_hipdatavalid;
	wire  wire_receive_pcs0_hipelecidle;
	wire  wire_receive_pcs0_hipphydonestatus;
	wire  [2:0]   wire_receive_pcs0_hipstatus;
	wire  [19:0]   wire_receive_pcs0_revparallelfdbkdata;
	wire  [7:0]   wire_receive_pma0_analogtestbus;
	wire  wire_receive_pma0_clockout;
	wire  wire_receive_pma0_diagnosticlpbkout;
	wire  [299:0]   wire_receive_pma0_dprioout;
	wire  wire_receive_pma0_freqlocked;
	wire  wire_receive_pma0_locktorefout;
	wire  [9:0]   wire_receive_pma0_recoverdataout;
	wire  wire_receive_pma0_reverselpbkout;
	wire  wire_receive_pma0_signaldetect;
	wire  wire_transmit_pcs0_clkout;
	wire  [9:0]   wire_transmit_pcs0_dataout;
	wire  [149:0]   wire_transmit_pcs0_dprioout;
	wire  wire_transmit_pcs0_forceelecidleout;
	wire  [2:0]   wire_transmit_pcs0_grayelecidleinferselout;
	wire  wire_transmit_pcs0_hiptxclkout;
	wire  wire_transmit_pcs0_pipeenrevparallellpbkout;
	wire  [1:0]   wire_transmit_pcs0_pipepowerdownout;
	wire  [3:0]   wire_transmit_pcs0_pipepowerstateout;
	wire  wire_transmit_pcs0_txdetectrx;
	wire  wire_transmit_pma0_clockout;
	wire  wire_transmit_pma0_dataout;
	wire  [299:0]   wire_transmit_pma0_dprioout;
	wire  wire_transmit_pma0_rxdetectvalidout;
	wire  wire_transmit_pma0_rxfoundout;
	wire  wire_transmit_pma0_seriallpbkout;
	reg	[0:0]	fixedclk_div;
	reg	[1:0]	reconfig_togxb_busy_reg;
	wire cal_blk_powerdown;
	wire  [0:0]  cent_unit_quadresetout;
	wire  [3:0]  cent_unit_rxcrupowerdn;
	wire  [3:0]  cent_unit_rxibpowerdn;
	wire  [1599:0]  cent_unit_rxpcsdprioin;
	wire  [1599:0]  cent_unit_rxpcsdprioout;
	wire  [1199:0]  cent_unit_rxpmadprioin;
	wire  [1199:0]  cent_unit_rxpmadprioout;
	wire  [599:0]  cent_unit_tx_dprioin;
	wire  [3:0]  cent_unit_txdetectrxpowerdn;
	wire  [3:0]  cent_unit_txdividerpowerdown;
	wire  [599:0]  cent_unit_txdprioout;
	wire  [3:0]  cent_unit_txobpowerdn;
	wire  [1199:0]  cent_unit_txpmadprioin;
	wire  [1199:0]  cent_unit_txpmadprioout;
	wire  [0:0]  fixedclk_div_in;
	wire  [0:0]  fixedclk_enable;
	wire [3:0]  fixedclk_fast;
	wire  [0:0]  fixedclk_sel;
	wire  [3:0]  fixedclk_to_cmu;
	wire  [0:0]  int_pipeenrevparallellpbkfromtx;
	wire  [0:0]  nonusertocmu_out;
	wire  [0:0]  pipedatavalid_out;
	wire  [0:0]  pipeelecidle_out;
	wire [0:0]  pll_powerdown;
	wire  [0:0]  reconfig_togxb_busy;
	wire  [0:0]  reconfig_togxb_disable;
	wire  [0:0]  reconfig_togxb_in;
	wire  [0:0]  reconfig_togxb_load;
	wire  [0:0]  refclk_pma;
	wire  [3:0]  rx_analogreset_in;
	wire  [3:0]  rx_analogreset_out;
	wire  [0:0]  rx_deserclock_in;
	wire  [3:0]  rx_digitalreset_in;
	wire  [3:0]  rx_digitalreset_out;
	wire [0:0]  rx_enapatternalign;
	wire [0:0]  rx_locktodata;
	wire  [0:0]  rx_locktorefclk_wire;
	wire  [7:0]  rx_out_wire;
	wire  [1:0]  rx_pcs_rxfound_wire;
	wire  [1599:0]  rx_pcsdprioin_wire;
	wire  [1599:0]  rx_pcsdprioout;
	wire [0:0]  rx_phfifordenable;
	wire [0:0]  rx_phfiforeset;
	wire [0:0]  rx_phfifowrdisable;
	wire  [0:0]  rx_pll_pfdrefclkout_wire;
	wire  [4:0]  rx_pma_analogtestbus;
	wire  [0:0]  rx_pma_clockout;
	wire  [9:0]  rx_pma_recoverdataout_wire;
	wire  [1199:0]  rx_pmadprioin_wire;
	wire  [1199:0]  rx_pmadprioout;
	wire [0:0]  rx_powerdown;
	wire  [3:0]  rx_powerdown_in;
	wire [0:0]  rx_prbscidenable;
	wire  [0:0]  rx_reverselpbkout;
	wire  [19:0]  rx_revparallelfdbkdata;
	wire [0:0]  rx_rmfiforeset;
	wire  [0:0]  rx_signaldetect_wire;
	wire  [3:0]  tx_analogreset_out;
	wire  [0:0]  tx_clkout_int_wire;
	wire  [0:0]  tx_core_clkout_wire;
	wire  [7:0]  tx_datain_wire;
	wire  [9:0]  tx_dataout_pcs_to_pma;
	wire  [0:0]  tx_diagnosticlpbkin;
	wire  [3:0]  tx_digitalreset_in;
	wire  [3:0]  tx_digitalreset_out;
	wire  [599:0]  tx_dprioin_wire;
	wire [0:0]  tx_invpolarity;
	wire  [0:0]  tx_localrefclk;
	wire  [0:0]  tx_pcs_forceelecidleout;
	wire [0:0]  tx_phfiforeset;
	wire  [1:0]  tx_pipepowerdownout;
	wire  [3:0]  tx_pipepowerstateout;
	wire  [0:0]  tx_pma_fastrefclk0in;
	wire  [0:0]  tx_pma_refclk0in;
	wire  [0:0]  tx_pma_refclk0inpulse;
	wire  [1199:0]  tx_pmadprioin_wire;
	wire  [1199:0]  tx_pmadprioout;
	wire [0:0]  tx_revparallellpbken;
	wire  [0:0]  tx_rxdetectvalidout;
	wire  [0:0]  tx_rxfoundout;
	wire  [0:0]  tx_serialloopbackout;
	wire  [599:0]  tx_txdprioout;
	wire  [0:0]  txdataout;
	wire  [0:0]  txdetectrxout;
	wire  [0:0]  w_cent_unit_dpriodisableout1w;
	altpll   pll0
	(
	.activeclock(),
	.areset((pll_areset[0] | pll_powerdown[0])),
	.clk(wire_pll0_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.extclk(),
	.fbout(),
	.fref(wire_pll0_fref),
	.icdrclk(wire_pll0_icdrclk),
	.inclk({{1{1'b0}}, pll_inclk[0]}),
	.locked(wire_pll0_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.sclkout0(),
	.sclkout1(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkena({6{1'b1}}),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.extclkena({4{1'b1}}),
	.fbin(1'b1),
	.pfdena(1'b1),
	.phasecounterselect({4{1'b1}}),
	.phasestep(1'b1),
	.phaseupdown(1'b1),
	.pllena(1'b1),
	.scanaclr(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0),
	.scanread(1'b0),
	.scanwrite(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		pll0.bandwidth_type = "AUTO",
		pll0.clk0_divide_by = 2,
		pll0.clk0_multiply_by = 25,
		pll0.clk1_divide_by = 10,
		pll0.clk1_multiply_by = 25,
		pll0.clk2_divide_by = 10,
		pll0.clk2_duty_cycle = 20,
		pll0.clk2_multiply_by = 25,
		pll0.dpa_divide_by = 2,
		pll0.dpa_multiply_by = 25,
		pll0.inclk0_input_frequency = 10000,
		pll0.operation_mode = "no_compensation",
		pll0.intended_device_family = "Cyclone IV GX",
		pll0.lpm_type = "altpll";
	cycloneiv_hssi_calibration_block   cal_blk0
	(
	.calibrationstatus(),
	.clk(cal_blk_clk),
	.nonusertocmu(wire_cal_blk0_nonusertocmu),
	.powerdn(cal_blk_powerdown)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.testctrl(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	cycloneiv_hssi_cmu   cent_unit0
	(
	.adet({4{1'b0}}),
	.alignstatus(),
	.coreclkout(),
	.digitaltestout(),
	.dpclk(reconfig_clk),
	.dpriodisable(reconfig_togxb_disable),
	.dpriodisableout(wire_cent_unit0_dpriodisableout),
	.dprioin(reconfig_togxb_in),
	.dprioload(reconfig_togxb_load),
	.dpriooe(),
	.dprioout(wire_cent_unit0_dprioout),
	.enabledeskew(),
	.fiforesetrd(),
	.fixedclk({{3{1'b0}}, fixedclk_to_cmu[0]}),
	.nonuserfromcal(nonusertocmu_out[0]),
	.quadreset(gxb_powerdown[0]),
	.quadresetout(wire_cent_unit0_quadresetout),
	.rdalign({4{1'b0}}),
	.rdenablesync(1'b0),
	.recovclk(1'b0),
	.refclkout(),
	.rxanalogreset({rx_analogreset_in[3:0]}),
	.rxanalogresetout(wire_cent_unit0_rxanalogresetout),
	.rxcrupowerdown(wire_cent_unit0_rxcrupowerdown),
	.rxctrl({4{1'b0}}),
	.rxctrlout(),
	.rxdatain({32{1'b0}}),
	.rxdataout(),
	.rxdatavalid({4{1'b0}}),
	.rxdigitalreset({rx_digitalreset_in[3:0]}),
	.rxdigitalresetout(wire_cent_unit0_rxdigitalresetout),
	.rxibpowerdown(wire_cent_unit0_rxibpowerdown),
	.rxpcsdprioin({cent_unit_rxpcsdprioin[1599:0]}),
	.rxpcsdprioout(wire_cent_unit0_rxpcsdprioout),
	.rxphfifox4byteselout(),
	.rxphfifox4rdenableout(),
	.rxphfifox4wrclkout(),
	.rxphfifox4wrenableout(),
	.rxpmadprioin({cent_unit_rxpmadprioin[1199:0]}),
	.rxpmadprioout(wire_cent_unit0_rxpmadprioout),
	.rxpowerdown({rx_powerdown_in[3:0]}),
	.rxrunningdisp({4{1'b0}}),
	.syncstatus({4{1'b0}}),
	.testout(),
	.txanalogresetout(wire_cent_unit0_txanalogresetout),
	.txctrl({4{1'b0}}),
	.txctrlout(),
	.txdatain({32{1'b0}}),
	.txdataout(),
	.txdetectrxpowerdown(wire_cent_unit0_txdetectrxpowerdown),
	.txdigitalreset({tx_digitalreset_in[3:0]}),
	.txdigitalresetout(wire_cent_unit0_txdigitalresetout),
	.txdividerpowerdown(wire_cent_unit0_txdividerpowerdown),
	.txobpowerdown(wire_cent_unit0_txobpowerdown),
	.txpcsdprioin({cent_unit_tx_dprioin[599:0]}),
	.txpcsdprioout(wire_cent_unit0_txpcsdprioout),
	.txphfifox4byteselout(),
	.txphfifox4rdclkout(),
	.txphfifox4rdenableout(),
	.txphfifox4wrenableout(),
	.txpmadprioin({cent_unit_txpmadprioin[1199:0]}),
	.txpmadprioout(wire_cent_unit0_txpmadprioout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.pmacramtest(1'b0),
	.refclkdig(1'b0),
	.rxcoreclk(1'b0),
	.rxphfifordenable(1'b1),
	.rxphfiforeset(1'b0),
	.rxphfifowrdisable(1'b0),
	.scanclk(1'b0),
	.scanmode(1'b0),
	.scanshift(1'b0),
	.testin({2000{1'b0}}),
	.txclk(1'b0),
	.txcoreclk(1'b0),
	.txphfiforddisable(1'b0),
	.txphfiforeset(1'b0),
	.txphfifowrenable(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cent_unit0.auto_spd_deassert_ph_fifo_rst_count = 8,
		cent_unit0.auto_spd_phystatus_notify_count = 14,
		cent_unit0.devaddr = ((((starting_channel_number / 4) + 0) % 32) + 1),
		cent_unit0.dprio_config_mode = 8'h01,
		cent_unit0.in_xaui_mode = "false",
		cent_unit0.portaddr = (((starting_channel_number + 0) / 128) + 1),
		cent_unit0.rx0_channel_bonding = "none",
		cent_unit0.rx0_clk1_mux_select = "recovered clock",
		cent_unit0.rx0_clk2_mux_select = "local reference clock",
		cent_unit0.rx0_ph_fifo_reg_mode = "true",
		cent_unit0.rx0_rd_clk_mux_select = "int clock",
		cent_unit0.rx0_recovered_clk_mux_select = "recovered clock",
		cent_unit0.rx0_reset_clock_output_during_digital_reset = "false",
		cent_unit0.rx0_use_double_data_mode = "false",
		cent_unit0.tx0_channel_bonding = "none",
		cent_unit0.tx0_rd_clk_mux_select = "central",
		cent_unit0.tx0_reset_clock_output_during_digital_reset = "false",
		cent_unit0.tx0_use_double_data_mode = "false",
		cent_unit0.tx0_wr_clk_mux_select = "int_clk",
		cent_unit0.use_coreclk_out_post_divider = "false",
		cent_unit0.use_deskew_fifo = "false",
		cent_unit0.lpm_type = "cycloneiv_hssi_cmu";
	cycloneiv_hssi_rx_pcs   receive_pcs0
	(
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(wire_receive_pcs0_cdrctrlearlyeios),
	.cdrctrllocktorefclkout(wire_receive_pcs0_cdrctrllocktorefclkout),
	.clkout(),
	.coreclkout(),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[9:0]),
	.dataout(),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[0]),
	.disperr(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pcsdprioin_wire[399:0]),
	.dprioout(wire_receive_pcs0_dprioout),
	.enabledeskew(1'b0),
	.enabyteord(1'b0),
	.enapatternalign(rx_enapatternalign[0]),
	.errdetect(),
	.fifordin(1'b0),
	.fifordout(),
	.fiforesetrd(1'b0),
	.hip8b10binvpolarity(pipe8b10binvpolarity[0]),
	.hipdataout(wire_receive_pcs0_hipdataout),
	.hipdatavalid(wire_receive_pcs0_hipdatavalid),
	.hipelecidle(wire_receive_pcs0_hipelecidle),
	.hipelecidleinfersel({3{1'b0}}),
	.hipphydonestatus(wire_receive_pcs0_hipphydonestatus),
	.hippowerdown(powerdn[1:0]),
	.hipstatus(wire_receive_pcs0_hipstatus),
	.invpol(1'b0),
	.k1detect(),
	.k2detect(),
	.localrefclk(tx_localrefclk[0]),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifooverflow(),
	.phfifordenable(rx_phfifordenable[0]),
	.phfifordenableout(),
	.phfiforeset(rx_phfiforeset[0]),
	.phfiforesetout(),
	.phfifounderflow(),
	.phfifowrdisable(rx_phfifowrdisable[0]),
	.phfifowrdisableout(),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipeenrevparallellpbkfromtx(int_pipeenrevparallellpbkfromtx[0]),
	.pipephydonestatus(),
	.pipepowerdown(tx_pipepowerdownout[1:0]),
	.pipepowerstate(tx_pipepowerstateout[3:0]),
	.pipestatetransdoneout(),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[0]),
	.quadreset(cent_unit_quadresetout[0]),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[0]),
	.refclk(refclk_pma[0]),
	.revbitorderwa(1'b0),
	.revparallelfdbkdata(wire_receive_pcs0_revparallelfdbkdata),
	.rlv(),
	.rmfifodatadeleted(),
	.rmfifodatainserted(),
	.rmfifoempty(),
	.rmfifofull(),
	.rmfifordena(1'b0),
	.rmfiforeset(rx_rmfiforeset[0]),
	.rmfifowrena(1'b0),
	.runningdisp(),
	.rxdetectvalid(tx_rxdetectvalidout[0]),
	.rxfound(rx_pcs_rxfound_wire[1:0]),
	.signaldetect(),
	.signaldetected(rx_signaldetect_wire[0]),
	.syncstatus(),
	.syncstatusdeskew(),
	.xauidelcondmetout(),
	.xauififoovrout(),
	.xauiinsertincompleteout(),
	.xauilatencycompout(),
	.xgmctrldet(),
	.xgmctrlin(1'b0),
	.xgmdatain({8{1'b0}}),
	.xgmdataout(),
	.xgmdatavalid(),
	.xgmrunningdisp()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslip(1'b0),
	.cdrctrllocktorefcl(1'b0),
	.coreclk(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.grayelecidleinferselfromtx({3{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.pipe8b10binvpolarity(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.revbyteorderwa(1'b0),
	.wareset(1'b0),
	.xauidelcondmet(1'b0),
	.xauififoovr(1'b0),
	.xauiinsertincomplete(1'b0),
	.xauilatencycomp(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pcs0.align_pattern = "0101111100",
		receive_pcs0.align_pattern_length = 10,
		receive_pcs0.allow_align_polarity_inversion = "false",
		receive_pcs0.allow_pipe_polarity_inversion = "true",
		receive_pcs0.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs0.auto_spd_phystatus_notify_count = 14,
		receive_pcs0.bit_slip_enable = "false",
		receive_pcs0.byte_order_invalid_code_or_run_disp_error = "true",
		receive_pcs0.byte_order_mode = "none",
		receive_pcs0.byte_order_pad_pattern = "0",
		receive_pcs0.byte_order_pattern = "0",
		receive_pcs0.byte_order_pld_ctrl_enable = "false",
		receive_pcs0.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs0.cdrctrl_cid_mode_enable = "true",
		receive_pcs0.cdrctrl_enable = "true",
		receive_pcs0.cdrctrl_mask_cycle = 800,
		receive_pcs0.cdrctrl_min_lock_to_ref_cycle = 63,
		receive_pcs0.cdrctrl_rxvalid_mask = "true",
		receive_pcs0.channel_bonding = "none",
		receive_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pcs0.channel_width = 8,
		receive_pcs0.clk1_mux_select = "recovered clock",
		receive_pcs0.clk2_mux_select = "local reference clock",
		receive_pcs0.core_clock_0ppm = "false",
		receive_pcs0.datapath_low_latency_mode = "false",
		receive_pcs0.datapath_protocol = "pipe",
		receive_pcs0.dec_8b_10b_compatibility_mode = "true",
		receive_pcs0.dec_8b_10b_mode = "normal",
		receive_pcs0.deskew_pattern = "0",
		receive_pcs0.disable_auto_idle_insertion = "false",
		receive_pcs0.disable_running_disp_in_word_align = "false",
		receive_pcs0.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs0.dprio_config_mode = 8'h01,
		receive_pcs0.elec_idle_gen1_sigdet_enable = "true",
		receive_pcs0.elec_idle_infer_enable = "false",
		receive_pcs0.elec_idle_num_com_detect = 3,
		receive_pcs0.enable_bit_reversal = "false",
		receive_pcs0.enable_self_test_mode = "false",
		receive_pcs0.force_signal_detect_dig = "true",
		receive_pcs0.hip_enable = "true",
		receive_pcs0.infiniband_invalid_code = 0,
		receive_pcs0.insert_pad_on_underflow = "false",
		receive_pcs0.num_align_code_groups_in_ordered_set = 0,
		receive_pcs0.num_align_cons_good_data = 16,
		receive_pcs0.num_align_cons_pat = 4,
		receive_pcs0.num_align_loss_sync_error = 17,
		receive_pcs0.ph_fifo_low_latency_enable = "true",
		receive_pcs0.ph_fifo_reg_mode = "true",
		receive_pcs0.protocol_hint = "pcie",
		receive_pcs0.rate_match_back_to_back = "false",
		receive_pcs0.rate_match_delete_threshold = 13,
		receive_pcs0.rate_match_empty_threshold = 5,
		receive_pcs0.rate_match_fifo_mode = "true",
		receive_pcs0.rate_match_full_threshold = 20,
		receive_pcs0.rate_match_insert_threshold = 11,
		receive_pcs0.rate_match_ordered_set_based = "false",
		receive_pcs0.rate_match_pattern1 = "11010000111010000011",
		receive_pcs0.rate_match_pattern2 = "00101111000101111100",
		receive_pcs0.rate_match_pattern_size = 20,
		receive_pcs0.rate_match_pipe_enable = "true",
		receive_pcs0.rate_match_reset_enable = "false",
		receive_pcs0.rate_match_skip_set_based = "true",
		receive_pcs0.rate_match_start_threshold = 7,
		receive_pcs0.rd_clk_mux_select = "int clock",
		receive_pcs0.recovered_clk_mux_select = "recovered clock",
		receive_pcs0.run_length = 40,
		receive_pcs0.run_length_enable = "true",
		receive_pcs0.rx_detect_bypass = "false",
		receive_pcs0.rx_phfifo_wait_cnt = 32,
		receive_pcs0.rxstatus_error_report_mode = 1,
		receive_pcs0.self_test_mode = "incremental",
		receive_pcs0.use_alignment_state_machine = "true",
		receive_pcs0.use_deskew_fifo = "false",
		receive_pcs0.use_double_data_mode = "false",
		receive_pcs0.use_parallel_loopback = "false",
		receive_pcs0.lpm_type = "cycloneiv_hssi_rx_pcs";
	cycloneiv_hssi_rx_pma   receive_pma0
	(
	.analogtestbus(wire_receive_pma0_analogtestbus),
	.clockout(wire_receive_pma0_clockout),
	.crupowerdn(cent_unit_rxcrupowerdn[0]),
	.datain(rx_datain[0]),
	.datastrobeout(),
	.deserclock(rx_deserclock_in[0]),
	.diagnosticlpbkout(wire_receive_pma0_diagnosticlpbkout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[299:0]),
	.dprioout(wire_receive_pma0_dprioout),
	.freqlocked(wire_receive_pma0_freqlocked),
	.locktodata(((~ reconfig_togxb_busy) & rx_locktodata[0])),
	.locktoref(rx_locktorefclk_wire[0]),
	.locktorefout(wire_receive_pma0_locktorefout),
	.powerdn(cent_unit_rxibpowerdn[0]),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[0]),
	.recoverdataout(wire_receive_pma0_recoverdataout),
	.reverselpbkout(wire_receive_pma0_reverselpbkout),
	.rxpmareset(rx_analogreset_out[0]),
	.seriallpbkin(tx_serialloopbackout[0]),
	.signaldetect(wire_receive_pma0_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dpashift(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma0.allow_serial_loopback = "false",
		receive_pma0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pma0.common_mode = "0.82V",
		receive_pma0.deserialization_factor = 10,
		receive_pma0.dprio_config_mode = 8'h01,
		receive_pma0.effective_data_rate = "2500 Mbps",
		receive_pma0.enable_local_divider = "false",
		receive_pma0.enable_ltd = "false",
		receive_pma0.enable_ltr = "false",
		receive_pma0.enable_second_order_loop = "false",
		receive_pma0.eq_dc_gain = 3,
		receive_pma0.eq_setting = 5,
		receive_pma0.force_signal_detect = "false",
		receive_pma0.logical_channel_address = (starting_channel_number + 0),
		receive_pma0.loop_1_digital_filter = 8,
		receive_pma0.offset_cancellation = 1,
		receive_pma0.ppm_gen1_2_xcnt_en = 1,
		receive_pma0.ppm_post_eidle = 0,
		receive_pma0.ppmselect = 8,
		receive_pma0.protocol_hint = "pcie",
		receive_pma0.signal_detect_hysteresis = 4,
		receive_pma0.signal_detect_hysteresis_valid_threshold = 14,
		receive_pma0.signal_detect_loss_threshold = 3,
		receive_pma0.termination = "OCT 100 Ohms",
		receive_pma0.use_external_termination = "false",
		receive_pma0.lpm_type = "cycloneiv_hssi_rx_pma";
	cycloneiv_hssi_tx_pcs   transmit_pcs0
	(
	.clkout(wire_transmit_pcs0_clkout),
	.coreclkout(),
	.ctrlenable({{1{1'b0}}, 1'b0}),
	.datainfull({22{1'b0}}),
	.dataout(wire_transmit_pcs0_dataout),
	.digitalreset(tx_digitalreset_out[0]),
	.dispval({{1{1'b0}}, 1'b0}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[149:0]),
	.dprioout(wire_transmit_pcs0_dprioout),
	.enrevparallellpbk(tx_revparallellpbken[0]),
	.forcedisp({{1{1'b0}}, 1'b0}),
	.forceelecidleout(wire_transmit_pcs0_forceelecidleout),
	.grayelecidleinferselout(wire_transmit_pcs0_grayelecidleinferselout),
	.hipdatain({tx_forcedispcompliance[0], tx_ctrlenable[0], tx_datain_wire[7:0]}),
	.hipdetectrxloop(tx_detectrxloop[0]),
	.hipelecidleinfersel(rx_elecidleinfersel[2:0]),
	.hipforceelecidle(tx_forceelecidle[0]),
	.hippowerdn(powerdn[1:0]),
	.hiptxclkout(wire_transmit_pcs0_hiptxclkout),
	.invpol(tx_invpolarity[0]),
	.localrefclk(tx_localrefclk[0]),
	.parallelfdbkout(),
	.phfifooverflow(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(),
	.phfiforeset(tx_phfiforeset[0]),
	.phfiforesetout(),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(),
	.pipeenrevparallellpbkout(wire_transmit_pcs0_pipeenrevparallellpbkout),
	.pipepowerdownout(wire_transmit_pcs0_pipepowerdownout),
	.pipepowerstateout(wire_transmit_pcs0_pipepowerstateout),
	.pipestatetransdone(1'b0),
	.quadreset(cent_unit_quadresetout[0]),
	.rdenablesync(),
	.refclk(refclk_pma[0]),
	.revparallelfdbk(rx_revparallelfdbkdata[19:0]),
	.txdetectrx(wire_transmit_pcs0_txdetectrx),
	.xgmctrlenable(),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.coreclk(1'b0),
	.datain({20{1'b0}}),
	.detectrxloop(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.pipetxswing(1'b0),
	.powerdn({2{1'b0}}),
	.prbscidenable(1'b0),
	.xgmctrl(1'b0),
	.xgmdatain({8{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs0.allow_polarity_inversion = "false",
		transmit_pcs0.bitslip_enable = "false",
		transmit_pcs0.channel_bonding = "none",
		transmit_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pcs0.channel_width = 8,
		transmit_pcs0.core_clock_0ppm = "false",
		transmit_pcs0.datapath_low_latency_mode = "false",
		transmit_pcs0.datapath_protocol = "pipe",
		transmit_pcs0.disable_ph_low_latency_mode = "false",
		transmit_pcs0.disparity_mode = "new",
		transmit_pcs0.dprio_config_mode = 8'h01,
		transmit_pcs0.elec_idle_delay = 4,
		transmit_pcs0.enable_bit_reversal = "false",
		transmit_pcs0.enable_idle_selection = "false",
		transmit_pcs0.enable_reverse_parallel_loopback = "true",
		transmit_pcs0.enable_self_test_mode = "false",
		transmit_pcs0.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs0.enc_8b_10b_mode = "normal",
		transmit_pcs0.hip_enable = "true",
		transmit_pcs0.ph_fifo_reg_mode = "true",
		transmit_pcs0.prbs_cid_pattern = "false",
		transmit_pcs0.protocol_hint = "pcie",
		transmit_pcs0.refclk_select = "local",
		transmit_pcs0.self_test_mode = "incremental",
		transmit_pcs0.use_double_data_mode = "false",
		transmit_pcs0.wr_clk_mux_select = "int_clk",
		transmit_pcs0.lpm_type = "cycloneiv_hssi_tx_pcs";
	cycloneiv_hssi_tx_pma   transmit_pma0
	(
	.cgbpowerdn(cent_unit_txdividerpowerdown[0]),
	.clockout(wire_transmit_pma0_clockout),
	.datain({tx_dataout_pcs_to_pma[9:0]}),
	.dataout(wire_transmit_pma0_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[0]),
	.diagnosticlpbkin(tx_diagnosticlpbkin[0]),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[299:0]),
	.dprioout(wire_transmit_pma0_dprioout),
	.fastrefclk0in(tx_pma_fastrefclk0in[0]),
	.forceelecidle(tx_pcs_forceelecidleout[0]),
	.powerdn(cent_unit_txobpowerdn[0]),
	.refclk0in(tx_pma_refclk0in[0]),
	.refclk0inpulse(tx_pma_refclk0inpulse[0]),
	.reverselpbkin(rx_reverselpbkout[0]),
	.rxdetecten(txdetectrxout[0]),
	.rxdetectvalidout(wire_transmit_pma0_rxdetectvalidout),
	.rxfoundout(wire_transmit_pma0_rxfoundout),
	.seriallpbkout(wire_transmit_pma0_seriallpbkout),
	.txpmareset(tx_analogreset_out[0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pma0.common_mode = "0.65V",
		transmit_pma0.dprio_config_mode = 8'h01,
		transmit_pma0.effective_data_rate = "2500 Mbps",
		transmit_pma0.enable_diagnostic_loopback = "false",
		transmit_pma0.enable_reverse_serial_loopback = "false",
		transmit_pma0.logical_channel_address = (starting_channel_number + 0),
		transmit_pma0.preemp_tap_1 = 1,
		transmit_pma0.protocol_hint = "pcie",
		transmit_pma0.rx_detect = 0,
		transmit_pma0.serialization_factor = 10,
		transmit_pma0.slew_rate = "low",
		transmit_pma0.termination = "OCT 100 Ohms",
		transmit_pma0.use_external_termination = "false",
		transmit_pma0.use_rx_detect = "true",
		transmit_pma0.vod_selection = 4,
		transmit_pma0.lpm_type = "cycloneiv_hssi_tx_pma";
	// synopsys translate_off
	initial
		fixedclk_div = 0;
	// synopsys translate_on
	always @ ( posedge fixedclk)
		  fixedclk_div <= (~ fixedclk_div_in);
	// synopsys translate_off
	initial
		reconfig_togxb_busy_reg = 0;
	// synopsys translate_on
	always @ ( negedge fixedclk)
		  reconfig_togxb_busy_reg <= {reconfig_togxb_busy_reg[0], reconfig_togxb_busy};
	assign
		cal_blk_powerdown = 1'b0,
		cent_unit_quadresetout = {wire_cent_unit0_quadresetout},
		cent_unit_rxcrupowerdn = {wire_cent_unit0_rxcrupowerdown[3:0]},
		cent_unit_rxibpowerdn = {wire_cent_unit0_rxibpowerdown[3:0]},
		cent_unit_rxpcsdprioin = {{1200{1'b0}}, rx_pcsdprioout[399:0]},
		cent_unit_rxpcsdprioout = {wire_cent_unit0_rxpcsdprioout[1599:0]},
		cent_unit_rxpmadprioin = {{900{1'b0}}, rx_pmadprioout[299:0]},
		cent_unit_rxpmadprioout = {wire_cent_unit0_rxpmadprioout[1199:0]},
		cent_unit_tx_dprioin = {{450{1'b0}}, tx_txdprioout[149:0]},
		cent_unit_txdetectrxpowerdn = {wire_cent_unit0_txdetectrxpowerdown[3:0]},
		cent_unit_txdividerpowerdown = {wire_cent_unit0_txdividerpowerdown[3:0]},
		cent_unit_txdprioout = {wire_cent_unit0_txpcsdprioout[599:0]},
		cent_unit_txobpowerdn = {wire_cent_unit0_txobpowerdown[3:0]},
		cent_unit_txpmadprioin = {{900{1'b0}}, tx_pmadprioout[299:0]},
		cent_unit_txpmadprioout = {wire_cent_unit0_txpmadprioout[1199:0]},
		fixedclk_div_in = fixedclk_div,
		fixedclk_enable = reconfig_togxb_busy_reg[0],
		fixedclk_fast = {4{1'b1}},
		fixedclk_sel = reconfig_togxb_busy_reg[1],
		fixedclk_to_cmu = {((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[3]) & fixedclk_div_in) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk)), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[2]) & fixedclk_div_in) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk)), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[1]) & fixedclk_div_in) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk)), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[0]) & fixedclk_div_in) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk))},
		hip_tx_clkout = {wire_transmit_pcs0_hiptxclkout},
		int_pipeenrevparallellpbkfromtx = {wire_transmit_pcs0_pipeenrevparallellpbkout},
		nonusertocmu_out = {wire_cal_blk0_nonusertocmu},
		pipedatavalid = {pipedatavalid_out[0]},
		pipedatavalid_out = {wire_receive_pcs0_hipdatavalid},
		pipeelecidle = {pipeelecidle_out[0]},
		pipeelecidle_out = {wire_receive_pcs0_hipelecidle},
		pipephydonestatus = {wire_receive_pcs0_hipphydonestatus},
		pipestatus = {wire_receive_pcs0_hipstatus},
		pll_locked = {wire_pll0_locked},
		pll_powerdown = 1'b0,
		reconfig_fromgxb = {rx_pma_analogtestbus[4:1], wire_cent_unit0_dprioout},
		reconfig_togxb_busy = reconfig_togxb[3],
		reconfig_togxb_disable = reconfig_togxb[1],
		reconfig_togxb_in = reconfig_togxb[0],
		reconfig_togxb_load = reconfig_togxb[2],
		rx_analogreset_in = {{3{1'b0}}, ((~ reconfig_togxb_busy) & rx_analogreset[0])},
		rx_analogreset_out = {wire_cent_unit0_rxanalogresetout[3:0]},
		rx_ctrldetect = {wire_receive_pcs0_hipdataout[8]},
		rx_dataout = {rx_out_wire[7:0]},
		rx_deserclock_in = {wire_pll0_icdrclk},
		rx_digitalreset_in = {{3{1'b0}}, rx_digitalreset[0]},
		rx_digitalreset_out = {wire_cent_unit0_rxdigitalresetout[3:0]},
		rx_enapatternalign = 1'b0,
		rx_freqlocked = {(wire_receive_pma0_freqlocked & (~ rx_analogreset[0]))},
		rx_locktodata = 1'b0,
		rx_locktorefclk_wire = {wire_receive_pcs0_cdrctrllocktorefclkout},
		rx_out_wire = {wire_receive_pcs0_hipdataout[7:0]},
		rx_pcs_rxfound_wire = {txdetectrxout[0], tx_rxfoundout[0]},
		rx_pcsdprioin_wire = {{1200{1'b0}}, cent_unit_rxpcsdprioout[399:0]},
		rx_pcsdprioout = {{1200{1'b0}}, wire_receive_pcs0_dprioout},
		rx_phfifordenable = 1'b1,
		rx_phfiforeset = 1'b0,
		rx_phfifowrdisable = 1'b0,
		rx_pll_pfdrefclkout_wire = {wire_pll0_fref},
		rx_pma_analogtestbus = {{4{1'b0}}, wire_receive_pma0_analogtestbus[6]},
		rx_pma_clockout = {wire_receive_pma0_clockout},
		rx_pma_recoverdataout_wire = {wire_receive_pma0_recoverdataout[9:0]},
		rx_pmadprioin_wire = {{900{1'b0}}, cent_unit_rxpmadprioout[299:0]},
		rx_pmadprioout = {{900{1'b0}}, wire_receive_pma0_dprioout},
		rx_powerdown = 1'b0,
		rx_powerdown_in = {{3{1'b0}}, rx_powerdown[0]},
		rx_prbscidenable = 1'b0,
		rx_reverselpbkout = {wire_receive_pma0_reverselpbkout},
		rx_revparallelfdbkdata = {wire_receive_pcs0_revparallelfdbkdata},
		rx_rmfiforeset = 1'b0,
		rx_signaldetect_wire = {wire_receive_pma0_signaldetect},
		tx_analogreset_out = {wire_cent_unit0_txanalogresetout[3:0]},
		tx_clkout = {tx_core_clkout_wire[0]},
		tx_clkout_int_wire = {wire_transmit_pcs0_clkout},
		tx_core_clkout_wire = {tx_clkout_int_wire[0]},
		tx_datain_wire = {tx_datain[7:0]},
		tx_dataout = {txdataout[0]},
		tx_dataout_pcs_to_pma = {wire_transmit_pcs0_dataout[9:0]},
		tx_diagnosticlpbkin = {wire_receive_pma0_diagnosticlpbkout},
		tx_digitalreset_in = {{3{1'b0}}, tx_digitalreset[0]},
		tx_digitalreset_out = {wire_cent_unit0_txdigitalresetout[3:0]},
		tx_dprioin_wire = {{450{1'b0}}, cent_unit_txdprioout[149:0]},
		tx_invpolarity = 1'b0,
		tx_localrefclk = {wire_transmit_pma0_clockout},
		tx_pcs_forceelecidleout = {wire_transmit_pcs0_forceelecidleout},
		tx_phfiforeset = 1'b0,
		tx_pipepowerdownout = {wire_transmit_pcs0_pipepowerdownout},
		tx_pipepowerstateout = {wire_transmit_pcs0_pipepowerstateout},
		tx_pma_fastrefclk0in = {wire_pll0_clk[0]},
		tx_pma_refclk0in = {wire_pll0_clk[1]},
		tx_pma_refclk0inpulse = {wire_pll0_clk[2]},
		tx_pmadprioin_wire = {{900{1'b0}}, cent_unit_txpmadprioout[299:0]},
		tx_pmadprioout = {{900{1'b0}}, wire_transmit_pma0_dprioout},
		tx_revparallellpbken = 1'b0,
		tx_rxdetectvalidout = {wire_transmit_pma0_rxdetectvalidout},
		tx_rxfoundout = {wire_transmit_pma0_rxfoundout},
		tx_serialloopbackout = {wire_transmit_pma0_seriallpbkout},
		tx_txdprioout = {{450{1'b0}}, wire_transmit_pcs0_dprioout},
		txdataout = {wire_transmit_pma0_dataout},
		txdetectrxout = {wire_transmit_pcs0_txdetectrx},
		w_cent_unit_dpriodisableout1w = {wire_cent_unit0_dpriodisableout};
endmodule