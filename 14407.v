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
	regfile rg (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		d_out,d_in,w_addr,r_addr,wr_en,clock);
	// ============================================================
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
		// @ t=0; reset the sequence detector
		d_in=8'd6;
		w_addr=3'd0;
		r_addr=3'd0;
		wr_en=1;
		#10
		d_in=8'd7;
		w_addr=3'd0;
		r_addr=3'd0;
		wr_en=0;
		// Write...
		#10
		d_in=8'd6;
		w_addr=3'd2;
		r_addr=3'd0;
		wr_en=1;
		#10
		d_in=8'd5;
		w_addr=3'd3;
		r_addr=3'd1;
		wr_en=1;
		#10
		d_in=8'd100;
		w_addr=3'd4;
		r_addr=3'd7;
		wr_en=1;
		#10
		d_in=8'd200;
		w_addr=3'd5;
		r_addr=3'd6;
		wr_en=1;
		// Read...
		#10
		d_in=8'd3;
		w_addr=3'd4;
		r_addr=3'd2;
		wr_en=0;
		#10
		d_in=8'd2;
		w_addr=3'd5;
		r_addr=3'd3;
		wr_en=0;
		#10
		d_in=8'd1;
		w_addr=3'd6;
		r_addr=3'd4;
		wr_en=0;
		#10
		d_in=8'd0;
		w_addr=3'd7;
		r_addr=3'd5;
		wr_en=0;
		#10
		d_in=8'd5;
		w_addr=3'd7;
		r_addr=3'd1;
		wr_en=1;
		#10
		d_in=8'd0;
		w_addr=3'd2;
		r_addr=3'd7;
		wr_en=0;
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule