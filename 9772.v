module at the start
	 */
	always begin
    	// Clock frequency is arbitrarily chosen; Period=10ns
    	#5 clock = 0;
    	#5 clock = 1;
    end
	// ============================================================
	/**
	 */
	FIFO fifo_cb (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		d_out,empty_cb,full_cb,d_in,push_cb,pop_cb,rst,clock);
	// ============================================================
	/**
	 */
	initial
	begin
		$sdf_annotate("../sdf/FIFO.sdf",fifo_cb,"TYPICAL", "1.0:1.0:1.0", "FROM_MTM");
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
		// @ t=0; reset the sequence detector
		rst=1'd1;						// Reset
		push_cb=1'd0;
		pop_cb=1'd0;
		d_in=8'd45;
										// Push...
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd0;
		d_in=8'd231;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd179;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd37;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd174;
										// Pop
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd45;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd145;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd245;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd24;						// Empty
										// Pop more
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd245;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd245;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd245;
										// Push
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd179;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd235;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd39;
										// Push and Pop
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd1;
		d_in=8'd201;
										// Continue pushing
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd72;
										// DO NOT PUSH NOR POP
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd0;
		d_in=8'd82;
										// Continue pushing
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd58;
		#10								// FULL
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd238;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd125;
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule