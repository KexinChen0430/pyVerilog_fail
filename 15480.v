module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   /*AUTOWIRE*/
   // Regs and Wires
   reg 	   rst;
   integer rst_count;
   st3_testbench st3_testbench_i (/*AUTOINST*/
				  // Inputs
				  .clk			(clk),
				  .rst			(rst));
   // Reset Generation
   initial begin
      rst       = 1'b1;
      rst_count = 0;
   end
   always @( posedge clk ) begin
      if (rst_count < 2) begin
	 rst_count++;
      end
      else begin
	 rst = 1'b0;
      end
   end
   // Closing message
   final begin
      $write("*-* All Finished *-*\n");
   end
endmodule