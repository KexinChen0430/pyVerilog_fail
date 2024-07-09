module outputs
  wire [4 : 0] output_arbs_0_select,
	       output_arbs_1_select,
	       output_arbs_2_select,
	       output_arbs_3_select,
	       output_arbs_4_select;
  // value method output_arbs_0_select
  assign output_arbs_0_select =
	     { output_arbs_0_select_requests[4],
	       !output_arbs_0_select_requests[4] &&
	       output_arbs_0_select_requests[3],
	       !output_arbs_0_select_requests[4] &&
	       !output_arbs_0_select_requests[3] &&
	       output_arbs_0_select_requests[2],
	       !output_arbs_0_select_requests[4] &&
	       !output_arbs_0_select_requests[3] &&
	       !output_arbs_0_select_requests[2] &&
	       output_arbs_0_select_requests[1],
	       !output_arbs_0_select_requests[4] &&
	       !output_arbs_0_select_requests[3] &&
	       !output_arbs_0_select_requests[2] &&
	       !output_arbs_0_select_requests[1] &&
	       output_arbs_0_select_requests[0] } ;
  // value method output_arbs_1_select
  assign output_arbs_1_select =
	     { !output_arbs_1_select_requests[0] &&
	       output_arbs_1_select_requests[4],
	       !output_arbs_1_select_requests[0] &&
	       !output_arbs_1_select_requests[4] &&
	       output_arbs_1_select_requests[3],
	       !output_arbs_1_select_requests[0] &&
	       !output_arbs_1_select_requests[4] &&
	       !output_arbs_1_select_requests[3] &&
	       output_arbs_1_select_requests[2],
	       !output_arbs_1_select_requests[0] &&
	       !output_arbs_1_select_requests[4] &&
	       !output_arbs_1_select_requests[3] &&
	       !output_arbs_1_select_requests[2] &&
	       output_arbs_1_select_requests[1],
	       output_arbs_1_select_requests[0] } ;
  // value method output_arbs_2_select
  assign output_arbs_2_select =
	     { !output_arbs_2_select_requests[1] &&
	       !output_arbs_2_select_requests[0] &&
	       output_arbs_2_select_requests[4],
	       !output_arbs_2_select_requests[1] &&
	       !output_arbs_2_select_requests[0] &&
	       !output_arbs_2_select_requests[4] &&
	       output_arbs_2_select_requests[3],
	       !output_arbs_2_select_requests[1] &&
	       !output_arbs_2_select_requests[0] &&
	       !output_arbs_2_select_requests[4] &&
	       !output_arbs_2_select_requests[3] &&
	       output_arbs_2_select_requests[2],
	       output_arbs_2_select_requests[1],
	       !output_arbs_2_select_requests[1] &&
	       output_arbs_2_select_requests[0] } ;
  // value method output_arbs_3_select
  assign output_arbs_3_select =
	     { !output_arbs_3_select_requests[2] &&
	       !output_arbs_3_select_requests[1] &&
	       !output_arbs_3_select_requests[0] &&
	       output_arbs_3_select_requests[4],
	       !output_arbs_3_select_requests[2] &&
	       !output_arbs_3_select_requests[1] &&
	       !output_arbs_3_select_requests[0] &&
	       !output_arbs_3_select_requests[4] &&
	       output_arbs_3_select_requests[3],
	       output_arbs_3_select_requests[2],
	       !output_arbs_3_select_requests[2] &&
	       output_arbs_3_select_requests[1],
	       !output_arbs_3_select_requests[2] &&
	       !output_arbs_3_select_requests[1] &&
	       output_arbs_3_select_requests[0] } ;
  // value method output_arbs_4_select
  assign output_arbs_4_select =
	     { !output_arbs_4_select_requests[3] &&
	       !output_arbs_4_select_requests[2] &&
	       !output_arbs_4_select_requests[1] &&
	       !output_arbs_4_select_requests[0] &&
	       output_arbs_4_select_requests[4],
	       output_arbs_4_select_requests[3],
	       !output_arbs_4_select_requests[3] &&
	       output_arbs_4_select_requests[2],
	       !output_arbs_4_select_requests[3] &&
	       !output_arbs_4_select_requests[2] &&
	       output_arbs_4_select_requests[1],
	       !output_arbs_4_select_requests[3] &&
	       !output_arbs_4_select_requests[2] &&
	       !output_arbs_4_select_requests[1] &&
	       output_arbs_4_select_requests[0] } ;
endmodule