module tb_mac_base;
	// Inputs
	reg clk;
	reg sof;
	reg [79:0] A;
	reg [15:0] B;
	// Outputs
	wire [179:0] C;
	wire [4:0] valid;
	// Instantiate the Unit Under Test (UUT)
	multi_MAC_Base uut (
		.clk(clk),
		.sof(sof),
		.A(A),
		.B(B),
		.C(C),
		.valid(valid)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		sof = 0;
		A = 0;
		B = 0;
		#310
		A = 80'h00020007000900030005; B = 16'h0004;
		#20
		sof = 1'b1;
		#200
		#100
		$stop;
	end
	always
		 #`clkperiodby2 clk <= ~clk;
endmodule