module testbench;
   reg clk;
   reg [31:0] n;
   reg 	      start;
   wire [31:0] fibn;
   wire        done;
   fibfast ff (clk, n, start, fibn, done);
   initial begin
      clk = 0;
      n = 10;
      start = 1;
      $monitor($time,, "%b %d %b %d %b", clk, n, start, fibn, done);
      #100 $finish();
   end
   always
     #10 clk = ~clk;
endmodule