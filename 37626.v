module FB_BfbOnePedCtrl
(
		input wire clk,
		//input events
		input wire Tick_eI,
		input wire PedWaiting_eI,
		input wire SeqGrant_eI,
		//output events
		output wire SeqStatusChange_eO,
		output wire LightCtrlChange_eO,
		//output variables
		output reg  Running_O  = 0,
		output reg  Request_O  = 0,
		output reg  LightRed_O  = 0,
		output reg  LightFlashRed_O  = 0,
		output reg  LightGreen_O  = 0,
		input reset
);
//input events
wire Tick;
assign Tick = Tick_eI;
wire PedWaiting;
assign PedWaiting = PedWaiting_eI;
wire SeqGrant;
assign SeqGrant = SeqGrant_eI;
//output events
reg SeqStatusChange;
assign SeqStatusChange_eO = SeqStatusChange;
reg LightCtrlChange;
assign LightCtrlChange_eO = LightCtrlChange;
//output variables
reg  Running  = 0;
reg  Request  = 0;
reg  LightRed  = 0;
reg  LightFlashRed  = 0;
reg  LightGreen  = 0;
reg  unsigned [31:0] d  = 0;
reg  unsigned [31:0] greenTicks  = 10000000;
reg  unsigned [31:0] flashTicks  = 10000000;
//BEGIN STATE variables
reg [2:0] state = `STATE_s_init;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg s_ped_wait_alg0_alg_en = 1'b0;
reg s_ped_grant_alg0_alg_en = 1'b0;
reg s_ped_grant_alg1_alg_en = 1'b0;
reg s_ped_grant_alg2_alg_en = 1'b0;
reg s_ped_green_alg0_alg_en = 1'b0;
reg s_ped_flash_begin_alg0_alg_en = 1'b0;
reg s_ped_flash_alg0_alg_en = 1'b0;
reg s_ped_done_alg0_alg_en = 1'b0;
reg s_ped_done_alg1_alg_en = 1'b0;
reg LightsOff_alg_en = 1'b0;
reg LightsRed_alg_en = 1'b0;
reg LightsFlashRed_alg_en = 1'b0;
reg LightsGreen_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_s_init;
		//reset I/O registers
		SeqStatusChange = 1'b0;
		LightCtrlChange = 1'b0;
		Running = 0;
		Request = 0;
		LightRed = 0;
		LightFlashRed = 0;
		LightGreen = 0;
		//reset internal vars
		d = 0;
		greenTicks = 10000000;
		flashTicks = 10000000;
	end else begin
		//BEGIN clear output events
		SeqStatusChange = 1'b0;
		LightCtrlChange = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
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
				if(PedWaiting) begin
					state = `STATE_s_ped_wait;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_wait: begin
				if(SeqGrant) begin
					state = `STATE_s_ped_grant;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_grant: begin
				if(1) begin
					state = `STATE_s_ped_green;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_green: begin
				if(d > greenTicks) begin
					state = `STATE_s_ped_flash_begin;
					entered = 1'b1;
				end else if(Tick) begin
					state = `STATE_s_ped_green;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_flash_begin: begin
				if(1) begin
					state = `STATE_s_ped_flash;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_flash: begin
				if(d > flashTicks) begin
					state = `STATE_s_ped_done;
					entered = 1'b1;
				end else if(Tick) begin
					state = `STATE_s_ped_flash;
					entered = 1'b1;
				end
			end
			`STATE_s_ped_done: begin
				if(1) begin
					state = `STATE_s_wait;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		s_ped_wait_alg0_alg_en = 1'b0;
		s_ped_grant_alg0_alg_en = 1'b0;
		s_ped_grant_alg1_alg_en = 1'b0;
		s_ped_grant_alg2_alg_en = 1'b0;
		s_ped_green_alg0_alg_en = 1'b0;
		s_ped_flash_begin_alg0_alg_en = 1'b0;
		s_ped_flash_alg0_alg_en = 1'b0;
		s_ped_done_alg0_alg_en = 1'b0;
		s_ped_done_alg1_alg_en = 1'b0;
		LightsOff_alg_en = 1'b0;
		LightsRed_alg_en = 1'b0;
		LightsFlashRed_alg_en = 1'b0;
		LightsGreen_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_s_init: begin
				end
				`STATE_s_wait: begin
					LightCtrlChange = 1'b1;
					LightsOff_alg_en = 1'b1;
				end
				`STATE_s_ped_wait: begin
					LightCtrlChange = 1'b1;
					SeqStatusChange = 1'b1;
					LightsOff_alg_en = 1'b1;
					LightsRed_alg_en = 1'b1;
					s_ped_wait_alg0_alg_en = 1'b1;
				end
				`STATE_s_ped_grant: begin
					SeqStatusChange = 1'b1;
					LightCtrlChange = 1'b1;
					s_ped_grant_alg0_alg_en = 1'b1;
					s_ped_grant_alg1_alg_en = 1'b1;
					LightsOff_alg_en = 1'b1;
					LightsGreen_alg_en = 1'b1;
					s_ped_grant_alg2_alg_en = 1'b1;
				end
				`STATE_s_ped_green: begin
					s_ped_green_alg0_alg_en = 1'b1;
				end
				`STATE_s_ped_flash_begin: begin
					LightCtrlChange = 1'b1;
					s_ped_flash_begin_alg0_alg_en = 1'b1;
					LightsOff_alg_en = 1'b1;
					LightsFlashRed_alg_en = 1'b1;
				end
				`STATE_s_ped_flash: begin
					s_ped_flash_alg0_alg_en = 1'b1;
				end
				`STATE_s_ped_done: begin
					SeqStatusChange = 1'b1;
					LightCtrlChange = 1'b1;
					s_ped_done_alg0_alg_en = 1'b1;
					s_ped_done_alg1_alg_en = 1'b1;
					LightsRed_alg_en = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(s_ped_wait_alg0_alg_en) begin
			Request = 1;
		end
		if(s_ped_grant_alg0_alg_en) begin
			Request = 0;
		end
		if(s_ped_grant_alg1_alg_en) begin
			Running = 1;
		end
		if(s_ped_grant_alg2_alg_en) begin
			d = 0;
		end
		if(s_ped_green_alg0_alg_en) begin
			d = d + 1;
		end
		if(s_ped_flash_begin_alg0_alg_en) begin
			d = 0;
		end
		if(s_ped_flash_alg0_alg_en) begin
			d = d + 1;
		end
		if(s_ped_done_alg0_alg_en) begin
			Running = 0;
		end
		if(s_ped_done_alg1_alg_en) begin
			d = 0;
		end
		if(LightsOff_alg_en) begin
			LightRed = 0;
LightFlashRed = 0;
LightGreen = 0;
		end
		if(LightsRed_alg_en) begin
			LightRed = 1;
		end
		if(LightsFlashRed_alg_en) begin
			LightFlashRed = 1;
		end
		if(LightsGreen_alg_en) begin
			LightGreen = 1;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(SeqStatusChange) begin
			Running_O = Running;
			Request_O = Request;
		end
		if(LightCtrlChange) begin
			LightRed_O = LightRed;
			LightFlashRed_O = LightFlashRed;
			LightGreen_O = LightGreen;
		end
		//END update external output variables
	end
end
endmodule