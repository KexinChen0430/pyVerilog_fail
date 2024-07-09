module Genit (clk, value, result);
   input clk;
   input value;
   output result;
`ifndef ATSIM  // else unsupported
 `ifndef NC  // else unsupported
  `define WITH_FOR_GENVAR
 `endif
`endif
`define WITH_GENERATE
`ifdef WITH_GENERATE
 `ifndef WITH_FOR_GENVAR
   genvar i;
 `endif
   generate
      for (
 `ifdef WITH_FOR_GENVAR
	   genvar
 `endif
	   i = 0; i < 1; i = i + 1)
	begin : foo
	   Test tt (clk, value, result);
	end
   endgenerate
`else
   Test tt (clk, value, result);
`endif
   wire Result2 = t.g.foo[0].tt.gen.Internal;  // Works - Do not change!
   always @ (posedge clk) begin
      $write("[%0t] Result2 = %x\n", $time, Result2);
   end
endmodule