module clkctrl2_tb ;
  reg	reset_b_r;
  reg 	lsclk_r;
  reg	hsclk_r;
  reg   hienable_r;
  wire  clkout;
  wire  hsclk_selected_w;
  initial
    begin
      $dumpvars();
      reset_b_r = 0;
      lsclk_r = 0;
      hsclk_r = 0;
      hienable_r = 0;
      #500 reset_b_r = 1;
      #2000;
      #2500  @ ( `CHANGEDGE clkout);
      #(`HSCLK_HALF_CYCLE-4) hienable_r = 1;
      #2500  @ ( `CHANGEDGE clkout);
      #(`HSCLK_HALF_CYCLE-4) hienable_r = 0;
      #2500  @ ( `CHANGEDGE clkout);
      #(`HSCLK_HALF_CYCLE-4) hienable_r = 1;
      #2500  @ ( `CHANGEDGE clkout);
      #(`HSCLK_HALF_CYCLE-4) hienable_r = 0;
      #2500  @ ( `CHANGEDGE clkout);
      #(`HSCLK_HALF_CYCLE-4) hienable_r = 1;
      #2000 $finish();
    end
  always
    #`LSCLK_HALF_CYCLE lsclk_r = !lsclk_r ;
  always
    #`HSCLK_HALF_CYCLE hsclk_r = !hsclk_r ;
`ifdef SYNC_SWITCH_D
  clkctrl2       clkctrl2_u(
                            .hsclk_in(hsclk_r),
                            .lsclk_in(lsclk_r),
                            .rst_b(reset_b_r),
                            .hsclk_sel(hienable_r),
                            .hsclk_div_sel(`HSCLK_DIV),
                            .cpuclk_div_sel(`CPUCLK_DIV),
                            .hsclk_selected(hsclk_selected_w),
                            .clkout(clkout)
                );
`else
  clkctrl       clkctrl_u(
                          .hsclk_in(hsclk_r),
                          .lsclk_in(lsclk_r),
                          .rst_b(reset_b_r),
                          .hsclk_sel(hienable_r),
                          .cpuclk_div_sel(`CPUCLK_DIV),
                          .hsclk_selected(hsclk_selected_w),
                          .clkout(clkout)
                );
`endif
endmodule