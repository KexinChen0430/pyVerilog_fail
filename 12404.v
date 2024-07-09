module top ;
          wire  Net_147;
          wire  Net_146;
          wire  Net_145;
          wire  Net_144;
          wire  Net_143;
          wire  Net_142;
          wire  Net_141;
          wire  Net_140;
          wire  Net_139;
          wire  Net_129;
          wire  Net_128;
          wire  Net_113;
          wire  Net_112;
          wire  Net_111;
          wire  Net_110;
          wire  Net_109;
          wire  Net_44;
          wire  Net_108;
          wire  Net_107;
          wire  Net_106;
          wire  Net_105;
          wire  Net_104;
          wire  Net_103;
          wire  Net_66;
          wire  Net_65;
          wire  Net_64;
          wire  Net_63;
          wire  Net_62;
          wire  Net_61;
          wire  Net_60;
          wire  Net_59;
          wire  Net_58;
          wire  Net_57;
          wire  Net_56;
          wire  Net_97;
          wire  Net_7;
          wire  Net_35;
    UART_v2_30_0 UART_SoilMoisture_Decagon (
        .cts_n(1'b0),
        .tx(Net_57),
        .rts_n(Net_58),
        .tx_en(Net_59),
        .clock(1'b0),
        .reset(1'b0),
        .rx(Net_7),
        .tx_interrupt(Net_62),
        .rx_interrupt(Net_35),
        .tx_data(Net_63),
        .tx_clk(Net_64),
        .rx_data(Net_65),
        .rx_clk(Net_66));
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
    UART_v2_30_1 UART_Ultrasonic_Maxbotix (
        .cts_n(1'b0),
        .tx(Net_104),
        .rts_n(Net_105),
        .tx_en(Net_106),
        .clock(1'b0),
        .reset(1'b0),
        .rx(Net_44),
        .tx_interrupt(Net_109),
        .rx_interrupt(Net_97),
        .tx_data(Net_110),
        .tx_clk(Net_111),
        .rx_data(Net_112),
        .rx_clk(Net_113));
    defparam UART_Ultrasonic_Maxbotix.Address1 = 0;
    defparam UART_Ultrasonic_Maxbotix.Address2 = 0;
    defparam UART_Ultrasonic_Maxbotix.EnIntRXInterrupt = 0;
    defparam UART_Ultrasonic_Maxbotix.EnIntTXInterrupt = 0;
    defparam UART_Ultrasonic_Maxbotix.FlowControl = 0;
    defparam UART_Ultrasonic_Maxbotix.HalfDuplexEn = 0;
    defparam UART_Ultrasonic_Maxbotix.HwTXEnSignal = 1;
    defparam UART_Ultrasonic_Maxbotix.NumDataBits = 8;
    defparam UART_Ultrasonic_Maxbotix.NumStopBits = 1;
    defparam UART_Ultrasonic_Maxbotix.ParityType = 0;
    defparam UART_Ultrasonic_Maxbotix.RXEnable = 1;
    defparam UART_Ultrasonic_Maxbotix.TXEnable = 0;
	wire [0:0] tmpOE__Rx_Depth_Maxbotix_net;
	wire [0:0] tmpIO_0__Rx_Depth_Maxbotix_net;
	wire [0:0] tmpINTERRUPT_0__Rx_Depth_Maxbotix_net;
	electrical [0:0] tmpSIOVREF__Rx_Depth_Maxbotix_net;
	cy_psoc3_pins_v1_10
		#(.id("3e017343-901d-4f28-862c-3c6b5cdd94b9"),
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
		Rx_Depth_Maxbotix
		 (.oe(tmpOE__Rx_Depth_Maxbotix_net),
		  .y({1'b0}),
		  .fb({Net_44}),
		  .io({tmpIO_0__Rx_Depth_Maxbotix_net[0:0]}),
		  .siovref(tmpSIOVREF__Rx_Depth_Maxbotix_net),
		  .interrupt({tmpINTERRUPT_0__Rx_Depth_Maxbotix_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Rx_Depth_Maxbotix_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_Ultrasonic_Maxbotix
		 (.int_signal(Net_97));
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
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_SoilMoisture_Decagon
		 (.int_signal(Net_35));
    NEOMOTE_5 NEOMOTE_1 ();
    emFile_v1_20_7 emFile_1 ();
	wire [0:0] tmpOE__SDA_1_net;
	wire [0:0] tmpFB_0__SDA_1_net;
	wire [0:0] tmpINTERRUPT_0__SDA_1_net;
	electrical [0:0] tmpSIOVREF__SDA_1_net;
	cy_psoc3_pins_v1_10
		#(.id("22863ebe-a37b-476f-b252-6e49a8c00b12"),
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
		  .pin_mode("B"),
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
		SDA_1
		 (.oe(tmpOE__SDA_1_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__SDA_1_net[0:0]}),
		  .io({Net_128}),
		  .siovref(tmpSIOVREF__SDA_1_net),
		  .interrupt({tmpINTERRUPT_0__SDA_1_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__SDA_1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__SCL_1_net;
	wire [0:0] tmpFB_0__SCL_1_net;
	wire [0:0] tmpINTERRUPT_0__SCL_1_net;
	electrical [0:0] tmpSIOVREF__SCL_1_net;
	cy_psoc3_pins_v1_10
		#(.id("02f2cf2c-2c7a-49df-9246-7a3435c21be3"),
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
		  .pin_mode("B"),
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
		SCL_1
		 (.oe(tmpOE__SCL_1_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__SCL_1_net[0:0]}),
		  .io({Net_129}),
		  .siovref(tmpSIOVREF__SCL_1_net),
		  .interrupt({tmpINTERRUPT_0__SCL_1_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__SCL_1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    I2C_v3_30_8 I2C_1 (
        .sda(Net_128),
        .scl(Net_129),
        .clock(1'b0),
        .reset(1'b0),
        .bclk(Net_141),
        .iclk(Net_142),
        .scl_i(1'b0),
        .sda_i(1'b0),
        .scl_o(Net_145),
        .sda_o(Net_146),
        .itclk(Net_147));
	wire [0:0] tmpOE__Digital_Sensor_Power_net;
	wire [0:0] tmpFB_0__Digital_Sensor_Power_net;
	wire [0:0] tmpIO_0__Digital_Sensor_Power_net;
	wire [0:0] tmpINTERRUPT_0__Digital_Sensor_Power_net;
	electrical [0:0] tmpSIOVREF__Digital_Sensor_Power_net;
	cy_psoc3_pins_v1_10
		#(.id("b4d82f45-d2ff-4880-ba26-f4781b7e5d27"),
		  .drive_mode(3'b010),
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
		Digital_Sensor_Power
		 (.oe(tmpOE__Digital_Sensor_Power_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Digital_Sensor_Power_net[0:0]}),
		  .io({tmpIO_0__Digital_Sensor_Power_net[0:0]}),
		  .siovref(tmpSIOVREF__Digital_Sensor_Power_net),
		  .interrupt({tmpINTERRUPT_0__Digital_Sensor_Power_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Digital_Sensor_Power_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
endmodule