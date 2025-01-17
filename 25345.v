module instantiations
// dbginit_inst
// cmp_clk
   dbginit_inst  #(1) cmp_dbginit1 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (pcx_arb0_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(1) );
   dbginit_inst  #(1) cmp_dbginit2 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (pcx_arb1_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(2) );
   dbginit_inst  #(1) cmp_dbginit3 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (pcx_arb2_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(3) );
   dbginit_inst  #(1) cmp_dbginit4 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (pcx_arb3_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(4) );
   dbginit_inst  #(1) cmp_dbginit5 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (pcx_arb4_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(5) );
   dbginit_inst  #(1) cmp_dbginit6 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb0_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(6) );
   dbginit_inst  #(1) cmp_dbginit7 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb1_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(7) );
   dbginit_inst  #(1) cmp_dbginit8 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb2_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(8) );
   dbginit_inst  #(1) cmp_dbginit9 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb3_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(9) );
   dbginit_inst  #(1) cmp_dbginit10 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb4_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(10) );
   dbginit_inst  #(1) cmp_dbginit11 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb5_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(11) );
   dbginit_inst  #(1) cmp_dbginit12 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb6_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(12) );
   dbginit_inst  #(1) cmp_dbginit13 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (ccx_arb7_dir), .expected (1'b1),.cnt_val(cmp_cnt), .mon_num(13) );
   dbginit_inst  #(4) cmp_dbginit14 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_dircnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(14) );
   dbginit_inst  #(4) cmp_dbginit15 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_dircnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(15) );
   dbginit_inst  #(4) cmp_dbginit16 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_dircnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(16) );
   dbginit_inst  #(4) cmp_dbginit17 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_dircnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(17) );
   dbginit_inst  #(7) cmp_dbginit18 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_tcnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(18) );
   dbginit_inst  #(7) cmp_dbginit19 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_tcnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(19) );
   dbginit_inst  #(7) cmp_dbginit20( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_tcnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(20) );
   dbginit_inst  #(7) cmp_dbginit21 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_tcnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(21) );
   dbginit_inst  #(10) cmp_dbginit22 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_didx), .expected (10'b0),.cnt_val(cmp_cnt), .mon_num(22) );
   dbginit_inst  #(10) cmp_dbginit23 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_didx), .expected (10'b0),.cnt_val(cmp_cnt), .mon_num(23) );
   dbginit_inst  #(10) cmp_dbginit24 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_didx), .expected (10'b0),.cnt_val(cmp_cnt), .mon_num(24) );
   dbginit_inst  #(10) cmp_dbginit25 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_didx), .expected (10'b0),.cnt_val(cmp_cnt), .mon_num(25) );
   dbginit_inst  #(32) cmp_dbginit26 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_scrbcntr), .expected (32'b0),.cnt_val(cmp_cnt), .mon_num(26) );
   dbginit_inst  #(32) cmp_dbginit27 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_scrbcntr), .expected (32'b0),.cnt_val(cmp_cnt), .mon_num(27) );
   dbginit_inst  #(32) cmp_dbginit28 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_scrbcntr), .expected (32'b0),.cnt_val(cmp_cnt), .mon_num(28) );
   dbginit_inst  #(32) cmp_dbginit29 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_scrbcntr), .expected (32'b0),.cnt_val(cmp_cnt), .mon_num(29) );
   dbginit_inst  #(4) cmp_dbginit30 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_pickst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(30) );
   dbginit_inst  #(4) cmp_dbginit31 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_pickst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(31) );
   dbginit_inst  #(4) cmp_dbginit32 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_pickst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(32) );
   dbginit_inst  #(4) cmp_dbginit33 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_pickst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(33) );
   dbginit_inst  #(4) cmp_dbginit34 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_l2rdst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(34) );
   dbginit_inst  #(4) cmp_dbginit35 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_l2rdst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(35) );
   dbginit_inst  #(4) cmp_dbginit36 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_l2rdst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(36) );
   dbginit_inst  #(4) cmp_dbginit37 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_l2rdst), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(37) );
   dbginit_inst  #(7) cmp_dbginit38 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_scbacnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(38) );
   dbginit_inst  #(7) cmp_dbginit39 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_scbacnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(39) );
   dbginit_inst  #(7) cmp_dbginit40 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_scbacnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(40) );
   dbginit_inst  #(7) cmp_dbginit41 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_scbacnt), .expected (7'b0),.cnt_val(cmp_cnt), .mon_num(41) );
   dbginit_inst  #(4) cmp_dbginit42 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_scbfcnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(42) );
   dbginit_inst  #(4) cmp_dbginit43 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_scbfcnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(43) );
   dbginit_inst  #(4) cmp_dbginit44 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_scbfcnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(44) );
   dbginit_inst  #(4) cmp_dbginit45 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_scbfcnt), .expected (4'b0),.cnt_val(cmp_cnt), .mon_num(45) );
   dbginit_inst  #(4) cmp_dbginit46 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_lrust), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(46) );
   dbginit_inst  #(4) cmp_dbginit47 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_lrust), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(47) );
   dbginit_inst  #(4) cmp_dbginit48 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_lrust), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(48) );
   dbginit_inst  #(4) cmp_dbginit49 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_lrust), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(49) );
   dbginit_inst  #(3) cmp_dbginit50 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_tad0), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(50) );
   dbginit_inst  #(3) cmp_dbginit51 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_tad1), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(51) );
   dbginit_inst  #(3) cmp_dbginit52 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_tad2), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(52) );
   dbginit_inst  #(3) cmp_dbginit53 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_tad3), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(53) );
   dbginit_inst  #(3) cmp_dbginit54 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_tad0), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(54) );
   dbginit_inst  #(3) cmp_dbginit55 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_tad1), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(55) );
   dbginit_inst  #(3) cmp_dbginit56 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_tad2), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(56) );
   dbginit_inst  #(3) cmp_dbginit57 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_tad3), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(57) );
   dbginit_inst  #(3) cmp_dbginit58 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_tad0), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(58) );
   dbginit_inst  #(3) cmp_dbginit59 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_tad1), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(59) );
   dbginit_inst  #(3) cmp_dbginit60 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_tad2), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(60) );
   dbginit_inst  #(3) cmp_dbginit61 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_tad3), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(61) );
   dbginit_inst  #(3) cmp_dbginit62 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_tad0), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(62) );
   dbginit_inst  #(3) cmp_dbginit63 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_tad1), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(63) );
   dbginit_inst  #(3) cmp_dbginit64 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_tad2), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(64) );
   dbginit_inst  #(3) cmp_dbginit65 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_tad3), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(65) );
   dbginit_inst  #(4) cmp_dbginit66 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_qd0st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(66) );
   dbginit_inst  #(4) cmp_dbginit67 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_qd1st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(67) );
   dbginit_inst  #(4) cmp_dbginit68 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_qd2st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(68) );
   dbginit_inst  #(3) cmp_dbginit69 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc0_qdst), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(69) );
   dbginit_inst  #(4) cmp_dbginit70 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_qd0st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(70) );
   dbginit_inst  #(4) cmp_dbginit71 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_qd1st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(71) );
   dbginit_inst  #(4) cmp_dbginit72 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_qd2st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(72) );
   dbginit_inst  #(3) cmp_dbginit73 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc1_qdst), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(73) );
   dbginit_inst  #(4) cmp_dbginit74 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_qd0st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(74) );
   dbginit_inst  #(4) cmp_dbginit75 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_qd1st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(75) );
   dbginit_inst  #(4) cmp_dbginit76 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_qd2st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(76) );
   dbginit_inst  #(3) cmp_dbginit77 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc2_qdst), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(77) );
   dbginit_inst  #(4) cmp_dbginit78 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_qd0st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(78) );
   dbginit_inst  #(4) cmp_dbginit79 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_qd1st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(79) );
   dbginit_inst  #(4) cmp_dbginit80 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_qd2st), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(80) );
   dbginit_inst  #(3) cmp_dbginit81 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sc3_qdst), .expected (3'b1),.cnt_val(cmp_cnt), .mon_num(81) );
