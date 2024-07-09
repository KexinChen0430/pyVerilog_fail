module at the start
	 */
	always begin
    	// Clock frequency is arbitrarily chosen
    	#10 clk = 0;
    	#10 clk = 1;
    end
	// Create the register (flip-flop) for the initial/1st stage
	always@(posedge clk)
	begin
		if(reset)
		begin
			r_b<=0;
			r_e<=0;
		end
		else
		begin
			r_e<=e;
			r_b<=b;
		end
	end
	// Create the register (flip-flop) for the 2nd stage
	always@(posedge clk)
	begin
		if(reset)
		begin
			r_c<=0;
			rr_e<=0;
			rr_b<=0;
		end
		else
		begin
			r_c<=c;
			rr_e<=r_e;
			rr_b<=r_b;
		end
	end
	// Create the register (flip-flop) for the 3rd stage
	always@(posedge clk)
	begin
		if(reset)
		begin
			rb<=0;
		end
		else
		begin
			r_qx<=cx;
			rb<=rr_b;
			e2<=rr_e;
		end
	end
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display(" << Starting the simulation >>");
		reset=1;
		#20;
		reset=0;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000100000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000010000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000001000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#20;
		b = $random;
		e = 17'b00000000000000000;
		$display(q, "<< Displaying q >>");
		$display(rb, "<< Displaying rb >>");
		#300;
		$display(" << Finishing the simulation >>");
		$finish;
	end
endmodule