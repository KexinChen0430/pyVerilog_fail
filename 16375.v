module LZD_2bit_tb;
	 reg [1:0]in;
	 wire valid;
	 wire out;
	 parameter n=4;    // parameter for convenience of code utilization
	 integer i;
	 LZD_2bit  tb1( .in(in), .out(out), .valid(valid));
	 initial
		begin
			for( i=0; i<n; i=i+1)
				#10  assign in= {i}; // loop is used to assign values to input
		end
endmodule