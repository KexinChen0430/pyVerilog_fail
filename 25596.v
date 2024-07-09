module top ;
          wire  Net_2666;
          wire  Net_2665;
          wire  Net_2664;
          wire  Net_2663;
    electrical  Net_2662;
          wire  Net_2551;
    electrical  Net_2493;
    electrical  Net_3222;
    electrical  Net_3338;
    electrical  Net_3701;
    electrical  Net_3702;
    cy_annotation_universal_v1_0 GND_1 (
        .connect({
            Net_2493
        })
    );
    defparam GND_1.comp_name = "Gnd_v1_0";
    defparam GND_1.port_names = "T1";
    defparam GND_1.width = 1;
    BLE_v2_0_0 BLE (
        .clk(Net_2551));
	wire [0:0] tmpOE__Adc_IN_net;
	wire [0:0] tmpFB_0__Adc_IN_net;
	wire [0:0] tmpIO_0__Adc_IN_net;
	wire [0:0] tmpINTERRUPT_0__Adc_IN_net;
	electrical [0:0] tmpSIOVREF__Adc_IN_net;
	cy_psoc3_pins_v1_10
		#(.id("77715107-f8d5-47e5-a629-0fb83101ac6b"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
		  .init_dr_st(1'b1),
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
		  .output_conn(1'b0),
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
		  .pin_mode("A"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		Adc_IN
		 (.oe(tmpOE__Adc_IN_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Adc_IN_net[0:0]}),
		  .analog({Net_3222}),
		  .io({tmpIO_0__Adc_IN_net[0:0]}),
		  .siovref(tmpSIOVREF__Adc_IN_net),
		  .interrupt({tmpINTERRUPT_0__Adc_IN_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Adc_IN_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__Sensor_Power_net;
	wire [0:0] tmpFB_0__Sensor_Power_net;
	wire [0:0] tmpIO_0__Sensor_Power_net;
	wire [0:0] tmpINTERRUPT_0__Sensor_Power_net;
	electrical [0:0] tmpSIOVREF__Sensor_Power_net;
	cy_psoc3_pins_v1_10
		#(.id("df0a1340-6685-423f-80b5-67d3a4260d3d"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
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
		  .output_conn(1'b0),
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
		Sensor_Power
		 (.oe(tmpOE__Sensor_Power_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Sensor_Power_net[0:0]}),
		  .io({tmpIO_0__Sensor_Power_net[0:0]}),
		  .siovref(tmpSIOVREF__Sensor_Power_net),
		  .interrupt({tmpINTERRUPT_0__Sensor_Power_net[0:0]}),
		  .annotation({Net_3338}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Sensor_Power_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    ADC_SAR_SEQ_P4_v2_10_1 ADC (
        .Vref(Net_2662),
        .sdone(Net_2663),
        .eoc(Net_2664),
        .aclk(1'b0),
        .vinPlus0(Net_3222),
        .soc(1'b0));
    cy_annotation_universal_v1_0 L_1 (
        .connect({
            Net_2493,
            Net_3701
        })
    );
    defparam L_1.comp_name = "Inductor_v1_0";
    defparam L_1.port_names = "T1, T2";
    defparam L_1.width = 2;
    cy_annotation_universal_v1_0 C_1 (
        .connect({
            Net_3701,
            Net_3702
        })
    );
    defparam C_1.comp_name = "Capacitor_v1_0";
    defparam C_1.port_names = "T1, T2";
    defparam C_1.width = 2;
	wire [0:0] tmpOE__STATUS_net;
	wire [0:0] tmpFB_0__STATUS_net;
	wire [0:0] tmpIO_0__STATUS_net;
	wire [0:0] tmpINTERRUPT_0__STATUS_net;
	electrical [0:0] tmpSIOVREF__STATUS_net;
	cy_psoc3_pins_v1_10
		#(.id("e851a3b9-efb8-48be-bbb8-b303b216c393"),
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
		  .output_conn(1'b0),
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
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		STATUS
		 (.oe(tmpOE__STATUS_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__STATUS_net[0:0]}),
		  .io({tmpIO_0__STATUS_net[0:0]}),
		  .siovref(tmpSIOVREF__STATUS_net),
		  .interrupt({tmpINTERRUPT_0__STATUS_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__STATUS_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
endmodule