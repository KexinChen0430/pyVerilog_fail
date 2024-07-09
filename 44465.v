module t (/*AUTOARG*/
   // Outputs
   out,
   // Inputs
   in
   );
   input in;  // inputs don't get flagged as undriven
   output out;  // outputs don't get flagged as unused
   sub sub ();
   // Check we don't warn about unused UDP signals
   udp_mux2 udpsub (out, in, in, in);
   // Check ignoreds mark as used
   reg    sysused;
   initial $bboxed(sysused);
   // Check file IO.  The fopen is the "driver" all else a usage.
   integer infile;
   integer outfile;
   initial begin
      outfile = $fopen({`STRINGIFY(`TEST_OBJ_DIR),"/open.log"}, "w");
      $fwrite(outfile, "1\n");
      $fclose(outfile);
      infile = $fopen({`STRINGIFY(`TEST_OBJ_DIR),"/open.log"}, "r");
      if ($fgetc(infile) != "1") begin end
   end
   wire   _unused_ok;
endmodule