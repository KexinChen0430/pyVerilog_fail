module top ;
          wire  Net_1574;
          wire  Net_1573;
          wire  Net_1572;
          wire  Net_1571;
          wire  Net_1570;
          wire  Net_1569;
          wire  Net_1567;
          wire  Net_1529;
          wire  Net_1489;
          wire  Net_1488;
          wire  Net_1487;
          wire  Net_1486;
          wire  Net_1485;
          wire  Net_1484;
          wire  Net_1483;
          wire  Net_1482;
          wire  Net_1481;
          wire  Net_1480;
          wire  Net_1509;
          wire  Net_1508;
          wire  Net_1507;
          wire  Net_1506;
          wire  Net_1505;
          wire  Net_1504;
          wire  Net_1503;
          wire  Net_1502;
          wire  Net_1501;
          wire  Net_1500;
          wire  Net_1348;
          wire  Net_1347;
          wire  Net_563;
    electrical  Net_562;
          wire  Net_561;
          wire  Net_566;
          wire  Net_559;
    electrical  Net_558;
          wire  Net_1499;
          wire  Net_1498;
          wire  Net_1497;
          wire  Net_1496;
          wire  Net_1495;
          wire  Net_1494;
          wire  Net_1493;
          wire  Net_1492;
          wire  Net_1491;
          wire  Net_1490;
          wire  Net_1405;
          wire  Net_1478;
          wire  Net_1524;
          wire  Net_1664;
          wire  Net_1634;
          wire  Net_1632;
    electrical  Net_1602;
    electrical  Net_1603;
    electrical  Net_1593;
          wire  Net_1566;
          wire  Net_1461;
          wire  Net_1462;
          wire  Net_1568;
          wire  Net_1464;
          wire  Net_1479;
          wire  Net_1565;
          wire  Net_1467;
          wire  Net_1468;
          wire [1:0] Net_1460;
          wire [1:0] Net_1410;
          wire  Net_1525;
          wire  Net_1415;
          wire  Net_1409;
          wire  Net_1309;
          wire  Net_1308;
    RTC_v2_0_0 RTC ();
    if (1)
    begin : demux_2
        reg  tmp__demux_2_0_reg;
        reg  tmp__demux_2_1_reg;
        reg  tmp__demux_2_2_reg;
        reg  tmp__demux_2_3_reg;
        always @(Net_1415 or Net_1460)
        begin
            case (Net_1460[1:0])
                2'b00:
                begin
                    tmp__demux_2_0_reg = Net_1415;
                    tmp__demux_2_1_reg = 1'b0;
                    tmp__demux_2_2_reg = 1'b0;
                    tmp__demux_2_3_reg = 1'b0;
                end
                2'b01:
                begin
                    tmp__demux_2_0_reg = 1'b0;
                    tmp__demux_2_1_reg = Net_1415;
                    tmp__demux_2_2_reg = 1'b0;
                    tmp__demux_2_3_reg = 1'b0;
                end
                2'b10:
                begin
                    tmp__demux_2_0_reg = 1'b0;
                    tmp__demux_2_1_reg = 1'b0;
                    tmp__demux_2_2_reg = Net_1415;
                    tmp__demux_2_3_reg = 1'b0;
                end
                2'b11:
                begin
                    tmp__demux_2_0_reg = 1'b0;
                    tmp__demux_2_1_reg = 1'b0;
                    tmp__demux_2_2_reg = 1'b0;
                    tmp__demux_2_3_reg = Net_1415;
                end
            endcase
        end
        assign Net_1478 = tmp__demux_2_0_reg;
        assign Net_1462 = tmp__demux_2_1_reg;
        assign Net_1479 = tmp__demux_2_2_reg;
        assign Net_1468 = tmp__demux_2_3_reg;
    end
	wire [2:0] tmpOE__RGB_LED_net;
	wire [2:0] tmpFB_2__RGB_LED_net;
	wire [2:0] tmpIO_2__RGB_LED_net;
	wire [0:0] tmpINTERRUPT_0__RGB_LED_net;
	electrical [0:0] tmpSIOVREF__RGB_LED_net;
	cy_psoc3_pins_v1_10
		#(.id("52f31aa9-2f0a-497d-9a1f-1424095e13e6"),
		  .drive_mode(9'b110_110_110),
		  .ibuf_enabled(3'b1_1_1),
		  .init_dr_st(3'b1_1_1),
		  .input_clk_en(0),
		  .input_sync(3'b1_1_1),
		  .input_sync_mode(3'b0_0_0),
		  .intr_mode(6'b00_00_00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(", , "),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(3'b0_0_0),
		  .oe_reset(0),
		  .oe_sync(3'b0_0_0),
		  .output_clk_en(0),
		  .output_clock_mode(3'b0_0_0),
		  .output_conn(3'b1_1_1),
		  .output_mode(3'b0_0_0),
		  .output_reset(0),
		  .output_sync(3'b0_0_0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(",,"),
		  .pin_mode("OOO"),
		  .por_state(4),
		  .use_annotation(3'b0_0_0),
		  .sio_group_cnt(0),
		  .sio_hyst(3'b0_0_0),
		  .sio_ibuf(""),
		  .sio_info(6'b00_00_00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(3'b0_0_0),
		  .spanning(0),
		  .vtrip(6'b10_10_10),
		  .width(3))
		RGB_LED
		 (.oe(tmpOE__RGB_LED_net),
		  .y({Net_1634, Net_1664, Net_1632}),
		  .fb({tmpFB_2__RGB_LED_net[2:0]}),
		  .io({tmpIO_2__RGB_LED_net[2:0]}),
		  .siovref(tmpSIOVREF__RGB_LED_net),
		  .interrupt({tmpINTERRUPT_0__RGB_LED_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__RGB_LED_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{3'b111} : {3'b111};
    assign Net_1632 = ~(Net_1568 | Net_1462 | Net_1461);
    if (1)
    begin : demux_1
        reg  tmp__demux_1_0_reg;
        reg  tmp__demux_1_1_reg;
        reg  tmp__demux_1_2_reg;
        reg  tmp__demux_1_3_reg;
        always @(Net_1409 or Net_1410)
        begin
            case (Net_1410[1:0])
                2'b00:
                begin
                    tmp__demux_1_0_reg = Net_1409;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b01:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = Net_1409;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b10:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = Net_1409;
                    tmp__demux_1_3_reg = 1'b0;
                end
                2'b11:
                begin
                    tmp__demux_1_0_reg = 1'b0;
                    tmp__demux_1_1_reg = 1'b0;
                    tmp__demux_1_2_reg = 1'b0;
                    tmp__demux_1_3_reg = Net_1409;
                end
            endcase
        end
        assign Net_1405 = tmp__demux_1_0_reg;
        assign Net_1461 = tmp__demux_1_1_reg;
        assign Net_1464 = tmp__demux_1_2_reg;
        assign Net_1467 = tmp__demux_1_3_reg;
    end
	wire [0:0] tmpOE__Vbus_net;
	wire [0:0] tmpFB_0__Vbus_net;
	wire [0:0] tmpIO_0__Vbus_net;
	electrical [0:0] tmpSIOVREF__Vbus_net;
	cy_psoc3_pins_v1_10
		#(.id("4c15b41e-e284-4978-99e7-5aaee19bd0ce"),
		  .drive_mode(3'b011),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b0),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b01),
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
		  .pin_mode("I"),
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
		  .vtrip(2'b00),
		  .width(1))
		Vbus
		 (.oe(tmpOE__Vbus_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Vbus_net[0:0]}),
		  .io({tmpIO_0__Vbus_net[0:0]}),
		  .siovref(tmpSIOVREF__Vbus_net),
		  .interrupt({Net_1525}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Vbus_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		Vbus_IRQ
		 (.int_signal(Net_1525));
    CyControlReg_v1_70 PWM0_CTRL (
        .control_1(Net_1490),
        .control_2(Net_1491),
        .control_3(Net_1492),
        .control_0(Net_1493),
        .control_4(Net_1494),
        .control_5(Net_1495),
        .control_6(Net_1496),
        .control_7(Net_1497),
        .clock(1'b0),
        .reset(1'b0),
        .control_bus(Net_1410[1:0]));
    defparam PWM0_CTRL.Bit0Mode = 0;
    defparam PWM0_CTRL.Bit1Mode = 0;
    defparam PWM0_CTRL.Bit2Mode = 0;
    defparam PWM0_CTRL.Bit3Mode = 0;
    defparam PWM0_CTRL.Bit4Mode = 0;
    defparam PWM0_CTRL.Bit5Mode = 0;
    defparam PWM0_CTRL.Bit6Mode = 0;
    defparam PWM0_CTRL.Bit7Mode = 0;
    defparam PWM0_CTRL.BitValue = 0;
    defparam PWM0_CTRL.BusDisplay = 1;
    defparam PWM0_CTRL.ExtrReset = 0;
    defparam PWM0_CTRL.NumOutputs = 2;
	wire [0:0] tmpOE__Sensor_In_net;
	wire [0:0] tmpFB_0__Sensor_In_net;
	wire [0:0] tmpIO_0__Sensor_In_net;
	wire [0:0] tmpINTERRUPT_0__Sensor_In_net;
	electrical [0:0] tmpSIOVREF__Sensor_In_net;
	cy_psoc3_pins_v1_10
		#(.id("05a9c8de-3ba2-4909-8250-95fdc61c0bf4"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
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
		Sensor_In
		 (.oe(tmpOE__Sensor_In_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Sensor_In_net[0:0]}),
		  .analog({Net_1602}),
		  .io({tmpIO_0__Sensor_In_net[0:0]}),
		  .siovref(tmpSIOVREF__Sensor_In_net),
		  .interrupt({tmpINTERRUPT_0__Sensor_In_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Sensor_In_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    ADC_DelSig_v3_0_1 ADC (
        .vplus(Net_1593),
        .vminus(Net_558),
        .soc(1'b1),
        .eoc(Net_566),
        .aclk(1'b0),
        .nVref(Net_562),
        .mi(1'b0));
	wire [1:0] tmpOE__ModifyCollection_B_net;
	wire [1:0] tmpFB_1__ModifyCollection_B_net;
	wire [1:0] tmpIO_1__ModifyCollection_B_net;
	electrical [0:0] tmpSIOVREF__ModifyCollection_B_net;
	cy_psoc3_pins_v1_10
		#(.id("7bd73714-fc02-4433-9733-e47f5d6532cc"),
		  .drive_mode(6'b011_011),
		  .ibuf_enabled(2'b1_1),
		  .init_dr_st(2'b0_0),
		  .input_clk_en(0),
		  .input_sync(2'b1_1),
		  .input_sync_mode(2'b0_0),
		  .intr_mode(4'b01_01),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(", "),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(2'b0_0),
		  .oe_reset(0),
		  .oe_sync(2'b0_0),
		  .output_clk_en(0),
		  .output_clock_mode(2'b0_0),
		  .output_conn(2'b0_0),
		  .output_mode(2'b0_0),
		  .output_reset(0),
		  .output_sync(2'b0_0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(","),
		  .pin_mode("II"),
		  .por_state(4),
		  .use_annotation(2'b0_0),
		  .sio_group_cnt(0),
		  .sio_hyst(2'b0_0),
		  .sio_ibuf(""),
		  .sio_info(4'b00_00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(2'b0_0),
		  .spanning(0),
		  .vtrip(4'b00_00),
		  .width(2))
		ModifyCollection_B
		 (.oe(tmpOE__ModifyCollection_B_net),
		  .y({2'b0}),
		  .fb({tmpFB_1__ModifyCollection_B_net[1:0]}),
		  .io({tmpIO_1__ModifyCollection_B_net[1:0]}),
		  .siovref(tmpSIOVREF__ModifyCollection_B_net),
		  .interrupt({Net_1524}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__ModifyCollection_B_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{2'b11} : {2'b11};
	cy_isr_v1_0
		#(.int_type(2'b10))
		ModifyCollection_IRQ
		 (.int_signal(Net_1524));
    USBFS_v2_60_2 USBUART (
        .sof(Net_1347),
        .vbusdet(1'b0));
    assign Net_1664 = ~(Net_1565 | Net_1479 | Net_1464);
    CyControlReg_v1_70 PWM1_CTRL (
        .control_1(Net_1500),
        .control_2(Net_1501),
        .control_3(Net_1502),
        .control_0(Net_1503),
        .control_4(Net_1504),
        .control_5(Net_1505),
        .control_6(Net_1506),
        .control_7(Net_1507),
        .clock(1'b0),
        .reset(1'b0),
        .control_bus(Net_1460[1:0]));
    defparam PWM1_CTRL.Bit0Mode = 0;
    defparam PWM1_CTRL.Bit1Mode = 0;
    defparam PWM1_CTRL.Bit2Mode = 0;
    defparam PWM1_CTRL.Bit3Mode = 0;
    defparam PWM1_CTRL.Bit4Mode = 0;
    defparam PWM1_CTRL.Bit5Mode = 0;
    defparam PWM1_CTRL.Bit6Mode = 0;
    defparam PWM1_CTRL.Bit7Mode = 0;
    defparam PWM1_CTRL.BitValue = 0;
    defparam PWM1_CTRL.BusDisplay = 1;
    defparam PWM1_CTRL.ExtrReset = 0;
    defparam PWM1_CTRL.NumOutputs = 2;
    assign Net_1308 = 1'h0;
    PWM_v3_0_3 LED_PWM (
        .reset(Net_1308),
        .clock(Net_1309),
        .tc(Net_1480),
        .pwm1(Net_1409),
        .pwm2(Net_1415),
        .interrupt(Net_1481),
        .capture(1'b0),
        .kill(1'b1),
        .enable(1'b1),
        .trigger(1'b0),
        .cmp_sel(1'b0),
        .pwm(Net_1487),
        .ph1(Net_1488),
        .ph2(Net_1489));
    defparam LED_PWM.Resolution = 8;
    assign Net_1634 = ~(Net_1566 | Net_1468 | Net_1467);
	cy_clock_v1_0
		#(.id("48e889b6-c199-4b3a-bd89-d32bdd0d158d"),
		  .source_clock_id("315365C3-2E3E-4f04-84A2-BB564A173261"),
		  .divisor(0),
		  .period("0"),
		  .is_direct(1),
		  .is_digital(1))
		PWM_CLK
		 (.clock_out(Net_1309));
	wire [0:0] tmpOE__Batt_Monitor_net;
	wire [0:0] tmpFB_0__Batt_Monitor_net;
	wire [0:0] tmpIO_0__Batt_Monitor_net;
	wire [0:0] tmpINTERRUPT_0__Batt_Monitor_net;
	electrical [0:0] tmpSIOVREF__Batt_Monitor_net;
	cy_psoc3_pins_v1_10
		#(.id("0895e0c5-22fd-4e04-a47c-17021ab62788"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
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
		Batt_Monitor
		 (.oe(tmpOE__Batt_Monitor_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Batt_Monitor_net[0:0]}),
		  .analog({Net_1603}),
		  .io({tmpIO_0__Batt_Monitor_net[0:0]}),
		  .siovref(tmpSIOVREF__Batt_Monitor_net),
		  .interrupt({tmpINTERRUPT_0__Batt_Monitor_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Batt_Monitor_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    CyControlReg_v1_70 SOLID_LED_CTRL (
        .control_1(Net_1565),
        .control_2(Net_1566),
        .control_3(Net_1567),
        .control_0(Net_1568),
        .control_4(Net_1569),
        .control_5(Net_1570),
        .control_6(Net_1571),
        .control_7(Net_1572),
        .clock(1'b0),
        .reset(1'b0));
    defparam SOLID_LED_CTRL.Bit0Mode = 0;
    defparam SOLID_LED_CTRL.Bit1Mode = 0;
    defparam SOLID_LED_CTRL.Bit2Mode = 0;
    defparam SOLID_LED_CTRL.Bit3Mode = 0;
    defparam SOLID_LED_CTRL.Bit4Mode = 0;
    defparam SOLID_LED_CTRL.Bit5Mode = 0;
    defparam SOLID_LED_CTRL.Bit6Mode = 0;
    defparam SOLID_LED_CTRL.Bit7Mode = 0;
    defparam SOLID_LED_CTRL.BitValue = 0;
    defparam SOLID_LED_CTRL.BusDisplay = 0;
    defparam SOLID_LED_CTRL.ExtrReset = 0;
    defparam SOLID_LED_CTRL.NumOutputs = 3;
    cy_psoc3_amux_v1_0 ADC_MUX(
        .muxin({
            Net_1603,
            Net_1602
            }),
        .vout(Net_1593)
        );
    defparam ADC_MUX.muxin_width = 2;
    defparam ADC_MUX.init_mux_sel = 2'h0;
    defparam ADC_MUX.one_active = 1;
    defparam ADC_MUX.connect_mode = 0;
endmodule