module sdram_clk_gen_tb ();
  // Clock to Q delay of 100ps
  localparam  TCQ              = 100;
  // timescale is 1ps/1ps
  localparam  ONE_NS      = 1000;
  localparam  PHASE_ERR_MARGIN   = 100; // 100ps
  // how many cycles to run
  localparam  COUNT_PHASE = 1024;
  // we'll be using the period in many locations
  localparam time PER1    = 20.0*ONE_NS;
  localparam time PER1_1  = PER1/2;
  localparam time PER1_2  = PER1 - PER1/2;
  // Declare the input clock signals
  reg         CLK_IN1     = 1;
  // The high bit of the sampling counter
  wire        COUNT;
  reg         COUNTER_RESET = 0;
wire [1:1] CLK_OUT;
//Freq Check using the M & D values setting and actual Frequency generated
  reg [13:0]  timeout_counter = 14'b00000000000000;
  // Input clock generation
  always begin
    CLK_IN1 = #PER1_1 ~CLK_IN1;
    CLK_IN1 = #PER1_2 ~CLK_IN1;
  end
  // Test sequence
  reg [15*8-1:0] test_phase = "";
  initial begin
    // Set up any display statements using time to be readable
    $timeformat(-12, 2, "ps", 10);
    $display ("Timing checks are not valid");
    COUNTER_RESET = 0;
    test_phase = "wait lock";
    #(PER1*50);
    #(PER1*6);
    COUNTER_RESET = 1;
    #(PER1*19.5)
    COUNTER_RESET = 0;
    #(PER1*1)
    $display ("Timing checks are valid");
    test_phase = "counting";
    #(PER1*COUNT_PHASE);
    $display("SIMULATION PASSED");
    $display("SYSTEM_CLOCK_COUNTER : %0d\n",$time/PER1);
    $finish;
  end
  // Instantiation of the example design containing the clock
  //    network and sampling counters
  sdram_clk_gen_exdes
    dut
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Reset for logic in example design
    .COUNTER_RESET      (COUNTER_RESET),
    .CLK_OUT            (CLK_OUT),
    // High bits of the counters
    .COUNT              (COUNT));
// Freq Check
endmodule