module outputs)
   // End of automatics
   assign  src6_arb_atom_q = 1'b0;
   assign  src6_arb_req_q = 1'b0;
   assign  src7_arb_atom_q = 1'b0;
   assign  src7_arb_req_q = 1'b0;
   assign  stall1_q = 1'b0;
   assign  stall2_q = 1'b0;
// commented out - backend does not like this
//   sink #(2) sink1(.in (sinka[1:0]));
//   sink #(2) sink2(.in (sinkb[1:0]));
//   sink #(2) sink3(.in (sinkc[1:0]));
//   sink #(2) sink4(.in (sinkd[1:0]));
//   sink #(2) sink5(.in (sinke[1:0]));
/*
  ccx_arb AUTO_TEMPLATE(
		   .ccx_dest_atom_x	(),
		   .arb_dp_grant_a	({sinka[0], sinka[1],arb_dp_grant_a[5:0]}),
		   .arb_dp_q0_hold_a	({sinkb[0], sinkb[1],arb_dp_q0_hold_a[5:0]}),
		   .arb_dp_qsel0_a	({sinkc[0], sinkc[1],arb_dp_qsel0_a[5:0]}),
		   .arb_dp_qsel1_a	({sinkd[0], sinkd[1],arb_dp_qsel1_a[5:0]}),
		   .arb_dp_shift_x	({sinke[0], sinke[1],arb_dp_shift_x[5:0]}),
		   .arb_src6_grant_a	(),
		   .arb_src7_grant_a	());
 */
   ccx_arb ccx_arb(/*AUTOINST*/
		   // Outputs
		   .arb_dp_grant_a	({sinka[0], sinka[1],arb_dp_grant_a[5:0]}), // Templated
		   .arb_dp_q0_hold_a	({sinkb[0], sinkb[1],arb_dp_q0_hold_a[5:0]}), // Templated
		   .arb_dp_qsel0_a	({sinkc[0], sinkc[1],arb_dp_qsel0_a[5:0]}), // Templated
		   .arb_dp_qsel1_a	({sinkd[0], sinkd[1],arb_dp_qsel1_a[5:0]}), // Templated
		   .arb_dp_shift_x	({sinke[0], sinke[1],arb_dp_shift_x[5:0]}), // Templated
		   .arb_src0_grant_a	(arb_src0_grant_a),
		   .arb_src1_grant_a	(arb_src1_grant_a),
		   .arb_src2_grant_a	(arb_src2_grant_a),
		   .arb_src3_grant_a	(arb_src3_grant_a),
		   .arb_src4_grant_a	(arb_src4_grant_a),
		   .arb_src5_grant_a	(arb_src5_grant_a),
		   .arb_src6_grant_a	(),			 // Templated
		   .arb_src7_grant_a	(),			 // Templated
		   .ccx_dest_atom_x	(),			 // Templated
		   .ccx_dest_data_rdy_x	(ccx_dest_data_rdy_x),
		   .scan_out		(scan_out),
		   // Inputs
		   .adbginit_l		(adbginit_l),
		   .rclk		(rclk),
		   .reset_l		(reset_l),
		   .src0_arb_atom_q	(src0_arb_atom_q),
		   .src0_arb_req_q	(src0_arb_req_q),
		   .src1_arb_atom_q	(src1_arb_atom_q),
		   .src1_arb_req_q	(src1_arb_req_q),
		   .src2_arb_atom_q	(src2_arb_atom_q),
		   .src2_arb_req_q	(src2_arb_req_q),
		   .src3_arb_atom_q	(src3_arb_atom_q),
		   .src3_arb_req_q	(src3_arb_req_q),
		   .src4_arb_atom_q	(src4_arb_atom_q),
		   .src4_arb_req_q	(src4_arb_req_q),
		   .src5_arb_atom_q	(src5_arb_atom_q),
		   .src5_arb_req_q	(src5_arb_req_q),
		   .src6_arb_atom_q	(src6_arb_atom_q),
		   .src6_arb_req_q	(src6_arb_req_q),
		   .src7_arb_atom_q	(src7_arb_atom_q),
		   .src7_arb_req_q	(src7_arb_req_q),
		   .stall1_q		(stall1_q),
		   .stall2_q		(stall2_q),
		   .scan_in		(scan_in),
		   .se			(se));
endmodule