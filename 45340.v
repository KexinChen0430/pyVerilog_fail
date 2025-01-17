module ReSC_wrapper_varied_bin_lengths_test( //handles stochastic/binary conversion for ReSC
	input [5:0] x_bin, //binary value of input
	input start, //signal to start counting
	output reg done, //signal that a number has been computed
	output reg [9:0] z_bin, //binary value of output
	input clk,
	input reset
);
	wire [9:0] x_bin_shifted;
	assign x_bin_shifted = x_bin << 4;
	//the weights of the Bernstein polynomial
	reg [9:0] w0_bin = 10'd104;
	reg [9:0] w1_bin = 10'd204;
	reg [9:0] w2_bin = 10'd308;
	reg [9:0] w3_bin = 10'd408;
	reg [9:0] w4_bin = 10'd716;
	reg [9:0] w5_bin = 10'd820;
	wire [4:0] x_stoch;
	wire [5:0] w_stoch;
	wire z_stoch;
	wire init;
	wire running;
	//RNGs for binary->stochastic conversion
	wire [9:0] randx0;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_x_0 (
		.seed (10'd0),
		.data (randx0),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_stoch[0] = randx0 < x_bin_shifted;
	wire [9:0] randx1;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_x_1 (
		.seed (10'd93),
		.data (randx1),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_stoch[1] = randx1 < x_bin_shifted;
	wire [9:0] randx2;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_x_2 (
		.seed (10'd186),
		.data (randx2),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_stoch[2] = randx2 < x_bin_shifted;
	wire [9:0] randx3;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_x_3 (
		.seed (10'd279),
		.data (randx3),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_stoch[3] = randx3 < x_bin_shifted;
	wire [9:0] randx4;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_x_4 (
		.seed (10'd372),
		.data (randx4),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_stoch[4] = randx4 < x_bin_shifted;
	wire [9:0] randw;
	LFSR_10_bit_added_zero_varied_bin_lengths_test rand_gen_w (
		.seed (10'd683),
		.data (randw),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign w_stoch[0] = randw < w0_bin;
	assign w_stoch[1] = randw < w1_bin;
	assign w_stoch[2] = randw < w2_bin;
	assign w_stoch[3] = randw < w3_bin;
	assign w_stoch[4] = randw < w4_bin;
	assign w_stoch[5] = randw < w5_bin;
	ReSC_varied_bin_lengths_test ReSC (
		.x (x_stoch),
		.w (w_stoch),
		.z (z_stoch)
	);
	reg [9:0] count; //count clock cycles
	wire [9:0] neg_one;
	assign neg_one = -1;
	//Finite state machine. States:
	//0: finished, in need of resetting
	//1: initialized, start counting when start signal falls
	//2: running
	reg [1:0] cs; //current FSM state
	reg [1:0] ns; //next FSM state
	assign init = cs == 1;
	assign running = cs == 2;
	always @(posedge clk or posedge reset) begin
		if (reset) cs <= 0;
		else begin
			cs <= ns;
			if (running) begin
				if (count == neg_one) done <= 1;
				count <= count + 1;
				z_bin <= z_bin + z_stoch;
			end
		end
	end
	always @(*) begin
		case (cs)
			0: if (start) ns = 1; else ns = 0;
			1: if (start) ns = 1; else ns = 2;
			2: if (done) ns = 0; else ns = 2;
			default ns = 0;
		endcase
	end
	always @(posedge init) begin
		count <= 0;
		z_bin <= 0;
		done <= 0;
	end
endmodule