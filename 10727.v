module clock_generator_pll_s16_diff (clkin_p, clkin_n, ioclk, serdesstrobe, reset, gclk1, gclk2, bufpll_lckd) ;
parameter integer S = 16 ;   			// Parameter to set the serdes factor 1..8
parameter integer PLLX = 16 ;			// Parameter to set the multiplication factor in the PLL
parameter integer PLLD = 1 ;			// Parameter to set the division factor in the PLL
parameter real 	  CLKIN_PERIOD = 6.000 ;	// clock period (ns) of input clock on clkin_p
parameter         DIFF_TERM = "FALSE" ; 	// Parameter to enable internal differential termination
input		reset ;				// reset (active high)
input		clkin_p, clkin_n ;		// differential clock inputs
output		ioclk ;				// ioclock from BUFPLL
output		serdesstrobe ;			// serdes strobe from BUFPLL
output		gclk1 ;				// global clock output from BUFG x1
output		gclk2 ;				// global clock output from BUFG x2
output		bufpll_lckd ;			// Locked output from BUFPLL
IBUFGDS #(
	.DIFF_TERM 		(DIFF_TERM))
iob_clkint (
	.I    			(clkin_p),
	.IB       		(clkin_n),
	.O         		(clkint));
PLL_ADV #(
      .BANDWIDTH		("OPTIMIZED"),  		// "high", "low" or "optimized"
      .CLKFBOUT_MULT		(PLLX),       			// multiplication factor for all output clocks
      .CLKFBOUT_PHASE		(0.0),     			// phase shift (degrees) of all output clocks
      .CLKIN1_PERIOD		(CLKIN_PERIOD),  		// clock period (ns) of input clock on clkin1
      .CLKIN2_PERIOD		(CLKIN_PERIOD),  		// clock period (ns) of input clock on clkin2
      .CLKOUT0_DIVIDE		(1),       			// division factor for clkout0 (1 to 128)
      .CLKOUT0_DUTY_CYCLE	(0.5), 				// duty cycle for clkout0 (0.01 to 0.99)
      .CLKOUT0_PHASE		(0.0), 				// phase shift (degrees) for clkout0 (0.0 to 360.0)
      .CLKOUT1_DIVIDE		(1),   				// division factor for clkout1 (1 to 128)
      .CLKOUT1_DUTY_CYCLE	(0.5), 				// duty cycle for clkout1 (0.01 to 0.99)
      .CLKOUT1_PHASE		(0.0), 				// phase shift (degrees) for clkout1 (0.0 to 360.0)
      .CLKOUT2_DIVIDE		(S),	   			// division factor for clkout2 (1 to 128)
      .CLKOUT2_DUTY_CYCLE	(0.5), 				// duty cycle for clkout2 (0.01 to 0.99)
      .CLKOUT2_PHASE		(0.0), 				// phase shift (degrees) for clkout2 (0.0 to 360.0)
      .CLKOUT3_DIVIDE		(S/2),   			// division factor for clkout3 (1 to 128)
      .CLKOUT3_DUTY_CYCLE	(0.5), 				// duty cycle for clkout3 (0.01 to 0.99)
      .CLKOUT3_PHASE		(0.0), 				// phase shift (degrees) for clkout3 (0.0 to 360.0)
      .CLKOUT4_DIVIDE		(S),   				// division factor for clkout4 (1 to 128)
      .CLKOUT4_DUTY_CYCLE	(0.5), 				// duty cycle for clkout4 (0.01 to 0.99)
      .CLKOUT4_PHASE		(0.0),      			// phase shift (degrees) for clkout4 (0.0 to 360.0)
      .CLKOUT5_DIVIDE		(S),       			// division factor for clkout5 (1 to 128)
      .CLKOUT5_DUTY_CYCLE	(0.5), 				// duty cycle for clkout5 (0.01 to 0.99)
      .CLKOUT5_PHASE		(0.0),      			// phase shift (degrees) for clkout5 (0.0 to 360.0)
      .COMPENSATION		("INTERNAL"), 			// "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "INTERNAL", "EXTERNAL", "DCM2PLL", "PLL2DCM"
      .DIVCLK_DIVIDE		(PLLD),        			// division factor for all clocks (1 to 52)
      .REF_JITTER		(0.100))       			// input reference jitter (0.000 to 0.999 ui%)
tx_pll_adv_inst (
      .CLKFBDCM			(),              		// output feedback signal used when pll feeds a dcm
      .CLKFBOUT			(dummy),              		// general output feedback signal
      .CLKOUT0			(pllout_xs),      		// x10 clock for transmitter
      .CLKOUT1			(),      			//
      .CLKOUT2			(pllout_x1), 			// x1 clock for BUFG
      .CLKOUT3			(pllout_x2),              	// x2 clock for BUFG
      .CLKOUT4			(),              		// one of six general clock output signals
      .CLKOUT5			(),              		// one of six general clock output signals
      .CLKOUTDCM0		(),            			// one of six clock outputs to connect to the dcm
      .CLKOUTDCM1		(),            			// one of six clock outputs to connect to the dcm
      .CLKOUTDCM2		(),            			// one of six clock outputs to connect to the dcm
      .CLKOUTDCM3		(),            			// one of six clock outputs to connect to the dcm
      .CLKOUTDCM4		(),            			// one of six clock outputs to connect to the dcm
      .CLKOUTDCM5		(),            			// one of six clock outputs to connect to the dcm
      .DO			(),                    		// dynamic reconfig data output (16-bits)
      .DRDY			(),                  		// dynamic reconfig ready output
      .LOCKED			(pll_lckd),        		// active high pll lock signal
      .CLKFBIN			(dummy),			// clock feedback input
      .CLKIN1			(clkint),     			// primary clock input
      .CLKIN2			(1'b0),		     		// secondary clock input
      .CLKINSEL			(1'b1),             		// selects '1' = clkin1, '0' = clkin2
      .DADDR			(5'b00000),            		// dynamic reconfig address input (5-bits)
      .DCLK			(1'b0),               		// dynamic reconfig clock input
      .DEN			(1'b0),                		// dynamic reconfig enable input
      .DI			(16'h0000),        		// dynamic reconfig data input (16-bits)
      .DWE			(1'b0),                		// dynamic reconfig write enable input
      .RST			(reset),               		// asynchronous pll reset
      .REL			(1'b0)) ;    			// used to force the state of the PFD outputs (test only)
BUFG	bufg_tx_x1 (.I(pllout_x1), .O(gclk1) ) ;
BUFG	bufg_tx_x2 (.I(pllout_x2), .O(gclk2) ) ;
BUFPLL #(
      .DIVIDE			(S/2))              		// PLLIN0 divide-by value to produce SERDESSTROBE (1 to 8); default 1
tx_bufpll_inst (
      .PLLIN			(pllout_xs),        		// PLL Clock input
      .GCLK			(gclk2), 			// Global Clock input
      .LOCKED			(pll_lckd),             	// Clock0 locked input
      .IOCLK			(ioclk), 			// Output PLL Clock
      .LOCK			(buf_pll_lckd),          	// BUFPLL Clock and strobe locked
      .SERDESSTROBE		(serdesstrobe)) ; 		// Output SERDES strobe
assign bufpll_lckd = buf_pll_lckd & pll_lckd ;
endmodule