module divider_rad4 (clk,rst,load,n,d,q,r,ready,almost_done);
`include "log2.inc"
parameter WIDTH_N = 32;	// assumed to be EVEN
parameter WIDTH_D = 32;
localparam LOG2_WIDTH_N = log2(WIDTH_N);
localparam MIN_ND = (WIDTH_N <WIDTH_D ? WIDTH_N : WIDTH_D);
input clk,rst;
input load;					// load the numer and denominator
input [WIDTH_N-1:0] n;		// numerator
input [WIDTH_D-1:0] d;		// denominator
output [WIDTH_N-1:0] q;		// quotient
output [WIDTH_D-1:0] r;		// remainder
output ready;				// Q and R are valid now.
output almost_done;
reg [WIDTH_N + MIN_ND + 1 : 0] working;
reg [WIDTH_D-1 : 0] denom;
reg [WIDTH_D+1 : 0] triple_denom;
reg ready;
reg almost_done;
wire [WIDTH_N-1:0] lower_working = working [WIDTH_N-1:0];
wire [MIN_ND + 1:0] upper_working = working [WIDTH_N + MIN_ND + 1: WIDTH_N];
wire [WIDTH_D + 2:0] minus_zero = upper_working;
wire [WIDTH_D + 2:0] minus_one = upper_working - denom;
wire [WIDTH_D + 2:0] minus_two = upper_working - (denom << 1);
wire [WIDTH_D + 2:0] minus_three = upper_working - triple_denom;
wire [1:0] quot_bits = {!minus_two[WIDTH_D+2],
			!minus_one[WIDTH_D+2] &
				!(minus_three[WIDTH_D+2] ^ minus_two[WIDTH_D+2])};
wire [WIDTH_D + 2:0] appro_minus =
			quot_bits[1] ? (quot_bits[0] ? minus_three : minus_two) :
						(quot_bits[0] ? minus_one : minus_zero);
reg [LOG2_WIDTH_N:0] cntr;
wire cntr_zero = ~|cntr;
//assign ready = cntr_zero;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		working <= 0;
		denom <= 0;
		triple_denom <= 0;
		cntr <= 0;
    ready <= 0;
    almost_done <=  0;
	end
	else begin
		if (load) begin
			working <= {{MIN_ND{1'b0}},n,2'b0};
			cntr <= (WIDTH_N >> 1);
			denom <= d;
			triple_denom <= (d + (d << 1));
		end
		else begin
			if (!cntr_zero) begin
				cntr <= cntr - 1;
				working <= {appro_minus[WIDTH_D-1:0],lower_working,quot_bits};
			end
      ready <=  (cntr ==  1)  ? 1'b1  : 1'b0;
      almost_done <=  (cntr ==  4)  ? 1'b1  : 1'b0;
		end
	end
end
assign q = lower_working;
assign r = upper_working >> 2;
endmodule