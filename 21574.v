module ddr3_s4_uniphy_example_sim_ddr3_s4_uniphy_example_sim_e0_if0_p0_iss_probe (
	probe_input
);
parameter WIDTH = 1;
parameter ID_NAME = "PROB";
input [WIDTH-1:0] probe_input;
altsource_probe	iss_probe_inst (
				.probe (probe_input),
				.source ()
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
		iss_probe_inst.enable_metastability = "NO",
		iss_probe_inst.instance_id = ID_NAME,
		iss_probe_inst.probe_width = WIDTH,
		iss_probe_inst.sld_auto_instance_index = "YES",
		iss_probe_inst.sld_instance_index = 0,
		iss_probe_inst.source_initial_value = "0",
		iss_probe_inst.source_width = 0;
endmodule