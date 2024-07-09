module altera_tse_rgmii_in1 (
	aclr,
	datain,
	inclock,
	dataout_h,
	dataout_l);
	input	  aclr;
	input	  datain;
	input	  inclock;
	output	  dataout_h;
	output	  dataout_l;
	wire [0:0] sub_wire0;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  dataout_h = sub_wire1;
	wire [0:0] sub_wire3 = sub_wire2[0:0];
	wire  dataout_l = sub_wire3;
	wire  sub_wire4 = datain;
	wire  sub_wire5 = sub_wire4;
	altddio_in	altddio_in_component (
				.datain (sub_wire5),
				.inclock (inclock),
				.aclr (aclr),
				.dataout_h (sub_wire0),
				.dataout_l (sub_wire2),
				.aset (1'b0),
				.inclocken (1'b1));
	defparam
		altddio_in_component.intended_device_family = "Stratix II",
		altddio_in_component.invert_input_clocks = "OFF",
		altddio_in_component.lpm_type = "altddio_in",
		altddio_in_component.width = 1;
endmodule