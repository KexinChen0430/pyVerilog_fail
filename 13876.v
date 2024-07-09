module altera_tse_rgmii_in4 (
	aclr,
	datain,
	inclock,
	dataout_h,
	dataout_l);
	input	  aclr;
	input	[3:0]  datain;
	input	  inclock;
	output	[3:0]  dataout_h;
	output	[3:0]  dataout_l;
	wire [3:0] sub_wire0;
	wire [3:0] sub_wire1;
	wire [3:0] dataout_h = sub_wire0[3:0];
	wire [3:0] dataout_l = sub_wire1[3:0];
	altddio_in	altddio_in_component (
				.datain (datain),
				.inclock (inclock),
				.aclr (aclr),
				.dataout_h (sub_wire0),
				.dataout_l (sub_wire1),
				.aset (1'b0),
				.inclocken (1'b1));
	defparam
		altddio_in_component.intended_device_family = "Stratix II",
		altddio_in_component.invert_input_clocks = "OFF",
		altddio_in_component.lpm_type = "altddio_in",
		altddio_in_component.width = 4;
endmodule