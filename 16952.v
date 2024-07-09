module  fp_convert_altbarrel_shift_fof
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
	input   [31:0]  data;
	input   [4:0]  distance;
	output   [31:0]  result;
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
	reg	[31:0]	sbit_piper1d;
	reg	[31:0]	sbit_piper2d;
	reg	sel_pipec3r1d;
	reg	sel_pipec4r1d;
	wire  [5:0]  dir_w;
	wire  direction_w;
	wire  [15:0]  pad_w;
	wire  [191:0]  sbit_w;
	wire  [4:0]  sel_w;
	wire  [159:0]  smux_w;
	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 2'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[4], dir_w[2]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 32'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[95:64];
	// synopsys translate_off
	initial
		sbit_piper2d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper2d <= 32'b0;
		else if  (clk_en == 1'b1)   sbit_piper2d <= smux_w[159:128];
	// synopsys translate_off
	initial
		sel_pipec3r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec3r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec3r1d <= distance[3];
	// synopsys translate_off
	initial
		sel_pipec4r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec4r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec4r1d <= distance[4];
	assign
		dir_w = {dir_pipe[1], dir_w[3], dir_pipe[0], dir_w[1:0], direction_w},
		direction_w = 1'b0,
		pad_w = {16{1'b0}},
		result = sbit_w[191:160],
		sbit_w = {sbit_piper2d, smux_w[127:96], sbit_piper1d, smux_w[63:0], data},
		sel_w = {sel_pipec4r1d, sel_pipec3r1d, distance[2:0]},
		smux_w = {((({32{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[143:128], pad_w[15:0]}) | ({32{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[159:144]})) | ({32{(~ sel_w[4])}} & sbit_w[159:128])), ((({32{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[119:96], pad_w[7:0]}) | ({32{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[127:104]})) | ({32{(~ sel_w[3])}} & sbit_w[127:96])), ((({32{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[91:64], pad_w[3:0]}) | ({32{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[95:68]})) | ({32{(~ sel_w[2])}} & sbit_w[95:64])), ((({32{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[61:32], pad_w[1:0]}) | ({32{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[63:34]})) | ({32{(~ sel_w[1])}} & sbit_w[63:32])), ((({32{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[30:0], pad_w[0]}) | ({32{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[31:1]})) | ({32{(~ sel_w[0])}} & sbit_w[31:0]))};
endmodule