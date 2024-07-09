module inputs)
   reg			clk;			// To dut of mult_27x27.v
   reg [26:0]		opa;			// To dut of mult_27x27.v
   reg [26:0]		opb;			// To dut of mult_27x27.v
   // End of automatics
   mult_27x27 #(.LATENCY(LATENCY))
                  dut(/*AUTOINST*/
		      // Outputs
		      .res		(res[53:0]),
		      // Inputs
		      .clk		(clk),
		      .opa		(opa[26:0]),
		      .opb		(opb[26:0]));
   reg 			running = 1;
   initial while(running) begin
      clk = 0;
      #10;
      clk = 1;
      #10;
   end
   reg [53:0] expected_res;
   reg 	      res_is_valid = 0;
   always @(posedge clk) begin
      expected_res <= repeat(LATENCY-1) @(posedge clk) $unsigned(opa)*$unsigned(opb);
   end
   integer state = 10;    // FIXME: Remove the unused state variable
   initial begin
      opa = 0;
      opb = 0;
      expected_res = 0;
      repeat(100) @(posedge clk);
      repeat(10000) @(posedge clk) begin : FOO
	 reg [26:0] restricted_opa;
	 if(1 || !state) begin
	    restricted_opa = {$random,$random} ;
	    if(restricted_opa[26]) begin
	       restricted_opa[2:0] = 3'b000;
	    end
	    opa <= restricted_opa;
	    opb <= {$random,$random};
	    opb <= $random;
	    state = 10;
	 end else begin
	    state = state - 1;
	 end
	 if(expected_res !== res) begin
	    $display("expected_res !== res!");
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    @(posedge clk);
	    $stop;
	    // Note: We don't check the last few values, but it
	    // doesn't really matter as they are randomly generated
	    // anyway.
	 end
      end
      running = 0;
      #10;
      $display("");
      $display("*** Multiplier test PASSED ***");
      $display("");
   end
   initial begin
      while(1) begin
	 $display("  opa      opb         res       expected_res res^expected");
	 repeat(20) begin
	    @(posedge clk);
	    $display("%x  %x  %x %x %x ",opa,opb,res, expected_res, res^expected_res);
	 end
      end
   end
endmodule