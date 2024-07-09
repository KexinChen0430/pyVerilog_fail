module NEOMOTE_5 ;
          wire  Net_664;
          wire  Net_672;
          wire  Net_671;
          wire  Net_670;
          wire  Net_669;
          wire  Net_668;
          wire  Net_667;
          wire  Net_666;
          wire  Net_665;
          wire  Net_636;
          wire  Net_635;
          wire  Net_634;
          wire  Net_633;
          wire  Net_632;
          wire  Net_631;
          wire  Net_630;
          wire  Net_629;
          wire  Net_628;
          wire  Net_627;
          wire  Net_626;
          wire  Net_625;
          wire  Net_542;
          wire  Net_541;
          wire  Net_540;
          wire  Net_539;
          wire  Net_538;
          wire  Net_537;
          wire  Net_536;
          wire  Net_535;
          wire  Net_534;
          wire  Net_533;
          wire  Net_532;
          wire  Net_531;
          wire  Net_648;
          wire  Net_660;
          wire  Net_651;
          wire  Net_176;
          wire  Net_212;
    UART_v2_30_2 UART_MOTE (
        .cts_n(1'b0),
        .tx(Net_176),
        .rts_n(Net_532),
        .tx_en(Net_533),
        .clock(1'b0),
        .reset(Net_535),
        .rx(Net_212),
        .tx_interrupt(Net_536),
        .rx_interrupt(Net_537),
        .tx_data(Net_538),
        .tx_clk(Net_539),
        .rx_data(Net_540),
        .rx_clk(Net_541));
    defparam UART_MOTE.Address1 = 0;
    defparam UART_MOTE.Address2 = 0;
    defparam UART_MOTE.EnIntRXInterrupt = 0;
    defparam UART_MOTE.EnIntTXInterrupt = 0;
    defparam UART_MOTE.FlowControl = 0;
    defparam UART_MOTE.HalfDuplexEn = 0;
    defparam UART_MOTE.HwTXEnSignal = 0;
    defparam UART_MOTE.NumDataBits = 8;
    defparam UART_MOTE.NumStopBits = 1;
    defparam UART_MOTE.ParityType = 0;
    defparam UART_MOTE.RXEnable = 1;
    defparam UART_MOTE.TXEnable = 1;
	wire [0:0] tmpOE__RX_Pin_net;
	wire [0:0] tmpIO_0__RX_Pin_net;
	wire [0:0] tmpINTERRUPT_0__RX_Pin_net;
	electrical [0:0] tmpSIOVREF__RX_Pin_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/483c8cff-b35d-4e9b-b782-7d15671bd8fc"),
		  .drive_mode(3'b010),
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
		RX_Pin
		 (.oe(tmpOE__RX_Pin_net),
		  .y({1'b0}),
		  .fb({Net_212}),
		  .io({tmpIO_0__RX_Pin_net[0:0]}),
		  .siovref(tmpSIOVREF__RX_Pin_net),
		  .interrupt({tmpINTERRUPT_0__RX_Pin_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__RX_Pin_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__TX_Pin_net;
	wire [0:0] tmpFB_0__TX_Pin_net;
	wire [0:0] tmpIO_0__TX_Pin_net;
	wire [0:0] tmpINTERRUPT_0__TX_Pin_net;
	electrical [0:0] tmpSIOVREF__TX_Pin_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/ed092b9b-d398-4703-be89-cebf998501f6"),
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
		TX_Pin
		 (.oe(tmpOE__TX_Pin_net),
		  .y({Net_176}),
		  .fb({tmpFB_0__TX_Pin_net[0:0]}),
		  .io({tmpIO_0__TX_Pin_net[0:0]}),
		  .siovref(tmpSIOVREF__TX_Pin_net),
		  .interrupt({tmpINTERRUPT_0__TX_Pin_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__TX_Pin_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    ZeroTerminal ZeroTerminal_2 (
        .z(Net_535));
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_RX
		 (.int_signal(Net_537));
	wire [0:0] tmpOE__RX_RTS_n_net;
	wire [0:0] tmpFB_0__RX_RTS_n_net;
	wire [0:0] tmpIO_0__RX_RTS_n_net;
	electrical [0:0] tmpSIOVREF__RX_RTS_n_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/f497a9ab-60b4-4f16-b3f4-5d5c511256c1"),
		  .drive_mode(3'b010),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b11),
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
		RX_RTS_n
		 (.oe(tmpOE__RX_RTS_n_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__RX_RTS_n_net[0:0]}),
		  .io({tmpIO_0__RX_RTS_n_net[0:0]}),
		  .siovref(tmpSIOVREF__RX_RTS_n_net),
		  .interrupt({Net_542}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__RX_RTS_n_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__RX_CTS_n_net;
	wire [0:0] tmpFB_0__RX_CTS_n_net;
	wire [0:0] tmpIO_0__RX_CTS_n_net;
	wire [0:0] tmpINTERRUPT_0__RX_CTS_n_net;
	electrical [0:0] tmpSIOVREF__RX_CTS_n_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/aedfa372-ccbb-489a-9d67-d67b95d9adc7"),
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
		RX_CTS_n
		 (.oe(tmpOE__RX_CTS_n_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__RX_CTS_n_net[0:0]}),
		  .io({tmpIO_0__RX_CTS_n_net[0:0]}),
		  .siovref(tmpSIOVREF__RX_CTS_n_net),
		  .interrupt({tmpINTERRUPT_0__RX_CTS_n_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__RX_CTS_n_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__TX_RTS_n_net;
	wire [0:0] tmpFB_0__TX_RTS_n_net;
	wire [0:0] tmpIO_0__TX_RTS_n_net;
	wire [0:0] tmpINTERRUPT_0__TX_RTS_n_net;
	electrical [0:0] tmpSIOVREF__TX_RTS_n_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/52d1081a-4b5a-4078-8e67-f4f9a3e0209d"),
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
		TX_RTS_n
		 (.oe(tmpOE__TX_RTS_n_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__TX_RTS_n_net[0:0]}),
		  .io({tmpIO_0__TX_RTS_n_net[0:0]}),
		  .siovref(tmpSIOVREF__TX_RTS_n_net),
		  .interrupt({tmpINTERRUPT_0__TX_RTS_n_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__TX_RTS_n_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__TX_CTS_n_net;
	wire [0:0] tmpFB_0__TX_CTS_n_net;
	wire [0:0] tmpIO_0__TX_CTS_n_net;
	wire [0:0] tmpINTERRUPT_0__TX_CTS_n_net;
	electrical [0:0] tmpSIOVREF__TX_CTS_n_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/16e1e3e6-3865-4bb9-bb8c-3f92d51bf7af"),
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
		TX_CTS_n
		 (.oe(tmpOE__TX_CTS_n_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__TX_CTS_n_net[0:0]}),
		  .io({tmpIO_0__TX_CTS_n_net[0:0]}),
		  .siovref(tmpSIOVREF__TX_CTS_n_net),
		  .interrupt({tmpINTERRUPT_0__TX_CTS_n_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__TX_CTS_n_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__TimeN_net;
	wire [0:0] tmpFB_0__TimeN_net;
	wire [0:0] tmpIO_0__TimeN_net;
	wire [0:0] tmpINTERRUPT_0__TimeN_net;
	electrical [0:0] tmpSIOVREF__TimeN_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/0818fd13-68e2-43ac-afc2-87e7ba6f6425"),
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
		TimeN
		 (.oe(tmpOE__TimeN_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__TimeN_net[0:0]}),
		  .io({tmpIO_0__TimeN_net[0:0]}),
		  .siovref(tmpSIOVREF__TimeN_net),
		  .interrupt({tmpINTERRUPT_0__TimeN_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__TimeN_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_RX_RTSn
		 (.int_signal(Net_542));
	wire [0:0] tmpOE__External_VRef_net;
	wire [0:0] tmpFB_0__External_VRef_net;
	wire [0:0] tmpIO_0__External_VRef_net;
	wire [0:0] tmpINTERRUPT_0__External_VRef_net;
	electrical [0:0] tmpSIOVREF__External_VRef_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/52f31aa9-2f0a-497d-9a1f-1424095e13e6"),
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
		External_VRef
		 (.oe(tmpOE__External_VRef_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__External_VRef_net[0:0]}),
		  .io({tmpIO_0__External_VRef_net[0:0]}),
		  .siovref(tmpSIOVREF__External_VRef_net),
		  .interrupt({tmpINTERRUPT_0__External_VRef_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__External_VRef_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    I2C_v3_30_3 I2C_0 (
        .sda(Net_625),
        .scl(Net_626),
        .clock(1'b0),
        .reset(1'b0),
        .bclk(Net_629),
        .iclk(Net_630),
        .scl_i(1'b0),
        .sda_i(1'b0),
        .scl_o(Net_633),
        .sda_o(Net_634),
        .itclk(Net_635));
	wire [0:0] tmpOE__I2C_0_SDA_net;
	wire [0:0] tmpFB_0__I2C_0_SDA_net;
	wire [0:0] tmpINTERRUPT_0__I2C_0_SDA_net;
	electrical [0:0] tmpSIOVREF__I2C_0_SDA_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/5c1decb5-69e3-4a8d-bb0c-281221d15217"),
		  .drive_mode(3'b100),
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
		I2C_0_SDA
		 (.oe(tmpOE__I2C_0_SDA_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__I2C_0_SDA_net[0:0]}),
		  .io({Net_625}),
		  .siovref(tmpSIOVREF__I2C_0_SDA_net),
		  .interrupt({tmpINTERRUPT_0__I2C_0_SDA_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__I2C_0_SDA_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__I2C_0_SCL_net;
	wire [0:0] tmpFB_0__I2C_0_SCL_net;
	wire [0:0] tmpINTERRUPT_0__I2C_0_SCL_net;
	electrical [0:0] tmpSIOVREF__I2C_0_SCL_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/25518df9-7fe0-4da6-8dbf-d2a9e2ed11c1"),
		  .drive_mode(3'b100),
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
		I2C_0_SCL
		 (.oe(tmpOE__I2C_0_SCL_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__I2C_0_SCL_net[0:0]}),
		  .io({Net_626}),
		  .siovref(tmpSIOVREF__I2C_0_SCL_net),
		  .interrupt({tmpINTERRUPT_0__I2C_0_SCL_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__I2C_0_SCL_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__NEO_RTC_INT1_net;
	wire [0:0] tmpFB_0__NEO_RTC_INT1_net;
	wire [0:0] tmpIO_0__NEO_RTC_INT1_net;
	electrical [0:0] tmpSIOVREF__NEO_RTC_INT1_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/94c29172-218c-472e-b77b-9668892b6f11"),
		  .drive_mode(3'b010),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b1),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b10),
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
		NEO_RTC_INT1
		 (.oe(tmpOE__NEO_RTC_INT1_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__NEO_RTC_INT1_net[0:0]}),
		  .io({tmpIO_0__NEO_RTC_INT1_net[0:0]}),
		  .siovref(tmpSIOVREF__NEO_RTC_INT1_net),
		  .interrupt({Net_636}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__NEO_RTC_INT1_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	cy_isr_v1_0
		#(.int_type(2'b00))
		isr_rtc_int1
		 (.int_signal(Net_636));
	wire [0:0] tmpOE__SD_Card_Power_net;
	wire [0:0] tmpFB_0__SD_Card_Power_net;
	wire [0:0] tmpIO_0__SD_Card_Power_net;
	wire [0:0] tmpINTERRUPT_0__SD_Card_Power_net;
	electrical [0:0] tmpSIOVREF__SD_Card_Power_net;
	cy_psoc3_pins_v1_10
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/37615ece-52ed-4b08-a3cb-e053c56b7928"),
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
		SD_Card_Power
		 (.oe(tmpOE__SD_Card_Power_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__SD_Card_Power_net[0:0]}),
		  .io({tmpIO_0__SD_Card_Power_net[0:0]}),
		  .siovref(tmpSIOVREF__SD_Card_Power_net),
		  .interrupt({tmpINTERRUPT_0__SD_Card_Power_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__SD_Card_Power_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    Counter_v2_40_4 DELAY_COUNTER (
        .reset(Net_648),
        .tc(Net_665),
        .comp(Net_666),
        .clock(Net_651),
        .interrupt(Net_660),
        .enable(1'b0),
        .capture(1'b0),
        .upCnt(1'b0),
        .downCnt(1'b0),
        .up_ndown(1'b1),
        .count(1'b0));
    defparam DELAY_COUNTER.CaptureMode = 0;
    defparam DELAY_COUNTER.ClockMode = 3;
    defparam DELAY_COUNTER.CompareMode = 1;
    defparam DELAY_COUNTER.CompareStatusEdgeSense = 1;
    defparam DELAY_COUNTER.EnableMode = 0;
    defparam DELAY_COUNTER.ReloadOnCapture = 0;
    defparam DELAY_COUNTER.ReloadOnCompare = 0;
    defparam DELAY_COUNTER.ReloadOnOverUnder = 1;
    defparam DELAY_COUNTER.ReloadOnReset = 1;
    defparam DELAY_COUNTER.Resolution = 16;
    defparam DELAY_COUNTER.RunMode = 0;
    defparam DELAY_COUNTER.UseInterrupt = 1;
    assign Net_648 = 1'h0;
	cy_isr_v1_0
		#(.int_type(2'b10))
		isr_packet_delay
		 (.int_signal(Net_660));
	cy_clock_v1_0
		#(.id("42a3c2ea-f0b8-4d0c-bf50-a43bc1e1db6a/96bd6326-bc84-40d3-a080-adae5cf2aa35"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("83333333333.3333"),
		  .is_direct(0),
		  .is_digital(1))
		Clock_1
		 (.clock_out(Net_651));
endmodule