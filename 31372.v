module FB_BfbOneWayCtrl
(
		input wire clk,
		//input events
		input wire Tick_eI,
		input wire SpecialInstr_eI,
		input wire BeginSeq_eI,
		input wire PedStatusChange_eI,
		//output events
		output wire DoneSeq_eO,
		output wire PedGrant_eO,
		output wire LightCtrlChange_eO,
		//input variables
		input wire  HoldGreen_I,
		input wire  PedRequest_I,
		input wire  PedRunning_I,
		//output variables
		output reg  LightRed_O  = 0,
		output reg  LightYellow_O  = 0,
		output reg  LightGreen_O  = 0,
		input reset
);
//input events
wire Tick;
assign Tick = Tick_eI;
wire SpecialInstr;
assign SpecialInstr = SpecialInstr_eI;
wire BeginSeq;
assign BeginSeq = BeginSeq_eI;
wire PedStatusChange;
assign PedStatusChange = PedStatusChange_eI;
//output events
reg DoneSeq;
assign DoneSeq_eO = DoneSeq;
reg PedGrant;
assign PedGrant_eO = PedGrant;
reg LightCtrlChange;
assign LightCtrlChange_eO = LightCtrlChange;
//input variables
reg  HoldGreen  = 0;
reg  PedRequest  = 0;
reg  PedRunning  = 0;
//output variables
reg  LightRed  = 0;
reg  LightYellow  = 0;
reg  LightGreen  = 0;
reg  unsigned [31:0] d  = 0;
reg  unsigned [31:0] greenTicks  = 15000000;
reg  unsigned [31:0] yellowTicks  = 5000000;
reg  unsigned [31:0] redTicks  = 2000000;
//BEGIN STATE variables
reg [2:0] state = `STATE_s_init;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg s_green_alg0_alg_en = 1'b0;
reg s_green_count_alg0_alg_en = 1'b0;
reg s_yellow_alg0_alg_en = 1'b0;
reg s_yellow_count_alg0_alg_en = 1'b0;
reg s_red_alg0_alg_en = 1'b0;
reg s_red_count_alg0_alg_en = 1'b0;
reg LightsRed_alg_en = 1'b0;
reg LightsYellow_alg_en = 1'b0;
reg LightsGreen_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_s_init;
		//reset I/O registers
		DoneSeq = 1'b0;
		PedGrant = 1'b0;
		LightCtrlChange = 1'b0;
		HoldGreen = 0;
		PedRequest = 0;
		PedRunning = 0;
		LightRed = 0;
		LightYellow = 0;
		LightGreen = 0;
		//reset internal vars
		d = 0;
		greenTicks = 15000000;
		yellowTicks = 5000000;
		redTicks = 2000000;
	end else begin
		//BEGIN clear output events
		DoneSeq = 1'b0;
		PedGrant = 1'b0;
		LightCtrlChange = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		if(SpecialInstr) begin
			HoldGreen = HoldGreen_I;
		end
		if(PedStatusChange) begin
			PedRequest = PedRequest_I;
			PedRunning = PedRunning_I;
		end
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_s_init: begin
				if(1) begin
					state = `STATE_s_wait;
					entered = 1'b1;
				end
			end
			`STATE_s_wait: begin
				if(BeginSeq) begin
					state = `STATE_s_green;
					entered = 1'b1;
				end
			end
			`STATE_s_green: begin
				if(1) begin
					state = `STATE_s_green_count;
					entered = 1'b1;
				end
			end
			`STATE_s_green_count: begin
				if(d > greenTicks && HoldGreen == 0 && PedRunning == 0) begin
					state = `STATE_s_yellow;
					entered = 1'b1;
				end else if(Tick) begin
					state = `STATE_s_green_count;
					entered = 1'b1;
				end
			end
			`STATE_s_yellow: begin
				if(1) begin
					state = `STATE_s_yellow_count;
					entered = 1'b1;
				end
			end
			`STATE_s_yellow_count: begin
				if(d > yellowTicks) begin
					state = `STATE_s_red;
					entered = 1'b1;
				end else if(Tick) begin
					state = `STATE_s_yellow_count;
					entered = 1'b1;
				end
			end
			`STATE_s_red: begin
				if(1) begin
					state = `STATE_s_red_count;
					entered = 1'b1;
				end
			end
			`STATE_s_red_count: begin
				if(d > redTicks) begin
					state = `STATE_s_wait;
					entered = 1'b1;
				end else if(Tick) begin
					state = `STATE_s_red_count;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		s_green_alg0_alg_en = 1'b0;
		s_green_count_alg0_alg_en = 1'b0;
		s_yellow_alg0_alg_en = 1'b0;
		s_yellow_count_alg0_alg_en = 1'b0;
		s_red_alg0_alg_en = 1'b0;
		s_red_count_alg0_alg_en = 1'b0;
		LightsRed_alg_en = 1'b0;
		LightsYellow_alg_en = 1'b0;
		LightsGreen_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_s_init: begin
				end
				`STATE_s_wait: begin
					LightCtrlChange = 1'b1;
					DoneSeq = 1'b1;
					LightsRed_alg_en = 1'b1;
				end
				`STATE_s_green: begin
					LightCtrlChange = 1'b1;
					PedGrant = 1'b1;
					LightsGreen_alg_en = 1'b1;
					s_green_alg0_alg_en = 1'b1;
				end
				`STATE_s_green_count: begin
					s_green_count_alg0_alg_en = 1'b1;
				end
				`STATE_s_yellow: begin
					LightCtrlChange = 1'b1;
					s_yellow_alg0_alg_en = 1'b1;
					LightsYellow_alg_en = 1'b1;
				end
				`STATE_s_yellow_count: begin
					s_yellow_count_alg0_alg_en = 1'b1;
				end
				`STATE_s_red: begin
					LightCtrlChange = 1'b1;
					s_red_alg0_alg_en = 1'b1;
					LightsRed_alg_en = 1'b1;
				end
				`STATE_s_red_count: begin
					s_red_count_alg0_alg_en = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(s_green_alg0_alg_en) begin
			d = 0;
		end
		if(s_green_count_alg0_alg_en) begin
			if (d <= greenTicks) begin
			d = d + 1;
		end
		end
		if(s_yellow_alg0_alg_en) begin
			d = 0;
		end
		if(s_yellow_count_alg0_alg_en) begin
			d = d + 1;
		end
		if(s_red_alg0_alg_en) begin
			d = 0;
		end
		if(s_red_count_alg0_alg_en) begin
			d = d + 1;
		end
		if(LightsRed_alg_en) begin
			LightRed = 1;
LightYellow = 0;
LightGreen = 0;
		end
		if(LightsYellow_alg_en) begin
			LightRed = 0;
LightYellow = 1;
LightGreen = 0;
		end
		if(LightsGreen_alg_en) begin
			LightRed = 0;
LightYellow = 0;
LightGreen = 1;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(LightCtrlChange) begin
			LightRed_O = LightRed;
			LightYellow_O = LightYellow;
			LightGreen_O = LightGreen;
		end
		//END update external output variables
	end
end
endmodule