module outputs
  wire [63 : 0] mav_sip_write, mav_write, mv_read, mv_sip_read;
  // register rg_meip
  reg rg_meip;
  wire rg_meip$D_IN, rg_meip$EN;
  // register rg_msip
  reg rg_msip;
  wire rg_msip$D_IN, rg_msip$EN;
  // register rg_mtip
  reg rg_mtip;
  wire rg_mtip$D_IN, rg_mtip$EN;
  // register rg_seip
  reg rg_seip;
  wire rg_seip$D_IN, rg_seip$EN;
  // register rg_ssip
  reg rg_ssip;
  reg rg_ssip$D_IN;
  wire rg_ssip$EN;
  // register rg_stip
  reg rg_stip;
  wire rg_stip$D_IN, rg_stip$EN;
  // register rg_ueip
  reg rg_ueip;
  reg rg_ueip$D_IN;
  wire rg_ueip$EN;
  // register rg_usip
  reg rg_usip;
  reg rg_usip$D_IN;
  wire rg_usip$EN;
  // register rg_utip
  reg rg_utip;
  wire rg_utip$D_IN, rg_utip$EN;
  // rule scheduling signals
  wire CAN_FIRE_m_external_interrupt_req,
       CAN_FIRE_mav_sip_write,
       CAN_FIRE_mav_write,
       CAN_FIRE_reset,
       CAN_FIRE_s_external_interrupt_req,
       CAN_FIRE_software_interrupt_req,
       CAN_FIRE_timer_interrupt_req,
       WILL_FIRE_m_external_interrupt_req,
       WILL_FIRE_mav_sip_write,
       WILL_FIRE_mav_write,
       WILL_FIRE_reset,
       WILL_FIRE_s_external_interrupt_req,
       WILL_FIRE_software_interrupt_req,
       WILL_FIRE_timer_interrupt_req;
  // remaining internal signals
  wire [11 : 0] new_mip__h1072, new_mip__h600;
  wire seip__h634,
       ssip__h1112,
       ssip__h638,
       stip__h636,
       ueip__h1111,
       ueip__h635,
       usip__h1113,
       usip__h639,
       utip__h637;
  // action method reset
  assign CAN_FIRE_reset = 1'd1 ;
  assign WILL_FIRE_reset = EN_reset ;
  // value method mv_read
  assign mv_read = { 52'd0, new_mip__h600 } ;
  // actionvalue method mav_write
  assign mav_write = { 52'd0, new_mip__h1072 } ;
  assign CAN_FIRE_mav_write = 1'd1 ;
  assign WILL_FIRE_mav_write = EN_mav_write ;
  // value method mv_sip_read
  assign mv_sip_read =
	     { 54'd0,
	       rg_seip,
	       rg_ueip,
	       2'b0,
	       rg_stip,
	       rg_utip,
	       2'b0,
	       rg_ssip,
	       rg_usip } ;
  // actionvalue method mav_sip_write
  assign mav_sip_write =
	     { 54'd0,
	       rg_seip,
	       ueip__h1111,
	       2'b0,
	       rg_stip,
	       rg_utip,
	       2'b0,
	       ssip__h1112,
	       usip__h1113 } ;
  assign CAN_FIRE_mav_sip_write = 1'd1 ;
  assign WILL_FIRE_mav_sip_write = EN_mav_sip_write ;
  // action method m_external_interrupt_req
  assign CAN_FIRE_m_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_m_external_interrupt_req = 1'd1 ;
  // action method s_external_interrupt_req
  assign CAN_FIRE_s_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_s_external_interrupt_req = 1'd1 ;
  // action method software_interrupt_req
  assign CAN_FIRE_software_interrupt_req = 1'd1 ;
  assign WILL_FIRE_software_interrupt_req = 1'd1 ;
  // action method timer_interrupt_req
  assign CAN_FIRE_timer_interrupt_req = 1'd1 ;
  assign WILL_FIRE_timer_interrupt_req = 1'd1 ;
  // register rg_meip
  assign rg_meip$D_IN = m_external_interrupt_req_req ;
  assign rg_meip$EN = 1'b1 ;
  // register rg_msip
  assign rg_msip$D_IN = software_interrupt_req_req ;
  assign rg_msip$EN = 1'b1 ;
  // register rg_mtip
  assign rg_mtip$D_IN = timer_interrupt_req_req ;
  assign rg_mtip$EN = 1'b1 ;
  // register rg_seip
  assign rg_seip$D_IN = s_external_interrupt_req_req ;
  assign rg_seip$EN = 1'b1 ;
  // register rg_ssip
  always@(EN_reset or
	  EN_mav_write or ssip__h638 or EN_mav_sip_write or ssip__h1112)
  case (1'b1)
    EN_reset: rg_ssip$D_IN = 1'd0;
    EN_mav_write: rg_ssip$D_IN = ssip__h638;
    EN_mav_sip_write: rg_ssip$D_IN = ssip__h1112;
    default: rg_ssip$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign rg_ssip$EN = EN_mav_write || EN_mav_sip_write || EN_reset ;
  // register rg_stip
  assign rg_stip$D_IN = !EN_reset && stip__h636 ;
  assign rg_stip$EN = EN_mav_write || EN_reset ;
  // register rg_ueip
  always@(EN_reset or
	  EN_mav_write or ueip__h635 or EN_mav_sip_write or ueip__h1111)
  case (1'b1)
    EN_reset: rg_ueip$D_IN = 1'd0;
    EN_mav_write: rg_ueip$D_IN = ueip__h635;
    EN_mav_sip_write: rg_ueip$D_IN = ueip__h1111;
    default: rg_ueip$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign rg_ueip$EN = EN_mav_write || EN_mav_sip_write || EN_reset ;
  // register rg_usip
  always@(EN_reset or
	  EN_mav_write or usip__h639 or EN_mav_sip_write or usip__h1113)
  case (1'b1)
    EN_reset: rg_usip$D_IN = 1'd0;
    EN_mav_write: rg_usip$D_IN = usip__h639;
    EN_mav_sip_write: rg_usip$D_IN = usip__h1113;
    default: rg_usip$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign rg_usip$EN = EN_mav_write || EN_mav_sip_write || EN_reset ;
  // register rg_utip
  assign rg_utip$D_IN = !EN_reset && utip__h637 ;
  assign rg_utip$EN = EN_mav_write || EN_reset ;
  // remaining internal signals
  assign new_mip__h1072 =
	     { rg_meip,
	       1'b0,
	       seip__h634,
	       ueip__h635,
	       rg_mtip,
	       1'b0,
	       stip__h636,
	       utip__h637,
	       rg_msip,
	       1'b0,
	       ssip__h638,
	       usip__h639 } ;
  assign new_mip__h600 =
	     { rg_meip,
	       1'b0,
	       rg_seip,
	       rg_ueip,
	       rg_mtip,
	       1'b0,
	       rg_stip,
	       rg_utip,
	       rg_msip,
	       1'b0,
	       rg_ssip,
	       rg_usip } ;
  assign seip__h634 = mav_write_misa[18] && mav_write_wordxl[9] ;
  assign ssip__h1112 = mav_sip_write_misa[18] && mav_sip_write_wordxl[1] ;
  assign ssip__h638 = mav_write_misa[18] && mav_write_wordxl[1] ;
  assign stip__h636 = mav_write_misa[18] && mav_write_wordxl[5] ;
  assign ueip__h1111 = mav_sip_write_misa[13] && mav_sip_write_wordxl[8] ;
  assign ueip__h635 = mav_write_misa[13] && mav_write_wordxl[8] ;
  assign usip__h1113 = mav_sip_write_misa[13] && mav_sip_write_wordxl[0] ;
  assign usip__h639 = mav_write_misa[13] && mav_write_wordxl[0] ;
  assign utip__h637 = mav_write_misa[13] && mav_write_wordxl[4] ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_meip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_msip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_mtip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_seip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_ssip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_stip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_ueip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_usip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_utip <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_meip$EN) rg_meip <= `BSV_ASSIGNMENT_DELAY rg_meip$D_IN;
	if (rg_msip$EN) rg_msip <= `BSV_ASSIGNMENT_DELAY rg_msip$D_IN;
	if (rg_mtip$EN) rg_mtip <= `BSV_ASSIGNMENT_DELAY rg_mtip$D_IN;
	if (rg_seip$EN) rg_seip <= `BSV_ASSIGNMENT_DELAY rg_seip$D_IN;
	if (rg_ssip$EN) rg_ssip <= `BSV_ASSIGNMENT_DELAY rg_ssip$D_IN;
	if (rg_stip$EN) rg_stip <= `BSV_ASSIGNMENT_DELAY rg_stip$D_IN;
	if (rg_ueip$EN) rg_ueip <= `BSV_ASSIGNMENT_DELAY rg_ueip$D_IN;
	if (rg_usip$EN) rg_usip <= `BSV_ASSIGNMENT_DELAY rg_usip$D_IN;
	if (rg_utip$EN) rg_utip <= `BSV_ASSIGNMENT_DELAY rg_utip$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_meip = 1'h0;
    rg_msip = 1'h0;
    rg_mtip = 1'h0;
    rg_seip = 1'h0;
    rg_ssip = 1'h0;
    rg_stip = 1'h0;
    rg_ueip = 1'h0;
    rg_usip = 1'h0;
    rg_utip = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule