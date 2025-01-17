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
endmodule