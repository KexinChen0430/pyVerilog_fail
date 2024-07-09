module
//	assign	wb_netb_ack   = 1'b0;
//	assign	wb_netb_stall = 1'b0;
//	assign	wb_netb_data  = wb_netp_data;
`endif
	clkcounter clksysclkctr(i_clk, ck_pps, i_clk, wb_sysclk_idata);
	initial	r_sysclk_ack = 0;
	always @(posedge i_clk)
		r_sysclk_ack <= (wb_sysclk_stb);
	assign	wb_sysclk_ack   = r_sysclk_ack;
	assign	wb_sysclk_stall = 1'b0;
	assign	wb_version_idata = `DATESTAMP;
	assign	wb_version_ack = wb_version_stb;
	assign	wb_version_stall = 1'b0;
	clkcounter clkclkhdmiinctr(i_clk, ck_pps, i_hdmi_in_clk, wb_clkhdmiin_idata);
	initial	r_clkhdmiin_ack = 0;
	always @(posedge i_clk)
		r_clkhdmiin_ack <= (wb_clkhdmiin_stb);
	assign	wb_clkhdmiin_ack   = r_clkhdmiin_ack;
	assign	wb_clkhdmiin_stall = 1'b0;
	assign	o_hdmi_out_r = hdmi_in_r;
	assign	o_hdmi_out_g = hdmi_in_g;
	assign	o_hdmi_out_b = hdmi_in_b;
`ifdef	GPSTRK_ACCESS
	gpsclock_tb #(.CLOCK_FREQUENCY_HZ(100000000))
		ppstb(i_clk, ck_pps, tb_pps,
			wb_gtb_cyc, wb_gtb_stb, wb_gtb_we,
			wb_gtb_addr[3-1:0],
			wb_gtb_data, // 32 bits wide
			wb_gtb_sel,  // 32/8 bits wide
		wb_gtb_stall, wb_gtb_ack, wb_gtb_idata,
			gps_err, gps_now, gps_step);
`ifdef	GPSTB
	assign	gps_pps = tb_pps;
