module clkctrl_tb ;
  reg reset_b_r;
  reg hsclk_by2_r;
  reg hsclk_by4_r;
  reg lsclk_r;
  reg hsclk_r;
  reg   hienable_r;
  wire  clkout;
  wire loselect_w;
  wire hiselect_w;
  wire cpuclk_w;
`ifdef STOP_IN_PHI1_D
  assign clkout = (hiselect_w & hienable_r & hsclk_by4_r ) | (!hienable_r & loselect_w & lsclk_r);
`else
  assign clkout = (!hiselect_w | !hienable_r | hsclk_by4_r ) & (hienable_r | !loselect_w | lsclk_r);
`endif
  initial
    begin
      $dumpvars();
      reset_b_r = 0;
      lsclk_r = 0;
      hsclk_r = 0;
      hienable_r = 0;
      #500 reset_b_r = 1;
      #2500  @ ( `CHANGEDGE clkout);
      #10 hienable_r = 1;
      #2500  @ ( `CHANGEDGE clkout);
      #10 hienable_r = 0;
      #2500  @ ( `CHANGEDGE clkout);
      #25 hienable_r = 1;
      #10000 $finish();
    end
  always
    #`LSCLK_HALF_CYCLE lsclk_r = !lsclk_r ;
  always
    #`HSCLK_HALF_CYCLE hsclk_r = !hsclk_r ;
  always @ (negedge reset_b_r or posedge hsclk_r )
    if ( !reset_b_r)
      { hsclk_by2_r, hsclk_by4_r } <= 0;
    else
      begin
        hsclk_by2_r <= !hsclk_by2_r;
        hsclk_by4_r <= hsclk_by2_r ^ hsclk_by4_r;
      end
  retimer  ls_retime ( lsclk_r, !hienable_r & !hiselect_w, reset_b_r, loselect_w);
  retimer  hs_retime ( hsclk_by4_r, hienable_r & !loselect_w, reset_b_r, hiselect_w);
endmodule