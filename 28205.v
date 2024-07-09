module outputs
  wire [63 : 0] word_fst;
  wire [4 : 0] word_snd;
  wire RDY_server_reset_request_put, RDY_server_reset_response_get, valid;
  // ports of submodule fbox_core
  wire [63 : 0] fbox_core$req_v1,
		fbox_core$req_v2,
		fbox_core$req_v3,
		fbox_core$word_fst;
  wire [6 : 0] fbox_core$req_f7, fbox_core$req_opcode;
  wire [4 : 0] fbox_core$req_rs2, fbox_core$word_snd;
  wire [2 : 0] fbox_core$req_rm;
  wire fbox_core$EN_req,
       fbox_core$EN_server_reset_request_put,
       fbox_core$EN_server_reset_response_get,
       fbox_core$RDY_server_reset_request_put,
       fbox_core$RDY_server_reset_response_get,
       fbox_core$valid;
  // rule scheduling signals
  wire CAN_FIRE_req,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       WILL_FIRE_req,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put =
	     fbox_core$RDY_server_reset_request_put ;
  assign CAN_FIRE_server_reset_request_put =
	     fbox_core$RDY_server_reset_request_put ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get =
	     fbox_core$RDY_server_reset_response_get ;
  assign CAN_FIRE_server_reset_response_get =
	     fbox_core$RDY_server_reset_response_get ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method req
  assign CAN_FIRE_req = 1'd1 ;
  assign WILL_FIRE_req = EN_req ;
  // value method valid
  assign valid = fbox_core$valid ;
  // value method word_fst
  assign word_fst = fbox_core$word_fst ;
  // value method word_snd
  assign word_snd = fbox_core$word_snd ;
  // submodule fbox_core
  mkFBox_Core fbox_core(.verbosity(verbosity),
			.CLK(CLK),
			.RST_N(RST_N),
			.req_f7(fbox_core$req_f7),
			.req_opcode(fbox_core$req_opcode),
			.req_rm(fbox_core$req_rm),
			.req_rs2(fbox_core$req_rs2),
			.req_v1(fbox_core$req_v1),
			.req_v2(fbox_core$req_v2),
			.req_v3(fbox_core$req_v3),
			.EN_server_reset_request_put(fbox_core$EN_server_reset_request_put),
			.EN_server_reset_response_get(fbox_core$EN_server_reset_response_get),
			.EN_req(fbox_core$EN_req),
			.RDY_server_reset_request_put(fbox_core$RDY_server_reset_request_put),
			.RDY_server_reset_response_get(fbox_core$RDY_server_reset_response_get),
			.valid(fbox_core$valid),
			.word_fst(fbox_core$word_fst),
			.word_snd(fbox_core$word_snd));
  // submodule fbox_core
  assign fbox_core$req_f7 = req_f7 ;
  assign fbox_core$req_opcode = req_opcode ;
  assign fbox_core$req_rm = req_rm ;
  assign fbox_core$req_rs2 = req_rs2 ;
  assign fbox_core$req_v1 = req_v1 ;
  assign fbox_core$req_v2 = req_v2 ;
  assign fbox_core$req_v3 = req_v3 ;
  assign fbox_core$EN_server_reset_request_put = EN_server_reset_request_put ;
  assign fbox_core$EN_server_reset_response_get =
	     EN_server_reset_response_get ;
  assign fbox_core$EN_req = EN_req ;
endmodule