`else
	assign	gps_pps = i_gps_pps;
`endif
`endif
`ifdef	SDSPI_ACCESS
	// {{{
	// SPI mapping
	wire	w_sd_cs_n, w_sd_mosi, w_sd_miso;
	sdspi	sdcardi(i_clk, sd_reset,
		wb_sdcard_cyc, wb_sdcard_stb, wb_sdcard_we,
			wb_sdcard_addr[2-1:0],
			wb_sdcard_data, // 32 bits wide
			wb_sdcard_sel,  // 32/8 bits wide
		wb_sdcard_stall, wb_sdcard_ack, wb_sdcard_idata,
		w_sd_cs_n, o_sd_sck, w_sd_mosi, w_sd_miso, i_sd_detect,
		sdcard_int, 1'b1, sdspi_debug);
	assign	w_sd_miso = i_sd_data[0];
	assign	o_sd_data = { w_sd_cs_n, 3'b111 };
	assign	o_sd_cmd  = w_sd_mosi;
	// }}}
`else	// SDSPI_ACCESS
	// {{{
	assign	o_sd_sck   = 1'b1;
	assign	o_sd_cmd   = 1'b1;
	assign	o_sd_data  = 4'hf;
	// Null bus slave
	// {{{
	// In the case that there is no wb_sdcard peripheral
	// responding on the wb bus
	assign	wb_sdcard_ack   = 1'b0;
	assign	wb_sdcard_err   = (wb_sdcard_stb);
	assign	wb_sdcard_stall = 0;
	assign	wb_sdcard_idata = 0;
	// }}}
	// Null interrupt definitions
	// {{{
	assign	sdcard_int = 1'b0;	// sdcard.INT.SDCARD.WIRE
	// }}}
	// }}}
`endif	// SDSPI_ACCESS
`ifdef	HDMIIN_ACCESS
	// {{{
	// HDMI input processor
	hdmiin	thehdmiin(i_clk, i_hdmi_in_clk, ck_pps,
			i_hdmi_in_actual_delay_r,
			i_hdmi_in_actual_delay_g,
			i_hdmi_in_actual_delay_b,
			o_hdmi_in_delay,
			i_hdmi_in_r, i_hdmi_in_g, i_hdmi_in_b,
			wb_cyc, (wb_stb)&&(hdmiin_sel), wb_we, wb_addr[3:0],
				wb_data, wb_sel,
			hdmiin_stall, hdmiin_ack, hdmiin_data,
			rambus_cyc, rambus_stb, rambus_we,
				rambus_addr, rambus_data, rambus_sel,
				rambus_stall, rambus_ack, rambus_err,
			hdmiin_int,
			hin_pixels, hin_dbg_scope);
	assign	hdmi_in_r = hin_pixels[29:20];
	assign	hdmi_in_g = hin_pixels[19:10];
	assign	hdmi_in_b = hin_pixels[ 9: 0];
	// }}}
`else	// HDMIIN_ACCESS
	// {{{
	// Null bus master
	// {{{
	// }}}
	// Null interrupt definitions
	// {{{
	assign	hdmiin_int = 1'b0;	// hdmiin.INT.VSYNC.WIRE
	// }}}
	// }}}
`endif	// HDMIIN_ACCESS
`ifdef	GPSTRK_ACCESS
	// {{{
	// Verilator lint_off UNUSED
	wire	[1:0]	ck_dbg;
	// Verilator lint_on  UNUSED
	gpsclock #(.DEFAULT_STEP(GPSCLOCK_DEFAULT_STEP))
		ppsck(i_clk, 1'b0, gps_pps, ck_pps, gps_led,
			wb_gck_cyc, wb_gck_stb, wb_gck_we,
			wb_gck_addr[2-1:0],
			wb_gck_data, // 32 bits wide
			wb_gck_sel,  // 32/8 bits wide
		wb_gck_stall, wb_gck_ack, wb_gck_idata,
			gps_tracking, gps_now, gps_step, gps_err, gps_locked,
			ck_dbg);
	// }}}
`else	// GPSTRK_ACCESS
	// {{{
	wire	[31:0]	pre_step;
	assign	pre_step = { 16'h00, (({GPSCLOCK_DEFAULT_STEP[27:0],20'h00})
				>>GPSCLOCK_DEFAULT_STEP[31:28]) };
	always @(posedge i_clk)
		{ ck_pps, gps_step[31:0] } <= gps_step + pre_step;
	assign	gck_stall  = 1'b0;
	assign	gps_now    = 64'h0;
	assign	gps_err    = 64'h0;
	assign	gps_step   = 64'h0;
	assign	gps_led    = 1'b0;
	assign	gps_locked = 1'b0;
	// Null interrupt definitions
	// {{{
	assign	ck_pps = 1'b0;	// gck.INT.PPS.WIRE
	// }}}
	// }}}
`endif	// GPSTRK_ACCESS
	assign	wb_buildtime_idata = `BUILDTIME;
	assign	wb_buildtime_ack = wb_buildtime_stb;
	assign	wb_buildtime_stall = 1'b0;
`ifdef	NETCTRL_ACCESS
	// {{{
	// Verilator lint_off UNUSED
	wire[31:0]	mdio_debug;
	// Verilator lint_on  UNUSED
	enetctrl #(2)
		mdio(i_clk, i_reset, wb_mdio_cyc, wb_mdio_stb, wb_mdio_we,
			wb_mdio_addr[5-1:0],
			wb_mdio_data, // 32 bits wide
			wb_mdio_sel,  // 32/8 bits wide
		wb_mdio_stall, wb_mdio_ack, wb_mdio_idata,
			o_mdclk, o_mdio, i_mdio, o_mdwe, mdio_debug);
	// }}}
`else	// NETCTRL_ACCESS
	// {{{
	assign	o_mdclk = 1'b1;
	assign	o_mdio  = 1'b1;
	assign	o_mdwe  = 1'b0;
	// Null bus slave
	// {{{
	// In the case that there is no wb_mdio peripheral
	// responding on the wb bus
	assign	wb_mdio_ack   = 1'b0;
	assign	wb_mdio_err   = (wb_mdio_stb);
	assign	wb_mdio_stall = 0;
	assign	wb_mdio_idata = 0;
	// }}}
	// }}}
`endif	// NETCTRL_ACCESS
`ifdef	CFG_ACCESS
	// {{{
`ifdef	VERILATOR
	reg	r_cfg_ack;
	initial	r_cfg_ack = 1'b0;
	always @(posedge i_clk)
		r_cfg_ack <= wb_cfg_stb;
	assign	wb_cfg_ack   = r_cfg_ack;
	assign	wb_cfg_stall = 1'b0;
	assign	wb_cfg_idata = 32'h00;
`else
	wbicapetwo #(ICAPE_LGDIV)
		cfgport(i_clk, wb_cfg_cyc, wb_cfg_stb, wb_cfg_we,
			wb_cfg_addr[5-1:0],
			wb_cfg_data, // 32 bits wide
			wb_cfg_sel,  // 32/8 bits wide
		wb_cfg_stall, wb_cfg_ack, wb_cfg_idata);
`endif
	// }}}
`else	// CFG_ACCESS
	// {{{
	// Null bus slave
	// {{{
	// In the case that there is no wb_cfg peripheral
	// responding on the wb bus
	assign	wb_cfg_ack   = 1'b0;
	assign	wb_cfg_err   = (wb_cfg_stb);
	assign	wb_cfg_stall = 0;
	assign	wb_cfg_idata = 0;
	// }}}
	// }}}
`endif	// CFG_ACCESS
`ifdef	PWRCOUNT_ACCESS
	// {{{
	initial	r_pwrcount_data = 32'h0;
	always @(posedge i_clk)
	if (r_pwrcount_data[31])
		r_pwrcount_data[30:0] <= r_pwrcount_data[30:0] + 1'b1;
	else
		r_pwrcount_data[31:0] <= r_pwrcount_data[31:0] + 1'b1;
	assign	wb_pwrcount_stall = 1'b0;
	assign	wb_pwrcount_ack   = wb_pwrcount_stb;
	assign	wb_pwrcount_idata = r_pwrcount_data;
	// }}}
`else	// PWRCOUNT_ACCESS
	// {{{
	// }}}
`endif	// PWRCOUNT_ACCESS
`ifdef	RTCDATE_ACCESS
	// {{{
	// The Calendar DATE
	rtcdate	rtcdatei(i_clk, rtc_ppd,
		wb_rtcdate_cyc, wb_rtcdate_stb, wb_rtcdate_we,
			wb_rtcdate_data, // 32 bits wide
			wb_rtcdate_sel,  // 32/8 bits wide
		wb_rtcdate_stall, wb_rtcdate_ack, wb_rtcdate_idata);
	// }}}
`else	// RTCDATE_ACCESS
	// {{{
	// }}}
`endif	// RTCDATE_ACCESS
	reg	scope_hdmiin_trigger, scope_hdmiin_tmp, scope_hdmiin_pre_trigger,
		scope_hdmiin_count_triggered;
	wire	scope_hdmiin_clear_stb;
	reg	[31:0]	scope_hdmiin_counter, scope_hdmiin_trigger_foo;
	initial	scope_hdmiin_pre_trigger = 1'b1;
	always @(posedge i_hdmi_in_clk)
		if (scope_hdmiin_trigger_foo == 0)
		begin
			scope_hdmiin_trigger_foo <= 32'd2475000-1'b1;
			scope_hdmiin_pre_trigger <= 1'b1;
		end else begin
			scope_hdmiin_trigger_foo <= scope_hdmiin_trigger_foo-1'b1;
			scope_hdmiin_pre_trigger <= 1'b0;
		end
	transferstb scope_hdmiin_clearctri(i_clk, i_hdmi_in_clk,
		((wb_stb)&&(scope_hdmiin_sel)&&(wb_we)&&(!wb_addr[0])),
		scope_hdmiin_clear_stb);
	initial	scope_hdmiin_count_triggered = 1'b0;
	always @(posedge i_hdmi_in_clk)
		if (scope_hdmiin_clear_stb)
			scope_hdmiin_count_triggered <= 1'b0;
		else if (scope_hdmiin_pre_trigger)
			scope_hdmiin_count_triggered <= 1'b1;
	initial	scope_hdmiin_counter = 32'hffff_ffff;
	always @(posedge i_hdmi_in_clk)
		if (!scope_hdmiin_count_triggered)
			scope_hdmiin_counter <= hdmi_scope_frame_offset_data;
		else if (scope_hdmiin_counter != 0)
			scope_hdmiin_counter <= scope_hdmiin_counter - 1'b1;
	initial	scope_hdmiin_trigger = 1'b0;
	always @(posedge i_hdmi_in_clk)
		scope_hdmiin_trigger <= (scope_hdmiin_counter == 0);
	wbscope #(.LGMEM(5'd14), .SYNCHRONOUS(0)
		) copyhdmiin(i_hdmi_in_clk, 1'b1,
			scope_hdmiin_trigger, hin_dbg_scope,
		i_clk, wb_cyc, (wb_stb)&&(scope_hdmiin_sel), wb_we, wb_addr[0],
				{ wb_data[31:20], 20'h0 },
			scope_hdmiin_stall, scope_hdmiin_ack,
			scope_hdmiin_data,
		scop_hdmiin_int);
`ifdef	HDMI_OUT_EDID_ACCESS
	// {{{
	wbi2cmaster	#(.READ_ONLY(1'b1),.MEM_ADDR_BITS(8)) the_edout(i_clk,
		wb_edout_cyc, wb_edout_stb, wb_edout_we,
			wb_edout_addr[7-1:0],
			wb_edout_data, // 32 bits wide
			wb_edout_sel,  // 32/8 bits wide
		wb_edout_stall, wb_edout_ack, wb_edout_idata,
		i_hdmi_out_scl, i_hdmi_out_sda, o_hdmi_out_scl, o_hdmi_out_sda,
		edid_out_int,
		edido_dbg);
	// }}}
`else	// HDMI_OUT_EDID_ACCESS
	// {{{
	assign	o_hdmi_out_scl = 1'b1;
	assign	o_hdmi_out_sda = 1'b1;
	// Null interrupt definitions
	// {{{
	assign	edid_out_int = 1'b0;	// edout.INT.EDID.WIRE
	// }}}
	// }}}
`endif	// HDMI_OUT_EDID_ACCESS
`ifdef	RTC_ACCESS
	// {{{
`ifdef	GPSTRK_ACCESS
	rtcgps	#(RTC_CLKSTEP) thertc(i_clk, i_reset,
		wb_rtc_cyc, wb_rtc_stb, wb_rtc_we,
			wb_rtc_addr[2-1:0],
			wb_rtc_data, // 32 bits wide
			wb_rtc_sel,  // 32/8 bits wide
		wb_rtc_stall, wb_rtc_ack, wb_rtc_idata,
		rtc_int, rtc_ppd,
		gps_tracking, ck_pps, gps_step[47:16], rtc_pps);
`else
	rtclight #(32'h2af31d) thertc(i_clk, i_reset,
		wb_cyc, (wb_stb)&&(rtc_sel), wb_we, { 1'b0, wb_addr[1:0] },
			wb_data, wb_sel,
		rtc_stall, rtc_ack, rtc_data,
		rtc_int, rtc_ppd);
`endif
	// }}}
`else	// RTC_ACCESS
	// {{{
`ifdef	GPSTRK_ACCESS
	assign	rtc_pps = 1'b0;
`endif
	assign	rtc_ppd = 1'b0;
	// Null interrupt definitions
	// {{{
	assign	rtc_int = 1'b0;	// rtc.INT.RTC.WIRE
	// }}}
	// }}}
`endif	// RTC_ACCESS
`ifdef	SDRAM_ACCESS
	// {{{
	assign	o_sdram_cyc  = rambus_sdram_cyc;
	assign	o_sdram_stb  =(rambus_sdram_stb);
	assign	o_sdram_we   = rambus_sdram_we;
	assign	o_sdram_addr = rambus_sdram_addr[25-1:0];
	assign	o_sdram_data = rambus_sdram_data;
	assign	o_sdram_sel  = rambus_sdram_sel;
	assign	rambus_sdram_ack   = i_sdram_ack;
	assign	rambus_sdram_stall = i_sdram_stall;
	assign	rambus_sdram_idata = i_sdram_data;
	// }}}
`else	// SDRAM_ACCESS
	// {{{
	// Null bus slave
	// {{{
	// In the case that there is no rambus_sdram peripheral
	// responding on the rambus bus
	assign	rambus_sdram_ack   = 1'b0;
	assign	rambus_sdram_err   = (rambus_sdram_stb);
	assign	rambus_sdram_stall = 0;
	assign	rambus_sdram_idata = 0;
	// }}}
	// }}}
`endif	// SDRAM_ACCESS
`ifdef	SPIO_ACCESS
	// {{{
	// Special purpose I/O driver (buttons, LEDs, and switches)
	assign	w_btn = { i_btnc, i_btnd, i_btnl, i_btnr, i_btnu };
	spio #(.NBTN(5), .NLEDS(8), .NSW(8)) spioi(i_clk,
		wb_spio_cyc, wb_spio_stb, wb_spio_we,
			wb_spio_data, // 32 bits wide
			wb_spio_sel,  // 32/8 bits wide
		wb_spio_stall, wb_spio_ack, wb_spio_idata,
		i_sw, w_btn, w_led, spio_int);
	assign	o_led = w_led;
	// }}}
`else	// SPIO_ACCESS
	// {{{
	assign	w_btn = 0;
	assign	o_led = 0;
	// Null interrupt definitions
	// {{{
	assign	spio_int = 1'b0;	// spio.INT.SPIO.WIRE
	// }}}
	// }}}
`endif	// SPIO_ACCESS
`ifdef	MOUSE_ACCESS
	// {{{
	wbmouse themouse(i_clk,
		wb_mous_cyc, wb_mous_stb, wb_mous_we,
			wb_mous_addr[2-1:0],
			wb_mous_data, // 32 bits wide
			wb_mous_sel,  // 32/8 bits wide
		wb_mous_stall, wb_mous_ack, wb_mous_idata,
		i_ps2, o_ps2,
		scrn_mouse, mous_interrupt);
	// }}}
`else	// MOUSE_ACCESS
	// {{{
	// If there is no mouse, declare mouse types of things to be .. absent
	assign	scrn_mouse     = 32'h00;
	assign	o_ps2          = 2'b11;
	// Null interrupt definitions
	// {{{
	assign	mous_interrupt = 1'b0;	// mous.INT.MOUSE.WIRE
	// }}}
	// }}}
`endif	// MOUSE_ACCESS
`ifdef	OLEDBW_ACCESS
	// {{{
	wboledbw #(.CBITS(4)) oledctrl(i_clk,
		wb_oled_cyc, wb_oled_stb, wb_oled_we,
			wb_oled_addr[2-1:0],
			wb_oled_data, // 32 bits wide
			wb_oled_sel,  // 32/8 bits wide
		wb_oled_stall, wb_oled_ack, wb_oled_idata,
		o_oled_sck, o_oled_mosi, o_oled_dcn,
		{ o_oled_reset_n, o_oled_panel_en, o_oled_logic_en },
		oled_int);
	// }}}
`else	// OLEDBW_ACCESS
	// {{{
	assign	o_oled_sck     = 1'b1;
	assign	o_oled_mosi    = 1'b1;
	assign	o_oled_dcn     = 1'b1;
	assign	o_oled_reset_n = 1'b0;
	assign	o_oled_panel_en= 1'b0;
	assign	o_oled_logic_en= 1'b0;
	// Null interrupt definitions
	// {{{
	assign	oled_int = 1'b0;	// oled.INT.OLED.WIRE
	// }}}
	// }}}
`endif	// OLEDBW_ACCESS
`ifdef	MICROPHONE_ACCESS
	// {{{
	wbmic #(.DEFAULT_RELOAD(@$.CLKSPERSAMPLE))
		microphone(i_clk, 1'b0,
			wb_pmic_cyc, wb_pmic_stb, wb_pmic_we,
			wb_pmic_addr[1-1:0],
			wb_pmic_data, // 32 bits wide
			wb_pmic_sel,  // 32/8 bits wide
		wb_pmic_stall, wb_pmic_ack, wb_pmic_idata,
			o_mic_csn, o_mic_sck, i_mic_din, pmic_int);
	// }}}
`else	// MICROPHONE_ACCESS
	// {{{
	assign	o_mic_csn    = 1'b1;
	assign	o_mic_sck    = 1'b1;
	// Null bus slave
	// {{{
	// In the case that there is no wb_pmic peripheral
	// responding on the wb bus
	assign	wb_pmic_ack   = 1'b0;
	assign	wb_pmic_err   = (wb_pmic_stb);
	assign	wb_pmic_stall = 0;
	assign	wb_pmic_idata = 0;
	// }}}
	// Null interrupt definitions
	// {{{
	assign	pmic_int = 1'b0;	// pmic.INT.MIC.WIRE
	// }}}
	// }}}
`endif	// MICROPHONE_ACCESS
`ifdef	SCOPC_SCOPC
	// {{{
	wbscopc #(.LGMEM(12),
		.SYNCHRONOUS(1))
	scopci(i_clk, 1'b1, @$(TRIGGER), @$(DEBUG),
		i_clk, wb_scopc_cyc, wb_scopc_stb, wb_scopc_we,
			wb_scopc_addr[1-1:0],
			wb_scopc_data, // 32 bits wide
			wb_scopc_sel,  // 32/8 bits wide
		wb_scopc_stall, wb_scopc_ack, wb_scopc_idata,
		scopc_int);
	// }}}
`else	// SCOPC_SCOPC
	// {{{
	assign	scopc_int = 0;
	// Null bus slave
	// {{{
	// In the case that there is no wb_scopc peripheral
	// responding on the wb bus
	assign	wb_scopc_ack   = 1'b0;
	assign	wb_scopc_err   = (wb_scopc_stb);
	assign	wb_scopc_stall = 0;
	assign	wb_scopc_idata = 0;
	// }}}
	// }}}
`endif	// SCOPC_SCOPC
`ifdef	SCOPE_SCOPE
	// {{{
	wbscope #(.LGMEM(12),
		.SYNCHRONOUS(1))
	scopei(i_clk, 1'b1, @$(TRIGGER), @$(DEBUG),
		i_clk, wb_scope_cyc, wb_scope_stb, wb_scope_we,
			wb_scope_addr[1-1:0],
			wb_scope_data, // 32 bits wide
			wb_scope_sel,  // 32/8 bits wide
		wb_scope_stall, wb_scope_ack, wb_scope_idata,
		scope_int);
	// }}}
`else	// SCOPE_SCOPE
	// {{{
	assign	scope_int = 0;
	// Null bus slave
	// {{{
	// In the case that there is no wb_scope peripheral
	// responding on the wb bus
	assign	wb_scope_ack   = 1'b0;
	assign	wb_scope_err   = (wb_scope_stb);
	assign	wb_scope_stall = 0;
	assign	wb_scope_idata = 0;
	// }}}
	// }}}
`endif	// SCOPE_SCOPE
`ifdef	WBUBUS_MASTER
	// {{{
	// The Host USB interface, to be used by the WB-UART bus
	rxuartlite	#(BUSUART) rcv(s_clk, i_host_uart_rx,
				rx_host_stb, rx_host_data);
	txuartlite	#(BUSUART) txv(s_clk, tx_host_stb, tx_host_data,
				o_host_uart_tx, tx_host_busy);
`ifdef	INCLUDE_ZIPCPU
	// assign	wbu_zip_sel   = wbu_addr[1];
`else
	assign	wbu_zip_sel   = 1'b0;
	assign	zip_dbg_ack   = 1'b0;
	assign	zip_dbg_stall = 1'b0;
	assign	zip_dbg_data  = 0;
`endif
`ifndef	BUSPIC_ACCESS
	wire	w_bus_int;
	assign	w_bus_int = 1'b0;
`endif
	wire	[31:0]	wbu_tmp_addr;
	wbubus	genbus(i_clk, i_host_rx_stb, i_host_rx_data,
			wbu_wbu_cyc, wbu_wbu_stb, wbu_wbu_we, wbu_tmp_addr, wbu_wbu_data,
			wbu_wbu_stall, wbu_wbu_ack, wbu_wbu_idata, wbu_wbu_err,
			w_bus_int,
			o_host_tx_stb, o_host_tx_data, i_host_tx_busy,
			wbubus_dbg[0]);
	assign	wbu_sel = 4'hf;
	assign	wbu_addr = wbu_tmp_addr[(2-1):0];
	// }}}
`else	// WBUBUS_MASTER
	// {{{
	// Null bus master
	// {{{
	// }}}
	// }}}
`endif	// WBUBUS_MASTER
	busexpander #(.AWIN(27), .DWIN(32),
			.DWOUT(128))
		xpandi32x128(
			i_clk, i_reset,
			wb_xpand_cyc, wb_xpand_stb, wb_xpand_we,
			wb_xpand_addr[27-1:0],
			wb_xpand_data, // 32 bits wide
			wb_xpand_sel,  // 32/8 bits wide
		wb_xpand_stall, wb_xpand_ack, wb_xpand_idata, wb_xpand_err,
			rambus_xpand_cyc, rambus_xpand_stb, rambus_xpand_we,
			rambus_xpand_addr[25-1:0],
			rambus_xpand_data, // 128 bits wide
			rambus_xpand_sel,  // 128/8 bits wide
		rambus_xpand_stall, rambus_xpand_ack, rambus_xpand_idata,rambus_xpand_err);
`ifdef	HDMI_IN_EDID_ACCESS
	// {{{
	wbi2cslave	#( .INITIAL_MEM("edid.hex"),
		.I2C_READ_ONLY(1'b1),
		.MEM_ADDR_BITS(8))
	    the_input_edid(i_clk, 1'b0,
		wb_edin_cyc, wb_edin_stb, wb_edin_we,
			wb_edin_addr[6-1:0],
			wb_edin_data, // 32 bits wide
			wb_edin_sel,  // 32/8 bits wide
		wb_edin_stall, wb_edin_ack, wb_edin_idata,
		i_hdmi_in_scl, i_hdmi_in_sda, o_hdmi_in_scl, o_hdmi_in_sda,
		edid_dbg);
	// }}}
`else	// HDMI_IN_EDID_ACCESS
	// {{{
	assign	o_hdmi_in_scl = 1'b1;
	assign	o_hdmi_in_sda = 1'b1;
	// }}}
`endif	// HDMI_IN_EDID_ACCESS
	// }}}
endmodule