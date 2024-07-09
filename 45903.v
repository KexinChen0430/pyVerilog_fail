module lineto_test;
	reg clk = 0;
	reg reset = 1;
	parameter BITS = 16;
	reg strobe = 0;
	reg [BITS-1:0] x_in = 0;
	reg [BITS-1:0] y_in = 0;
	wire ready;
	wire [BITS-1:0] x_out;
	wire [BITS-1:0] y_out;
	always #5 clk = !clk;
	always begin
		# 50 reset <= 0;
		# 50 x_in <= 10000; y_in <= 3000; strobe <= 1;
		# 10 strobe <= 0;
		# 1000000 x_in <= 3000; y_in <= 10000; strobe <= 1;
		# 10 strobe <= 0;
		# 1000000 x_in <= 3000; y_in <= 3000; strobe <= 1;
		# 10 strobe <= 0;
		# 1000000 x_in <= 8000; y_in <= 3000; strobe <= 1;
		# 10 strobe <= 0;
		# 1000000 x_in <= 0; y_in <= 0; strobe <= 1;
		# 10 strobe <= 0;
		# 1000000 $finish;
	end
	lineto #(.BITS(BITS)) l_inst(
		.clk(clk),
		.reset(reset),
		.strobe(strobe),
		.x_in(x_in),
		.y_in(y_in),
		.ready(ready),
		.x_out(x_out),
		.y_out(y_out)
	);
	initial $monitor("%d %d %d %d", $time, x_out, y_out, ready);
endmodule