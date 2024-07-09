module outputs)
// End of automatics
wire ctu_jbusl_cken_jl_nxt;
wire ctu_jbusr_cken_jl_nxt;
wire ctu_jbusl_cken_pre_jl;
wire ctu_jbusr_cken_pre_jl;
wire update_clkctrl_reg_jl_nxt;
wire rd_clkctrl_reg_jl_nxt;
wire ctu_misc_cken_jl_nxt;
wire ctu_dbg_cken_jl_nxt;
wire start_clk_sync_nxt;
wire start_clk_tmp_nxt;
wire start_clk_tmp;
wire start_clk_dly_nxt;
wire start_clk_dly1;
wire start_clk_dly2;
wire start_clk_dly3;
wire start_clk_dly4;
wire start_clk_dly5;
wire start_clk_dly6;
wire start_clk_dly7;
wire update_shadow_cl_nxt;
wire force_cken ;
    assign force_cken = jtag_clsp_force_cken_cmp | ~testmode_l;
    // transimit sync pulses are generated ahead of rx
    assign  start_clk_tmp_nxt = ctu_jbus_rx_sync_cl? 1'b1: start_clk_tmp;
    dffrl_async_ns  u_start_clk_tmp(
                   .din (start_clk_tmp_nxt),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_tmp));
    assign  start_clk_dly_nxt = ctu_jbus_rx_sync_cl & start_clk_tmp ? 1'b1: start_clk_dly1;
    dffrl_async_ns  u_start_clk_dly1(
                   .din (start_clk_dly_nxt),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly1));
    dffrl_async_ns  u_start_clk_dly2(
                   .din (start_clk_dly1),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly2));
    dffrl_async_ns  u_start_clk_dly3(
                   .din (start_clk_dly2),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly3));
    dffrl_async_ns  u_start_clk_dly4(
                   .din (start_clk_dly3),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly4));
    dffrl_async_ns  u_start_clk_dly5(
                   .din (start_clk_dly4),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly5));
    dffrl_async_ns  u_start_clk_dly6(
                   .din (start_clk_dly5),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly6));
    dffrl_async_ns  u_start_clk_dly7(
                   .din (start_clk_dly6),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_dly7));
