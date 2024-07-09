module top ;
          wire  Net_41;
          wire  Net_40;
          wire  Net_39;
          wire  Net_38;
          wire  Net_37;
          wire  Net_36;
          wire  Net_35;
          wire  Net_34;
          wire  Net_33;
          wire  Net_32;
          wire  Net_31;
          wire  Net_30;
          wire  Net_29;
          wire  Net_28;
          wire  Net_27;
          wire  Net_26;
          wire  Net_25;
          wire  Net_24;
          wire  Net_23;
          wire  Net_22;
          wire  Net_21;
          wire  Net_20;
          wire  Net_19;
          wire  Net_18;
          wire  Net_17;
          wire  Net_16;
          wire  Net_15;
          wire  Net_14;
          wire  Net_13;
          wire  Net_12;
          wire  Net_11;
          wire  Net_10;
          wire  Net_9;
          wire  Net_8;
          wire  Net_7;
          wire  Net_6;
          wire  Net_5;
          wire  Net_4;
          wire  Net_3;
          wire  Net_2;
          wire  Net_1;
          wire  Net_331;
          wire  Net_337;
          wire  Net_129;
          wire  Net_117;
          wire  Net_68;
          wire  Net_74;
          wire  Net_72;
          wire  Net_121;
          wire  Net_133;
          wire  Net_108;
          wire  Net_95;
    CharLCD_v2_0_0 LCD_Char_1 ();
    TCPWM_P4_v1_10_1 PWM_1 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_68),
        .ov(Net_6),
        .un(Net_7),
        .cc(Net_8),
        .line(Net_72),
        .line_n(Net_9),
        .clock(Net_74));
    defparam PWM_1.PWMCountMode = 3;
    defparam PWM_1.PWMReloadMode = 0;
    defparam PWM_1.PWMReloadPresent = 0;
    defparam PWM_1.PWMStartMode = 0;
    defparam PWM_1.PWMStopMode = 0;
    defparam PWM_1.PWMSwitchMode = 0;
    defparam PWM_1.QuadIndexMode = 0;
    defparam PWM_1.QuadPhiAMode = 3;
    defparam PWM_1.QuadPhiBMode = 3;
    defparam PWM_1.QuadStopMode = 0;
    defparam PWM_1.TCCaptureMode = 0;
    defparam PWM_1.TCCountMode = 3;
    defparam PWM_1.TCReloadMode = 0;
    defparam PWM_1.TCStartMode = 0;
    defparam PWM_1.TCStopMode = 0;
    TCPWM_P4_v1_10_2 PWM_2 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_117),
        .ov(Net_15),
        .un(Net_16),
        .cc(Net_17),
        .line(Net_121),
        .line_n(Net_18),
        .clock(Net_95));
    defparam PWM_2.PWMCountMode = 3;
    defparam PWM_2.PWMReloadMode = 0;
    defparam PWM_2.PWMReloadPresent = 0;
    defparam PWM_2.PWMStartMode = 0;
    defparam PWM_2.PWMStopMode = 0;
    defparam PWM_2.PWMSwitchMode = 0;
    defparam PWM_2.QuadIndexMode = 0;
    defparam PWM_2.QuadPhiAMode = 3;
    defparam PWM_2.QuadPhiBMode = 3;
    defparam PWM_2.QuadStopMode = 0;
    defparam PWM_2.TCCaptureMode = 0;
    defparam PWM_2.TCCountMode = 3;
    defparam PWM_2.TCReloadMode = 0;
    defparam PWM_2.TCStartMode = 0;
    defparam PWM_2.TCStopMode = 0;
	cy_clock_v1_0
		#(.id("2372d904-f599-4e94-a937-cbf30710aca1"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_2
		 (.clock_out(Net_95));
    TCPWM_P4_v1_10_3 PWM_3 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_129),
        .ov(Net_25),
        .un(Net_26),
        .cc(Net_27),
        .line(Net_133),
        .line_n(Net_28),
        .clock(Net_108));
    defparam PWM_3.PWMCountMode = 3;
    defparam PWM_3.PWMReloadMode = 0;
    defparam PWM_3.PWMReloadPresent = 0;
    defparam PWM_3.PWMStartMode = 0;
    defparam PWM_3.PWMStopMode = 0;
    defparam PWM_3.PWMSwitchMode = 0;
    defparam PWM_3.QuadIndexMode = 0;
    defparam PWM_3.QuadPhiAMode = 3;
    defparam PWM_3.QuadPhiBMode = 3;
    defparam PWM_3.QuadStopMode = 0;
    defparam PWM_3.TCCaptureMode = 0;
    defparam PWM_3.TCCountMode = 3;
    defparam PWM_3.TCReloadMode = 0;
    defparam PWM_3.TCStartMode = 0;
    defparam PWM_3.TCStopMode = 0;
	cy_clock_v1_0
		#(.id("30443c36-6964-4ee1-9efe-af42ce2dde68"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_3
		 (.clock_out(Net_108));
	wire [0:0] tmpOE__PWM1_net;
	wire [0:0] tmpFB_0__PWM1_net;
	wire [0:0] tmpIO_0__PWM1_net;
	wire [0:0] tmpINTERRUPT_0__PWM1_net;
	electrical [0:0] tmpSIOVREF__PWM1_net;
	cy_psoc3_pins_v1_10
		#(.id("e219e390-1ce5-49ce-ad3e-702089585d25"),
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
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM1
		 (.oe(tmpOE__PWM1_net),
		  .y({Net_72}),
		  .fb({tmpFB_0__PWM1_net[0:0]}),
		  .io({tmpIO_0__PWM1_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM1_net),
		  .interrupt({tmpINTERRUPT_0__PWM1_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__PWM1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__PWM2_net;
	wire [0:0] tmpFB_0__PWM2_net;
	wire [0:0] tmpIO_0__PWM2_net;
	wire [0:0] tmpINTERRUPT_0__PWM2_net;
	electrical [0:0] tmpSIOVREF__PWM2_net;
	cy_psoc3_pins_v1_10
		#(.id("fdc5f587-2927-4fc4-acc0-945b16c97a74"),
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
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM2
		 (.oe(tmpOE__PWM2_net),
		  .y({Net_121}),
		  .fb({tmpFB_0__PWM2_net[0:0]}),
		  .io({tmpIO_0__PWM2_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM2_net),
		  .interrupt({tmpINTERRUPT_0__PWM2_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__PWM2_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__PWM3_net;
	wire [0:0] tmpFB_0__PWM3_net;
	wire [0:0] tmpIO_0__PWM3_net;
	wire [0:0] tmpINTERRUPT_0__PWM3_net;
	electrical [0:0] tmpSIOVREF__PWM3_net;
	cy_psoc3_pins_v1_10
		#(.id("c4749d34-f08a-4d33-bb22-fa567c5a7292"),
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
		  .sio_group_cnt(0),
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		PWM3
		 (.oe(tmpOE__PWM3_net),
		  .y({Net_133}),
		  .fb({tmpFB_0__PWM3_net[0:0]}),
		  .io({tmpIO_0__PWM3_net[0:0]}),
		  .siovref(tmpSIOVREF__PWM3_net),
		  .interrupt({tmpINTERRUPT_0__PWM3_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__PWM3_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		TC1_ISR
		 (.int_signal(Net_68));
	cy_isr_v1_0
		#(.int_type(2'b10))
		TC2_ISR
		 (.int_signal(Net_117));
	cy_isr_v1_0
		#(.int_type(2'b10))
		TC3_ISR
		 (.int_signal(Net_129));
    TCPWM_P4_v1_10_4 TIM_4 (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_331),
        .ov(Net_35),
        .un(Net_36),
        .cc(Net_37),
        .line(Net_38),
        .line_n(Net_39),
        .clock(Net_337));
    defparam TIM_4.PWMCountMode = 3;
    defparam TIM_4.PWMReloadMode = 0;
    defparam TIM_4.PWMReloadPresent = 0;
    defparam TIM_4.PWMStartMode = 0;
    defparam TIM_4.PWMStopMode = 0;
    defparam TIM_4.PWMSwitchMode = 0;
    defparam TIM_4.QuadIndexMode = 0;
    defparam TIM_4.QuadPhiAMode = 3;
    defparam TIM_4.QuadPhiBMode = 3;
    defparam TIM_4.QuadStopMode = 0;
    defparam TIM_4.TCCaptureMode = 0;
    defparam TIM_4.TCCountMode = 3;
    defparam TIM_4.TCReloadMode = 0;
    defparam TIM_4.TCStartMode = 0;
    defparam TIM_4.TCStopMode = 0;
	cy_clock_v1_0
		#(.id("72f73c91-d285-4113-8eaf-6cc5d31dcc2a"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("100000000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_4
		 (.clock_out(Net_337));
	cy_isr_v1_0
		#(.int_type(2'b10))
		TC4_ISR
		 (.int_signal(Net_331));
	cy_clock_v1_0
		#(.id("782d7a58-9327-432e-9d9e-efa2d29fdf99"),
		  .source_clock_id("413DE2EF-D9F2-4233-A808-DFAF137FD877"),
		  .divisor(0),
		  .period("100000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_1
		 (.clock_out(Net_74));
endmodule