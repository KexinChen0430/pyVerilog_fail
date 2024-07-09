module, output goes to output, parity gen, and comparator
	register_10bit U4(clk, data_in, {odd_in, data_out});
	// 9-bit parity generator
	// Input from data_out, output to comparator
	hc280 U5(data_out, even, odd);
	// Parity bit comparator (XNOR gate). Since the hc280 outputs high on odd when
	// there is an odd number of 1s in its input, this odd output is used as an even
	// parity bit (odd number of 1s plus another 1 = even number of ones). So XNOR is
	// used to check if there is either an odd number of ones and a high even parity
	// bit or an even number of ones and a low even parity bit.
	xnor U6(data_valid, odd, odd_in);
endmodule