module outputs)
wire			to_pad;			// From ctl_edgelogic of dram_ctl_edgelogic.v
// End of automatics
// INSTANTIATING PAD LOGIC
dram_ctl_edgelogic ctl_edgelogic(/*AUTOINST*/
				 // Outputs
				 .ctl_pad_clk_so(ctl_pad_clk_so),
				 .to_pad(to_pad),
				 // Inputs
				 .clk	(clk),
				 .rst_l	(rst_l),
				 .testmode_l(testmode_l),
				 .ctl_pad_clk_se(ctl_pad_clk_se),
				 .ctl_pad_clk_si(ctl_pad_clk_si),
				 .data	(data));
// SSTL LOGIC
/*dram_sstl_pad AUTO_TEMPLATE(
                  .pad                  (pad),
                  .oe                  	(1'b1),
		  .to_core		(),
		  .odt_enable_mask	(1'b1),
                  .data_in              (to_pad));
*/
dram_sstl_pad sstl_pad(/*AUTOINST*/
		       // Outputs
		       .bso		(bso),
		       .to_core		(),			 // Templated
		       // Inouts
		       .pad		(pad),			 // Templated
		       // Inputs
		       .bsi		(bsi),
		       .cbd		(cbd[8:1]),
		       .cbu		(cbu[8:1]),
		       .clock_dr	(clock_dr),
		       .data_in		(to_pad),		 // Templated
		       .hiz_n		(hiz_n),
		       .mode_ctrl	(mode_ctrl),
		       .odt_enable_mask	(1'b1),			 // Templated
		       .oe		(1'b1),			 // Templated
		       .shift_dr	(shift_dr),
		       .update_dr	(update_dr),
		       .vdd_h		(vdd_h),
		       .vrefcode	(vrefcode[7:0]));
endmodule