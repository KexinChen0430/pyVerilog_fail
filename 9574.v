module  float_add_sub_altbarrel_shift_02e
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
	input   [25:0]  data;
	input   [4:0]  distance;
	output   [25:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	[0:0]	dir_pipe;
	reg	[25:0]	sbit_piper1d;
	wire  [5:0]  dir_w;
	wire  direction_w;
	wire  [15:0]  pad_w;
	wire  [155:0]  sbit_w;
	wire  [4:0]  sel_w;
	wire  [129:0]  smux_w;
	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 1'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[4]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 26'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[129:104];
	assign
		dir_w = {dir_pipe[0], dir_w[3:0], direction_w},
		direction_w = 1'b0,
		pad_w = {16{1'b0}},
		result = sbit_w[155:130],
		sbit_w = {sbit_piper1d, smux_w[103:0], data},
		sel_w = {distance[4:0]},
		smux_w = {((({26{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[113:104], pad_w[15:0]}) | ({26{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[129:120]})) | ({26{(~ sel_w[4])}} & sbit_w[129:104])), ((({26{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[95:78], pad_w[7:0]}) | ({26{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[103:86]})) | ({26{(~ sel_w[3])}} & sbit_w[103:78])), ((({26{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[73:52], pad_w[3:0]}) | ({26{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[77:56]})) | ({26{(~ sel_w[2])}} & sbit_w[77:52])), ((({26{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[49:26], pad_w[1:0]}) | ({26{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[51:28]})) | ({26{(~ sel_w[1])}} & sbit_w[51:26])), ((({26{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[24:0], pad_w[0]}) | ({26{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[25:1]})) | ({26{(~ sel_w[0])}} & sbit_w[25:0]))};
endmodule