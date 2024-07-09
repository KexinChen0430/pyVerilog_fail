module
  wire plloutclk;
  wire pll_powerd = pll_ASLEEP | hfclkrst; // Power down by PMU or the register programmed
  e203_subsys_pll u_e203_subsys_pll(
    .pll_asleep (pll_powerd ),
    .pll_RESET  (pll_RESET),
    .pll_OD  (pll_OD),
    .pll_M   (pll_M ),
    .pll_N   (pll_N ),
    .pllrefclk  (hfextclk ),
    .plloutclk  (plloutclk )
  );
  // The Reset syncer for the PLLout clk
  wire plloutclk_rst_n;
  e203_subsys_hclkgen_rstsync plloutclk_rstsync(
    .clk      (plloutclk),
    .rst_n_a  (hfclkrst_n),
    .test_mode(test_mode),
    .rst_n    (plloutclk_rst_n)
  );
  // The Reset syncer for the HFextclk
  wire hfextclk_rst_n;
  e203_subsys_hclkgen_rstsync hfextclk_rstsync(
    .clk      (hfextclk),
    .rst_n_a  (hfclkrst_n),
    .test_mode(test_mode),
    .rst_n    (hfextclk_rst_n)
  );
  // The PLL divider
  wire plloutdivclk;
  e203_subsys_pllclkdiv u_e203_subsys_pllclkdiv(
    .test_mode(test_mode),
    .rst_n (plloutclk_rst_n),
    .divby1(plloutdivby1),
    .div   (plloutdiv   ),
    .clk   (plloutclk),// The PLL clock
    .clkout(plloutdivclk) // The divided Clock
  );
  // The glitch free clock mux
  wire gfcm_clk;
  e203_subsys_gfcm u_e203_subsys_gfcm(
    .test_mode(test_mode),
    .clk0_rst_n   (plloutclk_rst_n),
    .clk1_rst_n   (hfextclk_rst_n),
    .sel1    (pllbypass),
    .clk0    (plloutdivclk),// The divided PLL clock
    .clk1    (hfextclk),// The original Crystal clock
    .clkout  (gfcm_clk)
  );
  assign hfclk = test_mode ? hfextclk : gfcm_clk;
  assign inspect_16m_clk = hfextclk ;
  assign inspect_pll_clk = plloutclk;
endmodule