module body
	reg ddstrb;
	always @(posedge clk)
	  ddstrb <= #1 dstrb;
	// generate run-length encoded signals
	jpeg_rle1 rle(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.go(ddstrb),
		.din(din),
		.rlen(rle_rlen),
		.size(rle_size),
		.amp(rle_amp),
		.den(rle_den),
		.dcterm(rle_dc)
	);
	// Find (15,0) (0,0) sequences and replace by (0,0)
	// There can be max. 4 (15,0) sequences in a row
	// step1
	jpeg_rzs rz1(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.rleni(rle_rlen),
		.sizei(rle_size),
		.ampi(rle_amp),
		.deni(rle_den),
		.dci(rle_dc),
		.rleno(rz1_rlen),
		.sizeo(rz1_size),
		.ampo(rz1_amp),
		.deno(rz1_den),
		.dco(rz1_dc)
	);
	// step2
	jpeg_rzs rz2(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.rleni(rz1_rlen),
		.sizei(rz1_size),
		.ampi(rz1_amp),
		.deni(rz1_den),
		.dci(rz1_dc),
		.rleno(rz2_rlen),
		.sizeo(rz2_size),
		.ampo(rz2_amp),
		.deno(rz2_den),
		.dco(rz2_dc)
	);
	// step3
	jpeg_rzs rz3(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.rleni(rz2_rlen),
		.sizei(rz2_size),
		.ampi(rz2_amp),
		.deni(rz2_den),
		.dci(rz2_dc),
		.rleno(rz3_rlen),
		.sizeo(rz3_size),
		.ampo(rz3_amp),
		.deno(rz3_den),
		.dco(rz3_dc)
	);
	// step4
	jpeg_rzs rz4(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.rleni(rz3_rlen),
		.sizei(rz3_size),
		.ampi(rz3_amp),
		.deni(rz3_den),
		.dci(rz3_dc),
		.rleno(rz4_rlen),
		.sizeo(rz4_size),
		.ampo(rz4_amp),
		.deno(rz4_den),
		.dco(rz4_dc)
	);
	// assign outputs
	assign rlen   = rz4_rlen;
	assign size   = rz4_size;
	assign amp    = rz4_amp;
	assign douten = rz4_den;
	assign bstart = rz4_dc;
endmodule