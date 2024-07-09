module srl_2x8 ( clk, d, q );
	// synthesis attribute keep_hierarchy srl_2x8 "true";
	input clk;
	input [7:0] d;
	output [7:0] q;
	parameter V6 = 0;
	// leda XV2_1603 off Instantiated shift register SRL16 detected
	// leda XV2P_1603 off Instantiated shift register SRL16 detected
	// leda XV4_1603 off Instantiated shift register SRL16 detected
	wire [3:0] a;
	assign a = 4'd 0;
	srle_x8 #(.V6(V6)) srl0 (.clk(clk), .ce(1'b1), .d(d[7:0]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[7:0]));
	// leda XV2_1603 on Instantiated shift register SRL16 detected
	// leda XV2P_1603 on Instantiated shift register SRL16 detected
	// leda XV4_1603 on Instantiated shift register SRL16 detected
endmodule