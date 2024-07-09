module testbench;
   parameter w = 32;
   reg [w-1:0] n;
   reg 	       clk;
   reg 	       start;
   wire [w-1:0] fibn;
   wire 	done;
   fibfast #(w) ff (clk, n, start, fibn, done);
   initial begin
      $monitor($time,, "%b %d %b %d %b", clk, n, start, fibn, done);
      clk = 0;
      n = 30;
      start = 1;
      #15 start = 0;
      #5000 $finish;
   end
   always
     #10 clk = ~clk;
endmodule