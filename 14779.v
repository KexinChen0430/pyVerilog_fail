module stratix_mac_out_internal (dataa, datab, datac, datad, signx, signy,
				 addnsub0, addnsub1, zeroacc, dataout_global,
				 dataout, accoverflow);
   `define ADD 1'b1
   `define SUB 1'b0
   parameter operation_mode = "output_only";
   parameter dataa_width = 36;
   parameter datab_width = 36;
   parameter datac_width = 36;
   parameter datad_width = 36;
   parameter dataout_width = 72;
   input [36:0] dataa;
   input [36:0] datab;
   input [36:0] datac;
   input [36:0] datad;
   input 		   signx;
   input 		   signy;
   input 		   addnsub0;
   input 		   addnsub1;
   input 		   zeroacc;
   input [71:0] 	   dataout_global;
   output [71:0] 	   dataout;
   output 		   accoverflow;
   reg [72:0] 		   dataout_tmp;
   reg 			   accoverflow_tmp;
   reg [72:0] 		   last_dataout;
   reg [71:0] 		   dataa_u;
   reg [71:0] 		   datab_u;
   reg [71:0] 		   datab_s;
   reg [71:0] 		   datac_u;
   reg [71:0] 		   datac_s;
   reg [71:0] 		   datad_u;
   reg [71:0] 		   datad_s;
   reg [72:0] 		   data_tmp;
   wire [71:0] 		   dataout_tbuf;
   wire 		   accoverflow_tbuf;
   specify
      (dataa *> dataout) = (0,0);
      (datab *> dataout) = (0,0);
      (datac *> dataout) = (0,0);
      (datad *> dataout) = (0,0);
      (signx *> dataout) = (0,0);
      (signy *> dataout) = (0,0);
      (addnsub0 *> dataout) = (0,0);
      (addnsub1 *> dataout) = (0,0);
      (zeroacc *> dataout)  = (0,0);
      (dataa *> accoverflow) = (0,0);
      (signx *> accoverflow) = (0,0);
      (signy *> accoverflow) = (0,0);
      (addnsub0 *> accoverflow) = (0,0);
      (addnsub1 *> accoverflow) = (0,0);
      (zeroacc *> accoverflow)  = (0,0);
   endspecify
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
   buf accoverflow_buf(accoverflow, accoverflow_tbuf);
   assign dataout_tbuf[71:0] = dataout_tmp[71:0];
   assign accoverflow_tbuf = accoverflow_tmp;
   always @(dataa or datab or datac or datad or dataout_global
	    or signx or signy or addnsub0 or addnsub1
	    or zeroacc or operation_mode)
      begin
	 case (operation_mode)
	   "output_only": // dataout_tmp = dataa
	      begin
		 dataout_tmp = dataa;
	      end
	   "accumulator": // dataout_tmp += dataa
	      begin
		 if (signx || signy) begin
		     data_tmp     = {{73 - dataa_width{dataa[dataa_width-1]}},
		                                       dataa[dataa_width-1:0]};
 	             last_dataout = {{73-dataout_width{dataout_global[dataout_width-1]}},
                                                       dataout_global[dataout_width-1:0]};
                 end else begin
		     data_tmp     = {{73 - dataa_width{1'b0}},
                                                       dataa[dataa_width-1:0]};
 	             last_dataout = {{73-dataout_width{1'b0}},
                                                       dataout_global[dataout_width-1:0]};
                 end
		 if (zeroacc) begin
 		   if (`ADD == addnsub0)
 		     dataout_tmp[dataout_width:0] = data_tmp;
		   else
		     dataout_tmp[dataout_width:0] = - data_tmp;
		 end else begin
 		   if (`ADD == addnsub0)
 		     dataout_tmp[dataout_width:0] = last_dataout + data_tmp;
		   else
		     dataout_tmp[dataout_width:0] = last_dataout - data_tmp;
                 end
	         if (signx || signy)
		     accoverflow_tmp = dataout_tmp[dataout_width] ^ dataout_tmp[dataout_width-1];
		 else
		     accoverflow_tmp = dataout_tmp[dataout_width];
	      end
	   "one_level_adder": // dataout_tmp = dataa +/- datab
	      begin
		 if(addnsub0)
		   dataout_tmp[dataout_width-1:0] =
		    add_or_sub(signx || signy, dataa[35:0], signx || signy, datab[35:0], addnsub0);
		 else
		   dataout_tmp[dataout_width-1:0] =
		    add_or_sub(signx || signy , dataa[35:0], signx || signy, datab[35:0], 1'b0);
	      end
	   "two_level_adder": // dataout_tmp = (dataa +/- datab) + (datac +/- datad)
	      // DEFAULT TO ADD (say if the addnsub0,1 signal is set to GROUND)
	      begin // dataout_width = dataa_width + 2;
		 dataout_tmp[dataout_width-1:0] =
			add_or_sub(signx || signy, dataa[35:0], signx || signy, datab[35:0], addnsub0) +
			add_or_sub(signx || signy, datac[35:0], signx || signy, datad[35:0], addnsub1);
	      end
	   "36_bit_multiply":
	      begin
		 dataa_u = dataa[35:0];
		 datab_u = datab[35:0];
		 datab_s = {{(72-36){datab[35]}}, datab[35:0]};
		 datac_u = datac[35:0];
		 datac_s = {{(72-36){datac[35]}}, datac[35:0]};
		 datad_u = datad[35:0];
		 datad_s = {{(72-36){datad[35]}}, datad[35:0]};
		 if(signx == 1'b0 && signy == 1'b0)
		    begin
		       dataout_tmp = (datab_u << 36) + (datac_u << 18) +
			   (datad_u << 18) + dataa_u;
		    end // if (signx == 1'b0 && signy == 1'b0)
		 else if(signx == 1'b0 && signy == 1'b1)
		    begin
		       dataout_tmp = (datab_s << 36) + (datac_u << 18) +
				(datad_s << 18) + dataa_u;
		    end // if (signx == 1'b0 && signy == 1'b1)
		 else if(signx == 1'b1 && signy == 1'b0)
		    begin
		       dataout_tmp = (datab_s << 36) + (datac_s << 18) +
				(datad_u << 18) + dataa_u;
		    end // if (signx == 1'b1 && signy == 1'b0)
		 else if(signx == 1'b1 && signy == 1'b1)
		    begin
		       dataout_tmp = (datab_s << 36) + (datac_s << 18) +
				(datad_s << 18) + dataa_u;
		    end // if (signx == 1'b1 && signy == 1'b1)
	      end
	   default :
	      begin
		 $display ("INFO: Default operation not specified\n");
		 $display ("Time: %0t  Instance: %m", $time);
	      end
	 endcase
      end
//                                 ADD_OR_SUB
   function [52:0] add_or_sub;
      input sign_a;
      input [dataa_width-1:0] data_a;
      input 		      sign_b;
      input [datab_width-1:0] data_b;
      input 		      operation;
      reg 		      sa;
      reg 		      sb;
      reg [dataa_width-1:0]   abs_a;
      reg [datab_width-1:0]   abs_b;
      begin
	 sa    = ( sign_a && data_a[dataa_width-1] );
	 sb    = ( sign_b && data_b[datab_width-1] );
	 abs_a = ( sign_a && data_a[dataa_width-1] ) ? (~data_a + 1) : data_a;
	 abs_b = ( sign_b && data_b[datab_width-1] ) ? (~data_b + 1) : data_b;
	 if (operation == `ADD)
	    begin
	       add_or_sub = (sa ? -abs_a : abs_a) + (sb ? -abs_b : abs_b);
	    end
	 else if (operation == `SUB)
	    begin
	       add_or_sub = (sa ? -abs_a : abs_a) - (sb ? -abs_b : abs_b);
	    end
	      else
	      begin
		  $display ("INFO: Default operation not specified\n");
		  $display ("Time: %0t  Instance: %m", $time);
		  end
      end
   endfunction // add_or_sub
endmodule