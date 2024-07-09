module is for the square root function analysis
sqrt sq(.clk(clk), .e(e), .f(f), .g0_(g0_), .g1_(g1_), .g0(g0), .g1(g1), .quad_(quad_), .quad(quad));
//mul_cal block calculates the final product g0*f, g1*f
mul_cal m_c(.clk(clk), .f(f), .g0(g0), .g1(g1), .x0(awgn_out_0), .x1(awgn_out_1), .quad(quad));
endmodule