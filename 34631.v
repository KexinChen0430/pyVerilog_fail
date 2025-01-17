module top
(
		input wire clk,
		//input events
		input wire UpdateLevels_eI,
		input wire UpdateControls_eI,
		//output events
		output wire UpdatePump_eO,
		//input variables
		input wire unsigned [7:0] Level1_I,
		input wire unsigned [7:0] Level2_I,
		input wire  ModeBalance_I,
		input wire  ModeFill1_I,
		input wire  ModeFill2_I,
		//output variables
		output reg  PumpDir_O  = 0,
		output reg  PumpRun_O  = 0,
		input reset
);
// I/O
FB_BfbWaterPump iec61499_network_top (
	.clk(clk),
    //input events
    .UpdateLevels_eI(UpdateLevels_eI),
    .UpdateControls_eI(UpdateControls_eI),
    //output events
    .UpdatePump_eO(UpdatePump_eO),
    //input variables
    .Level1_I(Level1_I),
    .Level2_I(Level2_I),
    .ModeBalance_I(ModeBalance_I),
    .ModeFill1_I(ModeFill1_I),
    .ModeFill2_I(ModeFill2_I),
    //output variables
    .PumpDir_O(PumpDir_O),
    .PumpRun_O(PumpRun_O),
	.reset(reset)
);
endmodule