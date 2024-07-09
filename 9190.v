module outputs
  wire [4 : 0] input_arbs_0_select,
	       input_arbs_1_select,
	       input_arbs_2_select,
	       input_arbs_3_select,
	       input_arbs_4_select;
  // value method input_arbs_0_select
  assign input_arbs_0_select =
	     { input_arbs_0_select_requests[4],
	       !input_arbs_0_select_requests[4] &&
	       input_arbs_0_select_requests[3],
	       !input_arbs_0_select_requests[4] &&
	       !input_arbs_0_select_requests[3] &&
	       input_arbs_0_select_requests[2],
	       !input_arbs_0_select_requests[4] &&
	       !input_arbs_0_select_requests[3] &&
	       !input_arbs_0_select_requests[2] &&
	       input_arbs_0_select_requests[1],
	       !input_arbs_0_select_requests[4] &&
	       !input_arbs_0_select_requests[3] &&
	       !input_arbs_0_select_requests[2] &&
	       !input_arbs_0_select_requests[1] &&
	       input_arbs_0_select_requests[0] } ;
  // value method input_arbs_1_select
  assign input_arbs_1_select =
	     { !input_arbs_1_select_requests[0] &&
	       input_arbs_1_select_requests[4],
	       !input_arbs_1_select_requests[0] &&
	       !input_arbs_1_select_requests[4] &&
	       input_arbs_1_select_requests[3],
	       !input_arbs_1_select_requests[0] &&
	       !input_arbs_1_select_requests[4] &&
	       !input_arbs_1_select_requests[3] &&
	       input_arbs_1_select_requests[2],
	       !input_arbs_1_select_requests[0] &&
	       !input_arbs_1_select_requests[4] &&
	       !input_arbs_1_select_requests[3] &&
	       !input_arbs_1_select_requests[2] &&
	       input_arbs_1_select_requests[1],
	       input_arbs_1_select_requests[0] } ;
  // value method input_arbs_2_select
  assign input_arbs_2_select =
	     { !input_arbs_2_select_requests[1] &&
	       !input_arbs_2_select_requests[0] &&
	       input_arbs_2_select_requests[4],
	       !input_arbs_2_select_requests[1] &&
	       !input_arbs_2_select_requests[0] &&
	       !input_arbs_2_select_requests[4] &&
	       input_arbs_2_select_requests[3],
	       !input_arbs_2_select_requests[1] &&
	       !input_arbs_2_select_requests[0] &&
	       !input_arbs_2_select_requests[4] &&
	       !input_arbs_2_select_requests[3] &&
	       input_arbs_2_select_requests[2],
	       input_arbs_2_select_requests[1],
	       !input_arbs_2_select_requests[1] &&
	       input_arbs_2_select_requests[0] } ;
  // value method input_arbs_3_select
  assign input_arbs_3_select =
	     { !input_arbs_3_select_requests[2] &&
	       !input_arbs_3_select_requests[1] &&
	       !input_arbs_3_select_requests[0] &&
	       input_arbs_3_select_requests[4],
	       !input_arbs_3_select_requests[2] &&
	       !input_arbs_3_select_requests[1] &&
	       !input_arbs_3_select_requests[0] &&
	       !input_arbs_3_select_requests[4] &&
	       input_arbs_3_select_requests[3],
	       input_arbs_3_select_requests[2],
	       !input_arbs_3_select_requests[2] &&
	       input_arbs_3_select_requests[1],
	       !input_arbs_3_select_requests[2] &&
	       !input_arbs_3_select_requests[1] &&
	       input_arbs_3_select_requests[0] } ;
  // value method input_arbs_4_select
  assign input_arbs_4_select =
	     { !input_arbs_4_select_requests[3] &&
	       !input_arbs_4_select_requests[2] &&
	       !input_arbs_4_select_requests[1] &&
	       !input_arbs_4_select_requests[0] &&
	       input_arbs_4_select_requests[4],
	       input_arbs_4_select_requests[3],
	       !input_arbs_4_select_requests[3] &&
	       input_arbs_4_select_requests[2],
	       !input_arbs_4_select_requests[3] &&
	       !input_arbs_4_select_requests[2] &&
	       input_arbs_4_select_requests[1],
	       !input_arbs_4_select_requests[3] &&
	       !input_arbs_4_select_requests[2] &&
	       !input_arbs_4_select_requests[1] &&
	       input_arbs_4_select_requests[0] } ;
endmodule