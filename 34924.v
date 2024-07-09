module virtual_wire # (
	parameter INPUT_WIDTH = 1,
	parameter OUTPUT_WIDTH = 1,
	parameter INITIAL_VALUE = " 0",
	parameter INSTANCE_ID = "NONE"
) (
	input clk,
	input [INPUT_WIDTH-1:0] rx_input,
	output [OUTPUT_WIDTH-1:0] tx_output
);
	altsource_probe	altsource_probe_component (
				.probe (rx_input),
				.source (tx_output),
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
				.source_clk (clk),
				.source_ena (1'b1),
				.tdi (),
				.tdo (),
				.usr1 ()
				);
	defparam
		altsource_probe_component.enable_metastability = "YES",
		altsource_probe_component.instance_id = INSTANCE_ID,
		altsource_probe_component.probe_width = INPUT_WIDTH,
		altsource_probe_component.sld_auto_instance_index = "YES",
		altsource_probe_component.sld_instance_index = 0,
		altsource_probe_component.source_initial_value = INITIAL_VALUE,
		altsource_probe_component.source_width = OUTPUT_WIDTH;
endmodule