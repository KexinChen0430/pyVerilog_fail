module
			.addr_o(addr),
			.clk_i(clk_f20),
			.maddr_i(maddr_i),
			.mcmd_i(mcmd_i),
			.mdata_i(mdata_i),
			.mreset_n_i(mreset_n_i),
			.mrespaccept_i(mrespaccept_i),
			.rd_data_i(rd_data),
			.rd_err_i(rd_err),
			.rd_wr_o(rd_wr),
			.reset_n_i(res_f20_n_i),
			.scmdaccept_o(scmdaccept_o),
			.sdata_o(sdata_o),
			.sresp_o(sresp_o),
			.trans_done_i(trans_done),
			.trans_start_o(trans_start),
			.wr_data_o(wr_data)
		);
		// End of Generated Instance Port Map for u0_ocp_target_i
		// Generated Instance Port Map for u1_rs_mcda_i
		rs_mcda	#(
			.N_DOMAINS(2),
			.N_SYNCDOM(1),
			.P_DWIDTH(32)
		) u1_rs_mcda_i (	// Multi-clock-domain Adapter
			.clk_ocp(clk_f20),
			.mreset_n_i(mreset_n_i),
			.rd_data_o(rd_data),
			.rd_data_vec_i(rd_data_vec),
			.rd_err_o(rd_err),
			.rd_err_vec_i(rd_err_vec),
			.rst_ocp_n_i(res_f20_n_i),
			.trans_done_o(trans_done),
			.trans_done_vec_i(trans_done_vec),
			.trans_start_i(trans_start)
		);
		// End of Generated Instance Port Map for u1_rs_mcda_i
endmodule