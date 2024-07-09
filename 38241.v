module outputs)
   wire [3:0]           ff_out;                 // From test of Test.v
   wire [3:0]           fg_out;                 // From test of Test.v
   wire [3:0]           fh_out;                 // From test of Test.v
   // End of automatics
   Test test (/*AUTOINST*/
              // Outputs
              .ff_out                   (ff_out[3:0]),
              .fg_out                   (fg_out[3:0]),
              .fh_out                   (fh_out[3:0]),
              // Inputs
              .clk                      (clk),
              .clken                    (clken),
              .rstn                     (rstn),
              .in                       (in[3:0]));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {52'h0, ff_out, fg_out, fh_out};
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
`define EXPECTED_SUM 64'h77979747fd1b3a5a
         if (sum !== `EXPECTED_SUM) $stop;
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule