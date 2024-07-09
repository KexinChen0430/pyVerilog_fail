module srl_4x64 ( clk, d, q );
	// synthesis attribute keep_hierarchy srl_4x64 "true";
	input clk;
	input [63:0] d;
	output [63:0] q;
	parameter V6 = 0;
	// leda XV2_1603 off Instantiated shift register SRL16 detected
	// leda XV2P_1603 off Instantiated shift register SRL16 detected
	// leda XV4_1603 off Instantiated shift register SRL16 detected
	wire [3:0] a;
	assign a = 4'd 2;
	srle_x8 #(.V6(V6)) srl0 (.clk(clk), .ce(1'b1), .d(d[7:0]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[7:0]));
	srle_x8 #(.V6(V6)) srl8 (.clk(clk), .ce(1'b1), .d(d[15:8]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[15:8]));
	srle_x8 #(.V6(V6)) srl16 (.clk(clk), .ce(1'b1), .d(d[23:16]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[23:16]));
	srle_x8 #(.V6(V6)) srl24 (.clk(clk), .ce(1'b1), .d(d[31:24]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[31:24]));
	srle_x8 #(.V6(V6)) srl32 (.clk(clk), .ce(1'b1), .d(d[39:32]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[39:32]));
	srle_x8 #(.V6(V6)) srl40 (.clk(clk), .ce(1'b1), .d(d[47:40]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[47:40]));
	srle_x8 #(.V6(V6)) srl48 (.clk(clk), .ce(1'b1), .d(d[55:48]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[55:48]));
	srle_x8 #(.V6(V6)) srl56 (.clk(clk), .ce(1'b1), .d(d[63:56]), .adr0(a), .adr1(a), .adr2(a), .adr3(a), .q(q[63:56]));
	// leda XV2_1603 on Instantiated shift register SRL16 detected
	// leda XV2P_1603 on Instantiated shift register SRL16 detected
	// leda XV4_1603 on Instantiated shift register SRL16 detected
endmodule