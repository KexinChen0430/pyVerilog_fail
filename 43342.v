module divider (clk,rst,load,n,d,q,r,ready);
`include "log2.inc"
parameter WIDTH_N = 32;
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
reg [WIDTH_N + MIN_ND : 0] working;
reg [WIDTH_D-1 : 0] denom;
wire [WIDTH_N-1:0] lower_working = working [WIDTH_N-1:0];
wire [MIN_ND:0] upper_working = working [WIDTH_N + MIN_ND : WIDTH_N];
wire [WIDTH_D:0] sub_result = upper_working - denom;
wire sub_result_neg = sub_result[WIDTH_D];
reg [LOG2_WIDTH_N:0] cntr;
wire cntr_zero = ~|cntr;
assign ready = cntr_zero;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		working <= 0;
		denom <= 0;
		cntr <= 0;
	end
	else begin
		if (load) begin
			working <= {{WIDTH_D{1'b0}},n,1'b0};
			cntr <= WIDTH_N;
			denom <= d;
		end
		else begin
			if (!cntr_zero) begin
				cntr <= cntr - 1;
				working <= sub_result_neg ? {working[WIDTH_N+MIN_ND-1:0],1'b0} :
						{sub_result[WIDTH_D-1:0],lower_working,1'b1};
			end
		end
	end
end
assign q = lower_working;
assign r = upper_working >> 1;
endmodule