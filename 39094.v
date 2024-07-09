module top ;
          wire  Net_331;
          wire  Net_330;
          wire  Net_328;
          wire  Net_327;
          wire  Net_326;
          wire  Net_325;
          wire  Net_324;
          wire  Net_323;
          wire  Net_322;
          wire  Net_335;
          wire  Net_321;
    electrical  Net_64;
          wire  Net_40;
          wire  Net_320;
          wire  Net_24;
    electrical  Net_13;
          wire  Net_176;
    electrical  Net_16;
	cy_clock_v1_0
		#(.id("72cc5018-8e81-40d3-84d5-4c4e602ea5c4"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("1000000000000"),
		  .is_direct(0),
		  .is_digital(1))
		Clock
		 (.clock_out(Net_24));
	wire [0:0] tmpOE__Pin_BlueLED_net;
	wire [0:0] tmpFB_0__Pin_BlueLED_net;
	wire [0:0] tmpIO_0__Pin_BlueLED_net;
	wire [0:0] tmpINTERRUPT_0__Pin_BlueLED_net;
	electrical [0:0] tmpSIOVREF__Pin_BlueLED_net;
	cy_psoc3_pins_v1_10
		#(.id("52f31aa9-2f0a-497d-9a1f-1424095e13e6"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b0),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b1),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("O"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b1),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		Pin_BlueLED
		 (.oe(tmpOE__Pin_BlueLED_net),
		  .y({Net_176}),
		  .fb({tmpFB_0__Pin_BlueLED_net[0:0]}),
		  .io({tmpIO_0__Pin_BlueLED_net[0:0]}),
		  .siovref(tmpSIOVREF__Pin_BlueLED_net),
		  .interrupt({tmpINTERRUPT_0__Pin_BlueLED_net[0:0]}),
		  .annotation({Net_13}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Pin_BlueLED_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    cy_annotation_universal_v1_0 LED_Blue (
        .connect({
            Net_64,
            Net_13
        })
    );
    defparam LED_Blue.comp_name = "LED_v1_0";
    defparam LED_Blue.port_names = "A, K";
    defparam LED_Blue.width = 2;
    cy_annotation_universal_v1_0 Resistor_Blue (
        .connect({
            Net_16,
            Net_64
        })
    );
    defparam Resistor_Blue.comp_name = "Resistor_v1_0";
    defparam Resistor_Blue.port_names = "T1, T2";
    defparam Resistor_Blue.width = 2;
    cy_annotation_universal_v1_0 P4_VDD (
        .connect({
            Net_16
        })
    );
    defparam P4_VDD.comp_name = "Power_v1_0";
    defparam P4_VDD.port_names = "T1";
    defparam P4_VDD.width = 1;
    PWM_v3_30_0 PWM (
        .reset(Net_320),
        .clock(Net_24),
        .tc(Net_321),
        .pwm1(Net_335),
        .pwm2(Net_322),
        .interrupt(Net_323),
        .capture(1'b0),
        .kill(1'b1),
        .enable(1'b1),
        .trigger(1'b0),
        .cmp_sel(1'b0),
        .pwm(Net_176),
        .ph1(Net_330),
        .ph2(Net_331));
    defparam PWM.Resolution = 8;
    assign Net_320 = 1'h0;
endmodule