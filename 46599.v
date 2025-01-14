module timing_synch_fsm #(parameter FASTCLK_PERIOD = 2.8) (
	input 		fastClk,
	input			slowClk,
	//input 		rst,
	input 		trigSyncExt, //i.e ring clock
	input			trigSyncExt_edge_sel,
	input 		trig,
	input [11:0] trig_delay,
	input [6:0] sample_hold_off,
	input [9:0] num_smpls,
	input [7:0] trigSync_size_b,
	input 		use_trigSyncExt_b,
	/*input [7:0] p1_b1_pos,
	input [7:0] p1_b2_pos,
	input [7:0] p1_b3_pos,
	input [7:0] p2_b1_pos,
	input [7:0] p2_b2_pos,
	input [7:0] p2_b3_pos,
	input [7:0] p3_b1_pos,
	input [7:0] p3_b2_pos,
	input [7:0] p3_b3_pos,*/
	//input [6:0] trig_out_delay,
	//input [7:0] trig_out_delay2,
	`ifdef BUILD_ATF
		input [6:0] trig_out1_delay,
		input [6:0] trig_out2_delay,
		output reg amp_trig1_out = 1'b0,
		output reg amp_trig2_out = 1'b0,
	`endif
	output reg		store_strb_b = 1'b0,
	/*output reg		p1_bunch_strb,
	output reg		p2_bunch_strb,
	output reg		p3_bunch_strb,*/
	//output reg 		state,
	output reg		adc_powerup = 1'b0,
	output reg		adc_align_en = 1'b0,
	output reg		trig_led_strb = 1'b0,
	output reg		clk2_16_led_strb = 1'b0,
	`ifdef XILINX_ISIM
		output reg	[3:0] state = 4'b0100
		//output reg			store_strb = 1'b0
	`else
		output reg	[3:0] state = 4'b0000
		//output reg			store_strb = 1'b0
	`endif
	);
//localparam reg [11:0] WARMUP_TC = (9240/FASTCLK_PERIOD);
localparam [11:0] WARMUP_TC = (9240/FASTCLK_PERIOD);
//localparam WARMUP_TC = 12'd1774;
//parameter trigSync_size = 8'd164;
//parameter use_trigSyncExt = 1'd1;
//parameter trigSyncExt_en = 1'd0;
localparam sync_en = 1'd0;
//parameter num_smpls = 10'd164;
// Internal wires
//wire ring_clk_edge =0;
//wire trig_edge;
// For synchronisation
//reg trig_c=0, trig_d=0;
//reg trig_a=0, trig_b=0, trig_c=0, trig_d=0;
//(* IOB = "TRUE" *) reg trigSyncExt_a=0;
reg trigSyncExt_a=0;
reg trigSyncExt_b = 1'b0, trigSyncExt_c = 1'b0, trigSyncExt_d = 1'b0;
reg trigSyncExt_edge_sel_a = 1'b0, trigSyncExt_edge_sel_b = 1'b0;
reg [11:0] trig_delay_a = 12'd0, trig_delay_b = 12'd0;
reg [6:0] sample_hold_off_a = 7'd0, sample_hold_off_b = 7'd0;
reg [9:0] num_smpls_a = 10'd164, num_smpls_b = 10'd164;
reg [7:0] trigSync_size = 8'd0, trigSync_size_a = 8'd0;
reg use_trigSyncExt = 1'b0, use_trigSyncExt_a = 1'b0;
//Synchronise trigger and ring clock & UART Ctrl signals
always @(posedge fastClk) begin
		trigSyncExt_edge_sel_a <= trigSyncExt_edge_sel;
		trigSyncExt_edge_sel_b <= trigSyncExt_edge_sel_a;
		trig_delay_a <= trig_delay;
		trig_delay_b <= trig_delay_a;
		sample_hold_off_a <= sample_hold_off;
		sample_hold_off_b <= sample_hold_off_a;
		trigSyncExt_a <= trigSyncExt;
		trigSyncExt_b <= trigSyncExt_a;
		trigSyncExt_c <= trigSyncExt_b;
		trigSyncExt_d <= trigSyncExt_c;
		//trig_a <= trig; //synchroniser
		//trig_b <= trig_a;	//metastability guard
		//trig_c <= trig_b;
		//trig_d <= trig_c;
		num_smpls_a <= num_smpls;
		num_smpls_b <= num_smpls_a;
		trigSync_size <= trigSync_size_a;
		trigSync_size_a <= trigSync_size_b;
		use_trigSyncExt <= use_trigSyncExt_a;
		use_trigSyncExt_a <= use_trigSyncExt_b;
end
//Calculate the important timing parameters and register to improve timing
//reg [16:0] end_amp_trig_del;
//reg [16:0] end_amp_trig_del2;
//reg [16:0] trig_out_delay_a;
//reg [16:0] trig_out_delay2_a;
//reg [12:0] start_samp_del;
//reg [16:0] end_samp_del;
//reg [16:0] start_align_del;
//reg [16:0] end_align_del;
//reg [11:0] trig_delay_a;
//always @(posedge fastClk) begin
	//trig_out_delay_a   <= trig_out_delay;
	//trig_out_delay2_a  <= trig_out_delay2;
	//end_amp_trig_del 	<= trig_out_delay + 3;
	//end_amp_trig_del2 <= trig_out_delay2 + 3;
	//start_samp_del 	<= trig_delay + 12'd20;
	//end_samp_del 		<= trig_delay + 22;
	//start_align_del 	<= trig_delay + 24;
	//end_align_del 		<= trig_delay + 584;
	//trig_delay_a 		<= trig_delay;
//end
//Watch for ring clock edges
assign trigSyncExt_edge = trigSyncExt_edge_sel_b ? (trigSyncExt_c & ~trigSyncExt_d) : (~trigSyncExt_c & trigSyncExt_d);
//Watch for trigger rising edge
//assign trig_edge = trig_c & ~trig_d;
//If needed, generate internal ring_clock ctr and synchronise
reg trigSync_counting = 1'b0;
reg trigSync = 1'b0;
reg [7:0] trigSync_ctr = 8'd0;
//Latch the clock startup
always @(posedge fastClk) begin
	if (~trigSync_counting && use_trigSyncExt) trigSync_counting <= trigSyncExt_edge;
	else if (~trigSync_counting) trigSync_counting <= 1'b1;
	else trigSync_counting <= trigSync_counting;
	if (~trigSync_counting) begin
		trigSync_ctr <= 8'd0;
		trigSync <= 1'b0;
		end
	else begin
		if (trigSync_ctr==trigSync_size || (trigSyncExt_edge && sync_en)) begin
			trigSync_ctr <= 8'd0;
			trigSync <= 1'b1;
			end //if
		else begin
			trigSync_ctr <= trigSync_ctr + 1'b1;
			trigSync <= 1'b0;
			end //else
		end //if
	//end
end //always
//reg [16:0] trig_count=17'd0;
reg [11:0] trig_count = 12'd0;
`ifdef XILINX_ISIM
	reg triggered = 1'b1;
	reg sample_en = 1'b1;
