module implementation */
rc4 rc4mod(
	.clk(clk),
	.rst(rst),
	.password_input(password_input),
	.output_ready(output_ready),
	.K(K)
);
/* Simulation */
integer q;
initial begin
	password[0] = 8'h01; // Testvectors http://tools.ietf.org/html/draft-josefsson-rc4-test-vectors-02#page-4
	password[1] = 8'h02; //
	password[2] = 8'h03; //
	password[3] = 8'h04; //
	password[4] = 8'h05; //
	password[5] = 8'h06; //
	password[6] = 8'h07; //
//	 Key length: 56 bits.
// key: 0x01020304050607
// DEC    0 HEX    0:  29 3f 02 d4  7f 37 c9 b6   33 f2 af 52  85 fe b4 6b
	$display ("Start...");
	clk = 0;
	rst = 1;
	clkcount =0;
	password_input=password[clkcount];
	#(1*tck)
	rst = 0;
	#(program_cycles*tck+100000)
	$display ("Finish.");
	$finish;
end
endmodule