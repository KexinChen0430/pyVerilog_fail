module sub (input integer inst);
   import "DPI-C" context function int dpic_line();
   import "DPI-C" context function int dpic_save(int value);
   import "DPI-C" context function int dpic_restore();
   import "DPI-C" context function int unsigned dpic_getcontext();
   int result;
   task test1;
      // Check line numbering
`ifndef verilator // Not all sims support SV2009 `__LINE__, and some that do fail the specific-line test
      result = dpic_line(); if (!result) $stop;
`else
      result = dpic_line(); if (result !== `__LINE__) $stop;
      result = dpic_line(); if (result !== `__LINE__) $stop;
`endif
      // Check save-restore
      result = dpic_save(23+inst);
      if (result==0) $stop;
   endtask
   task test2;
      if (dpic_restore() != 23+inst) $stop;
   endtask
   int unsigned cntxt1;
   int unsigned cntxt2;
   initial begin
     cntxt1 = dpic_getcontext();
     begin : caller_context
       // call from a different scope - should still get the context of the function declaration
       cntxt2 = dpic_getcontext();
     end
     // svContext should be the context of the function declaration, not the context of the function call
     if (cntxt1 != cntxt2) $stop;
   end
endmodule