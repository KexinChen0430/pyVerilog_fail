module
	wire [WIDTH-1:0] y, a, in_x, x, in_rh, in_rl, alu_out, q;
	wire [WIDTH*2-1:0] r, sr;
	register reg_y(clk, multiplicand, y, c0, 1'b0);
	register reg_a(clk, r[WIDTH*2-1:WIDTH], a, c14, c2);
	register reg_x(clk, in_x, x, c3, 1'b0);
	register_hl reg_r(clk, in_rh, in_rl, c8, c9, 1'b0, r);
	right_shift_register sign_ext(clk, c12, r, c11, sr);
	mux2 #(8) mux_x(multiplier, r[WIDTH-1:0], c7, in_x);
	mux3 #(8) mux_rh(a, sr[WIDTH*2-1:WIDTH], alu_out, {c5,c4}, in_rh);
	mux2 #(8) mux_rl(x, sr[WIDTH-1:0], c6, in_rl);
	addsub addsub(r[WIDTH*2-1:WIDTH], y, c10, clk, alu_out);
	counter_down decrement8(clk, c1, c13, q);
	// External: signals to control unit and outbus
	assign product = {a,x};
	assign zr = ~r[0];
	assign zq = ~q[0] & ~q[1] & ~q[2]; // zq = 1 when q = 0 (3'b000) from 7 (3'b111)
endmodule