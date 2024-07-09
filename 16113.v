module mkTop_HW_Side(CLK,
		     RST_N);
  input  CLK;
  input  RST_N;
  // register rg_banner_printed
  reg rg_banner_printed;
  wire rg_banner_printed$D_IN, rg_banner_printed$EN;
  // register rg_console_in_poll
  reg [11 : 0] rg_console_in_poll;
  wire [11 : 0] rg_console_in_poll$D_IN;
  wire rg_console_in_poll$EN;
  // ports of submodule mem_model
  wire [352 : 0] mem_model$mem_server_request_put;
  wire [255 : 0] mem_model$mem_server_response_get;
  wire mem_model$EN_mem_server_request_put,
       mem_model$EN_mem_server_response_get,
       mem_model$RDY_mem_server_request_put,
       mem_model$RDY_mem_server_response_get;
  // ports of submodule soc_top
  wire [352 : 0] soc_top$to_raw_mem_request_get;
  wire [255 : 0] soc_top$to_raw_mem_response_put;
  wire [63 : 0] soc_top$set_verbosity_logdelay,
		soc_top$set_watch_tohost_tohost_addr;
  wire [7 : 0] soc_top$get_to_console_get,
	       soc_top$put_from_console_put,
	       soc_top$status;
  wire [3 : 0] soc_top$set_verbosity_verbosity;
  wire soc_top$EN_get_to_console_get,
       soc_top$EN_put_from_console_put,
       soc_top$EN_set_verbosity,
       soc_top$EN_set_watch_tohost,
       soc_top$EN_to_raw_mem_request_get,
       soc_top$EN_to_raw_mem_response_put,
       soc_top$RDY_get_to_console_get,
       soc_top$RDY_put_from_console_put,
       soc_top$RDY_to_raw_mem_request_get,
       soc_top$RDY_to_raw_mem_response_put,
       soc_top$set_watch_tohost_watch_tohost;
  // rule scheduling signals
  wire CAN_FIRE_RL_memCnx_ClientServerRequest,
       CAN_FIRE_RL_memCnx_ClientServerResponse,
       CAN_FIRE_RL_rl_relay_console_in,
       CAN_FIRE_RL_rl_relay_console_out,
       CAN_FIRE_RL_rl_step0,
       CAN_FIRE_RL_rl_terminate,
       WILL_FIRE_RL_memCnx_ClientServerRequest,
       WILL_FIRE_RL_memCnx_ClientServerResponse,
       WILL_FIRE_RL_rl_relay_console_in,
       WILL_FIRE_RL_rl_relay_console_out,
       WILL_FIRE_RL_rl_step0,
       WILL_FIRE_RL_rl_terminate;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h702;
  reg [31 : 0] v__h743;
  reg TASK_testplusargs___d12;
  reg TASK_testplusargs___d11;
  reg TASK_testplusargs___d15;
  reg [63 : 0] tohost_addr__h571;
  reg [31 : 0] v__h633;
  reg [7 : 0] v__h941;
  reg [31 : 0] v__h627;
  reg [31 : 0] v__h737;
  reg [31 : 0] v__h696;
  // synopsys translate_on
  // submodule mem_model
  mkMem_Model mem_model(.CLK(CLK),
			.RST_N(RST_N),
			.mem_server_request_put(mem_model$mem_server_request_put),
			.EN_mem_server_request_put(mem_model$EN_mem_server_request_put),
			.EN_mem_server_response_get(mem_model$EN_mem_server_response_get),
			.RDY_mem_server_request_put(mem_model$RDY_mem_server_request_put),
			.mem_server_response_get(mem_model$mem_server_response_get),
			.RDY_mem_server_response_get(mem_model$RDY_mem_server_response_get));
  // submodule soc_top
  mkSoC_Top soc_top(.CLK(CLK),
		    .RST_N(RST_N),
		    .put_from_console_put(soc_top$put_from_console_put),
		    .set_verbosity_logdelay(soc_top$set_verbosity_logdelay),
		    .set_verbosity_verbosity(soc_top$set_verbosity_verbosity),
		    .set_watch_tohost_tohost_addr(soc_top$set_watch_tohost_tohost_addr),
		    .set_watch_tohost_watch_tohost(soc_top$set_watch_tohost_watch_tohost),
		    .to_raw_mem_response_put(soc_top$to_raw_mem_response_put),
		    .EN_set_verbosity(soc_top$EN_set_verbosity),
		    .EN_to_raw_mem_request_get(soc_top$EN_to_raw_mem_request_get),
		    .EN_to_raw_mem_response_put(soc_top$EN_to_raw_mem_response_put),
		    .EN_get_to_console_get(soc_top$EN_get_to_console_get),
		    .EN_put_from_console_put(soc_top$EN_put_from_console_put),
		    .EN_set_watch_tohost(soc_top$EN_set_watch_tohost),
		    .RDY_set_verbosity(),
		    .to_raw_mem_request_get(soc_top$to_raw_mem_request_get),
		    .RDY_to_raw_mem_request_get(soc_top$RDY_to_raw_mem_request_get),
		    .RDY_to_raw_mem_response_put(soc_top$RDY_to_raw_mem_response_put),
		    .get_to_console_get(soc_top$get_to_console_get),
		    .RDY_get_to_console_get(soc_top$RDY_get_to_console_get),
		    .RDY_put_from_console_put(soc_top$RDY_put_from_console_put),
		    .status(soc_top$status),
		    .RDY_set_watch_tohost());
  // rule RL_rl_terminate
  assign CAN_FIRE_RL_rl_terminate = soc_top$status != 8'd0 ;
  assign WILL_FIRE_RL_rl_terminate = CAN_FIRE_RL_rl_terminate ;
  // rule RL_rl_step0
  assign CAN_FIRE_RL_rl_step0 = !rg_banner_printed ;
  assign WILL_FIRE_RL_rl_step0 = CAN_FIRE_RL_rl_step0 ;
  // rule RL_rl_relay_console_out
  assign CAN_FIRE_RL_rl_relay_console_out = soc_top$RDY_get_to_console_get ;
  assign WILL_FIRE_RL_rl_relay_console_out = soc_top$RDY_get_to_console_get ;
  // rule RL_rl_relay_console_in
  assign CAN_FIRE_RL_rl_relay_console_in =
	     rg_console_in_poll != 12'd0 || soc_top$RDY_put_from_console_put ;
  assign WILL_FIRE_RL_rl_relay_console_in = CAN_FIRE_RL_rl_relay_console_in ;
  // rule RL_memCnx_ClientServerRequest
  assign CAN_FIRE_RL_memCnx_ClientServerRequest =
	     soc_top$RDY_to_raw_mem_request_get &&
	     mem_model$RDY_mem_server_request_put ;
  assign WILL_FIRE_RL_memCnx_ClientServerRequest =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;
  // rule RL_memCnx_ClientServerResponse
  assign CAN_FIRE_RL_memCnx_ClientServerResponse =
	     soc_top$RDY_to_raw_mem_response_put &&
	     mem_model$RDY_mem_server_response_get ;
  assign WILL_FIRE_RL_memCnx_ClientServerResponse =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;
  // register rg_banner_printed
  assign rg_banner_printed$D_IN = 1'd1 ;
  assign rg_banner_printed$EN = CAN_FIRE_RL_rl_step0 ;
  // register rg_console_in_poll
  assign rg_console_in_poll$D_IN = rg_console_in_poll + 12'd1 ;
  assign rg_console_in_poll$EN = CAN_FIRE_RL_rl_relay_console_in ;
  // submodule mem_model
  assign mem_model$mem_server_request_put = soc_top$to_raw_mem_request_get ;
  assign mem_model$EN_mem_server_request_put =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;
  assign mem_model$EN_mem_server_response_get =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;
  // submodule soc_top
  assign soc_top$put_from_console_put = v__h941 ;
  assign soc_top$set_verbosity_logdelay = 64'd0 ;
  assign soc_top$set_verbosity_verbosity =
	     TASK_testplusargs___d11 ?
	       4'd2 :
	       (TASK_testplusargs___d12 ? 4'd1 : 4'd0) ;
  assign soc_top$set_watch_tohost_tohost_addr = tohost_addr__h571 ;
  assign soc_top$set_watch_tohost_watch_tohost = TASK_testplusargs___d15 ;
  assign soc_top$to_raw_mem_response_put = mem_model$mem_server_response_get ;
  assign soc_top$EN_set_verbosity = CAN_FIRE_RL_rl_step0 ;
  assign soc_top$EN_to_raw_mem_request_get =
	     CAN_FIRE_RL_memCnx_ClientServerRequest ;
  assign soc_top$EN_to_raw_mem_response_put =
	     CAN_FIRE_RL_memCnx_ClientServerResponse ;
  assign soc_top$EN_get_to_console_get = soc_top$RDY_get_to_console_get ;
  assign soc_top$EN_put_from_console_put =
	     WILL_FIRE_RL_rl_relay_console_in &&
	     rg_console_in_poll == 12'd0 &&
	     v__h941 != 8'd0 ;
  assign soc_top$EN_set_watch_tohost = CAN_FIRE_RL_rl_step0 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_banner_printed <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_console_in_poll <= `BSV_ASSIGNMENT_DELAY 12'd0;
      end
    else
      begin
        if (rg_banner_printed$EN)
	  rg_banner_printed <= `BSV_ASSIGNMENT_DELAY rg_banner_printed$D_IN;
	if (rg_console_in_poll$EN)
	  rg_console_in_poll <= `BSV_ASSIGNMENT_DELAY rg_console_in_poll$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_banner_printed = 1'h0;
    rg_console_in_poll = 12'hAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_terminate)
	begin
	  v__h702 = $stime;
	  #0;
	end
    v__h696 = v__h702 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_terminate)
	$display("%0d: %m:.rl_terminate: soc_top status is 0x%0h (= 0d%0d)",
		 v__h696,
		 soc_top$status,
		 soc_top$status);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_terminate)
	begin
	  v__h743 = $stime;
	  #0;
	end
    v__h737 = v__h743 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_terminate)
	$imported_c_end_timing({ 32'd0, v__h737 });
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_terminate) $finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("Bluespec RISC-V standalone system simulation v1.2");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("Copyright (c) 2017-2019 Bluespec, Inc. All Rights Reserved.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	begin
	  TASK_testplusargs___d12 = $test$plusargs("v1");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	begin
	  TASK_testplusargs___d11 = $test$plusargs("v2");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	begin
	  TASK_testplusargs___d15 = $test$plusargs("tohost");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	begin
	  tohost_addr__h571 = $imported_c_get_symbol_val("tohost");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	$display("INFO: watch_tohost = %0d, tohost_addr = 0x%0h",
		 TASK_testplusargs___d15,
		 tohost_addr__h571);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0)
	begin
	  v__h633 = $stime;
	  #0;
	end
    v__h627 = v__h633 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_step0) $imported_c_start_timing({ 32'd0, v__h627 });
    if (RST_N != `BSV_RESET_VALUE)
      if (soc_top$RDY_get_to_console_get)
	$write("%c", soc_top$get_to_console_get);
    if (RST_N != `BSV_RESET_VALUE)
      if (soc_top$RDY_get_to_console_get) $fflush(32'h80000001);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_relay_console_in && rg_console_in_poll == 12'd0)
	begin
	  v__h941 = $imported_c_trygetchar(8'hAA);
	  #0;
	end
  end
  // synopsys translate_on
endmodule