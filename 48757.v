module temp set to 0
     .mcdc_ready          (dis_rdy),
     .mcpush              (dis_push),
     .mclock              (mclock),
     .datdc_in            (mc_read_data),
//     .datdc_in            ({mc_read_data[111:96], mc_read_data[127:112],
//			    mc_read_data[79:64],  mc_read_data[95:80],
//			    mc_read_data[47:32],  mc_read_data[63:48],
//			    mc_read_data[15:0],   mc_read_data[31:16]}),
     .vga_blank           (v_blank),
     .vga_hsync           (v_hrtc),
     .vga_vsync           (v_vrtc),
     .disp_reg_rep        (1'b0),
     .disp_reg_crt        (4'b0),
     .hdat_out_crt_aux    (hdat_out_crt_vga),
     .hint_out_tog        ({hb_int_tog,vb_int_tog}),
     .vblnkst2            (vblnkst2),
     .db_pitch_regist     (crt_ptch[11:0]),
     .displ_start_vs      (crt_org[20:0]),
     .mcdc_req            (dis_req),
     .mcdcyf              (dis_y),
     .mcdcx               (dis_x),
     .mcdcpg              (dis_page),
     .blank_toidac        (blank_toidac),
     .hcsync_toidac       (hcsync_toidac),
     .vsync_toidac        (vsync_toidac),
     .datdc_out           (pd_toidac),
     .fdp_on              (/*fdp_on*/),
     .probe               (crt_probe),
//     .crt_rstn            (crt_rstn),
     .probe_addr          (probe_addr),
     .syncsenable_regist  (sereg),
     .hactive_regist      (hactive_regist),
     .horiz_actv_decode	  (horiz_actv_decode)
     );
/*	   INSTANTIATE THE BUS MASTERING UNIT PCI             */
  pci_wom U_BM
    (
     .reset_n             (bb_rstn),
     .hb_clk              (hb_clk),
     .gnt_n               (pgnntn),
     //.hbi_addr            (hb_adr[3:2]),
     //.ad_in               (pad[31:0]),
     .irdy_in_n           (pirdyn),
     .frame_in_n          (pframen),
     .trdy_in_n           (ptrdyn),
     .stop_in_n           (pstopn),
     .devsel_in_n         (pdevseln),
     .dlp_busy            (pp_rdback[21]),
     .de_pl_busy          (de_pl_busy),
     .flow_rpb            (flow_reg[4]),
     .flow_prv            (flow_reg[3]),
     .flow_clp            (flow_reg[2]),
     .flow_mcb            (flow_reg[1]),
     .flow_deb            (flow_reg[0]),
     .v_blank             (vblnkst2),
     .vb_int_tog          (vb_int_tog),
     .hb_int_tog          (hb_int_tog),
     .pci_mstr_en         (pci_mstr_en),
     .pci_wr_addr         (pci_wr_addr),
     .pcim_masks          (pcim_masks),
     .pci_ad_out          (pcim_ad_out),
     .pci_ad_oe           (pcim_ad_oe),
     .c_be_out            (c_be_out),
     .irdy_n              (irdy_out_n),
     .pci_irdy_oe_n       (irdy_oe_n),
     .pci_req_out_n       (req_n),
     .frame_out_n         (frame_out_n),
     .frame_oe_n          (frame_oe_n)
     );
/*      	 INSTANTIATE THE RAMDAC                               */
wire temp_psave;
assign dac_psaven =  ~temp_psave;  // CRT Power Save Signal.
ramdac u_ramdac
    // Inputs.
    (
     .hclk		(hb_clk),
     .pixclk            (pixclk),
     .crtclock		(crtclock),
     .hresetn		(dac_reset_n),
     .wrn		(idac_wr),
     .rdn		(idac_rd),
     .rs		(P_A[2:0]),
     .cpu_din		(p_d_out),
     .ext_fs		(v_clks),
     .blank		(blank_toidac),
     .hsyncin		(hcsync_toidac),
     .vsyncin		(vsync_toidac),
     .pix_din		(pd_toidac),
     .idac_en		(idac_en),
//     .ldi_2xzoom	(vga_controlreg[5]),
     .ldi_2xzoom	(ldi_2xzoom),
     .fdp_on            (1'b1),
     .pix_locked        (pix_locked & pix_locked_1),
     // Outputs.
     .bpp		(bpp),
     .vga_mode		(vga_mode),
     .dac_pwr		(temp_psave),
     .syncn2dac		(),
     .blanknr		(),
     .blankng		(),
     .blanknb		(),
     .sense		(),
     .cpu_dout		(idac_rd_data),
     .hsyncout		(HSYNC0n),
     .vsyncout		(VSYNC0n),
     .dac_cblankn       (dac_cblankn),
     .p0_red		(red),
     .p0_green		(grn),
     .p0_blue		(blu),
     .pixs              (),
     .display_en        (dvo_de),
     // For system PLL
     .sprog_mode        (sprog_mode),
     .spll_enab         (spll_enab),
     .sysmctl           (sysmctl),
     .sysnctl           (sysnctl),
     .syspctl           (syspctl),
     // For Pix PLL
     .ppll_enable       (ppll_enable),
     .pixclksel         (pixclksel),
     .int_fs            (int_fs),
     .sync_ext          (sync_ext),
     .p_update          (p_update),
     .pll_params        (pll_params),
     .probe             (r_probe),
     .probe_rcpu        (probe_rcpu),
     .probe_reg         (probe_rreg),
     .probe_pwr         (probe_pwr)
     );
  assign ledn = ~vga_mode;
/* 	   Host skew reduction PLL					 */
/* 	   PLL number two.        					 */
/*
hb_pll u_hb_pll
    (
     // Inputs.
     .inclk0        (hclock),
     .pllena        (1'b1),
     .areset        (1'b0), // (~hresetn),
     // Outputs.
     .c0            (hb_clk),
     .c1            (),
     .c2            (),
     .locked        ()
     );
*/
assign hb_clk = hclock;
/*      	 External PLL Interface.                                   */
  pll_intf u_pll_intf
    (
     .hclk                   (hb_clk),
     .hresetn                (bb_rstn),
     .p_update0              (p_update),
     .pll_params0            (pll_params),
     .p_update1              (1'b0),
     .pll_params1            (27'b0),
     .sclk                   (pll_sclk_int),
     .sdat                   (pll_sdat_int),
     .sdat_oe                (pll_sdat_oe),
     .sclk_oe                (pll_sclk_oe),
     .shift_done             (shift_done)
     );
/*      	 Clock Switcher And PLLs.                                  */
wire [1:0] 	   pll_locked;
clk_switch u_clk_switch
    (
     .pll_clock    		(pll_clka),
     .bpp           		(bpp),
     .vga_mode      		(vga_mode),
     .pix_clk       		(pixclk),
     .pix_clk_vga      		(pixclk_vga),
     .crt_clk       		(crtclock)
     );
/* 	   System PLL		 					 */
/* 	   PLL number five.     					 */
// System PLL.
  spll_pll u_spll_pll
    (
     // Inputs.
     .inclk0        (pll_clkb),
     .pllena        (1'b1),
     .areset        (~hresetn),
     // Outputs.
     .c0            (vga_mclock),
     .c1            (de_clk),
//     .c2            (mclock180),
     .locked        (mem_locked)
     );
  assign  mclock180 = ~mclock;
  assign 	  sys_locked = 1'b1;
/* 	   Probes from here on.                  	  		 */
// assign TESTCLK0 = mclock;
endmodule