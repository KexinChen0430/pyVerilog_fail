module for the interconnections.
	 */
	// Instantiate the 1st ACS unit
	add_compare_select acs0 (n_pm0, d0,
		p_m0, brch_met0, p_m1, brch_met2);
	// Instantiate the 2nd ACS unit
	add_compare_select acs1 (n_pm1, d1,
		p_m2, brch_met4, p_m3, brch_met6);
	// Instantiate the 3rd ACS unit
	add_compare_select acs2 (n_pm2, d2,
		p_m0, brch_met1, p_m1, brch_met3);
	// Instantiate the 4th ACS unit
	add_compare_select acs3 (n_pm3, d3,
		p_m2, brch_met5, p_m3, brch_met7);
	// =====================================================
	/**
	 */
	pmsm path_metric_sm (n_pm0, n_pm1, n_pm2, n_pm3,
		p_m0, p_m1, p_m2, p_m3, clk, reset);
	// =====================================================
	/**
	 */
	spd survivor_path_dec (d0, d1, d2, d3, p_m0, p_m1, p_m2, p_m3,
		d, clk, reset);
endmodule