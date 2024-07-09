module outputs)
   wire [89:0] 		out;			// From test of Test.v
   wire [44:0] 		line0;
   wire [44:0] 		line1;
   // End of automatics
   Test test (/*AUTOINST*/
	      // Outputs
	      .out			(out[89:0]),
	      .line0			(line0[44:0]),
	      .line1			(line1[44:0]),
	      // Inputs
	      .clk			(clk),
	      .in			(in[89:0]));
   // Test loop
   always @ (posedge clk) begin
`ifdef TEST_VERBOSE
      $write("[%0t] cyc==%0d in=%x out=%x\n",$time, cyc, in, out);
`endif
      cyc <= cyc + 1;
      if (cyc==0) begin
	 // Setup
	 in <= 90'h3FFFFFFFFFFFFFFFFFFFFFF;
      end
      else if (cyc==10) begin
         if (in==out) begin
	    $write("*-* All Finished *-*\n");
	    $finish;
	 end
	 else begin
	   $write("*-* Failed!! *-*\n");
	    $finish;
	 end
      end
   end
endmodule