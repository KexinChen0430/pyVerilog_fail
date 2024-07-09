module
	fdct #(coef_width, di_width, 12)
	fdct_zigzag(
		.clk(clk),
		.ena(ena),
		.rst(rst),
		.dstrb(dstrb),
		.din(din),
		.dout(fdct_dout),
		.douten(fdct_doe)
	);
	// delay 'fdct_dout' => wait for synchronous quantization RAM/ROM
	always @(posedge clk)
	  if(ena)
	    dfdct_dout <= #1 fdct_dout;
	// Hookup QNR (Quantization and Rounding) unit
	jpeg_qnr
	qnr(
		.clk(clk),
		.ena(ena),
		.rst(rst),
		.dstrb(fdct_doe),
		.din(dfdct_dout),
		.qnt_val(qnt_val),
		.qnt_cnt(qnt_cnt),
		.dout(qnr_dout),
		.douten(qnr_doe)
	);
	// delay douten 1 clk_cycle => account for delayed fdct_res & qnt_val
	always @(posedge clk)
	  if(ena)
	    dqnr_doe <= #1 qnr_doe;
	// TODO: Insert DC differential generator here.
	wire [11:0] dc_diff_dout = {qnr_dout[10], qnr_dout};
	wire        dc_diff_doe = dqnr_doe;
	// Hookup Run Length Encoder
	jpeg_rle
	rle(
		.clk(clk),
		.ena(ena),
		.rst(rst),
		.dstrb(dc_diff_doe),
		.din(dc_diff_dout),
		.size(size),
		.rlen(rlen),
		.amp(amp),
		.douten(douten),
		.bstart()
	);
endmodule