module outputs
  wire [4 : 0] select;
  // register arb_token
  reg [4 : 0] arb_token;
  wire [4 : 0] arb_token$D_IN;
  wire arb_token$EN;
  // remaining internal signals
  wire [1 : 0] ab__h1657,
	       ab__h1672,
	       ab__h1687,
	       ab__h1702,
	       ab__h1717,
	       ab__h3098,
	       ab__h3545,
	       ab__h3938,
	       ab__h4282,
	       ab__h4577;
  wire NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d48,
       NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d68,
       NOT_gen_grant_carry_2_BIT_1_4_0_AND_NOT_gen_gr_ETC___d66,
       NOT_gen_grant_carry_6_BIT_1_7_1_AND_NOT_gen_gr_ETC___d57,
       ab_BIT_0___h2269,
       ab_BIT_0___h2376,
       ab_BIT_0___h2483,
       ab_BIT_0___h2590,
       ab_BIT_0___h3169,
       ab_BIT_0___h3305,
       ab_BIT_0___h3698,
       ab_BIT_0___h4042,
       ab_BIT_0___h4337,
       arb_token_BIT_0___h2267,
       arb_token_BIT_1___h2374,
       arb_token_BIT_2___h2481,
       arb_token_BIT_3___h2588,
       arb_token_BIT_4___h2695;
  // value method select
  assign select =
	     { ab__h1657[1] || ab__h3098[1],
	       !ab__h1657[1] && !ab__h3098[1] &&
	       (ab__h1672[1] || ab__h3545[1]),
	       NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d48,
	       !ab__h1657[1] && !ab__h3098[1] &&
	       NOT_gen_grant_carry_6_BIT_1_7_1_AND_NOT_gen_gr_ETC___d57,
	       NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d68 } ;
  // register arb_token
  assign arb_token$D_IN = { arb_token[0], arb_token[4:1] } ;
  assign arb_token$EN = EN_next ;
  // remaining internal signals
  module_gen_grant_carry instance_gen_grant_carry_9(.gen_grant_carry_c(1'd0),
						    .gen_grant_carry_r(select_requests[0]),
						    .gen_grant_carry_p(arb_token_BIT_0___h2267),
						    .gen_grant_carry(ab__h1717));
  module_gen_grant_carry instance_gen_grant_carry_1(.gen_grant_carry_c(ab_BIT_0___h2269),
						    .gen_grant_carry_r(select_requests[1]),
						    .gen_grant_carry_p(arb_token_BIT_1___h2374),
						    .gen_grant_carry(ab__h1702));
  module_gen_grant_carry instance_gen_grant_carry_0(.gen_grant_carry_c(ab_BIT_0___h2376),
						    .gen_grant_carry_r(select_requests[2]),
						    .gen_grant_carry_p(arb_token_BIT_2___h2481),
						    .gen_grant_carry(ab__h1687));
  module_gen_grant_carry instance_gen_grant_carry_2(.gen_grant_carry_c(ab_BIT_0___h2483),
						    .gen_grant_carry_r(select_requests[3]),
						    .gen_grant_carry_p(arb_token_BIT_3___h2588),
						    .gen_grant_carry(ab__h1672));
  module_gen_grant_carry instance_gen_grant_carry_3(.gen_grant_carry_c(ab_BIT_0___h2590),
						    .gen_grant_carry_r(select_requests[4]),
						    .gen_grant_carry_p(arb_token_BIT_4___h2695),
						    .gen_grant_carry(ab__h1657));
  module_gen_grant_carry instance_gen_grant_carry_4(.gen_grant_carry_c(ab_BIT_0___h3169),
						    .gen_grant_carry_r(select_requests[0]),
						    .gen_grant_carry_p(arb_token_BIT_0___h2267),
						    .gen_grant_carry(ab__h4577));
  module_gen_grant_carry instance_gen_grant_carry_5(.gen_grant_carry_c(ab_BIT_0___h4337),
						    .gen_grant_carry_r(select_requests[1]),
						    .gen_grant_carry_p(arb_token_BIT_1___h2374),
						    .gen_grant_carry(ab__h4282));
  module_gen_grant_carry instance_gen_grant_carry_6(.gen_grant_carry_c(ab_BIT_0___h4042),
						    .gen_grant_carry_r(select_requests[2]),
						    .gen_grant_carry_p(arb_token_BIT_2___h2481),
						    .gen_grant_carry(ab__h3938));
  module_gen_grant_carry instance_gen_grant_carry_7(.gen_grant_carry_c(ab_BIT_0___h3698),
						    .gen_grant_carry_r(select_requests[3]),
						    .gen_grant_carry_p(arb_token_BIT_3___h2588),
						    .gen_grant_carry(ab__h3545));
  module_gen_grant_carry instance_gen_grant_carry_8(.gen_grant_carry_c(ab_BIT_0___h3305),
						    .gen_grant_carry_r(select_requests[4]),
						    .gen_grant_carry_p(arb_token_BIT_4___h2695),
						    .gen_grant_carry(ab__h3098));
  assign NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d48 =
	     !ab__h1657[1] && !ab__h3098[1] && !ab__h1672[1] &&
	     !ab__h3545[1] &&
	     (ab__h1687[1] || ab__h3938[1]) ;
  assign NOT_gen_grant_carry_0_BIT_1_1_4_AND_NOT_gen_gr_ETC___d68 =
	     !ab__h1657[1] && !ab__h3098[1] && !ab__h1672[1] &&
	     !ab__h3545[1] &&
	     NOT_gen_grant_carry_2_BIT_1_4_0_AND_NOT_gen_gr_ETC___d66 ;
  assign NOT_gen_grant_carry_2_BIT_1_4_0_AND_NOT_gen_gr_ETC___d66 =
	     !ab__h1687[1] && !ab__h3938[1] && !ab__h1702[1] &&
	     !ab__h4282[1] &&
	     (ab__h1717[1] || ab__h4577[1]) ;
  assign NOT_gen_grant_carry_6_BIT_1_7_1_AND_NOT_gen_gr_ETC___d57 =
	     !ab__h1672[1] && !ab__h3545[1] && !ab__h1687[1] &&
	     !ab__h3938[1] &&
	     (ab__h1702[1] || ab__h4282[1]) ;
  assign ab_BIT_0___h2269 = ab__h1717[0] ;
  assign ab_BIT_0___h2376 = ab__h1702[0] ;
  assign ab_BIT_0___h2483 = ab__h1687[0] ;
  assign ab_BIT_0___h2590 = ab__h1672[0] ;
  assign ab_BIT_0___h3169 = ab__h1657[0] ;
  assign ab_BIT_0___h3305 = ab__h3545[0] ;
  assign ab_BIT_0___h3698 = ab__h3938[0] ;
  assign ab_BIT_0___h4042 = ab__h4282[0] ;
  assign ab_BIT_0___h4337 = ab__h4577[0] ;
  assign arb_token_BIT_0___h2267 = arb_token[0] ;
  assign arb_token_BIT_1___h2374 = arb_token[1] ;
  assign arb_token_BIT_2___h2481 = arb_token[2] ;
  assign arb_token_BIT_3___h2588 = arb_token[3] ;
  assign arb_token_BIT_4___h2695 = arb_token[4] ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        arb_token <= `BSV_ASSIGNMENT_DELAY 5'd1;
      end
    else
      begin
        if (arb_token$EN) arb_token <= `BSV_ASSIGNMENT_DELAY arb_token$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    arb_token = 5'h0A;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule