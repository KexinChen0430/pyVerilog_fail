module main(clk_i, button_i, rot_i, led_o);
	input wire		clk_i;
	input wire		button_i;
	input wire [2:0]	rot_i;
	output wire [7:0]	led_o;
	integer i = 0;
	wire		reset;
	wire		strobe;
	wire		dir;
	wire [7:0]	led;
	debouncer #(
		.DEBOUNCER_DELAY(`FREQ/12)
	) debouncer0 (
		.clk_i(clk_i),
		.d_i(button_i),
		.d_o(reset)
	);
	ruler #(
		.RULER_WIDTH(8)
	) ruler0 (
		.clk_i(clk_i),
		.rst_i(reset),
		.stb_i(strobe),
		.dir_i(dir),
		.ruler_o(led)
	);
	rotary rotary0(
		.clk_i(clk_i),
		.rot_i(rot_i),
		.strobe_o(strobe),
		.dir_o(dir),
		.button_o(led_o[1:0])
	);
	assign led_o[7:2] = led[7:2];
endmodule