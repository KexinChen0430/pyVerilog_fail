module pll_tb ();
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
  // The high bits of the sampling counters
  wire [4:1]  COUNT;
  // Status and control signals
  reg         RESET      = 0;
  wire        LOCKED;
  reg         COUNTER_RESET = 0;
wire [4:1] CLK_OUT;
//Freq Check using the M & D values setting and actual Frequency generated
real period1;
real ref_period1;
localparam  ref_period1_clkin1 = (20.0*1*10*1000/16);
time prev_rise1;
real period2;
real ref_period2;
localparam  ref_period2_clkin1 = (20.0*1*10*1000/16);
time prev_rise2;
real period3;
real ref_period3;
localparam  ref_period3_clkin1 = (20.0*1*10*1000/16);
time prev_rise3;
real period4;
real ref_period4;
localparam  ref_period4_clkin1 = (20.0*1*16*1000/16);
time prev_rise4;
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
    COUNTER_RESET = 0;
    test_phase = "reset";
    RESET = 1;
    #(PER1*6);
    RESET = 0;
    test_phase = "wait lock";
    `wait_lock;
    #(PER1*6);
    COUNTER_RESET = 1;
    #(PER1*20)
    COUNTER_RESET = 0;
    test_phase = "counting";
    #(PER1*COUNT_PHASE);
    if ((period1 -ref_period1_clkin1) <= 100 && (period1 -ref_period1_clkin1) >= -100) begin
    $display("Freq of CLK_OUT[1] ( in MHz ) : %0f\n", 1000000/period1);
    end else
    $display("ERROR: Freq of CLK_OUT[1] is not correct");
    if ((period2 -ref_period2_clkin1) <= 100 && (period2 -ref_period2_clkin1) >= -100) begin
    $display("Freq of CLK_OUT[2] ( in MHz ) : %0f\n", 1000000/period2);
    end else
    $display("ERROR: Freq of CLK_OUT[2] is not correct");
    if ((period3 -ref_period3_clkin1) <= 100 && (period3 -ref_period3_clkin1) >= -100) begin
    $display("Freq of CLK_OUT[3] ( in MHz ) : %0f\n", 1000000/period3);
    end else
    $display("ERROR: Freq of CLK_OUT[3] is not correct");
    if ((period4 -ref_period4_clkin1) <= 100 && (period4 -ref_period4_clkin1) >= -100) begin
    $display("Freq of CLK_OUT[4] ( in MHz ) : %0f\n", 1000000/period4);
    end else
    $display("ERROR: Freq of CLK_OUT[4] is not correct");
    $display("SIMULATION PASSED");
    $display("SYSTEM_CLOCK_COUNTER : %0d\n",$time/PER1);
    $finish;
  end
  // Instantiation of the example design containing the clock
  //    network and sampling counters
  pll_exdes
  #(
    .TCQ (TCQ)
   ) dut
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Reset for logic in example design
    .COUNTER_RESET      (COUNTER_RESET),
    .CLK_OUT            (CLK_OUT),
    // High bits of the counters
    .COUNT              (COUNT),
    // Status and control signals
    .RESET              (RESET),
    .LOCKED             (LOCKED));
// Freq Check
initial
  prev_rise1 = 0;
always @(posedge CLK_OUT[1])
begin
  if (prev_rise1 != 0)
    period1 = $time - prev_rise1;
  prev_rise1 = $time;
end
initial
  prev_rise2 = 0;
always @(posedge CLK_OUT[2])
begin
  if (prev_rise2 != 0)
    period2 = $time - prev_rise2;
  prev_rise2 = $time;
end
initial
  prev_rise3 = 0;
always @(posedge CLK_OUT[3])
begin
  if (prev_rise3 != 0)
    period3 = $time - prev_rise3;
  prev_rise3 = $time;
end
initial
  prev_rise4 = 0;
always @(posedge CLK_OUT[4])
begin
  if (prev_rise4 != 0)
    period4 = $time - prev_rise4;
  prev_rise4 = $time;
end
endmodule