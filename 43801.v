module at the start
	 */
	always begin
    	// Clock frequency is arbitrarily chosen
    	#5 clock = 0;
    	#5 clock = 1;
    end
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display(" << Starting the simulation >>");
		// @t=0,
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=10,
		#10
		reset_sig = 1'd1;
		encoded_input = 2'd0;
		// @t=20,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=30,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=40,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=50,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd3;
		// @t=60,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd2;
		// @t=70,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=80,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd2;
		// @t=90,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=100,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd3;
		// @t=110,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=120,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=130,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=140,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd2;
		// @t=150,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=160,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=170,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd3;
		// @t=180,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=190,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd0;
		// @t=200,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd1;
		// @t=210,
		#10
		reset_sig = 1'd0;
		encoded_input = 2'd2;
		// @t=220,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=230,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=240,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=250,s
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=260,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=270,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=280,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=290,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=300,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=310,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=320,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=330,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=340,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=350,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=360,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=370,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=380,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=390,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=400,
		#10
		reset_sig = 1;
		encoded_input = $random;
		// @t=410,
		#10
		reset_sig = 0;
		encoded_input = $random;
		// @t=420,
		#10
		reset_sig = 0;
		encoded_input = $random;
		#20;
		$display(" << Finishing the simulation >>");
		$finish;
	end
endmodule