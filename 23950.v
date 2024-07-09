module outputs)
   wire [7:0]		dout0;			// From sub0 of sub0.v
   wire [7:0]		dout1;			// From sub1 of sub1.v
   // End of automatics
   initial begin
      $write("*-* All Finished *-*\n");
      $finish;
   end
   reg [7:0] 	dbgsel_msk;
   always_comb begin
      reg [7:0] mask;
      mask = 8'hff;
      dbgsel_msk = (dbgsel_w & mask);
   end
   // TODO this should optimize away, but presently does not because
   // V3Gate constifies then doesn't see all other input edges have disappeared
   reg [7:0] 	dbgsel;
   always @(posedge clk) begin
      if ((rstn == 0)) begin
         dbgsel <= 0;
      end
      else begin
         dbgsel <= dbgsel_msk;
      end
   end
   sub0 sub0 (/*AUTOINST*/
	      // Outputs
	      .dout0			(dout0[7:0]),
	      // Inputs
	      .rstn			(rstn),
	      .clk			(clk),
	      .dval0			(dval0[7:0]),
	      .dbgsel			(dbgsel[7:0]));
   sub1 sub1 (/*AUTOINST*/
	      // Outputs
	      .dout1			(dout1[7:0]),
	      // Inputs
	      .rstn			(rstn),
	      .clk			(clk),
	      .dval1			(dval1[7:0]),
	      .dbgsel			(dbgsel[7:0]));
endmodule