module clk_gen (
    input wire  clk_ref,
    input wire  reset_sw,
    output wire clk,
    output wire clk_n,
    output wire chip_reset
);
    wire        locked;
    wire        dcm_reset;
    assign locked     = 1'b1;
    assign dcm_reset  = (reset_sw == `RESET_ENABLE) ? `ENABLE : `DISABLE;
    assign chip_reset = ((reset_sw == `RESET_ENABLE) || (locked == `DISABLE)) ?
                            `RESET_ENABLE : `RESET_DISABLE;
   // x_s3e_dcm x_s3e_dcm (
   //     .CLKIN_IN        (clk_ref),
   //     .RST_IN          (dcm_reset),
   //     .CLK0_OUT        (clk),
   //     .CLK180_OUT      (clk_n),
   //     .LOCKED_OUT      (locked)
   //);
   assign clk   = clk_ref;
   assign clk_n = ~clk_ref;
endmodule