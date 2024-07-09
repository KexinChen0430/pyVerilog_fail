module clk_gen_83M_exdes
 #(
  parameter TCQ = 100
  )
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  // High bits of counters driven by clocks
  output [3:1]  COUNT,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );
  // Parameters for the counters
  // Counter width
  localparam    C_W       = 16;
  // Number of counters
  localparam    NUM_C     = 3;
  genvar        count_gen;
  // When the clock goes out of lock, reset the counters
  wire          reset_int = !LOCKED || RESET || COUNTER_RESET;
   reg [NUM_C:1] rst_sync;
   reg [NUM_C:1] rst_sync_int;
   reg [NUM_C:1] rst_sync_int1;
   reg [NUM_C:1] rst_sync_int2;
  // Declare the clocks and counters
  wire [NUM_C:1] clk_int;
  wire [NUM_C:1] clk;
  reg [C_W-1:0]  counter [NUM_C:1];
  // Instantiation of the clocking network
  clk_gen_83M clknetwork
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Clock out ports
    .CLK_OUT1           (clk_int[1]),
    .CLK_OUT2           (clk_int[2]),
    .CLK_OUT3           (clk_int[3]),
    // Status and control signals
    .RESET              (RESET),
    .LOCKED             (LOCKED));
  // Connect the output clocks to the design
  assign clk[1] = clk_int[1];
  assign clk[2] = clk_int[2];
  assign clk[3] = clk_int[3];
  // Reset synchronizer
  generate for (count_gen = 1; count_gen <= NUM_C; count_gen = count_gen + 1) begin: counters_1
    always @(posedge reset_int or posedge clk[count_gen]) begin
       if (reset_int) begin
            rst_sync[count_gen] <= 1'b1;
            rst_sync_int[count_gen]<= 1'b1;
            rst_sync_int1[count_gen]<= 1'b1;
            rst_sync_int2[count_gen]<= 1'b1;
       end
       else begin
            rst_sync[count_gen] <= 1'b0;
            rst_sync_int[count_gen] <= rst_sync[count_gen];
            rst_sync_int1[count_gen] <= rst_sync_int[count_gen];
            rst_sync_int2[count_gen] <= rst_sync_int1[count_gen];
       end
    end
  end
  endgenerate
  // Output clock sampling
  generate for (count_gen = 1; count_gen <= NUM_C; count_gen = count_gen + 1) begin: counters
    always @(posedge clk[count_gen] or posedge rst_sync_int2[count_gen]) begin
      if (rst_sync_int2[count_gen]) begin
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