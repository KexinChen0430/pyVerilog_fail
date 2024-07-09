module top ;
          wire  Net_3181;
    electrical  Net_3175;
          wire  Net_3180;
          wire  Net_3179;
    electrical  Net_3172;
    electrical  Net_3173;
    electrical  Net_3174;
    electrical  Net_3701;
    electrical  Net_3702;
    electrical  Net_2323;
    electrical  Net_290;
          wire  Net_3182;
          wire  Net_3183;
          wire  Net_3176;
          wire  Net_3177;
          wire  Net_3184;
          wire  Net_3185;
          wire  Net_3186;
          wire  Net_3187;
          wire  Net_3188;
          wire  Net_3189;
          wire  Net_3190;
          wire  Net_3191;
          wire  Net_3192;
          wire  Net_3193;
          wire  Net_3194;
          wire  Net_3195;
          wire  Net_3196;
          wire  Net_3197;
    electrical  Net_3171;
    cy_annotation_universal_v1_0 C_1 (
        .connect({
            Net_3701,
            Net_3702
        })
    );
    defparam C_1.comp_name = "Capacitor_v1_0";
    defparam C_1.port_names = "T1, T2";
    defparam C_1.width = 2;
    cy_annotation_universal_v1_0 GND_1 (
        .connect({
            Net_3172
        })
    );
    defparam GND_1.comp_name = "Gnd_v1_0";
    defparam GND_1.port_names = "T1";
    defparam GND_1.width = 1;
    BLE_v3_10_0 BLE (
        .clk(Net_3179),
        .pa_en(Net_3180));
    cy_annotation_universal_v1_0 PWR_2 (
        .connect({
            Net_3173
        })
    );
    defparam PWR_2.comp_name = "Power_v1_0";
    defparam PWR_2.port_names = "T1";
    defparam PWR_2.width = 1;
    cy_annotation_universal_v1_0 R_3 (
        .connect({
            Net_3174,
            Net_3175
        })
    );
    defparam R_3.comp_name = "Resistor_v1_0";
    defparam R_3.port_names = "T1, T2";
    defparam R_3.width = 2;
	wire [0:0] tmpOE__Conn_LED_net;
	wire [0:0] tmpFB_0__Conn_LED_net;
	wire [0:0] tmpIO_0__Conn_LED_net;
	wire [0:0] tmpINTERRUPT_0__Conn_LED_net;
	electrical [0:0] tmpSIOVREF__Conn_LED_net;
	cy_psoc3_pins_v1_10
		#(.id("8af192ab-4b9a-4fb3-b8ab-550f42242b6c"),
		  .drive_mode(3'b100),
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
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b1),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		Conn_LED
		 (.oe(tmpOE__Conn_LED_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Conn_LED_net[0:0]}),
		  .io({tmpIO_0__Conn_LED_net[0:0]}),
		  .siovref(tmpSIOVREF__Conn_LED_net),
		  .interrupt({tmpINTERRUPT_0__Conn_LED_net[0:0]}),
		  .annotation({Net_3175}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Conn_LED_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    SCB_P4_v3_20_1 UART (
        .cts_in(1'b0),
        .tx_out(Net_3182),
        .rts_out(Net_3183),
        .interrupt(Net_3176),
        .clock(1'b0),
        .rx_tr_out(Net_3184),
        .tx_tr_out(Net_3185),
        .s_mosi(1'b0),
        .s_sclk(1'b0),
        .s_ss(1'b0),
        .m_miso(1'b0),
        .m_mosi(Net_3190),
        .m_sclk(Net_3191),
        .m_ss0(Net_3192),
        .m_ss1(Net_3193),
        .m_ss2(Net_3194),
        .m_ss3(Net_3195),
        .s_miso(Net_3196),
        .rx_in(1'b0));
    cy_annotation_universal_v1_0 LED1_2 (
        .connect({
            Net_3173,
            Net_3174
        })
    );
    defparam LED1_2.comp_name = "LED_v1_0";
    defparam LED1_2.port_names = "A, K";
    defparam LED1_2.width = 2;
    cy_annotation_universal_v1_0 L_1 (
        .connect({
            Net_3172,
            Net_3701
        })
    );
    defparam L_1.comp_name = "Inductor_v1_0";
    defparam L_1.port_names = "T1, T2";
    defparam L_1.width = 2;
    cy_annotation_universal_v1_0 R_2 (
        .connect({
            Net_290,
            Net_3171
        })
    );
    defparam R_2.comp_name = "Resistor_v1_0";
    defparam R_2.port_names = "T1, T2";
    defparam R_2.width = 2;
    cy_annotation_universal_v1_0 PWR (
        .connect({
            Net_2323
        })
    );
    defparam PWR.comp_name = "Power_v1_0";
    defparam PWR.port_names = "T1";
    defparam PWR.width = 1;
    cy_annotation_universal_v1_0 LED1 (
        .connect({
            Net_2323,
            Net_290
        })
    );
    defparam LED1.comp_name = "LED_v1_0";
    defparam LED1.port_names = "A, K";
    defparam LED1.width = 2;
endmodule