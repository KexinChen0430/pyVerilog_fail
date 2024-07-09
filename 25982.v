module mcrom_tb;
	/* input and signals */
	reg [ 5 : 0] offset;
	reg clk;
	/* output */
	wire [`MCROM_WIDTH - 1 : 0] mc_word;
	/* unit under testing */
	microcode_rom uut (
			.offset(offset),
			.mc_word(mc_word)
		);
	initial begin
		/* initialize signals */
		offset = 0;
		clk = 0;
		/* end simulation after 1000 ticks */
		#1000	$finish;
	end
	always
		#50		clk = ~clk;
	always @(posedge clk)
		offset = offset + 1;
endmodule