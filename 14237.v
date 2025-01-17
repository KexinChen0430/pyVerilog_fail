module outputs)
   wire			RBL2;			// From t of Test.v
   // End of automatics
   wire 		RWL1 = crc[2];
   wire 		RWL2 = crc[3];
   Test t (/*AUTOINST*/
	   // Outputs
	   .RBL2			(RBL2),
	   // Inputs
	   .RWL1			(RWL1),
	   .RWL2			(RWL2));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {63'h0, RBL2};
   // Test loop
   always @ (posedge clk) begin
`ifdef TEST_VERBOSE
      $write("[%0t] cyc==%0d crc=%x result=%x\n",$time, cyc, crc, result);
`endif
      cyc <= cyc + 1;
      crc <= {crc[62:0], crc[63]^crc[2]^crc[0]};
      sum <= result ^ {sum[62:0],sum[63]^sum[2]^sum[0]};
      if (cyc==0) begin
	 // Setup
	 crc <= 64'h5aef0c8d_d70a4497;
	 sum <= 64'h0;
      end
      else if (cyc<10) begin
	 sum <= 64'h0;
      end
      else if (cyc<90) begin
      end
      else if (cyc==99) begin
	 $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
	 if (crc !== 64'hc77bb9b3784ea091) $stop;
	 // What checksum will we end up with (above print should match)
`define EXPECTED_SUM 64'hb6d6b86aa20a882a
	 if (sum !== `EXPECTED_SUM) $stop;
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
endmodule