`ifdef RTL_SPARC0
   dbginit_inst  #(4) cmp_dbginit82 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(82) );
   dbginit_inst  #(4) cmp_dbginit83 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(83) );
   dbginit_inst  #(4) cmp_dbginit84 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(84) );
   dbginit_inst  #(4) cmp_dbginit85 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(85) );
   dbginit_inst  #(5) cmp_dbginit86 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(86) );
   dbginit_inst  #(4) cmp_dbginit87 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp0_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(87) );
`endif
`ifdef RTL_SPARC1
   dbginit_inst  #(4) cmp_dbginit88 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(88) );
   dbginit_inst  #(4) cmp_dbginit89 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(89) );
   dbginit_inst  #(4) cmp_dbginit90 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(90) );
   dbginit_inst  #(4) cmp_dbginit91 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(91) );
   dbginit_inst  #(5) cmp_dbginit92 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(92) );
   dbginit_inst  #(4) cmp_dbginit93 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp1_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(93) );
`endif
`ifdef RTL_SPARC2
   dbginit_inst  #(4) cmp_dbginit94 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(94) );
   dbginit_inst  #(4) cmp_dbginit95 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(95) );
   dbginit_inst  #(4) cmp_dbginit96 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(96) );
   dbginit_inst  #(4) cmp_dbginit97 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(97) );
   dbginit_inst  #(5) cmp_dbginit98 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(98) );
   dbginit_inst  #(4) cmp_dbginit99 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp2_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(99) );
`endif
`ifdef RTL_SPARC3
   dbginit_inst  #(4) cmp_dbginit100 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(100) );
   dbginit_inst  #(4) cmp_dbginit101 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(101) );
   dbginit_inst  #(4) cmp_dbginit102 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(102) );
   dbginit_inst  #(4) cmp_dbginit103 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(103) );
   dbginit_inst  #(5) cmp_dbginit104 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(104) );
   dbginit_inst  #(4) cmp_dbginit105 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp3_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(105) );
`endif
`ifdef RTL_SPARC4
   dbginit_inst  #(4) cmp_dbginit106 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(106) );
   dbginit_inst  #(4) cmp_dbginit107 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(107) );
   dbginit_inst  #(4) cmp_dbginit108 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(108) );
   dbginit_inst  #(4) cmp_dbginit109 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(109) );
   dbginit_inst  #(5) cmp_dbginit110 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(110) );
   dbginit_inst  #(4) cmp_dbginit111 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp4_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(111) );
`endif
`ifdef RTL_SPARC5
   dbginit_inst  #(4) cmp_dbginit112 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(112) );
   dbginit_inst  #(4) cmp_dbginit113 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(113) );
   dbginit_inst  #(4) cmp_dbginit114 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(114) );
   dbginit_inst  #(4) cmp_dbginit115 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(115) );
   dbginit_inst  #(5) cmp_dbginit116 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(116) );
   dbginit_inst  #(4) cmp_dbginit117 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp5_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(117) );
`endif
`ifdef RTL_SPARC6
   dbginit_inst  #(4) cmp_dbginit118 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(118) );
   dbginit_inst  #(4) cmp_dbginit119 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(119) );
   dbginit_inst  #(4) cmp_dbginit120 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(120) );
   dbginit_inst  #(4) cmp_dbginit121 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(121) );
   dbginit_inst  #(5) cmp_dbginit122 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(122) );
   dbginit_inst  #(4) cmp_dbginit123 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp6_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(123) );
`endif
`ifdef RTL_SPARC7
   dbginit_inst  #(4) cmp_dbginit124 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_usd0), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(124) );
   dbginit_inst  #(4) cmp_dbginit125 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_usd1), .expected (4'h2),.cnt_val(cmp_cnt), .mon_num(125) );
   dbginit_inst  #(4) cmp_dbginit126 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_usd2), .expected (4'h4),.cnt_val(cmp_cnt), .mon_num(126) );
   dbginit_inst  #(4) cmp_dbginit127 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_usd3), .expected (4'h8),.cnt_val(cmp_cnt), .mon_num(127) );
   dbginit_inst  #(5) cmp_dbginit128 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_q), .expected (5'h1f),.cnt_val(cmp_cnt), .mon_num(128) );
   dbginit_inst  #(4) cmp_dbginit129 ( .rst (cmp_rst), .clk  (cmp_clk), .dbginit (cmp_dbginit), .actual (sp7_pv), .expected (4'b1),.cnt_val(cmp_cnt), .mon_num(129) );
`endif
// dram clk
   dbginit_inst  #(33) dram_dbginit1 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbad), .expected (33'b0),.cnt_val(dram_cnt), .mon_num(130) );
   dbginit_inst  #(9) dram_dbginit2 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbca), .expected ( 9'b0),.cnt_val(dram_cnt), .mon_num(131) );
   dbginit_inst  #(1) dram_dbginit3 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbrk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(132) );
   dbginit_inst  #(15) dram_dbginit4 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbrs), .expected (15'b0),.cnt_val(dram_cnt), .mon_num(133) );
   dbginit_inst  #(1) dram_dbginit5 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbsk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(134) );
   dbginit_inst  #(3) dram_dbginit6 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q0scbbk), .expected ( 3'b0),.cnt_val(dram_cnt), .mon_num(135) );
   dbginit_inst  #(33) dram_dbginit7 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbad), .expected (33'b0),.cnt_val(dram_cnt), .mon_num(136) );
   dbginit_inst  #(9) dram_dbginit8 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbca), .expected ( 9'b0),.cnt_val(dram_cnt), .mon_num(137) );
   dbginit_inst  #(1) dram_dbginit9 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbrk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(138) );
   dbginit_inst  #(15) dram_dbginit10 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbrs), .expected (15'b0),.cnt_val(dram_cnt), .mon_num(139) );
   dbginit_inst  #(1) dram_dbginit11 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbsk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(140) );
   dbginit_inst  #(3) dram_dbginit12 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr02_q1scbbk), .expected ( 3'b0),.cnt_val(dram_cnt), .mon_num(141) );
   dbginit_inst  #(33) dram_dbginit13 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbad), .expected (33'b0),.cnt_val(dram_cnt), .mon_num(142) );
   dbginit_inst  #(9) dram_dbginit14 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbca), .expected ( 9'b0),.cnt_val(dram_cnt), .mon_num(143) );
   dbginit_inst  #(1) dram_dbginit15 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbrk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(144) );
   dbginit_inst  #(15) dram_dbginit16 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbrs), .expected (15'b0),.cnt_val(dram_cnt), .mon_num(145) );
   dbginit_inst  #(1) dram_dbginit17 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbsk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(146) );
   dbginit_inst  #(3) dram_dbginit18 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q0scbbk), .expected ( 3'b0),.cnt_val(dram_cnt), .mon_num(147) );
   dbginit_inst  #(33) dram_dbginit19 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbad), .expected (33'b0),.cnt_val(dram_cnt), .mon_num(148) );
   dbginit_inst  #(9) dram_dbginit20 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbca), .expected ( 9'b0),.cnt_val(dram_cnt), .mon_num(149) );
   dbginit_inst  #(1) dram_dbginit21 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbrk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(150) );
   dbginit_inst  #(15) dram_dbginit22 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbrs), .expected (15'b0),.cnt_val(dram_cnt), .mon_num(151) );
   dbginit_inst  #(1) dram_dbginit23 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbsk), .expected ( 1'b0),.cnt_val(dram_cnt), .mon_num(152) );
   dbginit_inst  #(3) dram_dbginit24 ( .rst(dram_rst), .clk  (dram_clk), .dbginit (dram_dbginit), .actual (dr13_q1scbbk), .expected ( 3'b0),.cnt_val(dram_cnt), .mon_num(153) );
// jbus clock
endmodule