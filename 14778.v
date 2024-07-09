module stratix_mac_mult
  (
   dataa,
   datab,
   signa,
   signb,
   clk,
   aclr,
   ena,
   dataout,
   scanouta,
   scanoutb,
   devclrn,
   devpor
   );
   parameter dataa_width        = 18;
   parameter datab_width        = 18;
   parameter dataa_clock	= "none";
   parameter datab_clock	= "none";
   parameter signa_clock	= "none";
   parameter signb_clock	= "none";
   parameter output_clock	= "none";
   parameter dataa_clear	= "none";
   parameter datab_clear	= "none";
   parameter signa_clear	= "none";
   parameter signb_clear	= "none";
   parameter output_clear	= "none";
   parameter signa_internally_grounded = "false";
   parameter signb_internally_grounded = "false";
   parameter lpm_hint           = "true";
   parameter lpm_type           = "stratix_mac_mult";
// SIMULATION_ONLY_PARAMETERS_BEGIN
   parameter dataout_width      = dataa_width + datab_width;
// SIMULATION_ONLY_PARAMETERS_END
   input [dataa_width-1:0] dataa;
   input [datab_width-1:0] datab;
   input 	signa;
   input 	signb;
   input [3:0] 	clk;
   input [3:0] 	aclr;
   input [3:0] 	ena;
   input 	devclrn;
   input 	devpor;
   output [dataout_width-1:0] dataout;
   output [dataa_width-1:0] scanouta;
   output [datab_width-1:0] scanoutb;
   tri1 devclrn;
   tri1 devpor;
   wire [35:0] 	 mult_output;
   wire [71:0] 	 signa_out;
   wire [71:0] 	 signb_out;
   wire [71:0] 	 dataout_tmp;
   wire [71:0] 	 scanouta_tmp;
   wire [71:0] 	 scanoutb_tmp;
   assign dataout = dataout_tmp[35:0];
   stratix_mac_register	dataa_mac_reg
      (
       .data ({{(72-dataa_width){1'b0}},dataa}),
       .clk (clk[select_the(dataa_clock)]),
       .aclr (aclr[select_the(dataa_clear)] || ~devclrn || ~devpor),
       .if_aclr ((dataa_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(dataa_clock)]),
       .dataout (scanouta_tmp),
       .async ((dataa_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam  dataa_mac_reg.data_width = dataa_width;
   defparam  dataa_mac_reg.power_up = 1'b0;
   stratix_mac_register	datab_mac_reg
      (
       .data ({{(72-datab_width){1'b0}},datab}),
       .clk (clk[select_the(datab_clock)]),
       .aclr (aclr[select_the(datab_clear)] || ~devclrn || ~devpor),
       .if_aclr ((datab_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(datab_clock)]),
       .dataout (scanoutb_tmp),
       .async ((datab_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam  datab_mac_reg.data_width = datab_width;
   defparam  datab_mac_reg.power_up = 1'b0;
   stratix_mac_register	signa_mac_reg
      (
       .data ({{(71){1'b0}},signa}),
       .clk (clk[select_the(signa_clock)]),
       .aclr (aclr[select_the(signa_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signa_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(signa_clock)]),
       .dataout (signa_out),
       .async ((signa_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam  signa_mac_reg.data_width = 1;
   defparam  signa_mac_reg.power_up = 1'b0;
   stratix_mac_register	signb_mac_reg
      (
       .data ({{(71){1'b0}},signb}),
       .clk (clk[select_the(signb_clock)]),
       .aclr (aclr[select_the(signb_clear)] || ~devclrn || ~devpor),
       .if_aclr ((signb_clear != "none") ? 1'b1 : 1'b0 ),
       .ena (ena[select_the(signb_clock)]),
       .dataout (signb_out),
       .async ((signb_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam  signb_mac_reg.data_width = 1;
   defparam  signb_mac_reg.power_up = 1'b0;
   stratix_mac_mult_internal mac_multiply
      (
       .dataa (scanouta_tmp[dataa_width-1:0]),
       .datab (scanoutb_tmp[datab_width-1:0]),
       .signa ((signa_internally_grounded == "false") ? signa_out[0] : 1'b0),
       .signb ((signb_internally_grounded == "false") ? signb_out[0] : 1'b0),
       .scanouta(scanouta),
       .scanoutb(scanoutb),
       .dataout(mult_output)
       );
   defparam  mac_multiply.dataa_width  = dataa_width;
   defparam  mac_multiply.datab_width  = datab_width;
   defparam  mac_multiply.dataout_width = (dataa_width+datab_width);
   stratix_mac_register	dataout_mac_reg
      (
       .data ({{(36){1'b0}},mult_output}),
       .clk (clk[select_the(output_clock)]),
       .aclr (aclr[select_the(output_clear)] || ~devclrn || ~devpor),
       .if_aclr ((output_clear != "none") ? 1'b1 : 1'b0),
       .ena (ena[select_the(output_clock)]),
       .dataout (dataout_tmp),
       .async ((output_clock == "none") ? 1'b1 : 1'b0 )
       );
   defparam  dataout_mac_reg.data_width = (dataa_width+datab_width);
   defparam  dataout_mac_reg.power_up = 1'b0;
//                                 SELECT_THE
   function integer select_the;
      input [8*4:1] string_name;
      begin
	 if (string_name == "0")
	    select_the = 0;
	 else if (string_name == "1")
	    select_the = 1;
	      else if (string_name == "2")
		 select_the = 2;
		   else if (string_name == "3")
		      select_the = 3;
			else if (string_name == "none")
			   select_the = 0;
      end
   endfunction
endmodule