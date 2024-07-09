module USBFS_v2_70_0 (
    sof,
    vbusdet);
    output      sof;
    input       vbusdet;
    parameter epDMAautoOptimization = 0;
          wire  Net_1785;
          wire  Net_1771;
          wire  Net_1754;
          wire  Net_1753;
          wire [8:0] ept_int;
          wire  Net_1583;
          wire  Net_1582;
          wire  Net_1568;
          wire  Net_1561;
          wire  Net_1499;
          wire  Net_1494;
          wire [7:0] dma_req;
          wire [7:0] Net_1649;
          wire  Net_1648;
          wire  Net_1647;
          wire  Net_1646;
          wire  Net_1645;
          wire  Net_1643;
          wire  Net_1642;
          wire  Net_1730;
          wire  Net_1775;
          wire  Net_1599;
          wire  Net_1719;
          wire  Net_1718;
          wire  Net_1717;
          wire  Net_1716;
          wire  Net_1777;
          wire [7:0] dma_nrq;
          wire  Net_1715;
          wire  Net_1714;
          wire  Net_1713;
          wire  Net_1712;
          wire [7:0] Net_1208;
          wire  Net_1207;
          wire  Net_1206;
          wire  Net_1205;
          wire  Net_1204;
          wire  Net_1203;
          wire  Net_1201;
          wire  Net_1200;
          wire  Net_1199;
          wire  Net_1269;
          wire  Net_1202;
          wire  Net_1768;
          wire  Net_1591;
          wire [7:0] dma_nrq_sync;
          wire  Net_1588;
          wire  Net_1522;
          wire  Net_1579;
          wire  Net_1576;
          wire  Net_1567;
          wire  Net_1559;
          wire  Net_1498;
          wire  Net_1495;
          wire  Net_1010;
    electrical  Net_1000;
          wire  Net_824;
    electrical  Net_597;
          wire  Net_95;
          wire  Net_81;
          wire  Net_79;
	cy_clock_v1_0
		#(.id("c39ef993-d787-4c0c-8ad6-c0c81f866442/03f503a7-085a-4304-b786-de885b1c2f21"),
		  .source_clock_id("75C2148C-3656-4d8a-846D-0CAE99AB6FF7"),
		  .divisor(0),
		  .period("0"),
		  .is_direct(1),
		  .is_digital(1))
		Clock_vbus
		 (.clock_out(Net_1202));
	cy_isr_v1_0
		#(.int_type(2'b10))
		dp_int
		 (.int_signal(Net_1010));
	wire [0:0] tmpOE__Dm_net;
	wire [0:0] tmpFB_0__Dm_net;
	wire [0:0] tmpIO_0__Dm_net;
	wire [0:0] tmpINTERRUPT_0__Dm_net;
	electrical [0:0] tmpSIOVREF__Dm_net;
	cy_psoc3_pins_v1_10
		#(.id("c39ef993-d787-4c0c-8ad6-c0c81f866442/8b77a6c4-10a0-4390-971c-672353e2a49c"),
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
		  .layout_mode("NONCONTIGUOUS"),
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
		  .sio_hyst(1'b0),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(1),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1))
		Dm
		 (.oe(tmpOE__Dm_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Dm_net[0:0]}),
		  .analog({Net_597}),
		  .io({tmpIO_0__Dm_net[0:0]}),
		  .siovref(tmpSIOVREF__Dm_net),
		  .interrupt({tmpINTERRUPT_0__Dm_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Dm_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__Dp_net;
	wire [0:0] tmpFB_0__Dp_net;
	wire [0:0] tmpIO_0__Dp_net;
	electrical [0:0] tmpSIOVREF__Dp_net;
	cy_psoc3_pins_v1_10
		#(.id("c39ef993-d787-4c0c-8ad6-c0c81f866442/618a72fc-5ddd-4df5-958f-a3d55102db42"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
		  .init_dr_st(1'b0),
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
		Dp
		 (.oe(tmpOE__Dp_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Dp_net[0:0]}),
		  .analog({Net_1000}),
		  .io({tmpIO_0__Dp_net[0:0]}),
		  .siovref(tmpSIOVREF__Dp_net),
		  .interrupt({Net_1010}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__Dp_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    cy_psoc3_usb_v1_0 USB (
        .dp(Net_1000),
        .dm(Net_597),
        .sof_int(sof),
        .arb_int(Net_79),
        .usb_int(Net_81),
        .ept_int(ept_int[8:0]),
        .ord_int(Net_95),
        .dma_req(dma_req[7:0]),
        .dma_termin(Net_824));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ord_int
		 (.int_signal(Net_95));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ep_3
		 (.int_signal(ept_int[3:3]));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ep_2
		 (.int_signal(ept_int[2:2]));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ep_1
		 (.int_signal(ept_int[1:1]));
	cy_isr_v1_0
		#(.int_type(2'b10))
		ep_0
		 (.int_signal(ept_int[0:0]));
	cy_isr_v1_0
		#(.int_type(2'b10))
		bus_reset
		 (.int_signal(Net_81));
	cy_isr_v1_0
		#(.int_type(2'b10))
		arb_int
		 (.int_signal(Net_79));
	cy_isr_v1_0
		#(.int_type(2'b10))
		sof_int
		 (.int_signal(sof));
	// VirtualMux_1 (cy_virtualmux_v1_0)
	assign dma_nrq[0] = Net_1494;
    ZeroTerminal ZeroTerminal_1 (
        .z(Net_1494));
	// VirtualMux_2 (cy_virtualmux_v1_0)
	assign dma_nrq[1] = Net_1499;
    ZeroTerminal ZeroTerminal_2 (
        .z(Net_1499));
	// VirtualMux_3 (cy_virtualmux_v1_0)
	assign dma_nrq[2] = Net_1561;
    ZeroTerminal ZeroTerminal_3 (
        .z(Net_1561));
	// VirtualMux_4 (cy_virtualmux_v1_0)
	assign dma_nrq[3] = Net_1568;
    ZeroTerminal ZeroTerminal_4 (
        .z(Net_1568));
	// VirtualMux_5 (cy_virtualmux_v1_0)
	assign dma_nrq[4] = Net_1582;
	// VirtualMux_6 (cy_virtualmux_v1_0)
	assign dma_nrq[5] = Net_1583;
    ZeroTerminal ZeroTerminal_5 (
        .z(Net_1582));
    ZeroTerminal ZeroTerminal_6 (
        .z(Net_1583));
	// VirtualMux_7 (cy_virtualmux_v1_0)
	assign dma_nrq[6] = Net_1753;
	// VirtualMux_8 (cy_virtualmux_v1_0)
	assign dma_nrq[7] = Net_1754;
    ZeroTerminal ZeroTerminal_7 (
        .z(Net_1753));
    ZeroTerminal ZeroTerminal_8 (
        .z(Net_1754));
endmodule