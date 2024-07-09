module.  Outputs are at 150M presently.
PLL_BASE #(
.BANDWIDTH("OPTIMIZED"), // "HIGH", "LOW" or "OPTIMIZED"
.CLKFBOUT_MULT(6), // Multiplication factor for all output clocks
.CLKFBOUT_PHASE(0.0), // Phase shift (degrees) of all output clocks
.CLKIN_PERIOD(10), // Clock period (ns) of input clock on CLKIN
.CLKOUT0_DIVIDE(4), // Division factor for CLKOUT0 (1 to 128)
.CLKOUT0_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT0 (0.01 to 0.99)
.CLKOUT0_PHASE(0.0), // Phase shift (degrees) for CLKOUT0 (0.0 to 360.0)
.CLKOUT1_DIVIDE(2), // Division factor for CLKOUT1 (1 to 128)
.CLKOUT1_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT1 (0.01 to 0.99)
.CLKOUT1_PHASE(0), // Phase shift (degrees) for CLKOUT1 (0.0 to 360.0)
.CLKOUT2_DIVIDE(16), // Division factor for CLKOUT2 (1 to 128)
.CLKOUT2_DUTY_CYCLE(0.375), // Duty cycle for CLKOUT2 (0.01 to 0.99)
.CLKOUT2_PHASE(0.0), // Phase shift (degrees) for CLKOUT2 (0.0 to 360.0)
.CLKOUT3_DIVIDE(4), // Division factor for CLKOUT3 (1 to 128)
.CLKOUT3_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT3 (0.01 to 0.99)
.CLKOUT3_PHASE(180.0), // Phase shift (degrees) for CLKOUT3 (0.0 to 360.0)
.CLKOUT4_DIVIDE(8), // Division factor for CLKOUT4 (1 to 128)
.CLKOUT4_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT4 (0.01 to 0.99)
.CLKOUT4_PHASE(0.0), // Phase shift (degrees) for CLKOUT4 (0.0 to 360.0)
.CLKOUT5_DIVIDE(4), // Division factor for CLKOUT5 (1 to 128)
.CLKOUT5_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT5 (0.01 to 0.99)
.CLKOUT5_PHASE(180.0), // Phase shift (degrees) for CLKOUT5 (0.0 to 360.0)
.COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS",
.DIVCLK_DIVIDE(1), // Division factor for all clocks (1 to 52)
.REF_JITTER(0.100) // Input reference jitter (0.000 to 0.999 UI%)
) clkBPLL (
.CLKFBOUT(PLLBfb), 					// General output feedback signal
.CLKOUT0(MCLK), 						// 156.25 MHz system clock before buffering
.CLKOUT1(), 			// 312.5 MHz clock for GTP TXUSRCLK
.CLKOUT2(), 							//
.CLKOUT3(MCLK180), 					// 156.25 MHz system clock before buffering, 180deg
.CLKOUT4(), 							//
.CLKOUT5(),								//
.LOCKED(PLL_LOCK),					   // Active high PLL lock signal
.CLKFBIN(PLLBfb), 					// Clock feedback input
.CLKIN(clk100), 				// 312.5 MHz clock input from GTP
.RST(1'b0)
);
// Buffer main system clock (CLK)
BUFG bufM (.O(CLK), .I(MCLK));
`endif
always @ (posedge CLK) begin
	pll_lock3 <= pll_lock2;
	pll_lock2 <= pll_lock1;
	pll_lock1 <= PLL_LOCK;
end
`ifdef C3D_BUILD
	assign c2c1_reset = !(pll_lock3 & C2C_U_RDY_IN);
	assign c2c2_reset = !(pll_lock3 & C2C_D_RDY_IN);
`else
	assign c2c1_reset = (!(pll_lock3 & C2C_U_RDY_IN)) | VIO0[0];
	assign c2c2_reset = (!(pll_lock3 & C2C_D_RDY_IN)) | VIO0[0];
`endif
//Instantiate C2C wrapper
ring32b_bidir inst_c2c_up(
	.CLK		(CLK),
	.swClk0		(MCLK),
	.swClk180	(MCLK180),
	.Reset		(c2c1_reset),
	.din		(C2C_U_TX_DATA),
	.dout		(C2C_U_RX_DATA),
	.RING_OUT	(C2C_U_OUT),
	.RING_IN	(C2C_U_IN),
	.lock_in	(C2C_U_LOCK_IN),
	.lock_out	(C2C_U_LOCK_OUT),
   	.partner_ready	(C2C_U_RDY_IN),
	.test_sigs	(c2c1_status));
ring32b_bidir inst_c2c_dn(
	.CLK		(CLK),
	.swClk0		(MCLK),
	.swClk180	(MCLK180),
	.Reset		(c2c2_reset),
	.din		(C2C_D_TX_DATA),
	.dout		(C2C_D_RX_DATA),
	.RING_OUT	(C2C_D_OUT),
	.RING_IN	(C2C_D_IN),
	.lock_in	(C2C_D_LOCK_IN),
	.lock_out	(C2C_D_LOCK_OUT),
   	.partner_ready	(C2C_D_RDY_IN),
	.test_sigs	(c2c2_status));
assign C2C_U_RDY_OUT = PLL_LOCK;
assign C2C_D_RDY_OUT = PLL_LOCK;
//instantiate an idelayctrl for alignment of ring interconnect.
 IDELAYCTRL idelayctrl0 (
  	.RDY	(),
  	.REFCLK	(CLK),
  	.RST	(~pll_lock3)
  )  /* synthesis syn_noprune =1 */ ;
`ifndef C3D_BUILD
// Bluespec Interface traffic generator (only required for c2c test)
	mkGetOutput trafficgen1 (
		.CLK(CLK),
		.RST_N(pll_lock3),
		.EN_tx_sink_get(1'b1),
		.tx_sink_get(C2C_U_TX_DATA),
		.RDY_tx_sink_get());
	assign C2C_D_TX_DATA = C2C_U_TX_DATA;
	cs_icon inst_icon (
    	.CONTROL0(CONTROL0),
    	.CONTROL1(CONTROL1),
    	.CONTROL2(CONTROL2),
	.CONTROL3(CONTROL3),
	.CONTROL4(CONTROL4),
	.CONTROL5(CONTROL5)) /* synthesis syn_noprune =1 */ ;
    	cs_vio inst_vio (
    	.CONTROL(CONTROL0),
    	.ASYNC_OUT(VIO0),
	.ASYNC_IN(32'b0)) /* synthesis syn_noprune =1 */ ;
	cs_ila inst_ila_cx4_1 (
    	.CONTROL(CONTROL1),
    	.CLK(CLK),
    	.TRIG0(TRIG0))		/* synthesis syn_noprune =1 */ ;
	cs_ila inst_ila_cx4_2 (
	    .CONTROL(CONTROL2),
	    .CLK(CLK),
     	.TRIG0(TRIG1))		/* synthesis syn_noprune =1 */ ;
	cs_ila inst_ila_c2c1 (
	    .CONTROL(CONTROL3),
	    .CLK(CLK),
    	.TRIG0(TRIG2))		/* synthesis syn_noprune =1 */ ;
	cs_ila inst_ila_c2c2 (
	    .CONTROL(CONTROL4),
	    .CLK(CLK),
    	.TRIG0(TRIG3))		/* synthesis syn_noprune =1 */ ;
	cs_ila inst_ila_spare (
	    .CONTROL(CONTROL5),
	    .CLK(CLK),
    	.TRIG0(TRIG4))		/* synthesis syn_noprune =1 */ ;
	assign TRIG0 = {256'h0000000000000000000000000000000000000000000000000000000000000000};
	assign TRIG1 = {256'h0000000000000000000000000000000000000000000000000000000000000000};
	assign TRIG2 = {c2c1_status,c2c1_reset,C2C_U_RDY_IN,PLL_LOCK,C2C_U_LOCK_IN, C2C_U_LOCK_OUT, C2C_U_RX_DATA, C2C_U_TX_DATA};
	assign TRIG3 = {c2c2_status,c2c2_reset,C2C_D_RDY_IN,PLL_LOCK,C2C_D_LOCK_IN, C2C_D_LOCK_OUT, C2C_D_RX_DATA, C2C_D_TX_DATA};
	assign TRIG4 = {256'h0000000000000000000000000000000000000000000000000000000000000000};
`endif
endmodule