`else
	reg triggered = 1'b0;
	reg sample_en = 1'b0;
`endif
//reg sample_en=0;
//reg amp_trig_a, amp_trig2_a, adc_align_en_a;
reg adc_align_en_a = 1'b0;
//state parameterisation (one-hot encoding)
//reg [3:0] state;
localparam IDLE = 4'b0001;
//parameter TRIGGERED = 5'b00001;
localparam WARM_UP = 4'b0010;
localparam SAMPLING = 4'b0100;
localparam ALIGN = 4'b1000;
//parameter POWERDOWN = 5'b10000;
//FSM
reg adc_align_mon_tc_fast_a = 1'b0, adc_align_mon_tc_fast_b = 1'b0;
reg adc_align_mon_tc = 1'b0;
reg sample_en_b = 1'b0;
reg sampling_done = 1'b0;
reg [11:0] warmUp_ctr = 12'd0;
`ifdef BUILD_ATF
	localparam AMP_TRIG_OFFSET = 8'd192;
	(* ASYNC_REG = "TRUE" *) reg [6:0] trig_out1_delay_a = 7'd0, trig_out1_delay_b = 7'd0, trig_out2_delay_a = 7'd0, trig_out2_delay_b = 7'd0;
	reg [11:0] end_amp_trig1_del = 12'd0, end_amp_trig2_del = 12'd0, trig_out1_delay_tot = 12'd0, trig_out2_delay_tot = 12'd0;
	reg [11:0] trig_out_delay_int = 12'd0;
	reg amp_trig1 = 1'b0, amp_trig2 = 1'b0;
`endif
always @(posedge fastClk) begin
	adc_align_mon_tc_fast_a <= adc_align_mon_tc;
	adc_align_mon_tc_fast_b <= adc_align_mon_tc_fast_a;
	sample_en_b <= sample_en;
	`ifdef BUILD_ATF
		//synchonisers for UART signal
		trig_out1_delay_a <= trig_out1_delay;
		trig_out1_delay_b <= trig_out1_delay_a;
		trig_out2_delay_a <= trig_out2_delay;
		trig_out2_delay_b <= trig_out2_delay_a;
		//Registers for pipelieing
		amp_trig1_out <= amp_trig1;
		amp_trig2_out <= amp_trig2;
		// Amplifier timing regs
		trig_out_delay_int <= trig_delay_b - AMP_TRIG_OFFSET;
		trig_out1_delay_tot <= trig_out_delay_int + trig_out1_delay_b;
		trig_out2_delay_tot <= trig_out_delay_int + trig_out2_delay_b;
		end_amp_trig1_del <= trig_out1_delay_tot + 2'd2;
		end_amp_trig2_del <= trig_out2_delay_tot + 2'd2;
	`endif
	if (~triggered) begin
		//trig_count <= 17'd0;
		trig_count <= 12'd0;
		warmUp_ctr <= 12'd0;
		//triggered <= trig_edge;
		triggered <= trig;
		state <= IDLE;
		adc_powerup <= adc_powerup;
		sample_en <= sample_en;
		adc_align_en_a <= adc_align_en_a;
		end
	else begin
		//Trigger edge detected.  Begin counting ring clock cycles
		if (trigSync) trig_count <= trig_count + 1;
		else trig_count <= trig_count;
		`ifdef BUILD_ATF
			if (trig_count == trig_out1_delay_tot) amp_trig1 <= 1'b1;
			else if (trig_count == end_amp_trig1_del) amp_trig1 <= 1'b0;
			else amp_trig1 <= amp_trig1;
			if (trig_count == trig_out2_delay_tot) amp_trig2 <= 1'b1;
			else if (trig_count == end_amp_trig2_del) amp_trig2 <= 1'b0;
			else amp_trig2 <= amp_trig2;
		`endif
		case (state)
			IDLE: begin
				warmUp_ctr <= warmUp_ctr;
				if (trig_count == trig_delay_b) begin // next state logic
					triggered <= triggered;
					state <= WARM_UP;
					adc_powerup <= 1'b1;
					sample_en <= sample_en;
					adc_align_en_a <= adc_align_en_a;
					end
				else begin //current state logic
					triggered <= triggered;
					state <= state;
					adc_powerup <= adc_powerup;
					sample_en <= sample_en;
					adc_align_en_a <= adc_align_en_a;
					end
				end
			WARM_UP: begin
				warmUp_ctr <= warmUp_ctr + 1'd1;
				//if (trig_count == trig_delay_b + 12'd20) begin // next state logic
				//if (warmUp_ctr == 12'd3300) begin // next state logic
				//if (warmUp_ctr == 12'd1774) begin // next state logic
				if (warmUp_ctr == WARMUP_TC) begin // next state logic
					triggered <= triggered;
					state <= SAMPLING;
					adc_powerup <= adc_powerup;
					sample_en <= 1'b1;
					adc_align_en_a <= adc_align_en_a;
					end
				else begin //current state logic
					triggered <= triggered;
					state <=state;
					adc_powerup <= adc_powerup;
					sample_en <= sample_en;
					adc_align_en_a <= adc_align_en_a;
					end
				end
			SAMPLING: begin
				warmUp_ctr <= warmUp_ctr;
				if (sampling_done) begin // next state logic
					triggered <= triggered;
					state <= ALIGN;
					adc_powerup <= adc_powerup;
					sample_en <= 1'b0;
					adc_align_en_a <= 1'b1;
					end
				else begin //current state logic
					triggered <= triggered;
					state <=state;
					adc_powerup <= adc_powerup;
					sample_en <= sample_en;
					adc_align_en_a <= adc_align_en_a;
					end
				end
			ALIGN: begin
				warmUp_ctr <= warmUp_ctr;
				if (adc_align_mon_tc_fast_b) begin //next state logic
					triggered <= 1'b0;
					state <= IDLE;
					adc_powerup <= 1'b0;
					sample_en <= sample_en;
					adc_align_en_a <= 1'b0;
					end
				else begin //current state logic
					triggered <= triggered;
					state <= state;
					adc_powerup <= adc_powerup;
					sample_en <= sample_en;
					adc_align_en_a <= adc_align_en_a;
					end
				end
			default: begin
				warmUp_ctr <= warmUp_ctr;
				triggered <= triggered;
				state <= IDLE;
				adc_powerup <= adc_powerup;
				sample_en <= sample_en;
				adc_align_en_a <= adc_align_en_a;
				end
			endcase
		end //else if (~triggered)
	end //always
