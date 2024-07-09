module  fp16_smult (
	input wire [31: 0] a,
	input wire [31: 0] b,
	output reg [31: 0] prod
);
function  [31: 0] fp16_mult;
	input [31: 0] a;
	input [31: 0] b;
	reg [31: 0] prod;
	reg [31: 0] product_hi;
	reg [31: 0] product_lo;
	reg [31: 0] A;
	reg [31: 0] B;
	reg [31: 0] C;
	reg [31: 0] D;
	reg [31: 0] AC;
	reg [31: 0] BD;
	reg [31: 0] AD_CB;
	reg [31: 0] ad_cb_temp;
	begin
		A = (a >> 16);
		B = a & 'hFFFF;
		C = (b >> 16);
		D = b & 'hFFFF;
		AC = A * C;
		BD = B * D;
		AD_CB = A * D + C * B;
		ad_cb_temp = AD_CB << 16;
		product_hi = AC + (AD_CB);
		product_lo = BD + ad_cb_temp;
		if (product_lo < BD) begin
			product_lo = product_lo + 1;
		end
		prod = (product_hi << 16) | (product_lo >> 16);//{product_hi[15: 0], product_lo[15: 0]};
		if (product_hi >> 31 != product_lo >> 15) begin
			prod = `FP16_OVERFLOW;
		end
		fp16_mult = prod;
	end
	endfunction
	always @(*) begin
		prod = fp16_mult(a, b);
		if (prod == `FP16_OVERFLOW) begin
			prod = ((a >= 0) == (b >= 0)) ? `FP16_MAXIMUM : `FP16_MINIMUM;
		end
	end
endmodule