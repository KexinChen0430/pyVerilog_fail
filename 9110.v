module tb;
   reg clk = 0;
   reg rst = 1;
   wire [11:0] mm_adr;
   wire        mm_we;
   wire [23:0] mm_idat;
   wire [23:0] mm_odat;
   rca110_memory mem(clk, rst, mm_adr, mm_we, mm_idat, mm_odat);
   rca110 cpu(clk, rst,
	      mm_adr, mm_we, mm_idat, mm_odat);
   always #10 clk = ~clk;
   always @(posedge clk) begin
      rst <= 0;
   end
   initial begin
      $dumpfile("rca110.vcd");
      $dumpvars(0, mem);
      $dumpvars(0, cpu);
      #500 $finish();
   end
endmodule