module jtagflash (
	noe_in);
	input	  noe_in;
	altserial_flash_loader	altserial_flash_loader_component (
				.noe (noe_in)
				// synopsys translate_off
				,
				.asmi_access_granted (),
				.asmi_access_request (),
				.data0out (),
				.data_in (),
				.data_oe (),
				.data_out (),
				.dclkin (),
				.scein (),
				.sdoin ()
				// synopsys translate_on
				);
	defparam
		altserial_flash_loader_component.enable_quad_spi_support = 0,
		altserial_flash_loader_component.enable_shared_access = "OFF",
		altserial_flash_loader_component.enhanced_mode = 1,
		altserial_flash_loader_component.intended_device_family = "Cyclone IV E";
endmodule