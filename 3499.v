module JTAG_Source1 (
	probe,
	source);
	input	[0:0]  probe;
	output	[0:0]  source;
	wire [0:0] sub_wire0;
	wire [0:0] source = sub_wire0[0:0];
	altsource_probe	altsource_probe_component (
				.probe (probe),
				.source (sub_wire0)
				// synopsys translate_off
				,
				.clrn (),
				.ena (),
				.ir_in (),
				.ir_out (),
				.jtag_state_cdr (),
				.jtag_state_cir (),
				.jtag_state_e1dr (),
				.jtag_state_sdr (),
				.jtag_state_tlr (),
				.jtag_state_udr (),
				.jtag_state_uir (),
				.raw_tck (),
				.source_clk (),
				.source_ena (),
				.tdi (),
				.tdo (),
				.usr1 ()
				// synopsys translate_on
				);
	defparam
		altsource_probe_component.enable_metastability = "NO",
		altsource_probe_component.instance_id = "NONE",
		altsource_probe_component.probe_width = 1,
		altsource_probe_component.sld_auto_instance_index = "YES",
		altsource_probe_component.sld_instance_index = 0,
		altsource_probe_component.source_initial_value = " 0",
		altsource_probe_component.source_width = 1;
endmodule