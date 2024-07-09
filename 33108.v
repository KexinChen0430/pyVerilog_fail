module outputs)
   wire [31:0]		out;			// From test of Test.v
   wire [15:0]		out2;			// From test of Test.v
   // End of automatics
   // verilator lint_on MULTIDRIVEN
   Test test (
	      .en (crc[21:20]),
	      .a1 (crc[19:18]),
	      .a0 (crc[17:16]),
	      .d1 (crc[15:8]),
	      .d0 (crc[7:0]),
	      /*AUTOINST*/
	      // Outputs
	      .out			(out[31:0]),
	      .out2			(out2[15:0]),
	      // Inputs
	      .clk			(clk));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {out2, 16'h0, out};
   // Test loop
`ifdef TEST_VERBOSE
   always @ (negedge clk) begin
      $write("[%0t] cyc==%0d crc=%x result=%x\n",$time, cyc, crc, result);
   end
`endif
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
	 test.clear();
      end
      else if (cyc<10) begin
	 sum <= 64'h0;
	 test.clear();
      end
      else if (cyc<90) begin
      end
      else if (cyc==99) begin
	 $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
	 if (crc !== 64'hc77bb9b3784ea091) $stop;
	 // What checksum will we end up with (above print should match)
`define EXPECTED_SUM 64'hc68a94a34ec970aa
	 if (sum !== `EXPECTED_SUM) $stop;
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
endmodule