module t (clk);
   input clk;
   integer cyc;
   integer failure;
   initial cyc = 0;
`ifndef verilator
   `error "Only Verilator supports PLI-ish DPI calls."
`endif
   always @ (posedge clk) begin
      if (cyc == 2) begin
         failure = $dpii_failure();
         $write("* failure = %0d\n", failure);
         if (failure > 0) begin
            $stop;
         end
         $write("*-* All Finished *-*\n");
         $finish;
      end
      cyc <= cyc + 1;
   end
   // The purpose of this test is to confirm that the DPI-call serialization
   // code in V3Partition does ensure that these DPI calls do not run
   // concurrently.
   // Alternatively, the test may be run with "--threads-dpi all" in which case
   // it should confirm that the calls do run concurrently and do detect a
   // collision (they should, if the test is set up right.)  This is
   // t_dpi_threads_collide.pl.
   // Q) Is it a risk that the partitioner will merge or serialize these always
   //    blocks, just by luck, even if the DPI-call serialization code fails?
   // A) Yes, that's why t_dpi_threads_collide.pl also passes
   //    the MTask graph at the end of FixDataHazards (where we resolve DPI
   //    hazards) is basically the final MTasks graph, and that data hazards
   //    which persist beyond FixDataHazards should persist in the final
   //    generated C code.
   always @ (posedge clk) begin
      $dpii_sys();
   end
   always @ (posedge clk) begin
      $dpii_sys();
   end
endmodule