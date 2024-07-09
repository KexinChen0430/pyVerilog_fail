module decoder_complex_tb;
	/* inputs and control signals */
	reg [7:0] opcode;
	reg clk;
	/* output signal */
	wire [5:0] rom_offset;
	/* unit under testing */
	decoder_complex uut (
			.opcode(opcode),
			.rom_offset(rom_offset)
		);
	initial begin
		/* signal initialization */
		opcode = 0;
		clk = 0;
		/* finish simulation */
		#1000	$finish;
	end
	always
		#50		clk = ~clk;
	always @(posedge clk)
		opcode = opcode + 1'b1;
endmodule