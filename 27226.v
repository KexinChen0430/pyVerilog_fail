module t
  (
   clk
   );
   input clk /*verilator clocker*/;
   bit reset;
   wire      success;
   SimpleTestHarness testHarness
     (
      .clk(clk),
      .reset(reset),
      .io_success(success)
      );
   integer   cyc=0;
   always @ (posedge clk) begin
      cyc = cyc + 1;
      if (cyc<10) begin
         reset <= '0;
      end
      else if (cyc<20) begin
         reset <= '1;
      end
      else if (cyc<30) begin
         reset <= '0;
      end
      else if (cyc==99) begin
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule