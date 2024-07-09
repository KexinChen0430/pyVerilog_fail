module outputs)
// End of automatics
wire ctu_jbusl_cken_jl_nxt;
wire ctu_jbusr_cken_jl_nxt;
wire ctu_misc_cken_jl_nxt;
wire ctu_dbg_cken_jl_nxt;
   /* dffrl_ns AUTO_TEMPLATE (
       .din(clsp_ctrl_srarm_pre_jl),
       .q (clsp_ctrl_srarm_jl),
       .rst_l(start_clk_jl),
       .clk (jbus_clk),
    );
  */
     dffrl_ns u_clsp_ctrl_srarm_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				   // Outputs
				   .q	(clsp_ctrl_srarm_jl),	 // Templated
				   // Inputs
				   .din	(clsp_ctrl_srarm_pre_jl), // Templated
				   .clk	(jbus_clk));		 // Templated
   /* dffrl_ns AUTO_TEMPLATE (
       .din(ctu_dram@_cken_pre_jl),
       .q (ctu_dram@_cken_jl),
       .rst_l(start_clk_jl),
       .clk (jbus_clk),
    );
  */
     dffrl_ns u_ctu_dram02_cken_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				   // Outputs
				   .q	(ctu_dram02_cken_jl),	 // Templated
				   // Inputs
				   .din	(ctu_dram02_cken_pre_jl), // Templated
				   .clk	(jbus_clk));		 // Templated
     dffrl_ns u_ctu_dram13_cken_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				   // Outputs
				   .q	(ctu_dram13_cken_jl),	 // Templated
				   // Inputs
				   .din	(ctu_dram13_cken_pre_jl), // Templated
				   .clk	(jbus_clk));		 // Templated
   /* dffrl_ns AUTO_TEMPLATE (
       .din(ctu_iob_cken_pre_jl),
       .q (ctu_iob_cken_jl),
       .rst_l(start_clk_jl),
       .clk (jbus_clk),
    );
  */
     dffrl_ns u_ctu_iob_cken_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				// Outputs
				.q	(ctu_iob_cken_jl),	 // Templated
				// Inputs
				.din	(ctu_iob_cken_pre_jl),	 // Templated
				.clk	(jbus_clk));		 // Templated
   /* dffrl_ns AUTO_TEMPLATE (
       .din(ctu_efc_cken_pre_jl),
       .q (ctu_efc_cken_jl),
       .rst_l(start_clk_jl),
       .clk (jbus_clk),
    );
  */
     dffrl_ns u_ctu_efc_cken_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				// Outputs
				.q	(ctu_efc_cken_jl),	 // Templated
				// Inputs
				.din	(ctu_efc_cken_pre_jl),	 // Templated
				.clk	(jbus_clk));		 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_jbusl_cken_jl_nxt),
       .q (ctu_jbusl_cken_jl),
       .set_l(io_pwron_rst_l),
       .clk (jbus_clk),
    );
  */
     assign ctu_jbusl_cken_jl_nxt =  start_clk_jl ? ctu_jbusl_cken_pre_jl : 1'b1;
     dffsl_async_ns u_ctu_jbusl_cken_jl(
				   .din	(ctu_jbusl_cken_jl_nxt),
                                   /*AUTOINST*/
					// Outputs
					.q(ctu_jbusl_cken_jl),	 // Templated
					// Inputs
					.clk(jbus_clk),		 // Templated
					.set_l(io_pwron_rst_l));	 // Templated
   /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_jbusr_cken_jl_nxt),
       .q (ctu_jbusr_cken_jl),
       .set_l(io_pwron_rst_l),
       .clk (jbus_clk),
    );
  */
     assign ctu_jbusr_cken_jl_nxt =   start_clk_jl ?  ctu_jbusr_cken_pre_jl: 1'b1;
     dffsl_async_ns u_ctu_jbusr_cken_jl(
				   .din	(ctu_jbusr_cken_jl_nxt),
                                   /*AUTOINST*/
					// Outputs
					.q(ctu_jbusr_cken_jl),	 // Templated
					// Inputs
					.clk(jbus_clk),		 // Templated
					.set_l(io_pwron_rst_l));	 // Templated
   /* dffrl_ns AUTO_TEMPLATE (
       .din(ctu_jbi_cken_pre_jl),
       .q (ctu_jbi_cken_jl),
       .rst_l(start_clk_jl),
       .clk (jbus_clk),
    );
  */
     dffrl_ns u_ctu_jbi_cken_jl( .rst_l	(start_clk_jl), /*AUTOINST*/
				// Outputs
				.q	(ctu_jbi_cken_jl),	 // Templated
				// Inputs
				.din	(ctu_jbi_cken_pre_jl),	 // Templated
				.clk	(jbus_clk));		 // Templated
 /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_dbg_cken_jl_nxt),
       .q (ctu_dbg_cken_jl),
       .set_l(io_pwron_rst_l),
       .clk (jbus_clk),
    );
  */
     assign ctu_dbg_cken_jl_nxt =   start_clk_jl ?  ctu_dbg_cken_pre_jl: 1'b1;
     dffsl_async_ns u_ctu_dbg_cken_jl( .set_l	(io_pwron_rst_l), /*AUTOINST*/
				      // Outputs
				      .q(ctu_dbg_cken_jl),	 // Templated
				      // Inputs
				      .din(ctu_dbg_cken_jl_nxt), // Templated
				      .clk(jbus_clk));		 // Templated
 /* dffsl_async_ns AUTO_TEMPLATE (
       .din(ctu_misc_cken_jl_nxt),
       .q (ctu_misc_cken_jl),
       .set_l(io_pwron_rst_l),
       .clk (jbus_clk),
    );
  */
     assign ctu_misc_cken_jl_nxt =   start_clk_jl ?  ctu_misc_cken_pre_jl: 1'b1;
     dffsl_async_ns u_ctu_misc_cken_jl( .set_l	(io_pwron_rst_l), /*AUTOINST*/
				       // Outputs
				       .q(ctu_misc_cken_jl),	 // Templated
				       // Inputs
				       .din(ctu_misc_cken_jl_nxt), // Templated
				       .clk(jbus_clk));		 // Templated
   /* dff_ns AUTO_TEMPLATE (
       .din(iob_ctu_l2_tr),
       .q (iob_ctu_l2_tr_jl),
       .clk (jbus_clk),
    );
  */
     dff_ns u_iob_ctu_l2_tr_jl(/*AUTOINST*/
			       // Outputs
			       .q	(iob_ctu_l2_tr_jl),	 // Templated
			       // Inputs
			       .din	(iob_ctu_l2_tr),	 // Templated
			       .clk	(jbus_clk));		 // Templated
   /* dff_ns AUTO_TEMPLATE (
       .din(iob_ctu_tr),
       .q (iob_ctu_tr_jl),
       .clk (jbus_clk),
    );
  */
     dff_ns u_iob_ctu_tr_jl(/*AUTOINST*/
			    // Outputs
			    .q		(iob_ctu_tr_jl),	 // Templated
			    // Inputs
			    .din	(iob_ctu_tr),		 // Templated
			    .clk	(jbus_clk));		 // Templated
   /* dff_ns AUTO_TEMPLATE (
       .din(jbi_ctu_tr),
       .q (jbi_ctu_tr_jl),
       .clk (jbus_clk),
    );
  */
     dff_ns u_jbi_ctu_tr_jl(/*AUTOINST*/
			    // Outputs
			    .q		(jbi_ctu_tr_jl),	 // Templated
			    // Inputs
			    .din	(jbi_ctu_tr),		 // Templated
			    .clk	(jbus_clk));		 // Templated
   /* dff_ns AUTO_TEMPLATE (
       .din(dram@_ctu_tr),
       .q (dram@_ctu_tr_jl),
       .clk (jbus_clk),
    );
  */
     dff_ns u_dram02_ctu_tr_jl (/*AUTOINST*/
				// Outputs
				.q	(dram02_ctu_tr_jl),	 // Templated
				// Inputs
				.din	(dram02_ctu_tr),	 // Templated
				.clk	(jbus_clk));		 // Templated
     dff_ns u_dram13_ctu_tr_jl (/*AUTOINST*/
				// Outputs
				.q	(dram13_ctu_tr_jl),	 // Templated
				// Inputs
				.din	(dram13_ctu_tr),	 // Templated
				.clk	(jbus_clk));		 // Templated
endmodule