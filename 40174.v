module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   integer 	cyc=0;
   reg [63:0] 	crc;
   reg [63:0] 	sum;
   // Take CRC data and apply to testblock inputs
   wire 	rst;
   data_t 	iii_in = crc[5:0];
   data_t 	jjj_in = crc[11:6];
   data_t	iii_out;
   data_t	jjj_out;
   logic [1:0]	ctl0 = crc[63:62];
   aaa aaa (.*);
   // Aggregate outputs into a single result vector
   wire [63:0] result = {64'h0};
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
	 rst <= 1'b0;
      end
      else if (cyc<10) begin
	 sum <= 64'h0;
	 rst <= 1'b1;
      end
      else if (cyc<90) begin
	 rst <= 1'b0;
      end
      else if (cyc==99) begin
	 $write("[%0t] cyc==%0d crc=%x sum=%x\n",$time, cyc, crc, sum);
	 if (crc !== 64'hc77bb9b3784ea091) $stop;
	 // What checksum will we end up with (above print should match)
`define EXPECTED_SUM 64'h4afe43fb79d7b71e
	 if (sum !== `EXPECTED_SUM) $stop;
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
endmodule