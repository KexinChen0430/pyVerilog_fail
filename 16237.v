module at the start
	 */
	always begin
    	/**
		 */
    	#5 clock = 0;
    	#5 clock = 1;
    end
	// ============================================================
	/**
	 */
	program_counter2 pc2 (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		// next_pc,cur_pc,rst,clk
		n_pc,reset,clock);
	// ============================================================
	/**
	 */
	initial
	begin
		$sdf_annotate("../sdf/program_counter2.sdf",pc2,"TYPICAL", "1.0:1.0:1.0", "FROM_MTM");
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
		//c_pc=$random;
		reset=1'b1;
		#20
		//c_pc=200;
		reset=1'b0;
		// Write to 8 data locations
		for(count=200; count<216; count=count+1)
		begin
			#10
			//c_pc=count;
			//c_pc=n_pc;
			reset=1'b0;
		end
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule