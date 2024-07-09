module connection
PATTERN I_PATTERN(
	.out(out),
	.out_valid(out_valid),
	.in(in),
	.in_valid(in_valid),
	.clk(clk),
	.rst_n(rst_n),
	.circle1(circle1),
	.circle2(circle2)
);
Circle I_Circle(
	.out(out),
	.out_valid(out_valid),
	.in(in),
	.in_valid(in_valid),
	.clk(clk),
	.rst_n(rst_n),
	.circle1(circle1),
	.circle2(circle2)
);
initial begin
`ifdef RTL
	$fsdbDumpfile("Circle.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL2
	$fsdbDumpfile("Circle2.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL3
	$fsdbDumpfile("Circle3.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL4
	$fsdbDumpfile("Circle4.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL5
	$fsdbDumpfile("Circle5.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL6
	$fsdbDumpfile("Circle6.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL7
	$fsdbDumpfile("Circle7.fsdb");
	$fsdbDumpvars;
`endif
`ifdef RTL8
	$fsdbDumpfile("Circle8.fsdb");
	$fsdbDumpvars;
`endif
end
endmodule