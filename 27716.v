module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   unit_type_t vu;
   $unit::unit_type_t vdu;
   p::package_type_t vp;
   t2 t2 ();
   initial begin
      if (unit_plusone(1) !== 2) $stop;
      if ($unit::unit_plusone(1) !== 2) $stop;
      if (p::plusone(1) !== 2) $stop;
      p::pi = 124;
      if (p::pi !== 124) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
   always @ (posedge clk) begin
      p::pi += 1;
      if (p::pi < 124) $stop;
   end
endmodule