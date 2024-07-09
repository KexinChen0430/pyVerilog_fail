module LZD_8bit_tb;
	 reg [7:0]in;
	 wire valid;
	 wire [2:0]out;
	 parameter n=256;
	 integer i,j;
	 LZD_8bit  tb3( .in(in), .out(out), .valid(valid));
	 initial
		begin
		assign j=1;
			for( i=0; i<n; i=i+j)
				begin
				#5  assign in= {i};
				j=j*2;
				end
		end
endmodule