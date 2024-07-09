module Clock70MHz_exdes
 #(
  parameter TCQ = 100
  )
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  output [1:1]  CLK_OUT,
  // High bits of counters driven by clocks
  output        COUNT,
  // Status and control signals
  output        LOCKED
 );
  // Parameters for the counters
  // Counter width
  localparam    C_W       = 16;
  // When the clock goes out of lock, reset the counters
  wire          reset_int = !LOCKED || COUNTER_RESET;
   reg rst_sync;
   reg rst_sync_int;
   reg rst_sync_int1;
   reg rst_sync_int2;
  // Declare the clocks and counter
  wire           clk_int;
  wire           clk_n;
  wire           clk;
  reg  [C_W-1:0] counter;
  // Instantiation of the clocking network
  Clock70MHz clknetwork
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Clock out ports
    .CLK_OUT1           (clk_int),
    // Status and control signals
    .LOCKED             (LOCKED));
  assign clk_n = ~clk;
  ODDR2 clkout_oddr
   (.Q  (CLK_OUT[1]),
    .C0 (clk),
    .C1 (clk_n),
    .CE (1'b1),
    .D0 (1'b1),
    .D1 (1'b0),
    .R  (1'b0),
    .S  (1'b0));
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