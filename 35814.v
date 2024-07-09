module outputs)
   wire [7:0]		arbctl_atom;		// From arbctl of ccx_arbctl.v
   wire			ccx_dest_atom_a;	// From arbdp of ccx_arbdp.v
   wire			ccx_dest_data_rdy_a;	// From arbdp of ccx_arbdp.v
   wire			current_req_sel;	// From arbctl of ccx_arbctl.v
   wire			direction;		// From arbctl of ccx_arbctl.v
   wire			fifo_bypass;		// From arbctl of ccx_arbctl.v
   wire			fifo_bypass_l;		// From arbctl of ccx_arbctl.v
   wire			fifo_req_sel;		// From arbctl of ccx_arbctl.v
   wire			fifo_sel11_8;		// From arbctl of ccx_arbctl.v
   wire			fifo_sel15_12;		// From arbctl of ccx_arbctl.v
   wire			fifo_sel3_0;		// From arbctl of ccx_arbctl.v
   wire			fifo_sel7_4;		// From arbctl of ccx_arbctl.v
   wire			fifo_valid;		// From arbctl of ccx_arbctl.v
   wire [7:0]		grant_a;		// From arbdp of ccx_arbdp.v
   wire			input_req_sel;		// From arbctl of ccx_arbctl.v
   wire			input_req_sel_d1;	// From arbctl of ccx_arbctl.v
   wire			inreg_req_vld_d1;	// From arbdp of ccx_arbdp.v
   wire [7:0]		qfull;			// From arbctl of ccx_arbctl.v
   wire [15:0]		rdptr;			// From arbctl of ccx_arbctl.v
   wire			req_pkt_empty;		// From arbdp of ccx_arbdp.v
   wire			reset_d1;		// From arbctl of ccx_arbctl.v
   wire			stall_a;		// From arbctl of ccx_arbctl.v
   wire [15:0]		wrptr_l;		// From arbctl of ccx_arbctl.v
   // End of automatics
       ccx_arbctl arbctl(/*AUTOINST*/
			 // Outputs
			 .reset_d1	(reset_d1),
			 .direction	(direction),
			 .wrptr_l	(wrptr_l[15:0]),
			 .rdptr		(rdptr[15:0]),
			 .fifo_sel15_12	(fifo_sel15_12),
			 .fifo_sel11_8	(fifo_sel11_8),
			 .fifo_sel7_4	(fifo_sel7_4),
			 .fifo_sel3_0	(fifo_sel3_0),
			 .fifo_bypass	(fifo_bypass),
			 .fifo_bypass_l	(fifo_bypass_l),
			 .fifo_valid	(fifo_valid),
			 .qfull		(qfull[7:0]),
			 .input_req_sel	(input_req_sel),
			 .input_req_sel_d1(input_req_sel_d1),
			 .fifo_req_sel	(fifo_req_sel),
			 .current_req_sel(current_req_sel),
			 .stall_a	(stall_a),
			 .ccx_dest_data_rdy_x(ccx_dest_data_rdy_x),
			 .ccx_dest_atom_x(ccx_dest_atom_x),
			 .arb_dp_q0_hold_a(arb_dp_q0_hold_a[7:0]),
			 .arb_dp_qsel0_a(arb_dp_qsel0_a[7:0]),
			 .arb_dp_qsel1_a(arb_dp_qsel1_a[7:0]),
			 .arb_dp_shift_x(arb_dp_shift_x[7:0]),
			 .arbctl_atom	(arbctl_atom[7:0]),
			 .scan_out	(scan_out),
			 // Inputs
			 .src7_arb_atom_q(src7_arb_atom_q),
			 .src6_arb_atom_q(src6_arb_atom_q),
			 .src5_arb_atom_q(src5_arb_atom_q),
			 .src4_arb_atom_q(src4_arb_atom_q),
			 .src3_arb_atom_q(src3_arb_atom_q),
			 .src2_arb_atom_q(src2_arb_atom_q),
			 .src1_arb_atom_q(src1_arb_atom_q),
			 .src0_arb_atom_q(src0_arb_atom_q),
			 .src7_arb_req_q(src7_arb_req_q),
			 .src6_arb_req_q(src6_arb_req_q),
			 .src5_arb_req_q(src5_arb_req_q),
			 .src4_arb_req_q(src4_arb_req_q),
			 .src3_arb_req_q(src3_arb_req_q),
			 .src2_arb_req_q(src2_arb_req_q),
			 .src1_arb_req_q(src1_arb_req_q),
			 .src0_arb_req_q(src0_arb_req_q),
			 .stall1_q	(stall1_q),
			 .stall2_q	(stall2_q),
			 .ccx_dest_data_rdy_a(ccx_dest_data_rdy_a),
			 .ccx_dest_atom_a(ccx_dest_atom_a),
			 .grant_a	(grant_a[7:0]),
			 .req_pkt_empty	(req_pkt_empty),
			 .inreg_req_vld_d1(inreg_req_vld_d1),
			 .reset_l	(reset_l),
			 .rclk		(rclk),
			 .adbginit_l	(adbginit_l),
			 .se		(se));
       ccx_arbdp arbdp(/*AUTOINST*/
		       // Outputs
		       .arb_dp_grant_a	(arb_dp_grant_a[7:0]),
		       .arb_src7_grant_a(arb_src7_grant_a),
		       .arb_src6_grant_a(arb_src6_grant_a),
		       .arb_src5_grant_a(arb_src5_grant_a),
		       .arb_src4_grant_a(arb_src4_grant_a),
		       .arb_src3_grant_a(arb_src3_grant_a),
		       .arb_src2_grant_a(arb_src2_grant_a),
		       .arb_src1_grant_a(arb_src1_grant_a),
		       .arb_src0_grant_a(arb_src0_grant_a),
		       .ccx_dest_data_rdy_a(ccx_dest_data_rdy_a),
		       .ccx_dest_atom_a	(ccx_dest_atom_a),
		       .req_pkt_empty	(req_pkt_empty),
		       .grant_a		(grant_a[7:0]),
		       .inreg_req_vld_d1(inreg_req_vld_d1),
		       // Inputs
		       .src7_arb_atom_q	(src7_arb_atom_q),
		       .src6_arb_atom_q	(src6_arb_atom_q),
		       .src5_arb_atom_q	(src5_arb_atom_q),
		       .src4_arb_atom_q	(src4_arb_atom_q),
		       .src3_arb_atom_q	(src3_arb_atom_q),
		       .src2_arb_atom_q	(src2_arb_atom_q),
		       .src1_arb_atom_q	(src1_arb_atom_q),
		       .src0_arb_atom_q	(src0_arb_atom_q),
		       .src7_arb_req_q	(src7_arb_req_q),
		       .src6_arb_req_q	(src6_arb_req_q),
		       .src5_arb_req_q	(src5_arb_req_q),
		       .src4_arb_req_q	(src4_arb_req_q),
		       .src3_arb_req_q	(src3_arb_req_q),
		       .src2_arb_req_q	(src2_arb_req_q),
		       .src1_arb_req_q	(src1_arb_req_q),
		       .src0_arb_req_q	(src0_arb_req_q),
		       .reset_d1	(reset_d1),
		       .qfull		(qfull[7:0]),
		       .direction	(direction),
		       .stall_a		(stall_a),
		       .fifo_req_sel	(fifo_req_sel),
		       .current_req_sel	(current_req_sel),
		       .input_req_sel	(input_req_sel),
		       .input_req_sel_d1(input_req_sel_d1),
		       .fifo_bypass	(fifo_bypass),
		       .fifo_bypass_l	(fifo_bypass_l),
		       .wrptr_l		(wrptr_l[15:0]),
		       .rdptr		(rdptr[15:0]),
		       .fifo_sel15_12	(fifo_sel15_12),
		       .fifo_sel11_8	(fifo_sel11_8),
		       .fifo_sel7_4	(fifo_sel7_4),
		       .fifo_sel3_0	(fifo_sel3_0),
		       .fifo_valid	(fifo_valid),
		       .arbctl_atom	(arbctl_atom[7:0]),
		       .rclk		(rclk),
		       .se		(se));
endmodule