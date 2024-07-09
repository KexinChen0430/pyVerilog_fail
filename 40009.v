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
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd231;
										// Push 8...
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd230;
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
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd201;
										// Pop 8...
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
										// Try push and pull
/*
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd0;
		d_in=8'd18;
*/
										// Push  3 in
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd18;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
/*
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd74;
		#10
		rst=1'd0;
		push_cb=1'd1;
		pop_cb=1'd0;
		d_in=8'd138;
										// Pop 3 out
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
		#10
		rst=1'd0;
		push_cb=1'd0;
		pop_cb=1'd1;
		d_in=8'd12;
*/
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule