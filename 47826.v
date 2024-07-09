module clock_generator(
    // Interface: wb_system
    output reg                          clk_o,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst_o    // The mandatory reset, as this is synchronous logic.
);
// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
      clk_o = 1'b0;
      rst_o = 1'b1; // assert reset
      repeat(4) #5 clk_o = ~clk_o;
      rst_o = 1'b0; // deassert reset
      forever #5 clk_o = ~clk_o; // generate a clock
   end
endmodule