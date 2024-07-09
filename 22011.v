module top ;
          wire  Net_981;
          wire  Net_980;
          wire  Net_979;
          wire  Net_978;
          wire  Net_976;
          wire  Net_974;
          wire  Net_973;
          wire  Net_1063;
          wire  Net_1061;
          wire  Net_1060;
          wire  Net_1059;
          wire  Net_1058;
          wire  Net_1057;
          wire  Net_1056;
          wire  Net_820;
          wire  Net_819;
          wire  Net_818;
          wire  Net_816;
          wire  Net_1006;
          wire  Net_1005;
          wire  Net_1004;
          wire  Net_1003;
          wire  Net_1001;
          wire  Net_1000;
          wire  Net_1053;
          wire  Net_1052;
          wire  Net_1051;
          wire  Net_1050;
          wire  Net_1048;
          wire  Net_1047;
          wire  Net_355;
          wire  Net_476;
          wire  Net_475;
          wire  Net_474;
          wire  Net_846;
          wire  Net_845;
          wire  Net_844;
          wire  Net_1054;
          wire  Net_862;
          wire  Net_574;
          wire  Net_977;
          wire  Net_566;
          wire  Net_858;
          wire  Net_961;
          wire  Net_863;
          wire  Net_104;
          wire  Net_840;
          wire  Net_838;
          wire  Net_129;
          wire  Net_105;
          wire  Net_122;
    CharLCD_v2_10_0 LCD ();
	cy_isr_v1_0
		#(.int_type(2'b00))
		startTimer_ISR
		 (.int_signal(Net_840));
    Debouncer_v1_0 upPositionPin_DBNC (
        .d(Net_105),
        .clock(Net_129),
        .q(Net_838),
        .neg(Net_844),
        .either(Net_845),
        .pos(Net_846));
    defparam upPositionPin_DBNC.EitherEdgeDetect = 0;
    defparam upPositionPin_DBNC.NegEdgeDetect = 0;
    defparam upPositionPin_DBNC.PosEdgeDetect = 1;
    defparam upPositionPin_DBNC.SignalWidth = 1;
	cy_isr_v1_0
		#(.int_type(2'b00))
		stopTimer_ISR
		 (.int_signal(Net_104));
	wire [0:0] tmpOE__downPosition_PIN_net;
	wire [0:0] tmpIO_0__downPosition_PIN_net;
	wire [0:0] tmpINTERRUPT_0__downPosition_PIN_net;
	electrical [0:0] tmpSIOVREF__downPosition_PIN_net;
	cy_psoc3_pins_v1_10
		#(.id("ff71b630-d4fb-4bb5-bd46-fea7933ec6ec"),
		  .drive_mode(3'b011),
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
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b00),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		downPosition_PIN
		 (.oe(tmpOE__downPosition_PIN_net),
		  .y({1'b0}),
		  .fb({Net_122}),
		  .io({tmpIO_0__downPosition_PIN_net[0:0]}),
		  .siovref(tmpSIOVREF__downPosition_PIN_net),
		  .interrupt({tmpINTERRUPT_0__downPosition_PIN_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__downPosition_PIN_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
	wire [0:0] tmpOE__upPosition_PIN_net;
	wire [0:0] tmpIO_0__upPosition_PIN_net;
	wire [0:0] tmpINTERRUPT_0__upPosition_PIN_net;
	electrical [0:0] tmpSIOVREF__upPosition_PIN_net;
	cy_psoc3_pins_v1_10
		#(.id("8d318d8b-cf7b-4b6b-b02c-ab1c5c49d0ba"),
		  .drive_mode(3'b011),
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
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b00),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		upPosition_PIN
		 (.oe(tmpOE__upPosition_PIN_net),
		  .y({1'b0}),
		  .fb({Net_105}),
		  .io({tmpIO_0__upPosition_PIN_net[0:0]}),
		  .siovref(tmpSIOVREF__upPosition_PIN_net),
		  .interrupt({tmpINTERRUPT_0__upPosition_PIN_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));
	assign tmpOE__upPosition_PIN_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};
    Debouncer_v1_0 downPositionPin_DBNC (
        .d(Net_122),
        .clock(Net_129),
        .q(Net_104),
        .neg(Net_474),
        .either(Net_475),
        .pos(Net_476));
    defparam downPositionPin_DBNC.EitherEdgeDetect = 0;
    defparam downPositionPin_DBNC.NegEdgeDetect = 0;
    defparam downPositionPin_DBNC.PosEdgeDetect = 1;
    defparam downPositionPin_DBNC.SignalWidth = 1;
	cy_clock_v1_0
		#(.id("433a9115-2609-4ad7-bf43-81b377bd4494"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("20000000000000"),
		  .is_direct(0),
		  .is_digital(1))
		dbnc_CLK
		 (.clock_out(Net_129));
    Counter_v2_40_1 sec_CNTR (
        .reset(Net_838),
        .tc(Net_574),
        .comp(Net_1047),
        .clock(Net_961),
        .interrupt(Net_1048),
        .enable(Net_977),
        .capture(1'b0),
        .upCnt(1'b0),
        .downCnt(1'b0),
        .up_ndown(1'b1),
        .count(Net_1054));
    defparam sec_CNTR.CaptureMode = 0;
    defparam sec_CNTR.ClockMode = 0;
    defparam sec_CNTR.CompareMode = 0;
    defparam sec_CNTR.CompareStatusEdgeSense = 1;
    defparam sec_CNTR.EnableMode = 1;
    defparam sec_CNTR.ReloadOnCapture = 0;
    defparam sec_CNTR.ReloadOnCompare = 0;
    defparam sec_CNTR.ReloadOnOverUnder = 1;
    defparam sec_CNTR.ReloadOnReset = 1;
    defparam sec_CNTR.Resolution = 8;
    defparam sec_CNTR.RunMode = 0;
    defparam sec_CNTR.UseInterrupt = 1;
    assign Net_840 = ~Net_838;
	cy_isr_v1_0
		#(.int_type(2'b00))
		readyTimer_ISR
		 (.int_signal(Net_838));
    Counter_v2_40_2 min_CNTR (
        .reset(Net_838),
        .tc(Net_566),
        .comp(Net_1000),
        .clock(Net_961),
        .interrupt(Net_1001),
        .enable(Net_977),
        .capture(1'b0),
        .upCnt(1'b0),
        .downCnt(1'b0),
        .up_ndown(1'b1),
        .count(Net_574));
    defparam min_CNTR.CaptureMode = 0;
    defparam min_CNTR.ClockMode = 0;
    defparam min_CNTR.CompareMode = 0;
    defparam min_CNTR.CompareStatusEdgeSense = 1;
    defparam min_CNTR.EnableMode = 1;
    defparam min_CNTR.ReloadOnCapture = 0;
    defparam min_CNTR.ReloadOnCompare = 0;
    defparam min_CNTR.ReloadOnOverUnder = 1;
    defparam min_CNTR.ReloadOnReset = 1;
    defparam min_CNTR.Resolution = 8;
    defparam min_CNTR.RunMode = 0;
    defparam min_CNTR.UseInterrupt = 1;
    Timer_v2_70_3 Timer (
        .reset(Net_838),
        .interrupt(Net_816),
        .enable(Net_863),
        .trigger(1'b1),
        .capture(1'b0),
        .capture_out(Net_820),
        .tc(Net_858),
        .clock(Net_961));
    defparam Timer.CaptureCount = 2;
    defparam Timer.CaptureCounterEnabled = 0;
    defparam Timer.DeviceFamily = "PSoC3";
    defparam Timer.InterruptOnCapture = 0;
    defparam Timer.InterruptOnTC = 0;
    defparam Timer.Resolution = 8;
    defparam Timer.SiliconRevision = "3";
    Counter_v2_40_4 tenthSec_CNTR (
        .reset(Net_838),
        .tc(Net_1054),
        .comp(Net_1056),
        .clock(Net_961),
        .interrupt(Net_1057),
        .enable(Net_977),
        .capture(1'b0),
        .upCnt(1'b0),
        .downCnt(1'b0),
        .up_ndown(1'b1),
        .count(Net_862));
    defparam tenthSec_CNTR.CaptureMode = 0;
    defparam tenthSec_CNTR.ClockMode = 0;
    defparam tenthSec_CNTR.CompareMode = 5;
    defparam tenthSec_CNTR.CompareStatusEdgeSense = 1;
    defparam tenthSec_CNTR.EnableMode = 1;
    defparam tenthSec_CNTR.ReloadOnCapture = 0;
    defparam tenthSec_CNTR.ReloadOnCompare = 0;
    defparam tenthSec_CNTR.ReloadOnOverUnder = 1;
    defparam tenthSec_CNTR.ReloadOnReset = 1;
    defparam tenthSec_CNTR.Resolution = 8;
    defparam tenthSec_CNTR.RunMode = 0;
    defparam tenthSec_CNTR.UseInterrupt = 1;
	cy_clock_v1_0
		#(.id("dec4c689-42b4-4657-b0cd-a62772aa3b3f"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("1000000000000"),
		  .is_direct(0),
		  .is_digital(1))
		timer_CLK
		 (.clock_out(Net_961));
    Counter_v2_40_5 hr_CNTR (
        .reset(Net_838),
        .tc(Net_973),
        .comp(Net_974),
        .clock(Net_961),
        .interrupt(Net_976),
        .enable(Net_977),
        .capture(1'b0),
        .upCnt(1'b0),
        .downCnt(1'b0),
        .up_ndown(1'b1),
        .count(Net_566));
    defparam hr_CNTR.CaptureMode = 0;
    defparam hr_CNTR.ClockMode = 0;
    defparam hr_CNTR.CompareMode = 0;
    defparam hr_CNTR.CompareStatusEdgeSense = 1;
    defparam hr_CNTR.EnableMode = 1;
    defparam hr_CNTR.ReloadOnCapture = 0;
    defparam hr_CNTR.ReloadOnCompare = 0;
    defparam hr_CNTR.ReloadOnOverUnder = 1;
    defparam hr_CNTR.ReloadOnReset = 1;
    defparam hr_CNTR.Resolution = 8;
    defparam hr_CNTR.RunMode = 0;
    defparam hr_CNTR.UseInterrupt = 1;
    assign Net_977 = 1'h1;
    assign Net_863 = 1'h1;
    cy_sync_v1_0 SYNC (
        .s_in(Net_858),
        .clock(Net_961),
        .s_out(Net_862));
    defparam SYNC.SignalWidth = 1;
endmodule