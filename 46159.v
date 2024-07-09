module top ;
          wire  Net_508;
          wire  Net_507;
          wire  Net_483;
          wire  Net_482;
          wire  Net_481;
          wire  Net_480;
          wire  Net_479;
          wire  Net_478;
          wire  Net_476;
          wire  Net_475;
          wire  Net_474;
          wire  Net_421;
          wire  Net_420;
          wire  Net_419;
          wire  Net_418;
          wire  Net_417;
          wire  Net_416;
          wire  Net_415;
          wire  Net_414;
          wire  Net_413;
          wire  Net_412;
          wire  Net_437;
          wire  Net_436;
          wire  Net_435;
          wire  Net_434;
          wire  Net_132;
          wire  Net_495;
          wire  Net_494;
          wire  Net_493;
          wire  Net_492;
          wire  Net_491;
          wire  Net_490;
          wire  Net_489;
          wire  Net_488;
          wire  Net_487;
          wire  Net_486;
          wire  Net_80;
          wire  Net_79;
          wire  Net_78;
          wire  Net_77;
          wire  Net_76;
          wire  Net_75;
          wire  Net_74;
          wire  Net_73;
          wire  Net_72;
          wire  Net_71;
          wire  Net_60;
          wire  Net_6;
          wire  Net_452;
          wire  Net_451;
          wire  Net_206;
          wire  Net_438;
          wire [1:0] Net_375;
          wire  Net_5;
          wire  Net_49;
    SCB_P4_v2_0_0 UART_1 (
        .interrupt(Net_5),
        .clock(1'b0));
	cy_clock_v1_0
		#(.id("ef4be275-46b7-4d2d-b819-a835891dd7e8"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("1000000000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_1
		 (.clock_out(Net_206));
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr
		 (.int_signal(Net_49));
    TCPWM_P4_v2_0_1 Timer (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_49),
        .ov(Net_76),
        .un(Net_77),
        .cc(Net_78),
        .line(Net_79),
        .line_n(Net_80),
        .clock(Net_206));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ISRUART
		 (.int_signal(Net_5));
    TCPWM_P4_v2_0_2 SignalGenerator (
        .stop(1'b0),
        .reload(1'b0),
        .start(1'b0),
        .count(1'b1),
        .capture(1'b0),
        .interrupt(Net_451),
        .ov(Net_491),
        .un(Net_492),
        .cc(Net_493),
        .line(Net_494),
        .line_n(Net_495),
        .clock(Net_452));
	cy_clock_v1_0
		#(.id("77085c73-d3db-49de-a1ad-2dc98b341901"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("1000000000"),
		  .is_direct(0),
		  .is_digital(0))
		Clock_2
		 (.clock_out(Net_452));
	wire [0:0] tmpOE__L_Servo_net;
	wire [0:0] tmpFB_0__L_Servo_net;
	wire [0:0] tmpIO_0__L_Servo_net;
	wire [0:0] tmpINTERRUPT_0__L_Servo_net;
	electrical [0:0] tmpSIOVREF__L_Servo_net;
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
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		L_Servo
		 (.oe(tmpOE__L_Servo_net),
		  .y({Net_434}),
		  .fb({tmpFB_0__L_Servo_net[0:0]}),
		  .io({tmpIO_0__L_Servo_net[0:0]}),
		  .siovref(tmpSIOVREF__L_Servo_net),
		  .interrupt({tmpINTERRUPT_0__L_Servo_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__L_Servo_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    if (1)
    begin : demux_1
        reg  tmp__demux_1_0_reg;
        reg  tmp__demux_1_1_reg;
        reg  tmp__demux_1_2_reg;
        reg  tmp__demux_1_3_reg;
        always @(Net_438 or Net_375)
        begin
            case (Net_375[1:0])
                2'b00:
                begin
                    tmp__demux_1_0_reg = Net_438;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b01:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = Net_438;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b10:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = Net_438;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b11:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = Net_438;
                end
            endcase
        end
        assign Net_434 = tmp__demux_1_0_reg;
        assign Net_435 = tmp__demux_1_1_reg;
        assign Net_436 = tmp__demux_1_2_reg;
        assign Net_437 = tmp__demux_1_3_reg;
    end
	wire [0:0] tmpOE__R_Servo_net;
	wire [0:0] tmpFB_0__R_Servo_net;
	wire [0:0] tmpIO_0__R_Servo_net;
	wire [0:0] tmpINTERRUPT_0__R_Servo_net;
	electrical [0:0] tmpSIOVREF__R_Servo_net;
	cy_psoc3_pins_v1_10
		#(.id("b2308480-dcd7-4ee5-bbdc-18916ee367be"),
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
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		R_Servo
		 (.oe(tmpOE__R_Servo_net),
		  .y({Net_435}),
		  .fb({tmpFB_0__R_Servo_net[0:0]}),
		  .io({tmpIO_0__R_Servo_net[0:0]}),
		  .siovref(tmpSIOVREF__R_Servo_net),
		  .interrupt({tmpINTERRUPT_0__R_Servo_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__R_Servo_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		Servo_isr
		 (.int_signal(Net_451));
	wire [0:0] tmpOE__GimbalP_net;
	wire [0:0] tmpFB_0__GimbalP_net;
	wire [0:0] tmpIO_0__GimbalP_net;
	wire [0:0] tmpINTERRUPT_0__GimbalP_net;
	electrical [0:0] tmpSIOVREF__GimbalP_net;
	cy_psoc3_pins_v1_10
		#(.id("8c1b8be6-e5e7-4bce-905a-4cfa28d02e70"),
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
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		GimbalP
		 (.oe(tmpOE__GimbalP_net),
		  .y({Net_436}),
		  .fb({tmpFB_0__GimbalP_net[0:0]}),
		  .io({tmpIO_0__GimbalP_net[0:0]}),
		  .siovref(tmpSIOVREF__GimbalP_net),
		  .interrupt({tmpINTERRUPT_0__GimbalP_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__GimbalP_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__GimbalT_net;
	wire [0:0] tmpFB_0__GimbalT_net;
	wire [0:0] tmpIO_0__GimbalT_net;
	wire [0:0] tmpINTERRUPT_0__GimbalT_net;
	electrical [0:0] tmpSIOVREF__GimbalT_net;
	cy_psoc3_pins_v1_10
		#(.id("c2106cdb-687e-44ec-9e29-5bc0f817d259"),
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
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		GimbalT
		 (.oe(tmpOE__GimbalT_net),
		  .y({Net_437}),
		  .fb({tmpFB_0__GimbalT_net[0:0]}),
		  .io({tmpIO_0__GimbalT_net[0:0]}),
		  .siovref(tmpSIOVREF__GimbalT_net),
		  .interrupt({tmpINTERRUPT_0__GimbalT_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__GimbalT_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    CyControlReg_v1_70 SignalSel (
        .control_1(Net_412),
        .control_2(Net_413),
        .control_3(Net_414),
        .control_0(Net_415),
        .control_4(Net_416),
        .control_5(Net_417),
        .control_6(Net_418),
        .control_7(Net_419),
        .clock(1'b0),
        .reset(1'b0),
        .control_bus(Net_375[1:0]));
    defparam SignalSel.Bit0Mode = 0;
    defparam SignalSel.Bit1Mode = 0;
    defparam SignalSel.Bit2Mode = 0;
    defparam SignalSel.Bit3Mode = 0;
    defparam SignalSel.Bit4Mode = 0;
    defparam SignalSel.Bit5Mode = 0;
    defparam SignalSel.Bit6Mode = 0;
    defparam SignalSel.Bit7Mode = 0;
    defparam SignalSel.BitValue = 0;
    defparam SignalSel.BusDisplay = 1;
    defparam SignalSel.ExtrReset = 0;
    defparam SignalSel.NumOutputs = 2;
    CyControlReg_v1_70 InputValue (
        .control_1(Net_474),
        .control_2(Net_475),
        .control_3(Net_476),
        .control_0(Net_438),
        .control_4(Net_478),
        .control_5(Net_479),
        .control_6(Net_480),
        .control_7(Net_481),
        .clock(1'b0),
        .reset(1'b0));
    defparam InputValue.Bit0Mode = 0;
    defparam InputValue.Bit1Mode = 0;
    defparam InputValue.Bit2Mode = 0;
    defparam InputValue.Bit3Mode = 0;
    defparam InputValue.Bit4Mode = 0;
    defparam InputValue.Bit5Mode = 0;
    defparam InputValue.Bit6Mode = 0;
    defparam InputValue.Bit7Mode = 0;
    defparam InputValue.BitValue = 0;
    defparam InputValue.BusDisplay = 0;
    defparam InputValue.ExtrReset = 0;
    defparam InputValue.NumOutputs = 1;
    SCB_P4_v2_0_3 SPI_1 (
        .interrupt(Net_507),
        .clock(1'b0));
endmodule