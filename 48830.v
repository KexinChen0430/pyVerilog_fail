module outputs)
   // End of automatics
  //input  scan_in;
  //output scan_out;
       /*
   cpx_dp_halfarray AUTO_TEMPLATE(
			  // Outputs
			  .cpx_spc0_data_cx_l(cpx_spc0_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc2_data_cx_l(cpx_spc2_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc4_data_cx_l(cpx_spc4_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc6_data_cx_l(cpx_spc6_data_cx_l[`CPX_WIDTH-1:0]),
			  .scan_out(cpx_dp_half_array_even_so_1),
   			  // Inputs
			  .shiftenable(se_buf1_top),
			  .arbcp0_cpxdp_shift_cx(arbcp0_cpxdp_shift_cx[5:0]),
			  .arbcp2_cpxdp_shift_cx(arbcp2_cpxdp_shift_cx[5:0]),
			  .arbcp4_cpxdp_shift_cx(arbcp4_cpxdp_shift_cx[5:0]),
			  .arbcp6_cpxdp_shift_cx(arbcp6_cpxdp_shift_cx[5:0]),
			  .arbcp0_cpxdp_qsel1_ca(arbcp0_cpxdp_qsel1_ca[5:0]),
			  .arbcp2_cpxdp_qsel1_ca(arbcp2_cpxdp_qsel1_ca[5:0]),
			  .arbcp4_cpxdp_qsel1_ca(arbcp4_cpxdp_qsel1_ca[5:0]),
			  .arbcp6_cpxdp_qsel1_ca(arbcp6_cpxdp_qsel1_ca[5:0]),
			  .arbcp0_cpxdp_qsel0_ca(arbcp0_cpxdp_qsel0_ca[5:0]),
			  .arbcp2_cpxdp_qsel0_ca(arbcp2_cpxdp_qsel0_ca[5:0]),
			  .arbcp4_cpxdp_qsel0_ca(arbcp4_cpxdp_qsel0_ca[5:0]),
			  .arbcp6_cpxdp_qsel0_ca(arbcp6_cpxdp_qsel0_ca[5:0]),
			  .arbcp0_cpxdp_q0_hold_ca(arbcp0_cpxdp_q0_hold_ca[5:0]),
			  .arbcp2_cpxdp_q0_hold_ca(arbcp2_cpxdp_q0_hold_ca[5:0]),
			  .arbcp4_cpxdp_q0_hold_ca(arbcp4_cpxdp_q0_hold_ca[5:0]),
			  .arbcp6_cpxdp_q0_hold_ca(arbcp6_cpxdp_q0_hold_ca[5:0]),
			  .arbcp0_cpxdp_grant_ca(arbcp0_cpxdp_grant_ca[5:0]),
			  .arbcp2_cpxdp_grant_ca(arbcp2_cpxdp_grant_ca[5:0]),
			  .arbcp4_cpxdp_grant_ca(arbcp4_cpxdp_grant_ca[5:0]),
			  .arbcp6_cpxdp_grant_ca(arbcp6_cpxdp_grant_ca[5:0]),
			  .scan_in(si_1));
*/
   cpx_dp_halfarray cpx_dp_even(/*AUTOINST*/
				// Outputs
				.cpx_spc0_data_cx_l(cpx_spc0_data_cx_l[`CPX_WIDTH-1:0]), // Templated
				.cpx_spc2_data_cx_l(cpx_spc2_data_cx_l[`CPX_WIDTH-1:0]), // Templated
				.cpx_spc4_data_cx_l(cpx_spc4_data_cx_l[`CPX_WIDTH-1:0]), // Templated
				.cpx_spc6_data_cx_l(cpx_spc6_data_cx_l[`CPX_WIDTH-1:0]), // Templated
				.scan_out(cpx_dp_half_array_even_so_1), // Templated
				// Inputs
				.arbcp0_cpxdp_grant_ca(arbcp0_cpxdp_grant_ca[5:0]), // Templated
				.arbcp0_cpxdp_q0_hold_ca(arbcp0_cpxdp_q0_hold_ca[5:0]), // Templated
				.arbcp0_cpxdp_qsel0_ca(arbcp0_cpxdp_qsel0_ca[5:0]), // Templated
				.arbcp0_cpxdp_qsel1_ca(arbcp0_cpxdp_qsel1_ca[5:0]), // Templated
				.arbcp0_cpxdp_shift_cx(arbcp0_cpxdp_shift_cx[5:0]), // Templated
				.arbcp2_cpxdp_grant_ca(arbcp2_cpxdp_grant_ca[5:0]), // Templated
				.arbcp2_cpxdp_q0_hold_ca(arbcp2_cpxdp_q0_hold_ca[5:0]), // Templated
				.arbcp2_cpxdp_qsel0_ca(arbcp2_cpxdp_qsel0_ca[5:0]), // Templated
				.arbcp2_cpxdp_qsel1_ca(arbcp2_cpxdp_qsel1_ca[5:0]), // Templated
				.arbcp2_cpxdp_shift_cx(arbcp2_cpxdp_shift_cx[5:0]), // Templated
				.arbcp4_cpxdp_grant_ca(arbcp4_cpxdp_grant_ca[5:0]), // Templated
				.arbcp4_cpxdp_q0_hold_ca(arbcp4_cpxdp_q0_hold_ca[5:0]), // Templated
				.arbcp4_cpxdp_qsel0_ca(arbcp4_cpxdp_qsel0_ca[5:0]), // Templated
				.arbcp4_cpxdp_qsel1_ca(arbcp4_cpxdp_qsel1_ca[5:0]), // Templated
				.arbcp4_cpxdp_shift_cx(arbcp4_cpxdp_shift_cx[5:0]), // Templated
				.arbcp6_cpxdp_grant_ca(arbcp6_cpxdp_grant_ca[5:0]), // Templated
				.arbcp6_cpxdp_q0_hold_ca(arbcp6_cpxdp_q0_hold_ca[5:0]), // Templated
				.arbcp6_cpxdp_qsel0_ca(arbcp6_cpxdp_qsel0_ca[5:0]), // Templated
				.arbcp6_cpxdp_qsel1_ca(arbcp6_cpxdp_qsel1_ca[5:0]), // Templated
				.arbcp6_cpxdp_shift_cx(arbcp6_cpxdp_shift_cx[5:0]), // Templated
				.fp_cpx_data_ca(fp_cpx_data_ca[`CPX_WIDTH-1:0]),
				.io_cpx_data_ca(io_cpx_data_ca[`CPX_WIDTH-1:0]),
				.rclk	(rclk),
				.scache0_cpx_data_ca(scache0_cpx_data_ca[`CPX_WIDTH-1:0]),
				.scache1_cpx_data_ca(scache1_cpx_data_ca[`CPX_WIDTH-1:0]),
				.scache2_cpx_data_ca(scache2_cpx_data_ca[`CPX_WIDTH-1:0]),
				.scache3_cpx_data_ca(scache3_cpx_data_ca[`CPX_WIDTH-1:0]),
				.shiftenable(se_buf1_top),	 // Templated
				.scan_in(si_1));			 // Templated
       /*
   cpx_dp_halfarray AUTO_TEMPLATE(
			  // Outputs
			  .cpx_spc0_data_cx_l(cpx_spc1_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc2_data_cx_l(cpx_spc3_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc4_data_cx_l(cpx_spc5_data_cx_l[`CPX_WIDTH-1:0]),
			  .cpx_spc6_data_cx_l(cpx_spc7_data_cx_l[`CPX_WIDTH-1:0]),
			  .scan_out(cpx_dp_half_array_odd_so_0),
   			  // Inputs
			  .shiftenable(se_buf1_bottom),
			  .arbcp0_cpxdp_shift_cx(arbcp1_cpxdp_shift_cx[5:0]),
			  .arbcp2_cpxdp_shift_cx(arbcp3_cpxdp_shift_cx[5:0]),
			  .arbcp4_cpxdp_shift_cx(arbcp5_cpxdp_shift_cx[5:0]),
			  .arbcp6_cpxdp_shift_cx(arbcp7_cpxdp_shift_cx[5:0]),
			  .arbcp0_cpxdp_qsel1_ca(arbcp1_cpxdp_qsel1_ca[5:0]),
			  .arbcp2_cpxdp_qsel1_ca(arbcp3_cpxdp_qsel1_ca[5:0]),
			  .arbcp4_cpxdp_qsel1_ca(arbcp5_cpxdp_qsel1_ca[5:0]),
			  .arbcp6_cpxdp_qsel1_ca(arbcp7_cpxdp_qsel1_ca[5:0]),
			  .arbcp0_cpxdp_qsel0_ca(arbcp1_cpxdp_qsel0_ca[5:0]),
			  .arbcp2_cpxdp_qsel0_ca(arbcp3_cpxdp_qsel0_ca[5:0]),
			  .arbcp4_cpxdp_qsel0_ca(arbcp5_cpxdp_qsel0_ca[5:0]),
			  .arbcp6_cpxdp_qsel0_ca(arbcp7_cpxdp_qsel0_ca[5:0]),
			  .arbcp0_cpxdp_q0_hold_ca(arbcp1_cpxdp_q0_hold_ca[5:0]),
			  .arbcp2_cpxdp_q0_hold_ca(arbcp3_cpxdp_q0_hold_ca[5:0]),
			  .arbcp4_cpxdp_q0_hold_ca(arbcp5_cpxdp_q0_hold_ca[5:0]),
			  .arbcp6_cpxdp_q0_hold_ca(arbcp7_cpxdp_q0_hold_ca[5:0]),
			  .arbcp0_cpxdp_grant_ca(arbcp1_cpxdp_grant_ca[5:0]),
			  .arbcp2_cpxdp_grant_ca(arbcp3_cpxdp_grant_ca[5:0]),
			  .arbcp4_cpxdp_grant_ca(arbcp5_cpxdp_grant_ca[5:0]),
			  .arbcp6_cpxdp_grant_ca(arbcp7_cpxdp_grant_ca[5:0]),
			  .scan_in(si_0));
*/
   cpx_dp_halfarray cpx_dp_odd(/*AUTOINST*/
			       // Outputs
			       .cpx_spc0_data_cx_l(cpx_spc1_data_cx_l[`CPX_WIDTH-1:0]), // Templated
			       .cpx_spc2_data_cx_l(cpx_spc3_data_cx_l[`CPX_WIDTH-1:0]), // Templated
			       .cpx_spc4_data_cx_l(cpx_spc5_data_cx_l[`CPX_WIDTH-1:0]), // Templated
			       .cpx_spc6_data_cx_l(cpx_spc7_data_cx_l[`CPX_WIDTH-1:0]), // Templated
			       .scan_out(cpx_dp_half_array_odd_so_0), // Templated
			       // Inputs
			       .arbcp0_cpxdp_grant_ca(arbcp1_cpxdp_grant_ca[5:0]), // Templated
			       .arbcp0_cpxdp_q0_hold_ca(arbcp1_cpxdp_q0_hold_ca[5:0]), // Templated
			       .arbcp0_cpxdp_qsel0_ca(arbcp1_cpxdp_qsel0_ca[5:0]), // Templated
			       .arbcp0_cpxdp_qsel1_ca(arbcp1_cpxdp_qsel1_ca[5:0]), // Templated
			       .arbcp0_cpxdp_shift_cx(arbcp1_cpxdp_shift_cx[5:0]), // Templated
			       .arbcp2_cpxdp_grant_ca(arbcp3_cpxdp_grant_ca[5:0]), // Templated
			       .arbcp2_cpxdp_q0_hold_ca(arbcp3_cpxdp_q0_hold_ca[5:0]), // Templated
			       .arbcp2_cpxdp_qsel0_ca(arbcp3_cpxdp_qsel0_ca[5:0]), // Templated
			       .arbcp2_cpxdp_qsel1_ca(arbcp3_cpxdp_qsel1_ca[5:0]), // Templated
			       .arbcp2_cpxdp_shift_cx(arbcp3_cpxdp_shift_cx[5:0]), // Templated
			       .arbcp4_cpxdp_grant_ca(arbcp5_cpxdp_grant_ca[5:0]), // Templated
			       .arbcp4_cpxdp_q0_hold_ca(arbcp5_cpxdp_q0_hold_ca[5:0]), // Templated
			       .arbcp4_cpxdp_qsel0_ca(arbcp5_cpxdp_qsel0_ca[5:0]), // Templated
			       .arbcp4_cpxdp_qsel1_ca(arbcp5_cpxdp_qsel1_ca[5:0]), // Templated
			       .arbcp4_cpxdp_shift_cx(arbcp5_cpxdp_shift_cx[5:0]), // Templated
			       .arbcp6_cpxdp_grant_ca(arbcp7_cpxdp_grant_ca[5:0]), // Templated
			       .arbcp6_cpxdp_q0_hold_ca(arbcp7_cpxdp_q0_hold_ca[5:0]), // Templated
			       .arbcp6_cpxdp_qsel0_ca(arbcp7_cpxdp_qsel0_ca[5:0]), // Templated
			       .arbcp6_cpxdp_qsel1_ca(arbcp7_cpxdp_qsel1_ca[5:0]), // Templated
			       .arbcp6_cpxdp_shift_cx(arbcp7_cpxdp_shift_cx[5:0]), // Templated
			       .fp_cpx_data_ca(fp_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .io_cpx_data_ca(io_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .rclk	(rclk),
			       .scache0_cpx_data_ca(scache0_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .scache1_cpx_data_ca(scache1_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .scache2_cpx_data_ca(scache2_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .scache3_cpx_data_ca(scache3_cpx_data_ca[`CPX_WIDTH-1:0]),
			       .shiftenable(se_buf1_bottom),	 // Templated
			       .scan_in	(si_0));			 // Templated
endmodule