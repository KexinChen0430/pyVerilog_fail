module CLKGEN_DCM(CLK_IN, CLK_OUT, LOCKED);
    input wire  CLK_IN;
    output wire CLK_OUT, LOCKED;
    wire clk_ibuf;
    wire clk_out;
    wire clk0, clk0_fbuf;
    // input buffer
    IBUFG ibuf (.I(CLK_IN),
                .O(clk_ibuf));
    // output buffer
    BUFG  obuf (.I(clk_out),
                .O(CLK_OUT));
    // feedback buffer
    BUFG  fbuf (.I(clk0),
                .O(clk0_fbuf));
    // dcm instantiation
    DCM_SP dcm (// input
                .CLKIN   (clk_ibuf),
                .RST     (1'b0),
                // output
                .CLKFX   (clk_out),
                .LOCKED  (LOCKED),
                // feedback
                .CLK0    (clk0),
                .CLKFB   (clk0_fbuf),
                // phase shift
                .PSEN    (1'b0),
                .PSINCDEC(1'b0),
                .PSCLK   (1'b0),
                // digital spread spectrum
                .DSSEN   (1'b0));
    defparam dcm.CLKIN_PERIOD   = `DCM_CLKIN_PERIOD;
    defparam dcm.CLKFX_MULTIPLY = `DCM_CLKFX_MULTIPLY;
    defparam dcm.CLKFX_DIVIDE   = `DCM_CLKFX_DIVIDE;
endmodule