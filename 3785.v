module altera_tse_rgmii_out4 (
	aclr,
	datain_h,
	datain_l,
	outclock,
	dataout);
	input	  aclr;
	input	[3:0]  datain_h;
	input	[3:0]  datain_l;
	input	  outclock;
	output	[3:0]  dataout;
	wire [3:0] sub_wire0;
	wire [3:0] dataout = sub_wire0[3:0];
	altddio_out	altddio_out_component (
				.outclock (outclock),
				.datain_h (datain_h),
				.aclr (aclr),
				.datain_l (datain_l),
				.dataout (sub_wire0),
				.aset (1'b0),
				.oe (1'b1),
				.outclocken (1'b1));
	defparam
		altddio_out_component.extend_oe_disable = "UNUSED",
		altddio_out_component.intended_device_family = "Stratix II",
		altddio_out_component.lpm_type = "altddio_out",
		altddio_out_component.oe_reg = "UNUSED",
		altddio_out_component.width = 4;
endmodule