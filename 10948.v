module outputs)
   wire                 clk;                    // From I73 of bw_u1_ckbuf_33x.v
   wire                 scan_data_0;            // From spare_ff_5_ of bw_u1_soffasr_2x.v
   wire                 scan_data_1;            // From spare_ff_4_ of bw_u1_soffasr_2x.v
   wire                 scan_data_10;           // From gdbginit_ff of bw_u1_soffasr_2x.v
   wire                 scan_data_11;           // From gclk_ff of bw_u1_soffasr_2x.v
   wire                 scan_data_2;            // From spare_ff_3_ of bw_u1_soffasr_2x.v
   wire                 scan_data_3;            // From spare_ff_2_ of bw_u1_soffasr_2x.v
   wire                 scan_data_4;            // From spare_ff_1_ of bw_u1_soffasr_2x.v
   wire                 scan_data_5;            // From spare_ff_0_ of bw_u1_soffasr_2x.v
   wire                 scan_data_6;            // From jbussync2_ff of bw_u1_soffasr_2x.v
   wire                 scan_data_7;            // From jbussync1_ff of bw_u1_soffasr_2x.v
   wire                 scan_data_8;            // From ddrsync2_ff of bw_u1_soffasr_2x.v
   wire                 scan_data_9;            // From ddrsync1_ff of bw_u1_soffasr_2x.v
   // End of automatics
   /* bw_u1_ckbuf_33x AUTO_TEMPLATE (
    .clk                                (clk ),
    .rclk                               (gclk ) ); */
   bw_u1_ckbuf_33x I73
   (/*AUTOINST*/
    // Outputs
    .clk                                (clk ),                  // Templated
    // Inputs
    .rclk                               (gclk ));                 // Templated
   /* bw_u1_soffasr_2x AUTO_TEMPLATE (
    .q                                  (sparc_out[@]),
    .d                                  (spare_in[@]),
    .ck                                 (clk ),
    .r_l                                (agrst_l ),
    .s_l                                (1'b1),
    .sd                                 (scan_data_@"(- 4 @)" ),
    .so                                 (scan_data_@"(- 5 @)" ),
    ); */
   bw_u1_soffasr_2x spare_ff_5_
   (
    // Inputs
    .sd                                 (sd ),
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[5]),          // Templated
    .so                                 (scan_data_0 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[5]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se));
   bw_u1_soffasr_2x spare_ff_4_
   (
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[4]),          // Templated
    .so                                 (scan_data_1 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[4]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se),
    .sd                                 (scan_data_0 ));          // Templated
   bw_u1_soffasr_2x spare_ff_3_
   (
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[3]),          // Templated
    .so                                 (scan_data_2 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[3]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se),
    .sd                                 (scan_data_1 ));          // Templated
   bw_u1_soffasr_2x spare_ff_2_
   (
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[2]),          // Templated
    .so                                 (scan_data_3 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[2]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se),
    .sd                                 (scan_data_2 ));          // Templated
   bw_u1_soffasr_2x spare_ff_1_
   (
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[1]),          // Templated
    .so                                 (scan_data_4 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[1]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se),
    .sd                                 (scan_data_3 ));          // Templated
   bw_u1_soffasr_2x spare_ff_0_
   (
    /*AUTOINST*/
    // Outputs
    .q                                  (sparc_out[0]),          // Templated
    .so                                 (scan_data_5 ),          // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (spare_in[0]),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se),
    .sd                                 (scan_data_4 ));          // Templated
   /* bw_u1_soffasr_2x AUTO_TEMPLATE (
     .q                                 (cken_out[@] ),
     .d                                 (cken_in[@] ),
     .ck                                (clk ),
     .r_l                               (agrst_l ),
     .s_l                               (1'b1),
     .se                                (1'b0),
     .sd                                (1'b0),
     .so                                (),
     ); */
   bw_u1_soffasr_2x cken_ff_25_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[25] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[25] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_24_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[24] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[24] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_23_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[23] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[23] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_22_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[22] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[22] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_21_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[21] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[21] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_20_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[20] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[20] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_19_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[19] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[19] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_18_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[18] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[18] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_17_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[17] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[17] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_16_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[16] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[16] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_15_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[15] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[15] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_14_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[14] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[14] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_13_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[13] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[13] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_12_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[12] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[12] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_11_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[11] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[11] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_10_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[10] ),         // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[10] ),          // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_9_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[9] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[9] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_8_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[8] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[8] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_7_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[7] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[7] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_6_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[6] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[6] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_5_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[5] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[5] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_4_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[4] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[4] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_3_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[3] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[3] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_2_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[2] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[2] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_1_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[1] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[1] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   bw_u1_soffasr_2x cken_ff_0_
   ( /*AUTOINST*/
    // Outputs
    .q                                  (cken_out[0] ),          // Templated
    .so                                 (),                      // Templated
    // Inputs
    .ck                                 (clk ),                  // Templated
    .d                                  (cken_in[0] ),           // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (1'b0),                  // Templated
    .sd                                 (1'b0));                  // Templated
   /* bw_u1_soffasr_2x AUTO_TEMPLATE (
     .ck                                (clk ),
     .r_l                               (agrst_l ),
     .s_l                               (1'b1),
     .se                                (se ),
     ); */
   bw_u1_soffasr_2x ddrsync1_ff
   (
    // Outputs
    .q                                  (ddrsync1_out ),
    .so                                 (scan_data_9 ),
    // Inputs
    .d                                  (ddrsync1_in ),
    .sd                                 (scan_data_8 ),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   bw_u1_soffasr_2x ddrsync2_ff
   (
    // Outputs
    .q                                  (ddrsync2_out ),
    .so                                 (scan_data_8 ),
    // Inputs
    .d                                  (ddrsync2_in ),
    .sd                                 (scan_data_7 ),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   bw_u1_soffasr_2x jbussync1_ff
   (
    // Outputs
    .q                                  (jbussync1_out ),
    .so                                 (scan_data_7 ),
    // Inputs
    .d                                  (jbussync1_in ),
    .sd                                 (scan_data_6 ),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   bw_u1_soffasr_2x jbussync2_ff
   (
    // Outputs
    .q                                  (jbussync2_out ),
    .so                                 (scan_data_6 ),
    // Inputs
    .d                                  (jbussync2_in ),
    .sd                                 (scan_data_5 ),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   bw_u1_soffasr_2x gdbginit_ff
   (
    // Outputs
    .q                                  (gdbginit_out ),
    .so                                 (scan_data_10 ),
    // Inputs
    .d                                  (gdbginit_in ),
    .sd                                 (scan_data_9 ),
    .r_l                                (adbginit_l),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   bw_u1_soffasr_2x gclk_ff
   (
    // Outputs
    .q                                  (grst_out ),
    .so                                 (scan_data_11 ),
    // Inputs
    .d                                  (grst_in ),
    .sd                                 (scan_data_10 ),
    /*AUTOINST*/
    // Inputs
    .ck                                 (clk ),                  // Templated
    .r_l                                (agrst_l ),              // Templated
    .s_l                                (1'b1),                  // Templated
    .se                                 (se ));                   // Templated
   /* bw_u1_scanlg_2x AUTO_TEMPLATE (
     .sd                                (scan_data_11 ),
     .ck                                (clk ),
     ); */
   bw_u1_scanlg_2x scanout_latch
   ( /*AUTOINST*/
    // Outputs
    .so                                 (so),
    // Inputs
    .sd                                 (scan_data_11 ),         // Templated
    .ck                                 (clk ),                  // Templated
    .se                                 (1'b1));
endmodule