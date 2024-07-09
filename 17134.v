module altera_tse_xcvr_resync #(
    parameter SYNC_CHAIN_LENGTH = 2,  // Number of flip-flops for retiming
    parameter WIDTH             = 1,  // Number of bits to resync
    parameter SLOW_CLOCK        = 0   // See description above
  ) (
  input   wire              clk,
  input   wire  [WIDTH-1:0] d,
  output  wire  [WIDTH-1:0] q
  );
localparam  INT_LEN   = (SYNC_CHAIN_LENGTH > 0) ? SYNC_CHAIN_LENGTH : 1;
genvar ig;
// Generate a synchronizer chain for each bit
generate begin
  for(ig=0;ig<WIDTH;ig=ig+1) begin : resync_chains
    wire                d_in;   // Input to sychronization chain.
    reg   [INT_LEN-1:0] r = {INT_LEN{1'b0}};
    wire  [INT_LEN  :0] next_r; // One larger real chain
    assign  q[ig]   = r[INT_LEN-1]; // Output signal
    assign  next_r  = {r,d_in};
    always @(posedge clk)
      r <= next_r[INT_LEN-1:0];
    // Generate asynchronous capture circuit if specified.
    if(SLOW_CLOCK == 0) begin
      assign  d_in = d[ig];
    end else begin
      wire  d_clk;
      reg   d_r;
      wire  clr_n;
      assign  d_clk = d[ig];
      assign  d_in  = d_r;
      assign  clr_n = ~q[ig] | d_clk; // Clear when output is logic 1 and input is logic 0
      // Asynchronously latch the input signal.
      always @(posedge d_clk or negedge clr_n)
        if(!clr_n)      d_r <= 1'b0;
        else if(d_clk)  d_r <= 1'b1;
    end // SLOW_CLOCK
  end // for loop
end // generate
endgenerate
endmodule