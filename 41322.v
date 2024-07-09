module outputs)
   wire			out1;			// From test of Test.v
   wire			out19;			// From test of Test.v
   wire			out1b;			// From test of Test.v
   // End of automatics
   Test test (/*AUTOINST*/
	      // Outputs
	      .out1			(out1),
	      .out18			(out18),
	      .out1b			(out1b),
	      .out19			(out19));
   // Test loop
   always @ (posedge clk) begin
      if (out1 !== 1'b1) $stop;
      if (out18 !== 32'h18) $stop;
      if (out1b !== 1'b1) $stop;
      if (out19 !== 1'b1) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule