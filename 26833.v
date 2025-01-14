module FB_InjectorMotorController
(
		input wire clk,
		//input events
		input wire InjectorArmFinishedMovement_eI,
		input wire EmergencyStopChanged_eI,
		input wire ConveyorStoppedForInject_eI,
		input wire PumpFinished_eI,
		//output events
		output wire StartPump_eO,
		output wire InjectDone_eO,
		output wire InjectorPositionChanged_eO,
		output wire InjectRunning_eO,
		//input variables
		input wire  EmergencyStop_I,
		//output variables
		output reg [7:0] InjectorPosition_O ,
		input reset
);
//input events
wire InjectorArmFinishedMovement;
assign InjectorArmFinishedMovement = InjectorArmFinishedMovement_eI;
wire EmergencyStopChanged;
assign EmergencyStopChanged = EmergencyStopChanged_eI;
wire ConveyorStoppedForInject;
assign ConveyorStoppedForInject = ConveyorStoppedForInject_eI;
wire PumpFinished;
assign PumpFinished = PumpFinished_eI;
//output events
reg StartPump;
assign StartPump_eO = StartPump;
reg InjectDone;
assign InjectDone_eO = InjectDone;
reg InjectorPositionChanged;
assign InjectorPositionChanged_eO = InjectorPositionChanged;
reg InjectRunning;
assign InjectRunning_eO = InjectRunning;
//input variables
reg  EmergencyStop ;
//output variables
reg [7:0] InjectorPosition ;
//BEGIN STATE variables
reg [1:0] state = `STATE_MoveArmUp;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg SetArmDownPosition_alg_en = 1'b0;
reg SetArmUpPosition_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_MoveArmUp;
		//reset I/O registers
		StartPump = 1'b0;
		InjectDone = 1'b0;
		InjectorPositionChanged = 1'b0;
		InjectRunning = 1'b0;
		EmergencyStop = 0;
		InjectorPosition = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		StartPump = 1'b0;
		InjectDone = 1'b0;
		InjectorPositionChanged = 1'b0;
		InjectRunning = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		if(EmergencyStopChanged) begin
			EmergencyStop = EmergencyStop_I;
		end
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_MoveArmUp: begin
				if(InjectorArmFinishedMovement) begin
					state = `STATE_Await_Bottle;
					entered = 1'b1;
				end
			end
			`STATE_Await_Bottle: begin
				if(ConveyorStoppedForInject) begin
					state = `STATE_MoveArmDown;
					entered = 1'b1;
				end
			end
			`STATE_MoveArmDown: begin
				if(InjectorArmFinishedMovement) begin
					state = `STATE_Await_Pumping;
					entered = 1'b1;
				end
			end
			`STATE_Await_Pumping: begin
				if(PumpFinished) begin
					state = `STATE_MoveArmUp;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		SetArmDownPosition_alg_en = 1'b0;
		SetArmUpPosition_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_MoveArmUp: begin
					SetArmUpPosition_alg_en = 1'b1;
					InjectorPositionChanged = 1'b1;
				end
				`STATE_Await_Bottle: begin
					InjectDone = 1'b1;
				end
				`STATE_MoveArmDown: begin
					SetArmDownPosition_alg_en = 1'b1;
					InjectorPositionChanged = 1'b1;
					InjectRunning = 1'b1;
				end
				`STATE_Await_Pumping: begin
					StartPump = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(SetArmDownPosition_alg_en) begin
			InjectorPosition = 255;
		end
		if(SetArmUpPosition_alg_en) begin
			InjectorPosition = 0;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(InjectorPositionChanged) begin
			InjectorPosition_O = InjectorPosition;
		end
		//END update external output variables
	end
end
endmodule