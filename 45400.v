module t(
	 /*AUTOARG*/
	 // Inputs
	 clk /*verilator clocker*/,
	 input clk0 /*verilator clocker*/,
	 input clk1 /*verilator clocker*/,
	 input clk2 /*verilator clocker*/,
	 input data_in
	 );
   input       clk;
   logic [2:0] clks;
   assign clks = {1'b0, clk1, clk0};
   t2
     t2
       (
	.i_clks (clks),
	.i_clk0 (clk0),
	.i_clk1 (clk),
	.i_clk2 (clk2),
	.i_data (data_in)
	);
   always @(posedge clk) begin
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule