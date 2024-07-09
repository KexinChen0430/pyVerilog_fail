module at the start
	 */
//	always begin
    	/**
		 */
//    	#5 clock = 0;
//    	#5 clock = 1;
//    end
	// ============================================================
	/**
	 */
	instr_mem im (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		instruction_address,instruction,enable);
	// ============================================================
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
		instruction_address=32'd10;
		enable=1'd0;
		counter=32'd0;
		#30
		instruction_address=32'd0;
		enable=1'd1;
		//counter=32'd0;
		#30
		instruction_address=32'd1;
		enable=1'd1;
		#30
		instruction_address=32'd2;
		enable=1'd1;
		#30
		instruction_address=32'd3;
		enable=1'd1;
		/*
		instruction_address=8'd200;
		reset=1'b0;
		*/
		// Try reading the instruction memory without being reset
		for(count=0;count<=size_of_input2;count=count+1)
		begin
			#10
			// Randomly set the instruction address to a value
			instruction_address=counter;
			// Reset the instruction memory
			enable=1'b1;
			counter=counter+3'd1;
		end
		// Reset the instruction memory
		#10
		instruction_address=8'd180;
		enable=1'b0;
		// Read the instruction memory after being reset
		for(count=0;count<=size_of_input;count=count+1)
		begin
			#10
			// Randomly set the instruction address to a value
			instruction_address=counter;
			// Reset the instruction memory
			enable=1'b1;
			counter=counter+3'd1;
		end
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule