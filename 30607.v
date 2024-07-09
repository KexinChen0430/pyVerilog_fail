module outputs
  wire [152 : 0] oport_get;
  wire RDY_iport0_put, RDY_iport1_put, RDY_oport_get;
  // register fi0Active
  reg fi0Active;
  wire fi0Active_D_IN, fi0Active_EN;
  // register fi0HasPrio
  reg fi0HasPrio;
  reg fi0HasPrio_D_IN;
  wire fi0HasPrio_EN;
  // register fi1Active
  reg fi1Active;
  wire fi1Active_D_IN, fi1Active_EN;
  // ports of submodule fi0
  wire [152 : 0] fi0_D_IN, fi0_D_OUT;
  wire fi0_CLR, fi0_DEQ, fi0_EMPTY_N, fi0_ENQ, fi0_FULL_N;
  // ports of submodule fi1
  wire [152 : 0] fi1_D_IN, fi1_D_OUT;
  wire fi1_CLR, fi1_DEQ, fi1_EMPTY_N, fi1_ENQ, fi1_FULL_N;
  // ports of submodule fo
  reg [152 : 0] fo_D_IN;
  wire [152 : 0] fo_D_OUT;
  wire fo_CLR, fo_DEQ, fo_EMPTY_N, fo_ENQ, fo_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_arbitrate,
       WILL_FIRE_RL_fi0_advance,
       WILL_FIRE_RL_fi1_advance;
  // inputs to muxes for submodule ports
  wire [152 : 0] MUX_fo_enq_1__VAL_3;
  wire MUX_fi0Active_write_1__SEL_1,
       MUX_fi0Active_write_1__VAL_1,
       MUX_fi1Active_write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h900;
  wire fo_RDY_enq_AND_IF_fi0HasPrio_2_THEN_fi0_RDY_de_ETC___d24;
  // action method iport0_put
  assign RDY_iport0_put = fi0_FULL_N ;
  // action method iport1_put
  assign RDY_iport1_put = fi1_FULL_N ;
  // actionvalue method oport_get
  assign oport_get = fo_D_OUT ;
  assign RDY_oport_get = fo_EMPTY_N ;
  // submodule fi0
  arSRLFIFOD #(.width(32'd153), .l2depth(32'd4)) fi0(.CLK(CLK),
						     .RST_N(RST_N),
						     .D_IN(fi0_D_IN),
						     .DEQ(fi0_DEQ),
						     .ENQ(fi0_ENQ),
						     .CLR(fi0_CLR),
						     .D_OUT(fi0_D_OUT),
						     .EMPTY_N(fi0_EMPTY_N),
						     .FULL_N(fi0_FULL_N));
  // submodule fi1
  arSRLFIFOD #(.width(32'd153), .l2depth(32'd4)) fi1(.CLK(CLK),
						     .RST_N(RST_N),
						     .D_IN(fi1_D_IN),
						     .DEQ(fi1_DEQ),
						     .ENQ(fi1_ENQ),
						     .CLR(fi1_CLR),
						     .D_OUT(fi1_D_OUT),
						     .EMPTY_N(fi1_EMPTY_N),
						     .FULL_N(fi1_FULL_N));
  // submodule fo
  arSRLFIFOD #(.width(32'd153), .l2depth(32'd4)) fo(.CLK(CLK),
						    .RST_N(RST_N),
						    .D_IN(fo_D_IN),
						    .DEQ(fo_DEQ),
						    .ENQ(fo_ENQ),
						    .CLR(fo_CLR),
						    .D_OUT(fo_D_OUT),
						    .EMPTY_N(fo_EMPTY_N),
						    .FULL_N(fo_FULL_N));
  // rule RL_fi0_advance
  assign WILL_FIRE_RL_fi0_advance =
	     fo_FULL_N && fi0_EMPTY_N && !fi1Active &&
	     !WILL_FIRE_RL_arbitrate ;
  // rule RL_fi1_advance
  assign WILL_FIRE_RL_fi1_advance =
	     fo_FULL_N && fi1_EMPTY_N && !fi0Active &&
	     !WILL_FIRE_RL_fi0_advance &&
	     !WILL_FIRE_RL_arbitrate ;
  // rule RL_arbitrate
  assign WILL_FIRE_RL_arbitrate =
	     fo_RDY_enq_AND_IF_fi0HasPrio_2_THEN_fi0_RDY_de_ETC___d24 &&
	     fi0_EMPTY_N &&
	     fi1_EMPTY_N &&
	     !fi0Active &&
	     !fi1Active ;
  // inputs to muxes for submodule ports
  assign MUX_fi0Active_write_1__SEL_1 = WILL_FIRE_RL_arbitrate && fi0HasPrio ;
  assign MUX_fi1Active_write_1__SEL_1 =
	     WILL_FIRE_RL_arbitrate && !fi0HasPrio ;
  assign MUX_fi0Active_write_1__VAL_1 =
	     fi0HasPrio ? !fi0_D_OUT[151] : !fi1_D_OUT[151] ;
  assign MUX_fo_enq_1__VAL_3 = fi0HasPrio ? fi0_D_OUT : fi1_D_OUT ;
  // register fi0Active
  assign fi0Active_D_IN =
	     MUX_fi0Active_write_1__SEL_1 ?
	       MUX_fi0Active_write_1__VAL_1 :
	       !fi0_D_OUT[151] ;
  assign fi0Active_EN =
	     WILL_FIRE_RL_arbitrate && fi0HasPrio ||
	     WILL_FIRE_RL_fi0_advance ;
  // register fi0HasPrio
  always@(WILL_FIRE_RL_arbitrate or
	  fi0HasPrio or WILL_FIRE_RL_fi0_advance or WILL_FIRE_RL_fi1_advance)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_arbitrate: fi0HasPrio_D_IN = !fi0HasPrio;
      WILL_FIRE_RL_fi0_advance: fi0HasPrio_D_IN = 1'd0;
      WILL_FIRE_RL_fi1_advance: fi0HasPrio_D_IN = 1'd1;
      default: fi0HasPrio_D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign fi0HasPrio_EN =
	     WILL_FIRE_RL_arbitrate || WILL_FIRE_RL_fi0_advance ||
	     WILL_FIRE_RL_fi1_advance ;
  // register fi1Active
  assign fi1Active_D_IN =
	     MUX_fi1Active_write_1__SEL_1 ?
	       MUX_fi0Active_write_1__VAL_1 :
	       !fi1_D_OUT[151] ;
  assign fi1Active_EN =
	     WILL_FIRE_RL_arbitrate && !fi0HasPrio ||
	     WILL_FIRE_RL_fi1_advance ;
  // submodule fi0
  assign fi0_D_IN = iport0_put ;
  assign fi0_DEQ =
	     WILL_FIRE_RL_arbitrate && fi0HasPrio ||
	     WILL_FIRE_RL_fi0_advance ;
  assign fi0_ENQ = EN_iport0_put ;
  assign fi0_CLR = 1'b0 ;
  // submodule fi1
  assign fi1_D_IN = iport1_put ;
  assign fi1_DEQ =
	     WILL_FIRE_RL_arbitrate && !fi0HasPrio ||
	     WILL_FIRE_RL_fi1_advance ;
  assign fi1_ENQ = EN_iport1_put ;
  assign fi1_CLR = 1'b0 ;
  // submodule fo
  always@(WILL_FIRE_RL_fi0_advance or
	  fi0_D_OUT or
	  WILL_FIRE_RL_fi1_advance or
	  fi1_D_OUT or WILL_FIRE_RL_arbitrate or MUX_fo_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fi0_advance: fo_D_IN = fi0_D_OUT;
      WILL_FIRE_RL_fi1_advance: fo_D_IN = fi1_D_OUT;
      WILL_FIRE_RL_arbitrate: fo_D_IN = MUX_fo_enq_1__VAL_3;
      default: fo_D_IN =
		   153'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fo_DEQ = EN_oport_get ;
  assign fo_ENQ =
	     WILL_FIRE_RL_fi0_advance || WILL_FIRE_RL_fi1_advance ||
	     WILL_FIRE_RL_arbitrate ;
  assign fo_CLR = 1'b0 ;
  // remaining internal signals
  assign fo_RDY_enq_AND_IF_fi0HasPrio_2_THEN_fi0_RDY_de_ETC___d24 =
	     fo_FULL_N && (fi0HasPrio ? fi0_EMPTY_N : fi1_EMPTY_N) ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        fi0Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fi0HasPrio <= `BSV_ASSIGNMENT_DELAY 1'd1;
	fi1Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (fi0Active_EN) fi0Active <= `BSV_ASSIGNMENT_DELAY fi0Active_D_IN;
	if (fi0HasPrio_EN)
	  fi0HasPrio <= `BSV_ASSIGNMENT_DELAY fi0HasPrio_D_IN;
	if (fi1Active_EN) fi1Active <= `BSV_ASSIGNMENT_DELAY fi1Active_D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    fi0Active = 1'h0;
    fi0HasPrio = 1'h0;
    fi1Active = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_arbitrate)
	begin
	  v__h900 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_arbitrate)
	$display("[%0d]: %m: Merge from:%d Data:%x",
		 v__h900,
		 fi0HasPrio,
		 fi0HasPrio ? fi0_D_OUT[127:0] : fi1_D_OUT[127:0]);
  end
  // synopsys translate_on
endmodule