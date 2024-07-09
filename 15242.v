module at the start
	 */
	always begin
    	// Clock frequency is arbitrarily chosen; Period=10ns
    	#5 clock = 0;
    	#5 clock = 1;
    end
	/**
	 */
	seq_detect sqd (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		inp,clock,reset,error,match_op);
	/**
	 */
	initial
	begin
		$sdf_annotate("../sdf/seq_detect.sdf",sqd,"TYPICAL", "1.0:1.0:1.0", "FROM_MTM");
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
		// @ t=0; reset the sequence detector
		inp = 1'd0;
		reset = 1'd0;
		// @ t=10,
		#10
		inp = 1'd0;
		reset = 1'd1;
		// @ t=20
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=30
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=40
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=50
		#10
		inp = 1'dx;
		reset = 1'd0;
		// @ t=60
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=70
		#10
		inp = 1'dz;
		reset = 1'd0;
		// @ t=80
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=90
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=100
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=110
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=120
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=130
		#10
// Start of correct sequence
$display($time, " << Start of correct sequence >>");
		inp = 1'd1;
		reset = 1'd0;
		// @ t=140
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=150
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=160
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=170
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=180
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=190
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=200
		#10
		inp = 1'd1;
		reset = 1'd0;
		// End of correct sequence
		$display($time, " << End of correct sequence >>");
		// @ t=210
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=220
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=230
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=240; reset the sequence detector
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=250
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=260
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=270
		#10
		inp = 1'd1;
		reset = 1'd1;
		// @ t=280
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=290
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=300
		#10
		inp = 1'dx;
		reset = 1'd0;
		// @ t=310
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=320
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=330
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=340
		#10
		inp = 1'dx;
		reset = 1'd0;
		// @ t=350
		#10
		inp = 1'dx;
		reset = 1'd0;
		// @ t=360
		#10
		inp = 1'dz;
		reset = 1'd0;
		// @ t=370
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=380
		#10
		inp = 1'd1;
		reset = 1'd0;
		// @ t=390
		#10
		inp = 1'd0;
		reset = 1'd0;
		// @ t=400
		#10
		inp = 1'd1;
		reset = 1'd0;
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule