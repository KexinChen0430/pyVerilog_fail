module to do combination ahead of the gain stage //
parameter real CLK_FREQ = 357e6;
parameter real SUB_PULSE_LENGTH = 280e-9;
localparam [9:0] PULSE_LENGTH = (CLK_FREQ * SUB_PULSE_LENGTH * 4); //think about how to generalise this! - just use full_pulse length OR 140ns * CF?
//Form output gate
(* shreg_extract = "no" *) reg [9:0] opGate_ctr = 10'd0;
(* shreg_extract = "no" *) reg opGate = 1'b0;
`ifdef COMBINE
   localparam OFFSET_DELAY = 4'd10; // Override value - includes the 2 cycle delay from the Combiner Module
	wire [9:0] startProc = (~opMode[1]) ? start_proc : end_proc - PULSE_LENGTH;
`else
	localparam OFFSET_DELAY = 4'd8; // Override value - includes the 2 cycle delay from the Combiner Module
	wire [9:0] startProc = start_proc;
`endif
always @(posedge clk) begin
	opGate_ctr <= (store_strb) ? opGate_ctr + 1'b1 : 11'd0;
	if (store_strb) begin
		//(* full_case, parallel_case *)
		case (opGate_ctr)
			startProc: opGate <= 1'b1;
			end_proc: opGate <= 1'b0;
			default: opGate <= opGate;
		endcase
	end else begin
		opGate <= 1'b0;
		end
end
`ifdef COMBINE
	//Instance Combiner Module 1 (Diode)
	//FOR NOW DO NOT DO COMBINING ON DIODE - just add compensating delays
	(* keep = "yes" *) reg signed [17:0] lutReg_d = 18'sd0, lutReg_e = 18'sd0;
	always @(posedge clk) begin
		lutReg_d <= lutReg_c;
		lutReg_e <= lutReg_d;
		end
	wire signed [17:0] normMult_DiodeIn = lutReg_e;
	/*wire signed [15:0] DiodeComb;
	reg signed [15:0] DiodeIn_a = 16'sd0, DiodeIn_b = 16'sd0;
	(* shreg_extract = "no" *) reg integ_gate = 1'b0;
	Combiner #(CLK_FREQ, SUB_PULSE_LENGTH) Combiner1(.clk(clk), .din(DiodeIn), .integ(integ_gate), .bypass(1'b0), .dout(DiodeComb));
	always @(posedge clk) begin
		DiodeIn_b <= DiodeIn_a;
		DiodeIn_a <= DiodeIn;
		integ_gate <= opGate;
		end
	wire signed [15:0] normMult_DiodeIn = (~opMode[1]) ? DiodeIn_b : DiodeComb;*/
	//Instance Combiner Module 2 (Mixer)
	wire signed [15:0] MixerComb;
	(* keep = "yes" *) reg signed [15:0] MixerIn_a = 16'sd0, MixerIn_b = 16'sd0;
	//(* shreg_extract = "no" *) reg integ_gate = 1'b0;
	Combiner #(CLK_FREQ, SUB_PULSE_LENGTH) Combiner1(.clk(clk), .din(MixerIn), .integ(opGate), .bypass(1'b0), .dout(MixerComb));
	always @(posedge clk) begin
		MixerIn_b <= MixerIn_a;
		MixerIn_a <= MixerIn;
		//integ_gate <= opGate;
		end
	wire signed [15:0] normMult_MixerIn = (~opMode[1]) ? MixerIn_b : MixerComb;
`else
	wire signed [15:0] normMult_MixerIn = MixerIn; // Possibly remove bypass option later!
	wire signed [17:0] normMult_DiodeIn = lutReg_c; // Possibly remove bypass option later!
`endif
// END GATE and COMBINER
// Apply Kicker 1 Gain
wire signed [15:0] kick1_gainMult;
wire kick1_oflowDet;
normMult #(GAIN_SCALE, GAIN_OFFSET, GAIN_MSB, DIODE_SCALE) kick1Mult(clk, useDiode, oflowMode, normMult_DiodeIn, normMult_MixerIn, kick1_gain, kick1_gainMult, kick1_oflowDet);
// Apply Kicker 2 Gain
wire signed [15:0] kick2_gainMult;
wire kick2_oflowDet;
normMult #(GAIN_SCALE, GAIN_OFFSET, GAIN_MSB, DIODE_SCALE) kick2Mult(clk, useDiode, oflowMode, normMult_DiodeIn, normMult_MixerIn, kick2_gain, kick2_gainMult, kick2_oflowDet);
parameter LOOP2_GAIN_SCALE = -4; //sets the scale factor for the gain; e.g. 128 ADC cnts maps to 2048 at DAC for GAIN_SCALE = -4 //
//parameter LOOP2_GAIN_OFFSET = 5; // maps ADC counts to DAC counts for the mid-range of the gain (i.e. 2^5 for 7-bit gain) // 7-bit gain //
//parameter LOOP2_GAIN_OFFSET = 12; // maps ADC counts to DAC counts for the mid-range of the gain (i.e. 2^5 for 7-bit gain) // 14-bit gain //
parameter LOOP2_GAIN_OFFSET = 10; // maps ADC counts to DAC counts for the mid-range of the gain (i.e. 2^5 for 7-bit gain) // 14-bit gain //
//parameter LOOP2_GAIN_MSB = 23; // 7-bit gain // sets the MSB of the gain multipication (i.e. 16-bit x 7-bit = 23-bit + 1 bit for overflow detection = 24-bit) //
parameter LOOP2_GAIN_MSB = 30; // 14-bit gain // sets the MSB of the gain multipication (i.e. 16-bit x 7-bit = 23-bit + 1 bit for overflow detection = 24-bit) //
parameter LOOP2_DIODE_SCALE = 4; // set to compensate the scale factor when using diode normalisation (eg. if diode =1000, sqrt(diode)~32, factor = 5 - 2 bits already included in LUT, -1 bit MSB)//
//Instance LUTROM BRAM core
LUTROM LUT2(
	.clka(clk),
	.addra(loop2_diodeIn),
	.douta(loop2_lutReg)
	);
// For loop 2 just comprensate for the delays!!
`ifdef COMBINE
	//Instance Combiner Module 1 (Diode)
	//FOR NOW DO NOT DO COMBINING ON DIODE - just add compensating delays
	(* keep = "yes" *) reg signed [17:0] loop2_lutReg_d = 18'sd0, loop2_lutReg_e = 18'sd0;
	always @(posedge clk) begin
		loop2_lutReg_d <= loop2_lutReg_c;
		loop2_lutReg_e <= loop2_lutReg_d;
		end
	wire signed [17:0] loop2_normMult_DiodeIn = loop2_lutReg_e;
	//Instance Combiner Module 2 (Mixer)
	(* keep = "yes" *) reg signed [15:0] loop2_MixerIn_a = 16'sd0, loop2_MixerIn_b = 16'sd0;
	always @(posedge clk) begin
		loop2_MixerIn_a <= loop2_MixerIn;
		loop2_MixerIn_b <= loop2_MixerIn_a;
		end
	wire signed [15:0] loop2_normMult_MixerIn = loop2_MixerIn_b;
`else
	wire signed [15:0] loop2_normMult_MixerIn = loop2_MixerIn; // Possibly remove bypass option later!
	wire signed [17:0] loop2_normMult_DiodeIn = loop2_lutReg_c; // Possibly remove bypass option later!
