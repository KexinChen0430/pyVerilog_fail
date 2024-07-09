module outputs)
   wire [31:0] 		out;			// From test of Test.v
   // End of automatics
   Test test (/*AUTOINST*/
	      // Outputs
	      .out			(out[31:0]),
	      // Inputs
	      .clk			(clk),
	      .noswap			(noswap),
	      .nibble			(nibble),
	      .in			(in[31:0]));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {32'h0, out};
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
      end
      else if (cyc<10) begin
	 sum <= 64'h0;
      end
      else if (cyc<90) begin
      end
      else if (cyc==99) begin
	 $write("*-* All Finished *-*\n");
	 $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
	 if (crc !== 64'hc77bb9b3784ea091) $stop;
	 if (sum !== 64'h89522c3f5e5ca324) $stop;
	 $finish;
      end
   end
endmodule