module
n64adv_ppu_top n64adv_ppu_u(
  .VCLK(VCLK_w),
  .nVRST(nVRST),
  .nVDSYNC(nVDSYNC_w),
  .VD_i(VD_w),
  .PPUState(PPUState),
  .ConfigSet(PPUConfigSet),
  .OSDCLK(CLKs_controller[0]),
  .OSD_VSync(OSD_VSync),
  .OSDWrVector(OSDWrVector),
  .OSDInfo(OSDInfo),
  .USE_VPLL(USE_VPLL),
  .VCLK_Tx_select(VCLK_Tx_select_w),
  .VCLK_Tx(VCLK_Tx_w),
  .nVRST_Tx(nVRST_Tx_w),
//  .nBLANK(nBLANK_ADV712x),
  .VD_o(VD_o),
  .nCSYNC({nCSYNC,nCSYNC_ADV712x}),
  .UseVGA_HVSync(UseVGA_HVSync),
  .nVSYNC_or_F2(nVSYNC_or_F2),
  .nHSYNC_or_F1(nHSYNC_or_F1)
);
assign CLK_ADV712x = VCLK_Tx_w;
endmodule