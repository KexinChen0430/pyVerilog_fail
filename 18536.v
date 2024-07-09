module  ddr3_s4_uniphy_p0_dll_memphy_altdll_5s51
	(
	dll_clk,
	dll_delayctrlout) ;
	input   [0:0]  dll_clk;
	output   [5:0]  dll_delayctrlout;
	wire  [5:0]   wire_dll_wys_m_delayctrlout;
	stratixiv_dll   dll_wys_m
	(
	.clk(dll_clk),
	.delayctrlout(wire_dll_wys_m_delayctrlout),
	.dqsupdate(),
	.offsetdelayctrlclkout(),
	.offsetdelayctrlout(),
	.upndnout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aload(1'b0),
	.upndnin(1'b1),
	.upndninclkena(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b0)
	// synopsys translate_on
	);
	defparam
		dll_wys_m.delay_buffer_mode = "high",
		dll_wys_m.delay_chain_length = 8,
		dll_wys_m.input_frequency = "1876 ps",
		dll_wys_m.jitter_reduction = "true",
		dll_wys_m.static_delay_ctrl = 8,
		dll_wys_m.lpm_type = "stratixiv_dll";
	assign
		dll_delayctrlout = wire_dll_wys_m_delayctrlout;
endmodule