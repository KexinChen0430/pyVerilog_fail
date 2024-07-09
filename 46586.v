module at the start
	 */
	always begin
    	// Clock frequency is arbitrarily chosen
    	#5 clock = 0;
    	#5 clock = 1;
		// Period = 10 clock cycles
    end
	// ============================================================
	// Create the register (flip-flop) for the initial/1st stage
	always@(posedge clock)
	begin
		if(rset)
		begin
			r_b<=0;
			r_e<=0;
		end
		else
		begin
			r_e<=e;
			r_b<=rr;
		end
	end
	// ------------------------------------------------------------
	// Create the register (flip-flop) for the 2nd stage
	always@(posedge clock)
	begin
		if(rset)
		begin
			rr_c<=0;
			r_e1<=0;
			r_b1<=0;
		end
		else
		begin
			rr_c<=r_c;
			r_e1<=r_e;
			r_b1<=r_b;
		end
	end
	// ------------------------------------------------------------
	// Create the register (flip-flop) for the 3rd stage
	always@(posedge clock)
	begin
		if(rset)
		begin
			rr_c1<=0;
			r_cx1<=0;
			r_b2<=0;
		end
		else
		begin
			rr_c1<=rr_c;
			r_cx1<=r_cx;
			r_b2<=r_b1;
		end
	end
	// ------------------------------------------------------------
	// ============================================================
	/**
	 */
	initial
	begin
		$sdf_annotate("../sdf/viterbi_decoder.sdf",v_d,"TYPICAL", "1.0:1.0:1.0", "FROM_MTM");
		// "$time" indicates the current time in the simulation
		$display(" << Starting the simulation >>");
		// @t=0,
		error_level=8'd5;
		rset=1;
		// @t=20,
		#20
		rset=0;
		/**
		 */
		$readmemb("testfile.bit",r);
		/**
		 */
		for(count=0;count<size_of_input;count=count+1)
		begin
			#10
			$display("Next");
			e=$random;
			rr=r[count];
			if(rr_c != r_cx)
			begin
				$display($time,"rr_c NOT EQUAL to r_cx");
			end
if(count==150)
begin
	rset=1;
end
else if(count==151)
begin
	rset=0;
end
		end
// Problem with d and error_level
		#20;
		$display(" << Finishing the simulation >>");
		$finish;
	end
endmodule