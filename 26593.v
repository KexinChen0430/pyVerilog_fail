module outputs)
   wire [5:0]		arbcp0_cpxdp_grant_arbbf_ca;// From arb0 of ccx_arbc.v
   wire [5:0]		arbcp0_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp0_cpxdp_q0_hold_arbbf_ca;// From arb0 of ccx_arbc.v
   wire [5:0]		arbcp0_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp0_cpxdp_qsel0_arbbf_ca;// From arb0 of ccx_arbc.v
   wire [5:0]		arbcp0_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp0_cpxdp_qsel1_arbbf_ca;// From arb0 of ccx_arbc.v
   wire [5:0]		arbcp0_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp0_cpxdp_shift_arbbf_cx;// From arb0 of ccx_arbc.v
   wire [5:0]		arbcp0_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp1_cpxdp_grant_arbbf_ca;// From arb1 of ccx_arbc.v
   wire [5:0]		arbcp1_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp1_cpxdp_q0_hold_arbbf_ca;// From arb1 of ccx_arbc.v
   wire [5:0]		arbcp1_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp1_cpxdp_qsel0_arbbf_ca;// From arb1 of ccx_arbc.v
   wire [5:0]		arbcp1_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp1_cpxdp_qsel1_arbbf_ca;// From arb1 of ccx_arbc.v
   wire [5:0]		arbcp1_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp1_cpxdp_shift_arbbf_cx;// From arb1 of ccx_arbc.v
   wire [5:0]		arbcp1_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp2_cpxdp_grant_arbbf_ca;// From arb2 of ccx_arbc.v
   wire [5:0]		arbcp2_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp2_cpxdp_q0_hold_arbbf_ca;// From arb2 of ccx_arbc.v
   wire [5:0]		arbcp2_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp2_cpxdp_qsel0_arbbf_ca;// From arb2 of ccx_arbc.v
   wire [5:0]		arbcp2_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp2_cpxdp_qsel1_arbbf_ca;// From arb2 of ccx_arbc.v
   wire [5:0]		arbcp2_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp2_cpxdp_shift_arbbf_cx;// From arb2 of ccx_arbc.v
   wire [5:0]		arbcp2_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp3_cpxdp_grant_arbbf_ca;// From arb3 of ccx_arbc.v
   wire [5:0]		arbcp3_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp3_cpxdp_q0_hold_arbbf_ca;// From arb3 of ccx_arbc.v
   wire [5:0]		arbcp3_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp3_cpxdp_qsel0_arbbf_ca;// From arb3 of ccx_arbc.v
   wire [5:0]		arbcp3_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp3_cpxdp_qsel1_arbbf_ca;// From arb3 of ccx_arbc.v
   wire [5:0]		arbcp3_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp3_cpxdp_shift_arbbf_cx;// From arb3 of ccx_arbc.v
   wire [5:0]		arbcp3_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp4_cpxdp_grant_arbbf_ca;// From arb4 of ccx_arbc.v
   wire [5:0]		arbcp4_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp4_cpxdp_q0_hold_arbbf_ca;// From arb4 of ccx_arbc.v
   wire [5:0]		arbcp4_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp4_cpxdp_qsel0_arbbf_ca;// From arb4 of ccx_arbc.v
   wire [5:0]		arbcp4_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp4_cpxdp_qsel1_arbbf_ca;// From arb4 of ccx_arbc.v
   wire [5:0]		arbcp4_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp4_cpxdp_shift_arbbf_cx;// From arb4 of ccx_arbc.v
   wire [5:0]		arbcp4_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp5_cpxdp_grant_arbbf_ca;// From arb5 of ccx_arbc.v
   wire [5:0]		arbcp5_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp5_cpxdp_q0_hold_arbbf_ca;// From arb5 of ccx_arbc.v
   wire [5:0]		arbcp5_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp5_cpxdp_qsel0_arbbf_ca;// From arb5 of ccx_arbc.v
   wire [5:0]		arbcp5_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp5_cpxdp_qsel1_arbbf_ca;// From arb5 of ccx_arbc.v
   wire [5:0]		arbcp5_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp5_cpxdp_shift_arbbf_cx;// From arb5 of ccx_arbc.v
   wire [5:0]		arbcp5_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp6_cpxdp_grant_arbbf_ca;// From arb6 of ccx_arbc.v
   wire [5:0]		arbcp6_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp6_cpxdp_q0_hold_arbbf_ca;// From arb6 of ccx_arbc.v
   wire [5:0]		arbcp6_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp6_cpxdp_qsel0_arbbf_ca;// From arb6 of ccx_arbc.v
   wire [5:0]		arbcp6_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp6_cpxdp_qsel1_arbbf_ca;// From arb6 of ccx_arbc.v
   wire [5:0]		arbcp6_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp6_cpxdp_shift_arbbf_cx;// From arb6 of ccx_arbc.v
   wire [5:0]		arbcp6_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp7_cpxdp_grant_arbbf_ca;// From arb7 of ccx_arbc.v
   wire [5:0]		arbcp7_cpxdp_grant_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp7_cpxdp_q0_hold_arbbf_ca;// From arb7 of ccx_arbc.v
   wire [5:0]		arbcp7_cpxdp_q0_hold_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp7_cpxdp_qsel0_arbbf_ca;// From arb7 of ccx_arbc.v
   wire [5:0]		arbcp7_cpxdp_qsel0_ca;	// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp7_cpxdp_qsel1_arbbf_ca;// From arb7 of ccx_arbc.v
   wire [5:0]		arbcp7_cpxdp_qsel1_ca_l;// From buf_top of cpx_buf_top.v
   wire [5:0]		arbcp7_cpxdp_shift_arbbf_cx;// From arb7 of ccx_arbc.v
   wire [5:0]		arbcp7_cpxdp_shift_cx;	// From buf_top of cpx_buf_top.v
   wire			cpx_arb0_so_1;		// From arb0 of ccx_arbc.v
   wire			cpx_arb1_so_1;		// From arb1 of ccx_arbc.v
   wire			cpx_arb2_so_1;		// From arb2 of ccx_arbc.v
   wire			cpx_arb3_so_1;		// From arb3 of ccx_arbc.v
   wire			cpx_arb4_so_1;		// From arb4 of ccx_arbc.v
   wire			cpx_arb5_so_1;		// From arb5 of ccx_arbc.v
   wire			cpx_arb6_so_1;		// From arb6 of ccx_arbc.v
   wire			cpx_dp_half_array_even_so_1;// From cpx_dp_array of cpx_dp_array.v
   wire [7:0]		cpx_io_grant_ca;	// From arb0 of ccx_arbc.v, ...
   wire [7:0]		cpx_scache0_grant_ca;	// From arb0 of ccx_arbc.v, ...
   wire [7:0]		cpx_scache1_grant_ca;	// From arb0 of ccx_arbc.v, ...
   wire [7:0]		cpx_scache2_grant_ca;	// From arb0 of ccx_arbc.v, ...
   wire [7:0]		cpx_scache3_grant_ca;	// From arb0 of ccx_arbc.v, ...
   wire [`CPX_WIDTH-1:0]cpx_spc0_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc0_data_rdy_cx;	// From arb0 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc1_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc1_data_rdy_cx;	// From arb1 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc2_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc2_data_rdy_cx;	// From arb2 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc3_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc3_data_rdy_cx;	// From arb3 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc4_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc4_data_rdy_cx;	// From arb4 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc5_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc5_data_rdy_cx;	// From arb5 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc6_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc6_data_rdy_cx;	// From arb6 of ccx_arbc.v
   wire [`CPX_WIDTH-1:0]cpx_spc7_data_cx_l;	// From cpx_dp_array of cpx_dp_array.v
   wire			cpx_spc7_data_rdy_cx;	// From arb7 of ccx_arbc.v
   wire [7:0]		fp_cpx_req_bufp1_cq;	// From buf_top of cpx_buf_top.v
   wire [7:0]		io_cpx_req_buf1_io_cq;	// From buf_top of cpx_buf_top.v
   wire [7:0]		io_cpx_req_bufp3_cq;	// From buf_top of cpx_buf_top.v
   wire			scache0_cpx_atom_bufp1_cq;// From buf_top of cpx_buf_top.v
   wire [7:0]		scache0_cpx_req_bufp1_cq;// From buf_top of cpx_buf_top.v
   wire			scache1_cpx_atom_bufpm_cq;// From buf_top of cpx_buf_top.v
   wire [7:0]		scache1_cpx_req_bufpm_cq;// From buf_top of cpx_buf_top.v
   wire			scache2_cpx_atom_bufpm_cq;// From buf_top of cpx_buf_top.v
   wire [7:0]		scache2_cpx_req_bufpm_cq;// From buf_top of cpx_buf_top.v
   wire			scache3_cpx_atom_bufp3_cq;// From buf_top of cpx_buf_top.v
   wire [7:0]		scache3_cpx_req_bufp3_cq;// From buf_top of cpx_buf_top.v
   // End of automatics
   wire [`CPX_WIDTH-1:0] io_cpx_data_buf1_ca2;
   wire [`CPX_WIDTH-1:0] fp_cpx_data_buf_ca;
   wire [`CPX_WIDTH-1:0] sctag0_cpx_data_buf_ca;
   wire [`CPX_WIDTH-1:0] sctag1_cpx_data_buf_ca;
   wire [`CPX_WIDTH-1:0] sctag2_cpx_data_buf_ca;
   wire [`CPX_WIDTH-1:0] sctag3_cpx_data_buf_ca;
