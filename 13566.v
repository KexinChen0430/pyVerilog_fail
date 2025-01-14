module  pcie_hip_s4gx_gen2_x4_128_serdes_alt4gxb_svoa
	(
	cal_blk_clk,
	coreclkout,
	fixedclk,
	gxb_powerdown,
	hip_tx_clkout,
	pipe8b10binvpolarity,
	pipedatavalid,
	pipeelecidle,
	pipephydonestatus,
	pipestatus,
	pll_inclk,
	pll_locked,
	pll_powerdown,
	powerdn,
	rateswitch,
	rateswitchbaseclock,
	reconfig_clk,
	reconfig_fromgxb,
	reconfig_togxb,
	rx_analogreset,
	rx_cruclk,
	rx_ctrldetect,
	rx_datain,
	rx_dataout,
	rx_digitalreset,
	rx_elecidleinfersel,
	rx_freqlocked,
	rx_patterndetect,
	rx_pll_locked,
	rx_signaldetect,
	rx_syncstatus,
	tx_ctrlenable,
	tx_datain,
	tx_dataout,
	tx_detectrxloop,
	tx_digitalreset,
	tx_forcedispcompliance,
	tx_forceelecidle,
	tx_pipedeemph,
	tx_pipemargin) /* synthesis synthesis_clearbox=2 */;
	input   cal_blk_clk;
	output   [0:0]  coreclkout;
	input   fixedclk;
	input   [0:0]  gxb_powerdown;
	output   [3:0]  hip_tx_clkout;
	input   [3:0]  pipe8b10binvpolarity;
	output   [3:0]  pipedatavalid;
	output   [3:0]  pipeelecidle;
	output   [3:0]  pipephydonestatus;
	output   [11:0]  pipestatus;
	input   pll_inclk;
	output   [0:0]  pll_locked;
	input   [0:0]  pll_powerdown;
	input   [7:0]  powerdn;
	input   [0:0]  rateswitch;
	output   [0:0]  rateswitchbaseclock;
	input   reconfig_clk;
	output   [16:0]  reconfig_fromgxb;
	input   [3:0]  reconfig_togxb;
	input   [0:0]  rx_analogreset;
	input   [3:0]  rx_cruclk;
	output   [3:0]  rx_ctrldetect;
	input   [3:0]  rx_datain;
	output   [31:0]  rx_dataout;
	input   [0:0]  rx_digitalreset;
	input   [11:0]  rx_elecidleinfersel;
	output   [3:0]  rx_freqlocked;
	output   [3:0]  rx_patterndetect;
	output   [3:0]  rx_pll_locked;
	output   [3:0]  rx_signaldetect;
	output   [3:0]  rx_syncstatus;
	input   [3:0]  tx_ctrlenable;
	input   [31:0]  tx_datain;
	output   [3:0]  tx_dataout;
	input   [3:0]  tx_detectrxloop;
	input   [0:0]  tx_digitalreset;
	input   [3:0]  tx_forcedispcompliance;
	input   [3:0]  tx_forceelecidle;
	input   [3:0]  tx_pipedeemph;
	input   [11:0]  tx_pipemargin;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   cal_blk_clk;
	tri0   fixedclk;
	tri0   [0:0]  gxb_powerdown;
	tri0   [3:0]  pipe8b10binvpolarity;
	tri0   pll_inclk;
	tri0   [0:0]  pll_powerdown;
	tri0   [7:0]  powerdn;
	tri0   [0:0]  rateswitch;
	tri0   reconfig_clk;
	tri0   [0:0]  rx_analogreset;
	tri0   [3:0]  rx_cruclk;
	tri0   [0:0]  rx_digitalreset;
	tri0   [11:0]  rx_elecidleinfersel;
	tri0   [3:0]  tx_ctrlenable;
	tri0   [31:0]  tx_datain;
	tri0   [3:0]  tx_detectrxloop;
	tri0   [0:0]  tx_digitalreset;
	tri0   [3:0]  tx_forcedispcompliance;
	tri0   [3:0]  tx_forceelecidle;
	tri0   [3:0]  tx_pipedeemph;
	tri0   [11:0]  tx_pipemargin;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	parameter	starting_channel_number = 0;
	reg	fixedclk_div0quad0c;
	wire	wire_fixedclk_div0quad0c_clk;
	reg	fixedclk_div1quad0c;
	wire	wire_fixedclk_div1quad0c_clk;
	reg	fixedclk_div2quad0c;
	wire	wire_fixedclk_div2quad0c_clk;
	reg	fixedclk_div3quad0c;
	wire	wire_fixedclk_div3quad0c_clk;
	reg	fixedclk_div4quad0c;
	wire	wire_fixedclk_div4quad0c_clk;
	reg	fixedclk_div5quad0c;
	wire	wire_fixedclk_div5quad0c_clk;
	reg	[1:0]	reconfig_togxb_busy_reg;
	wire	[2:0]	wire_rx_digitalreset_reg0c_d;
	reg	[2:0]	rx_digitalreset_reg0c;
	wire	[2:0]	wire_rx_digitalreset_reg0c_clk;
	wire	[2:0]	wire_tx_digitalreset_reg0c_d;
	reg	[2:0]	tx_digitalreset_reg0c;
	wire	[2:0]	wire_tx_digitalreset_reg0c_clk;
	wire  wire_cal_blk0_nonusertocmu;
	wire  [1:0]   wire_central_clk_div0_analogfastrefclkout;
	wire  [1:0]   wire_central_clk_div0_analogrefclkout;
	wire  wire_central_clk_div0_analogrefclkpulse;
	wire  wire_central_clk_div0_coreclkout;
	wire  [99:0]   wire_central_clk_div0_dprioout;
	wire  wire_central_clk_div0_rateswitchbaseclock;
	wire  wire_central_clk_div0_rateswitchdone;
	wire  wire_central_clk_div0_refclkout;
	wire  wire_cent_unit0_autospdx4configsel;
	wire  wire_cent_unit0_autospdx4rateswitchout;
	wire  wire_cent_unit0_autospdx4spdchg;
	wire  [1:0]   wire_cent_unit0_clkdivpowerdn;
	wire  [599:0]   wire_cent_unit0_cmudividerdprioout;
	wire  [1799:0]   wire_cent_unit0_cmuplldprioout;
	wire  wire_cent_unit0_dpriodisableout;
	wire  wire_cent_unit0_dprioout;
	wire  wire_cent_unit0_phfifiox4ptrsreset;
	wire  [1:0]   wire_cent_unit0_pllpowerdn;
	wire  [1:0]   wire_cent_unit0_pllresetout;
	wire  wire_cent_unit0_quadresetout;
	wire  [5:0]   wire_cent_unit0_rxanalogresetout;
	wire  [5:0]   wire_cent_unit0_rxcrupowerdown;
	wire  [5:0]   wire_cent_unit0_rxcruresetout;
	wire  [3:0]   wire_cent_unit0_rxdigitalresetout;
	wire  [5:0]   wire_cent_unit0_rxibpowerdown;
	wire  [1599:0]   wire_cent_unit0_rxpcsdprioout;
	wire  wire_cent_unit0_rxphfifox4byteselout;
	wire  wire_cent_unit0_rxphfifox4rdenableout;
	wire  wire_cent_unit0_rxphfifox4wrclkout;
	wire  wire_cent_unit0_rxphfifox4wrenableout;
	wire  [1799:0]   wire_cent_unit0_rxpmadprioout;
	wire  [5:0]   wire_cent_unit0_txanalogresetout;
	wire  [3:0]   wire_cent_unit0_txctrlout;
	wire  [31:0]   wire_cent_unit0_txdataout;
	wire  [5:0]   wire_cent_unit0_txdetectrxpowerdown;
	wire  [3:0]   wire_cent_unit0_txdigitalresetout;
	wire  [5:0]   wire_cent_unit0_txobpowerdown;
	wire  [599:0]   wire_cent_unit0_txpcsdprioout;
	wire  wire_cent_unit0_txphfifox4byteselout;
	wire  wire_cent_unit0_txphfifox4rdclkout;
	wire  wire_cent_unit0_txphfifox4rdenableout;
	wire  wire_cent_unit0_txphfifox4wrenableout;
	wire  [1799:0]   wire_cent_unit0_txpmadprioout;
	wire  [3:0]   wire_rx_cdr_pll0_clk;
	wire  [1:0]   wire_rx_cdr_pll0_dataout;
	wire  [299:0]   wire_rx_cdr_pll0_dprioout;
	wire  wire_rx_cdr_pll0_freqlocked;
	wire  wire_rx_cdr_pll0_locked;
	wire  wire_rx_cdr_pll0_pfdrefclkout;
	wire  [3:0]   wire_rx_cdr_pll1_clk;
	wire  [1:0]   wire_rx_cdr_pll1_dataout;
	wire  [299:0]   wire_rx_cdr_pll1_dprioout;
	wire  wire_rx_cdr_pll1_freqlocked;
	wire  wire_rx_cdr_pll1_locked;
	wire  wire_rx_cdr_pll1_pfdrefclkout;
	wire  [3:0]   wire_rx_cdr_pll2_clk;
	wire  [1:0]   wire_rx_cdr_pll2_dataout;
	wire  [299:0]   wire_rx_cdr_pll2_dprioout;
	wire  wire_rx_cdr_pll2_freqlocked;
	wire  wire_rx_cdr_pll2_locked;
	wire  wire_rx_cdr_pll2_pfdrefclkout;
	wire  [3:0]   wire_rx_cdr_pll3_clk;
	wire  [1:0]   wire_rx_cdr_pll3_dataout;
	wire  [299:0]   wire_rx_cdr_pll3_dprioout;
	wire  wire_rx_cdr_pll3_freqlocked;
	wire  wire_rx_cdr_pll3_locked;
	wire  wire_rx_cdr_pll3_pfdrefclkout;
	wire  [3:0]   wire_tx_pll0_clk;
	wire  [299:0]   wire_tx_pll0_dprioout;
	wire  wire_tx_pll0_locked;
	wire  wire_receive_pcs0_autospdrateswitchout;
	wire  wire_receive_pcs0_cdrctrlearlyeios;
	wire  wire_receive_pcs0_cdrctrllocktorefclkout;
	wire  wire_receive_pcs0_coreclkout;
	wire  [399:0]   wire_receive_pcs0_dprioout;
	wire  [8:0]   wire_receive_pcs0_hipdataout;
	wire  wire_receive_pcs0_hipdatavalid;
	wire  wire_receive_pcs0_hipelecidle;
	wire  wire_receive_pcs0_hipphydonestatus;
	wire  [2:0]   wire_receive_pcs0_hipstatus;
	wire  wire_receive_pcs0_phfifobyteserdisableout;
	wire  wire_receive_pcs0_phfifoptrsresetout;
	wire  wire_receive_pcs0_phfifordenableout;
	wire  wire_receive_pcs0_phfiforesetout;
	wire  wire_receive_pcs0_phfifowrdisableout;
	wire  wire_receive_pcs0_pipestatetransdoneout;
	wire  wire_receive_pcs0_rateswitchout;
	wire  [19:0]   wire_receive_pcs0_revparallelfdbkdata;
	wire  wire_receive_pcs0_signaldetect;
	wire  wire_receive_pcs1_autospdrateswitchout;
	wire  wire_receive_pcs1_cdrctrlearlyeios;
	wire  wire_receive_pcs1_cdrctrllocktorefclkout;
	wire  wire_receive_pcs1_coreclkout;
	wire  [399:0]   wire_receive_pcs1_dprioout;
	wire  [8:0]   wire_receive_pcs1_hipdataout;
	wire  wire_receive_pcs1_hipdatavalid;
	wire  wire_receive_pcs1_hipelecidle;
	wire  wire_receive_pcs1_hipphydonestatus;
	wire  [2:0]   wire_receive_pcs1_hipstatus;
	wire  wire_receive_pcs1_phfifobyteserdisableout;
	wire  wire_receive_pcs1_phfifoptrsresetout;
	wire  wire_receive_pcs1_phfifordenableout;
	wire  wire_receive_pcs1_phfiforesetout;
	wire  wire_receive_pcs1_phfifowrdisableout;
	wire  wire_receive_pcs1_pipestatetransdoneout;
	wire  wire_receive_pcs1_rateswitchout;
	wire  [19:0]   wire_receive_pcs1_revparallelfdbkdata;
	wire  wire_receive_pcs1_signaldetect;
	wire  wire_receive_pcs2_autospdrateswitchout;
	wire  wire_receive_pcs2_cdrctrlearlyeios;
	wire  wire_receive_pcs2_cdrctrllocktorefclkout;
	wire  wire_receive_pcs2_coreclkout;
	wire  [399:0]   wire_receive_pcs2_dprioout;
	wire  [8:0]   wire_receive_pcs2_hipdataout;
	wire  wire_receive_pcs2_hipdatavalid;
	wire  wire_receive_pcs2_hipelecidle;
	wire  wire_receive_pcs2_hipphydonestatus;
	wire  [2:0]   wire_receive_pcs2_hipstatus;
	wire  wire_receive_pcs2_phfifobyteserdisableout;
	wire  wire_receive_pcs2_phfifoptrsresetout;
	wire  wire_receive_pcs2_phfifordenableout;
	wire  wire_receive_pcs2_phfiforesetout;
	wire  wire_receive_pcs2_phfifowrdisableout;
	wire  wire_receive_pcs2_pipestatetransdoneout;
	wire  wire_receive_pcs2_rateswitchout;
	wire  [19:0]   wire_receive_pcs2_revparallelfdbkdata;
	wire  wire_receive_pcs2_signaldetect;
	wire  wire_receive_pcs3_autospdrateswitchout;
	wire  wire_receive_pcs3_cdrctrlearlyeios;
	wire  wire_receive_pcs3_cdrctrllocktorefclkout;
	wire  wire_receive_pcs3_coreclkout;
	wire  [399:0]   wire_receive_pcs3_dprioout;
	wire  [8:0]   wire_receive_pcs3_hipdataout;
	wire  wire_receive_pcs3_hipdatavalid;
	wire  wire_receive_pcs3_hipelecidle;
	wire  wire_receive_pcs3_hipphydonestatus;
	wire  [2:0]   wire_receive_pcs3_hipstatus;
	wire  wire_receive_pcs3_phfifobyteserdisableout;
	wire  wire_receive_pcs3_phfifoptrsresetout;
	wire  wire_receive_pcs3_phfifordenableout;
	wire  wire_receive_pcs3_phfiforesetout;
	wire  wire_receive_pcs3_phfifowrdisableout;
	wire  wire_receive_pcs3_pipestatetransdoneout;
	wire  wire_receive_pcs3_rateswitchout;
	wire  [19:0]   wire_receive_pcs3_revparallelfdbkdata;
	wire  wire_receive_pcs3_signaldetect;
	wire  [7:0]   wire_receive_pma0_analogtestbus;
	wire  wire_receive_pma0_clockout;
	wire  wire_receive_pma0_dataout;
	wire  [299:0]   wire_receive_pma0_dprioout;
	wire  wire_receive_pma0_locktorefout;
	wire  [63:0]   wire_receive_pma0_recoverdataout;
	wire  wire_receive_pma0_signaldetect;
	wire  [7:0]   wire_receive_pma1_analogtestbus;
	wire  wire_receive_pma1_clockout;
	wire  wire_receive_pma1_dataout;
	wire  [299:0]   wire_receive_pma1_dprioout;
	wire  wire_receive_pma1_locktorefout;
	wire  [63:0]   wire_receive_pma1_recoverdataout;
	wire  wire_receive_pma1_signaldetect;
	wire  [7:0]   wire_receive_pma2_analogtestbus;
	wire  wire_receive_pma2_clockout;
	wire  wire_receive_pma2_dataout;
	wire  [299:0]   wire_receive_pma2_dprioout;
	wire  wire_receive_pma2_locktorefout;
	wire  [63:0]   wire_receive_pma2_recoverdataout;
	wire  wire_receive_pma2_signaldetect;
	wire  [7:0]   wire_receive_pma3_analogtestbus;
	wire  wire_receive_pma3_clockout;
	wire  wire_receive_pma3_dataout;
	wire  [299:0]   wire_receive_pma3_dprioout;
	wire  wire_receive_pma3_locktorefout;
	wire  [63:0]   wire_receive_pma3_recoverdataout;
	wire  wire_receive_pma3_signaldetect;
	wire  wire_transmit_pcs0_coreclkout;
	wire  [19:0]   wire_transmit_pcs0_dataout;
	wire  [149:0]   wire_transmit_pcs0_dprioout;
	wire  wire_transmit_pcs0_forceelecidleout;
	wire  [2:0]   wire_transmit_pcs0_grayelecidleinferselout;
	wire  wire_transmit_pcs0_phfiforddisableout;
	wire  wire_transmit_pcs0_phfiforesetout;
	wire  wire_transmit_pcs0_phfifowrenableout;
	wire  wire_transmit_pcs0_pipeenrevparallellpbkout;
	wire  [1:0]   wire_transmit_pcs0_pipepowerdownout;
	wire  [3:0]   wire_transmit_pcs0_pipepowerstateout;
	wire  wire_transmit_pcs0_txdetectrx;
	wire  wire_transmit_pcs1_coreclkout;
	wire  [19:0]   wire_transmit_pcs1_dataout;
	wire  [149:0]   wire_transmit_pcs1_dprioout;
	wire  wire_transmit_pcs1_forceelecidleout;
	wire  [2:0]   wire_transmit_pcs1_grayelecidleinferselout;
	wire  wire_transmit_pcs1_phfiforddisableout;
	wire  wire_transmit_pcs1_phfiforesetout;
	wire  wire_transmit_pcs1_phfifowrenableout;
	wire  wire_transmit_pcs1_pipeenrevparallellpbkout;
	wire  [1:0]   wire_transmit_pcs1_pipepowerdownout;
	wire  [3:0]   wire_transmit_pcs1_pipepowerstateout;
	wire  wire_transmit_pcs1_txdetectrx;
	wire  wire_transmit_pcs2_coreclkout;
	wire  [19:0]   wire_transmit_pcs2_dataout;
	wire  [149:0]   wire_transmit_pcs2_dprioout;
	wire  wire_transmit_pcs2_forceelecidleout;
	wire  [2:0]   wire_transmit_pcs2_grayelecidleinferselout;
	wire  wire_transmit_pcs2_phfiforddisableout;
	wire  wire_transmit_pcs2_phfiforesetout;
	wire  wire_transmit_pcs2_phfifowrenableout;
	wire  wire_transmit_pcs2_pipeenrevparallellpbkout;
	wire  [1:0]   wire_transmit_pcs2_pipepowerdownout;
	wire  [3:0]   wire_transmit_pcs2_pipepowerstateout;
	wire  wire_transmit_pcs2_txdetectrx;
	wire  wire_transmit_pcs3_coreclkout;
	wire  [19:0]   wire_transmit_pcs3_dataout;
	wire  [149:0]   wire_transmit_pcs3_dprioout;
	wire  wire_transmit_pcs3_forceelecidleout;
	wire  [2:0]   wire_transmit_pcs3_grayelecidleinferselout;
	wire  wire_transmit_pcs3_phfiforddisableout;
	wire  wire_transmit_pcs3_phfiforesetout;
	wire  wire_transmit_pcs3_phfifowrenableout;
	wire  wire_transmit_pcs3_pipeenrevparallellpbkout;
	wire  [1:0]   wire_transmit_pcs3_pipepowerdownout;
	wire  [3:0]   wire_transmit_pcs3_pipepowerstateout;
	wire  wire_transmit_pcs3_txdetectrx;
	wire  wire_transmit_pma0_clockout;
	wire  wire_transmit_pma0_dataout;
	wire  [299:0]   wire_transmit_pma0_dprioout;
	wire  wire_transmit_pma0_rxdetectvalidout;
	wire  wire_transmit_pma0_rxfoundout;
	wire  wire_transmit_pma1_clockout;
	wire  wire_transmit_pma1_dataout;
	wire  [299:0]   wire_transmit_pma1_dprioout;
	wire  wire_transmit_pma1_rxdetectvalidout;
	wire  wire_transmit_pma1_rxfoundout;
	wire  wire_transmit_pma2_clockout;
	wire  wire_transmit_pma2_dataout;
	wire  [299:0]   wire_transmit_pma2_dprioout;
	wire  wire_transmit_pma2_rxdetectvalidout;
	wire  wire_transmit_pma2_rxfoundout;
	wire  wire_transmit_pma3_clockout;
	wire  wire_transmit_pma3_dataout;
	wire  [299:0]   wire_transmit_pma3_dprioout;
	wire  wire_transmit_pma3_rxdetectvalidout;
	wire  wire_transmit_pma3_rxfoundout;
	wire cal_blk_powerdown;
	wire  [0:0]  cent_unit_clkdivpowerdn;
	wire  [599:0]  cent_unit_cmudividerdprioout;
	wire  [1799:0]  cent_unit_cmuplldprioout;
	wire  [1:0]  cent_unit_pllpowerdn;
	wire  [1:0]  cent_unit_pllresetout;
	wire  [0:0]  cent_unit_quadresetout;
	wire  [5:0]  cent_unit_rxcrupowerdn;
	wire  [5:0]  cent_unit_rxibpowerdn;
	wire  [1599:0]  cent_unit_rxpcsdprioin;
	wire  [1599:0]  cent_unit_rxpcsdprioout;
	wire  [1799:0]  cent_unit_rxpmadprioin;
	wire  [1799:0]  cent_unit_rxpmadprioout;
	wire  [1199:0]  cent_unit_tx_dprioin;
	wire  [31:0]  cent_unit_tx_xgmdataout;
	wire  [3:0]  cent_unit_txctrlout;
	wire  [5:0]  cent_unit_txdetectrxpowerdn;
	wire  [599:0]  cent_unit_txdprioout;
	wire  [5:0]  cent_unit_txobpowerdn;
	wire  [1799:0]  cent_unit_txpmadprioin;
	wire  [1799:0]  cent_unit_txpmadprioout;
	wire  [3:0]  clk_div_clk0in;
	wire  [599:0]  clk_div_cmudividerdprioin;
	wire  [1:0]  cmu_analogfastrefclkout;
	wire  [1:0]  cmu_analogrefclkout;
	wire  [0:0]  cmu_analogrefclkpulse;
	wire  [0:0]  coreclkout_wire;
	wire  [5:0]  fixedclk_div_in;
	wire  [0:0]  fixedclk_enable;
	wire [5:0]  fixedclk_fast;
	wire  [5:0]  fixedclk_in;
	wire  [0:0]  fixedclk_sel;
	wire  [5:0]  fixedclk_to_cmu;
	wire  [0:0]  int_autospdx4configsel;
	wire  [0:0]  int_autospdx4rateswitchout;
	wire  [0:0]  int_autospdx4spdchg;
	wire  [3:0]  int_hipautospdrateswitchout;
	wire  [0:0]  int_hiprateswtichdone;
	wire  [0:0]  int_phfifiox4ptrsreset;
	wire  [3:0]  int_pipeenrevparallellpbkfromtx;
	wire  [0:0]  int_rateswitch;
	wire  [11:0]  int_rx_autospdxnconfigsel;
	wire  [11:0]  int_rx_autospdxnspdchg;
	wire  [3:0]  int_rx_coreclkout;
	wire  [0:0]  int_rx_digitalreset_reg;
	wire  [11:0]  int_rx_phfifioxnptrsreset;
	wire  [3:0]  int_rx_phfifobyteserdisable;
	wire  [3:0]  int_rx_phfifoptrsresetout;
	wire  [3:0]  int_rx_phfifordenableout;
	wire  [3:0]  int_rx_phfiforesetout;
	wire  [3:0]  int_rx_phfifowrdisableout;
	wire  [11:0]  int_rx_phfifoxnbytesel;
	wire  [11:0]  int_rx_phfifoxnrdenable;
	wire  [11:0]  int_rx_phfifoxnwrclk;
	wire  [11:0]  int_rx_phfifoxnwrenable;
	wire  [3:0]  int_rx_rateswitchout;
	wire  [0:0]  int_rxcoreclk;
	wire  [3:0]  int_rxpcs_cdrctrlearlyeios;
	wire  [0:0]  int_rxphfifordenable;
	wire  [0:0]  int_rxphfiforeset;
	wire  [0:0]  int_rxphfifox4byteselout;
	wire  [0:0]  int_rxphfifox4rdenableout;
	wire  [0:0]  int_rxphfifox4wrclkout;
	wire  [0:0]  int_rxphfifox4wrenableout;
	wire  [3:0]  int_tx_coreclkout;
	wire  [0:0]  int_tx_digitalreset_reg;
	wire  [11:0]  int_tx_phfifioxnptrsreset;
	wire  [3:0]  int_tx_phfiforddisableout;
	wire  [3:0]  int_tx_phfiforesetout;
	wire  [3:0]  int_tx_phfifowrenableout;
	wire  [11:0]  int_tx_phfifoxnbytesel;
	wire  [11:0]  int_tx_phfifoxnrdclk;
	wire  [11:0]  int_tx_phfifoxnrdenable;
	wire  [11:0]  int_tx_phfifoxnwrenable;
	wire  [0:0]  int_txcoreclk;
	wire  [0:0]  int_txphfiforddisable;
	wire  [0:0]  int_txphfiforeset;
	wire  [0:0]  int_txphfifowrenable;
	wire  [0:0]  int_txphfifox4byteselout;
	wire  [0:0]  int_txphfifox4rdclkout;
	wire  [0:0]  int_txphfifox4rdenableout;
	wire  [0:0]  int_txphfifox4wrenableout;
	wire  [0:0]  nonusertocmu_out;
	wire  [3:0]  pipedatavalid_out;
	wire  [3:0]  pipeelecidle_out;
	wire  [9:0]  pll0_clkin;
	wire  [299:0]  pll0_dprioin;
	wire  [299:0]  pll0_dprioout;
	wire  [3:0]  pll0_out;
	wire  [7:0]  pll_ch_dataout_wire;
	wire  [1199:0]  pll_ch_dprioout;
	wire  [1799:0]  pll_cmuplldprioout;
	wire  [0:0]  pll_inclk_wire;
	wire  [0:0]  pll_locked_out;
	wire  [1:0]  pllpowerdn_in;
	wire  [1:0]  pllreset_in;
	wire  [0:0]  reconfig_togxb_busy;
	wire  [0:0]  reconfig_togxb_disable;
	wire  [0:0]  reconfig_togxb_in;
	wire  [0:0]  reconfig_togxb_load;
	wire  [0:0]  refclk_pma;
	wire  [5:0]  rx_analogreset_in;
	wire  [5:0]  rx_analogreset_out;
	wire  [39:0]  rx_cruclk_in;
	wire  [15:0]  rx_deserclock_in;
	wire  [3:0]  rx_digitalreset_in;
	wire  [3:0]  rx_digitalreset_out;
	wire [3:0]  rx_enapatternalign;
	wire  [3:0]  rx_freqlocked_wire;
	wire [3:0]  rx_locktodata;
	wire  [3:0]  rx_locktodata_wire;
	wire  [3:0]  rx_locktorefclk_wire;
	wire  [31:0]  rx_out_wire;
	wire  [7:0]  rx_pcs_rxfound_wire;
	wire  [1599:0]  rx_pcsdprioin_wire;
	wire  [1599:0]  rx_pcsdprioout;
	wire [3:0]  rx_phfifordenable;
	wire [3:0]  rx_phfiforeset;
	wire [3:0]  rx_phfifowrdisable;
	wire  [3:0]  rx_pipestatetransdoneout;
	wire  [3:0]  rx_pldcruclk_in;
	wire  [15:0]  rx_pll_clkout;
	wire  [3:0]  rx_pll_pfdrefclkout_wire;
	wire  [3:0]  rx_plllocked_wire;
	wire  [67:0]  rx_pma_analogtestbus;
	wire  [3:0]  rx_pma_clockout;
	wire  [3:0]  rx_pma_dataout;
	wire  [3:0]  rx_pma_locktorefout;
	wire  [79:0]  rx_pma_recoverdataout_wire;
	wire  [1799:0]  rx_pmadprioin_wire;
	wire  [1799:0]  rx_pmadprioout;
	wire [3:0]  rx_powerdown;
	wire  [5:0]  rx_powerdown_in;
	wire [3:0]  rx_prbscidenable;
	wire  [79:0]  rx_revparallelfdbkdata;
	wire [3:0]  rx_rmfiforeset;
	wire  [5:0]  rx_rxcruresetout;
	wire  [3:0]  rx_signaldetect_wire;
	wire  [3:0]  rx_signaldetectout_wire;
	wire  [0:0]  rxphfifowrdisable;
	wire  [1799:0]  rxpll_dprioin;
	wire  [5:0]  tx_analogreset_out;
	wire  [3:0]  tx_clkout_int_wire;
	wire  [31:0]  tx_datain_wire;
	wire  [79:0]  tx_dataout_pcs_to_pma;
	wire  [3:0]  tx_digitalreset_in;
	wire  [3:0]  tx_digitalreset_out;
	wire  [1199:0]  tx_dprioin_wire;
	wire [3:0]  tx_invpolarity;
	wire  [3:0]  tx_localrefclk;
	wire  [3:0]  tx_pcs_forceelecidleout;
	wire [3:0]  tx_phfiforeset;
	wire  [7:0]  tx_pipepowerdownout;
	wire  [15:0]  tx_pipepowerstateout;
	wire [3:0]  tx_pipeswing;
	wire  [1799:0]  tx_pmadprioin_wire;
	wire  [1799:0]  tx_pmadprioout;
	wire [3:0]  tx_revparallellpbken;
	wire  [3:0]  tx_rxdetectvalidout;
	wire  [3:0]  tx_rxfoundout;
	wire  [599:0]  tx_txdprioout;
	wire  [3:0]  txdetectrxout;
	wire  [0:0]  w_cent_unit_dpriodisableout1w;
	// synopsys translate_off
	initial
		fixedclk_div0quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div0quad0c_clk)
		  fixedclk_div0quad0c <= (~ fixedclk_div_in[0]);
	assign
		wire_fixedclk_div0quad0c_clk = fixedclk_in[0];
	// synopsys translate_off
	initial
		fixedclk_div1quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div1quad0c_clk)
		  fixedclk_div1quad0c <= (~ fixedclk_div_in[1]);
	assign
		wire_fixedclk_div1quad0c_clk = fixedclk_in[1];
	// synopsys translate_off
	initial
		fixedclk_div2quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div2quad0c_clk)
		  fixedclk_div2quad0c <= (~ fixedclk_div_in[2]);
	assign
		wire_fixedclk_div2quad0c_clk = fixedclk_in[2];
	// synopsys translate_off
	initial
		fixedclk_div3quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div3quad0c_clk)
		  fixedclk_div3quad0c <= (~ fixedclk_div_in[3]);
	assign
		wire_fixedclk_div3quad0c_clk = fixedclk_in[3];
	// synopsys translate_off
	initial
		fixedclk_div4quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div4quad0c_clk)
		  fixedclk_div4quad0c <= (~ fixedclk_div_in[4]);
	assign
		wire_fixedclk_div4quad0c_clk = fixedclk_in[4];
	// synopsys translate_off
	initial
		fixedclk_div5quad0c = 0;
	// synopsys translate_on
	always @ ( posedge wire_fixedclk_div5quad0c_clk)
		  fixedclk_div5quad0c <= (~ fixedclk_div_in[5]);
	assign
		wire_fixedclk_div5quad0c_clk = fixedclk_in[5];
	// synopsys translate_off
	initial
		reconfig_togxb_busy_reg = 0;
	// synopsys translate_on
	always @ ( negedge fixedclk)
		  reconfig_togxb_busy_reg <= {reconfig_togxb_busy_reg[0], reconfig_togxb_busy};
	// synopsys translate_off
	initial
		rx_digitalreset_reg0c[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge wire_rx_digitalreset_reg0c_clk[0:0])
		  rx_digitalreset_reg0c[0:0] <= wire_rx_digitalreset_reg0c_d[0:0];
	// synopsys translate_off
	initial
		rx_digitalreset_reg0c[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge wire_rx_digitalreset_reg0c_clk[1:1])
		  rx_digitalreset_reg0c[1:1] <= wire_rx_digitalreset_reg0c_d[1:1];
	// synopsys translate_off
	initial
		rx_digitalreset_reg0c[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge wire_rx_digitalreset_reg0c_clk[2:2])
		  rx_digitalreset_reg0c[2:2] <= wire_rx_digitalreset_reg0c_d[2:2];
	assign
		wire_rx_digitalreset_reg0c_d = {rx_digitalreset_reg0c[1:0], rx_digitalreset[0]};
	assign
		wire_rx_digitalreset_reg0c_clk = {3{coreclkout_wire[0]}};
	// synopsys translate_off
	initial
		tx_digitalreset_reg0c[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge wire_tx_digitalreset_reg0c_clk[0:0])
		  tx_digitalreset_reg0c[0:0] <= wire_tx_digitalreset_reg0c_d[0:0];
	// synopsys translate_off
	initial
		tx_digitalreset_reg0c[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge wire_tx_digitalreset_reg0c_clk[1:1])
		  tx_digitalreset_reg0c[1:1] <= wire_tx_digitalreset_reg0c_d[1:1];
	// synopsys translate_off
	initial
		tx_digitalreset_reg0c[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge wire_tx_digitalreset_reg0c_clk[2:2])
		  tx_digitalreset_reg0c[2:2] <= wire_tx_digitalreset_reg0c_d[2:2];
	assign
		wire_tx_digitalreset_reg0c_d = {tx_digitalreset_reg0c[1:0], tx_digitalreset[0]};
	assign
		wire_tx_digitalreset_reg0c_clk = {3{coreclkout_wire[0]}};
	stratixiv_hssi_calibration_block   cal_blk0
	(
	.calibrationstatus(),
	.clk(cal_blk_clk),
	.enabletestbus(1'b1),
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
	stratixiv_hssi_clock_divider   central_clk_div0
	(
	.analogfastrefclkout(wire_central_clk_div0_analogfastrefclkout),
	.analogfastrefclkoutshifted(),
	.analogrefclkout(wire_central_clk_div0_analogrefclkout),
	.analogrefclkoutshifted(),
	.analogrefclkpulse(wire_central_clk_div0_analogrefclkpulse),
	.analogrefclkpulseshifted(),
	.clk0in(clk_div_clk0in[3:0]),
	.coreclkout(wire_central_clk_div0_coreclkout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(cent_unit_cmudividerdprioout[499:400]),
	.dprioout(wire_central_clk_div0_dprioout),
	.powerdn(cent_unit_clkdivpowerdn[0]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitch(int_autospdx4rateswitchout[0]),
	.rateswitchbaseclock(wire_central_clk_div0_rateswitchbaseclock),
	.rateswitchdone(wire_central_clk_div0_rateswitchdone),
	.rateswitchout(),
	.refclkout(wire_central_clk_div0_refclkout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1in({4{1'b0}}),
	.rateswitchbaseclkin({2{1'b0}}),
	.rateswitchdonein({2{1'b0}}),
	.refclkdig(1'b0),
	.refclkin({2{1'b0}}),
	.vcobypassin(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		central_clk_div0.divide_by = 5,
		central_clk_div0.divider_type = "CENTRAL_ENHANCED",
		central_clk_div0.effective_data_rate = "5000 Mbps",
		central_clk_div0.enable_dynamic_divider = "true",
		central_clk_div0.enable_refclk_out = "true",
		central_clk_div0.inclk_select = 0,
		central_clk_div0.logical_channel_address = 0,
		central_clk_div0.pre_divide_by = 1,
		central_clk_div0.refclkin_select = 0,
		central_clk_div0.select_local_rate_switch_base_clock = "true",
		central_clk_div0.select_local_rate_switch_done = "true",
		central_clk_div0.select_local_refclk = "true",
		central_clk_div0.sim_analogfastrefclkout_phase_shift = 0,
		central_clk_div0.sim_analogrefclkout_phase_shift = 0,
		central_clk_div0.sim_coreclkout_phase_shift = 0,
		central_clk_div0.sim_refclkout_phase_shift = 0,
		central_clk_div0.use_coreclk_out_post_divider = "false",
		central_clk_div0.use_refclk_post_divider = "false",
		central_clk_div0.use_vco_bypass = "false",
		central_clk_div0.lpm_type = "stratixiv_hssi_clock_divider";
	stratixiv_hssi_cmu   cent_unit0
	(
	.adet({4{1'b0}}),
	.alignstatus(),
	.autospdx4configsel(wire_cent_unit0_autospdx4configsel),
	.autospdx4rateswitchout(wire_cent_unit0_autospdx4rateswitchout),
	.autospdx4spdchg(wire_cent_unit0_autospdx4spdchg),
	.clkdivpowerdn(wire_cent_unit0_clkdivpowerdn),
	.cmudividerdprioin({clk_div_cmudividerdprioin[599:0]}),
	.cmudividerdprioout(wire_cent_unit0_cmudividerdprioout),
	.cmuplldprioin(pll_cmuplldprioout[1799:0]),
	.cmuplldprioout(wire_cent_unit0_cmuplldprioout),
	.digitaltestout(),
	.dpclk(reconfig_clk),
	.dpriodisable(reconfig_togxb_disable),
	.dpriodisableout(wire_cent_unit0_dpriodisableout),
	.dprioin(reconfig_togxb_in),
	.dprioload(reconfig_togxb_load),
	.dpriooe(),
	.dprioout(wire_cent_unit0_dprioout),
	.enabledeskew(),
	.extra10gout(),
	.fiforesetrd(),
	.fixedclk({{2{1'b0}}, fixedclk_to_cmu[3:0]}),
	.lccmutestbus(),
	.nonuserfromcal(nonusertocmu_out[0]),
	.phfifiox4ptrsreset(wire_cent_unit0_phfifiox4ptrsreset),
	.pllpowerdn(wire_cent_unit0_pllpowerdn),
	.pllresetout(wire_cent_unit0_pllresetout),
	.quadreset(gxb_powerdown[0]),
	.quadresetout(wire_cent_unit0_quadresetout),
	.rateswitch(int_rateswitch[0]),
	.rateswitchdonein(int_hiprateswtichdone[0]),
	.rdalign({4{1'b0}}),
	.rdenablesync(1'b0),
	.recovclk(1'b0),
	.refclkdividerdprioin({2{1'b0}}),
	.refclkdividerdprioout(),
	.rxadcepowerdown(),
	.rxadceresetout(),
	.rxanalogreset({{2{1'b0}}, rx_analogreset_in[3:0]}),
	.rxanalogresetout(wire_cent_unit0_rxanalogresetout),
	.rxclk(refclk_pma[0]),
	.rxcoreclk(int_rxcoreclk[0]),
	.rxcrupowerdown(wire_cent_unit0_rxcrupowerdown),
	.rxcruresetout(wire_cent_unit0_rxcruresetout),
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
	.rxphfifordenable(int_rxphfifordenable[0]),
	.rxphfiforeset(int_rxphfiforeset[0]),
	.rxphfifowrdisable(rxphfifowrdisable[0]),
	.rxphfifox4byteselout(wire_cent_unit0_rxphfifox4byteselout),
	.rxphfifox4rdenableout(wire_cent_unit0_rxphfifox4rdenableout),
	.rxphfifox4wrclkout(wire_cent_unit0_rxphfifox4wrclkout),
	.rxphfifox4wrenableout(wire_cent_unit0_rxphfifox4wrenableout),
	.rxpmadprioin({cent_unit_rxpmadprioin[1799:0]}),
	.rxpmadprioout(wire_cent_unit0_rxpmadprioout),
	.rxpowerdown({{2{1'b0}}, rx_powerdown_in[3:0]}),
	.rxrunningdisp({4{1'b0}}),
	.scanout(),
	.syncstatus({4{1'b0}}),
	.testout(),
	.txanalogresetout(wire_cent_unit0_txanalogresetout),
	.txclk(refclk_pma[0]),
	.txcoreclk(int_txcoreclk[0]),
	.txctrl({4{1'b0}}),
	.txctrlout(wire_cent_unit0_txctrlout),
	.txdatain({32{1'b0}}),
	.txdataout(wire_cent_unit0_txdataout),
	.txdetectrxpowerdown(wire_cent_unit0_txdetectrxpowerdown),
	.txdigitalreset({tx_digitalreset_in[3:0]}),
	.txdigitalresetout(wire_cent_unit0_txdigitalresetout),
	.txdividerpowerdown(),
	.txobpowerdown(wire_cent_unit0_txobpowerdown),
	.txpcsdprioin({cent_unit_tx_dprioin[599:0]}),
	.txpcsdprioout(wire_cent_unit0_txpcsdprioout),
	.txphfiforddisable(int_txphfiforddisable[0]),
	.txphfiforeset(int_txphfiforeset[0]),
	.txphfifowrenable(int_txphfifowrenable[0]),
	.txphfifox4byteselout(wire_cent_unit0_txphfifox4byteselout),
	.txphfifox4rdclkout(wire_cent_unit0_txphfifox4rdclkout),
	.txphfifox4rdenableout(wire_cent_unit0_txphfifox4rdenableout),
	.txphfifox4wrenableout(wire_cent_unit0_txphfifox4wrenableout),
	.txpllreset({{1{1'b0}}, pll_powerdown[0]}),
	.txpmadprioin({cent_unit_txpmadprioin[1799:0]}),
	.txpmadprioout(wire_cent_unit0_txpmadprioout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({7{1'b0}}),
	.lccmurtestbussel({3{1'b0}}),
	.pmacramtest(1'b0),
	.scanclk(1'b0),
	.scanin({23{1'b0}}),
	.scanmode(1'b0),
	.scanshift(1'b0),
	.testin({10000{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cent_unit0.auto_spd_deassert_ph_fifo_rst_count = 8,
		cent_unit0.auto_spd_phystatus_notify_count = 14,
		cent_unit0.bonded_quad_mode = "none",
		cent_unit0.devaddr = ((((starting_channel_number / 4) + 0) % 32) + 1),
		cent_unit0.in_xaui_mode = "false",
		cent_unit0.offset_all_errors_align = "false",
		cent_unit0.pipe_auto_speed_nego_enable = "true",
		cent_unit0.pipe_freq_scale_mode = "Frequency",
		cent_unit0.pma_done_count = 249950,
		cent_unit0.portaddr = (((starting_channel_number + 0) / 128) + 1),
		cent_unit0.rx0_auto_spd_self_switch_enable = "false",
		cent_unit0.rx0_channel_bonding = "x4",
		cent_unit0.rx0_clk1_mux_select = "recovered clock",
		cent_unit0.rx0_clk2_mux_select = "digital reference clock",
		cent_unit0.rx0_ph_fifo_reg_mode = "true",
		cent_unit0.rx0_rd_clk_mux_select = "int clock",
		cent_unit0.rx0_recovered_clk_mux_select = "recovered clock",
		cent_unit0.rx0_reset_clock_output_during_digital_reset = "false",
		cent_unit0.rx0_use_double_data_mode = "false",
		cent_unit0.tx0_auto_spd_self_switch_enable = "false",
		cent_unit0.tx0_channel_bonding = "x4",
		cent_unit0.tx0_ph_fifo_reg_mode = "true",
		cent_unit0.tx0_rd_clk_mux_select = "cmu_clock_divider",
		cent_unit0.tx0_use_double_data_mode = "false",
		cent_unit0.tx0_wr_clk_mux_select = "int_clk",
		cent_unit0.use_deskew_fifo = "false",
		cent_unit0.vcceh_voltage = "Auto",
		cent_unit0.lpm_type = "stratixiv_hssi_cmu";
	stratixiv_hssi_pll   rx_cdr_pll0
	(
	.areset(rx_rxcruresetout[0]),
	.clk(wire_rx_cdr_pll0_clk),
	.datain(rx_pma_dataout[0]),
	.dataout(wire_rx_cdr_pll0_dataout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rxpll_dprioin[299:0]),
	.dprioout(wire_rx_cdr_pll0_dprioout),
	.earlyeios(int_rxpcs_cdrctrlearlyeios[0]),
	.freqlocked(wire_rx_cdr_pll0_freqlocked),
	.inclk({rx_cruclk_in[9:0]}),
	.locked(wire_rx_cdr_pll0_locked),
	.locktorefclk(rx_pma_locktorefout[0]),
	.pfdfbclkout(),
	.pfdrefclkout(wire_rx_cdr_pll0_pfdrefclkout),
	.powerdown(cent_unit_rxcrupowerdn[0]),
	.rateswitch(int_hipautospdrateswitchout[0]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({6{1'b0}}),
	.pfdfbclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rx_cdr_pll0.bandwidth_type = "Auto",
		rx_cdr_pll0.channel_num = ((starting_channel_number + 0) % 4),
		rx_cdr_pll0.dprio_config_mode = 6'h00,
		rx_cdr_pll0.effective_data_rate = "5000 Mbps",
		rx_cdr_pll0.enable_dynamic_divider = "true",
		rx_cdr_pll0.fast_lock_control = "false",
		rx_cdr_pll0.inclk0_input_period = 10000,
		rx_cdr_pll0.input_clock_frequency = "100.0 MHz",
		rx_cdr_pll0.m = 25,
		rx_cdr_pll0.n = 1,
		rx_cdr_pll0.pfd_clk_select = 0,
		rx_cdr_pll0.pll_type = "RX CDR",
		rx_cdr_pll0.use_refclk_pin = "false",
		rx_cdr_pll0.vco_post_scale = 1,
		rx_cdr_pll0.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   rx_cdr_pll1
	(
	.areset(rx_rxcruresetout[1]),
	.clk(wire_rx_cdr_pll1_clk),
	.datain(rx_pma_dataout[1]),
	.dataout(wire_rx_cdr_pll1_dataout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rxpll_dprioin[599:300]),
	.dprioout(wire_rx_cdr_pll1_dprioout),
	.earlyeios(int_rxpcs_cdrctrlearlyeios[1]),
	.freqlocked(wire_rx_cdr_pll1_freqlocked),
	.inclk({rx_cruclk_in[19:10]}),
	.locked(wire_rx_cdr_pll1_locked),
	.locktorefclk(rx_pma_locktorefout[1]),
	.pfdfbclkout(),
	.pfdrefclkout(wire_rx_cdr_pll1_pfdrefclkout),
	.powerdown(cent_unit_rxcrupowerdn[1]),
	.rateswitch(int_hipautospdrateswitchout[1]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({6{1'b0}}),
	.pfdfbclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rx_cdr_pll1.bandwidth_type = "Auto",
		rx_cdr_pll1.channel_num = ((starting_channel_number + 1) % 4),
		rx_cdr_pll1.dprio_config_mode = 6'h00,
		rx_cdr_pll1.effective_data_rate = "5000 Mbps",
		rx_cdr_pll1.enable_dynamic_divider = "true",
		rx_cdr_pll1.fast_lock_control = "false",
		rx_cdr_pll1.inclk0_input_period = 10000,
		rx_cdr_pll1.input_clock_frequency = "100.0 MHz",
		rx_cdr_pll1.m = 25,
		rx_cdr_pll1.n = 1,
		rx_cdr_pll1.pfd_clk_select = 0,
		rx_cdr_pll1.pll_type = "RX CDR",
		rx_cdr_pll1.use_refclk_pin = "false",
		rx_cdr_pll1.vco_post_scale = 1,
		rx_cdr_pll1.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   rx_cdr_pll2
	(
	.areset(rx_rxcruresetout[2]),
	.clk(wire_rx_cdr_pll2_clk),
	.datain(rx_pma_dataout[2]),
	.dataout(wire_rx_cdr_pll2_dataout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rxpll_dprioin[899:600]),
	.dprioout(wire_rx_cdr_pll2_dprioout),
	.earlyeios(int_rxpcs_cdrctrlearlyeios[2]),
	.freqlocked(wire_rx_cdr_pll2_freqlocked),
	.inclk({rx_cruclk_in[29:20]}),
	.locked(wire_rx_cdr_pll2_locked),
	.locktorefclk(rx_pma_locktorefout[2]),
	.pfdfbclkout(),
	.pfdrefclkout(wire_rx_cdr_pll2_pfdrefclkout),
	.powerdown(cent_unit_rxcrupowerdn[2]),
	.rateswitch(int_hipautospdrateswitchout[2]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({6{1'b0}}),
	.pfdfbclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rx_cdr_pll2.bandwidth_type = "Auto",
		rx_cdr_pll2.channel_num = ((starting_channel_number + 2) % 4),
		rx_cdr_pll2.dprio_config_mode = 6'h00,
		rx_cdr_pll2.effective_data_rate = "5000 Mbps",
		rx_cdr_pll2.enable_dynamic_divider = "true",
		rx_cdr_pll2.fast_lock_control = "false",
		rx_cdr_pll2.inclk0_input_period = 10000,
		rx_cdr_pll2.input_clock_frequency = "100.0 MHz",
		rx_cdr_pll2.m = 25,
		rx_cdr_pll2.n = 1,
		rx_cdr_pll2.pfd_clk_select = 0,
		rx_cdr_pll2.pll_type = "RX CDR",
		rx_cdr_pll2.use_refclk_pin = "false",
		rx_cdr_pll2.vco_post_scale = 1,
		rx_cdr_pll2.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   rx_cdr_pll3
	(
	.areset(rx_rxcruresetout[3]),
	.clk(wire_rx_cdr_pll3_clk),
	.datain(rx_pma_dataout[3]),
	.dataout(wire_rx_cdr_pll3_dataout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rxpll_dprioin[1199:900]),
	.dprioout(wire_rx_cdr_pll3_dprioout),
	.earlyeios(int_rxpcs_cdrctrlearlyeios[3]),
	.freqlocked(wire_rx_cdr_pll3_freqlocked),
	.inclk({rx_cruclk_in[39:30]}),
	.locked(wire_rx_cdr_pll3_locked),
	.locktorefclk(rx_pma_locktorefout[3]),
	.pfdfbclkout(),
	.pfdrefclkout(wire_rx_cdr_pll3_pfdrefclkout),
	.powerdown(cent_unit_rxcrupowerdn[3]),
	.rateswitch(int_hipautospdrateswitchout[3]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({6{1'b0}}),
	.pfdfbclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rx_cdr_pll3.bandwidth_type = "Auto",
		rx_cdr_pll3.channel_num = ((starting_channel_number + 3) % 4),
		rx_cdr_pll3.dprio_config_mode = 6'h00,
		rx_cdr_pll3.effective_data_rate = "5000 Mbps",
		rx_cdr_pll3.enable_dynamic_divider = "true",
		rx_cdr_pll3.fast_lock_control = "false",
		rx_cdr_pll3.inclk0_input_period = 10000,
		rx_cdr_pll3.input_clock_frequency = "100.0 MHz",
		rx_cdr_pll3.m = 25,
		rx_cdr_pll3.n = 1,
		rx_cdr_pll3.pfd_clk_select = 0,
		rx_cdr_pll3.pll_type = "RX CDR",
		rx_cdr_pll3.use_refclk_pin = "false",
		rx_cdr_pll3.vco_post_scale = 1,
		rx_cdr_pll3.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   tx_pll0
	(
	.areset(pllreset_in[0]),
	.clk(wire_tx_pll0_clk),
	.dataout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(pll0_dprioin[299:0]),
	.dprioout(wire_tx_pll0_dprioout),
	.freqlocked(),
	.inclk({pll0_clkin[9:0]}),
	.locked(wire_tx_pll0_locked),
	.pfdfbclkout(),
	.pfdrefclkout(),
	.powerdown(pllpowerdn_in[0]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datain(1'b0),
	.earlyeios(1'b0),
	.extra10gin({6{1'b0}}),
	.locktorefclk(1'b1),
	.pfdfbclk(1'b0),
	.rateswitch(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		tx_pll0.bandwidth_type = "High",
		tx_pll0.channel_num = 4,
		tx_pll0.dprio_config_mode = 6'h00,
		tx_pll0.inclk0_input_period = 10000,
		tx_pll0.input_clock_frequency = "100.0 MHz",
		tx_pll0.logical_tx_pll_number = 0,
		tx_pll0.m = 25,
		tx_pll0.n = 1,
		tx_pll0.pfd_clk_select = 0,
		tx_pll0.pfd_fb_select = "internal",
		tx_pll0.pll_type = "CMU",
		tx_pll0.use_refclk_pin = "false",
		tx_pll0.vco_post_scale = 1,
		tx_pll0.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_rx_pcs   receive_pcs0
	(
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.autospdrateswitchout(wire_receive_pcs0_autospdrateswitchout),
	.autospdspdchgout(),
	.autospdxnconfigsel(int_rx_autospdxnconfigsel[2:0]),
	.autospdxnspdchg(int_rx_autospdxnspdchg[2:0]),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(wire_receive_pcs0_cdrctrlearlyeios),
	.cdrctrllocktorefclkout(wire_receive_pcs0_cdrctrllocktorefclkout),
	.clkout(),
	.coreclkout(wire_receive_pcs0_coreclkout),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[19:0]),
	.dataout(),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[0]),
	.digitaltestout(),
	.disablefifordin(1'b0),
	.disablefifordout(),
	.disablefifowrin(1'b0),
	.disablefifowrout(),
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
	.hiprateswitch(rateswitch[0]),
	.hipstatus(wire_receive_pcs0_hipstatus),
	.invpol(1'b0),
	.iqpphfifobyteselout(),
	.iqpphfifoptrsresetout(),
	.iqpphfifordenableout(),
	.iqpphfifowrclkout(),
	.iqpphfifowrenableout(),
	.k1detect(),
	.k2detect(),
	.localrefclk(1'b0),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifobyteselout(),
	.phfifobyteserdisableout(wire_receive_pcs0_phfifobyteserdisableout),
	.phfifooverflow(),
	.phfifoptrsresetout(wire_receive_pcs0_phfifoptrsresetout),
	.phfifordenable(rx_phfifordenable[0]),
	.phfifordenableout(wire_receive_pcs0_phfifordenableout),
	.phfiforeset(rx_phfiforeset[0]),
	.phfiforesetout(wire_receive_pcs0_phfiforesetout),
	.phfifounderflow(),
	.phfifowrclkout(),
	.phfifowrdisable(rx_phfifowrdisable[0]),
	.phfifowrdisableout(wire_receive_pcs0_phfifowrdisableout),
	.phfifowrenableout(),
	.phfifoxnbytesel(int_rx_phfifoxnbytesel[2:0]),
	.phfifoxnptrsreset(int_rx_phfifioxnptrsreset[2:0]),
	.phfifoxnrdenable(int_rx_phfifoxnrdenable[2:0]),
	.phfifoxnwrclk(int_rx_phfifoxnwrclk[2:0]),
	.phfifoxnwrenable(int_rx_phfifoxnwrenable[2:0]),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipeenrevparallellpbkfromtx(int_pipeenrevparallellpbkfromtx[0]),
	.pipephydonestatus(),
	.pipepowerdown(tx_pipepowerdownout[1:0]),
	.pipepowerstate(tx_pipepowerstateout[3:0]),
	.pipestatetransdoneout(wire_receive_pcs0_pipestatetransdoneout),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[0]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(wire_receive_pcs0_rateswitchout),
	.rateswitchxndone(int_hiprateswtichdone[0]),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[0]),
	.refclk(refclk_pma[0]),
	.revbitorderwa(1'b0),
	.revbyteorderwa(1'b0),
	.revparallelfdbkdata(wire_receive_pcs0_revparallelfdbkdata),
	.rlv(),
	.rmfifoalmostempty(),
	.rmfifoalmostfull(),
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
	.signaldetect(wire_receive_pcs0_signaldetect),
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
	.iqpautospdxnspgchg({2{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnptrsreset({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrclk({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifox8bytesel(1'b0),
	.phfifox8rdenable(1'b0),
	.phfifox8wrclk(1'b0),
	.phfifox8wrenable(1'b0),
	.pipe8b10binvpolarity(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.ppmdetectdividedclk(1'b0),
	.ppmdetectrefclk(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rxelecidlerateswitch(1'b0),
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
		receive_pcs0.align_to_deskew_pattern_pos_disp_only = "false",
		receive_pcs0.allow_align_polarity_inversion = "false",
		receive_pcs0.allow_pipe_polarity_inversion = "true",
		receive_pcs0.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs0.auto_spd_phystatus_notify_count = 14,
		receive_pcs0.auto_spd_self_switch_enable = "false",
		receive_pcs0.bit_slip_enable = "false",
		receive_pcs0.byte_order_double_data_mode_mask_enable = "false",
		receive_pcs0.byte_order_invalid_code_or_run_disp_error = "true",
		receive_pcs0.byte_order_mode = "none",
		receive_pcs0.byte_order_pad_pattern = "0",
		receive_pcs0.byte_order_pattern = "0",
		receive_pcs0.byte_order_pld_ctrl_enable = "false",
		receive_pcs0.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs0.cdrctrl_cid_mode_enable = "true",
		receive_pcs0.cdrctrl_enable = "true",
		receive_pcs0.cdrctrl_rxvalid_mask = "true",
		receive_pcs0.channel_bonding = "x4",
		receive_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pcs0.channel_width = 8,
		receive_pcs0.clk1_mux_select = "recovered clock",
		receive_pcs0.clk2_mux_select = "digital reference clock",
		receive_pcs0.core_clock_0ppm = "false",
		receive_pcs0.datapath_low_latency_mode = "false",
		receive_pcs0.datapath_protocol = "pipe",
		receive_pcs0.dec_8b_10b_compatibility_mode = "true",
		receive_pcs0.dec_8b_10b_mode = "normal",
		receive_pcs0.dec_8b_10b_polarity_inv_enable = "true",
		receive_pcs0.deskew_pattern = "0",
		receive_pcs0.disable_auto_idle_insertion = "false",
		receive_pcs0.disable_running_disp_in_word_align = "false",
		receive_pcs0.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs0.dprio_config_mode = 6'h01,
		receive_pcs0.elec_idle_gen1_sigdet_enable = "true",
		receive_pcs0.elec_idle_infer_enable = "false",
		receive_pcs0.elec_idle_num_com_detect = 3,
		receive_pcs0.enable_bit_reversal = "false",
		receive_pcs0.enable_deep_align = "false",
		receive_pcs0.enable_deep_align_byte_swap = "false",
		receive_pcs0.enable_self_test_mode = "false",
		receive_pcs0.enable_true_complement_match_in_word_align = "false",
		receive_pcs0.force_signal_detect_dig = "true",
		receive_pcs0.hip_enable = "true",
		receive_pcs0.infiniband_invalid_code = 0,
		receive_pcs0.insert_pad_on_underflow = "false",
		receive_pcs0.logical_channel_address = (starting_channel_number + 0),
		receive_pcs0.num_align_code_groups_in_ordered_set = 0,
		receive_pcs0.num_align_cons_good_data = 16,
		receive_pcs0.num_align_cons_pat = 4,
		receive_pcs0.num_align_loss_sync_error = 17,
		receive_pcs0.ph_fifo_low_latency_enable = "true",
		receive_pcs0.ph_fifo_reg_mode = "true",
		receive_pcs0.ph_fifo_xn_mapping0 = "none",
		receive_pcs0.ph_fifo_xn_mapping1 = "none",
		receive_pcs0.ph_fifo_xn_mapping2 = "central",
		receive_pcs0.ph_fifo_xn_select = 2,
		receive_pcs0.pipe_auto_speed_nego_enable = "true",
		receive_pcs0.pipe_freq_scale_mode = "Frequency",
		receive_pcs0.pma_done_count = 249950,
		receive_pcs0.protocol_hint = "pcie2",
		receive_pcs0.rate_match_almost_empty_threshold = 11,
		receive_pcs0.rate_match_almost_full_threshold = 13,
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
		receive_pcs0.use_deserializer_double_data_mode = "false",
		receive_pcs0.use_deskew_fifo = "false",
		receive_pcs0.use_double_data_mode = "false",
		receive_pcs0.use_parallel_loopback = "false",
		receive_pcs0.use_rising_edge_triggered_pattern_align = "false",
		receive_pcs0.lpm_type = "stratixiv_hssi_rx_pcs";
	stratixiv_hssi_rx_pcs   receive_pcs1
	(
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.autospdrateswitchout(wire_receive_pcs1_autospdrateswitchout),
	.autospdspdchgout(),
	.autospdxnconfigsel(int_rx_autospdxnconfigsel[5:3]),
	.autospdxnspdchg(int_rx_autospdxnspdchg[5:3]),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(wire_receive_pcs1_cdrctrlearlyeios),
	.cdrctrllocktorefclkout(wire_receive_pcs1_cdrctrllocktorefclkout),
	.clkout(),
	.coreclkout(wire_receive_pcs1_coreclkout),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[39:20]),
	.dataout(),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[1]),
	.digitaltestout(),
	.disablefifordin(1'b0),
	.disablefifordout(),
	.disablefifowrin(1'b0),
	.disablefifowrout(),
	.disperr(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pcsdprioin_wire[799:400]),
	.dprioout(wire_receive_pcs1_dprioout),
	.enabledeskew(1'b0),
	.enabyteord(1'b0),
	.enapatternalign(rx_enapatternalign[1]),
	.errdetect(),
	.fifordin(1'b0),
	.fifordout(),
	.fiforesetrd(1'b0),
	.hip8b10binvpolarity(pipe8b10binvpolarity[1]),
	.hipdataout(wire_receive_pcs1_hipdataout),
	.hipdatavalid(wire_receive_pcs1_hipdatavalid),
	.hipelecidle(wire_receive_pcs1_hipelecidle),
	.hipelecidleinfersel({3{1'b0}}),
	.hipphydonestatus(wire_receive_pcs1_hipphydonestatus),
	.hippowerdown(powerdn[3:2]),
	.hiprateswitch(rateswitch[0]),
	.hipstatus(wire_receive_pcs1_hipstatus),
	.invpol(1'b0),
	.iqpphfifobyteselout(),
	.iqpphfifoptrsresetout(),
	.iqpphfifordenableout(),
	.iqpphfifowrclkout(),
	.iqpphfifowrenableout(),
	.k1detect(),
	.k2detect(),
	.localrefclk(1'b0),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifobyteselout(),
	.phfifobyteserdisableout(wire_receive_pcs1_phfifobyteserdisableout),
	.phfifooverflow(),
	.phfifoptrsresetout(wire_receive_pcs1_phfifoptrsresetout),
	.phfifordenable(rx_phfifordenable[1]),
	.phfifordenableout(wire_receive_pcs1_phfifordenableout),
	.phfiforeset(rx_phfiforeset[1]),
	.phfiforesetout(wire_receive_pcs1_phfiforesetout),
	.phfifounderflow(),
	.phfifowrclkout(),
	.phfifowrdisable(rx_phfifowrdisable[1]),
	.phfifowrdisableout(wire_receive_pcs1_phfifowrdisableout),
	.phfifowrenableout(),
	.phfifoxnbytesel(int_rx_phfifoxnbytesel[5:3]),
	.phfifoxnptrsreset(int_rx_phfifioxnptrsreset[5:3]),
	.phfifoxnrdenable(int_rx_phfifoxnrdenable[5:3]),
	.phfifoxnwrclk(int_rx_phfifoxnwrclk[5:3]),
	.phfifoxnwrenable(int_rx_phfifoxnwrenable[5:3]),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipeenrevparallellpbkfromtx(int_pipeenrevparallellpbkfromtx[1]),
	.pipephydonestatus(),
	.pipepowerdown(tx_pipepowerdownout[3:2]),
	.pipepowerstate(tx_pipepowerstateout[7:4]),
	.pipestatetransdoneout(wire_receive_pcs1_pipestatetransdoneout),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[1]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(wire_receive_pcs1_rateswitchout),
	.rateswitchxndone(int_hiprateswtichdone[0]),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[1]),
	.refclk(refclk_pma[0]),
	.revbitorderwa(1'b0),
	.revbyteorderwa(1'b0),
	.revparallelfdbkdata(wire_receive_pcs1_revparallelfdbkdata),
	.rlv(),
	.rmfifoalmostempty(),
	.rmfifoalmostfull(),
	.rmfifodatadeleted(),
	.rmfifodatainserted(),
	.rmfifoempty(),
	.rmfifofull(),
	.rmfifordena(1'b0),
	.rmfiforeset(rx_rmfiforeset[1]),
	.rmfifowrena(1'b0),
	.runningdisp(),
	.rxdetectvalid(tx_rxdetectvalidout[1]),
	.rxfound(rx_pcs_rxfound_wire[3:2]),
	.signaldetect(wire_receive_pcs1_signaldetect),
	.signaldetected(rx_signaldetect_wire[1]),
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
	.iqpautospdxnspgchg({2{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnptrsreset({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrclk({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifox8bytesel(1'b0),
	.phfifox8rdenable(1'b0),
	.phfifox8wrclk(1'b0),
	.phfifox8wrenable(1'b0),
	.pipe8b10binvpolarity(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.ppmdetectdividedclk(1'b0),
	.ppmdetectrefclk(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rxelecidlerateswitch(1'b0),
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
		receive_pcs1.align_pattern = "0101111100",
		receive_pcs1.align_pattern_length = 10,
		receive_pcs1.align_to_deskew_pattern_pos_disp_only = "false",
		receive_pcs1.allow_align_polarity_inversion = "false",
		receive_pcs1.allow_pipe_polarity_inversion = "true",
		receive_pcs1.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs1.auto_spd_phystatus_notify_count = 14,
		receive_pcs1.auto_spd_self_switch_enable = "false",
		receive_pcs1.bit_slip_enable = "false",
		receive_pcs1.byte_order_double_data_mode_mask_enable = "false",
		receive_pcs1.byte_order_invalid_code_or_run_disp_error = "true",
		receive_pcs1.byte_order_mode = "none",
		receive_pcs1.byte_order_pad_pattern = "0",
		receive_pcs1.byte_order_pattern = "0",
		receive_pcs1.byte_order_pld_ctrl_enable = "false",
		receive_pcs1.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs1.cdrctrl_cid_mode_enable = "true",
		receive_pcs1.cdrctrl_enable = "true",
		receive_pcs1.cdrctrl_rxvalid_mask = "true",
		receive_pcs1.channel_bonding = "x4",
		receive_pcs1.channel_number = ((starting_channel_number + 1) % 4),
		receive_pcs1.channel_width = 8,
		receive_pcs1.clk1_mux_select = "recovered clock",
		receive_pcs1.clk2_mux_select = "digital reference clock",
		receive_pcs1.core_clock_0ppm = "false",
		receive_pcs1.datapath_low_latency_mode = "false",
		receive_pcs1.datapath_protocol = "pipe",
		receive_pcs1.dec_8b_10b_compatibility_mode = "true",
		receive_pcs1.dec_8b_10b_mode = "normal",
		receive_pcs1.dec_8b_10b_polarity_inv_enable = "true",
		receive_pcs1.deskew_pattern = "0",
		receive_pcs1.disable_auto_idle_insertion = "false",
		receive_pcs1.disable_running_disp_in_word_align = "false",
		receive_pcs1.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs1.dprio_config_mode = 6'h01,
		receive_pcs1.elec_idle_gen1_sigdet_enable = "true",
		receive_pcs1.elec_idle_infer_enable = "false",
		receive_pcs1.elec_idle_num_com_detect = 3,
		receive_pcs1.enable_bit_reversal = "false",
		receive_pcs1.enable_deep_align = "false",
		receive_pcs1.enable_deep_align_byte_swap = "false",
		receive_pcs1.enable_self_test_mode = "false",
		receive_pcs1.enable_true_complement_match_in_word_align = "false",
		receive_pcs1.force_signal_detect_dig = "true",
		receive_pcs1.hip_enable = "true",
		receive_pcs1.infiniband_invalid_code = 0,
		receive_pcs1.insert_pad_on_underflow = "false",
		receive_pcs1.logical_channel_address = (starting_channel_number + 1),
		receive_pcs1.num_align_code_groups_in_ordered_set = 0,
		receive_pcs1.num_align_cons_good_data = 16,
		receive_pcs1.num_align_cons_pat = 4,
		receive_pcs1.num_align_loss_sync_error = 17,
		receive_pcs1.ph_fifo_low_latency_enable = "true",
		receive_pcs1.ph_fifo_reg_mode = "true",
		receive_pcs1.ph_fifo_xn_mapping0 = "none",
		receive_pcs1.ph_fifo_xn_mapping1 = "none",
		receive_pcs1.ph_fifo_xn_mapping2 = "central",
		receive_pcs1.ph_fifo_xn_select = 2,
		receive_pcs1.pipe_auto_speed_nego_enable = "true",
		receive_pcs1.pipe_freq_scale_mode = "Frequency",
		receive_pcs1.pma_done_count = 249950,
		receive_pcs1.protocol_hint = "pcie2",
		receive_pcs1.rate_match_almost_empty_threshold = 11,
		receive_pcs1.rate_match_almost_full_threshold = 13,
		receive_pcs1.rate_match_back_to_back = "false",
		receive_pcs1.rate_match_delete_threshold = 13,
		receive_pcs1.rate_match_empty_threshold = 5,
		receive_pcs1.rate_match_fifo_mode = "true",
		receive_pcs1.rate_match_full_threshold = 20,
		receive_pcs1.rate_match_insert_threshold = 11,
		receive_pcs1.rate_match_ordered_set_based = "false",
		receive_pcs1.rate_match_pattern1 = "11010000111010000011",
		receive_pcs1.rate_match_pattern2 = "00101111000101111100",
		receive_pcs1.rate_match_pattern_size = 20,
		receive_pcs1.rate_match_pipe_enable = "true",
		receive_pcs1.rate_match_reset_enable = "false",
		receive_pcs1.rate_match_skip_set_based = "true",
		receive_pcs1.rate_match_start_threshold = 7,
		receive_pcs1.rd_clk_mux_select = "int clock",
		receive_pcs1.recovered_clk_mux_select = "recovered clock",
		receive_pcs1.run_length = 40,
		receive_pcs1.run_length_enable = "true",
		receive_pcs1.rx_detect_bypass = "false",
		receive_pcs1.rx_phfifo_wait_cnt = 32,
		receive_pcs1.rxstatus_error_report_mode = 1,
		receive_pcs1.self_test_mode = "incremental",
		receive_pcs1.use_alignment_state_machine = "true",
		receive_pcs1.use_deserializer_double_data_mode = "false",
		receive_pcs1.use_deskew_fifo = "false",
		receive_pcs1.use_double_data_mode = "false",
		receive_pcs1.use_parallel_loopback = "false",
		receive_pcs1.use_rising_edge_triggered_pattern_align = "false",
		receive_pcs1.lpm_type = "stratixiv_hssi_rx_pcs";
	stratixiv_hssi_rx_pcs   receive_pcs2
	(
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.autospdrateswitchout(wire_receive_pcs2_autospdrateswitchout),
	.autospdspdchgout(),
	.autospdxnconfigsel(int_rx_autospdxnconfigsel[8:6]),
	.autospdxnspdchg(int_rx_autospdxnspdchg[8:6]),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(wire_receive_pcs2_cdrctrlearlyeios),
	.cdrctrllocktorefclkout(wire_receive_pcs2_cdrctrllocktorefclkout),
	.clkout(),
	.coreclkout(wire_receive_pcs2_coreclkout),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[59:40]),
	.dataout(),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[2]),
	.digitaltestout(),
	.disablefifordin(1'b0),
	.disablefifordout(),
	.disablefifowrin(1'b0),
	.disablefifowrout(),
	.disperr(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pcsdprioin_wire[1199:800]),
	.dprioout(wire_receive_pcs2_dprioout),
	.enabledeskew(1'b0),
	.enabyteord(1'b0),
	.enapatternalign(rx_enapatternalign[2]),
	.errdetect(),
	.fifordin(1'b0),
	.fifordout(),
	.fiforesetrd(1'b0),
	.hip8b10binvpolarity(pipe8b10binvpolarity[2]),
	.hipdataout(wire_receive_pcs2_hipdataout),
	.hipdatavalid(wire_receive_pcs2_hipdatavalid),
	.hipelecidle(wire_receive_pcs2_hipelecidle),
	.hipelecidleinfersel({3{1'b0}}),
	.hipphydonestatus(wire_receive_pcs2_hipphydonestatus),
	.hippowerdown(powerdn[5:4]),
	.hiprateswitch(rateswitch[0]),
	.hipstatus(wire_receive_pcs2_hipstatus),
	.invpol(1'b0),
	.iqpphfifobyteselout(),
	.iqpphfifoptrsresetout(),
	.iqpphfifordenableout(),
	.iqpphfifowrclkout(),
	.iqpphfifowrenableout(),
	.k1detect(),
	.k2detect(),
	.localrefclk(1'b0),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifobyteselout(),
	.phfifobyteserdisableout(wire_receive_pcs2_phfifobyteserdisableout),
	.phfifooverflow(),
	.phfifoptrsresetout(wire_receive_pcs2_phfifoptrsresetout),
	.phfifordenable(rx_phfifordenable[2]),
	.phfifordenableout(wire_receive_pcs2_phfifordenableout),
	.phfiforeset(rx_phfiforeset[2]),
	.phfiforesetout(wire_receive_pcs2_phfiforesetout),
	.phfifounderflow(),
	.phfifowrclkout(),
	.phfifowrdisable(rx_phfifowrdisable[2]),
	.phfifowrdisableout(wire_receive_pcs2_phfifowrdisableout),
	.phfifowrenableout(),
	.phfifoxnbytesel(int_rx_phfifoxnbytesel[8:6]),
	.phfifoxnptrsreset(int_rx_phfifioxnptrsreset[8:6]),
	.phfifoxnrdenable(int_rx_phfifoxnrdenable[8:6]),
	.phfifoxnwrclk(int_rx_phfifoxnwrclk[8:6]),
	.phfifoxnwrenable(int_rx_phfifoxnwrenable[8:6]),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipeenrevparallellpbkfromtx(int_pipeenrevparallellpbkfromtx[2]),
	.pipephydonestatus(),
	.pipepowerdown(tx_pipepowerdownout[5:4]),
	.pipepowerstate(tx_pipepowerstateout[11:8]),
	.pipestatetransdoneout(wire_receive_pcs2_pipestatetransdoneout),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[2]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(wire_receive_pcs2_rateswitchout),
	.rateswitchxndone(int_hiprateswtichdone[0]),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[2]),
	.refclk(refclk_pma[0]),
	.revbitorderwa(1'b0),
	.revbyteorderwa(1'b0),
	.revparallelfdbkdata(wire_receive_pcs2_revparallelfdbkdata),
	.rlv(),
	.rmfifoalmostempty(),
	.rmfifoalmostfull(),
	.rmfifodatadeleted(),
	.rmfifodatainserted(),
	.rmfifoempty(),
	.rmfifofull(),
	.rmfifordena(1'b0),
	.rmfiforeset(rx_rmfiforeset[2]),
	.rmfifowrena(1'b0),
	.runningdisp(),
	.rxdetectvalid(tx_rxdetectvalidout[2]),
	.rxfound(rx_pcs_rxfound_wire[5:4]),
	.signaldetect(wire_receive_pcs2_signaldetect),
	.signaldetected(rx_signaldetect_wire[2]),
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
	.iqpautospdxnspgchg({2{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnptrsreset({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrclk({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifox8bytesel(1'b0),
	.phfifox8rdenable(1'b0),
	.phfifox8wrclk(1'b0),
	.phfifox8wrenable(1'b0),
	.pipe8b10binvpolarity(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.ppmdetectdividedclk(1'b0),
	.ppmdetectrefclk(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rxelecidlerateswitch(1'b0),
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
		receive_pcs2.align_pattern = "0101111100",
		receive_pcs2.align_pattern_length = 10,
		receive_pcs2.align_to_deskew_pattern_pos_disp_only = "false",
		receive_pcs2.allow_align_polarity_inversion = "false",
		receive_pcs2.allow_pipe_polarity_inversion = "true",
		receive_pcs2.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs2.auto_spd_phystatus_notify_count = 14,
		receive_pcs2.auto_spd_self_switch_enable = "false",
		receive_pcs2.bit_slip_enable = "false",
		receive_pcs2.byte_order_double_data_mode_mask_enable = "false",
		receive_pcs2.byte_order_invalid_code_or_run_disp_error = "true",
		receive_pcs2.byte_order_mode = "none",
		receive_pcs2.byte_order_pad_pattern = "0",
		receive_pcs2.byte_order_pattern = "0",
		receive_pcs2.byte_order_pld_ctrl_enable = "false",
		receive_pcs2.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs2.cdrctrl_cid_mode_enable = "true",
		receive_pcs2.cdrctrl_enable = "true",
		receive_pcs2.cdrctrl_rxvalid_mask = "true",
		receive_pcs2.channel_bonding = "x4",
		receive_pcs2.channel_number = ((starting_channel_number + 2) % 4),
		receive_pcs2.channel_width = 8,
		receive_pcs2.clk1_mux_select = "recovered clock",
		receive_pcs2.clk2_mux_select = "digital reference clock",
		receive_pcs2.core_clock_0ppm = "false",
		receive_pcs2.datapath_low_latency_mode = "false",
		receive_pcs2.datapath_protocol = "pipe",
		receive_pcs2.dec_8b_10b_compatibility_mode = "true",
		receive_pcs2.dec_8b_10b_mode = "normal",
		receive_pcs2.dec_8b_10b_polarity_inv_enable = "true",
		receive_pcs2.deskew_pattern = "0",
		receive_pcs2.disable_auto_idle_insertion = "false",
		receive_pcs2.disable_running_disp_in_word_align = "false",
		receive_pcs2.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs2.dprio_config_mode = 6'h01,
		receive_pcs2.elec_idle_gen1_sigdet_enable = "true",
		receive_pcs2.elec_idle_infer_enable = "false",
		receive_pcs2.elec_idle_num_com_detect = 3,
		receive_pcs2.enable_bit_reversal = "false",
		receive_pcs2.enable_deep_align = "false",
		receive_pcs2.enable_deep_align_byte_swap = "false",
		receive_pcs2.enable_self_test_mode = "false",
		receive_pcs2.enable_true_complement_match_in_word_align = "false",
		receive_pcs2.force_signal_detect_dig = "true",
		receive_pcs2.hip_enable = "true",
		receive_pcs2.infiniband_invalid_code = 0,
		receive_pcs2.insert_pad_on_underflow = "false",
		receive_pcs2.logical_channel_address = (starting_channel_number + 2),
		receive_pcs2.num_align_code_groups_in_ordered_set = 0,
		receive_pcs2.num_align_cons_good_data = 16,
		receive_pcs2.num_align_cons_pat = 4,
		receive_pcs2.num_align_loss_sync_error = 17,
		receive_pcs2.ph_fifo_low_latency_enable = "true",
		receive_pcs2.ph_fifo_reg_mode = "true",
		receive_pcs2.ph_fifo_xn_mapping0 = "none",
		receive_pcs2.ph_fifo_xn_mapping1 = "none",
		receive_pcs2.ph_fifo_xn_mapping2 = "central",
		receive_pcs2.ph_fifo_xn_select = 2,
		receive_pcs2.pipe_auto_speed_nego_enable = "true",
		receive_pcs2.pipe_freq_scale_mode = "Frequency",
		receive_pcs2.pma_done_count = 249950,
		receive_pcs2.protocol_hint = "pcie2",
		receive_pcs2.rate_match_almost_empty_threshold = 11,
		receive_pcs2.rate_match_almost_full_threshold = 13,
		receive_pcs2.rate_match_back_to_back = "false",
		receive_pcs2.rate_match_delete_threshold = 13,
		receive_pcs2.rate_match_empty_threshold = 5,
		receive_pcs2.rate_match_fifo_mode = "true",
		receive_pcs2.rate_match_full_threshold = 20,
		receive_pcs2.rate_match_insert_threshold = 11,
		receive_pcs2.rate_match_ordered_set_based = "false",
		receive_pcs2.rate_match_pattern1 = "11010000111010000011",
		receive_pcs2.rate_match_pattern2 = "00101111000101111100",
		receive_pcs2.rate_match_pattern_size = 20,
		receive_pcs2.rate_match_pipe_enable = "true",
		receive_pcs2.rate_match_reset_enable = "false",
		receive_pcs2.rate_match_skip_set_based = "true",
		receive_pcs2.rate_match_start_threshold = 7,
		receive_pcs2.rd_clk_mux_select = "int clock",
		receive_pcs2.recovered_clk_mux_select = "recovered clock",
		receive_pcs2.run_length = 40,
		receive_pcs2.run_length_enable = "true",
		receive_pcs2.rx_detect_bypass = "false",
		receive_pcs2.rx_phfifo_wait_cnt = 32,
		receive_pcs2.rxstatus_error_report_mode = 1,
		receive_pcs2.self_test_mode = "incremental",
		receive_pcs2.use_alignment_state_machine = "true",
		receive_pcs2.use_deserializer_double_data_mode = "false",
		receive_pcs2.use_deskew_fifo = "false",
		receive_pcs2.use_double_data_mode = "false",
		receive_pcs2.use_parallel_loopback = "false",
		receive_pcs2.use_rising_edge_triggered_pattern_align = "false",
		receive_pcs2.lpm_type = "stratixiv_hssi_rx_pcs";
	stratixiv_hssi_rx_pcs   receive_pcs3
	(
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.autospdrateswitchout(wire_receive_pcs3_autospdrateswitchout),
	.autospdspdchgout(),
	.autospdxnconfigsel(int_rx_autospdxnconfigsel[11:9]),
	.autospdxnspdchg(int_rx_autospdxnspdchg[11:9]),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(wire_receive_pcs3_cdrctrlearlyeios),
	.cdrctrllocktorefclkout(wire_receive_pcs3_cdrctrllocktorefclkout),
	.clkout(),
	.coreclkout(wire_receive_pcs3_coreclkout),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[79:60]),
	.dataout(),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[3]),
	.digitaltestout(),
	.disablefifordin(1'b0),
	.disablefifordout(),
	.disablefifowrin(1'b0),
	.disablefifowrout(),
	.disperr(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pcsdprioin_wire[1599:1200]),
	.dprioout(wire_receive_pcs3_dprioout),
	.enabledeskew(1'b0),
	.enabyteord(1'b0),
	.enapatternalign(rx_enapatternalign[3]),
	.errdetect(),
	.fifordin(1'b0),
	.fifordout(),
	.fiforesetrd(1'b0),
	.hip8b10binvpolarity(pipe8b10binvpolarity[3]),
	.hipdataout(wire_receive_pcs3_hipdataout),
	.hipdatavalid(wire_receive_pcs3_hipdatavalid),
	.hipelecidle(wire_receive_pcs3_hipelecidle),
	.hipelecidleinfersel({3{1'b0}}),
	.hipphydonestatus(wire_receive_pcs3_hipphydonestatus),
	.hippowerdown(powerdn[7:6]),
	.hiprateswitch(rateswitch[0]),
	.hipstatus(wire_receive_pcs3_hipstatus),
	.invpol(1'b0),
	.iqpphfifobyteselout(),
	.iqpphfifoptrsresetout(),
	.iqpphfifordenableout(),
	.iqpphfifowrclkout(),
	.iqpphfifowrenableout(),
	.k1detect(),
	.k2detect(),
	.localrefclk(1'b0),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifobyteselout(),
	.phfifobyteserdisableout(wire_receive_pcs3_phfifobyteserdisableout),
	.phfifooverflow(),
	.phfifoptrsresetout(wire_receive_pcs3_phfifoptrsresetout),
	.phfifordenable(rx_phfifordenable[3]),
	.phfifordenableout(wire_receive_pcs3_phfifordenableout),
	.phfiforeset(rx_phfiforeset[3]),
	.phfiforesetout(wire_receive_pcs3_phfiforesetout),
	.phfifounderflow(),
	.phfifowrclkout(),
	.phfifowrdisable(rx_phfifowrdisable[3]),
	.phfifowrdisableout(wire_receive_pcs3_phfifowrdisableout),
	.phfifowrenableout(),
	.phfifoxnbytesel(int_rx_phfifoxnbytesel[11:9]),
	.phfifoxnptrsreset(int_rx_phfifioxnptrsreset[11:9]),
	.phfifoxnrdenable(int_rx_phfifoxnrdenable[11:9]),
	.phfifoxnwrclk(int_rx_phfifoxnwrclk[11:9]),
	.phfifoxnwrenable(int_rx_phfifoxnwrenable[11:9]),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipeenrevparallellpbkfromtx(int_pipeenrevparallellpbkfromtx[3]),
	.pipephydonestatus(),
	.pipepowerdown(tx_pipepowerdownout[7:6]),
	.pipepowerstate(tx_pipepowerstateout[15:12]),
	.pipestatetransdoneout(wire_receive_pcs3_pipestatetransdoneout),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[3]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(wire_receive_pcs3_rateswitchout),
	.rateswitchxndone(int_hiprateswtichdone[0]),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[3]),
	.refclk(refclk_pma[0]),
	.revbitorderwa(1'b0),
	.revbyteorderwa(1'b0),
	.revparallelfdbkdata(wire_receive_pcs3_revparallelfdbkdata),
	.rlv(),
	.rmfifoalmostempty(),
	.rmfifoalmostfull(),
	.rmfifodatadeleted(),
	.rmfifodatainserted(),
	.rmfifoempty(),
	.rmfifofull(),
	.rmfifordena(1'b0),
	.rmfiforeset(rx_rmfiforeset[3]),
	.rmfifowrena(1'b0),
	.runningdisp(),
	.rxdetectvalid(tx_rxdetectvalidout[3]),
	.rxfound(rx_pcs_rxfound_wire[7:6]),
	.signaldetect(wire_receive_pcs3_signaldetect),
	.signaldetected(rx_signaldetect_wire[3]),
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
	.iqpautospdxnspgchg({2{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnptrsreset({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrclk({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifox8bytesel(1'b0),
	.phfifox8rdenable(1'b0),
	.phfifox8wrclk(1'b0),
	.phfifox8wrenable(1'b0),
	.pipe8b10binvpolarity(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.ppmdetectdividedclk(1'b0),
	.ppmdetectrefclk(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rxelecidlerateswitch(1'b0),
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
		receive_pcs3.align_pattern = "0101111100",
		receive_pcs3.align_pattern_length = 10,
		receive_pcs3.align_to_deskew_pattern_pos_disp_only = "false",
		receive_pcs3.allow_align_polarity_inversion = "false",
		receive_pcs3.allow_pipe_polarity_inversion = "true",
		receive_pcs3.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs3.auto_spd_phystatus_notify_count = 14,
		receive_pcs3.auto_spd_self_switch_enable = "false",
		receive_pcs3.bit_slip_enable = "false",
		receive_pcs3.byte_order_double_data_mode_mask_enable = "false",
		receive_pcs3.byte_order_invalid_code_or_run_disp_error = "true",
		receive_pcs3.byte_order_mode = "none",
		receive_pcs3.byte_order_pad_pattern = "0",
		receive_pcs3.byte_order_pattern = "0",
		receive_pcs3.byte_order_pld_ctrl_enable = "false",
		receive_pcs3.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs3.cdrctrl_cid_mode_enable = "true",
		receive_pcs3.cdrctrl_enable = "true",
		receive_pcs3.cdrctrl_rxvalid_mask = "true",
		receive_pcs3.channel_bonding = "x4",
		receive_pcs3.channel_number = ((starting_channel_number + 3) % 4),
		receive_pcs3.channel_width = 8,
		receive_pcs3.clk1_mux_select = "recovered clock",
		receive_pcs3.clk2_mux_select = "digital reference clock",
		receive_pcs3.core_clock_0ppm = "false",
		receive_pcs3.datapath_low_latency_mode = "false",
		receive_pcs3.datapath_protocol = "pipe",
		receive_pcs3.dec_8b_10b_compatibility_mode = "true",
		receive_pcs3.dec_8b_10b_mode = "normal",
		receive_pcs3.dec_8b_10b_polarity_inv_enable = "true",
		receive_pcs3.deskew_pattern = "0",
		receive_pcs3.disable_auto_idle_insertion = "false",
		receive_pcs3.disable_running_disp_in_word_align = "false",
		receive_pcs3.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs3.dprio_config_mode = 6'h01,
		receive_pcs3.elec_idle_gen1_sigdet_enable = "true",
		receive_pcs3.elec_idle_infer_enable = "false",
		receive_pcs3.elec_idle_num_com_detect = 3,
		receive_pcs3.enable_bit_reversal = "false",
		receive_pcs3.enable_deep_align = "false",
		receive_pcs3.enable_deep_align_byte_swap = "false",
		receive_pcs3.enable_self_test_mode = "false",
		receive_pcs3.enable_true_complement_match_in_word_align = "false",
		receive_pcs3.force_signal_detect_dig = "true",
		receive_pcs3.hip_enable = "true",
		receive_pcs3.infiniband_invalid_code = 0,
		receive_pcs3.insert_pad_on_underflow = "false",
		receive_pcs3.logical_channel_address = (starting_channel_number + 3),
		receive_pcs3.num_align_code_groups_in_ordered_set = 0,
		receive_pcs3.num_align_cons_good_data = 16,
		receive_pcs3.num_align_cons_pat = 4,
		receive_pcs3.num_align_loss_sync_error = 17,
		receive_pcs3.ph_fifo_low_latency_enable = "true",
		receive_pcs3.ph_fifo_reg_mode = "true",
		receive_pcs3.ph_fifo_xn_mapping0 = "none",
		receive_pcs3.ph_fifo_xn_mapping1 = "none",
		receive_pcs3.ph_fifo_xn_mapping2 = "central",
		receive_pcs3.ph_fifo_xn_select = 2,
		receive_pcs3.pipe_auto_speed_nego_enable = "true",
		receive_pcs3.pipe_freq_scale_mode = "Frequency",
		receive_pcs3.pma_done_count = 249950,
		receive_pcs3.protocol_hint = "pcie2",
		receive_pcs3.rate_match_almost_empty_threshold = 11,
		receive_pcs3.rate_match_almost_full_threshold = 13,
		receive_pcs3.rate_match_back_to_back = "false",
		receive_pcs3.rate_match_delete_threshold = 13,
		receive_pcs3.rate_match_empty_threshold = 5,
		receive_pcs3.rate_match_fifo_mode = "true",
		receive_pcs3.rate_match_full_threshold = 20,
		receive_pcs3.rate_match_insert_threshold = 11,
		receive_pcs3.rate_match_ordered_set_based = "false",
		receive_pcs3.rate_match_pattern1 = "11010000111010000011",
		receive_pcs3.rate_match_pattern2 = "00101111000101111100",
		receive_pcs3.rate_match_pattern_size = 20,
		receive_pcs3.rate_match_pipe_enable = "true",
		receive_pcs3.rate_match_reset_enable = "false",
		receive_pcs3.rate_match_skip_set_based = "true",
		receive_pcs3.rate_match_start_threshold = 7,
		receive_pcs3.rd_clk_mux_select = "int clock",
		receive_pcs3.recovered_clk_mux_select = "recovered clock",
		receive_pcs3.run_length = 40,
		receive_pcs3.run_length_enable = "true",
		receive_pcs3.rx_detect_bypass = "false",
		receive_pcs3.rx_phfifo_wait_cnt = 32,
		receive_pcs3.rxstatus_error_report_mode = 1,
		receive_pcs3.self_test_mode = "incremental",
		receive_pcs3.use_alignment_state_machine = "true",
		receive_pcs3.use_deserializer_double_data_mode = "false",
		receive_pcs3.use_deskew_fifo = "false",
		receive_pcs3.use_double_data_mode = "false",
		receive_pcs3.use_parallel_loopback = "false",
		receive_pcs3.use_rising_edge_triggered_pattern_align = "false",
		receive_pcs3.lpm_type = "stratixiv_hssi_rx_pcs";
	stratixiv_hssi_rx_pma   receive_pma0
	(
	.adaptdone(),
	.analogtestbus(wire_receive_pma0_analogtestbus),
	.clockout(wire_receive_pma0_clockout),
	.datain(rx_datain[0]),
	.dataout(wire_receive_pma0_dataout),
	.dataoutfull(),
	.deserclock(rx_deserclock_in[3:0]),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[299:0]),
	.dprioout(wire_receive_pma0_dprioout),
	.freqlock(1'b0),
	.ignorephslck(1'b0),
	.locktodata(rx_locktodata_wire[0]),
	.locktoref(rx_locktorefclk_wire[0]),
	.locktorefout(wire_receive_pma0_locktorefout),
	.offsetcancellationen(1'b0),
	.plllocked(rx_plllocked_wire[0]),
	.powerdn(cent_unit_rxibpowerdn[0]),
	.ppmdetectclkrel(),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[0]),
	.recoverdatain(pll_ch_dataout_wire[1:0]),
	.recoverdataout(wire_receive_pma0_recoverdataout),
	.reverselpbkout(),
	.revserialfdbkout(),
	.rxpmareset(rx_analogreset_out[0]),
	.seriallpbken(1'b0),
	.seriallpbkin(1'b0),
	.signaldetect(wire_receive_pma0_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adaptcapture(1'b0),
	.adcepowerdn(1'b0),
	.adcereset(1'b0),
	.adcestandby(1'b0),
	.extra10gin({38{1'b0}}),
	.ppmdetectdividedclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma0.adaptive_equalization_mode = "none",
		receive_pma0.allow_serial_loopback = "false",
		receive_pma0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pma0.channel_type = "auto",
		receive_pma0.common_mode = "0.82V",
		receive_pma0.deserialization_factor = 10,
		receive_pma0.dprio_config_mode = 6'h01,
		receive_pma0.enable_ltd = "false",
		receive_pma0.enable_ltr = "true",
		receive_pma0.eq_dc_gain = 3,
		receive_pma0.eqa_ctrl = 0,
		receive_pma0.eqb_ctrl = 0,
		receive_pma0.eqc_ctrl = 0,
		receive_pma0.eqd_ctrl = 0,
		receive_pma0.eqv_ctrl = 0,
		receive_pma0.eyemon_bandwidth = 0,
		receive_pma0.force_signal_detect = "true",
		receive_pma0.logical_channel_address = (starting_channel_number + 0),
		receive_pma0.low_speed_test_select = 0,
		receive_pma0.offset_cancellation = 1,
		receive_pma0.ppmselect = 32,
		receive_pma0.protocol_hint = "pcie2",
		receive_pma0.send_direct_reverse_serial_loopback = "None",
		receive_pma0.signal_detect_hysteresis = 4,
		receive_pma0.signal_detect_hysteresis_valid_threshold = 14,
		receive_pma0.signal_detect_loss_threshold = 3,
		receive_pma0.termination = "OCT 100 Ohms",
		receive_pma0.use_deser_double_data_width = "false",
		receive_pma0.use_external_termination = "false",
		receive_pma0.use_pma_direct = "false",
		receive_pma0.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_rx_pma   receive_pma1
	(
	.adaptdone(),
	.analogtestbus(wire_receive_pma1_analogtestbus),
	.clockout(wire_receive_pma1_clockout),
	.datain(rx_datain[1]),
	.dataout(wire_receive_pma1_dataout),
	.dataoutfull(),
	.deserclock(rx_deserclock_in[7:4]),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[599:300]),
	.dprioout(wire_receive_pma1_dprioout),
	.freqlock(1'b0),
	.ignorephslck(1'b0),
	.locktodata(rx_locktodata_wire[1]),
	.locktoref(rx_locktorefclk_wire[1]),
	.locktorefout(wire_receive_pma1_locktorefout),
	.offsetcancellationen(1'b0),
	.plllocked(rx_plllocked_wire[1]),
	.powerdn(cent_unit_rxibpowerdn[1]),
	.ppmdetectclkrel(),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[1]),
	.recoverdatain(pll_ch_dataout_wire[3:2]),
	.recoverdataout(wire_receive_pma1_recoverdataout),
	.reverselpbkout(),
	.revserialfdbkout(),
	.rxpmareset(rx_analogreset_out[1]),
	.seriallpbken(1'b0),
	.seriallpbkin(1'b0),
	.signaldetect(wire_receive_pma1_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adaptcapture(1'b0),
	.adcepowerdn(1'b0),
	.adcereset(1'b0),
	.adcestandby(1'b0),
	.extra10gin({38{1'b0}}),
	.ppmdetectdividedclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma1.adaptive_equalization_mode = "none",
		receive_pma1.allow_serial_loopback = "false",
		receive_pma1.channel_number = ((starting_channel_number + 1) % 4),
		receive_pma1.channel_type = "auto",
		receive_pma1.common_mode = "0.82V",
		receive_pma1.deserialization_factor = 10,
		receive_pma1.dprio_config_mode = 6'h01,
		receive_pma1.enable_ltd = "false",
		receive_pma1.enable_ltr = "true",
		receive_pma1.eq_dc_gain = 3,
		receive_pma1.eqa_ctrl = 0,
		receive_pma1.eqb_ctrl = 0,
		receive_pma1.eqc_ctrl = 0,
		receive_pma1.eqd_ctrl = 0,
		receive_pma1.eqv_ctrl = 0,
		receive_pma1.eyemon_bandwidth = 0,
		receive_pma1.force_signal_detect = "true",
		receive_pma1.logical_channel_address = (starting_channel_number + 1),
		receive_pma1.low_speed_test_select = 0,
		receive_pma1.offset_cancellation = 1,
		receive_pma1.ppmselect = 32,
		receive_pma1.protocol_hint = "pcie2",
		receive_pma1.send_direct_reverse_serial_loopback = "None",
		receive_pma1.signal_detect_hysteresis = 4,
		receive_pma1.signal_detect_hysteresis_valid_threshold = 14,
		receive_pma1.signal_detect_loss_threshold = 3,
		receive_pma1.termination = "OCT 100 Ohms",
		receive_pma1.use_deser_double_data_width = "false",
		receive_pma1.use_external_termination = "false",
		receive_pma1.use_pma_direct = "false",
		receive_pma1.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_rx_pma   receive_pma2
	(
	.adaptdone(),
	.analogtestbus(wire_receive_pma2_analogtestbus),
	.clockout(wire_receive_pma2_clockout),
	.datain(rx_datain[2]),
	.dataout(wire_receive_pma2_dataout),
	.dataoutfull(),
	.deserclock(rx_deserclock_in[11:8]),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[899:600]),
	.dprioout(wire_receive_pma2_dprioout),
	.freqlock(1'b0),
	.ignorephslck(1'b0),
	.locktodata(rx_locktodata_wire[2]),
	.locktoref(rx_locktorefclk_wire[2]),
	.locktorefout(wire_receive_pma2_locktorefout),
	.offsetcancellationen(1'b0),
	.plllocked(rx_plllocked_wire[2]),
	.powerdn(cent_unit_rxibpowerdn[2]),
	.ppmdetectclkrel(),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[2]),
	.recoverdatain(pll_ch_dataout_wire[5:4]),
	.recoverdataout(wire_receive_pma2_recoverdataout),
	.reverselpbkout(),
	.revserialfdbkout(),
	.rxpmareset(rx_analogreset_out[2]),
	.seriallpbken(1'b0),
	.seriallpbkin(1'b0),
	.signaldetect(wire_receive_pma2_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adaptcapture(1'b0),
	.adcepowerdn(1'b0),
	.adcereset(1'b0),
	.adcestandby(1'b0),
	.extra10gin({38{1'b0}}),
	.ppmdetectdividedclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma2.adaptive_equalization_mode = "none",
		receive_pma2.allow_serial_loopback = "false",
		receive_pma2.channel_number = ((starting_channel_number + 2) % 4),
		receive_pma2.channel_type = "auto",
		receive_pma2.common_mode = "0.82V",
		receive_pma2.deserialization_factor = 10,
		receive_pma2.dprio_config_mode = 6'h01,
		receive_pma2.enable_ltd = "false",
		receive_pma2.enable_ltr = "true",
		receive_pma2.eq_dc_gain = 3,
		receive_pma2.eqa_ctrl = 0,
		receive_pma2.eqb_ctrl = 0,
		receive_pma2.eqc_ctrl = 0,
		receive_pma2.eqd_ctrl = 0,
		receive_pma2.eqv_ctrl = 0,
		receive_pma2.eyemon_bandwidth = 0,
		receive_pma2.force_signal_detect = "true",
		receive_pma2.logical_channel_address = (starting_channel_number + 2),
		receive_pma2.low_speed_test_select = 0,
		receive_pma2.offset_cancellation = 1,
		receive_pma2.ppmselect = 32,
		receive_pma2.protocol_hint = "pcie2",
		receive_pma2.send_direct_reverse_serial_loopback = "None",
		receive_pma2.signal_detect_hysteresis = 4,
		receive_pma2.signal_detect_hysteresis_valid_threshold = 14,
		receive_pma2.signal_detect_loss_threshold = 3,
		receive_pma2.termination = "OCT 100 Ohms",
		receive_pma2.use_deser_double_data_width = "false",
		receive_pma2.use_external_termination = "false",
		receive_pma2.use_pma_direct = "false",
		receive_pma2.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_rx_pma   receive_pma3
	(
	.adaptdone(),
	.analogtestbus(wire_receive_pma3_analogtestbus),
	.clockout(wire_receive_pma3_clockout),
	.datain(rx_datain[3]),
	.dataout(wire_receive_pma3_dataout),
	.dataoutfull(),
	.deserclock(rx_deserclock_in[15:12]),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[1199:900]),
	.dprioout(wire_receive_pma3_dprioout),
	.freqlock(1'b0),
	.ignorephslck(1'b0),
	.locktodata(rx_locktodata_wire[3]),
	.locktoref(rx_locktorefclk_wire[3]),
	.locktorefout(wire_receive_pma3_locktorefout),
	.offsetcancellationen(1'b0),
	.plllocked(rx_plllocked_wire[3]),
	.powerdn(cent_unit_rxibpowerdn[3]),
	.ppmdetectclkrel(),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[3]),
	.recoverdatain(pll_ch_dataout_wire[7:6]),
	.recoverdataout(wire_receive_pma3_recoverdataout),
	.reverselpbkout(),
	.revserialfdbkout(),
	.rxpmareset(rx_analogreset_out[3]),
	.seriallpbken(1'b0),
	.seriallpbkin(1'b0),
	.signaldetect(wire_receive_pma3_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adaptcapture(1'b0),
	.adcepowerdn(1'b0),
	.adcereset(1'b0),
	.adcestandby(1'b0),
	.extra10gin({38{1'b0}}),
	.ppmdetectdividedclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma3.adaptive_equalization_mode = "none",
		receive_pma3.allow_serial_loopback = "false",
		receive_pma3.channel_number = ((starting_channel_number + 3) % 4),
		receive_pma3.channel_type = "auto",
		receive_pma3.common_mode = "0.82V",
		receive_pma3.deserialization_factor = 10,
		receive_pma3.dprio_config_mode = 6'h01,
		receive_pma3.enable_ltd = "false",
		receive_pma3.enable_ltr = "true",
		receive_pma3.eq_dc_gain = 3,
		receive_pma3.eqa_ctrl = 0,
		receive_pma3.eqb_ctrl = 0,
		receive_pma3.eqc_ctrl = 0,
		receive_pma3.eqd_ctrl = 0,
		receive_pma3.eqv_ctrl = 0,
		receive_pma3.eyemon_bandwidth = 0,
		receive_pma3.force_signal_detect = "true",
		receive_pma3.logical_channel_address = (starting_channel_number + 3),
		receive_pma3.low_speed_test_select = 0,
		receive_pma3.offset_cancellation = 1,
		receive_pma3.ppmselect = 32,
		receive_pma3.protocol_hint = "pcie2",
		receive_pma3.send_direct_reverse_serial_loopback = "None",
		receive_pma3.signal_detect_hysteresis = 4,
		receive_pma3.signal_detect_hysteresis_valid_threshold = 14,
		receive_pma3.signal_detect_loss_threshold = 3,
		receive_pma3.termination = "OCT 100 Ohms",
		receive_pma3.use_deser_double_data_width = "false",
		receive_pma3.use_external_termination = "false",
		receive_pma3.use_pma_direct = "false",
		receive_pma3.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_tx_pcs   transmit_pcs0
	(
	.clkout(),
	.coreclkout(wire_transmit_pcs0_coreclkout),
	.ctrlenable({{3{1'b0}}, 1'b0}),
	.datainfull({44{1'b0}}),
	.dataout(wire_transmit_pcs0_dataout),
	.digitalreset(tx_digitalreset_out[0]),
	.dispval({{3{1'b0}}, 1'b0}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[149:0]),
	.dprioout(wire_transmit_pcs0_dprioout),
	.enrevparallellpbk(tx_revparallellpbken[0]),
	.forcedisp({{3{1'b0}}, 1'b0}),
	.forcedispcompliance(1'b0),
	.forceelecidleout(wire_transmit_pcs0_forceelecidleout),
	.grayelecidleinferselout(wire_transmit_pcs0_grayelecidleinferselout),
	.hipdatain({tx_forcedispcompliance[0], tx_ctrlenable[0], tx_datain_wire[7:0]}),
	.hipdetectrxloop(tx_detectrxloop[0]),
	.hipelecidleinfersel(rx_elecidleinfersel[2:0]),
	.hipforceelecidle(tx_forceelecidle[0]),
	.hippowerdn(powerdn[1:0]),
	.hiptxclkout(),
	.hiptxdeemph(tx_pipedeemph[0]),
	.hiptxmargin(tx_pipemargin[2:0]),
	.invpol(tx_invpolarity[0]),
	.iqpphfifobyteselout(),
	.iqpphfifordclkout(),
	.iqpphfifordenableout(),
	.iqpphfifowrenableout(),
	.localrefclk(tx_localrefclk[0]),
	.parallelfdbkout(),
	.phfifobyteselout(),
	.phfifobyteserdisable(int_rx_phfifobyteserdisable[0]),
	.phfifooverflow(),
	.phfifoptrsreset(int_rx_phfifoptrsresetout[0]),
	.phfifordclkout(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(wire_transmit_pcs0_phfiforddisableout),
	.phfifordenableout(),
	.phfiforeset(tx_phfiforeset[0]),
	.phfiforesetout(wire_transmit_pcs0_phfiforesetout),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(wire_transmit_pcs0_phfifowrenableout),
	.phfifoxnbytesel(int_tx_phfifoxnbytesel[2:0]),
	.phfifoxnptrsreset(int_tx_phfifioxnptrsreset[2:0]),
	.phfifoxnrdclk(int_tx_phfifoxnrdclk[2:0]),
	.phfifoxnrdenable(int_tx_phfifoxnrdenable[2:0]),
	.phfifoxnwrenable(int_tx_phfifoxnwrenable[2:0]),
	.pipeenrevparallellpbkout(wire_transmit_pcs0_pipeenrevparallellpbkout),
	.pipepowerdownout(wire_transmit_pcs0_pipepowerdownout),
	.pipepowerstateout(wire_transmit_pcs0_pipepowerstateout),
	.pipestatetransdone(rx_pipestatetransdoneout[0]),
	.pipetxswing(tx_pipeswing[0]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdenablesync(),
	.refclk(refclk_pma[0]),
	.revparallelfdbk(rx_revparallelfdbkdata[19:0]),
	.txdetectrx(wire_transmit_pcs0_txdetectrx),
	.xgmctrl(cent_unit_txctrlout[0]),
	.xgmctrlenable(),
	.xgmdatain(cent_unit_tx_xgmdataout[7:0]),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.coreclk(1'b0),
	.datain({40{1'b0}}),
	.detectrxloop(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.freezptr(1'b0),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnrdclk({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifoxnbottombytesel(1'b0),
	.phfifoxnbottomrdclk(1'b0),
	.phfifoxnbottomrdenable(1'b0),
	.phfifoxnbottomwrenable(1'b0),
	.phfifoxntopbytesel(1'b0),
	.phfifoxntoprdclk(1'b0),
	.phfifoxntoprdenable(1'b0),
	.phfifoxntopwrenable(1'b0),
	.pipetxdeemph(1'b0),
	.pipetxmargin({3{1'b0}}),
	.powerdn({2{1'b0}}),
	.prbscidenable(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs0.allow_polarity_inversion = "false",
		transmit_pcs0.auto_spd_self_switch_enable = "false",
		transmit_pcs0.bitslip_enable = "false",
		transmit_pcs0.channel_bonding = "x4",
		transmit_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pcs0.channel_width = 8,
		transmit_pcs0.core_clock_0ppm = "false",
		transmit_pcs0.datapath_low_latency_mode = "false",
		transmit_pcs0.datapath_protocol = "pipe",
		transmit_pcs0.disable_ph_low_latency_mode = "false",
		transmit_pcs0.disparity_mode = "new",
		transmit_pcs0.dprio_config_mode = 6'h01,
		transmit_pcs0.elec_idle_delay = 6,
		transmit_pcs0.enable_bit_reversal = "false",
		transmit_pcs0.enable_idle_selection = "false",
		transmit_pcs0.enable_reverse_parallel_loopback = "true",
		transmit_pcs0.enable_self_test_mode = "false",
		transmit_pcs0.enable_symbol_swap = "false",
		transmit_pcs0.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs0.enc_8b_10b_mode = "normal",
		transmit_pcs0.force_echar = "false",
		transmit_pcs0.force_kchar = "false",
		transmit_pcs0.hip_enable = "true",
		transmit_pcs0.logical_channel_address = (starting_channel_number + 0),
		transmit_pcs0.ph_fifo_reg_mode = "true",
		transmit_pcs0.ph_fifo_xn_mapping0 = "none",
		transmit_pcs0.ph_fifo_xn_mapping1 = "none",
		transmit_pcs0.ph_fifo_xn_mapping2 = "central",
		transmit_pcs0.ph_fifo_xn_select = 2,
		transmit_pcs0.pipe_auto_speed_nego_enable = "true",
		transmit_pcs0.pipe_freq_scale_mode = "Frequency",
		transmit_pcs0.pipe_voltage_swing_control = "false",
		transmit_pcs0.prbs_cid_pattern = "false",
		transmit_pcs0.protocol_hint = "pcie2",
		transmit_pcs0.refclk_select = "cmu_clock_divider",
		transmit_pcs0.self_test_mode = "incremental",
		transmit_pcs0.use_double_data_mode = "false",
		transmit_pcs0.use_serializer_double_data_mode = "false",
		transmit_pcs0.wr_clk_mux_select = "int_clk",
		transmit_pcs0.lpm_type = "stratixiv_hssi_tx_pcs";
	stratixiv_hssi_tx_pcs   transmit_pcs1
	(
	.clkout(),
	.coreclkout(wire_transmit_pcs1_coreclkout),
	.ctrlenable({{3{1'b0}}, 1'b0}),
	.datainfull({44{1'b0}}),
	.dataout(wire_transmit_pcs1_dataout),
	.digitalreset(tx_digitalreset_out[1]),
	.dispval({{3{1'b0}}, 1'b0}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[299:150]),
	.dprioout(wire_transmit_pcs1_dprioout),
	.enrevparallellpbk(tx_revparallellpbken[1]),
	.forcedisp({{3{1'b0}}, 1'b0}),
	.forcedispcompliance(1'b0),
	.forceelecidleout(wire_transmit_pcs1_forceelecidleout),
	.grayelecidleinferselout(wire_transmit_pcs1_grayelecidleinferselout),
	.hipdatain({tx_forcedispcompliance[1], tx_ctrlenable[1], tx_datain_wire[15:8]}),
	.hipdetectrxloop(tx_detectrxloop[1]),
	.hipelecidleinfersel(rx_elecidleinfersel[5:3]),
	.hipforceelecidle(tx_forceelecidle[1]),
	.hippowerdn(powerdn[3:2]),
	.hiptxclkout(),
	.hiptxdeemph(tx_pipedeemph[1]),
	.hiptxmargin(tx_pipemargin[5:3]),
	.invpol(tx_invpolarity[1]),
	.iqpphfifobyteselout(),
	.iqpphfifordclkout(),
	.iqpphfifordenableout(),
	.iqpphfifowrenableout(),
	.localrefclk(tx_localrefclk[1]),
	.parallelfdbkout(),
	.phfifobyteselout(),
	.phfifobyteserdisable(int_rx_phfifobyteserdisable[1]),
	.phfifooverflow(),
	.phfifoptrsreset(int_rx_phfifoptrsresetout[1]),
	.phfifordclkout(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(wire_transmit_pcs1_phfiforddisableout),
	.phfifordenableout(),
	.phfiforeset(tx_phfiforeset[1]),
	.phfiforesetout(wire_transmit_pcs1_phfiforesetout),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(wire_transmit_pcs1_phfifowrenableout),
	.phfifoxnbytesel(int_tx_phfifoxnbytesel[5:3]),
	.phfifoxnptrsreset(int_tx_phfifioxnptrsreset[5:3]),
	.phfifoxnrdclk(int_tx_phfifoxnrdclk[5:3]),
	.phfifoxnrdenable(int_tx_phfifoxnrdenable[5:3]),
	.phfifoxnwrenable(int_tx_phfifoxnwrenable[5:3]),
	.pipeenrevparallellpbkout(wire_transmit_pcs1_pipeenrevparallellpbkout),
	.pipepowerdownout(wire_transmit_pcs1_pipepowerdownout),
	.pipepowerstateout(wire_transmit_pcs1_pipepowerstateout),
	.pipestatetransdone(rx_pipestatetransdoneout[1]),
	.pipetxswing(tx_pipeswing[1]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdenablesync(),
	.refclk(refclk_pma[0]),
	.revparallelfdbk(rx_revparallelfdbkdata[39:20]),
	.txdetectrx(wire_transmit_pcs1_txdetectrx),
	.xgmctrl(cent_unit_txctrlout[1]),
	.xgmctrlenable(),
	.xgmdatain(cent_unit_tx_xgmdataout[15:8]),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.coreclk(1'b0),
	.datain({40{1'b0}}),
	.detectrxloop(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.freezptr(1'b0),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnrdclk({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifoxnbottombytesel(1'b0),
	.phfifoxnbottomrdclk(1'b0),
	.phfifoxnbottomrdenable(1'b0),
	.phfifoxnbottomwrenable(1'b0),
	.phfifoxntopbytesel(1'b0),
	.phfifoxntoprdclk(1'b0),
	.phfifoxntoprdenable(1'b0),
	.phfifoxntopwrenable(1'b0),
	.pipetxdeemph(1'b0),
	.pipetxmargin({3{1'b0}}),
	.powerdn({2{1'b0}}),
	.prbscidenable(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs1.allow_polarity_inversion = "false",
		transmit_pcs1.auto_spd_self_switch_enable = "false",
		transmit_pcs1.bitslip_enable = "false",
		transmit_pcs1.channel_bonding = "x4",
		transmit_pcs1.channel_number = ((starting_channel_number + 1) % 4),
		transmit_pcs1.channel_width = 8,
		transmit_pcs1.core_clock_0ppm = "false",
		transmit_pcs1.datapath_low_latency_mode = "false",
		transmit_pcs1.datapath_protocol = "pipe",
		transmit_pcs1.disable_ph_low_latency_mode = "false",
		transmit_pcs1.disparity_mode = "new",
		transmit_pcs1.dprio_config_mode = 6'h01,
		transmit_pcs1.elec_idle_delay = 6,
		transmit_pcs1.enable_bit_reversal = "false",
		transmit_pcs1.enable_idle_selection = "false",
		transmit_pcs1.enable_reverse_parallel_loopback = "true",
		transmit_pcs1.enable_self_test_mode = "false",
		transmit_pcs1.enable_symbol_swap = "false",
		transmit_pcs1.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs1.enc_8b_10b_mode = "normal",
		transmit_pcs1.force_echar = "false",
		transmit_pcs1.force_kchar = "false",
		transmit_pcs1.hip_enable = "true",
		transmit_pcs1.logical_channel_address = (starting_channel_number + 1),
		transmit_pcs1.ph_fifo_reg_mode = "true",
		transmit_pcs1.ph_fifo_xn_mapping0 = "none",
		transmit_pcs1.ph_fifo_xn_mapping1 = "none",
		transmit_pcs1.ph_fifo_xn_mapping2 = "central",
		transmit_pcs1.ph_fifo_xn_select = 2,
		transmit_pcs1.pipe_auto_speed_nego_enable = "true",
		transmit_pcs1.pipe_freq_scale_mode = "Frequency",
		transmit_pcs1.pipe_voltage_swing_control = "false",
		transmit_pcs1.prbs_cid_pattern = "false",
		transmit_pcs1.protocol_hint = "pcie2",
		transmit_pcs1.refclk_select = "cmu_clock_divider",
		transmit_pcs1.self_test_mode = "incremental",
		transmit_pcs1.use_double_data_mode = "false",
		transmit_pcs1.use_serializer_double_data_mode = "false",
		transmit_pcs1.wr_clk_mux_select = "int_clk",
		transmit_pcs1.lpm_type = "stratixiv_hssi_tx_pcs";
	stratixiv_hssi_tx_pcs   transmit_pcs2
	(
	.clkout(),
	.coreclkout(wire_transmit_pcs2_coreclkout),
	.ctrlenable({{3{1'b0}}, 1'b0}),
	.datainfull({44{1'b0}}),
	.dataout(wire_transmit_pcs2_dataout),
	.digitalreset(tx_digitalreset_out[2]),
	.dispval({{3{1'b0}}, 1'b0}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[449:300]),
	.dprioout(wire_transmit_pcs2_dprioout),
	.enrevparallellpbk(tx_revparallellpbken[2]),
	.forcedisp({{3{1'b0}}, 1'b0}),
	.forcedispcompliance(1'b0),
	.forceelecidleout(wire_transmit_pcs2_forceelecidleout),
	.grayelecidleinferselout(wire_transmit_pcs2_grayelecidleinferselout),
	.hipdatain({tx_forcedispcompliance[2], tx_ctrlenable[2], tx_datain_wire[23:16]}),
	.hipdetectrxloop(tx_detectrxloop[2]),
	.hipelecidleinfersel(rx_elecidleinfersel[8:6]),
	.hipforceelecidle(tx_forceelecidle[2]),
	.hippowerdn(powerdn[5:4]),
	.hiptxclkout(),
	.hiptxdeemph(tx_pipedeemph[2]),
	.hiptxmargin(tx_pipemargin[8:6]),
	.invpol(tx_invpolarity[2]),
	.iqpphfifobyteselout(),
	.iqpphfifordclkout(),
	.iqpphfifordenableout(),
	.iqpphfifowrenableout(),
	.localrefclk(tx_localrefclk[2]),
	.parallelfdbkout(),
	.phfifobyteselout(),
	.phfifobyteserdisable(int_rx_phfifobyteserdisable[2]),
	.phfifooverflow(),
	.phfifoptrsreset(int_rx_phfifoptrsresetout[2]),
	.phfifordclkout(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(wire_transmit_pcs2_phfiforddisableout),
	.phfifordenableout(),
	.phfiforeset(tx_phfiforeset[2]),
	.phfiforesetout(wire_transmit_pcs2_phfiforesetout),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(wire_transmit_pcs2_phfifowrenableout),
	.phfifoxnbytesel(int_tx_phfifoxnbytesel[8:6]),
	.phfifoxnptrsreset(int_tx_phfifioxnptrsreset[8:6]),
	.phfifoxnrdclk(int_tx_phfifoxnrdclk[8:6]),
	.phfifoxnrdenable(int_tx_phfifoxnrdenable[8:6]),
	.phfifoxnwrenable(int_tx_phfifoxnwrenable[8:6]),
	.pipeenrevparallellpbkout(wire_transmit_pcs2_pipeenrevparallellpbkout),
	.pipepowerdownout(wire_transmit_pcs2_pipepowerdownout),
	.pipepowerstateout(wire_transmit_pcs2_pipepowerstateout),
	.pipestatetransdone(rx_pipestatetransdoneout[2]),
	.pipetxswing(tx_pipeswing[2]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdenablesync(),
	.refclk(refclk_pma[0]),
	.revparallelfdbk(rx_revparallelfdbkdata[59:40]),
	.txdetectrx(wire_transmit_pcs2_txdetectrx),
	.xgmctrl(cent_unit_txctrlout[2]),
	.xgmctrlenable(),
	.xgmdatain(cent_unit_tx_xgmdataout[23:16]),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.coreclk(1'b0),
	.datain({40{1'b0}}),
	.detectrxloop(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.freezptr(1'b0),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnrdclk({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifoxnbottombytesel(1'b0),
	.phfifoxnbottomrdclk(1'b0),
	.phfifoxnbottomrdenable(1'b0),
	.phfifoxnbottomwrenable(1'b0),
	.phfifoxntopbytesel(1'b0),
	.phfifoxntoprdclk(1'b0),
	.phfifoxntoprdenable(1'b0),
	.phfifoxntopwrenable(1'b0),
	.pipetxdeemph(1'b0),
	.pipetxmargin({3{1'b0}}),
	.powerdn({2{1'b0}}),
	.prbscidenable(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs2.allow_polarity_inversion = "false",
		transmit_pcs2.auto_spd_self_switch_enable = "false",
		transmit_pcs2.bitslip_enable = "false",
		transmit_pcs2.channel_bonding = "x4",
		transmit_pcs2.channel_number = ((starting_channel_number + 2) % 4),
		transmit_pcs2.channel_width = 8,
		transmit_pcs2.core_clock_0ppm = "false",
		transmit_pcs2.datapath_low_latency_mode = "false",
		transmit_pcs2.datapath_protocol = "pipe",
		transmit_pcs2.disable_ph_low_latency_mode = "false",
		transmit_pcs2.disparity_mode = "new",
		transmit_pcs2.dprio_config_mode = 6'h01,
		transmit_pcs2.elec_idle_delay = 6,
		transmit_pcs2.enable_bit_reversal = "false",
		transmit_pcs2.enable_idle_selection = "false",
		transmit_pcs2.enable_reverse_parallel_loopback = "true",
		transmit_pcs2.enable_self_test_mode = "false",
		transmit_pcs2.enable_symbol_swap = "false",
		transmit_pcs2.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs2.enc_8b_10b_mode = "normal",
		transmit_pcs2.force_echar = "false",
		transmit_pcs2.force_kchar = "false",
		transmit_pcs2.hip_enable = "true",
		transmit_pcs2.logical_channel_address = (starting_channel_number + 2),
		transmit_pcs2.ph_fifo_reg_mode = "true",
		transmit_pcs2.ph_fifo_xn_mapping0 = "none",
		transmit_pcs2.ph_fifo_xn_mapping1 = "none",
		transmit_pcs2.ph_fifo_xn_mapping2 = "central",
		transmit_pcs2.ph_fifo_xn_select = 2,
		transmit_pcs2.pipe_auto_speed_nego_enable = "true",
		transmit_pcs2.pipe_freq_scale_mode = "Frequency",
		transmit_pcs2.pipe_voltage_swing_control = "false",
		transmit_pcs2.prbs_cid_pattern = "false",
		transmit_pcs2.protocol_hint = "pcie2",
		transmit_pcs2.refclk_select = "cmu_clock_divider",
		transmit_pcs2.self_test_mode = "incremental",
		transmit_pcs2.use_double_data_mode = "false",
		transmit_pcs2.use_serializer_double_data_mode = "false",
		transmit_pcs2.wr_clk_mux_select = "int_clk",
		transmit_pcs2.lpm_type = "stratixiv_hssi_tx_pcs";
	stratixiv_hssi_tx_pcs   transmit_pcs3
	(
	.clkout(),
	.coreclkout(wire_transmit_pcs3_coreclkout),
	.ctrlenable({{3{1'b0}}, 1'b0}),
	.datainfull({44{1'b0}}),
	.dataout(wire_transmit_pcs3_dataout),
	.digitalreset(tx_digitalreset_out[3]),
	.dispval({{3{1'b0}}, 1'b0}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[599:450]),
	.dprioout(wire_transmit_pcs3_dprioout),
	.enrevparallellpbk(tx_revparallellpbken[3]),
	.forcedisp({{3{1'b0}}, 1'b0}),
	.forcedispcompliance(1'b0),
	.forceelecidleout(wire_transmit_pcs3_forceelecidleout),
	.grayelecidleinferselout(wire_transmit_pcs3_grayelecidleinferselout),
	.hipdatain({tx_forcedispcompliance[3], tx_ctrlenable[3], tx_datain_wire[31:24]}),
	.hipdetectrxloop(tx_detectrxloop[3]),
	.hipelecidleinfersel(rx_elecidleinfersel[11:9]),
	.hipforceelecidle(tx_forceelecidle[3]),
	.hippowerdn(powerdn[7:6]),
	.hiptxclkout(),
	.hiptxdeemph(tx_pipedeemph[3]),
	.hiptxmargin(tx_pipemargin[11:9]),
	.invpol(tx_invpolarity[3]),
	.iqpphfifobyteselout(),
	.iqpphfifordclkout(),
	.iqpphfifordenableout(),
	.iqpphfifowrenableout(),
	.localrefclk(tx_localrefclk[3]),
	.parallelfdbkout(),
	.phfifobyteselout(),
	.phfifobyteserdisable(int_rx_phfifobyteserdisable[3]),
	.phfifooverflow(),
	.phfifoptrsreset(int_rx_phfifoptrsresetout[3]),
	.phfifordclkout(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(wire_transmit_pcs3_phfiforddisableout),
	.phfifordenableout(),
	.phfiforeset(tx_phfiforeset[3]),
	.phfiforesetout(wire_transmit_pcs3_phfiforesetout),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(wire_transmit_pcs3_phfifowrenableout),
	.phfifoxnbytesel(int_tx_phfifoxnbytesel[11:9]),
	.phfifoxnptrsreset(int_tx_phfifioxnptrsreset[11:9]),
	.phfifoxnrdclk(int_tx_phfifoxnrdclk[11:9]),
	.phfifoxnrdenable(int_tx_phfifoxnrdenable[11:9]),
	.phfifoxnwrenable(int_tx_phfifoxnwrenable[11:9]),
	.pipeenrevparallellpbkout(wire_transmit_pcs3_pipeenrevparallellpbkout),
	.pipepowerdownout(wire_transmit_pcs3_pipepowerdownout),
	.pipepowerstateout(wire_transmit_pcs3_pipepowerstateout),
	.pipestatetransdone(rx_pipestatetransdoneout[3]),
	.pipetxswing(tx_pipeswing[3]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdenablesync(),
	.refclk(refclk_pma[0]),
	.revparallelfdbk(rx_revparallelfdbkdata[79:60]),
	.txdetectrx(wire_transmit_pcs3_txdetectrx),
	.xgmctrl(cent_unit_txctrlout[3]),
	.xgmctrlenable(),
	.xgmdatain(cent_unit_tx_xgmdataout[31:24]),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.coreclk(1'b0),
	.datain({40{1'b0}}),
	.detectrxloop(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.freezptr(1'b0),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnrdclk({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifoxnbottombytesel(1'b0),
	.phfifoxnbottomrdclk(1'b0),
	.phfifoxnbottomrdenable(1'b0),
	.phfifoxnbottomwrenable(1'b0),
	.phfifoxntopbytesel(1'b0),
	.phfifoxntoprdclk(1'b0),
	.phfifoxntoprdenable(1'b0),
	.phfifoxntopwrenable(1'b0),
	.pipetxdeemph(1'b0),
	.pipetxmargin({3{1'b0}}),
	.powerdn({2{1'b0}}),
	.prbscidenable(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs3.allow_polarity_inversion = "false",
		transmit_pcs3.auto_spd_self_switch_enable = "false",
		transmit_pcs3.bitslip_enable = "false",
		transmit_pcs3.channel_bonding = "x4",
		transmit_pcs3.channel_number = ((starting_channel_number + 3) % 4),
		transmit_pcs3.channel_width = 8,
		transmit_pcs3.core_clock_0ppm = "false",
		transmit_pcs3.datapath_low_latency_mode = "false",
		transmit_pcs3.datapath_protocol = "pipe",
		transmit_pcs3.disable_ph_low_latency_mode = "false",
		transmit_pcs3.disparity_mode = "new",
		transmit_pcs3.dprio_config_mode = 6'h01,
		transmit_pcs3.elec_idle_delay = 6,
		transmit_pcs3.enable_bit_reversal = "false",
		transmit_pcs3.enable_idle_selection = "false",
		transmit_pcs3.enable_reverse_parallel_loopback = "true",
		transmit_pcs3.enable_self_test_mode = "false",
		transmit_pcs3.enable_symbol_swap = "false",
		transmit_pcs3.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs3.enc_8b_10b_mode = "normal",
		transmit_pcs3.force_echar = "false",
		transmit_pcs3.force_kchar = "false",
		transmit_pcs3.hip_enable = "true",
		transmit_pcs3.logical_channel_address = (starting_channel_number + 3),
		transmit_pcs3.ph_fifo_reg_mode = "true",
		transmit_pcs3.ph_fifo_xn_mapping0 = "none",
		transmit_pcs3.ph_fifo_xn_mapping1 = "none",
		transmit_pcs3.ph_fifo_xn_mapping2 = "central",
		transmit_pcs3.ph_fifo_xn_select = 2,
		transmit_pcs3.pipe_auto_speed_nego_enable = "true",
		transmit_pcs3.pipe_freq_scale_mode = "Frequency",
		transmit_pcs3.pipe_voltage_swing_control = "false",
		transmit_pcs3.prbs_cid_pattern = "false",
		transmit_pcs3.protocol_hint = "pcie2",
		transmit_pcs3.refclk_select = "cmu_clock_divider",
		transmit_pcs3.self_test_mode = "incremental",
		transmit_pcs3.use_double_data_mode = "false",
		transmit_pcs3.use_serializer_double_data_mode = "false",
		transmit_pcs3.wr_clk_mux_select = "int_clk",
		transmit_pcs3.lpm_type = "stratixiv_hssi_tx_pcs";
	stratixiv_hssi_tx_pma   transmit_pma0
	(
	.clockout(wire_transmit_pma0_clockout),
	.datain({{44{1'b0}}, tx_dataout_pcs_to_pma[19:0]}),
	.dataout(wire_transmit_pma0_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[0]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[299:0]),
	.dprioout(wire_transmit_pma0_dprioout),
	.fastrefclk0in({2{1'b0}}),
	.fastrefclk1in(cmu_analogfastrefclkout[1:0]),
	.fastrefclk2in({2{1'b0}}),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(tx_pcs_forceelecidleout[0]),
	.powerdn(cent_unit_txobpowerdn[0]),
	.refclk0in({2{1'b0}}),
	.refclk0inpulse(1'b0),
	.refclk1in(cmu_analogrefclkout[1:0]),
	.refclk1inpulse(cmu_analogrefclkpulse[0]),
	.refclk2in({2{1'b0}}),
	.refclk2inpulse(1'b0),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
	.rxdetecten(txdetectrxout[0]),
	.rxdetectvalidout(wire_transmit_pma0_rxdetectvalidout),
	.rxfoundout(wire_transmit_pma0_rxfoundout),
	.seriallpbkout(),
	.txpmareset(tx_analogreset_out[0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datainfull({20{1'b0}}),
	.extra10gin({11{1'b0}}),
	.fastrefclk3in({2{1'b0}}),
	.pclk({5{1'b0}}),
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma0.analog_power = "auto",
		transmit_pma0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pma0.channel_type = "auto",
		transmit_pma0.clkin_select = 1,
		transmit_pma0.clkmux_delay = "false",
		transmit_pma0.common_mode = "0.65V",
		transmit_pma0.dprio_config_mode = 6'h01,
		transmit_pma0.enable_reverse_serial_loopback = "false",
		transmit_pma0.logical_channel_address = (starting_channel_number + 0),
		transmit_pma0.logical_protocol_hint_0 = "pcie2",
		transmit_pma0.low_speed_test_select = 0,
		transmit_pma0.physical_clkin1_mapping = "x4",
		transmit_pma0.preemp_pretap = 0,
		transmit_pma0.preemp_pretap_inv = "false",
		transmit_pma0.preemp_tap_1 = 0,
		transmit_pma0.preemp_tap_1_a = 28,
		transmit_pma0.preemp_tap_1_b = 22,
		transmit_pma0.preemp_tap_1_c = 7,
		transmit_pma0.preemp_tap_2 = 0,
		transmit_pma0.preemp_tap_2_inv = "false",
		transmit_pma0.protocol_hint = "pcie2",
		transmit_pma0.rx_detect = 0,
		transmit_pma0.serialization_factor = 10,
		transmit_pma0.slew_rate = "off",
		transmit_pma0.termination = "OCT 100 Ohms",
		transmit_pma0.use_external_termination = "false",
		transmit_pma0.use_pma_direct = "false",
		transmit_pma0.use_ser_double_data_mode = "false",
		transmit_pma0.vod_selection = 3,
		transmit_pma0.vod_selection_a = 6,
		transmit_pma0.vod_selection_c = 1,
		transmit_pma0.lpm_type = "stratixiv_hssi_tx_pma";
	stratixiv_hssi_tx_pma   transmit_pma1
	(
	.clockout(wire_transmit_pma1_clockout),
	.datain({{44{1'b0}}, tx_dataout_pcs_to_pma[39:20]}),
	.dataout(wire_transmit_pma1_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[1]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[599:300]),
	.dprioout(wire_transmit_pma1_dprioout),
	.fastrefclk0in({2{1'b0}}),
	.fastrefclk1in(cmu_analogfastrefclkout[1:0]),
	.fastrefclk2in({2{1'b0}}),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(tx_pcs_forceelecidleout[1]),
	.powerdn(cent_unit_txobpowerdn[1]),
	.refclk0in({2{1'b0}}),
	.refclk0inpulse(1'b0),
	.refclk1in(cmu_analogrefclkout[1:0]),
	.refclk1inpulse(cmu_analogrefclkpulse[0]),
	.refclk2in({2{1'b0}}),
	.refclk2inpulse(1'b0),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
	.rxdetecten(txdetectrxout[1]),
	.rxdetectvalidout(wire_transmit_pma1_rxdetectvalidout),
	.rxfoundout(wire_transmit_pma1_rxfoundout),
	.seriallpbkout(),
	.txpmareset(tx_analogreset_out[1])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datainfull({20{1'b0}}),
	.extra10gin({11{1'b0}}),
	.fastrefclk3in({2{1'b0}}),
	.pclk({5{1'b0}}),
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma1.analog_power = "auto",
		transmit_pma1.channel_number = ((starting_channel_number + 1) % 4),
		transmit_pma1.channel_type = "auto",
		transmit_pma1.clkin_select = 1,
		transmit_pma1.clkmux_delay = "false",
		transmit_pma1.common_mode = "0.65V",
		transmit_pma1.dprio_config_mode = 6'h01,
		transmit_pma1.enable_reverse_serial_loopback = "false",
		transmit_pma1.logical_channel_address = (starting_channel_number + 1),
		transmit_pma1.logical_protocol_hint_0 = "pcie2",
		transmit_pma1.low_speed_test_select = 0,
		transmit_pma1.physical_clkin1_mapping = "x4",
		transmit_pma1.preemp_pretap = 0,
		transmit_pma1.preemp_pretap_inv = "false",
		transmit_pma1.preemp_tap_1 = 0,
		transmit_pma1.preemp_tap_1_a = 28,
		transmit_pma1.preemp_tap_1_b = 22,
		transmit_pma1.preemp_tap_1_c = 7,
		transmit_pma1.preemp_tap_2 = 0,
		transmit_pma1.preemp_tap_2_inv = "false",
		transmit_pma1.protocol_hint = "pcie2",
		transmit_pma1.rx_detect = 0,
		transmit_pma1.serialization_factor = 10,
		transmit_pma1.slew_rate = "off",
		transmit_pma1.termination = "OCT 100 Ohms",
		transmit_pma1.use_external_termination = "false",
		transmit_pma1.use_pma_direct = "false",
		transmit_pma1.use_ser_double_data_mode = "false",
		transmit_pma1.vod_selection = 3,
		transmit_pma1.vod_selection_a = 6,
		transmit_pma1.vod_selection_c = 1,
		transmit_pma1.lpm_type = "stratixiv_hssi_tx_pma";
	stratixiv_hssi_tx_pma   transmit_pma2
	(
	.clockout(wire_transmit_pma2_clockout),
	.datain({{44{1'b0}}, tx_dataout_pcs_to_pma[59:40]}),
	.dataout(wire_transmit_pma2_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[2]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[899:600]),
	.dprioout(wire_transmit_pma2_dprioout),
	.fastrefclk0in({2{1'b0}}),
	.fastrefclk1in(cmu_analogfastrefclkout[1:0]),
	.fastrefclk2in({2{1'b0}}),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(tx_pcs_forceelecidleout[2]),
	.powerdn(cent_unit_txobpowerdn[2]),
	.refclk0in({2{1'b0}}),
	.refclk0inpulse(1'b0),
	.refclk1in(cmu_analogrefclkout[1:0]),
	.refclk1inpulse(cmu_analogrefclkpulse[0]),
	.refclk2in({2{1'b0}}),
	.refclk2inpulse(1'b0),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
	.rxdetecten(txdetectrxout[2]),
	.rxdetectvalidout(wire_transmit_pma2_rxdetectvalidout),
	.rxfoundout(wire_transmit_pma2_rxfoundout),
	.seriallpbkout(),
	.txpmareset(tx_analogreset_out[2])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datainfull({20{1'b0}}),
	.extra10gin({11{1'b0}}),
	.fastrefclk3in({2{1'b0}}),
	.pclk({5{1'b0}}),
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma2.analog_power = "auto",
		transmit_pma2.channel_number = ((starting_channel_number + 2) % 4),
		transmit_pma2.channel_type = "auto",
		transmit_pma2.clkin_select = 1,
		transmit_pma2.clkmux_delay = "false",
		transmit_pma2.common_mode = "0.65V",
		transmit_pma2.dprio_config_mode = 6'h01,
		transmit_pma2.enable_reverse_serial_loopback = "false",
		transmit_pma2.logical_channel_address = (starting_channel_number + 2),
		transmit_pma2.logical_protocol_hint_0 = "pcie2",
		transmit_pma2.low_speed_test_select = 0,
		transmit_pma2.physical_clkin1_mapping = "x4",
		transmit_pma2.preemp_pretap = 0,
		transmit_pma2.preemp_pretap_inv = "false",
		transmit_pma2.preemp_tap_1 = 0,
		transmit_pma2.preemp_tap_1_a = 28,
		transmit_pma2.preemp_tap_1_b = 22,
		transmit_pma2.preemp_tap_1_c = 7,
		transmit_pma2.preemp_tap_2 = 0,
		transmit_pma2.preemp_tap_2_inv = "false",
		transmit_pma2.protocol_hint = "pcie2",
		transmit_pma2.rx_detect = 0,
		transmit_pma2.serialization_factor = 10,
		transmit_pma2.slew_rate = "off",
		transmit_pma2.termination = "OCT 100 Ohms",
		transmit_pma2.use_external_termination = "false",
		transmit_pma2.use_pma_direct = "false",
		transmit_pma2.use_ser_double_data_mode = "false",
		transmit_pma2.vod_selection = 3,
		transmit_pma2.vod_selection_a = 6,
		transmit_pma2.vod_selection_c = 1,
		transmit_pma2.lpm_type = "stratixiv_hssi_tx_pma";
	stratixiv_hssi_tx_pma   transmit_pma3
	(
	.clockout(wire_transmit_pma3_clockout),
	.datain({{44{1'b0}}, tx_dataout_pcs_to_pma[79:60]}),
	.dataout(wire_transmit_pma3_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[3]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[1199:900]),
	.dprioout(wire_transmit_pma3_dprioout),
	.fastrefclk0in({2{1'b0}}),
	.fastrefclk1in(cmu_analogfastrefclkout[1:0]),
	.fastrefclk2in({2{1'b0}}),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(tx_pcs_forceelecidleout[3]),
	.powerdn(cent_unit_txobpowerdn[3]),
	.refclk0in({2{1'b0}}),
	.refclk0inpulse(1'b0),
	.refclk1in(cmu_analogrefclkout[1:0]),
	.refclk1inpulse(cmu_analogrefclkpulse[0]),
	.refclk2in({2{1'b0}}),
	.refclk2inpulse(1'b0),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
	.rxdetecten(txdetectrxout[3]),
	.rxdetectvalidout(wire_transmit_pma3_rxdetectvalidout),
	.rxfoundout(wire_transmit_pma3_rxfoundout),
	.seriallpbkout(),
	.txpmareset(tx_analogreset_out[3])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datainfull({20{1'b0}}),
	.extra10gin({11{1'b0}}),
	.fastrefclk3in({2{1'b0}}),
	.pclk({5{1'b0}}),
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma3.analog_power = "auto",
		transmit_pma3.channel_number = ((starting_channel_number + 3) % 4),
		transmit_pma3.channel_type = "auto",
		transmit_pma3.clkin_select = 1,
		transmit_pma3.clkmux_delay = "false",
		transmit_pma3.common_mode = "0.65V",
		transmit_pma3.dprio_config_mode = 6'h01,
		transmit_pma3.enable_reverse_serial_loopback = "false",
		transmit_pma3.logical_channel_address = (starting_channel_number + 3),
		transmit_pma3.logical_protocol_hint_0 = "pcie2",
		transmit_pma3.low_speed_test_select = 0,
		transmit_pma3.physical_clkin1_mapping = "x4",
		transmit_pma3.preemp_pretap = 0,
		transmit_pma3.preemp_pretap_inv = "false",
		transmit_pma3.preemp_tap_1 = 0,
		transmit_pma3.preemp_tap_1_a = 28,
		transmit_pma3.preemp_tap_1_b = 22,
		transmit_pma3.preemp_tap_1_c = 7,
		transmit_pma3.preemp_tap_2 = 0,
		transmit_pma3.preemp_tap_2_inv = "false",
		transmit_pma3.protocol_hint = "pcie2",
		transmit_pma3.rx_detect = 0,
		transmit_pma3.serialization_factor = 10,
		transmit_pma3.slew_rate = "off",
		transmit_pma3.termination = "OCT 100 Ohms",
		transmit_pma3.use_external_termination = "false",
		transmit_pma3.use_pma_direct = "false",
		transmit_pma3.use_ser_double_data_mode = "false",
		transmit_pma3.vod_selection = 3,
		transmit_pma3.vod_selection_a = 6,
		transmit_pma3.vod_selection_c = 1,
		transmit_pma3.lpm_type = "stratixiv_hssi_tx_pma";
	assign
		cal_blk_powerdown = 1'b0,
		cent_unit_clkdivpowerdn = {wire_cent_unit0_clkdivpowerdn[0]},
		cent_unit_cmudividerdprioout = {wire_cent_unit0_cmudividerdprioout},
		cent_unit_cmuplldprioout = {wire_cent_unit0_cmuplldprioout},
		cent_unit_pllpowerdn = {wire_cent_unit0_pllpowerdn[1:0]},
		cent_unit_pllresetout = {wire_cent_unit0_pllresetout[1:0]},
		cent_unit_quadresetout = {wire_cent_unit0_quadresetout},
		cent_unit_rxcrupowerdn = {wire_cent_unit0_rxcrupowerdown[5:0]},
		cent_unit_rxibpowerdn = {wire_cent_unit0_rxibpowerdown[5:0]},
		cent_unit_rxpcsdprioin = {rx_pcsdprioout[1599:0]},
		cent_unit_rxpcsdprioout = {wire_cent_unit0_rxpcsdprioout[1599:0]},
		cent_unit_rxpmadprioin = {{2{{300{1'b0}}}}, rx_pmadprioout[1199:0]},
		cent_unit_rxpmadprioout = {wire_cent_unit0_rxpmadprioout[1799:0]},
		cent_unit_tx_dprioin = {{600{1'b0}}, tx_txdprioout[599:0]},
		cent_unit_tx_xgmdataout = {wire_cent_unit0_txdataout[31:0]},
		cent_unit_txctrlout = {wire_cent_unit0_txctrlout},
		cent_unit_txdetectrxpowerdn = {wire_cent_unit0_txdetectrxpowerdown[5:0]},
		cent_unit_txdprioout = {wire_cent_unit0_txpcsdprioout[599:0]},
		cent_unit_txobpowerdn = {wire_cent_unit0_txobpowerdown[5:0]},
		cent_unit_txpmadprioin = {{2{{300{1'b0}}}}, tx_pmadprioout[1199:0]},
		cent_unit_txpmadprioout = {wire_cent_unit0_txpmadprioout[1799:0]},
		clk_div_clk0in = {pll0_out[3:0]},
		clk_div_cmudividerdprioin = {{100{1'b0}}, wire_central_clk_div0_dprioout, {400{1'b0}}},
		cmu_analogfastrefclkout = {wire_central_clk_div0_analogfastrefclkout},
		cmu_analogrefclkout = {wire_central_clk_div0_analogrefclkout},
		cmu_analogrefclkpulse = {wire_central_clk_div0_analogrefclkpulse},
		coreclkout = {coreclkout_wire[0]},
		coreclkout_wire = {wire_central_clk_div0_coreclkout},
		fixedclk_div_in = {fixedclk_div5quad0c, fixedclk_div4quad0c, fixedclk_div3quad0c, fixedclk_div2quad0c, fixedclk_div1quad0c, fixedclk_div0quad0c},
		fixedclk_enable = reconfig_togxb_busy_reg[0],
		fixedclk_fast = {6{1'b1}},
		fixedclk_in = {{2{1'b0}}, {4{fixedclk}}},
		fixedclk_sel = reconfig_togxb_busy_reg[1],
		fixedclk_to_cmu = {((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[5]) & fixedclk_div_in[5]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[5])), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[4]) & fixedclk_div_in[4]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[4])), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[3]) & fixedclk_div_in[3]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[3])), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[2]) & fixedclk_div_in[2]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[2])), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[1]) & fixedclk_div_in[1]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[1])), ((((fixedclk_sel & fixedclk_enable) & fixedclk_fast[0]) & fixedclk_div_in[0]) | (((~ fixedclk_sel) & (~ fixedclk_enable)) & fixedclk_in[0]))},
		hip_tx_clkout = {{3{1'b0}}, wire_central_clk_div0_refclkout},
		int_autospdx4configsel = {wire_cent_unit0_autospdx4configsel},
		int_autospdx4rateswitchout = {wire_cent_unit0_autospdx4rateswitchout},
		int_autospdx4spdchg = {wire_cent_unit0_autospdx4spdchg},
		int_hipautospdrateswitchout = {wire_receive_pcs3_autospdrateswitchout, wire_receive_pcs2_autospdrateswitchout, wire_receive_pcs1_autospdrateswitchout, wire_receive_pcs0_autospdrateswitchout},
		int_hiprateswtichdone = {wire_central_clk_div0_rateswitchdone},
		int_phfifiox4ptrsreset = {wire_cent_unit0_phfifiox4ptrsreset},
		int_pipeenrevparallellpbkfromtx = {wire_transmit_pcs3_pipeenrevparallellpbkout, wire_transmit_pcs2_pipeenrevparallellpbkout, wire_transmit_pcs1_pipeenrevparallellpbkout, wire_transmit_pcs0_pipeenrevparallellpbkout},
		int_rateswitch = {int_rx_rateswitchout[0]},
		int_rx_autospdxnconfigsel = {int_autospdx4configsel[0], {2{1'b0}}, int_autospdx4configsel[0], {2{1'b0}}, int_autospdx4configsel[0], {2{1'b0}}, int_autospdx4configsel[0], {2{1'b0}}},
		int_rx_autospdxnspdchg = {int_autospdx4spdchg[0], {2{1'b0}}, int_autospdx4spdchg[0], {2{1'b0}}, int_autospdx4spdchg[0], {2{1'b0}}, int_autospdx4spdchg[0], {2{1'b0}}},
		int_rx_coreclkout = {wire_receive_pcs3_coreclkout, wire_receive_pcs2_coreclkout, wire_receive_pcs1_coreclkout, wire_receive_pcs0_coreclkout},
		int_rx_digitalreset_reg = {rx_digitalreset_reg0c[2]},
		int_rx_phfifioxnptrsreset = {int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}},
		int_rx_phfifobyteserdisable = {wire_receive_pcs3_phfifobyteserdisableout, wire_receive_pcs2_phfifobyteserdisableout, wire_receive_pcs1_phfifobyteserdisableout, wire_receive_pcs0_phfifobyteserdisableout},
		int_rx_phfifoptrsresetout = {wire_receive_pcs3_phfifoptrsresetout, wire_receive_pcs2_phfifoptrsresetout, wire_receive_pcs1_phfifoptrsresetout, wire_receive_pcs0_phfifoptrsresetout},
		int_rx_phfifordenableout = {wire_receive_pcs3_phfifordenableout, wire_receive_pcs2_phfifordenableout, wire_receive_pcs1_phfifordenableout, wire_receive_pcs0_phfifordenableout},
		int_rx_phfiforesetout = {wire_receive_pcs3_phfiforesetout, wire_receive_pcs2_phfiforesetout, wire_receive_pcs1_phfiforesetout, wire_receive_pcs0_phfiforesetout},
		int_rx_phfifowrdisableout = {wire_receive_pcs3_phfifowrdisableout, wire_receive_pcs2_phfifowrdisableout, wire_receive_pcs1_phfifowrdisableout, wire_receive_pcs0_phfifowrdisableout},
		int_rx_phfifoxnbytesel = {int_rxphfifox4byteselout[0], {2{1'b0}}, int_rxphfifox4byteselout[0], {2{1'b0}}, int_rxphfifox4byteselout[0], {2{1'b0}}, int_rxphfifox4byteselout[0], {2{1'b0}}},
		int_rx_phfifoxnrdenable = {int_rxphfifox4rdenableout[0], {2{1'b0}}, int_rxphfifox4rdenableout[0], {2{1'b0}}, int_rxphfifox4rdenableout[0], {2{1'b0}}, int_rxphfifox4rdenableout[0], {2{1'b0}}},
		int_rx_phfifoxnwrclk = {int_rxphfifox4wrclkout[0], {2{1'b0}}, int_rxphfifox4wrclkout[0], {2{1'b0}}, int_rxphfifox4wrclkout[0], {2{1'b0}}, int_rxphfifox4wrclkout[0], {2{1'b0}}},
		int_rx_phfifoxnwrenable = {int_rxphfifox4wrenableout[0], {2{1'b0}}, int_rxphfifox4wrenableout[0], {2{1'b0}}, int_rxphfifox4wrenableout[0], {2{1'b0}}, int_rxphfifox4wrenableout[0], {2{1'b0}}},
		int_rx_rateswitchout = {wire_receive_pcs3_rateswitchout, wire_receive_pcs2_rateswitchout, wire_receive_pcs1_rateswitchout, wire_receive_pcs0_rateswitchout},
		int_rxcoreclk = {int_rx_coreclkout[0]},
		int_rxpcs_cdrctrlearlyeios = {wire_receive_pcs3_cdrctrlearlyeios, wire_receive_pcs2_cdrctrlearlyeios, wire_receive_pcs1_cdrctrlearlyeios, wire_receive_pcs0_cdrctrlearlyeios},
		int_rxphfifordenable = {int_rx_phfifordenableout[0]},
		int_rxphfiforeset = {int_rx_phfiforesetout[0]},
		int_rxphfifox4byteselout = {wire_cent_unit0_rxphfifox4byteselout},
		int_rxphfifox4rdenableout = {wire_cent_unit0_rxphfifox4rdenableout},
		int_rxphfifox4wrclkout = {wire_cent_unit0_rxphfifox4wrclkout},
		int_rxphfifox4wrenableout = {wire_cent_unit0_rxphfifox4wrenableout},
		int_tx_coreclkout = {wire_transmit_pcs3_coreclkout, wire_transmit_pcs2_coreclkout, wire_transmit_pcs1_coreclkout, wire_transmit_pcs0_coreclkout},
		int_tx_digitalreset_reg = {tx_digitalreset_reg0c[2]},
		int_tx_phfifioxnptrsreset = {int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}, int_phfifiox4ptrsreset[0], {2{1'b0}}},
		int_tx_phfiforddisableout = {wire_transmit_pcs3_phfiforddisableout, wire_transmit_pcs2_phfiforddisableout, wire_transmit_pcs1_phfiforddisableout, wire_transmit_pcs0_phfiforddisableout},
		int_tx_phfiforesetout = {wire_transmit_pcs3_phfiforesetout, wire_transmit_pcs2_phfiforesetout, wire_transmit_pcs1_phfiforesetout, wire_transmit_pcs0_phfiforesetout},
		int_tx_phfifowrenableout = {wire_transmit_pcs3_phfifowrenableout, wire_transmit_pcs2_phfifowrenableout, wire_transmit_pcs1_phfifowrenableout, wire_transmit_pcs0_phfifowrenableout},
		int_tx_phfifoxnbytesel = {int_txphfifox4byteselout[0], {2{1'b0}}, int_txphfifox4byteselout[0], {2{1'b0}}, int_txphfifox4byteselout[0], {2{1'b0}}, int_txphfifox4byteselout[0], {2{1'b0}}},
		int_tx_phfifoxnrdclk = {int_txphfifox4rdclkout[0], {2{1'b0}}, int_txphfifox4rdclkout[0], {2{1'b0}}, int_txphfifox4rdclkout[0], {2{1'b0}}, int_txphfifox4rdclkout[0], {2{1'b0}}},
		int_tx_phfifoxnrdenable = {int_txphfifox4rdenableout[0], {2{1'b0}}, int_txphfifox4rdenableout[0], {2{1'b0}}, int_txphfifox4rdenableout[0], {2{1'b0}}, int_txphfifox4rdenableout[0], {2{1'b0}}},
		int_tx_phfifoxnwrenable = {int_txphfifox4wrenableout[0], {2{1'b0}}, int_txphfifox4wrenableout[0], {2{1'b0}}, int_txphfifox4wrenableout[0], {2{1'b0}}, int_txphfifox4wrenableout[0], {2{1'b0}}},
		int_txcoreclk = {int_tx_coreclkout[0]},
		int_txphfiforddisable = {int_tx_phfiforddisableout[0]},
		int_txphfiforeset = {int_tx_phfiforesetout[0]},
		int_txphfifowrenable = {int_tx_phfifowrenableout[0]},
		int_txphfifox4byteselout = {wire_cent_unit0_txphfifox4byteselout},
		int_txphfifox4rdclkout = {wire_cent_unit0_txphfifox4rdclkout},
		int_txphfifox4rdenableout = {wire_cent_unit0_txphfifox4rdenableout},
		int_txphfifox4wrenableout = {wire_cent_unit0_txphfifox4wrenableout},
		nonusertocmu_out = {wire_cal_blk0_nonusertocmu},
		pipedatavalid = {pipedatavalid_out[3:0]},
		pipedatavalid_out = {wire_receive_pcs3_hipdatavalid, wire_receive_pcs2_hipdatavalid, wire_receive_pcs1_hipdatavalid, wire_receive_pcs0_hipdatavalid},
		pipeelecidle = {pipeelecidle_out[3:0]},
		pipeelecidle_out = {wire_receive_pcs3_hipelecidle, wire_receive_pcs2_hipelecidle, wire_receive_pcs1_hipelecidle, wire_receive_pcs0_hipelecidle},
		pipephydonestatus = {wire_receive_pcs3_hipphydonestatus, wire_receive_pcs2_hipphydonestatus, wire_receive_pcs1_hipphydonestatus, wire_receive_pcs0_hipphydonestatus},
		pipestatus = {wire_receive_pcs3_hipstatus, wire_receive_pcs2_hipstatus, wire_receive_pcs1_hipstatus, wire_receive_pcs0_hipstatus},
		pll0_clkin = {{9{1'b0}}, pll_inclk_wire[0]},
		pll0_dprioin = {cent_unit_cmuplldprioout[1499:1200]},
		pll0_dprioout = {wire_tx_pll0_dprioout},
		pll0_out = {wire_tx_pll0_clk[3:0]},
		pll_ch_dataout_wire = {wire_rx_cdr_pll3_dataout, wire_rx_cdr_pll2_dataout, wire_rx_cdr_pll1_dataout, wire_rx_cdr_pll0_dataout},
		pll_ch_dprioout = {wire_rx_cdr_pll3_dprioout, wire_rx_cdr_pll2_dprioout, wire_rx_cdr_pll1_dprioout, wire_rx_cdr_pll0_dprioout},
		pll_cmuplldprioout = {{300{1'b0}}, pll0_dprioout[299:0], pll_ch_dprioout[1199:0]},
		pll_inclk_wire = {pll_inclk},
		pll_locked = {pll_locked_out[0]},
		pll_locked_out = {wire_tx_pll0_locked},
		pllpowerdn_in = {1'b0, cent_unit_pllpowerdn[0]},
		pllreset_in = {1'b0, cent_unit_pllresetout[0]},
		rateswitchbaseclock = {wire_central_clk_div0_rateswitchbaseclock},
		reconfig_fromgxb = {rx_pma_analogtestbus[16:1], wire_cent_unit0_dprioout},
		reconfig_togxb_busy = reconfig_togxb[3],
		reconfig_togxb_disable = reconfig_togxb[1],
		reconfig_togxb_in = reconfig_togxb[0],
		reconfig_togxb_load = reconfig_togxb[2],
		refclk_pma = {wire_central_clk_div0_refclkout},
		rx_analogreset_in = {{2{1'b0}}, {4{((~ reconfig_togxb_busy) & rx_analogreset[0])}}},
		rx_analogreset_out = {wire_cent_unit0_rxanalogresetout[5:0]},
		rx_cruclk_in = {{9{1'b0}}, rx_pldcruclk_in[3], {9{1'b0}}, rx_pldcruclk_in[2], {9{1'b0}}, rx_pldcruclk_in[1], {9{1'b0}}, rx_pldcruclk_in[0]},
		rx_ctrldetect = {wire_receive_pcs3_hipdataout[8], wire_receive_pcs2_hipdataout[8], wire_receive_pcs1_hipdataout[8], wire_receive_pcs0_hipdataout[8]},
		rx_dataout = {rx_out_wire[31:0]},
		rx_deserclock_in = {rx_pll_clkout[15:0]},
		rx_digitalreset_in = {4{int_rx_digitalreset_reg[0]}},
		rx_digitalreset_out = {wire_cent_unit0_rxdigitalresetout[3:0]},
		rx_enapatternalign = {4{1'b0}},
		rx_freqlocked = {(rx_freqlocked_wire[3] & (~ rx_analogreset[0])), (rx_freqlocked_wire[2] & (~ rx_analogreset[0])), (rx_freqlocked_wire[1] & (~ rx_analogreset[0])), (rx_freqlocked_wire[0] & (~ rx_analogreset[0]))},
		rx_freqlocked_wire = {wire_rx_cdr_pll3_freqlocked, wire_rx_cdr_pll2_freqlocked, wire_rx_cdr_pll1_freqlocked, wire_rx_cdr_pll0_freqlocked},
		rx_locktodata = {4{1'b0}},
		rx_locktodata_wire = {((~ reconfig_togxb_busy) & rx_locktodata[3]), ((~ reconfig_togxb_busy) & rx_locktodata[2]), ((~ reconfig_togxb_busy) & rx_locktodata[1]), ((~ reconfig_togxb_busy) & rx_locktodata[0])},
		rx_locktorefclk_wire = {wire_receive_pcs3_cdrctrllocktorefclkout, wire_receive_pcs2_cdrctrllocktorefclkout, wire_receive_pcs1_cdrctrllocktorefclkout, wire_receive_pcs0_cdrctrllocktorefclkout},
		rx_out_wire = {wire_receive_pcs3_hipdataout[7:0], wire_receive_pcs2_hipdataout[7:0], wire_receive_pcs1_hipdataout[7:0], wire_receive_pcs0_hipdataout[7:0]},
		rx_pcs_rxfound_wire = {txdetectrxout[3], tx_rxfoundout[3], txdetectrxout[2], tx_rxfoundout[2], txdetectrxout[1], tx_rxfoundout[1], txdetectrxout[0], tx_rxfoundout[0]},
		rx_pcsdprioin_wire = {cent_unit_rxpcsdprioout[1599:0]},
		rx_pcsdprioout = {wire_receive_pcs3_dprioout, wire_receive_pcs2_dprioout, wire_receive_pcs1_dprioout, wire_receive_pcs0_dprioout},
		rx_phfifordenable = {4{1'b1}},
		rx_phfiforeset = {4{1'b0}},
		rx_phfifowrdisable = {4{1'b0}},
		rx_pipestatetransdoneout = {wire_receive_pcs3_pipestatetransdoneout, wire_receive_pcs2_pipestatetransdoneout, wire_receive_pcs1_pipestatetransdoneout, wire_receive_pcs0_pipestatetransdoneout},
		rx_pldcruclk_in = {rx_cruclk[3:0]},
		rx_pll_clkout = {wire_rx_cdr_pll3_clk, wire_rx_cdr_pll2_clk, wire_rx_cdr_pll1_clk, wire_rx_cdr_pll0_clk},
		rx_pll_locked = {(rx_plllocked_wire[3] & (~ rx_analogreset[0])), (rx_plllocked_wire[2] & (~ rx_analogreset[0])), (rx_plllocked_wire[1] & (~ rx_analogreset[0])), (rx_plllocked_wire[0] & (~ rx_analogreset[0]))},
		rx_pll_pfdrefclkout_wire = {wire_rx_cdr_pll3_pfdrefclkout, wire_rx_cdr_pll2_pfdrefclkout, wire_rx_cdr_pll1_pfdrefclkout, wire_rx_cdr_pll0_pfdrefclkout},
		rx_plllocked_wire = {wire_rx_cdr_pll3_locked, wire_rx_cdr_pll2_locked, wire_rx_cdr_pll1_locked, wire_rx_cdr_pll0_locked},
		rx_pma_analogtestbus = {{51{1'b0}}, wire_receive_pma3_analogtestbus[5:2], wire_receive_pma2_analogtestbus[5:2], wire_receive_pma1_analogtestbus[5:2], wire_receive_pma0_analogtestbus[5:2], 1'b0},
		rx_pma_clockout = {wire_receive_pma3_clockout, wire_receive_pma2_clockout, wire_receive_pma1_clockout, wire_receive_pma0_clockout},
		rx_pma_dataout = {wire_receive_pma3_dataout, wire_receive_pma2_dataout, wire_receive_pma1_dataout, wire_receive_pma0_dataout},
		rx_pma_locktorefout = {wire_receive_pma3_locktorefout, wire_receive_pma2_locktorefout, wire_receive_pma1_locktorefout, wire_receive_pma0_locktorefout},
		rx_pma_recoverdataout_wire = {wire_receive_pma3_recoverdataout[19:0], wire_receive_pma2_recoverdataout[19:0], wire_receive_pma1_recoverdataout[19:0], wire_receive_pma0_recoverdataout[19:0]},
		rx_pmadprioin_wire = {{2{{300{1'b0}}}}, cent_unit_rxpmadprioout[1199:0]},
		rx_pmadprioout = {{2{{300{1'b0}}}}, wire_receive_pma3_dprioout, wire_receive_pma2_dprioout, wire_receive_pma1_dprioout, wire_receive_pma0_dprioout},
		rx_powerdown = {4{1'b0}},
		rx_powerdown_in = {{2{1'b0}}, rx_powerdown[3:0]},
		rx_prbscidenable = {4{1'b0}},
		rx_revparallelfdbkdata = {wire_receive_pcs3_revparallelfdbkdata, wire_receive_pcs2_revparallelfdbkdata, wire_receive_pcs1_revparallelfdbkdata, wire_receive_pcs0_revparallelfdbkdata},
		rx_rmfiforeset = {4{1'b0}},
		rx_rxcruresetout = {wire_cent_unit0_rxcruresetout[5:0]},
		rx_signaldetect = {rx_signaldetectout_wire[3:0]},
		rx_signaldetect_wire = {wire_receive_pma3_signaldetect, wire_receive_pma2_signaldetect, wire_receive_pma1_signaldetect, wire_receive_pma0_signaldetect},
		rx_signaldetectout_wire = {wire_receive_pcs3_signaldetect, wire_receive_pcs2_signaldetect, wire_receive_pcs1_signaldetect, wire_receive_pcs0_signaldetect},
		rxphfifowrdisable = {int_rx_phfifowrdisableout[0]},
		rxpll_dprioin = {{2{{300{1'b0}}}}, cent_unit_cmuplldprioout[1199:0]},
		tx_analogreset_out = {wire_cent_unit0_txanalogresetout[5:0]},
		tx_datain_wire = {tx_datain[31:0]},
		tx_dataout = {wire_transmit_pma3_dataout, wire_transmit_pma2_dataout, wire_transmit_pma1_dataout, wire_transmit_pma0_dataout},
		tx_dataout_pcs_to_pma = {wire_transmit_pcs3_dataout, wire_transmit_pcs2_dataout, wire_transmit_pcs1_dataout, wire_transmit_pcs0_dataout},
		tx_digitalreset_in = {4{int_tx_digitalreset_reg[0]}},
		tx_digitalreset_out = {wire_cent_unit0_txdigitalresetout[3:0]},
		tx_dprioin_wire = {{600{1'b0}}, cent_unit_txdprioout[599:0]},
		tx_invpolarity = {4{1'b0}},
		tx_localrefclk = {wire_transmit_pma3_clockout, wire_transmit_pma2_clockout, wire_transmit_pma1_clockout, wire_transmit_pma0_clockout},
		tx_pcs_forceelecidleout = {wire_transmit_pcs3_forceelecidleout, wire_transmit_pcs2_forceelecidleout, wire_transmit_pcs1_forceelecidleout, wire_transmit_pcs0_forceelecidleout},
		tx_phfiforeset = {4{1'b0}},
		tx_pipepowerdownout = {wire_transmit_pcs3_pipepowerdownout, wire_transmit_pcs2_pipepowerdownout, wire_transmit_pcs1_pipepowerdownout, wire_transmit_pcs0_pipepowerdownout},
		tx_pipepowerstateout = {wire_transmit_pcs3_pipepowerstateout, wire_transmit_pcs2_pipepowerstateout, wire_transmit_pcs1_pipepowerstateout, wire_transmit_pcs0_pipepowerstateout},
		tx_pipeswing = {4{1'b0}},
		tx_pmadprioin_wire = {{2{{300{1'b0}}}}, cent_unit_txpmadprioout[1199:0]},
		tx_pmadprioout = {{2{{300{1'b0}}}}, wire_transmit_pma3_dprioout, wire_transmit_pma2_dprioout, wire_transmit_pma1_dprioout, wire_transmit_pma0_dprioout},
		tx_revparallellpbken = {4{1'b0}},
		tx_rxdetectvalidout = {wire_transmit_pma3_rxdetectvalidout, wire_transmit_pma2_rxdetectvalidout, wire_transmit_pma1_rxdetectvalidout, wire_transmit_pma0_rxdetectvalidout},
		tx_rxfoundout = {wire_transmit_pma3_rxfoundout, wire_transmit_pma2_rxfoundout, wire_transmit_pma1_rxfoundout, wire_transmit_pma0_rxfoundout},
		tx_txdprioout = {wire_transmit_pcs3_dprioout, wire_transmit_pcs2_dprioout, wire_transmit_pcs1_dprioout, wire_transmit_pcs0_dprioout},
		txdetectrxout = {wire_transmit_pcs3_txdetectrx, wire_transmit_pcs2_txdetectrx, wire_transmit_pcs1_txdetectrx, wire_transmit_pcs0_txdetectrx},
		w_cent_unit_dpriodisableout1w = {wire_cent_unit0_dpriodisableout};
endmodule