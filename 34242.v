module MReSC_wrapper_example( //handles stochastic/binary conversion for ReSC
	input [11:0] x_1_bin, //binary value of input 1
	input [11:0] x_2_bin, //binary value of input 2
	input [11:0] x_3_bin, //binary value of input 3
	input start, //signal to start counting
	output reg done, //signal that a number has been computed
	output reg [11:0] z_bin, //binary value of output
	input clk,
	input reset
);
	//the weights of the Bernstein polynomial
	reg [11:0] w0_bin = 12'd4016;
	reg [11:0] w1_bin = 12'd886;
	reg [11:0] w2_bin = 12'd3400;
	reg [11:0] w3_bin = 12'd2597;
	reg [11:0] w4_bin = 12'd3915;
	reg [11:0] w5_bin = 12'd2013;
	reg [11:0] w6_bin = 12'd1549;
	reg [11:0] w7_bin = 12'd689;
	reg [11:0] w8_bin = 12'd3510;
	reg [11:0] w9_bin = 12'd2941;
	reg [11:0] w10_bin = 12'd926;
	reg [11:0] w11_bin = 12'd667;
	reg [11:0] w12_bin = 12'd3308;
	reg [11:0] w13_bin = 12'd2028;
	reg [11:0] w14_bin = 12'd3058;
	reg [11:0] w15_bin = 12'd1473;
	reg [11:0] w16_bin = 12'd1903;
	reg [11:0] w17_bin = 12'd424;
	reg [11:0] w18_bin = 12'd2207;
	reg [11:0] w19_bin = 12'd516;
	reg [11:0] w20_bin = 12'd1977;
	reg [11:0] w21_bin = 12'd48;
	reg [11:0] w22_bin = 12'd1547;
	reg [11:0] w23_bin = 12'd1191;
	reg [11:0] w24_bin = 12'd1791;
	reg [11:0] w25_bin = 12'd2198;
	reg [11:0] w26_bin = 12'd2759;
	reg [11:0] w27_bin = 12'd3354;
	reg [11:0] w28_bin = 12'd3202;
	reg [11:0] w29_bin = 12'd3623;
	reg [11:0] w30_bin = 12'd3602;
	reg [11:0] w31_bin = 12'd1773;
	reg [11:0] w32_bin = 12'd795;
	reg [11:0] w33_bin = 12'd3687;
	reg [11:0] w34_bin = 12'd3720;
	reg [11:0] w35_bin = 12'd1179;
	reg [11:0] w36_bin = 12'd105;
	reg [11:0] w37_bin = 12'd1164;
	reg [11:0] w38_bin = 12'd3313;
	reg [11:0] w39_bin = 12'd126;
	reg [11:0] w40_bin = 12'd3433;
	reg [11:0] w41_bin = 12'd3055;
	reg [11:0] w42_bin = 12'd4047;
	reg [11:0] w43_bin = 12'd363;
	reg [11:0] w44_bin = 12'd3902;
	reg [11:0] w45_bin = 12'd1602;
	reg [11:0] w46_bin = 12'd3629;
	reg [11:0] w47_bin = 12'd2363;
	reg [11:0] w48_bin = 12'd1906;
	reg [11:0] w49_bin = 12'd911;
	reg [11:0] w50_bin = 12'd319;
	reg [11:0] w51_bin = 12'd553;
	reg [11:0] w52_bin = 12'd40;
	reg [11:0] w53_bin = 12'd3336;
	reg [11:0] w54_bin = 12'd1319;
	reg [11:0] w55_bin = 12'd3993;
	reg [11:0] w56_bin = 12'd3628;
	reg [11:0] w57_bin = 12'd956;
	reg [11:0] w58_bin = 12'd119;
	reg [11:0] w59_bin = 12'd1159;
	reg [11:0] w60_bin = 12'd198;
	reg [11:0] w61_bin = 12'd1292;
	reg [11:0] w62_bin = 12'd979;
	reg [11:0] w63_bin = 12'd2858;
	reg [11:0] w64_bin = 12'd2368;
	reg [11:0] w65_bin = 12'd2136;
	reg [11:0] w66_bin = 12'd3679;
	reg [11:0] w67_bin = 12'd3205;
	reg [11:0] w68_bin = 12'd3081;
	reg [11:0] w69_bin = 12'd244;
	reg [11:0] w70_bin = 12'd746;
	reg [11:0] w71_bin = 12'd220;
	wire [2:0] x_1_stoch;
	wire [4:0] x_2_stoch;
	wire [1:0] x_3_stoch;
	wire [71:0] w_stoch;
	wire z_stoch;
	wire init;
	wire running;
	//RNGs for binary->stochastic conversion
	wire [11:0] randx_1_0;
	LFSR_12_bit_added_zero_example rand_gen_x_1_0 (
		.seed (12'd0),
		.data (randx_1_0),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_1_stoch[0] = randx_1_0 < x_1_bin;
	wire [11:0] randx_1_1;
	LFSR_12_bit_added_zero_example rand_gen_x_1_1 (
		.seed (12'd585),
		.data (randx_1_1),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_1_stoch[1] = randx_1_1 < x_1_bin;
	wire [11:0] randx_1_2;
	LFSR_12_bit_added_zero_example rand_gen_x_1_2 (
		.seed (12'd1170),
		.data (randx_1_2),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_1_stoch[2] = randx_1_2 < x_1_bin;
	wire [11:0] randx_2_0;
	LFSR_12_bit_added_zero_example rand_gen_x_2_0 (
		.seed (12'd0),
		.data (randx_2_0),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_2_stoch[0] = randx_2_0 < x_2_bin;
	wire [11:0] randx_2_1;
	LFSR_12_bit_added_zero_example rand_gen_x_2_1 (
		.seed (12'd372),
		.data (randx_2_1),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_2_stoch[1] = randx_2_1 < x_2_bin;
	wire [11:0] randx_2_2;
	LFSR_12_bit_added_zero_example rand_gen_x_2_2 (
		.seed (12'd745),
		.data (randx_2_2),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_2_stoch[2] = randx_2_2 < x_2_bin;
	wire [11:0] randx_2_3;
	LFSR_12_bit_added_zero_example rand_gen_x_2_3 (
		.seed (12'd1117),
		.data (randx_2_3),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_2_stoch[3] = randx_2_3 < x_2_bin;
	wire [11:0] randx_2_4;
	LFSR_12_bit_added_zero_example rand_gen_x_2_4 (
		.seed (12'd1489),
		.data (randx_2_4),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_2_stoch[4] = randx_2_4 < x_2_bin;
	wire [11:0] randx_3_0;
	LFSR_12_bit_added_zero_example rand_gen_x_3_0 (
		.seed (12'd0),
		.data (randx_3_0),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_3_stoch[0] = randx_3_0 < x_3_bin;
	wire [11:0] randx_3_1;
	LFSR_12_bit_added_zero_example rand_gen_x_3_1 (
		.seed (12'd819),
		.data (randx_3_1),
		.enable (running),
		.restart (init),
		.clk (clk),
		.reset (reset)
	);
	assign x_3_stoch[1] = randx_3_1 < x_3_bin;
	wire [11:0] randw;
	LFSR_12_bit_added_zero_example rand_gen_w (
		.seed (12'd2731),
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
	assign w_stoch[6] = randw < w6_bin;
	assign w_stoch[7] = randw < w7_bin;
	assign w_stoch[8] = randw < w8_bin;
	assign w_stoch[9] = randw < w9_bin;
	assign w_stoch[10] = randw < w10_bin;
	assign w_stoch[11] = randw < w11_bin;
	assign w_stoch[12] = randw < w12_bin;
	assign w_stoch[13] = randw < w13_bin;
	assign w_stoch[14] = randw < w14_bin;
	assign w_stoch[15] = randw < w15_bin;
	assign w_stoch[16] = randw < w16_bin;
	assign w_stoch[17] = randw < w17_bin;
	assign w_stoch[18] = randw < w18_bin;
	assign w_stoch[19] = randw < w19_bin;
	assign w_stoch[20] = randw < w20_bin;
	assign w_stoch[21] = randw < w21_bin;
	assign w_stoch[22] = randw < w22_bin;
	assign w_stoch[23] = randw < w23_bin;
	assign w_stoch[24] = randw < w24_bin;
	assign w_stoch[25] = randw < w25_bin;
	assign w_stoch[26] = randw < w26_bin;
	assign w_stoch[27] = randw < w27_bin;
	assign w_stoch[28] = randw < w28_bin;
	assign w_stoch[29] = randw < w29_bin;
	assign w_stoch[30] = randw < w30_bin;
	assign w_stoch[31] = randw < w31_bin;
	assign w_stoch[32] = randw < w32_bin;
	assign w_stoch[33] = randw < w33_bin;
	assign w_stoch[34] = randw < w34_bin;
	assign w_stoch[35] = randw < w35_bin;
	assign w_stoch[36] = randw < w36_bin;
	assign w_stoch[37] = randw < w37_bin;
	assign w_stoch[38] = randw < w38_bin;
	assign w_stoch[39] = randw < w39_bin;
	assign w_stoch[40] = randw < w40_bin;
	assign w_stoch[41] = randw < w41_bin;
	assign w_stoch[42] = randw < w42_bin;
	assign w_stoch[43] = randw < w43_bin;
	assign w_stoch[44] = randw < w44_bin;
	assign w_stoch[45] = randw < w45_bin;
	assign w_stoch[46] = randw < w46_bin;
	assign w_stoch[47] = randw < w47_bin;
	assign w_stoch[48] = randw < w48_bin;
	assign w_stoch[49] = randw < w49_bin;
	assign w_stoch[50] = randw < w50_bin;
	assign w_stoch[51] = randw < w51_bin;
	assign w_stoch[52] = randw < w52_bin;
	assign w_stoch[53] = randw < w53_bin;
	assign w_stoch[54] = randw < w54_bin;
	assign w_stoch[55] = randw < w55_bin;
	assign w_stoch[56] = randw < w56_bin;
	assign w_stoch[57] = randw < w57_bin;
	assign w_stoch[58] = randw < w58_bin;
	assign w_stoch[59] = randw < w59_bin;
	assign w_stoch[60] = randw < w60_bin;
	assign w_stoch[61] = randw < w61_bin;
	assign w_stoch[62] = randw < w62_bin;
	assign w_stoch[63] = randw < w63_bin;
	assign w_stoch[64] = randw < w64_bin;
	assign w_stoch[65] = randw < w65_bin;
	assign w_stoch[66] = randw < w66_bin;
	assign w_stoch[67] = randw < w67_bin;
	assign w_stoch[68] = randw < w68_bin;
	assign w_stoch[69] = randw < w69_bin;
	assign w_stoch[70] = randw < w70_bin;
	assign w_stoch[71] = randw < w71_bin;
	MReSC_example ReSC (
		.x_1 (x_1_stoch),
		.x_2 (x_2_stoch),
		.x_3 (x_3_stoch),
		.w (w_stoch),
		.z (z_stoch)
	);
	reg [11:0] count; //count clock cycles
	wire [11:0] neg_one;
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