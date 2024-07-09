module clk_200_400_exdes
 #(
  parameter TCQ = 100
  )
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  // High bits of counters driven by clocks
  output        COUNT,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );
  // Parameters for the counters
  // Counter width
  localparam    C_W       = 16;
  // When the clock goes out of lock, reset the counters
  wire          reset_int = !LOCKED || RESET || COUNTER_RESET;
   reg rst_sync;
   reg rst_sync_int;
   reg rst_sync_int1;
   reg rst_sync_int2;
  // Declare the clocks and counter
  wire           clk_int;
  wire           clk;
  reg  [C_W-1:0] counter;
  // Insert BUFGs on all input clocks that don't already have them
  BUFG clkin1_buf
   (.O (clk_in1_buf),
    .I (CLK_IN1));
  // Instantiation of the clocking network
  clk_200_400 clknetwork
   (// Clock in ports
    .CLK_IN1            (clk_in1_buf),
    // Clock out ports
    .CLK_OUT1           (clk_int),
    // Status and control signals
    .RESET              (RESET),
    .LOCKED             (LOCKED));
  // Connect the output clocks to the design
  assign clk = clk_int;
  // Reset synchronizer
    always @(posedge reset_int or posedge clk) begin
       if (reset_int) begin
            rst_sync <= 1'b1;
            rst_sync_int <= 1'b1;
            rst_sync_int1 <= 1'b1;
            rst_sync_int2 <= 1'b1;
       end
       else begin
            rst_sync <= 1'b0;
            rst_sync_int <= rst_sync;
            rst_sync_int1 <= rst_sync_int;
            rst_sync_int2 <= rst_sync_int1;
       end
    end
  // Output clock sampling
  always @(posedge clk or posedge rst_sync_int2) begin
    if (rst_sync_int2) begin
      counter <= #TCQ { C_W { 1'b 0 } };
    end else begin
      counter <= #TCQ counter + 1'b 1;
    end
  end
  // alias the high bit to the output
  assign COUNT = counter[C_W-1];
endmodule