//    dffrl_async_ns  u_start_clk_cl(
//                   .din (start_clk_dly7),
//                   .clk (cmp_clk),
//                   .rst_l(io_pwron_rst_l),
//                   .q (start_clk_cl));
    // de-asset start_clk_cl during warm_rst
    assign start_clk_sync_nxt = (jbus_rx_sync ?  start_clk_early_jl : start_clk_cl) & start_clk_dly7;
    dffrl_async_ns  u_start_clk_cl(
                   .din (start_clk_sync_nxt),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (start_clk_cl));
    assign update_shadow_cl_nxt = (jbus_rx_sync ? update_shadow_jl : update_shadow_cl) & start_clk_cl;
    dffrl_async_ns  u_update_shadow_cl(
                   .din (update_shadow_cl_nxt),
                   .clk (cmp_clk),
                   .rst_l(io_pwron_rst_l),
                   .q (update_shadow_cl));
   /* ctu_synch_cl_cg AUTO_TEMPLATE (
       .presyncdata (ctu_sparc@_cken_cl),
       .syncdata (ctu_sparc@_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_sparc0_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc0_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc0_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc1_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc1_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc1_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc2_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc2_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc2_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc3_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc3_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc3_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc4_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc4_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc4_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc5_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc5_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc5_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc6_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc6_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc6_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sparc7_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sparc7_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sparc7_cken_cl)); // Templated
   /* ctu_synch_cl_cg AUTO_TEMPLATE (
       .presyncdata (ctu_scdata@_cken_cl),
       .syncdata (ctu_scdata@_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_scdata0_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					     // Outputs
					     .syncdata(ctu_scdata0_cmp_cken_cg), // Templated
					     // Inputs
					     .cmp_clk(cmp_clk),
					     .arst_l(io_pwron_rst_l), // Templated
					     .force_cken(force_cken),
					     .presyncdata(ctu_scdata0_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_scdata1_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					     // Outputs
					     .syncdata(ctu_scdata1_cmp_cken_cg), // Templated
					     // Inputs
					     .cmp_clk(cmp_clk),
					     .arst_l(io_pwron_rst_l), // Templated
					     .force_cken(force_cken),
					     .presyncdata(ctu_scdata1_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_scdata2_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					     // Outputs
					     .syncdata(ctu_scdata2_cmp_cken_cg), // Templated
					     // Inputs
					     .cmp_clk(cmp_clk),
					     .arst_l(io_pwron_rst_l), // Templated
					     .force_cken(force_cken),
					     .presyncdata(ctu_scdata2_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_scdata3_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					     // Outputs
					     .syncdata(ctu_scdata3_cmp_cken_cg), // Templated
					     // Inputs
					     .cmp_clk(cmp_clk),
					     .arst_l(io_pwron_rst_l), // Templated
					     .force_cken(force_cken),
					     .presyncdata(ctu_scdata3_cken_cl)); // Templated
   /* ctu_synch_cl_cg AUTO_TEMPLATE (
       .presyncdata (ctu_sctag@_cken_cl),
       .syncdata (ctu_sctag@_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_sctag0_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sctag0_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sctag0_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sctag1_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sctag1_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sctag1_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sctag2_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sctag2_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sctag2_cken_cl)); // Templated
   ctu_synch_cl_cg u_ctu_sctag3_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_sctag3_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_sctag3_cken_cl)); // Templated
   /* ctu_synch_cl_cg AUTO_TEMPLATE (
       .presyncdata (ctu_ccx_cken_cl),
       .syncdata (ctu_ccx_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_ccx_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					 // Outputs
					 .syncdata(ctu_ccx_cmp_cken_cg), // Templated
					 // Inputs
					 .cmp_clk(cmp_clk),
					 .arst_l(io_pwron_rst_l), // Templated
					 .force_cken(force_cken),
					 .presyncdata(ctu_ccx_cken_cl)); // Templated
   /* ctu_synch_cl_cg  AUTO_TEMPLATE (
       .presyncdata (ctu_fpu_cken_cl),
       .syncdata (ctu_fpu_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_fpu_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					 // Outputs
					 .syncdata(ctu_fpu_cmp_cken_cg), // Templated
					 // Inputs
					 .cmp_clk(cmp_clk),
					 .arst_l(io_pwron_rst_l), // Templated
					 .force_cken(force_cken),
					 .presyncdata(ctu_fpu_cken_cl)); // Templated
   /* ctu_synch_cl_cg  AUTO_TEMPLATE (
       .presyncdata (ctu_iob_cken_cl),
       .syncdata (ctu_iob_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_iob_cmp_cken_cl(
					    .start_clk_cl(start_clk_cl),
                                            /*AUTOINST*/
					 // Outputs
					 .syncdata(ctu_iob_cmp_cken_cg), // Templated
					 // Inputs
					 .cmp_clk(cmp_clk),
					 .arst_l(io_pwron_rst_l), // Templated
					 .force_cken(force_cken),
					 .presyncdata(ctu_iob_cken_cl)); // Templated
   /* ctu_synch_cl_cg  AUTO_TEMPLATE (
       .presyncdata (ctu_jbi_cken_cl),
       .syncdata (ctu_jbi_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_jbi_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					 // Outputs
					 .syncdata(ctu_jbi_cmp_cken_cg), // Templated
					 // Inputs
					 .cmp_clk(cmp_clk),
					 .arst_l(io_pwron_rst_l), // Templated
					 .force_cken(force_cken),
					 .presyncdata(ctu_jbi_cken_cl)); // Templated
   /* ctu_synch_cl_cg  AUTO_TEMPLATE (
       .presyncdata (ctu_dram02_cken_cl),
       .syncdata (ctu_dram02_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_dram02_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_dram02_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_dram02_cken_cl)); // Templated
   /* ctu_synch_cl_cg  AUTO_TEMPLATE (
       .presyncdata (ctu_dram13_cken_cl),
       .syncdata (ctu_dram13_cmp_cken_cg),
       .arst_l(io_pwron_rst_l),
    );
  */
   ctu_synch_cl_cg u_ctu_dram13_cmp_cken_cl(
					       .start_clk_cl(start_clk_cl),
                                               /*AUTOINST*/
					    // Outputs
					    .syncdata(ctu_dram13_cmp_cken_cg), // Templated
					    // Inputs
					    .cmp_clk(cmp_clk),
					    .arst_l(io_pwron_rst_l), // Templated
					    .force_cken(force_cken),
					    .presyncdata(ctu_dram13_cken_cl)); // Templated
    /* dffrle_ns AUTO_TEMPLATE (
       .din (de_grst_jl),
       .q (de_grst_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns  u_grst_en(
			  .rst_l	(start_clk_cl),
                          /*AUTOINST*/
			  // Outputs
			  .q		(de_grst_cl),		 // Templated
			  // Inputs
			  .din		(de_grst_jl),		 // Templated
			  .en		(jbus_rx_sync),		 // Templated
			  .clk		(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din (a_grst_jl),
       .q (a_grst_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_grst_dis(
			  .rst_l	(start_clk_cl),
                          /*AUTOINST*/
			  // Outputs
			  .q		(a_grst_cl),		 // Templated
			  // Inputs
			  .din		(a_grst_jl),		 // Templated
			  .en		(jbus_rx_sync),		 // Templated
			  .clk		(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din (dram_a_grst_jl),
       .q (dram_a_grst_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
    dffrle_ns u_dram_grst_dis(
			      .rst_l	(start_clk_cl),
                               /*AUTOINST*/
			      // Outputs
			      .q	(dram_a_grst_cl),	 // Templated
			      // Inputs
			      .din	(dram_a_grst_jl),	 // Templated
			      .en	(jbus_rx_sync),		 // Templated
			      .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(de_dbginit_jl),
       .q (de_dbginit_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_de_dbginit(
			       .rst_l	(start_clk_cl),
                               /*AUTOINST*/
			    // Outputs
			    .q		(de_dbginit_cl),	 // Templated
			    // Inputs
			    .din	(de_dbginit_jl),	 // Templated
			    .en		(jbus_rx_sync),		 // Templated
			    .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(a_dbginit_jl),
       .q (a_dbginit_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_a_dbginit(
			       .rst_l	(start_clk_cl),
                               /*AUTOINST*/
			   // Outputs
			   .q		(a_dbginit_cl),		 // Templated
			   // Inputs
			   .din		(a_dbginit_jl),		 // Templated
			   .en		(jbus_rx_sync),		 // Templated
			   .clk		(cmp_clk));		 // Templated
   // clkctrl block
   /* dffrl_ns AUTO_TEMPLATE (
       .din(sctag@_ctu_tr),
       .q (sctag@_ctu_tr_ff),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrl_ns u_sctag0_ctu_tr_ff ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag0_ctu_tr_ff),	 // Templated
				  // Inputs
				  .din	(sctag0_ctu_tr),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag1_ctu_tr_ff ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag1_ctu_tr_ff),	 // Templated
				  // Inputs
				  .din	(sctag1_ctu_tr),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag2_ctu_tr_ff ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag2_ctu_tr_ff),	 // Templated
				  // Inputs
				  .din	(sctag2_ctu_tr),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag3_ctu_tr_ff ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag3_ctu_tr_ff),	 // Templated
				  // Inputs
				  .din	(sctag3_ctu_tr),	 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrl_ns AUTO_TEMPLATE (
       .din(sctag@_ctu_tr_ff),
       .q (sctag@_ctu_tr_cl),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrl_ns u_sctag0_ctu_tr_cl ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag0_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(sctag0_ctu_tr_ff),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag1_ctu_tr_cl ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag1_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(sctag1_ctu_tr_ff),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag2_ctu_tr_cl ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag2_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(sctag2_ctu_tr_ff),	 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrl_ns u_sctag3_ctu_tr_cl ( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(sctag3_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(sctag3_ctu_tr_ff),	 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(creg_cken_vld_jl),
       .q (creg_cken_vld_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_creg_cken_vld_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(creg_cken_vld_cl),	 // Templated
				  // Inputs
				  .din	(creg_cken_vld_jl),	 // Templated
				  .en	(jbus_rx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(rstctrl_idle_jl),
       .q (rstctrl_idle_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_rstctrl_idle_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				 // Outputs
				 .q	(rstctrl_idle_cl),	 // Templated
				 // Inputs
				 .din	(rstctrl_idle_jl),	 // Templated
				 .en	(jbus_rx_sync),		 // Templated
				 .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(rstctrl_disclk_jl),
       .q (rstctrl_disclk_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_rstctrl_disclk_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				   // Outputs
				   .q	(rstctrl_disclk_cl),	 // Templated
				   // Inputs
				   .din	(rstctrl_disclk_jl),	 // Templated
				   .en	(jbus_rx_sync),		 // Templated
				   .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(rstctrl_enclk_jl),
       .q (rstctrl_enclk_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_rstctrl_enclk_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(rstctrl_enclk_cl),	 // Templated
				  // Inputs
				  .din	(rstctrl_enclk_jl),	 // Templated
				  .en	(jbus_rx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(iob_ctu_tr_jl),
       .q (iob_ctu_tr_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_iob_ctu_tr_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
			       // Outputs
			       .q	(iob_ctu_tr_cl),	 // Templated
			       // Inputs
			       .din	(iob_ctu_tr_jl),	 // Templated
			       .en	(jbus_rx_sync),		 // Templated
			       .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(dram@_ctu_tr_jl),
       .q (dram@_ctu_tr_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_dram02_ctu_tr_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(dram02_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(dram02_ctu_tr_jl),	 // Templated
				  .en	(jbus_rx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
     dffrle_ns u_dram13_ctu_tr_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(dram13_ctu_tr_cl),	 // Templated
				  // Inputs
				  .din	(dram13_ctu_tr_jl),	 // Templated
				  .en	(jbus_rx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(jbi_ctu_tr_jl),
       .q (jbi_ctu_tr_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_jbi_ctu_tr_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
			       // Outputs
			       .q	(jbi_ctu_tr_cl),	 // Templated
			       // Inputs
			       .din	(jbi_ctu_tr_jl),	 // Templated
			       .en	(jbus_rx_sync),		 // Templated
			       .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(iob_ctu_l2_tr_jl),
       .q (iob_ctu_l2_tr_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_iob_ctu_l2_tr_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(iob_ctu_l2_tr_cl),	 // Templated
				  // Inputs
				  .din	(iob_ctu_l2_tr_jl),	 // Templated
				  .en	(jbus_rx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(stop_id_vld_jl),
       .q (stop_id_vld_cl),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_stop_id_vld_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
				// Outputs
				.q	(stop_id_vld_cl),	 // Templated
				// Inputs
				.din	(stop_id_vld_jl),	 // Templated
				.en	(jbus_rx_sync),		 // Templated
				.clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(stop_id_decoded_jl[`CCTRLSM_MAX_ST-1:0]),
       .q (stop_id_decoded_cl[`CCTRLSM_MAX_ST-1:0]),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     //dffrle_ns #(`CCTRLSM_MAX_ST) u_stop_id_decoded_cl( .rst_l	(start_clk_cl), /*AUTOINST*/
//						       // Outputs
//						       .q(stop_id_decoded_cl[`CCTRLSM_MAX_ST-1:0]),
//						       // Inputs
//						       .din(stop_id_decoded_jl[`CCTRLSM_MAX_ST-1:0]),
//						       .en(jbus_rx_sync),
//						       .clk(cmp_clk));
   /* dffrle_ns AUTO_TEMPLATE (
       .din(dbgtrig_dly_cnt_val[4:0]),
       .q (dbgtrig_dly_cnt_val_cl[4:0]),
       .en(jbus_rx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns #(5) u_dbgtrig_dly_cnt_val ( .rst_l	(start_clk_cl), /*AUTOINST*/
					   // Outputs
					   .q(dbgtrig_dly_cnt_val_cl[4:0]), // Templated
					   // Inputs
					   .din(dbgtrig_dly_cnt_val[4:0]), // Templated
					   .en(jbus_rx_sync),	 // Templated
					   .clk(cmp_clk));	 // Templated
   /* dffrl_async_ns AUTO_TEMPLATE (
       .din(update_clkctrl_reg_jl_nxt ),
       .q (update_clkctrl_reg_cl),
       .rst_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign update_clkctrl_reg_jl_nxt = (jbus_rx_sync ? update_clkctrl_reg_jl : update_clkctrl_reg_cl)
				        & start_clk_cl;
     dffrl_async_ns u_update_clkctrl_reg_cl( .din (update_clkctrl_reg_jl_nxt), /*AUTOINST*/
					    // Outputs
					    .q(update_clkctrl_reg_cl), // Templated
					    // Inputs
					    .clk(cmp_clk),	 // Templated
					    .rst_l(io_pwron_rst_l)); // Templated
   /* dffrl_async_ns AUTO_TEMPLATE (
       .din(rd_clkctrl_reg_jl_nxt ),
       .q (rd_clkctrl_reg_cl),
       .rst_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign rd_clkctrl_reg_jl_nxt = (jbus_rx_sync ? rd_clkctrl_reg_jl : rd_clkctrl_reg_cl)
				        & start_clk_cl;
     dffrl_async_ns u_rd_clkctrl_reg_jl( .din (rd_clkctrl_reg_jl_nxt), /*AUTOINST*/
					// Outputs
					.q(rd_clkctrl_reg_cl),	 // Templated
					// Inputs
					.clk(cmp_clk),		 // Templated
					.rst_l(io_pwron_rst_l));	 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din (clkctrl_dn_cl),
       .q (clkctrl_dn_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_clkctrl_dn_jl ( .rst_l        (start_clk_cl), /*AUTOINST*/
				// Outputs
				.q	(clkctrl_dn_jl),	 // Templated
				// Inputs
				.din	(clkctrl_dn_cl),	 // Templated
				.en	(jbus_tx_sync),		 // Templated
				.clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din (ctu_io_j_err_cl),
       .q (ctu_io_j_err_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_ctu_io_j_err_jl ( .rst_l        (start_clk_cl), /*AUTOINST*/
				  // Outputs
				  .q	(ctu_io_j_err_jl),	 // Templated
				  // Inputs
				  .din	(ctu_io_j_err_cl),	 // Templated
				  .en	(jbus_tx_sync),		 // Templated
				  .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(ctu_dram@_cken_cl),
       .q (ctu_dram@_cken_pre_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_ctu_dram02_cken_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
				    // Outputs
				    .q	(ctu_dram02_cken_pre_jl), // Templated
				    // Inputs
				    .din(ctu_dram02_cken_cl),	 // Templated
				    .en	(jbus_tx_sync),		 // Templated
				    .clk(cmp_clk));		 // Templated
     dffrle_ns u_ctu_dram13_cken_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
				    // Outputs
				    .q	(ctu_dram13_cken_pre_jl), // Templated
				    // Inputs
				    .din(ctu_dram13_cken_cl),	 // Templated
				    .en	(jbus_tx_sync),		 // Templated
				    .clk(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(ctu_iob_cken_cl),
       .q (ctu_iob_cken_pre_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_ctu_iob_cken_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
				 // Outputs
				 .q	(ctu_iob_cken_pre_jl),	 // Templated
				 // Inputs
				 .din	(ctu_iob_cken_cl),	 // Templated
				 .en	(jbus_tx_sync),		 // Templated
				 .clk	(cmp_clk));		 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(ctu_efc_cken_cl),
       .q (ctu_efc_cken_pre_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_ctu_efc_cken_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
				 // Outputs
				 .q	(ctu_efc_cken_pre_jl),	 // Templated
				 // Inputs
				 .din	(ctu_efc_cken_cl),	 // Templated
				 .en	(jbus_tx_sync),		 // Templated
				 .clk	(cmp_clk));		 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_jbusl_cken_jl_nxt),
       .q (ctu_jbusl_cken_pre_jl),
       .set_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign ctu_jbusl_cken_jl_nxt =  start_clk_cl ?
                                     (jbus_rx_sync? ctu_jbusl_cken_cl: ctu_jbusl_cken_pre_jl):
                                      1'b1;
     dffsl_async_ns u_ctu_jbusl_cken_jl(
				   .din	(ctu_jbusl_cken_jl_nxt),
                                   /*AUTOINST*/
					// Outputs
					.q(ctu_jbusl_cken_pre_jl), // Templated
					// Inputs
					.clk(cmp_clk),		 // Templated
					.set_l(io_pwron_rst_l));	 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_jbusr_cken_jl_nxt),
       .q (ctu_jbusr_cken_pre_jl),
       .set_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign ctu_jbusr_cken_jl_nxt =   start_clk_cl ?
                                      (jbus_rx_sync  ? ctu_jbusr_cken_cl:  ctu_jbusr_cken_pre_jl):
                                      1'b1;
     dffsl_async_ns u_ctu_jbusr_cken_jl(
				   .din	(ctu_jbusr_cken_jl_nxt),
                                   /*AUTOINST*/
					// Outputs
					.q(ctu_jbusr_cken_pre_jl), // Templated
					// Inputs
					.clk(cmp_clk),		 // Templated
					.set_l(io_pwron_rst_l));	 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(ctu_jbi_cken_cl),
       .q (ctu_jbi_cken_pre_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_ctu_jbi_cken_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
				 // Outputs
				 .q	(ctu_jbi_cken_pre_jl),	 // Templated
				 // Inputs
				 .din	(ctu_jbi_cken_cl),	 // Templated
				 .en	(jbus_tx_sync),		 // Templated
				 .clk	(cmp_clk));		 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_dbg_cken_jl_nxt),
       .q (ctu_dbg_cken_pre_jl),
       .set_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign ctu_dbg_cken_jl_nxt =   start_clk_cl ?
                                      (jbus_rx_sync  ? ctu_dbg_cken_cl:  ctu_dbg_cken_pre_jl):
                                      1'b1;
     dffsl_async_ns u_ctu_dbg_cken_jl( .din	(ctu_dbg_cken_jl_nxt),
                                   /*AUTOINST*/
				      // Outputs
				      .q(ctu_dbg_cken_pre_jl),	 // Templated
				      // Inputs
				      .clk(cmp_clk),		 // Templated
				      .set_l(io_pwron_rst_l));	 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_misc_cken_jl_nxt),
       .q (ctu_misc_cken_pre_jl),
       .set_l(io_pwron_rst_l),
       .clk (cmp_clk),
    );
  */
     assign ctu_misc_cken_jl_nxt =   start_clk_cl ?
                                      (jbus_rx_sync  ? ctu_misc_cken_cl:  ctu_misc_cken_pre_jl):
                                      1'b1;
     dffsl_async_ns u_ctu_misc_cken_jl( .din	(ctu_misc_cken_jl_nxt),
                                   /*AUTOINST*/
				       // Outputs
				       .q(ctu_misc_cken_pre_jl), // Templated
				       // Inputs
				       .clk(cmp_clk),		 // Templated
				       .set_l(io_pwron_rst_l));	 // Templated
   /* dffrle_ns AUTO_TEMPLATE (
       .din(clsp_ctrl_srarm_cl),
       .q (clsp_ctrl_srarm_pre_jl),
       .en(jbus_tx_sync),
       .rst_l(start_clk_cl),
       .clk (cmp_clk),
    );
  */
     dffrle_ns u_clsp_ctrl_srarm_pre_jl( .rst_l	(start_clk_cl), /*AUTOINST*/
					// Outputs
					.q(clsp_ctrl_srarm_pre_jl), // Templated
					// Inputs
					.din(clsp_ctrl_srarm_cl), // Templated
					.en(jbus_tx_sync),	 // Templated
					.clk(cmp_clk));		 // Templated
endmodule