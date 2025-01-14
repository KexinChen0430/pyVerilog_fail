module onetswitch_top
(
  // GT top level ports
  output [(4*`C_NUM_QUADS)-1:0]		TXN_O,
  output [(4*`C_NUM_QUADS)-1:0]		TXP_O,
  input  [(4*`C_NUM_QUADS)-1:0]    	RXN_I,
  input  [(4*`C_NUM_QUADS)-1:0]   	RXP_I,
  input  [`C_REFCLKS_USED-1:0]        	GTREFCLK0P_I,
  input  [`C_REFCLKS_USED-1:0]        	GTREFCLK0N_I,
  input  [`C_REFCLKS_USED-1:0]        	GTREFCLK1P_I,
  input  [`C_REFCLKS_USED-1:0]        	GTREFCLK1N_I
);
  // Ibert refclk internal signals
  wire   [`C_NUM_QUADS-1:0]        	gtrefclk0_i;
  wire   [`C_NUM_QUADS-1:0]        	gtrefclk1_i;
  wire   [`C_REFCLKS_USED-1:0]        	refclk0_i;
  wire   [`C_REFCLKS_USED-1:0]        	refclk1_i;
  // Refclk IBUFDS instantiations
    IBUFDS_GTE2 #(
       .CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
       .CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
       .CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
    )
    IBUFDS_GTE2_inst0 (
       .O(gtrefclk0_i),         // 1-bit output: Refer to Transceiver User Guide
       .ODIV2(ODIV2), // 1-bit output: Refer to Transceiver User Guide
       .CEB(1'b0),     // 1-bit input: Refer to Transceiver User Guide
       .I(GTREFCLK0P_I[0]),         // 1-bit input: Refer to Transceiver User Guide
       .IB(GTREFCLK0N_I[0])        // 1-bit input: Refer to Transceiver User Guide
    );
    IBUFDS_GTE2 #(
       .CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
       .CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
       .CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
    )
    IBUFDS_GTE2_inst1 (
       .O(gtrefclk1_i),         // 1-bit output: Refer to Transceiver User Guide
       .ODIV2(ODIV2), // 1-bit output: Refer to Transceiver User Guide
       .CEB(1'b0),     // 1-bit input: Refer to Transceiver User Guide
       .I(GTREFCLK1P_I[0]),         // 1-bit input: Refer to Transceiver User Guide
       .IB(GTREFCLK1N_I[0])        // 1-bit input: Refer to Transceiver User Guide
    );
  // Refclk connection from each IBUFDS to respective quads depending on the source selected in gui
  // IBERT core instantiation
  ibert_7series_gtx_0 u_ibert_core
    (
      .TXN_O(TXN_O),
      .TXP_O(TXP_O),
      .RXN_I(RXN_I),
      .RXP_I(RXP_I),
      .GTREFCLK0_I(gtrefclk0_i),
      .GTREFCLK1_I(gtrefclk1_i)
    );
endmodule