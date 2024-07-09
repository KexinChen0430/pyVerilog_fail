module struct_submodule
  import config_pkg::*;
   #(parameter config_struct MY_CONFIG = '0);
   initial begin
      `checkd(MY_CONFIG.UPPER0, 10);
      `checkd(MY_CONFIG.mac.USE_QUAD0, 4);
      `checkd(MY_CONFIG.mac.USE_QUAD1, 5);
      `checkd(MY_CONFIG.mac.USE_QUAD2, 6);
      `checkd(MY_CONFIG.UPPER2, 20);
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule