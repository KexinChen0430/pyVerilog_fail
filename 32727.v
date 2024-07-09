module
			.clk_i(clk_f20),
			.maddr_i(maddr),
			.mcmd_i(mcmd),
			.mdata_i(mdata),
			.mreset_n_i(mreset_n),
			.mrespaccept_i(mrespaccept),
			.reset_n_i(res_f20_n),
			.scmdaccept_i(scmdaccept),
			.sresp_i(sresp)
		);
		// End of Generated Instance Port Map for u1_sci_target_m_checker_i
 // synopsys translate_on
`endif
		// Generated Instance Port Map for u2_rs_mcda_0002_i
		rs_mcda_0002	#(
			.N_DOMAINS(2),
			.N_SYNCDOM(1),
			.P_DWIDTH(32),
			.P_MIX_SIG("M1"),
			.P_PRDWIDTH(1)
		) u2_rs_mcda_0002_i (	// Multi-clock-domain Adapter
			.clk_ocp(clk_f20),
			.mreset_n_i(mreset_n),
			.pre_dec_err_i(pre_dec_err),
			.pre_dec_i(pre_dec),
			.rd_data_o(rd_data),
			.rd_data_vec_i(rd_data_vec),
			.rd_err_o(rd_err),
			.rd_err_vec_i(rd_err_vec),
			.rst_ocp_n_i(res_f20_n),
			.trans_done_o(trans_done),
			.trans_done_vec_i(trans_done_vec),
			.trans_start_i(trans_start),
			.trans_start_vec_o({ trans_start_1, trans_start_0 }) // __I_BIT_TO_BUSPORT (x2) // __I_COMBINE_SPLICES
		);
		// End of Generated Instance Port Map for u2_rs_mcda_0002_i
endmodule