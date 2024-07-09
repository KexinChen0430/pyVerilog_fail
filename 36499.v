module top ;
          wire  Net_50;
          wire  Net_49;
          wire  Net_48;
          wire  Net_47;
          wire  Net_46;
          wire  Net_45;
          wire  Net_7;
          wire  Net_44;
          wire  Net_43;
          wire  Net_42;
          wire  Net_41;
          wire  Net_40;
          wire  Net_39;
    UART_v2_30_0 UART_SoilMoisture_Decagon (
        .cts_n(1'b0),
        .tx(Net_40),
        .rts_n(Net_41),
        .tx_en(Net_42),
        .clock(1'b0),
        .reset(1'b0),
        .rx(Net_7),
        .tx_interrupt(Net_45),
        .rx_interrupt(Net_46),
        .tx_data(Net_47),
        .tx_clk(Net_48),
        .rx_data(Net_49),
        .rx_clk(Net_50));
    defparam UART_SoilMoisture_Decagon.Address1 = 0;
    defparam UART_SoilMoisture_Decagon.Address2 = 0;
    defparam UART_SoilMoisture_Decagon.EnIntRXInterrupt = 0;
    defparam UART_SoilMoisture_Decagon.EnIntTXInterrupt = 0;
    defparam UART_SoilMoisture_Decagon.FlowControl = 0;
    defparam UART_SoilMoisture_Decagon.HalfDuplexEn = 0;
    defparam UART_SoilMoisture_Decagon.HwTXEnSignal = 1;
    defparam UART_SoilMoisture_Decagon.NumDataBits = 8;
    defparam UART_SoilMoisture_Decagon.NumStopBits = 1;
    defparam UART_SoilMoisture_Decagon.ParityType = 0;
    defparam UART_SoilMoisture_Decagon.RXEnable = 1;
    defparam UART_SoilMoisture_Decagon.TXEnable = 0;
	wire [0:0] tmpOE__Rx_SoilMoisture_Decagon_net;
	wire [0:0] tmpIO_0__Rx_SoilMoisture_Decagon_net;
	wire [0:0] tmpINTERRUPT_0__Rx_SoilMoisture_Decagon_net;
	electrical [0:0] tmpSIOVREF__Rx_SoilMoisture_Decagon_net;
	cy_psoc3_pins_v1_10
		#(.id("1425177d-0d0e-4468-8bcc-e638e5509a9b"),
		  .drive_mode(3'b001),
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
		  .pin_mode("I"),
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
		  .vtrip(2'b00),
		  .width(1))
		Rx_SoilMoisture_Decagon
		 (.oe(tmpOE__Rx_SoilMoisture_Decagon_net),
		  .y({1'b0}),
		  .fb({Net_7}),
		  .io({tmpIO_0__Rx_SoilMoisture_Decagon_net[0:0]}),
		  .siovref(tmpSIOVREF__Rx_SoilMoisture_Decagon_net),
		  .interrupt({tmpINTERRUPT_0__Rx_SoilMoisture_Decagon_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Rx_SoilMoisture_Decagon_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_SoilMoisture_Decagon
		 (.int_signal(Net_46));
	wire [0:0] tmpOE__Decagon_Sensor_Power_net;
	wire [0:0] tmpFB_0__Decagon_Sensor_Power_net;
	wire [0:0] tmpIO_0__Decagon_Sensor_Power_net;
	wire [0:0] tmpINTERRUPT_0__Decagon_Sensor_Power_net;
	electrical [0:0] tmpSIOVREF__Decagon_Sensor_Power_net;
	cy_psoc3_pins_v1_10
		#(.id("3dba336a-f6a5-43fb-aed3-de1e0b7bf362"),
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
		Decagon_Sensor_Power
		 (.oe(tmpOE__Decagon_Sensor_Power_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Decagon_Sensor_Power_net[0:0]}),
		  .io({tmpIO_0__Decagon_Sensor_Power_net[0:0]}),
		  .siovref(tmpSIOVREF__Decagon_Sensor_Power_net),
		  .interrupt({tmpINTERRUPT_0__Decagon_Sensor_Power_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Decagon_Sensor_Power_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    NEOMOTE_4 NEOMOTE_1 ();
endmodule