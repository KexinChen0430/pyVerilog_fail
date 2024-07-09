module body
	// hookup cosine-table
	always @(posedge clk)
	  if(ena)
	    coef <= #1 dct_cos_table(x, y, u, v);
	// hookup dct-mac unit
	dct_mac #(8, coef_width)
	macu (
		.clk(clk),
		.ena(ena),
		.dclr(ddgo),
		.din(ddin),
		.coef( coef[31:31 -coef_width +1] ),
		.result(result)
	);
	assign dout = result[coef_width +10: coef_width -1];
endmodule