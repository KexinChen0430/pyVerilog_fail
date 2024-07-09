module outputs)
   logic                hit_d2r;                // From cam of cam.v
   logic [7:0]          hitidx_d1r;             // From cam of cam.v
   logic [255:0]        hitvec_d1r;             // From cam of cam.v
   logic [30:0]         rdat_d2r;               // From cam of cam.v
   logic                rdat_val_d2r;           // From cam of cam.v
   // End of automatics
   cam cam (/*AUTOINST*/
            // Outputs
            .hitvec_d1r                 (hitvec_d1r[255:0]),
            .hitidx_d1r                 (hitidx_d1r[7:0]),
            .hit_d2r                    (hit_d2r),
            .rdat_d2r                   (rdat_d2r[30:0]),
            .rdat_val_d2r               (rdat_val_d2r),
            // Inputs
            .clk                        (clk),
            .rst                        (rst),
            .camen                      (camen),
            .inval                      (inval),
            .cdat                       (cdat[30:0]),
            .ren                        (ren),
            .wen                        (wen),
            .wdat                       (wdat[30:0]),
            .wdat_val                   (wdat_val),
            .rwidx                      (rwidx[7:0]));
   // Aggregate outputs into a single result vector
   wire [63:0] result = {hitvec_d1r[15:0], 15'h0, hit_d2r, rdat_val_d2r, rdat_d2r};
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
         rst <= 1'b1;
      end
      else if (cyc<10) begin
         sum <= '0;
         rst <= 1'b0;
      end
      else if (cyc==70) begin
         inval <= 1'b1;
      end
      else if (cyc==71) begin
         inval <= 1'b0;
      end
      else if (cyc==99) begin
         $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
         if (crc !== 64'hc77bb9b3784ea091) $stop;
`define EXPECTED_SUM 64'h5182640870b07199
         if (sum !== `EXPECTED_SUM) $stop;
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule