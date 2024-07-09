module top ;
          wire  Net_67;
          wire  Net_66;
          wire  Net_65;
          wire  Net_14;
    electrical  Net_36;
    electrical  Net_45;
    electrical  Net_13;
    electrical  Net_43;
    electrical  Net_27;
    electrical  Net_26;
    electrical  Net_32;
    electrical  Net_39;
    electrical  Net_42;
    Comp_P4_v1_0_0 Comp (
        .Vplus(Net_13),
        .CmpOut(Net_14),
        .Vminus(Net_45));
    cy_annotation_universal_v1_0 LED_1 (
        .connect({
            Net_32,
            Net_26
        })
    );
    defparam LED_1.comp_name = "LED_v1_0";
    defparam LED_1.port_names = "A, K";
    defparam LED_1.width = 2;
    cy_annotation_universal_v1_0 R1 (
        .connect({
            Net_27,
            Net_26
        })
    );
    defparam R1.comp_name = "Resistor_v1_0";
    defparam R1.port_names = "T1, T2";
    defparam R1.width = 2;
    cy_annotation_universal_v1_0 GND_1 (
        .connect({
            Net_27
        })
    );
    defparam GND_1.comp_name = "Gnd_v1_0";
    defparam GND_1.port_names = "T1";
    defparam GND_1.width = 1;
	wire [0:0] tmpOE__LED_net;
	wire [0:0] tmpFB_0__LED_net;
	wire [0:0] tmpIO_0__LED_net;
	wire [0:0] tmpINTERRUPT_0__LED_net;
	electrical [0:0] tmpSIOVREF__LED_net;
	cy_psoc3_pins_v1_10
		#(.id("52f31aa9-2f0a-497d-9a1f-1424095e13e6"),
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
		  .use_annotation(1'b0),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .vtrip(2'b10),
		  .width(1))
		LED
		 (.oe(tmpOE__LED_net),
		  .y({Net_14}),
		  .fb({tmpFB_0__LED_net[0:0]}),
		  .io({tmpIO_0__LED_net[0:0]}),
		  .siovref(tmpSIOVREF__LED_net),
		  .interrupt({tmpINTERRUPT_0__LED_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__LED_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    cy_annotation_universal_v1_0 VR1 (
        .connect({
            Net_42,
            Net_43,
            Net_36
        })
    );
    defparam VR1.comp_name = "Potentiometer_v1_0";
    defparam VR1.port_names = "T1, T2, W";
    defparam VR1.width = 3;
    cy_annotation_universal_v1_0 VR2 (
        .connect({
            Net_42,
            Net_43,
            Net_39
        })
    );
    defparam VR2.comp_name = "Potentiometer_v1_0";
    defparam VR2.port_names = "T1, T2, W";
    defparam VR2.width = 3;
	wire [0:0] tmpOE__V1_net;
	wire [0:0] tmpFB_0__V1_net;
	wire [0:0] tmpIO_0__V1_net;
	wire [0:0] tmpINTERRUPT_0__V1_net;
	electrical [0:0] tmpSIOVREF__V1_net;
	cy_psoc3_pins_v1_10
		#(.id("05a9c8de-3ba2-4909-8250-95fdc61c0bf4"),
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
		  .use_annotation(1'b0),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .vtrip(2'b10),
		  .width(1))
		V1
		 (.oe(tmpOE__V1_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__V1_net[0:0]}),
		  .analog({Net_13}),
		  .io({tmpIO_0__V1_net[0:0]}),
		  .siovref(tmpSIOVREF__V1_net),
		  .interrupt({tmpINTERRUPT_0__V1_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__V1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__V2_net;
	wire [0:0] tmpFB_0__V2_net;
	wire [0:0] tmpIO_0__V2_net;
	wire [0:0] tmpINTERRUPT_0__V2_net;
	electrical [0:0] tmpSIOVREF__V2_net;
	cy_psoc3_pins_v1_10
		#(.id("270dcf4b-3db6-4837-9ed4-a19952ec4eff"),
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
		  .use_annotation(1'b0),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .vtrip(2'b10),
		  .width(1))
		V2
		 (.oe(tmpOE__V2_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__V2_net[0:0]}),
		  .analog({Net_45}),
		  .io({tmpIO_0__V2_net[0:0]}),
		  .siovref(tmpSIOVREF__V2_net),
		  .interrupt({tmpINTERRUPT_0__V2_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__V2_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    cy_annotation_universal_v1_0 PWR (
        .connect({
            Net_42
        })
    );
    defparam PWR.comp_name = "Power_v1_0";
    defparam PWR.port_names = "T1";
    defparam PWR.width = 1;
    cy_annotation_universal_v1_0 GND_2 (
        .connect({
            Net_43
        })
    );
    defparam GND_2.comp_name = "Gnd_v1_0";
    defparam GND_2.port_names = "T1";
    defparam GND_2.width = 1;
    CharLCD_v1_90_1 LCD ();
    SCB_P4_v1_10_2 UART (
        .sclk(Net_65),
        .interrupt(Net_66),
        .clock(1'b0));
endmodule