module body
	// Hookup DCT units
	dctu #(coef_width, di_width, v, 3'h0)
	dct_unit_0 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout0)
	);
	dctu #(coef_width, di_width, v, 3'h1)
	dct_unit_1 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout1)
	);
	dctu #(coef_width, di_width, v, 3'h2)
	dct_unit_2 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout2)
	);
	dctu #(coef_width, di_width, v, 3'h3)
	dct_unit_3 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout3)
	);
	dctu #(coef_width, di_width, v, 3'h4)
	dct_unit_4 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout4)
	);
	dctu #(coef_width, di_width, v, 3'h5)
	dct_unit_5 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout5)
	);
	dctu #(coef_width, di_width, v, 3'h6)
	dct_unit_6 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout6)
	);
	dctu #(coef_width, di_width, v, 3'h7)
	dct_unit_7 (
		.clk(clk),
		.ena(ena),
		.ddgo(ddgo),
		.x(x),
		.y(y),
		.ddin(ddin),
		.dout(dout7)
	);
endmodule