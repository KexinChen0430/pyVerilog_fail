module SysMon_tb ();
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
  wire BUSY_TB;
  wire [4:0] CHANNEL_TB;
  wire EOC_TB;
  wire EOS_TB;
  wire JTAGBUSY_TB;
  wire JTAGLOCKED_TB;
  wire JTAGMODIFIED_TB;
// Input clock generation
always begin
  DCLK_TB = #(PER1/2) ~DCLK_TB;
end
  assign DADDR_TB = {2'b00, CHANNEL_TB};
  assign DI_TB = 16'b0000000000000000;
  assign DWE_TB = 1'b0;
  assign DEN_TB = EOC_TB;
// Start of the testbench
initial
  begin
   $display ("Single channel avereraging is enabled");
   $display ("This TB does not verify averaging");
   $display ("Please increase the simulation duration to see complete waveform") ;
  `wait_done;
  `wait_eoc;
  $display("EOC is asserted");
  if (CHANNEL_TB == 0) begin
    $display ("Monitored Temperature");
  end
  else begin
    $display ("Temperature is not monitored");
    $display ("ERROR !!!");
    $finish;
  end
  `wait_drdy;
  $display ("DRDY is asserted. Valid data is on the DO bus");
    $display ("Averaging Complete") ;
    $finish;
  `wait_eoc;
  $display ("EOC is asserted.");
  if( CHANNEL_TB == 0) begin
    $display ("Monitored Temperature.");
  end
  else begin
    $display ("USER TEMP is not monitored.");
    $display ("ERROR !!!");
    $finish;
  end
  `wait_drdy;
  $display ("DRDY is asserted. Valid data is on the DO bus");
    $display ("Averaging Complete") ;
    $finish;
  end
  // Instantiation of the example design
  SysMon_exdes dut (
      .DADDR_IN(DADDR_TB[6:0]),
      .DCLK_IN(DCLK_TB),
      .DEN_IN(DEN_TB),
      .DI_IN(DI_TB[15:0]),
      .DWE_IN(DWE_TB),
      .BUSY_OUT(BUSY_TB),
      .CHANNEL_OUT(CHANNEL_TB[4:0]),
      .DO_OUT(DO_TB[15:0]),
      .DRDY_OUT(DRDY_TB),
      .EOC_OUT(EOC_TB),
      .EOS_OUT(EOS_TB),
      .JTAGBUSY_OUT(JTAGBUSY_TB),
      .JTAGLOCKED_OUT(JTAGLOCKED_TB),
      .JTAGMODIFIED_OUT(JTAGMODIFIED_TB),
      .VP_IN(1'b0),
      .VN_IN(1'b0)
         );
endmodule