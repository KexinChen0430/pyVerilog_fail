module timer_exdes
 #(
  parameter TCQ = 100
  )
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  // High bits of counters driven by clocks
  output [2:1]  COUNT
 );
  // Parameters for the counters
  // Counter width
  localparam    C_W       = 16;
  // Number of counters
  localparam    NUM_C     = 2;
  genvar        count_gen;
  // Create reset for the counters
  wire          reset_int = COUNTER_RESET;
  // Declare the clocks and counters
  wire [NUM_C:1] clk_int;
  wire [NUM_C:1] clk;
  reg [C_W-1:0]  counter [NUM_C:1];
  // Instantiation of the clocking network
  timer clknetwork
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Clock out ports
    .CLK_OUT1           (clk_int[1]),
    .CLK_OUT2           (clk_int[2]));
  // Connect the output clocks to the design
  assign clk[1] = clk_int[1];
  assign clk[2] = clk_int[2];
  // Output clock sampling
  generate for (count_gen = 1; count_gen <= NUM_C; count_gen = count_gen + 1) begin: counters
    always @(posedge clk[count_gen]) begin
      if (reset_int) begin
        counter[count_gen] <= #TCQ { C_W { 1'b 0 } };
      end else begin
        counter[count_gen] <= #TCQ counter[count_gen] + 1'b 1;
      end
    end
    // alias the high bit of each counter to the corresponding
    //   bit in the output bus
    assign COUNT[count_gen] = counter[count_gen][C_W-1];
  end
  endgenerate
endmodule