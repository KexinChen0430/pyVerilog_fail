module at the start
	 */
	always begin
    	/*
		 */
    	#5 ck = 0;
    	#5 ck = 1;
    end
	/**
	 */
	conv_encoder enc (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		cout,bin,ck,rset);
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display(" << Starting the simulation >>");
		// @t=0,
		bin = 1'b0;
		rset=0;
		// @ t=3,
		#3;
		bin = 1'b1;
		rset=0;
		// @ t=10,
		#7;
		bin = 1'b0;
		rset=0;
		// @ t=19,
		#9;
		bin = 1'b1;
		rset=0;
		// @ t=29,
		#10;
		bin = 1'b0;
		rset=0;
		// @ t=39,
		#10;
		bin = 1'b1;
		rset=0;
		// @ t=50-1,
		#10;
		bin = 1'b0;
		rset=0;
		// @ t=60-1,
		#10;
		bin = 1'b1;
		rset=0;
		// @ t=70-1,
		#10;
		bin = 1'b0;
		rset=0;
		// @ t=80-1,
		#10;
		bin = 1'b0;
		rset=0;
		// @ t=90-1,
		#10;
		bin = 1'b1;
		rset=0;
		// @ t=100-1,
		#10;
		bin = 1'b1;
		rset=1;
		// @ t=110-1,
		#9;
		bin = 1'b0;
		rset=0;
		// @ t=120-1,
		#10;
		bin = 1'b1;
		rset=0;
		// @ t=130-1,
		#10;
		bin = 1'b0;
		rset=0;
		// @ t=140-1,
		#10;
		bin = 1'b1;
		rset=1;
		#20;
		$display(" << Finishing the simulation >>");
		$finish;
	end
endmodule