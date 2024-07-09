module stratix_mac_register
  (
   data,
   clk,
   aclr,
   if_aclr,
   ena,
   async,
   dataout
   );
   parameter data_width = 72;
   parameter power_up = 1'b0;
   input [71:0] data;
   input 	clk;
   input 	aclr;
   input 	ena;
   input 	async;
   input 	if_aclr;
   output [71:0] dataout;
   wire [71:0] 	 data_ipd;
   wire 	 clk_ipd;
   wire 	 aclr_ipd;
   wire 	 ena_ipd;
   wire 	 reset;
   wire [71:0] 	 dataout_tbuf;
   wire [71:0] 	 dataout_tmp;
   reg [71:0] 	 dataout_reg;
   reg [71:0] 	 dataout_reg_c;
   reg 		 viol_notifier; // USED FOR DELAY
   assign dataout_tbuf = dataout_tmp;
   assign reset = (!aclr_ipd) && (ena_ipd);
   buf data_buf0(data_ipd[0], data[0]);
   buf data_buf1(data_ipd[1], data[1]);
   buf data_buf2(data_ipd[2], data[2]);
   buf data_buf3(data_ipd[3], data[3]);
   buf data_buf4(data_ipd[4], data[4]);
   buf data_buf5(data_ipd[5], data[5]);
   buf data_buf6(data_ipd[6], data[6]);
   buf data_buf7(data_ipd[7], data[7]);
   buf data_buf8(data_ipd[8], data[8]);
   buf data_buf9(data_ipd[9], data[9]);
   buf data_buf10(data_ipd[10], data[10]);
   buf data_buf11(data_ipd[11], data[11]);
   buf data_buf12(data_ipd[12], data[12]);
   buf data_buf13(data_ipd[13], data[13]);
   buf data_buf14(data_ipd[14], data[14]);
   buf data_buf15(data_ipd[15], data[15]);
   buf data_buf16(data_ipd[16], data[16]);
   buf data_buf17(data_ipd[17], data[17]);
   buf data_buf18(data_ipd[18], data[18]);
   buf data_buf19(data_ipd[19], data[19]);
   buf data_buf20(data_ipd[20], data[20]);
   buf data_buf21(data_ipd[21], data[21]);
   buf data_buf22(data_ipd[22], data[22]);
   buf data_buf23(data_ipd[23], data[23]);
   buf data_buf24(data_ipd[24], data[24]);
   buf data_buf25(data_ipd[25], data[25]);
   buf data_buf26(data_ipd[26], data[26]);
   buf data_buf27(data_ipd[27], data[27]);
   buf data_buf28(data_ipd[28], data[28]);
   buf data_buf29(data_ipd[29], data[29]);
   buf data_buf30(data_ipd[30], data[30]);
   buf data_buf31(data_ipd[31], data[31]);
   buf data_buf32(data_ipd[32], data[32]);
   buf data_buf33(data_ipd[33], data[33]);
   buf data_buf34(data_ipd[34], data[34]);
   buf data_buf35(data_ipd[35], data[35]);
   buf data_buf36(data_ipd[36], data[36]);
   buf data_buf37(data_ipd[37], data[37]);
   buf data_buf38(data_ipd[38], data[38]);
   buf data_buf39(data_ipd[39], data[39]);
   buf data_buf40(data_ipd[40], data[40]);
   buf data_buf41(data_ipd[41], data[41]);
   buf data_buf42(data_ipd[42], data[42]);
   buf data_buf43(data_ipd[43], data[43]);
   buf data_buf44(data_ipd[44], data[44]);
   buf data_buf45(data_ipd[45], data[45]);
   buf data_buf46(data_ipd[46], data[46]);
   buf data_buf47(data_ipd[47], data[47]);
   buf data_buf48(data_ipd[48], data[48]);
   buf data_buf49(data_ipd[49], data[49]);
   buf data_buf50(data_ipd[50], data[50]);
   buf data_buf51(data_ipd[51], data[51]);
   buf data_buf52(data_ipd[52], data[52]);
   buf data_buf53(data_ipd[53], data[53]);
   buf data_buf54(data_ipd[54], data[54]);
   buf data_buf55(data_ipd[55], data[55]);
   buf data_buf56(data_ipd[56], data[56]);
   buf data_buf57(data_ipd[57], data[57]);
   buf data_buf58(data_ipd[58], data[58]);
   buf data_buf59(data_ipd[59], data[59]);
   buf data_buf60(data_ipd[60], data[60]);
   buf data_buf61(data_ipd[61], data[61]);
   buf data_buf62(data_ipd[62], data[62]);
   buf data_buf63(data_ipd[63], data[63]);
   buf data_buf64(data_ipd[64], data[64]);
   buf data_buf65(data_ipd[65], data[65]);
   buf data_buf66(data_ipd[66], data[66]);
   buf data_buf67(data_ipd[67], data[67]);
   buf data_buf68(data_ipd[68], data[68]);
   buf data_buf69(data_ipd[69], data[69]);
   buf data_buf70(data_ipd[70], data[70]);
   buf data_buf71(data_ipd[71], data[71]);
   buf dataout_buf0(dataout[0], dataout_tbuf[0]);
   buf dataout_buf1(dataout[1], dataout_tbuf[1]);
   buf dataout_buf2(dataout[2], dataout_tbuf[2]);
   buf dataout_buf3(dataout[3], dataout_tbuf[3]);
   buf dataout_buf4(dataout[4], dataout_tbuf[4]);
   buf dataout_buf5(dataout[5], dataout_tbuf[5]);
   buf dataout_buf6(dataout[6], dataout_tbuf[6]);
   buf dataout_buf7(dataout[7], dataout_tbuf[7]);
   buf dataout_buf8(dataout[8], dataout_tbuf[8]);
   buf dataout_buf9(dataout[9], dataout_tbuf[9]);
   buf dataout_buf10(dataout[10], dataout_tbuf[10]);
   buf dataout_buf11(dataout[11], dataout_tbuf[11]);
   buf dataout_buf12(dataout[12], dataout_tbuf[12]);
   buf dataout_buf13(dataout[13], dataout_tbuf[13]);
   buf dataout_buf14(dataout[14], dataout_tbuf[14]);
   buf dataout_buf15(dataout[15], dataout_tbuf[15]);
   buf dataout_buf16(dataout[16], dataout_tbuf[16]);
   buf dataout_buf17(dataout[17], dataout_tbuf[17]);
   buf dataout_buf18(dataout[18], dataout_tbuf[18]);
   buf dataout_buf19(dataout[19], dataout_tbuf[19]);
   buf dataout_buf20(dataout[20], dataout_tbuf[20]);
   buf dataout_buf21(dataout[21], dataout_tbuf[21]);
   buf dataout_buf22(dataout[22], dataout_tbuf[22]);
   buf dataout_buf23(dataout[23], dataout_tbuf[23]);
   buf dataout_buf24(dataout[24], dataout_tbuf[24]);
   buf dataout_buf25(dataout[25], dataout_tbuf[25]);
   buf dataout_buf26(dataout[26], dataout_tbuf[26]);
   buf dataout_buf27(dataout[27], dataout_tbuf[27]);
   buf dataout_buf28(dataout[28], dataout_tbuf[28]);
   buf dataout_buf29(dataout[29], dataout_tbuf[29]);
   buf dataout_buf30(dataout[30], dataout_tbuf[30]);
   buf dataout_buf31(dataout[31], dataout_tbuf[31]);
   buf dataout_buf32(dataout[32], dataout_tbuf[32]);
   buf dataout_buf33(dataout[33], dataout_tbuf[33]);
   buf dataout_buf34(dataout[34], dataout_tbuf[34]);
   buf dataout_buf35(dataout[35], dataout_tbuf[35]);
   buf dataout_buf36(dataout[36], dataout_tbuf[36]);
   buf dataout_buf37(dataout[37], dataout_tbuf[37]);
   buf dataout_buf38(dataout[38], dataout_tbuf[38]);
   buf dataout_buf39(dataout[39], dataout_tbuf[39]);
   buf dataout_buf40(dataout[40], dataout_tbuf[40]);
   buf dataout_buf41(dataout[41], dataout_tbuf[41]);
   buf dataout_buf42(dataout[42], dataout_tbuf[42]);
   buf dataout_buf43(dataout[43], dataout_tbuf[43]);
   buf dataout_buf44(dataout[44], dataout_tbuf[44]);
   buf dataout_buf45(dataout[45], dataout_tbuf[45]);
   buf dataout_buf46(dataout[46], dataout_tbuf[46]);
   buf dataout_buf47(dataout[47], dataout_tbuf[47]);
   buf dataout_buf48(dataout[48], dataout_tbuf[48]);
   buf dataout_buf49(dataout[49], dataout_tbuf[49]);
   buf dataout_buf50(dataout[50], dataout_tbuf[50]);
   buf dataout_buf51(dataout[51], dataout_tbuf[51]);
   buf dataout_buf52(dataout[52], dataout_tbuf[52]);
   buf dataout_buf53(dataout[53], dataout_tbuf[53]);
   buf dataout_buf54(dataout[54], dataout_tbuf[54]);
   buf dataout_buf55(dataout[55], dataout_tbuf[55]);
   buf dataout_buf56(dataout[56], dataout_tbuf[56]);
   buf dataout_buf57(dataout[57], dataout_tbuf[57]);
   buf dataout_buf58(dataout[58], dataout_tbuf[58]);
   buf dataout_buf59(dataout[59], dataout_tbuf[59]);
   buf dataout_buf60(dataout[60], dataout_tbuf[60]);
   buf dataout_buf61(dataout[61], dataout_tbuf[61]);
   buf dataout_buf62(dataout[62], dataout_tbuf[62]);
   buf dataout_buf63(dataout[63], dataout_tbuf[63]);
   buf dataout_buf64(dataout[64], dataout_tbuf[64]);
   buf dataout_buf65(dataout[65], dataout_tbuf[65]);
   buf dataout_buf66(dataout[66], dataout_tbuf[66]);
   buf dataout_buf67(dataout[67], dataout_tbuf[67]);
   buf dataout_buf68(dataout[68], dataout_tbuf[68]);
   buf dataout_buf69(dataout[69], dataout_tbuf[69]);
   buf dataout_buf70(dataout[70], dataout_tbuf[70]);
   buf dataout_buf71(dataout[71], dataout_tbuf[71]);
   buf (clk_ipd, clk);
   buf (aclr_ipd, aclr);
   buf (ena_ipd, ena);
   initial
     begin
	if(power_up)
	  begin
	     dataout_reg <= ~(71'b0);
	     dataout_reg_c <= ~(71'b0);
	  end
	else
	  begin
	     dataout_reg <= 'b0;
	     dataout_reg_c <= 'b0;
	  end
     end
   specify
      specparam TSU = 0;        // Set up time
      specparam TH  = 0;        // Hold time
      specparam TCO = 0;        // Clock to Output time
      specparam TCLR = 0;       // Clear time
      specparam TCLR_MIN_PW = 0;// Minimum pulse width of clear
      specparam TPRE = 0; 	// Preset time
      specparam TPRE_MIN_PW = 0;// Minimum pulse width of preset
      specparam TCLK_MIN_PW = 0;// Minimum pulse width of clock
      specparam TCE_MIN_PW = 0; // Minimum pulse width of clock enable
      specparam TCLKL = 0; 	// Minimum clock low time
      specparam TCLKH = 0; 	// Minimum clock high time
      $setup  (data, posedge clk &&& reset, 0, viol_notifier);
      $hold   (posedge clk &&& reset, data, 0, viol_notifier);
      $setup  (ena, posedge clk &&& reset, 0, viol_notifier );
      $hold   (posedge clk &&& reset, ena, 0, viol_notifier );
      (posedge aclr => (dataout  +: 'b0)) = (0,0);
      (posedge clk  => (dataout  +: dataout_tmp)) = (0,0);
   endspecify
   // ACLR
   always @(posedge clk_ipd or posedge aclr_ipd)
     begin
	if (aclr_ipd == 1'b1)
	  dataout_reg_c <= 'b0;
	else if (ena_ipd == 1'b1)
	  dataout_reg_c <= data_ipd;
	else
	  dataout_reg_c <= dataout_reg_c;
     end
   // !ACLR
   always @(posedge clk_ipd)
     begin
	if (ena_ipd == 1'b1)
	  dataout_reg <= data_ipd;
	else
	  dataout_reg <= dataout_reg;
     end
   assign dataout_tmp = (async ? data_ipd : (if_aclr ? dataout_reg_c : dataout_reg));
endmodule