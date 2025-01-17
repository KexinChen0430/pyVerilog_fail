module IceBreaker (nreset,
                   clk12Mhz,
                   extInt,
                   leds,
                   pwmLeds,
                   pButtons,
                   pmodA,
                   rx,
                   tx,
                   uartLed);
 // Input ports
 input nreset;
 input clk12Mhz;
 input [0:0] extInt;
 input [1:0] pButtons;
 input rx;
 // Output ports
 output [3:0] leds;
 output [0:0] pwmLeds;
 output tx;
 output uartLed;
 // Bidirectional port
 inout [7:0] pmodA;
 // Clock generation
 wire boardClk;
 wire boardClkLocked;
 // Internal wiring
 wire [7:0] pmodA_read;
 wire [7:0] pmodA_write;
 wire [7:0] pmodA_writeEnable;
 // Internal wire for reset
 wire reset;
 // Instantiate a PLL to make a 18Mhz clock
 PLL makeClk (.clkIn    (clk12Mhz),
              .clkOut   (boardClk),
              .isLocked (boardClkLocked));
 // Instantiate the J1SoC core generated by Spinal
 J1Ice core (.reset              (reset),
             .boardClk           (boardClk),
             .boardClkLocked     (boardClkLocked),
             .extInt             (extInt),
             .leds               (leds),
             .pwmLeds            (pwmLeds),
             .pButtons           (pButtons),
             .pmodA_read         (pmodA_read),
             .pmodA_write        (pmodA_write),
             .pmodA_writeEnable  (pmodA_writeEnable),
             .rx                 (rx),
             .tx                 (tx),
             .uartLed            (uartLed));
  // Invert the negative reset
  assign reset = !nreset;
  // Generate the write port and equip it with tristate functionality
  genvar i;
  generate
     for (i = 0; i < 8; i = i + 1) begin
	// Instantiate the ith tristate buffer
	SB_IO #(.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	       ) iobuf (
		.PACKAGE_PIN(pmodA[i]),
		.OUTPUT_ENABLE(pmodA_writeEnable[i]),
                .D_OUT_0(pmodA_write[i]),
                .D_IN_0(pmodA_read[i]));
     end
  endgenerate
endmodule