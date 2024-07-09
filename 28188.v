module vji (
	ir_out,
	tdo,
	ir_in,
	tck,
	tdi,
	virtual_state_cdr,
	virtual_state_cir,
	virtual_state_e1dr,
	virtual_state_e2dr,
	virtual_state_pdr,
	virtual_state_sdr,
	virtual_state_udr,
	virtual_state_uir);
	input	[1:0]  ir_out;
	input	  tdo;
	output	[1:0]  ir_in;
	output	  tck;
	output	  tdi;
	output	  virtual_state_cdr;
	output	  virtual_state_cir;
	output	  virtual_state_e1dr;
	output	  virtual_state_e2dr;
	output	  virtual_state_pdr;
	output	  virtual_state_sdr;
	output	  virtual_state_udr;
	output	  virtual_state_uir;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [1:0] sub_wire2;
	wire  sub_wire3;
	wire  sub_wire4;
	wire  sub_wire5;
	wire  sub_wire6;
	wire  sub_wire7;
	wire  sub_wire8;
	wire  sub_wire9;
	wire  sub_wire10;
	wire  virtual_state_cir = sub_wire0;
	wire  virtual_state_pdr = sub_wire1;
	wire [1:0] ir_in = sub_wire2[1:0];
	wire  tdi = sub_wire3;
	wire  virtual_state_udr = sub_wire4;
	wire  tck = sub_wire5;
	wire  virtual_state_e1dr = sub_wire6;
	wire  virtual_state_uir = sub_wire7;
	wire  virtual_state_cdr = sub_wire8;
	wire  virtual_state_e2dr = sub_wire9;
	wire  virtual_state_sdr = sub_wire10;
	sld_virtual_jtag	sld_virtual_jtag_component (
				.ir_out (ir_out),
				.tdo (tdo),
				.virtual_state_cir (sub_wire0),
				.virtual_state_pdr (sub_wire1),
				.ir_in (sub_wire2),
				.tdi (sub_wire3),
				.virtual_state_udr (sub_wire4),
				.tck (sub_wire5),
				.virtual_state_e1dr (sub_wire6),
				.virtual_state_uir (sub_wire7),
				.virtual_state_cdr (sub_wire8),
				.virtual_state_e2dr (sub_wire9),
				.virtual_state_sdr (sub_wire10)
				// synopsys translate_off
				,
				.jtag_state_cdr (),
				.jtag_state_cir (),
				.jtag_state_e1dr (),
				.jtag_state_e1ir (),
				.jtag_state_e2dr (),
				.jtag_state_e2ir (),
				.jtag_state_pdr (),
				.jtag_state_pir (),
				.jtag_state_rti (),
				.jtag_state_sdr (),
				.jtag_state_sdrs (),
				.jtag_state_sir (),
				.jtag_state_sirs (),
				.jtag_state_tlr (),
				.jtag_state_udr (),
				.jtag_state_uir (),
				.tms ()
				// synopsys translate_on
				);
	defparam
		sld_virtual_jtag_component.sld_auto_instance_index = "NO",
		sld_virtual_jtag_component.sld_instance_index = 0,
		sld_virtual_jtag_component.sld_ir_width = 2,
		sld_virtual_jtag_component.sld_sim_action = "",
		sld_virtual_jtag_component.sld_sim_n_scan = 0,
		sld_virtual_jtag_component.sld_sim_total_length = 0;
endmodule