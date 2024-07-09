module xilinx_inverter #(
	parameter M = 8
) (
	input [M-1:0] data_in,
	input clk_in,
	input start,
	output [M-1:0] data_out
);
	wire [M-1:0] data_in0;
	wire start0;
	wire [M-1:0] data_out0;
	BUFG u_bufg (
		.I(clk_in),
		.O(clk)
	);
	pipeline #(2) u_output [M-1:0] (
		.clk(clk),
		.i({data_out0}),
		.o({data_out})
	);
	pipeline #(2) u_input [M:0] (
		.clk(clk),
		.i({data_in, start}),
		.o({data_in0, start0})
	);
	genvar i;
	for (i = 0; i < 100; i = i + 1) begin : FOO
		wire [M-1:0] out;
		if (i == 0)
			block #(M) inv(
				.clk(clk),
				.start(start0),
				.in(data_in0),
				.out(out)
			);
		else
			block #(M) inv(
				.clk(clk),
				.start(start0),
				.in(FOO[i-1].out),
				.out(out)
			);
	end
	assign data_out0 = FOO[99].out;
endmodule