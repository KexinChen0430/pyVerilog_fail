module outputs
  wire [7 : 0] host_request_get;
  wire RDY_host_request_get, RDY_host_response_put;
  // inlined wires
  wire [15 : 0] dcpCredit_acc_v1$wget,
		dcpCredit_acc_v2$wget,
		spinCredit_acc_v1$wget,
		spinCredit_acc_v2$wget;
  wire dcpCredit_acc_v1$whas,
       dcpCredit_acc_v2$whas,
       spinCredit_acc_v1$whas,
       spinCredit_acc_v2$whas;
  // register cp2hByteCount
  reg [31 : 0] cp2hByteCount;
  wire [31 : 0] cp2hByteCount$D_IN;
  wire cp2hByteCount$EN;
  // register dcpCredit_value
  reg [15 : 0] dcpCredit_value;
  wire [15 : 0] dcpCredit_value$D_IN;
  wire dcpCredit_value$EN;
  // register doTerminate
  reg doTerminate;
  wire doTerminate$D_IN, doTerminate$EN;
  // register h2cpByteCount
  reg [31 : 0] h2cpByteCount;
  wire [31 : 0] h2cpByteCount$D_IN;
  wire h2cpByteCount$EN;
  // register h2ioByteCount
  reg [31 : 0] h2ioByteCount;
  wire [31 : 0] h2ioByteCount$D_IN;
  wire h2ioByteCount$EN;
  // register ioOpcode
  reg [7 : 0] ioOpcode;
  wire [7 : 0] ioOpcode$D_IN;
  wire ioOpcode$EN;
  // register isOpcode
  reg isOpcode;
  wire isOpcode$D_IN, isOpcode$EN;
  // register r_hdl
  reg [32 : 0] r_hdl;
  wire [32 : 0] r_hdl$D_IN;
  wire r_hdl$EN;
  // register s_hdl
  reg [32 : 0] s_hdl;
  wire [32 : 0] s_hdl$D_IN;
  wire s_hdl$EN;
  // register spinCredit_value
  reg [15 : 0] spinCredit_value;
  wire [15 : 0] spinCredit_value$D_IN;
  wire spinCredit_value$EN;
  // register w_hdl
  reg [32 : 0] w_hdl;
  wire [32 : 0] w_hdl$D_IN;
  wire w_hdl$EN;
  // ports of submodule reqF
  wire [7 : 0] reqF$D_IN, reqF$D_OUT;
  wire reqF$CLR, reqF$DEQ, reqF$EMPTY_N, reqF$ENQ, reqF$FULL_N;
  // ports of submodule respF
  wire [7 : 0] respF$D_IN, respF$D_OUT;
  wire respF$CLR, respF$DEQ, respF$EMPTY_N, respF$ENQ, respF$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_do_r_char,
       WILL_FIRE_RL_do_r_open,
       WILL_FIRE_RL_do_s_char,
       WILL_FIRE_RL_do_s_open,
       WILL_FIRE_RL_do_w_char;
  // inputs to muxes for submodule ports
  wire [32 : 0] MUX_r_hdl$write_1__VAL_2, MUX_s_hdl$write_1__VAL_2;
  wire [15 : 0] MUX_dcpCredit_value$write_1__VAL_2,
		MUX_spinCredit_value$write_1__VAL_2;
  wire MUX_r_hdl$write_1__SEL_1, MUX_s_hdl$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h1534,
	       v__h1822,
	       v__h2056,
	       v__h2264,
	       v__h2612,
	       v__h2635,
	       v__h2839,
	       v__h3347,
	       v__h3388,
	       v__h3431,
	       v__h3474;
  reg [31 : 0] TASK_fopen___d24,
	       TASK_fopen___d31,
	       TASK_fopen___d38,
	       b__h2103,
	       b__h2688;
  wire [15 : 0] b__h1081, b__h824;
  // actionvalue method host_request_get
  assign host_request_get = reqF$D_OUT ;
  assign RDY_host_request_get = reqF$EMPTY_N ;
  // action method host_response_put
  assign RDY_host_response_put = respF$FULL_N ;
  // submodule reqF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) reqF(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(reqF$D_IN),
					       .ENQ(reqF$ENQ),
					       .DEQ(reqF$DEQ),
					       .CLR(reqF$CLR),
					       .D_OUT(reqF$D_OUT),
					       .FULL_N(reqF$FULL_N),
					       .EMPTY_N(reqF$EMPTY_N));
  // submodule respF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) respF(.RST(RST_N),
						.CLK(CLK),
						.D_IN(respF$D_IN),
						.ENQ(respF$ENQ),
						.DEQ(respF$DEQ),
						.CLR(respF$CLR),
						.D_OUT(respF$D_OUT),
						.FULL_N(respF$FULL_N),
						.EMPTY_N(respF$EMPTY_N));
  // rule RL_do_r_open
  assign WILL_FIRE_RL_do_r_open = !r_hdl[32] && s_hdl[32] ;
  // rule RL_do_s_char
  assign WILL_FIRE_RL_do_s_char = s_hdl[32] && spinCredit_value == 16'd0 ;
  // rule RL_do_r_char
  assign WILL_FIRE_RL_do_r_char =
	     reqF$FULL_N && r_hdl[32] &&
	     (dcpCredit_value ^ 16'h8000) > 16'd32768 ;
  // rule RL_do_w_char
  assign WILL_FIRE_RL_do_w_char = respF$EMPTY_N && w_hdl[32] ;
  // rule RL_do_s_open
  assign WILL_FIRE_RL_do_s_open = !s_hdl[32] && w_hdl[32] ;
  // inputs to muxes for submodule ports
  assign MUX_r_hdl$write_1__SEL_1 =
	     WILL_FIRE_RL_do_r_char && b__h2688 == 32'hFFFFFFFF ;
  assign MUX_s_hdl$write_1__SEL_1 =
	     WILL_FIRE_RL_do_s_char && b__h2103 == 32'hFFFFFFFF ;
  assign MUX_dcpCredit_value$write_1__VAL_2 =
	     dcpCredit_value + (dcpCredit_acc_v1$whas ? b__h1081 : 16'd0) +
	     (dcpCredit_acc_v2$whas ? 16'd65535 : 16'd0) ;
  assign MUX_r_hdl$write_1__VAL_2 = { 1'd1, TASK_fopen___d38 } ;
  assign MUX_s_hdl$write_1__VAL_2 = { 1'd1, TASK_fopen___d31 } ;
  assign MUX_spinCredit_value$write_1__VAL_2 =
	     spinCredit_value + (spinCredit_acc_v1$whas ? b__h824 : 16'd0) +
	     (spinCredit_acc_v2$whas ? 16'd65535 : 16'd0) ;
  // inlined wires
  assign spinCredit_acc_v1$wget = b__h824 ;
  assign spinCredit_acc_v1$whas =
	     WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF &&
	     !isOpcode &&
	     ioOpcode == 8'd0 ;
  assign spinCredit_acc_v2$wget = 16'd65535 ;
  assign spinCredit_acc_v2$whas = (spinCredit_value ^ 16'h8000) > 16'd32768 ;
  assign dcpCredit_acc_v1$wget = b__h824 ;
  assign dcpCredit_acc_v1$whas =
	     WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF &&
	     !isOpcode &&
	     ioOpcode == 8'd1 ;
  assign dcpCredit_acc_v2$wget = 16'd65535 ;
  assign dcpCredit_acc_v2$whas =
	     WILL_FIRE_RL_do_r_char && b__h2688 != 32'hFFFFFFFF ;
  // register cp2hByteCount
  assign cp2hByteCount$D_IN = cp2hByteCount + 32'd1 ;
  assign cp2hByteCount$EN = WILL_FIRE_RL_do_w_char ;
  // register dcpCredit_value
  assign dcpCredit_value$D_IN =
	     WILL_FIRE_RL_do_s_open ?
	       16'd0 :
	       MUX_dcpCredit_value$write_1__VAL_2 ;
  assign dcpCredit_value$EN = 1'b1 ;
  // register doTerminate
  assign doTerminate$D_IN = 1'd1 ;
  assign doTerminate$EN =
	     WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF &&
	     !isOpcode &&
	     ioOpcode == 8'd255 ;
  // register h2cpByteCount
  assign h2cpByteCount$D_IN = h2cpByteCount + 32'd1 ;
  assign h2cpByteCount$EN = dcpCredit_acc_v2$whas ;
  // register h2ioByteCount
  assign h2ioByteCount$D_IN = h2ioByteCount + 32'd1 ;
  assign h2ioByteCount$EN =
	     WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF ;
  // register ioOpcode
  assign ioOpcode$D_IN = b__h2103[7:0] ;
  assign ioOpcode$EN =
	     WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && isOpcode ;
  // register isOpcode
  assign isOpcode$D_IN = !isOpcode ;
  assign isOpcode$EN = WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF ;
  // register r_hdl
  assign r_hdl$D_IN =
	     MUX_r_hdl$write_1__SEL_1 ?
	       33'h0AAAAAAAA :
	       MUX_r_hdl$write_1__VAL_2 ;
  assign r_hdl$EN =
	     WILL_FIRE_RL_do_r_char && b__h2688 == 32'hFFFFFFFF ||
	     WILL_FIRE_RL_do_r_open ;
  // register s_hdl
  assign s_hdl$D_IN =
	     MUX_s_hdl$write_1__SEL_1 ?
	       33'h0AAAAAAAA :
	       MUX_s_hdl$write_1__VAL_2 ;
  assign s_hdl$EN =
	     WILL_FIRE_RL_do_s_char && b__h2103 == 32'hFFFFFFFF ||
	     WILL_FIRE_RL_do_s_open ;
  // register spinCredit_value
  assign spinCredit_value$D_IN =
	     WILL_FIRE_RL_do_s_open ?
	       16'd2 :
	       MUX_spinCredit_value$write_1__VAL_2 ;
  assign spinCredit_value$EN = 1'b1 ;
  // register w_hdl
  assign w_hdl$D_IN = { 1'd1, TASK_fopen___d24 } ;
  assign w_hdl$EN = !w_hdl[32] ;
  // submodule reqF
  assign reqF$D_IN = b__h2688[7:0] ;
  assign reqF$ENQ = dcpCredit_acc_v2$whas ;
  assign reqF$DEQ = EN_host_request_get ;
  assign reqF$CLR = 1'b0 ;
  // submodule respF
  assign respF$D_IN = host_response_put ;
  assign respF$ENQ = EN_host_response_put ;
  assign respF$DEQ = WILL_FIRE_RL_do_w_char ;
  assign respF$CLR = 1'b0 ;
  // remaining internal signals
  assign b__h1081 = b__h824 ;
  assign b__h824 = { 8'd0, b__h2103[7:0] } ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cp2hByteCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dcpCredit_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	doTerminate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	h2cpByteCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	h2ioByteCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	isOpcode <= `BSV_ASSIGNMENT_DELAY 1'd1;
	r_hdl <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
	s_hdl <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
	spinCredit_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	w_hdl <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
      end
    else
      begin
        if (cp2hByteCount$EN)
	  cp2hByteCount <= `BSV_ASSIGNMENT_DELAY cp2hByteCount$D_IN;
	if (dcpCredit_value$EN)
	  dcpCredit_value <= `BSV_ASSIGNMENT_DELAY dcpCredit_value$D_IN;
	if (doTerminate$EN)
	  doTerminate <= `BSV_ASSIGNMENT_DELAY doTerminate$D_IN;
	if (h2cpByteCount$EN)
	  h2cpByteCount <= `BSV_ASSIGNMENT_DELAY h2cpByteCount$D_IN;
	if (h2ioByteCount$EN)
	  h2ioByteCount <= `BSV_ASSIGNMENT_DELAY h2ioByteCount$D_IN;
	if (isOpcode$EN) isOpcode <= `BSV_ASSIGNMENT_DELAY isOpcode$D_IN;
	if (r_hdl$EN) r_hdl <= `BSV_ASSIGNMENT_DELAY r_hdl$D_IN;
	if (s_hdl$EN) s_hdl <= `BSV_ASSIGNMENT_DELAY s_hdl$D_IN;
	if (spinCredit_value$EN)
	  spinCredit_value <= `BSV_ASSIGNMENT_DELAY spinCredit_value$D_IN;
	if (w_hdl$EN) w_hdl <= `BSV_ASSIGNMENT_DELAY w_hdl$D_IN;
      end
    if (ioOpcode$EN) ioOpcode <= `BSV_ASSIGNMENT_DELAY ioOpcode$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cp2hByteCount = 32'hAAAAAAAA;
    dcpCredit_value = 16'hAAAA;
    doTerminate = 1'h0;
    h2cpByteCount = 32'hAAAAAAAA;
    h2ioByteCount = 32'hAAAAAAAA;
    ioOpcode = 8'hAA;
    isOpcode = 1'h0;
    r_hdl = 33'h0AAAAAAAA;
    s_hdl = 33'h0AAAAAAAA;
    spinCredit_value = 16'hAAAA;
    w_hdl = 33'h0AAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (!w_hdl[32])
	begin
	  TASK_fopen___d24 = $fopen("/tmp/OpenCPI0_Resp", "w");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (!w_hdl[32])
	begin
	  v__h1534 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (!w_hdl[32]) $display("[%0d]: do_w_open called", v__h1534);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_open)
	begin
	  TASK_fopen___d38 = $fopen("/tmp/OpenCPI0_Req", "r");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_open)
	begin
	  v__h2056 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_open)
	$display("[%0d]: do_r_open called", v__h2056);
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	begin
	  v__h3347 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	$display("[%0d]: doTerminate called by IOCTL channel", v__h3347);
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	begin
	  v__h3388 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	$display("[%0d]: IOCTL Bytes Read    :%0d", v__h3388, h2ioByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	begin
	  v__h3431 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	$display("[%0d]: DCP   Bytes Read    :%0d", v__h3431, h2cpByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	begin
	  v__h3474 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (doTerminate)
	$display("[%0d]: DCP   Bytes Written :%0d", v__h3474, cp2hByteCount);
    if (RST_N != `BSV_RESET_VALUE) if (doTerminate) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char)
	begin
	  b__h2103 = $fgetc(s_hdl[31:0]);
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 == 32'hFFFFFFFF)
	begin
	  v__h2264 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 == 32'hFFFFFFFF)
	$display("[%0d]: do_s_char IOCTL fgetc returned -1 after %0d Bytes",
		 v__h2264,
		 h2ioByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 == 32'hFFFFFFFF)
	$fclose(s_hdl[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd253)
	$dumpoff;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd253)
	begin
	  v__h2612 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd253)
	$display("[%0d]: dumpoff called", v__h2612);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd254)
	$dumpon;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd254)
	begin
	  v__h2635 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_char && b__h2103 != 32'hFFFFFFFF && !isOpcode &&
	  ioOpcode == 8'd254)
	$display("[%0d]: dumpon called", v__h2635);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char)
	begin
	  b__h2688 = $fgetc(r_hdl[31:0]);
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h2688 == 32'hFFFFFFFF)
	begin
	  v__h2839 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h2688 == 32'hFFFFFFFF)
	$display("[%0d]: do_r_char DCP fgetc returned -1 after %0d Bytes",
		 v__h2839,
		 h2cpByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h2688 == 32'hFFFFFFFF)
	$fclose(r_hdl[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_w_char) $fwrite(w_hdl[31:0], "%c", respF$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_w_char) $fflush(w_hdl[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_open)
	begin
	  TASK_fopen___d31 = $fopen("/tmp/OpenCPI0_IOCtl", "r");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_open)
	begin
	  v__h1822 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_s_open)
	$display("[%0d]: do_s_open called", v__h1822);
  end
  // synopsys translate_on
endmodule