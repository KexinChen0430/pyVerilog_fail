module tb_mult();
//	tb_mult_m #(8) test();
	genvar i;
	generate
	for (i = 2; i <= `MAX_M; i = i + 1) begin : FOO
		tb_mult_m #(i) test();
	end
	endgenerate
endmodule