/*
 cpx_dp_array AUTO_TEMPLATE(
                             .arbcp0_cpxdp_q0_hold_ca(arbcp0_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp1_cpxdp_q0_hold_ca(arbcp1_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp2_cpxdp_q0_hold_ca(arbcp2_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp3_cpxdp_q0_hold_ca(arbcp3_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp4_cpxdp_q0_hold_ca(arbcp4_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp5_cpxdp_q0_hold_ca(arbcp5_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp6_cpxdp_q0_hold_ca(arbcp6_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp7_cpxdp_q0_hold_ca(arbcp7_cpxdp_q0_hold_ca_l[5:0]),
                             .arbcp0_cpxdp_qsel1_ca(arbcp0_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp1_cpxdp_qsel1_ca(arbcp1_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp2_cpxdp_qsel1_ca(arbcp2_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp3_cpxdp_qsel1_ca(arbcp3_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp4_cpxdp_qsel1_ca(arbcp4_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp5_cpxdp_qsel1_ca(arbcp5_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp6_cpxdp_qsel1_ca(arbcp6_cpxdp_qsel1_ca_l[5:0]),
                             .arbcp7_cpxdp_qsel1_ca(arbcp7_cpxdp_qsel1_ca_l[5:0]),
			     .fp_cpx_data_ca(fp_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
			     .io_cpx_data_ca(io_cpx_data_buf1_ca2[`CPX_WIDTH-1:0]),
			     .scache0_cpx_data_ca(sctag0_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
			     .scache1_cpx_data_ca(sctag1_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
			     .scache2_cpx_data_ca(sctag2_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
			     .scache3_cpx_data_ca(sctag3_cpx_data_buf_ca[`CPX_WIDTH-1:0]));
 */
   cpx_dp_array cpx_dp_array(/*AUTOINST*/
			     // Outputs
			     .cpx_dp_half_array_even_so_1(cpx_dp_half_array_even_so_1),
			     .cpx_dp_half_array_odd_so_0(cpx_dp_half_array_odd_so_0),
			     .cpx_spc0_data_cx_l(cpx_spc0_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc1_data_cx_l(cpx_spc1_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc2_data_cx_l(cpx_spc2_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc3_data_cx_l(cpx_spc3_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc4_data_cx_l(cpx_spc4_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc5_data_cx_l(cpx_spc5_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc6_data_cx_l(cpx_spc6_data_cx_l[`CPX_WIDTH-1:0]),
			     .cpx_spc7_data_cx_l(cpx_spc7_data_cx_l[`CPX_WIDTH-1:0]),
			     // Inputs
			     .arbcp0_cpxdp_grant_ca(arbcp0_cpxdp_grant_ca[5:0]),
			     .arbcp0_cpxdp_q0_hold_ca(arbcp0_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp0_cpxdp_qsel0_ca(arbcp0_cpxdp_qsel0_ca[5:0]),
			     .arbcp0_cpxdp_qsel1_ca(arbcp0_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp0_cpxdp_shift_cx(arbcp0_cpxdp_shift_cx[5:0]),
			     .arbcp1_cpxdp_grant_ca(arbcp1_cpxdp_grant_ca[5:0]),
			     .arbcp1_cpxdp_q0_hold_ca(arbcp1_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp1_cpxdp_qsel0_ca(arbcp1_cpxdp_qsel0_ca[5:0]),
			     .arbcp1_cpxdp_qsel1_ca(arbcp1_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp1_cpxdp_shift_cx(arbcp1_cpxdp_shift_cx[5:0]),
			     .arbcp2_cpxdp_grant_ca(arbcp2_cpxdp_grant_ca[5:0]),
			     .arbcp2_cpxdp_q0_hold_ca(arbcp2_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp2_cpxdp_qsel0_ca(arbcp2_cpxdp_qsel0_ca[5:0]),
			     .arbcp2_cpxdp_qsel1_ca(arbcp2_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp2_cpxdp_shift_cx(arbcp2_cpxdp_shift_cx[5:0]),
			     .arbcp3_cpxdp_grant_ca(arbcp3_cpxdp_grant_ca[5:0]),
			     .arbcp3_cpxdp_q0_hold_ca(arbcp3_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp3_cpxdp_qsel0_ca(arbcp3_cpxdp_qsel0_ca[5:0]),
			     .arbcp3_cpxdp_qsel1_ca(arbcp3_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp3_cpxdp_shift_cx(arbcp3_cpxdp_shift_cx[5:0]),
			     .arbcp4_cpxdp_grant_ca(arbcp4_cpxdp_grant_ca[5:0]),
			     .arbcp4_cpxdp_q0_hold_ca(arbcp4_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp4_cpxdp_qsel0_ca(arbcp4_cpxdp_qsel0_ca[5:0]),
			     .arbcp4_cpxdp_qsel1_ca(arbcp4_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp4_cpxdp_shift_cx(arbcp4_cpxdp_shift_cx[5:0]),
			     .arbcp5_cpxdp_grant_ca(arbcp5_cpxdp_grant_ca[5:0]),
			     .arbcp5_cpxdp_q0_hold_ca(arbcp5_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp5_cpxdp_qsel0_ca(arbcp5_cpxdp_qsel0_ca[5:0]),
			     .arbcp5_cpxdp_qsel1_ca(arbcp5_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp5_cpxdp_shift_cx(arbcp5_cpxdp_shift_cx[5:0]),
			     .arbcp6_cpxdp_grant_ca(arbcp6_cpxdp_grant_ca[5:0]),
			     .arbcp6_cpxdp_q0_hold_ca(arbcp6_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp6_cpxdp_qsel0_ca(arbcp6_cpxdp_qsel0_ca[5:0]),
			     .arbcp6_cpxdp_qsel1_ca(arbcp6_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp6_cpxdp_shift_cx(arbcp6_cpxdp_shift_cx[5:0]),
			     .arbcp7_cpxdp_grant_ca(arbcp7_cpxdp_grant_ca[5:0]),
			     .arbcp7_cpxdp_q0_hold_ca(arbcp7_cpxdp_q0_hold_ca_l[5:0]), // Templated
			     .arbcp7_cpxdp_qsel0_ca(arbcp7_cpxdp_qsel0_ca[5:0]),
			     .arbcp7_cpxdp_qsel1_ca(arbcp7_cpxdp_qsel1_ca_l[5:0]), // Templated
			     .arbcp7_cpxdp_shift_cx(arbcp7_cpxdp_shift_cx[5:0]),
			     .fp_cpx_data_ca(fp_cpx_data_buf_ca[`CPX_WIDTH-1:0]), // Templated
			     .io_cpx_data_ca(io_cpx_data_buf1_ca2[`CPX_WIDTH-1:0]), // Templated
			     .rclk	(rclk),
			     .scache0_cpx_data_ca(sctag0_cpx_data_buf_ca[`CPX_WIDTH-1:0]), // Templated
			     .scache1_cpx_data_ca(sctag1_cpx_data_buf_ca[`CPX_WIDTH-1:0]), // Templated
			     .scache2_cpx_data_ca(sctag2_cpx_data_buf_ca[`CPX_WIDTH-1:0]), // Templated
			     .scache3_cpx_data_ca(sctag3_cpx_data_buf_ca[`CPX_WIDTH-1:0]), // Templated
			     .se_buf1_bottom(se_buf1_bottom),
			     .se_buf1_top(se_buf1_top),
			     .si_0	(si_0),
			     .si_1	(si_1));
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb@_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf6_middle),
	   .adbginit_l		        (adbginit_l_buf6_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(pcx_scache1_dat_px2_so_1),
		 .se			(se_buf6_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb0(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[0]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[0]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[0]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[0]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[0]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc0_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb0_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp0_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp0_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp0_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp0_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp0_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf6_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf6_middle),	 // Templated
		 .scan_in		(pcx_scache1_dat_px2_so_1), // Templated
		 .se			(se_buf6_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[0]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[0]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[0]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[0]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[0]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[0])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb1_so_1),
           // Inputs
	   .reset_l		        (rst_l_buf6_middle),
	   .adbginit_l		        (adbginit_l_buf6_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb0_so_1),
		 .se			(se_buf6_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb1(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[1]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[1]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[1]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[1]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[1]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc1_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb1_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp1_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp1_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp1_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp1_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp1_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf6_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf6_middle),	 // Templated
		 .scan_in		(cpx_arb0_so_1),	 // Templated
		 .se			(se_buf6_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[1]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[1]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[1]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[1]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[1]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[1])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb2_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf5_middle),
	   .adbginit_l		        (adbginit_l_buf5_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb1_so_1),
		 .se			(se_buf5_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb2(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[2]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[2]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[2]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[2]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[2]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc2_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb2_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp2_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp2_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp2_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp2_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp2_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf5_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf5_middle),	 // Templated
		 .scan_in		(cpx_arb1_so_1),	 // Templated
		 .se			(se_buf5_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[2]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[2]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[2]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[2]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[2]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[2])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb3_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf5_middle),
	   .adbginit_l		        (adbginit_l_buf5_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb2_so_1),
		 .se			(se_buf5_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb3(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[3]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[3]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[3]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[3]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[3]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc3_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb3_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp3_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp3_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp3_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp3_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp3_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf5_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf5_middle),	 // Templated
		 .scan_in		(cpx_arb2_so_1),	 // Templated
		 .se			(se_buf5_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[3]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[3]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[3]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[3]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[3]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[3])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb4_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf4_middle),
	   .adbginit_l		        (adbginit_l_buf4_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb3_so_1),
		 .se			(se_buf4_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb4(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[4]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[4]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[4]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[4]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[4]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc4_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb4_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp4_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp4_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp4_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp4_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp4_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf4_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf4_middle),	 // Templated
		 .scan_in		(cpx_arb3_so_1),	 // Templated
		 .se			(se_buf4_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[4]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[4]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[4]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[4]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[4]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[4])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb5_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf4_middle),
	   .adbginit_l		        (adbginit_l_buf4_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb4_so_1),
		 .se			(se_buf4_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb5(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[5]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[5]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[5]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[5]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[5]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc5_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb5_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp5_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp5_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp5_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp5_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp5_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf4_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf4_middle),	 // Templated
		 .scan_in		(cpx_arb4_so_1),	 // Templated
		 .se			(se_buf4_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[5]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[5]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[5]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[5]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[5]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[5])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb6_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf3_middle),
	   .adbginit_l		        (adbginit_l_buf3_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb5_so_1),
		 .se			(se_buf3_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb6(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[6]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[6]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[6]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[6]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[6]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc6_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb6_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp6_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp6_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp6_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp6_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp6_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf3_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf3_middle),	 // Templated
		 .scan_in		(cpx_arb5_so_1),	 // Templated
		 .se			(se_buf3_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[6]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[6]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[6]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[6]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[6]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[6])); // Templated
   /*
   ccx_arbc AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbcp@_cpxdp_grant_arbbf_ca[5:0]),
	   .arb_dp_q0_hold_a		(arbcp@_cpxdp_q0_hold_arbbf_ca[5:0]),
	   .arb_dp_qsel0_a		(arbcp@_cpxdp_qsel0_arbbf_ca[5:0]),
	   .arb_dp_qsel1_a		(arbcp@_cpxdp_qsel1_arbbf_ca[5:0]),
	   .arb_dp_shift_x		(arbcp@_cpxdp_shift_arbbf_cx[5:0]),
	   .arb_src0_grant_a		(cpx_scache0_grant_ca[@]),
	   .arb_src1_grant_a		(cpx_scache1_grant_ca[@]),
	   .arb_src2_grant_a		(cpx_scache2_grant_ca[@]),
	   .arb_src3_grant_a		(cpx_scache3_grant_ca[@]),
	   .arb_src4_grant_a		(cpx_io_grant_ca[@]),
	   .arb_src5_grant_a		(),
	   .ccx_dest_data_rdy_x	        (cpx_spc@_data_rdy_cx),
		 .scan_out		(cpx_arb7_so_1),
	   // Inputs
	   .reset_l		        (rst_l_buf3_middle),
	   .adbginit_l		        (adbginit_l_buf3_middle),
	   .src0_arb_atom_q		(scache0_cpx_atom_bufp1_cq),
	   .src0_arb_req_q		(scache0_cpx_req_bufp1_cq[@]),
	   .src1_arb_atom_q		(scache1_cpx_atom_bufpm_cq),
	   .src1_arb_req_q		(scache1_cpx_req_bufpm_cq[@]),
	   .src2_arb_atom_q		(scache2_cpx_atom_bufpm_cq),
	   .src2_arb_req_q		(scache2_cpx_req_bufpm_cq[@]),
	   .src3_arb_atom_q		(scache3_cpx_atom_bufp3_cq),
	   .src3_arb_req_q		(scache3_cpx_req_bufp3_cq[@]),
	   .src4_arb_atom_q		(1'b0),
	   .src4_arb_req_q		(io_cpx_req_buf1_io_cq[@]),
	   .src5_arb_atom_q		(1'b0),
	   .src5_arb_req_q		(fp_cpx_req_bufp1_cq[@]),
		 .scan_in		(cpx_arb6_so_1),
		 .se			(se_buf3_middle),
		 //.tmb_l			(tmb_l));
           */
   ccx_arbc arb7(/*AUTOINST*/
		 // Outputs
		 .arb_src0_grant_a	(cpx_scache0_grant_ca[7]), // Templated
		 .arb_src1_grant_a	(cpx_scache1_grant_ca[7]), // Templated
		 .arb_src2_grant_a	(cpx_scache2_grant_ca[7]), // Templated
		 .arb_src3_grant_a	(cpx_scache3_grant_ca[7]), // Templated
		 .arb_src4_grant_a	(cpx_io_grant_ca[7]),	 // Templated
		 .arb_src5_grant_a	(),			 // Templated
		 .ccx_dest_data_rdy_x	(cpx_spc7_data_rdy_cx),	 // Templated
		 .scan_out		(cpx_arb7_so_1),	 // Templated
		 .arb_dp_grant_a	(arbcp7_cpxdp_grant_arbbf_ca[5:0]), // Templated
		 .arb_dp_q0_hold_a	(arbcp7_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel0_a	(arbcp7_cpxdp_qsel0_arbbf_ca[5:0]), // Templated
		 .arb_dp_qsel1_a	(arbcp7_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		 .arb_dp_shift_x	(arbcp7_cpxdp_shift_arbbf_cx[5:0]), // Templated
		 // Inputs
		 .adbginit_l		(adbginit_l_buf3_middle), // Templated
		 .rclk			(rclk),
		 .reset_l		(rst_l_buf3_middle),	 // Templated
		 .scan_in		(cpx_arb6_so_1),	 // Templated
		 .se			(se_buf3_middle),	 // Templated
		 .src0_arb_atom_q	(scache0_cpx_atom_bufp1_cq), // Templated
		 .src0_arb_req_q	(scache0_cpx_req_bufp1_cq[7]), // Templated
		 .src1_arb_atom_q	(scache1_cpx_atom_bufpm_cq), // Templated
		 .src1_arb_req_q	(scache1_cpx_req_bufpm_cq[7]), // Templated
		 .src2_arb_atom_q	(scache2_cpx_atom_bufpm_cq), // Templated
		 .src2_arb_req_q	(scache2_cpx_req_bufpm_cq[7]), // Templated
		 .src3_arb_atom_q	(scache3_cpx_atom_bufp3_cq), // Templated
		 .src3_arb_req_q	(scache3_cpx_req_bufp3_cq[7]), // Templated
		 .src4_arb_atom_q	(1'b0),			 // Templated
		 .src4_arb_req_q	(io_cpx_req_buf1_io_cq[7]), // Templated
		 .src5_arb_atom_q	(1'b0),			 // Templated
		 .src5_arb_req_q	(fp_cpx_req_bufp1_cq[7])); // Templated
/*
   cpx_buf_top	AUTO_TEMPLATE(
		       //.se(shiftenable),
                       .si_1(cpx_dp_half_array_even_so_1),
                       .scache0_cpx_atom_cq(sctag0_cpx_atom_cq),
                       .scache0_cpx_req_cq(sctag0_cpx_req_cq[7:0]),
                       .scache1_cpx_atom_cq(sctag1_cpx_atom_cq),
                       .scache1_cpx_req_cq(sctag1_cpx_req_cq[7:0]),
                       .scache2_cpx_atom_cq(sctag2_cpx_atom_cq),
                       .scache2_cpx_req_cq(sctag2_cpx_req_cq[7:0]),
                       .scache3_cpx_atom_cq(sctag3_cpx_atom_cq),
                       .scache3_cpx_req_cq(sctag3_cpx_req_cq[7:0]),
                       .arbcp0_cpxdp_q0_hold_arbbf_ca_l(arbcp0_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp1_cpxdp_q0_hold_arbbf_ca_l(arbcp1_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp2_cpxdp_q0_hold_arbbf_ca_l(arbcp2_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp3_cpxdp_q0_hold_arbbf_ca_l(arbcp3_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp4_cpxdp_q0_hold_arbbf_ca_l(arbcp4_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp5_cpxdp_q0_hold_arbbf_ca_l(arbcp5_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp6_cpxdp_q0_hold_arbbf_ca_l(arbcp6_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp7_cpxdp_q0_hold_arbbf_ca_l(arbcp7_cpxdp_q0_hold_arbbf_ca[5:0]),
                       .arbcp0_cpxdp_qsel1_arbbf_ca_l(arbcp0_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp1_cpxdp_qsel1_arbbf_ca_l(arbcp1_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp2_cpxdp_qsel1_arbbf_ca_l(arbcp2_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp3_cpxdp_qsel1_arbbf_ca_l(arbcp3_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp4_cpxdp_qsel1_arbbf_ca_l(arbcp4_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp5_cpxdp_qsel1_arbbf_ca_l(arbcp5_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp6_cpxdp_qsel1_arbbf_ca_l(arbcp6_cpxdp_qsel1_arbbf_ca[5:0]),
                       .arbcp7_cpxdp_qsel1_arbbf_ca_l(arbcp7_cpxdp_qsel1_arbbf_ca[5:0]),
                       .cpx_scache0_grant_cx(cpx_sctag0_grant_cx[7:0]),
                       .cpx_scache1_grant_cx(cpx_sctag1_grant_cx[7:0]),
                       .cpx_scache2_grant_cx(cpx_sctag2_grant_cx[7:0]),
                       .cpx_scache3_grant_cx(cpx_sctag3_grant_cx[7:0]));
*/
   cpx_buf_top buf_top(/*AUTOINST*/
		       // Outputs
		       .arbcp0_cpxdp_grant_ca(arbcp0_cpxdp_grant_ca[5:0]),
		       .arbcp0_cpxdp_q0_hold_ca_l(arbcp0_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp0_cpxdp_qsel0_ca(arbcp0_cpxdp_qsel0_ca[5:0]),
		       .arbcp0_cpxdp_qsel1_ca_l(arbcp0_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp0_cpxdp_shift_cx(arbcp0_cpxdp_shift_cx[5:0]),
		       .arbcp1_cpxdp_grant_ca(arbcp1_cpxdp_grant_ca[5:0]),
		       .arbcp1_cpxdp_q0_hold_ca_l(arbcp1_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp1_cpxdp_qsel0_ca(arbcp1_cpxdp_qsel0_ca[5:0]),
		       .arbcp1_cpxdp_qsel1_ca_l(arbcp1_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp1_cpxdp_shift_cx(arbcp1_cpxdp_shift_cx[5:0]),
		       .arbcp2_cpxdp_grant_ca(arbcp2_cpxdp_grant_ca[5:0]),
		       .arbcp2_cpxdp_q0_hold_ca_l(arbcp2_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp2_cpxdp_qsel0_ca(arbcp2_cpxdp_qsel0_ca[5:0]),
		       .arbcp2_cpxdp_qsel1_ca_l(arbcp2_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp2_cpxdp_shift_cx(arbcp2_cpxdp_shift_cx[5:0]),
		       .arbcp3_cpxdp_grant_ca(arbcp3_cpxdp_grant_ca[5:0]),
		       .arbcp3_cpxdp_q0_hold_ca_l(arbcp3_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp3_cpxdp_qsel0_ca(arbcp3_cpxdp_qsel0_ca[5:0]),
		       .arbcp3_cpxdp_qsel1_ca_l(arbcp3_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp3_cpxdp_shift_cx(arbcp3_cpxdp_shift_cx[5:0]),
		       .arbcp4_cpxdp_grant_ca(arbcp4_cpxdp_grant_ca[5:0]),
		       .arbcp4_cpxdp_q0_hold_ca_l(arbcp4_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp4_cpxdp_qsel0_ca(arbcp4_cpxdp_qsel0_ca[5:0]),
		       .arbcp4_cpxdp_qsel1_ca_l(arbcp4_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp4_cpxdp_shift_cx(arbcp4_cpxdp_shift_cx[5:0]),
		       .arbcp5_cpxdp_grant_ca(arbcp5_cpxdp_grant_ca[5:0]),
		       .arbcp5_cpxdp_q0_hold_ca_l(arbcp5_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp5_cpxdp_qsel0_ca(arbcp5_cpxdp_qsel0_ca[5:0]),
		       .arbcp5_cpxdp_qsel1_ca_l(arbcp5_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp5_cpxdp_shift_cx(arbcp5_cpxdp_shift_cx[5:0]),
		       .arbcp6_cpxdp_grant_ca(arbcp6_cpxdp_grant_ca[5:0]),
		       .arbcp6_cpxdp_q0_hold_ca_l(arbcp6_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp6_cpxdp_qsel0_ca(arbcp6_cpxdp_qsel0_ca[5:0]),
		       .arbcp6_cpxdp_qsel1_ca_l(arbcp6_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp6_cpxdp_shift_cx(arbcp6_cpxdp_shift_cx[5:0]),
		       .arbcp7_cpxdp_grant_ca(arbcp7_cpxdp_grant_ca[5:0]),
		       .arbcp7_cpxdp_q0_hold_ca_l(arbcp7_cpxdp_q0_hold_ca_l[5:0]),
		       .arbcp7_cpxdp_qsel0_ca(arbcp7_cpxdp_qsel0_ca[5:0]),
		       .arbcp7_cpxdp_qsel1_ca_l(arbcp7_cpxdp_qsel1_ca_l[5:0]),
		       .arbcp7_cpxdp_shift_cx(arbcp7_cpxdp_shift_cx[5:0]),
		       .cpx_buf_top_pt0_so_1(cpx_buf_top_pt0_so_1),
		       .cpx_io_grant_cx2(cpx_io_grant_cx2[7:0]),
		       .cpx_scache0_grant_cx(cpx_sctag0_grant_cx[7:0]), // Templated
		       .cpx_scache1_grant_cx(cpx_sctag1_grant_cx[7:0]), // Templated
		       .cpx_scache2_grant_cx(cpx_sctag2_grant_cx[7:0]), // Templated
		       .cpx_scache3_grant_cx(cpx_sctag3_grant_cx[7:0]), // Templated
		       .cpx_spc0_data_cx2(cpx_spc0_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc0_data_rdy_cx2(cpx_spc0_data_rdy_cx2),
		       .cpx_spc1_data_cx2(cpx_spc1_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc1_data_rdy_cx2(cpx_spc1_data_rdy_cx2),
		       .cpx_spc2_data_cx2(cpx_spc2_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc2_data_rdy_cx2(cpx_spc2_data_rdy_cx2),
		       .cpx_spc3_data_cx2(cpx_spc3_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc3_data_rdy_cx2(cpx_spc3_data_rdy_cx2),
		       .cpx_spc4_data_cx2(cpx_spc4_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc4_data_rdy_cx2(cpx_spc4_data_rdy_cx2),
		       .cpx_spc5_data_cx2(cpx_spc5_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc5_data_rdy_cx2(cpx_spc5_data_rdy_cx2),
		       .cpx_spc6_data_cx2(cpx_spc6_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc6_data_rdy_cx2(cpx_spc6_data_rdy_cx2),
		       .cpx_spc7_data_cx2(cpx_spc7_data_cx2[`CPX_WIDTH-1:0]),
		       .cpx_spc7_data_rdy_cx2(cpx_spc7_data_rdy_cx2),
		       .fp_cpx_data_buf_ca(fp_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
		       .fp_cpx_req_bufp1_cq(fp_cpx_req_bufp1_cq[7:0]),
		       .io_cpx_data_buf1_ca2(io_cpx_data_buf1_ca2[`CPX_WIDTH-1:0]),
		       .io_cpx_req_buf1_io_cq(io_cpx_req_buf1_io_cq[7:0]),
		       .io_cpx_req_bufp3_cq(io_cpx_req_bufp3_cq[7:0]),
		       .pt1_so_1	(pt1_so_1),
		       .scache0_cpx_atom_bufp1_cq(scache0_cpx_atom_bufp1_cq),
		       .scache0_cpx_req_bufp1_cq(scache0_cpx_req_bufp1_cq[7:0]),
		       .scache1_cpx_atom_bufpm_cq(scache1_cpx_atom_bufpm_cq),
		       .scache1_cpx_req_bufpm_cq(scache1_cpx_req_bufpm_cq[7:0]),
		       .scache2_cpx_atom_bufpm_cq(scache2_cpx_atom_bufpm_cq),
		       .scache2_cpx_req_bufpm_cq(scache2_cpx_req_bufpm_cq[7:0]),
		       .scache3_cpx_atom_bufp3_cq(scache3_cpx_atom_bufp3_cq),
		       .scache3_cpx_req_bufp3_cq(scache3_cpx_req_bufp3_cq[7:0]),
		       .sctag0_cpx_data_buf_ca(sctag0_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
		       .sctag1_cpx_data_buf_ca(sctag1_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
		       .sctag2_cpx_data_buf_ca(sctag2_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
		       .sctag3_cpx_data_buf_ca(sctag3_cpx_data_buf_ca[`CPX_WIDTH-1:0]),
		       // Inputs
		       .arbcp0_cpxdp_grant_arbbf_ca(arbcp0_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp0_cpxdp_q0_hold_arbbf_ca_l(arbcp0_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp0_cpxdp_qsel0_arbbf_ca(arbcp0_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp0_cpxdp_qsel1_arbbf_ca_l(arbcp0_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp0_cpxdp_shift_arbbf_cx(arbcp0_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp1_cpxdp_grant_arbbf_ca(arbcp1_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp1_cpxdp_q0_hold_arbbf_ca_l(arbcp1_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp1_cpxdp_qsel0_arbbf_ca(arbcp1_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp1_cpxdp_qsel1_arbbf_ca_l(arbcp1_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp1_cpxdp_shift_arbbf_cx(arbcp1_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp2_cpxdp_grant_arbbf_ca(arbcp2_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp2_cpxdp_q0_hold_arbbf_ca_l(arbcp2_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp2_cpxdp_qsel0_arbbf_ca(arbcp2_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp2_cpxdp_qsel1_arbbf_ca_l(arbcp2_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp2_cpxdp_shift_arbbf_cx(arbcp2_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp3_cpxdp_grant_arbbf_ca(arbcp3_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp3_cpxdp_q0_hold_arbbf_ca_l(arbcp3_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp3_cpxdp_qsel0_arbbf_ca(arbcp3_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp3_cpxdp_qsel1_arbbf_ca_l(arbcp3_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp3_cpxdp_shift_arbbf_cx(arbcp3_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp4_cpxdp_grant_arbbf_ca(arbcp4_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp4_cpxdp_q0_hold_arbbf_ca_l(arbcp4_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp4_cpxdp_qsel0_arbbf_ca(arbcp4_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp4_cpxdp_qsel1_arbbf_ca_l(arbcp4_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp4_cpxdp_shift_arbbf_cx(arbcp4_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp5_cpxdp_grant_arbbf_ca(arbcp5_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp5_cpxdp_q0_hold_arbbf_ca_l(arbcp5_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp5_cpxdp_qsel0_arbbf_ca(arbcp5_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp5_cpxdp_qsel1_arbbf_ca_l(arbcp5_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp5_cpxdp_shift_arbbf_cx(arbcp5_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp6_cpxdp_grant_arbbf_ca(arbcp6_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp6_cpxdp_q0_hold_arbbf_ca_l(arbcp6_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp6_cpxdp_qsel0_arbbf_ca(arbcp6_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp6_cpxdp_qsel1_arbbf_ca_l(arbcp6_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp6_cpxdp_shift_arbbf_cx(arbcp6_cpxdp_shift_arbbf_cx[5:0]),
		       .arbcp7_cpxdp_grant_arbbf_ca(arbcp7_cpxdp_grant_arbbf_ca[5:0]),
		       .arbcp7_cpxdp_q0_hold_arbbf_ca_l(arbcp7_cpxdp_q0_hold_arbbf_ca[5:0]), // Templated
		       .arbcp7_cpxdp_qsel0_arbbf_ca(arbcp7_cpxdp_qsel0_arbbf_ca[5:0]),
		       .arbcp7_cpxdp_qsel1_arbbf_ca_l(arbcp7_cpxdp_qsel1_arbbf_ca[5:0]), // Templated
		       .arbcp7_cpxdp_shift_arbbf_cx(arbcp7_cpxdp_shift_arbbf_cx[5:0]),
		       .cpx_io_grant_ca	(cpx_io_grant_ca[7:0]),
		       .cpx_scache0_grant_ca(cpx_scache0_grant_ca[7:0]),
		       .cpx_scache1_grant_ca(cpx_scache1_grant_ca[7:0]),
		       .cpx_scache2_grant_ca(cpx_scache2_grant_ca[7:0]),
		       .cpx_scache3_grant_ca(cpx_scache3_grant_ca[7:0]),
		       .cpx_spc0_data_cx_l(cpx_spc0_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc0_data_rdy_cx(cpx_spc0_data_rdy_cx),
		       .cpx_spc1_data_cx_l(cpx_spc1_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc1_data_rdy_cx(cpx_spc1_data_rdy_cx),
		       .cpx_spc2_data_cx_l(cpx_spc2_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc2_data_rdy_cx(cpx_spc2_data_rdy_cx),
		       .cpx_spc3_data_cx_l(cpx_spc3_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc3_data_rdy_cx(cpx_spc3_data_rdy_cx),
		       .cpx_spc4_data_cx_l(cpx_spc4_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc4_data_rdy_cx(cpx_spc4_data_rdy_cx),
		       .cpx_spc5_data_cx_l(cpx_spc5_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc5_data_rdy_cx(cpx_spc5_data_rdy_cx),
		       .cpx_spc6_data_cx_l(cpx_spc6_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc6_data_rdy_cx(cpx_spc6_data_rdy_cx),
		       .cpx_spc7_data_cx_l(cpx_spc7_data_cx_l[`CPX_WIDTH-1:0]),
		       .cpx_spc7_data_rdy_cx(cpx_spc7_data_rdy_cx),
		       .fp_cpx_data_ca	(fp_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .fp_cpx_req_cq	(fp_cpx_req_cq[7:0]),
		       .io_cpx_data_ca	(io_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .io_cpx_req_cq	(io_cpx_req_cq[7:0]),
		       .pcx_scache2_dat_px2_so_1(pcx_scache2_dat_px2_so_1),
		       .rclk		(rclk),
		       .scache0_cpx_atom_cq(sctag0_cpx_atom_cq), // Templated
		       .scache0_cpx_req_cq(sctag0_cpx_req_cq[7:0]), // Templated
		       .scache1_cpx_atom_cq(sctag1_cpx_atom_cq), // Templated
		       .scache1_cpx_req_cq(sctag1_cpx_req_cq[7:0]), // Templated
		       .scache2_cpx_atom_cq(sctag2_cpx_atom_cq), // Templated
		       .scache2_cpx_req_cq(sctag2_cpx_req_cq[7:0]), // Templated
		       .scache3_cpx_atom_cq(sctag3_cpx_atom_cq), // Templated
		       .scache3_cpx_req_cq(sctag3_cpx_req_cq[7:0]), // Templated
		       .sctag0_cpx_data_ca(sctag0_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .sctag1_cpx_data_ca(sctag1_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .sctag2_cpx_data_ca(sctag2_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .sctag3_cpx_data_ca(sctag3_cpx_data_ca[`CPX_WIDTH-1:0]),
		       .se_buf0_middle	(se_buf0_middle),
		       .se_buf2_bottom	(se_buf2_bottom),
		       .se_buf2_top	(se_buf2_top),
		       .se_buf3_top	(se_buf3_top),
		       .se_buf4_bottom	(se_buf4_bottom),
		       .se_buf4_top	(se_buf4_top),
		       .si_1		(cpx_dp_half_array_even_so_1)); // Templated
endmodule