module FB_VVI_LRI
(
		input wire clk,
		//input events
		input wire VSense_eI,
		input wire LRI_Timer_Timeout_eI,
		//output events
		output wire LRI_Timer_Start_eO,
		output wire LRI_Timer_Stop_eO,
		output wire VPace_eO,
		//output variables
		output reg signed [15:0] LRI_Timeout_Value_O ,
		input reset
);
//input events
wire VSense;
assign VSense = VSense_eI;
wire LRI_Timer_Timeout;
assign LRI_Timer_Timeout = LRI_Timer_Timeout_eI;
//output events
reg LRI_Timer_Start;
assign LRI_Timer_Start_eO = LRI_Timer_Start;
reg LRI_Timer_Stop;
assign LRI_Timer_Stop_eO = LRI_Timer_Stop;
reg VPace;
assign VPace_eO = VPace;
//output variables
reg signed [15:0] LRI_Timeout_Value ;
//BEGIN STATE variables
reg [1:0] state = `STATE_Start;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg LRI_Set_Timeout_Value_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_Start;
		//reset I/O registers
		LRI_Timer_Start = 1'b0;
		LRI_Timer_Stop = 1'b0;
		VPace = 1'b0;
		LRI_Timeout_Value = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		LRI_Timer_Start = 1'b0;
		LRI_Timer_Stop = 1'b0;
		VPace = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_Start: begin
				if(1) begin
					state = `STATE_Resting;
					entered = 1'b1;
				end
			end
			`STATE_Resting: begin
				if(VSense) begin
					state = `STATE_VSense_Detected;
					entered = 1'b1;
				end else if(LRI_Timer_Timeout) begin
					state = `STATE_LRI_Timer_Expired;
					entered = 1'b1;
				end
			end
			`STATE_LRI_Timer_Expired: begin
				if(1) begin
					state = `STATE_Resting;
					entered = 1'b1;
				end
			end
			`STATE_VSense_Detected: begin
				if(1) begin
					state = `STATE_Resting;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		LRI_Set_Timeout_Value_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_Start: begin
				end
				`STATE_Resting: begin
					LRI_Set_Timeout_Value_alg_en = 1'b1;
					LRI_Timer_Start = 1'b1;
				end
				`STATE_LRI_Timer_Expired: begin
					VPace = 1'b1;
				end
				`STATE_VSense_Detected: begin
					LRI_Timer_Stop = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(LRI_Set_Timeout_Value_alg_en) begin
			LRI_Timeout_Value = 800;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(LRI_Timer_Start) begin
			LRI_Timeout_Value_O = LRI_Timeout_Value;
		end
		//END update external output variables
	end
end
endmodule