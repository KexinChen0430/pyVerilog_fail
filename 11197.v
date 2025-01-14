module FB_CfbOvercurrentDetector
(
		input wire clk,
		//input events
		input wire tick_eI,
		input wire i_measured_eI,
		input wire test_eI,
		input wire set_eI,
		input wire iSet_change_eI,
		//output events
		output wire b_change_eO,
		//input variables
		input wire unsigned [7:0] i_I,
		input wire unsigned [7:0] iSet_I,
		//output variables
		output wire  b_O ,
		input reset
);
//Wires needed for event connections
wire tick_conn;
wire i_measured_conn;
wire iSet_change_conn;
wire test_conn;
wire set_conn;
wire curve_unsafe_conn;
wire sr_b_change_conn;
//Wires needed for data connections
wire unsigned [7:0] i_conn;
wire unsigned [7:0] iSet_conn;
wire  sr_b_conn;
//top level I/O to signals
//input events
assign tick_conn = tick_eI;
assign i_measured_conn = i_measured_eI;
assign test_conn = test_eI;
assign set_conn = set_eI;
assign iSet_change_conn = iSet_change_eI;
//output events
assign b_change_eO = sr_b_change_conn;
//input variables
assign i_conn = i_I;
assign iSet_conn = iSet_I;
//output events
assign b_O = sr_b_conn;
// child I/O to signals
FB_BfbSetterResetter sr (
	.clk(clk),
	//event outputs
	.b_change_eO(sr_b_change_conn),
	//event inputs
	.test_eI(test_conn),
	.set_eI(set_conn),
	.unsafe_eI(curve_unsafe_conn),
	//data outputs
	.b_O(sr_b_conn),
	//data inputs
	.reset(reset)
);
FB_BfbIDMTCurve curve (
	.clk(clk),
	//event outputs
	.unsafe_eO(curve_unsafe_conn),
	//event inputs
	.tick_eI(tick_conn),
	.i_measured_eI(i_measured_conn),
	.iSet_change_eI(iSet_change_conn),
	//data outputs
	//data inputs
	.i_I(i_conn),
	.iSet_I(iSet_conn),
	.reset(reset)
);
endmodule