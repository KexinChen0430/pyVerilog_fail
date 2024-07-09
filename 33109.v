module Test (/*AUTOARG*/
   // Outputs
   out, out2,
   // Inputs
   clk, en, a0, a1, d0, d1
   );
   input clk;
   input [1:0] en;
   input [1:0] a0;
   input [1:0] a1;
   input [7:0] d0;
   input [7:0] d1;
   output reg [31:0] out;
   output reg [15:0] out2;
   // verilator lint_off MULTIDRIVEN
   reg [7:0] 	     mem [4];
   // verilator lint_on MULTIDRIVEN
   task clear();
      for (int i=0; i<4; ++i) mem[i] = 0;
   endtask
   always @(posedge clk) begin
      if (en[0]) begin
	 mem[a0] <= d0;
	 out2[7:0] <= d0;
      end
   end
   always @(negedge clk) begin
      if (en[1]) begin
	 mem[a1] <= d1;
	 out2[15:8] <= d0;
      end
   end
   assign out = {mem[3],mem[2],mem[1],mem[0]};
endmodule