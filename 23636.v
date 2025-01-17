module FB_InjectorPumpsController
(
		input wire clk,
		//input events
		input wire StartPump_eI,
		input wire EmergencyStopChanged_eI,
		input wire CanisterPressureChanged_eI,
		input wire FillContentsAvailableChanged_eI,
		input wire VacuumTimerElapsed_eI,
		//output events
		output wire PumpFinished_eO,
		output wire RejectCanister_eO,
		output wire InjectorControlsChanged_eO,
		output wire FillContentsChanged_eO,
		output wire StartVacuumTimer_eO,
		//input variables
		input wire  EmergencyStop_I,
		input wire [7:0] CanisterPressure_I,
		input wire [7:0] FillContentsAvailable_I,
		//output variables
		output reg  InjectorContentsValveOpen_O ,
		output reg  InjectorVacuumRun_O ,
		output reg  InjectorPressurePumpRun_O ,
		output reg  FillContents_O ,
		input reset
);
//input events
wire StartPump;
assign StartPump = StartPump_eI;
wire EmergencyStopChanged;
assign EmergencyStopChanged = EmergencyStopChanged_eI;
wire CanisterPressureChanged;
assign CanisterPressureChanged = CanisterPressureChanged_eI;
wire FillContentsAvailableChanged;
assign FillContentsAvailableChanged = FillContentsAvailableChanged_eI;
wire VacuumTimerElapsed;
assign VacuumTimerElapsed = VacuumTimerElapsed_eI;
//output events
reg PumpFinished;
assign PumpFinished_eO = PumpFinished;
reg RejectCanister;
assign RejectCanister_eO = RejectCanister;
reg InjectorControlsChanged;
assign InjectorControlsChanged_eO = InjectorControlsChanged;
reg FillContentsChanged;
assign FillContentsChanged_eO = FillContentsChanged;
reg StartVacuumTimer;
assign StartVacuumTimer_eO = StartVacuumTimer;
//input variables
reg  EmergencyStop ;
reg [7:0] CanisterPressure ;
reg [7:0] FillContentsAvailable ;
//output variables
reg  InjectorContentsValveOpen ;
reg  InjectorVacuumRun ;
reg  InjectorPressurePumpRun ;
reg  FillContents ;
//BEGIN STATE variables
reg [2:0] state = `STATE_RejectCanister;
reg entered = 1'b0;
//END STATE variables
//BEGIN algorithm triggers
reg StartVacuum_alg_en = 1'b0;
reg ClearControls_alg_en = 1'b0;
reg OpenValve_alg_en = 1'b0;
reg StartPump_alg_en = 1'b0;
//END algorithm triggers
always@(posedge clk) begin
	if(reset) begin
		//reset state
		state = `STATE_RejectCanister;
		//reset I/O registers
		PumpFinished = 1'b0;
		RejectCanister = 1'b0;
		InjectorControlsChanged = 1'b0;
		FillContentsChanged = 1'b0;
		StartVacuumTimer = 1'b0;
		EmergencyStop = 0;
		CanisterPressure = 0;
		FillContentsAvailable = 0;
		InjectorContentsValveOpen = 0;
		InjectorVacuumRun = 0;
		InjectorPressurePumpRun = 0;
		FillContents = 0;
		//reset internal vars
	end else begin
		//BEGIN clear output events
		PumpFinished = 1'b0;
		RejectCanister = 1'b0;
		InjectorControlsChanged = 1'b0;
		FillContentsChanged = 1'b0;
		StartVacuumTimer = 1'b0;
		//END clear output events
		//BEGIN update internal inputs on relevant events
		if(EmergencyStopChanged) begin
			EmergencyStop = EmergencyStop_I;
		end
		if(CanisterPressureChanged) begin
			CanisterPressure = CanisterPressure_I;
		end
		if(FillContentsAvailableChanged) begin
			FillContentsAvailable = FillContentsAvailable_I;
		end
		//END update internal inputs
		//BEGIN ecc
		entered = 1'b0;
		case(state)
			`STATE_RejectCanister: begin
				if(1) begin
					state = `STATE_AwaitPump;
					entered = 1'b1;
				end
			end
			`STATE_AwaitPump: begin
				if(StartPump) begin
					state = `STATE_VacuumPump;
					entered = 1'b1;
				end
			end
			`STATE_VacuumPump: begin
				if(VacuumTimerElapsed) begin
					state = `STATE_RejectCanister;
					entered = 1'b1;
				end else if(CanisterPressureChanged && CanisterPressure <= 10) begin
					state = `STATE_StopVacuum;
					entered = 1'b1;
				end
			end
			`STATE_FinishPump: begin
				if(1) begin
					state = `STATE_AwaitPump;
					entered = 1'b1;
				end
			end
			`STATE_StartPump: begin
				if(CanisterPressureChanged && CanisterPressure >= 245) begin
					state = `STATE_FinishPump;
					entered = 1'b1;
				end
			end
			`STATE_OpenValve: begin
				if(1) begin
					state = `STATE_StartPump;
					entered = 1'b1;
				end
			end
			`STATE_StopVacuum: begin
				if(1) begin
					state = `STATE_OpenValve;
					entered = 1'b1;
				end
			end
			default: begin
				state = 0;
			end
		endcase
		//END ecc
		//BEGIN triggers
		StartVacuum_alg_en = 1'b0;
		ClearControls_alg_en = 1'b0;
		OpenValve_alg_en = 1'b0;
		StartPump_alg_en = 1'b0;
		if(entered) begin
			case(state)
				`STATE_RejectCanister: begin
					ClearControls_alg_en = 1'b1;
					RejectCanister = 1'b1;
					InjectorControlsChanged = 1'b1;
				end
				`STATE_AwaitPump: begin
					PumpFinished = 1'b1;
				end
				`STATE_VacuumPump: begin
					StartVacuum_alg_en = 1'b1;
					InjectorControlsChanged = 1'b1;
					StartVacuumTimer = 1'b1;
				end
				`STATE_FinishPump: begin
					ClearControls_alg_en = 1'b1;
					InjectorControlsChanged = 1'b1;
				end
				`STATE_StartPump: begin
					StartPump_alg_en = 1'b1;
					InjectorControlsChanged = 1'b1;
				end
				`STATE_OpenValve: begin
					OpenValve_alg_en = 1'b1;
					InjectorControlsChanged = 1'b1;
				end
				`STATE_StopVacuum: begin
					ClearControls_alg_en = 1'b1;
					InjectorControlsChanged = 1'b1;
				end
				default: begin
				end
			endcase
		end
		//END triggers
		//BEGIN algorithms
		if(StartVacuum_alg_en) begin
			InjectorVacuumRun = 1;
		end
		if(ClearControls_alg_en) begin
			InjectorContentsValveOpen = 0;
InjectorPressurePumpRun = 0;
InjectorVacuumRun = 0;
		end
		if(OpenValve_alg_en) begin
			InjectorContentsValveOpen = 1;
		end
		if(StartPump_alg_en) begin
			InjectorPressurePumpRun = 1;
		end
		//END algorithms
		//BEGIN update external output variables on relevant events
		if(InjectorControlsChanged) begin
			InjectorContentsValveOpen_O = InjectorContentsValveOpen;
			InjectorVacuumRun_O = InjectorVacuumRun;
			InjectorPressurePumpRun_O = InjectorPressurePumpRun;
		end
		if(FillContentsChanged) begin
			FillContents_O = FillContents;
		end
		//END update external output variables
	end
end
endmodule