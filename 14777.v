module stratix_mac_mult_internal
  (
   dataa,
   datab,
   signa,
   signb,
   scanouta,
   scanoutb,
   dataout
   );
   parameter dataa_width = 18;
   parameter datab_width = 18;
   parameter dataout_width = 36;
   input [dataa_width-1:0] dataa;
   input [datab_width-1:0] datab;
   input 	signa;
   input 	signb;
   output [dataa_width-1:0] scanouta;
   output [datab_width-1:0] scanoutb;
   output [35:0] dataout;
   wire [35:0] 	 dataout_s;
   wire 	 neg;
   wire [35:0] 	 dataout_tmp;
   wire [dataa_width-1:0] abs_a;
   wire [datab_width-1:0] abs_b;
   wire [17:0] 		  dataa_tmp;
   wire [17:0] 		  datab_tmp;
   wire [17:0] 		  scanouta_tmp;
   wire [17:0] 		  scanoutb_tmp;
   wire [(dataa_width+datab_width)-1:0] abs_output;
   specify
      (dataa *> dataout)     = (0, 0);
      (datab *> dataout)     = (0, 0);
      (dataa => scanouta)    = (0, 0);
      (datab => scanoutb)    = (0, 0);
      (signa *> dataout)     = (0, 0);
      (signb *> dataout)     = (0, 0);
   endspecify
   buf dataa_buf [dataa_width-1:0] (dataa_tmp[dataa_width-1:0], dataa);
   buf datab_buf [datab_width-1:0] (datab_tmp[datab_width-1:0], datab);
   assign neg = ((dataa_tmp[dataa_width-1] && signa) ^ (datab_tmp[datab_width-1] && signb));
   assign abs_a = (signa && dataa_tmp[dataa_width-1]) ? (~dataa_tmp[dataa_width-1:0] + 1) : dataa_tmp[dataa_width-1:0];
   assign abs_b = (signb && datab_tmp[datab_width-1]) ? (~datab_tmp[datab_width-1:0] + 1) : datab_tmp[datab_width-1:0];
   assign scanouta_tmp = dataa_tmp;
   assign scanoutb_tmp = datab_tmp;
   assign abs_output = abs_a * abs_b;
   assign dataout_tmp = neg ? (~abs_output + 1) : abs_output;
   buf scanouta_buf [dataa_width-1:0] (scanouta, scanouta_tmp[dataa_width-1:0]);
   buf scanoutb_buf [datab_width-1:0] (scanoutb, scanoutb_tmp[datab_width-1:0]);
   buf dataout_buf0(dataout[0], dataout_tmp[0]);
   buf dataout_buf1(dataout[1], dataout_tmp[1]);
   buf dataout_buf2(dataout[2], dataout_tmp[2]);
   buf dataout_buf3(dataout[3], dataout_tmp[3]);
   buf dataout_buf4(dataout[4], dataout_tmp[4]);
   buf dataout_buf5(dataout[5], dataout_tmp[5]);
   buf dataout_buf6(dataout[6], dataout_tmp[6]);
   buf dataout_buf7(dataout[7], dataout_tmp[7]);
   buf dataout_buf8(dataout[8], dataout_tmp[8]);
   buf dataout_buf9(dataout[9], dataout_tmp[9]);
   buf dataout_buf10(dataout[10], dataout_tmp[10]);
   buf dataout_buf11(dataout[11], dataout_tmp[11]);
   buf dataout_buf12(dataout[12], dataout_tmp[12]);
   buf dataout_buf13(dataout[13], dataout_tmp[13]);
   buf dataout_buf14(dataout[14], dataout_tmp[14]);
   buf dataout_buf15(dataout[15], dataout_tmp[15]);
   buf dataout_buf16(dataout[16], dataout_tmp[16]);
   buf dataout_buf17(dataout[17], dataout_tmp[17]);
   buf dataout_buf18(dataout[18], dataout_tmp[18]);
   buf dataout_buf19(dataout[19], dataout_tmp[19]);
   buf dataout_buf20(dataout[20], dataout_tmp[20]);
   buf dataout_buf21(dataout[21], dataout_tmp[21]);
   buf dataout_buf22(dataout[22], dataout_tmp[22]);
   buf dataout_buf23(dataout[23], dataout_tmp[23]);
   buf dataout_buf24(dataout[24], dataout_tmp[24]);
   buf dataout_buf25(dataout[25], dataout_tmp[25]);
   buf dataout_buf26(dataout[26], dataout_tmp[26]);
   buf dataout_buf27(dataout[27], dataout_tmp[27]);
   buf dataout_buf28(dataout[28], dataout_tmp[28]);
   buf dataout_buf29(dataout[29], dataout_tmp[29]);
   buf dataout_buf30(dataout[30], dataout_tmp[30]);
   buf dataout_buf31(dataout[31], dataout_tmp[31]);
   buf dataout_buf32(dataout[32], dataout_tmp[32]);
   buf dataout_buf33(dataout[33], dataout_tmp[33]);
   buf dataout_buf34(dataout[34], dataout_tmp[34]);
   buf dataout_buf35(dataout[35], dataout_tmp[35]);
endmodule