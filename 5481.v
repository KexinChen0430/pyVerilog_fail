module FB_VVI_VRP
(
		input wire clk,
		//input events
		input wire VPulse_eI,
		input wire VPace_eI,
		input wire VRP_Timer_Timeout_eI,
		//output events
		output wire VRP_Start_Timer_eO,
		output wire VSense_eO,
		output wire VRefractory_eO,
		//output variables
		output reg signed [15:0] VRP_Timeout_Value_O ,
		input reset
);
//input events
wire VPulse;
assign VPulse = VPulse_eI;
wire VPace;
assign VPace = VPace_eI;
wire VRP_Timer_Timeout;
assign VRP_Timer_Timeout = VRP_Timer_Timeout_eI;
//output events
reg VRP_Start_Timer;
assign VRP_Start_Timer_eO = VRP_Start_Timer;
reg VSense;
assign VSense_eO = VSense;
reg VRefractory;
assign VRefractory_eO = VRefractory;
//output variables
reg signed [15:0] VRP_Timeout_Value ;
//BEGIN STATE variables
reg [2:0] state = `STATE_Start;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg VRP_Set_Timeout_Value_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_Start;
		//reset I/O registers
		VRP_Start_Timer = 1'b0;
		VSense = 1'b0;
		VRefractory = 1'b0;
		VRP_Timeout_Value = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		VRP_Start_Timer = 1'b0;
		VSense = 1'b0;
		VRefractory = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_Start: begin
				if(1) begin
					state = `STATE_Detected_VPulse;
					entered = 1'b1;
				end
			end
			`STATE_Wait_For_VSense: begin
				if(VPulse) begin
					state = `STATE_Resting;
					entered = 1'b1;
				end else if(VPace) begin
					state = `STATE_Resting;
					entered = 1'b1;
				end
			end
			`STATE_Resting: begin
				if(VPulse) begin
					state = `STATE_Detected_VRefractory;
					entered = 1'b1;
				end else if(VRP_Timer_Timeout) begin
					state = `STATE_Wait_For_VSense;
					entered = 1'b1;
				end
			end
			`STATE_Detected_VPulse: begin
				if(VRP_Timer_Timeout) begin
					state = `STATE_Wait_For_VSense;
					entered = 1'b1;
				end
			end
			`STATE_Detected_VRefractory: begin
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
		VRP_Set_Timeout_Value_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_Start: begin
				end
				`STATE_Wait_For_VSense: begin
				end
				`STATE_Resting: begin
					VRP_Set_Timeout_Value_alg_en = 1'b1;
					VRP_Start_Timer = 1'b1;
					VSense = 1'b1;
				end
				`STATE_Detected_VPulse: begin
					VRP_Set_Timeout_Value_alg_en = 1'b1;
					VRP_Start_Timer = 1'b1;
				end
				`STATE_Detected_VRefractory: begin
					VRefractory = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(VRP_Set_Timeout_Value_alg_en) begin
			VRP_Timeout_Value = 300;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(VRP_Start_Timer) begin
			VRP_Timeout_Value_O = VRP_Timeout_Value;
		end
		//END update external output variables
	end
end
endmodule