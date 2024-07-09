module takes two IEEE single precision floating point and does a
  // Comparison to determine ehich is smaller.
  function fp_comp;
    input     [31:0]   fp1;           // IEEE floating point input
    input [31:0]       fp2;           // IEEE floating point input
    // Figure out which one is smaller
    begin
      casex({fp1[31],fp2[31], (fp1[30:23] < fp2[30:23]), (fp1[30:23] == fp2[30:23]), (fp1[22:0] < fp2[22:0])})
	5'b10_xxx:            fp_comp = 1;        // fp1 is neg and fp2 is pos
	5'b01_xxx:            fp_comp = 0;        // fp1 is pos and fp2 is neg
	5'b00_1xx:            fp_comp = 1;        // exp1 < exp2
	5'b00_00x:            fp_comp = 0;        // exp1 > exp2
	5'b00_011:            fp_comp = 1;        // exp1 = exp2, mant1 < mant2
	5'b00_010:            fp_comp = 0;        // exp1 = exp2, mant1 >= mant2
	5'b11_1xx:            fp_comp = 0;        // exp1 < exp2
	5'b11_00x:            fp_comp = 1;        // exp1 > exp2
	5'b11_011:            fp_comp = 0;        // exp1 = exp2, mant1 < mant2
	5'b11_010:            fp_comp = 1;        // exp1 = exp2, mant1 >= mant2
      endcase
    end
  endfunction
  // Simulation debug stuff.
`ifdef RTL_SIM
  always @* begin
    if (go_sup) begin
      $display($stime, " Executing 3D Command\n");
      // $display("\t\tFORE:  %h", fore_1);
      // $display("\t\tBACK:  %h", back_1);
      // $display("\t\tXY0:   %h", xy0_1);
      // $display("\t\tTPTCH: cp_hb_dout[11:0] = {tptch_1[11:4], tptch_1[3:0]};
      // $display("\t\tZPTCH: cp_hb_dout[11:0] = {zptch_1[11:4], zptch_1[3:0]};
      // $display("\t\tZORG: cp_hb_dout = zorg_1;
      // $display("\t\tLOD0: cp_hb_dout[20:0] = lod0_r;
      // $display("\t\tLOD1: cp_hb_dout[20:0] = lod1_r;
      // $display("\t\tLOD2: cp_hb_dout[20:0] = lod2_r;
      // $display("\t\tLOD3: cp_hb_dout[20:0] = lod3_r;
      // $display("\t\tLOD4: cp_hb_dout[20:0] = lod4_r;
      // $display("\t\tLOD5: cp_hb_dout[20:0] = lod5_r;
      // $display("\t\tLOD6: cp_hb_dout[20:0] = lod6_r;
      // $display("\t\tLOD7: cp_hb_dout[20:0] = lod7_r;
      // $display("\t\tLOD8: cp_hb_dout[20:0] = lod8_r;
      // $display("\t\tLOD9: cp_hb_dout[20:0] = lod9_r;
      // $display("\t\tTPAL: cp_hb_dout[24:4] = tporg_1;
      // $display("\t\tHITH: cp_hb_dout[24:4] = hith_1;
      // $display("\t\tYON:  cp_hb_dout 	    = yon_1;
      // $display("\t\tFCOL:  cp_hb_dout 	    = fcol_1;
      // $display("\t\tALPHA:  cp_hb_dout[23:0] = {atest_r, adstreg_r, asrcreg_r};
      // $display("\t\tTBOARD:  cp_hb_dout[31:0] = texbc_1;
      // $display("\t\tKY3DLO: cp_hb_dout[23:0] = key3dlo_1;
      // $display("\t\tKY3DHI: cp_hb_dout[23:0] = key3dhi_1;
      // $display("\t\tBLENDC: cp_hb_dout[31:0] = blendc_1;
      $display("\t\tPPTR3D: %h", pptr3d_1);
      $display("\t\tV0X: %h", vertex0_u`VXW); 	// V0X
      $display("\t\tVOY: %h", vertex0_u`VYW); 	// V0Y
      $display("\t\tV0Z: %h", vertex0_u`VZW); 	// V0Z
      $display("\t\tV0W: %h", vertex0_u`VWW); 	// V0W
      $display("\t\tV0CI: %h", {vertex0_u`VAB0, vertex0_u`VRB0, vertex0_u`VGB0, vertex0_u`VBB0}); // Color Int.
      $display("\t\tV0S: %h", vertex0_u`VSW); // Fog, Rs, Gs, Bs.
      $display("\t\tV0U: %h", vertex0_u`VUW); // V0U
      $display("\t\tV0V: %h", vertex0_u`VVW); // V0V
      $display("\t\tV1X: %h", vertex1_u`VXW); 	// V1X
      $display("\t\tV1Y: %h", vertex1_u`VYW); 	// V1Y
      $display("\t\tV1Z: %h", vertex1_u`VZW); 	// V1Z
      $display("\t\tV1W: %h", vertex1_u`VWW); 	// V1W
      $display("\t\tV1CI: %h", {vertex1_u`VAB0, vertex1_u`VRB0, vertex1_u`VGB0, vertex1_u`VBB0}); // Color Int.
      $display("\t\tV1S: %h", vertex1_u`VSW); // Fog, Rs, Gs, Bs.
      $display("\t\tV1U: %h", vertex1_u`VUW); // V1U
      $display("\t\tV1V: %h", vertex1_u`VVW); // V1V
      $display("\t\tV2X: %h", vertex2_u`VXW); 	// V2X
      $display("\t\tV2Y: %h", vertex2_u`VYW); 	// V2Y
      $display("\t\tV2Z: %h", vertex2_u`VZW); 	// V2Z
      $display("\t\tV2W: %h", vertex2_u`VWW); 	// V2W
      $display("\t\tV2CI: %h", {vertex2_u`VAB0, vertex2_u`VRB0, vertex2_u`VGB0, vertex2_u`VBB0}); // Color Int.
      $display("\t\tV2S: %h", vertex2_u`VSW); // Fog, Rs, Gs, Bs.
      $display("\t\tV2U: %h", vertex2_u`VUW); // V2U
      $display("\t\tV2V: %h", vertex2_u`VVW); // V2V
      $display("\t\tV0AF: %h", vertex0_u`VAW);
      $display("\t\tV0RF: %h", vertex0_u`VRW);
      $display("\t\tV0GF: %h", vertex0_u`VGW);
      $display("\t\tV0BF: %h", vertex0_u`VBW);
	  $display("\t\tV1AF: %h", vertex1_u`VAW);
      $display("\t\tV1RF: %h", vertex1_u`VRW);
      $display("\t\tV1GF: %h", vertex1_u`VGW);
      $display("\t\tV1BF: %h", vertex1_u`VBW);
      $display("\t\tV2AF: %h", vertex2_u`VAW);
      $display("\t\tV2RF: %h", vertex2_u`VRW);
      $display("\t\tV2GF: %h", vertex2_u`VGW);
      $display("\t\tV2BF: %h", vertex2_u`VBW);
    end // if (cmdack)
  end // always @ *
`endif
endmodule