module mem(interface a);
   logic avail;
   always @(posedge a.clk)
     a.gnt <= a.req & avail;
   initial begin
      if ($bits(a.data) != 16) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule