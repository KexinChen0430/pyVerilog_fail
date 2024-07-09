module  max_mcell (pterm0, pterm1, pterm2, pterm3, pterm4, pterm5, pxor,
		   pexpin, clk, aclr, fpin, pclk, pena, paclr, papre,
		   dataout, pexpout);
   parameter operation_mode	= "normal";
   parameter output_mode 	= "comb";
   parameter register_mode = "dff";
   parameter pexp_mode = "off";
   parameter power_up    = "low";
   input [51:0] pterm0, pterm1, pterm2, pterm3, pterm4, pterm5;
   input [51:0] pxor, pclk, pena, paclr, papre;
   input 	pexpin, clk, aclr, fpin;
   output 	dataout, pexpout;
   wire 	fbk, dffin, combo, dffo;
   max_asynch_mcell pcom (pterm0, pterm1, pterm2, pterm3, pterm4,
			  pterm5, fpin, pxor, pexpin, fbk, combo,
			  pexpout, dffin);
   max_mcell_register preg (dffin, clk, aclr, pclk, pena, paclr,
			    papre, dffo, fbk);
   defparam
	pcom.operation_mode = operation_mode,
	pcom.pexp_mode = pexp_mode,
	pcom.register_mode = register_mode,
	preg.operation_mode = operation_mode,
	preg.power_up = power_up,
	preg.register_mode = register_mode;
assign dataout = (output_mode == "comb") ? combo : dffo;
endmodule