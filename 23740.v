module block #(
	parameter M = 8
) (
	input [M-1:0] in,
	input clk,
	input start,
	output [M-1:0] out
);
	if (`CONFIG_BERLEKAMP) begin
	reg [M-2:0] b = 0;
	reg i = 0;
	reg s = 0;
	always @(posedge clk) begin
		s <= start;
		if (start) begin
			b <= b[M-2:0];
			i <= in[M-1:0];
		end else begin
			i <= in[M-2];
			b <= b << 1;
		end
	end
	berlekamp_inverter #(M) inv(
		.clk(clk),
		.start(s),
		.standard_in(i),
		.standard_out(out)
	);
	end else
	fermat_inverter #(M) inv(
		.clk(clk),
		.start(start),
		.standard_in(in),
		.dual_out(out)
	);
endmodule