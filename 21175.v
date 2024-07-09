module outputs)
   logic		din_ready;		// From test of Test.v
   logic [0:0]		dout0_data;		// From test of Test.v
   logic		dout0_valid;		// From test of Test.v
   logic [1:0]		dout1_data;		// From test of Test.v
   logic		dout1_valid;		// From test of Test.v
   logic [2:0]		dout2_data;		// From test of Test.v
   logic		dout2_valid;		// From test of Test.v
   // End of automatics
   Test test (/*AUTOINST*/
	      // Outputs
	      .din_ready		(din_ready),
	      .dout0_valid		(dout0_valid),
	      .dout0_data		(dout0_data[0:0]),
	      .dout1_valid		(dout1_valid),
	      .dout1_data		(dout1_data[1:0]),
	      .dout2_valid		(dout2_valid),
	      .dout2_data		(dout2_data[2:0]),
	      // Inputs
	      .din_valid		(din_valid),
	      .din_data			(din_data[4:0]),
	      .dout0_ready		(dout0_ready),
	      .dout1_ready		(dout1_ready),
	      .dout2_ready		(dout2_ready));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {48'h0, din_ready,
                         2'd0, dout2_valid, dout2_data,
                         2'd0, dout1_valid, dout1_data,
                         2'd0, dout0_valid, dout0_data};
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
         sum <= '0;
      end
      else if (cyc<10) begin
         sum <= '0;
      end
      else if (cyc<90) begin
      end
      else if (cyc==99) begin
         $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
         if (crc !== 64'hc77bb9b3784ea091) $stop;
         // What checksum will we end up with (above print should match)
`define EXPECTED_SUM 64'h6fd1bead9df31b07
         if (sum !== `EXPECTED_SUM) $stop;
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule