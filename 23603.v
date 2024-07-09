module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   secret_sub secret_inst (.*);
   secret_other secret_inst2 (.*);
endmodule