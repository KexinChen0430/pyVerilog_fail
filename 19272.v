module TemperatureMonitor_tb ();
  // timescale is 1ps/1ps
  localparam  ONE_NS      = 1000;
  localparam time PER1    = 20*ONE_NS;
  // Declare the input clock signals
  reg         DCLK_TB     = 1;
  wire [6:0] DADDR_TB;
  wire DEN_TB;
  wire DWE_TB;
  wire [15:0] DI_TB;
  wire [15:0] DO_TB;
  wire DRDY_TB;
  wire [2:0] ALM_unused;
  wire FLOAT_VCCAUX_ALARM;
  wire FLOAT_VCCINT_ALARM;
  wire FLOAT_USER_TEMP_ALARM;
// Input clock generation
always begin
  DCLK_TB = #(PER1/2) ~DCLK_TB;
end
// Start of the testbench
initial
  begin
   $display ("Single channel avereraging is enabled");
   $display ("This TB does not verify averaging");
   $display ("Please increase the simulation duration to see complete waveform") ;
  $display ("No status signals are pulled out to monitor the test status");
  $display ("Simulation Stopped.");
  $finish;
  end
  // Instantiation of the example design
  TemperatureMonitor_exdes dut (
      .DADDR_IN(DADDR_TB[6:0]),
      .DCLK_IN(DCLK_TB),
      .DEN_IN(DEN_TB),
      .DI_IN(DI_TB[15:0]),
      .DWE_IN(DWE_TB),
      .DO_OUT(DO_TB[15:0]),
      .DRDY_OUT(DRDY_TB),
      .VP_IN(1'b0),
      .VN_IN(1'b0)
         );
endmodule