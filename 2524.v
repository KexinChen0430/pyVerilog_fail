module  int16_float32_altbarrel_shift_gof
	(
	aclr,
	clk_en,
	clock,
	data,
	distance,
	result) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [15:0]  data;
	input   [3:0]  distance;
	output   [15:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	[1:0]	dir_pipe;
	reg	[15:0]	sbit_piper1d;
	reg	[15:0]	sbit_piper2d;
	reg	sel_pipec2r1d;
	reg	sel_pipec3r1d;
	wire  [4:0]  dir_w;
	wire  direction_w;
	wire  [7:0]  pad_w;
	wire  [79:0]  sbit_w;
	wire  [3:0]  sel_w;
	wire  [63:0]  smux_w;
	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 2'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[3], dir_w[1]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 16'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[31:16];
	// synopsys translate_off
	initial
		sbit_piper2d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper2d <= 16'b0;
		else if  (clk_en == 1'b1)   sbit_piper2d <= smux_w[63:48];
	// synopsys translate_off
	initial
		sel_pipec2r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec2r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec2r1d <= distance[2];
	// synopsys translate_off
	initial
		sel_pipec3r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec3r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec3r1d <= distance[3];
	assign
		dir_w = {dir_pipe[1], dir_w[2], dir_pipe[0], dir_w[0], direction_w},
		direction_w = 1'b0,
		pad_w = {8{1'b0}},
		result = sbit_w[79:64],
		sbit_w = {sbit_piper2d, smux_w[47:32], sbit_piper1d, smux_w[15:0], data},
		sel_w = {sel_pipec3r1d, sel_pipec2r1d, distance[1:0]},
		smux_w = {((({16{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[55:48], pad_w[7:0]}) | ({16{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[63:56]})) | ({16{(~ sel_w[3])}} & sbit_w[63:48])), ((({16{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[43:32], pad_w[3:0]}) | ({16{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[47:36]})) | ({16{(~ sel_w[2])}} & sbit_w[47:32])), ((({16{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[29:16], pad_w[1:0]}) | ({16{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[31:18]})) | ({16{(~ sel_w[1])}} & sbit_w[31:16])), ((({16{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[14:0], pad_w[0]}) | ({16{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[15:1]})) | ({16{(~ sel_w[0])}} & sbit_w[15:0]))};
endmodule