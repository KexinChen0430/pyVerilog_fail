module hps_reset (
	probe,
	source_clk,
	source);
	input	  probe;
	input	  source_clk;
	output	[2:0]  source;
	wire [2:0] sub_wire0;
	wire [2:0] source = sub_wire0[2:0];
	altsource_probe	altsource_probe_component (
				.probe (probe),
				.source_clk (source_clk),
				.source (sub_wire0)
				// synopsys translate_off
				,
				.clr (),
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
				.source_ena (),
				.tdi (),
				.tdo (),
				.usr1 ()
				// synopsys translate_on
				);
	defparam
		altsource_probe_component.enable_metastability = "YES",
		altsource_probe_component.instance_id = "RST",
		altsource_probe_component.probe_width = 0,
		altsource_probe_component.sld_auto_instance_index = "YES",
		altsource_probe_component.sld_instance_index = 0,
		altsource_probe_component.source_initial_value = " 0",
		altsource_probe_component.source_width = 3;
endmodule