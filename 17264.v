module outputs)
wire			oe;			// From dqs_edgelogic of dram_dqs_edgelogic.v
wire			to_core;		// From sstl_pad of dram_sstl_pad.v
wire			to_pad;			// From dqs_edgelogic of dram_dqs_edgelogic.v
// End of automatics
// CODE
// INSTANTIATING PAD LOGIC
dram_dqs_edgelogic dqs_edgelogic(/*AUTOINST*/
				 // Outputs
				 .clk_sel(clk_sel),
				 .dqs_pad_clk_so(dqs_pad_clk_so),
				 .to_pad(to_pad),
				 .oe	(oe),
				 // Inputs
				 .clk	(clk),
				 .testmode_l(testmode_l),
				 .dqs_pad_clk_se(dqs_pad_clk_se),
				 .dqs_pad_clk_si(dqs_pad_clk_si),
				 .dram_io_drive_enable(dram_io_drive_enable),
				 .dram_io_drive_data(dram_io_drive_data),
				 .dram_io_channel_disabled(dram_io_channel_disabled),
				 .to_core(to_core));
// SSTL LOGIC
/*dram_sstl_pad AUTO_TEMPLATE(
                  .pad                  (pad),
                  .oe                   (oe),
                  .data_in              (to_pad));
*/
dram_sstl_pad sstl_pad(/*AUTOINST*/
		       // Outputs
		       .bso		(bso),
		       .to_core		(to_core),
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
		       .odt_enable_mask	(odt_enable_mask),
		       .oe		(oe),			 // Templated
		       .shift_dr	(shift_dr),
		       .update_dr	(update_dr),
		       .vdd_h		(vdd_h),
		       .vrefcode	(vrefcode[7:0]));
endmodule