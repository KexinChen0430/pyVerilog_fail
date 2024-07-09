module ripemd160 (
	input clk,
	input rx_reset,
	input [255:0] rx_hash,
	output reg tx_done = 1'b0,
	output reg [159:0] tx_hash = 160'd0
);
	reg [511:0] block;
	reg [31:0] A, B, C, D, E, AA, BB, CC, DD, EE;
	reg [6:0] round;
	// K constants
	wire [31:0] k0, k1;
	ripemd160_k_constant k_constant_blk (
		.clk (clk),
		.rx_round (rx_reset ? 7'd0 : round),
		.tx_k0 (k0),
		.tx_k1 (k1)
	);
	// Rotation amounts
	wire [3:0] first_rotate, second_rotate;
	ripemd160_rol_s rol_s_blk (
		.clk (clk),
		.rx_round (rx_reset ? 7'd0 : (round + 7'd1)),
		.tx_s0 (first_rotate),
		.tx_s1 (second_rotate)
	);
	// Message word selection
	wire [3:0] first_word, second_word;
	ripemd160_word_sel word_sel_blk (
		.clk (clk),
		.rx_round (rx_reset ? 7'd0 : (round + 7'd1)),
		.tx_s0 (first_word),
		.tx_s1 (second_word)
	);
	// Non-linear functions
	wire [31:0] nl_0, nl_1;
	ripemd160_nonlinear nonlinear_0 (round, B, C, D, nl_0);
	ripemd160_nonlinear nonlinear_1 (7'd79 - round, BB, CC, DD, nl_1);
	// Select words
	wire [31:0] x_0 = block >> {first_word, 5'd0};
	wire [31:0] x_1 = block >> {second_word, 5'd0};
	// Big calculations
	wire [31:0] partial_T = A + nl_0 + x_0 + k0;
	wire [31:0] partial_TT = AA + nl_1 + x_1 + k1;
	// Rotations
	wire [31:0] rotated_T, rotated_TT;
	ripemd160_rol first_rol_blk (first_rotate, partial_T, rotated_T);
	ripemd160_rol second_rol_blk (second_rotate, partial_TT, rotated_TT);
	always @ (posedge clk)
	begin
		A <= E;
		B <= rotated_T + E;
		C <= B;
		D <= {C[21:0], C[31:22]};
		E <= D;
		AA <= EE;
		BB <= rotated_TT + EE;
		CC <= BB;
		DD <= {CC[21:0], CC[31:22]};
		EE <= DD;
		round <= round + 7'd1;
		if (round == 80 && !tx_done)
		begin
			tx_done <= 1'b1;
			/*{tx_hash[31:24],tx_hash[23:16],tx_hash[15:8],tx_hash[7:0]} <= 32'hEFCDAB89 + C + DD;
			{tx_hash[63:56],tx_hash[55:48],tx_hash[47:40],tx_hash[39:32]} <= 32'h98BADCFE + D + EE;
			{tx_hash[95:88],tx_hash[87:80],tx_hash[79:72],tx_hash[71:64]} <= 32'h10325476 + E + AA;
			{tx_hash[127:120],tx_hash[119:112],tx_hash[111:104],tx_hash[103:96]} <= 32'hC3D2E1F0 + A + BB;
			{tx_hash[159:152],tx_hash[151:144],tx_hash[143:136],tx_hash[135:128]} <= 32'h67452301 + B + CC;*/
			{tx_hash[135:128],tx_hash[143:136],tx_hash[151:144],tx_hash[159:152]} <= 32'hEFCDAB89 + C + DD;
			{tx_hash[103:96],tx_hash[111:104],tx_hash[119:112],tx_hash[127:120]} <= 32'h98BADCFE + D + EE;
			{tx_hash[71:64],tx_hash[79:72],tx_hash[87:80],tx_hash[95:88]} <= 32'h10325476 + E + AA;
			{tx_hash[39:32],tx_hash[47:40],tx_hash[55:48],tx_hash[63:56]} <= 32'hC3D2E1F0 + A + BB;
			{tx_hash[7:0],tx_hash[15:8],tx_hash[23:16],tx_hash[31:24]} <= 32'h67452301 + B + CC;
		end
		if (rx_reset)
		begin
			{E, D, C, B, A} <= 160'hC3D2E1F01032547698BADCFEEFCDAB8967452301;
			{EE, DD, CC, BB, AA} <= 160'hC3D2E1F01032547698BADCFEEFCDAB8967452301;
			tx_done <= 1'b0;
			round <= 0;
			block[`IDX(0)] <= {rx_hash[231:224],rx_hash[239:232],rx_hash[247:240],rx_hash[255:248]};
			block[`IDX(1)] <= {rx_hash[199:192],rx_hash[207:200],rx_hash[215:208],rx_hash[223:216]};
			block[`IDX(2)] <= {rx_hash[167:160],rx_hash[175:168],rx_hash[183:176],rx_hash[191:184]};
			block[`IDX(3)] <= {rx_hash[135:128],rx_hash[143:136],rx_hash[151:144],rx_hash[159:152]};
			block[`IDX(4)] <= {rx_hash[103:96],rx_hash[111:104],rx_hash[119:112],rx_hash[127:120]};
			block[`IDX(5)] <= {rx_hash[71:64],rx_hash[79:72],rx_hash[87:80],rx_hash[95:88]};
			block[`IDX(6)] <= {rx_hash[39:32],rx_hash[47:40],rx_hash[55:48],rx_hash[63:56]};
			block[`IDX(7)] <= {rx_hash[7:0],rx_hash[15:8],rx_hash[23:16],rx_hash[31:24]};
			block[`IDX(8)] <= 32'h00000080;
			block[`IDX(9)] <= 32'h00000000;
			block[`IDX(10)] <= 32'h00000000;
			block[`IDX(11)] <= 32'h00000000;
			block[`IDX(12)] <= 32'h00000000;
			block[`IDX(13)] <= 32'h00000000;
			block[`IDX(14)] <= 32'h00000100;  // Message length
			block[`IDX(15)] <= 32'h00000000;
		end
	end
endmodule