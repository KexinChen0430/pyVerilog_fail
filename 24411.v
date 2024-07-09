module top(input clk, stb, di, output do);
	localparam integer DIN_N = 6;
	localparam integer DOUT_N = `N;
	reg [DIN_N-1:0] din;
	wire [DOUT_N-1:0] dout;
	reg [DIN_N-1:0] din_shr;
	reg [DOUT_N-1:0] dout_shr;
	always @(posedge clk) begin
		din_shr <= {din_shr, di};
		dout_shr <= {dout_shr, din_shr[DIN_N-1]};
		if (stb) begin
			din <= din_shr;
			dout_shr <= dout;
		end
	end
	assign do = dout_shr[DOUT_N-1];
	roi roi (
		.clk(clk),
		.din(din),
		.dout(dout)
	);
endmodule