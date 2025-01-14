module FB_RejectArmController
(
		input wire clk,
		//input events
		input wire RejectCanister_eI,
		input wire LasersChanged_eI,
		//output events
		output wire GoRejectArm_eO,
		//input variables
		input wire  RejectSiteLaser_I,
		input reset
);
//input events
wire RejectCanister;
assign RejectCanister = RejectCanister_eI;
wire LasersChanged;
assign LasersChanged = LasersChanged_eI;
//output events
reg GoRejectArm;
assign GoRejectArm_eO = GoRejectArm;
//input variables
reg  RejectSiteLaser ;
//BEGIN STATE variables
reg [1:0] state = `STATE_Clear;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_Clear;
		//reset I/O registers
		GoRejectArm = 1'b0;
		RejectSiteLaser = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		GoRejectArm = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		if(LasersChanged) begin
			RejectSiteLaser = RejectSiteLaser_I;
		end
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_Clear: begin
				if(RejectCanister) begin
					state = `STATE_AwaitCanister;
					entered = 1'b1;
				end
			end
			`STATE_AwaitCanister: begin
				if(LasersChanged && RejectSiteLaser) begin
					state = `STATE_GoReject;
					entered = 1'b1;
				end
			end
			`STATE_GoReject: begin
				if(RejectCanister) begin
					state = `STATE_AwaitCanister;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		if(entered) begin
			case(state)
				`STATE_Clear: begin
				end
				`STATE_AwaitCanister: begin
				end
				`STATE_GoReject: begin
					GoRejectArm = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		//END algorithms
		//BEGIN update external output variables on relevant events
		//END update external output variables
	end
end
endmodule