`endif
// Apply Kicker 1 Gain
wire signed [15:0] loop2_kick1_gainMult;
wire loop2_kick1_oflowDet;
normMult #(LOOP2_GAIN_SCALE, LOOP2_GAIN_OFFSET, LOOP2_GAIN_MSB, LOOP2_DIODE_SCALE) loop2_kick1Mult(clk, loop2_useDiode, oflowMode, loop2_normMult_DiodeIn, loop2_normMult_MixerIn, loop2_kick1_gain, loop2_kick1_gainMult, loop2_kick1_oflowDet);
// Apply Kicker 2 Gain
wire signed [15:0] loop2_kick2_gainMult;
wire loop2_kick2_oflowDet;
normMult #(LOOP2_GAIN_SCALE, LOOP2_GAIN_OFFSET, LOOP2_GAIN_MSB, LOOP2_DIODE_SCALE) loop2_kick2Mult(clk, loop2_useDiode, oflowMode, loop2_normMult_DiodeIn, loop2_normMult_MixerIn, loop2_kick2_gain, loop2_kick2_gainMult, loop2_kick2_oflowDet);
/*always @(posedge clk) begin
	multReg <= mult;
	if (oflowDetect && oflowClr) oflowDetect <= 1'b0;
	else if (!(&multReg[43:29] || &(~multReg[43:29]))) oflowDetect <= 1'b1; //check for all ones or all zeros in overflow bits
	else oflowDetect <= oflowDetect;
end*/
//Combinatorial always block for ampDrive input signals
//wire signed [16:0] kick1_drive = kick1_gainMult + loop2_kick1_gainMult;
reg signed [16:0] kick1_drive = 17'sd0;//kick1_gainMult + loop2_kick1_gainMult;
reg signed [15:0] kick1_drive_b = 16'sd0;
//wire signed [16:0] kick2_drive = kick2_gainMult + loop2_kick2_gainMult;
reg signed [16:0] kick2_drive = 17'sd0;//kick2_gainMult + loop2_kick2_gainMult;
reg signed [15:0] kick2_drive_b = 16'sd0;
reg kick1_drive_oflowDet = 1'b0, kick2_drive_oflowDet = 1'b0;
always @(posedge clk) begin
	kick1_drive <= kick1_gainMult + loop2_kick1_gainMult;
	kick2_drive <= kick2_gainMult + loop2_kick2_gainMult;
	end
/*always @(*) begin
	if (^kick1_drive[16:15]) begin
		kick1_drive_oflowDet = 1'b1;
		(* full_case, parallel_case *)
		case(oflowMode)
		2'b00: kick1_drive_b = kick1_drive[15:0];
		2'b01: kick1_drive_b = 16'sd0;
		2'b10: kick1_drive_b = (kick1_drive[16]) ? -16'sd32768 : 16'sd32767;
		//default: kick1_drive_b = 16'sd0;
		endcase
	end else begin
		kick1_drive_b = kick1_drive[15:0];
		kick1_drive_oflowDet = 1'b0;
		end
end*/
always @(*) begin
	if (^kick1_drive[16:15]) begin
		//if (^kick1_drive[16:15] || (kick1_drive[15:3] > amp1lim) || (kick1_drive[15:13] < ~amp1lim)) begin
		kick1_drive_oflowDet = 1'b1;
		(* full_case, parallel_case *)
		case(oflowMode)
		2'b00: kick1_drive_b = kick1_drive[15:0];
		2'b01: kick1_drive_b = 16'sd0;
		//2'b10: kick1_drive_b = (kick1_drive[16]) ? {~amp1lim, 3'b111} : {amp1lim, 3'b111};
		2'b10: kick1_drive_b = (kick1_drive[16]) ? -16'sd32768 : 16'sd32767;
		//default: kick1_drive_b = 16'sd0;
		endcase
	end else begin
		kick1_drive_b = kick1_drive[15:0];
		kick1_drive_oflowDet = 1'b0;
		end
end
/*always @(posedge clk) begin
	//kick1_drive <= kick1_gainMult + loop2_kick1_gainMult;
	if (^kick1_drive[16:15]) begin
		kick1_drive_oflowDet <= 1'b1;
		(* full_case, parallel_case *)
		case(oflowMode)
		2'b00: kick1_drive_b <= kick1_drive[15:0];
		2'b01: kick1_drive_b <= 16'sd0;
		2'b10: kick1_drive_b <= (kick1_drive[16]) ? -16'sd32768 : 16'sd32767;
		default: kick1_drive_b <= 16'sd0;
		endcase
	end else begin
		kick1_drive_b <= kick1_drive[15:0];
		kick1_drive_oflowDet <= 1'b0;
		end
end*/
always @(*) begin
	if (^kick2_drive[16:15]) begin
		kick2_drive_oflowDet = 1'b1;
		(* full_case, parallel_case *)
		case(oflowMode)
		2'b00: kick2_drive_b = kick2_drive[15:0];
		2'b01: kick2_drive_b = 16'sd0;
		2'b10: kick2_drive_b = (kick2_drive[16]) ? -16'sd32768 : 16'sd32767;
		//default: kick2_drive_b = 16'sd0;
		endcase
	end else begin
	kick2_drive_b = kick2_drive[15:0];
	kick2_drive_oflowDet = 1'b0;
	end
end
/*always @(posedge clk) begin
	//kick2_drive <= kick2_gainMult + loop2_kick2_gainMult;
	if (^kick2_drive[16:15]) begin
		kick2_drive_oflowDet <= 1'b1;
		(* full_case, parallel_case *)
		case(oflowMode)
		2'b00: kick2_drive_b <= kick2_drive[15:0];
		2'b01: kick2_drive_b <= 16'sd0;
		2'b10: kick2_drive_b <= (kick2_drive[16]) ? -16'sd32768 : 16'sd32767;
		default: kick2_drive_b <= 16'sd0;
		endcase
	end else begin
	kick2_drive_b <= kick2_drive[15:0];
	kick2_drive_oflowDet <= 1'b0;
	end
end*/
// Instance the DriveOutput modules //
wire DAC1_IIR_oflowDet, DAC2_IIR_oflowDet;
ampDrive #(.OFFSET_DELAY(OFFSET_DELAY)) kick1Drive(clk, feedfwd_en, (store_strb && (opGate || ~use_strobes)), opMode[0], kick1_delay, kick1_constDac_val, kick1_drive_b, DAC1clkPhase, DAC1_IIRtapWeight, DAC1_IIR_oflowDet, kick1_dout, DAC1_en);
ampDrive #(.OFFSET_DELAY(OFFSET_DELAY)) kick2Drive(clk, feedfwd_en, (store_strb && (opGate || ~use_strobes)), opMode[0], kick2_delay, kick2_constDac_val, kick2_drive_b, DAC2clkPhase, DAC2_IIRtapWeight, DAC2_IIR_oflowDet, kick2_dout, DAC2_en);
reg kick1_oflowDet_a = 1'b0, kick2_oflowDet_a = 1'b0;
always @(posedge clk) begin
	kick1_oflowDet_a <= kick1_oflowDet;
	kick2_oflowDet_a <= kick2_oflowDet;
	oflowDetect <= (kick1_oflowDet_a | kick2_oflowDet_a | loop2_kick1_oflowDet | loop2_kick2_oflowDet | kick1_drive_oflowDet | kick2_drive_oflowDet | DAC1_IIR_oflowDet | DAC2_IIR_oflowDet);
end
endmodule