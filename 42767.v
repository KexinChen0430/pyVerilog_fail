module MAC_3 (
	aclr0,
	clock0,
	dataa_0,
	dataa_1,
	dataa_2,
	datab_0,
	datab_1,
	datab_2,
	result);
	input	  aclr0;
	input	  clock0;
	input	[7:0]  dataa_0;
	input	[7:0]  dataa_1;
	input	[7:0]  dataa_2;
	input	[16:0]  datab_0;
	input	[16:0]  datab_1;
	input	[16:0]  datab_2;
	output	[26:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr0;
	tri1	  clock0;
	tri0	[7:0]  dataa_0;
	tri0	[7:0]  dataa_1;
	tri0	[7:0]  dataa_2;
	tri0	[16:0]  datab_0;
	tri0	[16:0]  datab_1;
	tri0	[16:0]  datab_2;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [26:0] sub_wire0;
	wire [16:0] sub_wire8 = datab_2[16:0];
	wire [16:0] sub_wire7 = datab_0[16:0];
	wire [7:0] sub_wire4 = dataa_2[7:0];
	wire [7:0] sub_wire3 = dataa_1[7:0];
	wire [26:0] result = sub_wire0[26:0];
	wire [7:0] sub_wire1 = dataa_0[7:0];
	wire [23:0] sub_wire2 = {sub_wire4, sub_wire3, sub_wire1};
	wire [16:0] sub_wire5 = datab_1[16:0];
	wire [50:0] sub_wire6 = {sub_wire8, sub_wire5, sub_wire7};
	altmult_add	ALTMULT_ADD_component (
				.dataa (sub_wire2),
				.datab (sub_wire6),
				.aclr0 (aclr0),
				.clock0 (clock0),
				.result (sub_wire0),
				.accum_sload (1'b0),
				.aclr1 (1'b0),
				.aclr2 (1'b0),
				.aclr3 (1'b0),
				.addnsub1 (1'b1),
				.addnsub1_round (1'b0),
				.addnsub3 (1'b1),
				.addnsub3_round (1'b0),
				.chainin (1'b0),
				.chainout_round (1'b0),
				.chainout_sat_overflow (),
				.chainout_saturate (1'b0),
				.clock1 (1'b1),
				.clock2 (1'b1),
				.clock3 (1'b1),
				.ena0 (1'b1),
				.ena1 (1'b1),
				.ena2 (1'b1),
				.ena3 (1'b1),
				.mult01_round (1'b0),
				.mult01_saturation (1'b0),
				.mult0_is_saturated (),
				.mult1_is_saturated (),
				.mult23_round (1'b0),
				.mult23_saturation (1'b0),
				.mult2_is_saturated (),
				.mult3_is_saturated (),
				.output_round (1'b0),
				.output_saturate (1'b0),
				.overflow (),
				.rotate (1'b0),
				.scanina ({8{1'b0}}),
				.scaninb ({17{1'b0}}),
				.scanouta (),
				.scanoutb (),
				.shift_right (1'b0),
				.signa (1'b0),
				.signb (1'b0),
				.sourcea ({3{1'b0}}),
				.sourceb ({3{1'b0}}),
				.zero_chainout (1'b0),
				.zero_loopback (1'b0));
	defparam
		ALTMULT_ADD_component.addnsub_multiplier_aclr1 = "ACLR0",
		ALTMULT_ADD_component.addnsub_multiplier_pipeline_aclr1 = "ACLR0",
		ALTMULT_ADD_component.addnsub_multiplier_pipeline_register1 = "CLOCK0",
		ALTMULT_ADD_component.addnsub_multiplier_register1 = "CLOCK0",
		ALTMULT_ADD_component.dedicated_multiplier_circuitry = "AUTO",
		ALTMULT_ADD_component.input_aclr_a0 = "ACLR0",
		ALTMULT_ADD_component.input_aclr_a1 = "ACLR0",
		ALTMULT_ADD_component.input_aclr_a2 = "ACLR0",
		ALTMULT_ADD_component.input_aclr_b0 = "ACLR0",
		ALTMULT_ADD_component.input_aclr_b1 = "ACLR0",
		ALTMULT_ADD_component.input_aclr_b2 = "ACLR0",
		ALTMULT_ADD_component.input_register_a0 = "CLOCK0",
		ALTMULT_ADD_component.input_register_a1 = "CLOCK0",
		ALTMULT_ADD_component.input_register_a2 = "CLOCK0",
		ALTMULT_ADD_component.input_register_b0 = "CLOCK0",
		ALTMULT_ADD_component.input_register_b1 = "CLOCK0",
		ALTMULT_ADD_component.input_register_b2 = "CLOCK0",
		ALTMULT_ADD_component.input_source_a0 = "DATAA",
		ALTMULT_ADD_component.input_source_a1 = "DATAA",
		ALTMULT_ADD_component.input_source_a2 = "DATAA",
		ALTMULT_ADD_component.input_source_b0 = "DATAB",
		ALTMULT_ADD_component.input_source_b1 = "DATAB",
		ALTMULT_ADD_component.input_source_b2 = "DATAB",
		ALTMULT_ADD_component.intended_device_family = "Cyclone IV E",
		ALTMULT_ADD_component.lpm_type = "altmult_add",
		ALTMULT_ADD_component.multiplier1_direction = "ADD",
		ALTMULT_ADD_component.multiplier_aclr0 = "ACLR0",
		ALTMULT_ADD_component.multiplier_aclr1 = "ACLR0",
		ALTMULT_ADD_component.multiplier_aclr2 = "ACLR0",
		ALTMULT_ADD_component.multiplier_register0 = "CLOCK0",
		ALTMULT_ADD_component.multiplier_register1 = "CLOCK0",
		ALTMULT_ADD_component.multiplier_register2 = "CLOCK0",
		ALTMULT_ADD_component.number_of_multipliers = 3,
		ALTMULT_ADD_component.output_aclr = "ACLR0",
		ALTMULT_ADD_component.output_register = "CLOCK0",
		ALTMULT_ADD_component.port_addnsub1 = "PORT_UNUSED",
		ALTMULT_ADD_component.port_signa = "PORT_UNUSED",
		ALTMULT_ADD_component.port_signb = "PORT_UNUSED",
		ALTMULT_ADD_component.representation_a = "UNSIGNED",
		ALTMULT_ADD_component.representation_b = "SIGNED",
		ALTMULT_ADD_component.signed_aclr_a = "ACLR0",
		ALTMULT_ADD_component.signed_aclr_b = "ACLR0",
		ALTMULT_ADD_component.signed_pipeline_aclr_a = "ACLR0",
		ALTMULT_ADD_component.signed_pipeline_aclr_b = "ACLR0",
		ALTMULT_ADD_component.signed_pipeline_register_a = "CLOCK0",
		ALTMULT_ADD_component.signed_pipeline_register_b = "CLOCK0",
		ALTMULT_ADD_component.signed_register_a = "CLOCK0",
		ALTMULT_ADD_component.signed_register_b = "CLOCK0",
		ALTMULT_ADD_component.width_a = 8,
		ALTMULT_ADD_component.width_b = 17,
		ALTMULT_ADD_component.width_result = 27;
endmodule