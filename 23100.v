module to divide the reference clock.
    PLL_ADV #
    (
         .CLKFBOUT_MULT     (MULT),
         .DIVCLK_DIVIDE     (DIVIDE),
         .CLKFBOUT_PHASE    (0),
         .CLKIN1_PERIOD     (CLK_PERIOD),
         .CLKIN2_PERIOD     (10),   //Not used
         .CLKOUT0_DIVIDE    (OUT0_DIVIDE),
         .CLKOUT0_PHASE     (0),
         .CLKOUT1_DIVIDE    (OUT1_DIVIDE),
         .CLKOUT1_PHASE     (0),
         .CLKOUT2_DIVIDE    (OUT2_DIVIDE),
         .CLKOUT2_PHASE     (0),
         .CLKOUT3_DIVIDE    (OUT3_DIVIDE),
         .CLKOUT3_PHASE     (0)
    )
    pll_adv_i
    (
         .CLKIN1            (GT_CLK),
         .CLKIN2            (1'b0),
         .CLKINSEL          (1'b1),
         .CLKFBIN           (clkfb_w),
         .CLKOUT0           (clkout0_o),
         .CLKOUT1           (clkout1_o),
         .CLKOUT2           (clkout2_o),
         .CLKOUT3           (clkout3_o),
         .CLKOUT4           (),
         .CLKOUT5           (),
         .CLKFBOUT          (clkfb_w),
         .CLKFBDCM          (),
         .CLKOUTDCM0        (),
         .CLKOUTDCM1        (),
         .CLKOUTDCM2        (),
         .CLKOUTDCM3        (),
         .CLKOUTDCM4        (),
         .CLKOUTDCM5        (),
         .DO                (),
         .DRDY              (),
         .DADDR             (5'd0),
         .DCLK              (1'b0),
         .DEN               (1'b0),
         .DI                (16'd0),
         .DWE               (1'b0),
         .REL               (1'b0),
         .LOCKED            (locked_w),
         .RST               (!GT_CLK_LOCKED)
    );
   // The PLL_NOT_LOCKED signal is created by inverting the PLL's locked signal.
    assign  PLL_NOT_LOCKED  =   ~locked_w;
    // The User Clock is distributed on a global clock net.
    BUFG user_clk_net_i
    (
        .I(clkout0_o),
        .O(USER_CLK)
    );
    BUFG sync_clk_net_i
    (
        .I(clkout1_o),
        .O(SYNC_CLK)
    );
endmodule