//assign align_complete =
//counter for ending alignment monitors (running on 40 MHz for now to ease timing)
reg adc_align_en_slow_a = 1'b0, adc_align_en_slow_b = 1'b0, adc_align_en_slow_c = 1'b0, adc_align_en_slow_d = 1'b0;
reg align_mon_counting = 1'b0;
reg [13:0] align_mon_ctr = 14'd0;
wire adc_align_en_slow;
always @(posedge slowClk) begin
	/*if (rst) begin // puttinjg everything under sync rst might be dangerous - think about!
		adc_align_en_slow_a <= 1'b0;
		adc_align_en_slow_b <= 1'b0;
		adc_align_en_slow_c <= 1'b0;
		adc_align_en_slow_d <= 1'b0;
		adc_align_mon_tc <= 1'b0;
		align_mon_counting <= 1'b0;
		align_mon_ctr <= 14'd0;
		end //if rst
	else begin*/
		adc_align_en_slow_a <= adc_align_en_a;
		adc_align_en_slow_b <= adc_align_en_slow_a;
		adc_align_en_slow_c <= adc_align_en_slow_b;
		adc_align_en_slow_d <= adc_align_en_slow_c;
		adc_align_mon_tc <= (align_mon_ctr == 14'd10000);
		if (~align_mon_counting) begin
			align_mon_counting <= adc_align_en_slow;
			align_mon_ctr <= 14'd0;
			end // if ~align_mon_counting
		//else if (adc_align_en_slow) begin
		else begin
			align_mon_ctr <= align_mon_ctr + 14'd1;
			align_mon_counting <= (adc_align_mon_tc) ? 1'd0 : align_mon_counting;
			/*if (align_mon_ctr == adc_align_mon_tc) begin
			align_mon_counting <= 1'd0;
			align_mon_ctr <= 14'd0;
			end // else if align_mon_ctr == adc_align_mon_tc
		else begin
			align_mon_counting <= align_mon_counting;
			align_mon_ctr <= align_mon_ctr + 14'd1;*/
			end // else
		//end // else (if rst)
	end //always
	//end
assign adc_align_en_slow = adc_align_en_slow_c & ~adc_align_en_slow_d;
/*			if (trig_edge) begin
				state <= TRIGGERED;
				trig_count <= 17'd0;
				end else begin
				state <= state;
				trig_count <= trig_count;
				end
		TRIGGERED: begin
			if
			if (trig_count == trig_del_a) begin
				state <= WARM_UP;
				trig_count <= */
/*always @(posedge fastClk) begin
		//Wait for the trigger edge
		if (~triggered) begin
			trig_count <= 0;
			triggered <= trig_edge;
		end else begin
			//Trigger edge detected.  Begin counting ring clock cycles
			if (ring_clk_edge) begin
				trig_count <= trig_count + 1;
			end
			//Output the amp trigger when ready
			if (trig_count == trig_out_delay_a)	amp_trig_a <= 1;
			if (trig_count == end_amp_trig_del) amp_trig_a <= 0;
			if (trig_count == trig_out_delay2_a)	amp_trig2_a <= 1;
			if (trig_count == end_amp_trig_del2)   amp_trig2_a <= 0;
			//Output the adc control signals when ready
			case(trig_count)
				trig_delay_a:		adc_powerup <= 1;
				start_samp_del:	sample_en <= 1;
				end_samp_del:		sample_en <= 0;
				start_align_del:	adc_align_en_a <= 1;
				end_align_del: begin
					adc_align_en_a <= 0;
					adc_powerup <= 0;
					triggered <= 0;
				end
			endcase
		end
	//end
end*/
// Pipeline for timing
always @(posedge fastClk) begin ///thid might be pointless
	adc_align_en <= adc_align_en_a;
	//amp_trig <= amp_trig_0;
	//amp_trig2 <= amp_trig2_0;
end
// BUNCH AND STORE STROBE COUNTERS - removed bunch strobe counters but kept store strobe as is for now
// Count 357 cycles.  This is done seperately for each ADC group
// to duplicate the count register and aid timing
// Store_strb is generated in the P1 loop
//reg [8:0] start_store = 9'd0;
//reg [8:0] end_store = 9'd0;
//wire [8:0] start_store;
//wire [10:0] end_store;
reg [6:0] start_store = 7'd0;
reg [10:0] end_store = 11'd163;
//assign start_store = sample_hold_off_b;
//assign end_store = sample_hold_off_b + num_smpls_b;
//assign end_store = sample_hold_off_b + 8'd164;
/*reg [8:0] p1_b1_abs_pos;
reg [8:0] p1_b2_abs_pos;
reg [8:0] p1_b3_abs_pos;
reg [8:0] p2_b1_abs_pos;
reg [8:0] p2_b2_abs_pos;
reg [8:0] p2_b3_abs_pos;
reg [8:0] p3_b1_abs_pos;
reg [8:0] p3_b2_abs_pos;
reg [8:0] p3_b3_abs_pos;
reg [8:0] p1_b1_abs_pos_a;
reg [8:0] p1_b2_abs_pos_a;
reg [8:0] p1_b3_abs_pos_a;
reg [8:0] p2_b1_abs_pos_a;
reg [8:0] p2_b2_abs_pos_a;
reg [8:0] p2_b3_abs_pos_a;
reg [8:0] p3_b1_abs_pos_a;
reg [8:0] p3_b2_abs_pos_a;
reg [8:0] p3_b3_abs_pos_a;*/
//reg [8:0] p1_sample_count;
reg [10:0] sample_count = 11'd0; //9-bit counter on 357 = 512 samples (need to set to paremater of input values)
//reg [8:0] p2_sample_count;
//reg [8:0] p3_sample_count;
//reg p1_counting, p2_counting, p3_counting;
reg sample_counting = 1'b0;
//reg sampling_done = 0;
// Calculate important p1 values to aid timing and pipeline
/*always @(posedge fastClk) begin
	start_store <= sample_hold_off;
	end_store <= sample_hold_off + 164; // ** need the number of samples here **
	p1_b1_abs_pos <= p1_b1_pos + sample_hold_off;
	p1_b2_abs_pos <= p1_b2_pos + sample_hold_off;
	p1_b3_abs_pos <= p1_b3_pos + sample_hold_off;
	p1_b1_abs_pos_a <= p1_b1_abs_pos;
	p1_b2_abs_pos_a <= p1_b2_abs_pos;
	p1_b3_abs_pos_a <= p1_b3_abs_pos;*/
//end*/
/*always @(posedge fastClk) begin
//	if (rst) begin
//		p1_sample_count <= 0;
//		store_strb <= 0;
//		p1_counting <= 0;
//	end else begin
		//Reset bunch strobes each cycle
		//p1_bunch_strb <= 0;
		if ((sample_en) && (~p1_counting)) begin
			p1_counting <= 1;
		end else begin
			if (p1_counting) begin
				p1_sample_count <= p1_sample_count + 1;
				case(p1_sample_count)
					start_store: begin
//						p1_sample_count <= p1_sample_count + 1;
						store_strb <= 1;
					end
//					p1_b1_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end
					p1_b2_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end
					p1_b3_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end			*/
					//end_store: begin
					//	store_strb <= 0;
//						p1_sample_count <= p1_sample_count + 1;
					//end
					//511: begin
					//	p1_counting <= 0;
					//	p1_sample_count <= 0;
					//end
//					default:		p1_sample_count <= p1_sample_count + 1;
				//endcase
			//end
		//end
	//end
//end
reg store_strb = 1'b0;
always @(posedge fastClk) begin
	//start_store <= sample_hold_off_b;
	//end_store <= sample_hold_off_b + 164; // ** need the number of samples here **
	start_store <= sample_hold_off_b;
	end_store <= sample_hold_off_b + num_smpls_b;
	store_strb_b <= store_strb;
	if (~sample_counting) begin
		sample_counting <= (sample_en & ~ sample_en_b) ? 1 : 0;
		sample_count <= 0;
		store_strb <= store_strb;
		sampling_done <= 0;
	end else begin
		//if (sample_counting) begin
			sample_count <= sample_count + 1'b1;
			case (sample_count)
				{4'b0000, start_store}: begin
					sample_counting <= sample_counting;
					store_strb <= 1'b1;
					sampling_done <= sampling_done;
					end
				end_store: begin
					sample_counting <= 1'b0;
					store_strb <= 1'b0;
					sampling_done <= 1;
					end
				//max-size counting state to reset everything (should be never executed, only if end state is missed)
				default: begin
					sample_counting <= sample_counting;
 					store_strb <= store_strb;
					sampling_done <= sampling_done;
					end
			endcase
		/*end else begin
			sample_counting <= sample_counting;
			sample_count <= sample_count;
			store_strb <= store_strb;
			sampling_done <= sampling_done;
			end // else if (~sample_counting) begin*/
		end //
	end //always
/ Calculate important p2 values to aid timing and pipeline
always @(posedge fastClk) begin
	//end_store <= sample_hold_off + 164;
	p2_b1_abs_pos <= p2_b1_pos + sample_hold_off;
	p2_b2_abs_pos <= p2_b2_pos + sample_hold_off;
	p2_b3_abs_pos <= p2_b3_pos + sample_hold_off;
	p2_b1_abs_pos_a <= p2_b1_abs_pos;
	p2_b2_abs_pos_a <= p2_b2_abs_pos;
	p2_b3_abs_pos_a <= p2_b3_abs_pos;
end
always @(posedge fastClk) begin
//	if (rst) begin
		p2_sample_count <= 0;
		p2_counting <= 0;
	end else begin*/
		//Reset bunch strobes each cycle
//		p2_bunch_strb <= 0;
//		if ((sample_en) && (~p2_counting)) begin
//			p2_counting <= 1;
//		end else begin
//			if (p2_counting) begin
//				p2_sample_count <= p2_sample_count + 1;
//				case(p2_sample_count)
//					p2_b1_abs_pos_a: begin
//						p2_bunch_strb <= 1;
//					end
//					p2_b2_abs_pos_a: begin
//						p2_bunch_strb <= 1;
//					end
//					p2_b3_abs_pos_a: begin
//						p2_bunch_strb <= 1;
//					end
//					511: begin
//						p2_counting <= 0;
//						p2_sample_count <= 0;
//					end
//				endcase
//			end
//		end
//	//end
//end
//always @(posedge fastClk) begin
//	//end_store <= sample_hold_off + 164;
//	p3_b1_abs_pos <= p3_b1_pos + sample_hold_off;
//	p3_b2_abs_pos <= p3_b2_pos + sample_hold_off;
//	p3_b3_abs_pos <= p3_b3_pos + sample_hold_off;
//	p3_b1_abs_pos_a <= p3_b1_abs_pos;
//	p3_b2_abs_pos_a <= p3_b2_abs_pos;
//	p3_b3_abs_pos_a <= p3_b3_abs_pos;
//end
//always @(posedge fastClk) begin
//	/*if (rst) begin
//		p3_sample_count <= 0;
//		p3_counting <= 0;
//	end else begin*/
//		//Reset bunch strobes each cycle
//		p3_bunch_strb <= 0;
//		if ((sample_en) && (~p3_counting)) begin
//			p3_counting <= 1;
//		end else begin
//			if (p3_counting) begin
//				p3_sample_count <= p3_sample_count + 1;
//				case(p3_sample_count)
//					p3_b1_abs_pos_a: begin
//						p3_bunch_strb <= 1;
//					end
//					p3_b2_abs_pos_a: begin
//						p3_bunch_strb <= 1;
//					end
//					p3_b3_abs_pos_a: begin
//						p3_bunch_strb <= 1;
//					end
//					511: begin
//						p3_counting <= 0;
//						p3_sample_count <= 0;
//					end
//				endcase
//			end
//		end
//	//end
//end*/
// LEDs for trig and ring clock present on front panel - slightly modified from orignal but names left
// unchanged (GBC - 14/08/2012)
// Send a 32 cycle strobe to light an LED on each trigger edge
reg [4:0] trig_led_count = 5'd0;
//reg		 trig_led_strb;
always @(posedge fastClk) begin
	/*if (rst) begin
		trig_led_count <= 0;
		trig_led_strb <= 0;
	end else begin*/
		case (trig_led_count)
			//5'd0: if (trig_edge) begin
			5'd0: if (trig) begin
				trig_led_count <= 5'd1;
				trig_led_strb <= trig_led_strb;
				end else begin
				trig_led_count <= trig_led_count;
				trig_led_strb <= trig_led_strb;
				end
			5'd1: begin
				trig_led_strb <= 1;
				trig_led_count <= trig_led_count + 1;
			end
			5'd31: begin
				trig_led_strb <= 0;
				trig_led_count <= 0;
			end
			default: begin
				trig_led_count <= trig_led_count + 1;
				trig_led_strb <= trig_led_strb;
				end
		endcase
	//end
end
// Send a 32 cycle strobe to light an LED on each ring clock edge
reg [4:0] clk2_16_led_count = 5'd0;
//reg		 clk2_16_led_strb;
always @(posedge fastClk) begin
	/*if (rst) begin
		clk2_16_led_count <= 0;
		clk2_16_led_strb <= 0;
	end else begin*/
		case (clk2_16_led_count)
			5'd0: if (trigSync) begin
				clk2_16_led_count <= 5'd1;
				clk2_16_led_strb <= clk2_16_led_strb;
				end else begin
				clk2_16_led_count <= clk2_16_led_count;
				clk2_16_led_strb <= clk2_16_led_strb;
				end
			5'd1: begin
				clk2_16_led_strb <= 1;
				clk2_16_led_count <= clk2_16_led_count + 1;
			end
			5'd31: begin
				clk2_16_led_strb <= 0;
				clk2_16_led_count <= 0;
			end
			default: begin
				clk2_16_led_count <= clk2_16_led_count + 1;
				clk2_16_led_strb <= clk2_16_led_strb;
				end
		endcase
	//end
end
endmodule