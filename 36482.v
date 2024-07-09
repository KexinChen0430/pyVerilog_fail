module
mips_pipeline the_Mips(clk, reset);
// Generate a clock that changes ever 50 time units (a period of 100)
always
#50 clk = ~clk;
// Initialize signals
initial begin
clk = 1'b0; //initalize clk value to 0 at t=0
reset = 1'b1; // initialize clock value to 0
#100 reset = 1'b0;
end
endmodule