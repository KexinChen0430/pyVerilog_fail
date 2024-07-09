module cycloneii_io (datain, oe, outclk, outclkena, inclk, inclkena, areset, sreset,
                    devclrn, devpor, devoe, linkin,
                    differentialin, differentialout,
                    padio, combout, regout, linkout);
	parameter operation_mode = "input";
	parameter open_drain_output = "false";
	parameter bus_hold = "false";
	parameter output_register_mode = "none";
	parameter output_async_reset = "none";
	parameter output_sync_reset = "none";
	parameter output_power_up = "low";
	parameter tie_off_output_clock_enable = "false";
	parameter oe_register_mode = "none";
	parameter oe_async_reset = "none";
	parameter oe_sync_reset = "none";
	parameter oe_power_up = "low";
	parameter tie_off_oe_clock_enable = "false";
	parameter input_register_mode = "none";
	parameter input_async_reset = "none";
	parameter input_sync_reset = "none";
	parameter input_power_up = "low";
	parameter lpm_type  = "cycloneii_io";
	parameter use_differential_input  = "false";
	inout		padio;
	input		datain, oe;
	input		outclk, outclkena, inclk, inclkena, areset, sreset;
	input		devclrn, devpor, devoe;
	input       linkin;
	input		differentialin;
	output		differentialout;
 	output		combout, regout;
	output      linkout;
        tri1 devclrn;
        tri1 devpor;
        tri1 devoe;
	wire	out_reg_clk_ena, oe_reg_clk_ena;
	wire	tmp_oe_reg_out, tmp_input_reg_out, tmp_output_reg_out;
	wire	inreg_sreset_is_used, outreg_sreset_is_used, oereg_sreset_is_used;
	wire	inreg_sreset, outreg_sreset, oereg_sreset;
	wire	in_reg_aclr, in_reg_apreset;
	wire	oe_reg_aclr, oe_reg_apreset, oe_reg_sel;
	wire	out_reg_aclr, out_reg_apreset, out_reg_sel;
	wire	input_reg_pu_low, output_reg_pu_low, oe_reg_pu_low;
	wire	inreg_D, outreg_D, oereg_D;
	wire	tmp_datain, tmp_oe;
	wire	iareset, isreset;
	wire    pad_or_differentialin;
	assign  pad_or_differentialin = (use_differential_input == "true") ? differentialin : padio;
	assign input_reg_pu_low = ( input_power_up == "low") ? 'b0 : 'b1;
	assign output_reg_pu_low = ( output_power_up == "low") ? 'b0 : 'b1;
	assign oe_reg_pu_low = ( oe_power_up == "low") ? 'b0 : 'b1;
	assign  out_reg_sel = (output_register_mode == "register" ) ? 'b1 : 'b0;
	assign	oe_reg_sel = ( oe_register_mode == "register" ) ? 'b1 : 'b0;
	assign	iareset = ( areset === 'b0 || areset === 'b1 ) ? !areset : 'b1;
	assign	isreset = ( sreset === 'b0 || sreset === 'b1 ) ? sreset : 'b0;
	// output register signals
	assign out_reg_aclr = (output_async_reset == "clear") ? iareset : 'b1;
	assign out_reg_apreset = ( output_async_reset == "preset") ? iareset : 'b1;
    assign outreg_sreset_is_used = ( output_sync_reset == "none") ? 'b0 : 'b1;
	assign outreg_sreset = (output_sync_reset == "clear") ? 'b0 : 'b1;
	// oe register signals
	assign oe_reg_aclr = ( oe_async_reset == "clear") ? iareset : 'b1;
	assign oe_reg_apreset = ( oe_async_reset == "preset") ? iareset : 'b1;
	assign oereg_sreset_is_used = ( oe_sync_reset == "none") ? 'b0 : 'b1;
	assign oereg_sreset = (oe_sync_reset == "clear") ? 'b0 : 'b1;
	// input register signals
	assign in_reg_aclr = ( input_async_reset == "clear") ? iareset : 'b1;
	assign in_reg_apreset = ( input_async_reset == "preset") ? iareset : 'b1;
	assign inreg_sreset_is_used = ( input_sync_reset == "none") ? 'b0 : 'b1;
	assign inreg_sreset = (input_sync_reset == "clear") ? 'b0 : 'b1;
	// oe and output register clock enable signals
	assign out_reg_clk_ena = ( tie_off_output_clock_enable == "true") ? 'b1 : outclkena;
	assign oe_reg_clk_ena = ( tie_off_oe_clock_enable == "true") ? 'b1 : outclkena;
	// input reg
	cycloneii_mux21 inreg_D_mux (.MO (inreg_D),
			           .A (pad_or_differentialin),
			           .B (inreg_sreset),
			           .S (isreset && inreg_sreset_is_used));
	cycloneii_dffe input_reg (.Q (tmp_input_reg_out),
                       .CLK (inclk),
                       .ENA (inclkena),
                       .D (inreg_D),
                       .CLRN (in_reg_aclr && devclrn && (input_reg_pu_low || devpor)),
                       .PRN (in_reg_apreset && (!input_reg_pu_low || devpor)));
	//output reg
	cycloneii_mux21 outreg_D_mux (.MO (outreg_D),
			           .A (datain),
			           .B (outreg_sreset),
			           .S (isreset && outreg_sreset_is_used));
	cycloneii_dffe output_reg (.Q (tmp_output_reg_out),
                     .CLK (outclk),
                     .ENA (out_reg_clk_ena),
                     .D (outreg_D),
                     .CLRN (out_reg_aclr && devclrn && (output_reg_pu_low || devpor)),
                     .PRN (out_reg_apreset && (!output_reg_pu_low || devpor)));
	//oe reg
	cycloneii_mux21 oereg_D_mux (.MO (oereg_D),
			           .A (oe),
			           .B (oereg_sreset),
			           .S (isreset && oereg_sreset_is_used));
	cycloneii_dffe oe_reg (.Q (tmp_oe_reg_out),
                 .CLK (outclk),
                 .ENA (oe_reg_clk_ena),
                 .D (oereg_D),
                 .CLRN (oe_reg_aclr && devclrn && (oe_reg_pu_low || devpor)),
				 .PRN (oe_reg_apreset && (!oe_reg_pu_low || devpor)));
	// asynchronous block
	assign tmp_oe = (oe_reg_sel == 'b1) ? tmp_oe_reg_out : oe;
	assign tmp_datain = ((operation_mode == "output" || operation_mode == "bidir") && out_reg_sel == 'b1 ) ? tmp_output_reg_out : datain;
	cycloneii_asynch_io	asynch_inst(.datain(tmp_datain),
                                    .oe(tmp_oe),
                                    .regin(tmp_input_reg_out),
                                    .differentialin(differentialin),
                                    .differentialout(differentialout),
                                    .padio(padio),
                                    .combout(combout),
                                    .regout(regout));
	defparam asynch_inst.operation_mode = operation_mode;
	defparam asynch_inst.bus_hold = bus_hold;
	defparam asynch_inst.open_drain_output = open_drain_output;
	defparam asynch_inst.use_differential_input = use_differential_input;
endmodule