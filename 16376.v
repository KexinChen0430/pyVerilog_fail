module LZD_4bit_tb;
	 reg [3:0]in;
	 wire valid;
	 wire [1:0]out;
	 parameter n=16;      // parameter declaration for convenience of code reutilization
	 integer i;					// integer for "for loop"
	 LZD_4bit  tb2( .in(in), .out(out), .valid(valid)); // instantiation
	 initial
		begin
			for( i=0; i<n; i=i+1)
				#10  assign in= {i};			// loop to assign values
		end
endmodule