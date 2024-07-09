module outputs)
   wire [31:0]          b;                      // From file of file.v
   wire [31:0]          c;                      // From file of file.v
   wire [31:0]          d;                      // From file of file.v
   // End of automatics
   file file (/*AUTOINST*/
              // Outputs
              .b                        (b[31:0]),
              .c                        (c[31:0]),
              .d                        (d[31:0]),
              // Inputs
              .crc                      (crc[31:0]));
   always @ (posedge clk) begin
`ifdef TEST_VERBOSE
      $write("[%0t] cyc=%0d crc=%x sum=%x b=%x d=%x\n",$time,cyc,crc,sum, b, d);
`endif
      cyc <= cyc + 1;
      crc <= {crc[62:0], crc[63]^crc[2]^crc[0]};
      sum <= {b, d}
             ^ {sum[62:0],sum[63]^sum[2]^sum[0]};
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
         $write("[%0t] cyc==%0d crc=%x %x\n",$time, cyc, crc, sum);
         if (crc !== 64'hc77bb9b3784ea091) $stop;
         if (sum !== 64'h649ee1713d624dd9) $stop;
         $finish;
      end
   end
endmodule