module secret_sub
  (
   input clk);
   // verilator no_inline_module
   integer secret_cyc;
   real    secret_cyc_r;
   integer secret_o;
   real    secret_r;
   export "DPI-C" task dpix_a_task;
   task dpix_a_task(input int i, output int o);  o = i + 1; endtask
   import "DPI-C" context task dpii_a_task(input int i, output int o);
   export "DPI-C" function dpix_a_func;
   function int dpix_a_func(input int i); return i + 2; endfunction
   import "DPI-C" context function int dpii_a_func(input int i);
   // Test loop
   always @ (posedge clk) begin
      secret_cyc_r = $itor(secret_cyc)/10.0 - 5.0;
      secret_cyc <= dpii_a_func(secret_cyc);
      secret_r += 1.0 + $cos(secret_cyc_r);
      dpix_a_task(secret_cyc, secret_o);
      if (secret_cyc==90) begin
         $write("*-* All Finished *-*\n");
      end
   end
endmodule