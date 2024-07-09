module
/*dram_pad_scan_jtag    AUTO_TEMPLATE(
                                           // Outputs
                                           .oe(bscan_oe),
                                           // Inputs
                                           .rcv_in(rx_out),
                                           .drv_oe(oe));
*/
bw_io_sstl_bscan	bw_io_sstl_bscan(/*AUTOINST*/
					   // Outputs
					   .to_core(to_core),
					   .data_out(data_out),
					   .oe(bscan_oe),	 // Templated
					   .bso(bso),
					   .odt_enable(odt_enable),
					   // Inputs
					   .bsi(bsi),
					   .mode_ctrl(mode_ctrl),
					   .clock_dr(clock_dr),
					   .shift_dr(shift_dr),
					   .update_dr(update_dr),
					   .hiz_l(hiz_n),
					   .rcv_in(rx_out),	 // Templated
					   .data_in(data_in),
					   .drv_oe(oe),		 // Templated
					   .odt_enable_mask(odt_enable_mask));
endmodule