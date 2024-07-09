module outputs
  wire [152 : 0] c0_request_get, c1_request_get, s_response_get;
  wire RDY_c0_request_get,
       RDY_c0_response_put,
       RDY_c1_request_get,
       RDY_c1_response_put,
       RDY_s_request_put,
       RDY_s_response_get;
  // ports of submodule pktFork
  wire [152 : 0] pktFork_iport_put, pktFork_oport0_get, pktFork_oport1_get;
  wire pktFork_EN_iport_put,
       pktFork_EN_oport0_get,
       pktFork_EN_oport1_get,
       pktFork_RDY_iport_put,
       pktFork_RDY_oport0_get,
       pktFork_RDY_oport1_get;
  // ports of submodule pktMerge
  wire [152 : 0] pktMerge_iport0_put, pktMerge_iport1_put, pktMerge_oport_get;
  wire pktMerge_EN_iport0_put,
       pktMerge_EN_iport1_put,
       pktMerge_EN_oport_get,
       pktMerge_RDY_iport0_put,
       pktMerge_RDY_iport1_put,
       pktMerge_RDY_oport_get;
  // remaining internal signals
  reg [1 : 0] CASE_pfk_BITS_13_TO_12_0_pfk_BITS_13_TO_12_1_p_ETC__q1;
  wire [13 : 0] x__h110;
  // action method s_request_put
  assign RDY_s_request_put = pktFork_RDY_iport_put ;
  // actionvalue method s_response_get
  assign s_response_get = pktMerge_oport_get ;
  assign RDY_s_response_get = pktMerge_RDY_oport_get ;
  // actionvalue method c0_request_get
  assign c0_request_get = pktFork_oport0_get ;
  assign RDY_c0_request_get = pktFork_RDY_oport0_get ;
  // action method c0_response_put
  assign RDY_c0_response_put = pktMerge_RDY_iport0_put ;
  // actionvalue method c1_request_get
  assign c1_request_get = pktFork_oport1_get ;
  assign RDY_c1_request_get = pktFork_RDY_oport1_get ;
  // action method c1_response_put
  assign RDY_c1_response_put = pktMerge_RDY_iport1_put ;
  // submodule pktFork
  mkPktFork pktFork(.pfk(x__h110),
		    .CLK(CLK),
		    .RST_N(RST_N),
		    .iport_put(pktFork_iport_put),
		    .EN_iport_put(pktFork_EN_iport_put),
		    .EN_oport0_get(pktFork_EN_oport0_get),
		    .EN_oport1_get(pktFork_EN_oport1_get),
		    .RDY_iport_put(pktFork_RDY_iport_put),
		    .oport0_get(pktFork_oport0_get),
		    .RDY_oport0_get(pktFork_RDY_oport0_get),
		    .oport1_get(pktFork_oport1_get),
		    .RDY_oport1_get(pktFork_RDY_oport1_get));
  // submodule pktMerge
  mkPktMerge pktMerge(.CLK(CLK),
		      .RST_N(RST_N),
		      .iport0_put(pktMerge_iport0_put),
		      .iport1_put(pktMerge_iport1_put),
		      .EN_iport0_put(pktMerge_EN_iport0_put),
		      .EN_iport1_put(pktMerge_EN_iport1_put),
		      .EN_oport_get(pktMerge_EN_oport_get),
		      .RDY_iport0_put(pktMerge_RDY_iport0_put),
		      .RDY_iport1_put(pktMerge_RDY_iport1_put),
		      .oport_get(pktMerge_oport_get),
		      .RDY_oport_get(pktMerge_RDY_oport_get));
  // submodule pktFork
  assign pktFork_iport_put = s_request_put ;
  assign pktFork_EN_iport_put = EN_s_request_put ;
  assign pktFork_EN_oport0_get = EN_c0_request_get ;
  assign pktFork_EN_oport1_get = EN_c1_request_get ;
  // submodule pktMerge
  assign pktMerge_iport0_put = c0_response_put ;
  assign pktMerge_iport1_put = c1_response_put ;
  assign pktMerge_EN_iport0_put = EN_c0_response_put ;
  assign pktMerge_EN_iport1_put = EN_c1_response_put ;
  assign pktMerge_EN_oport_get = EN_s_response_get ;
  // remaining internal signals
  assign x__h110 =
	     { CASE_pfk_BITS_13_TO_12_0_pfk_BITS_13_TO_12_1_p_ETC__q1,
	       pfk[11:0] } ;
  always@(pfk)
  begin
    case (pfk[13:12])
      2'd0, 2'd1, 2'd2:
	  CASE_pfk_BITS_13_TO_12_0_pfk_BITS_13_TO_12_1_p_ETC__q1 = pfk[13:12];
      2'd3: CASE_pfk_BITS_13_TO_12_0_pfk_BITS_13_TO_12_1_p_ETC__q1 = 2'd3;
    endcase
  end
endmodule