module's undeclared outputs)
   reg    z;
   // End of automatics
   /*AUTOWIRE*/
   always @ (/*AUTOSENSE*/i) begin
      z  = i;
   end
endmodule