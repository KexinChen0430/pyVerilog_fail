module main;
   parameter delay = 10;
   parameter width = 5;
   reg clk;
   reg inp;
   reg [width-1:0] nb;
   wire out;
   counter
     #(.width (width))
     root
     (.clk (clk),
      .ld (inp),
      .nb (nb),
      .dn (out));
   initial
     begin
        $display("+------------------------+");
        $display("| Test bench for counter |");
        $display("+------------------------+");
        $monitor("ld = %b, sr = %d, cr = %d, dn = %b",
                  root.ld, root.sr, root.cr, root.dn);
        clk = 0;
        repeat(10) @(posedge clk);
        nb =  {width {1'b0}} - (delay + 1 - width);
        inp = 1;
        @(posedge clk);
        inp = 0;
        repeat(delay-1) @(posedge clk);
        if (out)
          begin
             $display("ERROR: counter finished too soon");
          end
        @(posedge clk);
        if (!out)
          begin
             $display("ERROR: counter did not finish on time");
          end
        repeat(5) @(posedge clk);
        $monitoroff;
        $display("Test complete at time %0t.", $time);
        $finish;
     end
   always
     #5 clk = !clk;
endmodule