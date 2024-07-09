module LZD_16bit_tb;
	 reg [15:0]in;
	 wire valid;
	 wire [3:0]out;
	 parameter n=65536;
	 integer i,j;
	 LZD_16bit  tb4( .in(in), .out(out), .valid(valid));
	 initial
		begin
		assign j=1;
			for( i=0; i<n; i=i+j)
				begin
				#1  assign in= {i};
				assign j=j*2;
				end
		end
endmodule