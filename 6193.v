module testclk_exdes
 #(
  parameter TCQ = 100
  )
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  output [4:1]  CLK_OUT,
  // High bits of counters driven by clocks
  output [4:1]  COUNT
 );
  // Parameters for the counters
  // Counter width
  localparam    C_W       = 16;
  // Number of counters
  localparam    NUM_C     = 4;
  genvar        count_gen;
  // Create reset for the counters
  wire          reset_int = COUNTER_RESET;
   reg [NUM_C:1] rst_sync;
   reg [NUM_C:1] rst_sync_int;
   reg [NUM_C:1] rst_sync_int1;
   reg [NUM_C:1] rst_sync_int2;
  // Connect the feedback on chip
  wire          CLKFB_OUT;
  wire          CLKFB_IN;
  // Declare the clocks and counters
  wire [NUM_C:1] clk_int;
  wire [NUM_C:1] clk;
  reg [C_W-1:0]  counter [NUM_C:1];
  // Connect the feedback on chip- duplicate the delay for CLK_OUT1
  assign        CLKFB_IN  = CLKFB_OUT;
  // Instantiation of the clocking network
  testclk clknetwork
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    .CLKFB_IN           (CLKFB_IN),
    // Clock out ports
    .CLK_OUT1           (clk_int[1]),
    .CLK_OUT2           (clk_int[2]),
    .CLK_OUT3           (clk_int[3]),
    .CLK_OUT4           (clk_int[4]),
    .CLKFB_OUT          (CLKFB_OUT));
genvar clk_out_pins;
generate
  for (clk_out_pins = 1; clk_out_pins <= NUM_C; clk_out_pins = clk_out_pins + 1)
  begin: gen_outclk_oddr
  ODDR clkout_oddr
   (.Q  (CLK_OUT[clk_out_pins]),
    .C  (clk[clk_out_pins]),
    .CE (1'b1),
    .D1 (1'b1),
    .D2 (1'b0),
    .R  (1'b0),
    .S  (1'b0));
  end
endgenerate
  // Connect the output clocks to the design
  BUFG clkout1_buf
   (.O (clk[1]),
    .I (clk_int[1]));
  BUFG clkout2_buf
   (.O (clk[2]),
    .I (clk_int[2]));
  BUFG clkout3_buf
   (.O (clk[3]),
    .I (clk_int[3]));
  BUFG clkout4_buf
   (.O (clk[4]),
    .I (clk_int[4]));
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