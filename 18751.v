module Test (/*AUTOARG*/
   // Inputs
   clk, in
   );
   input clk;
   input [31:0] in;
   reg [31:0]   dly0;
   reg [31:0]   dly1;
   reg [31:0]   dly2;
   reg [31:0]   dly3;
   // If called in an assertion, sequence, or property, the appropriate clocking event.
   // Otherwise, if called in a disable condition or a clock expression in an assertion, sequence, or prop, explicit.
   // Otherwise, if called in an action block of an assertion, the leading clock of the assertion is used.
   // Otherwise, if called in a procedure, the inferred clock
   // Otherwise, default clocking
   always @(posedge clk) begin
      dly0 <= in;
      dly1 <= dly0;
      dly2 <= dly1;
      dly3 <= dly2;
      // $past(expression, ticks, expression, clocking)
      // In clock expression
      if (dly0 != $past(in)) $stop;
      if (dly0 != $past(in,1)) $stop;
      if (dly1 != $past(in,2)) $stop;
   end
   assert property (@(posedge clk) dly0 == $past(in));
endmodule