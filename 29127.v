module CLKGEN_MMCM(CLK_IN, CLK_OUT, LOCKED);
    input wire  CLK_IN;
    output wire CLK_OUT, LOCKED;
    wire clk_out;
    wire clkfb, clkfb_fbuf;
    // output buffer
    BUFG  obuf (.I(clk_out),
                .O(CLK_OUT));
    // feedback buffer
    BUFG  fbuf (.I(clkfb),
                .O(clkfb_fbuf));
    MMCME2_ADV mmcm (// input
				     .CLKIN1       (CLK_IN),
				     .CLKIN2       (1'b0),
				     .CLKINSEL     (1'b1),
				     .RST          (1'b0),
				     .PWRDWN       (1'b0),
				  	 // output
				     .CLKOUT0      (clk_out),
				     .CLKOUT0B     (),
				     .CLKOUT1      (),
				     .CLKOUT1B     (),
				     .CLKOUT2      (),
				     .CLKOUT2B     (),
				     .CLKOUT3      (),
				     .CLKOUT3B     (),
				     .CLKOUT4      (),
				     .CLKOUT5      (),
				     .CLKOUT6      (),
				     .LOCKED       (LOCKED),
                     // feedback
				     .CLKFBOUT     (clkfb),
				     .CLKFBIN      (clkfb_fbuf),
				     .CLKFBOUTB    (),
				     // dynamic reconfiguration
				     .DADDR        (7'h0),
				     .DI           (16'h0),
				     .DWE          (1'b0),
				     .DEN          (1'b0),
				     .DCLK         (1'b0),
				     .DO           (),
				     .DRDY         (),
				     // phase shift
				     .PSCLK        (1'b0),
				     .PSEN         (1'b0),
				     .PSINCDEC     (1'b0),
				     .PSDONE       (),
				     // status
				     .CLKINSTOPPED (),
				     .CLKFBSTOPPED ());
    defparam mmcm.CLKIN1_PERIOD    = `MMCM_CLKIN1_PERIOD;
    defparam mmcm.CLKFBOUT_MULT_F  = `MMCM_VCO_MULTIPLY;
    defparam mmcm.DIVCLK_DIVIDE    = `MMCM_VCO_DIVIDE;
    defparam mmcm.CLKOUT0_DIVIDE_F = `MMCM_CLKOUT0_DIVIDE;
    defparam mmcm.CLKOUT1_DIVIDE   = `MMCM_CLKOUT1_DIVIDE;
endmodule