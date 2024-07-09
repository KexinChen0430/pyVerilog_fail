module top(input clk, stb, [DIN_N-1:0] di, output do);
	parameter integer DIN_N = `N_DI;
	parameter integer DOUT_N = `N_LUT + `N_BRAM;
	wire [DIN_N-1:0] di_buf;
	genvar i;
	generate
		for (i = 0; i < `N_DI; i = i+1) begin:di_bufs
		    IBUF ibuf(.I(di[i]), .O(di_buf[i]));
		end
	endgenerate
	reg [DIN_N-1:0] din;
	wire [DOUT_N-1:0] dout;
	reg [DIN_N-1:0] din_shr;
	reg [DOUT_N-1:0] dout_shr;
	always @(posedge clk) begin
		din_shr <= {din_shr, di_buf};
		dout_shr <= {dout_shr, din_shr[DIN_N-1]};
		if (stb) begin
			din <= din_shr;
			dout_shr <= dout;
		end
	end
	assign do = dout_shr[DOUT_N-1];
	roi roi (
		.clk(clk),
		.din(din[7:0]),
		.dout(dout)
	);
endmodule