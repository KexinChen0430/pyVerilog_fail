module sha256_chunk(
		input wire clk, input wire [511:0] data, input wire [255:0] V_in, output wire [255:0] hash
	);
	/*
	design choices:
	select parts of data via shifter or by muxing
	use hash output as temp storage
	*/
	function [31:0] rotate (input [31:0] data, input [4:0] shift);
		// from http://stackoverflow.com/questions/6316653/defining-a-rightrotate-function-with-non-fixed-rotation-length/6317189#6317189
		reg [63:0] tmp;
		begin
		  tmp = {data, data} >> shift;
		  rotate = tmp[31:0];
		end
	endfunction
	function [31:0] flipbytes (input [31:0] data);
		flipbytes = {data[7:0], data[15:8], data[23:16], data[31:24]};
	endfunction
	// State:
	reg [255:0] V;
	reg [31:0] R[7:0]; // R[0] through R[7] represent a through h
	reg [31:0] w[15:0];
	// round computation
	// nw and nR are the computation of w and R for the next round.
	reg [31:0] nw, nR[7:0], s0, s1, S1, ch, temp1, S0, maj, temp2;
	wire [31:0] k;
	karray karray(.idx(roundnum), .k(k));
	// On round i, we calculate nw=w[i+16].
	assign hash[31:0] = V[31:0] + nR[0];
	assign hash[63:32] = V[63:32] + nR[1];
	assign hash[95:64] = V[95:64] + nR[2];
	assign hash[127:96] = V[127:96] + nR[3];
	assign hash[159:128] = V[159:128] + nR[4];
	assign hash[191:160] = V[191:160] + nR[5];
	assign hash[223:192] = V[223:192] + nR[6];
	assign hash[255:224] = V[255:224] + nR[7];
	reg [5:0] roundnum = 0;
	always @(*) begin
		s0 = rotate(w[1], 7) ^ rotate(w[1], 18) ^ (w[1] >> 3);
		s1 = rotate(w[14], 17) ^ rotate(w[14], 19) ^ (w[14] >> 10);
		nw = w[0] + s0 + w[9] + s1;
		S1 = rotate(R[4], 6) ^ rotate(R[4], 11) ^ rotate(R[4], 25);
		ch = (R[4] & R[5]) ^ ((~R[4]) & R[6]);
		temp1 = R[7] + S1 + ch + k + w[0];
		S0 = rotate(R[0], 2) ^ rotate(R[0], 13) ^ rotate(R[0], 22);
		maj = (R[0] & R[1]) ^ (R[0] & R[2]) ^ (R[1] & R[2]);
		temp2 = S0 + maj;
		nR[7] = R[6];
		nR[6] = R[5];
		nR[5] = R[4];
		nR[4] = R[3] + temp1;
		nR[3] = R[2];
		nR[2] = R[1];
		nR[1] = R[0];
		nR[0] = temp1 + temp2;
	end
	always @(posedge clk) begin
		if (roundnum == 6'b111111) begin
			V <= V_in;
			R[0] <= V_in[31:0];
			R[1] <= V_in[63:32];
			R[2] <= V_in[95:64];
			R[3] <= V_in[127:96];
			R[4] <= V_in[159:128];
			R[5] <= V_in[191:160];
			R[6] <= V_in[223:192];
			R[7] <= V_in[255:224];
			w[0] <= flipbytes(data[31:0]);
			w[1] <= flipbytes(data[63:32]);
			w[2] <= flipbytes(data[95:64]);
			w[3] <= flipbytes(data[127:96]);
			w[4] <= flipbytes(data[159:128]);
			w[5] <= flipbytes(data[191:160]);
			w[6] <= flipbytes(data[223:192]);
			w[7] <= flipbytes(data[255:224]);
			w[8] <= flipbytes(data[287:256]);
			w[9] <= flipbytes(data[319:288]);
			w[10] <= flipbytes(data[351:320]);
			w[11] <= flipbytes(data[383:352]);
			w[12] <= flipbytes(data[415:384]);
			w[13] <= flipbytes(data[447:416]);
			w[14] <= flipbytes(data[479:448]);
			w[15] <= flipbytes(data[511:480]);
		end else begin
			R[0] <= nR[0];
			R[1] <= nR[1];
			R[2] <= nR[2];
			R[3] <= nR[3];
			R[4] <= nR[4];
			R[5] <= nR[5];
			R[6] <= nR[6];
			R[7] <= nR[7];
			w[0] <= w[1];
			w[1] <= w[2];
			w[2] <= w[3];
			w[3] <= w[4];
			w[4] <= w[5];
			w[5] <= w[6];
			w[6] <= w[7];
			w[7] <= w[8];
			w[8] <= w[9];
			w[9] <= w[10];
			w[10] <= w[11];
			w[11] <= w[12];
			w[12] <= w[13];
			w[13] <= w[14];
			w[14] <= w[15];
			w[15] <= nw;
		end
		roundnum <= roundnum + 1'b1;
	end
endmodule