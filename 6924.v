module outputs)
	      wire [129:0]    pcx_col0_data_px_l;     // From mac0 of pcx_dp_maca_r.v
	      wire [129:0]    pcx_col1_data_px_l;     // From mac1 of pcx_dp_macb_r.v
	      wire [129:0]    pcx_col2_data_px_l;     // From mac2 of pcx_dp_macb_r.v
	      wire [129:0]    pcx_col4_data_px_l;     // From mac4 of pcx_dp_macb_l.v
	      wire [129:0]    pcx_col5_data_px_l;     // From mac5 of pcx_dp_macb_l.v
	      wire [129:0]    pcx_col6_data_px_l;     // From mac6 of pcx_dp_macb_l.v
	      wire [129:0]    pcx_col7_data_px_l;     // From mac7 of pcx_dp_maca_l.v
	      wire [7:1]      shiftenable_buf;	      // From mac1 of pcx_dp_macb_r.v, ...
	      // End of automatics
              wire [5:0]      unused;
/*
// DATAPATH ORGANISATION(pcx_dp1)
   sparc0 sparc1 sparc2 sparc3  sparc4  sparc5  sparc6  sparc7
     |      |      |      |       |       |        |      |
     v      v      v      v       v       v        v      v
   mac0 -> mac1 ->mac2 ->mac3 <- mac4 <- mac5 <- mac6 <- mac7
(new)ar     br     br     cr      bl      bl       bl     al
(old)a      b      c      b       b       b        b      a
                   |
                   v
               to sctag1
 */
   /*
   pcx_dp_maca_r AUTO_TEMPLATE(
			  // Outputs
			  .data_out_px_l	(pcx_col@_data_px_l[129:0]),
                          .shiftenable_buf      (),
			  // Inputs
			  .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[@]),
			  .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[@]),
			  .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[@]),
			  .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[@]),
			  .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[@]),
			  .src_pcx_data_pa({6'b000000,spc@_pcx_data_pa[`PCX_WIDTH-1:0]}),
			  .clk		(clk),
    		         //.tmb_l		(tmb_l),
		         .scan_in	(scan_in[@]),
		         .scan_out	(scan_out[@]),
		         .shiftenable	(shiftenable_buf[@"(+ @ 1)"]));
    */
   pcx_dp_maca_r mac0(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col0_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[0]),		 // Templated
		      .shiftenable_buf	(),			 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[0]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[0]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[0]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[0]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[0]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc0_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[0]),		 // Templated
		      .shiftenable	(shiftenable_buf[1]));	 // Templated
   /*
   pcx_dp_macb_r AUTO_TEMPLATE(
			  // Outputs
			  .data_out_px_l	(pcx_col@_data_px_l[129:0]),
                          .shiftenable_buf      (shiftenable_buf[@]),
			  // Inputs
			  .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[@]),
			  .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[@]),
			  .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[@]),
			  .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[@]),
			  .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[@]),
			  .src_pcx_data_pa({6'b000000,spc@_pcx_data_pa[`PCX_WIDTH-1:0]}),
        		  .data_prev_px_l	(pcx_col@"(- @ 1)"_data_px_l[129:0]),
			  .clk		(clk),
    		         //.tmb_l		(tmb_l),
		         .scan_in	(scan_in[@]),
		         .scan_out	(scan_out[@]),
		         .shiftenable	(shiftenable_buf[@"(+ @ 1)"]));
    */
   pcx_dp_macb_r mac1(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col1_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[1]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[1]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[1]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[1]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[1]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[1]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[1]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc1_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_prev_px_l	(pcx_col0_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[1]),		 // Templated
		      .shiftenable	(shiftenable_buf[2]));	 // Templated
   pcx_dp_macb_r mac2(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col2_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[2]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[2]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[2]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[2]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[2]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[2]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[2]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc2_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_prev_px_l	(pcx_col1_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[2]),		 // Templated
		      .shiftenable	(shiftenable_buf[3]));	 // Templated
      /*
   pcx_dp_macc_r AUTO_TEMPLATE(
			  // Outputs
			  .data_out_px_l	({unused[5:0],pcx_scache1_data_px_l[`PCX_WIDTH-1:0]}),
                          .shiftenable_buf      (shiftenable_buf[@]),
			  // Inputs
			  .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[@]),
			  .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[@]),
			  .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[@]),
			  .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[@]),
			  .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[@]),
			  .src_pcx_data_pa({6'b000000,spc@_pcx_data_pa[`PCX_WIDTH-1:0]}),
        		  .data_crit_px_l	(pcx_col@"(+ @ 1)"_data_px_l[129:0]),
	        	  .data_ncrit_px_l(pcx_col@"(- @ 1)"_data_px_l[129:0]),
			  .clk		(clk),
    		         //.tmb_l		(tmb_l),
		         .scan_in	(scan_in[@]),
		         .scan_out	(scan_out[@]),
		         .shiftenable	(shiftenable_buf[@"(+ @ 1)"]));
*/
   pcx_dp_macc_r mac3(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	({unused[5:0],pcx_scache1_data_px_l[`PCX_WIDTH-1:0]}), // Templated
		      .scan_out		(scan_out[3]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[3]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[3]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[3]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[3]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[3]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[3]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc3_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_crit_px_l	(pcx_col4_data_px_l[129:0]), // Templated
		      .data_ncrit_px_l	(pcx_col2_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[3]),		 // Templated
		      .shiftenable	(shiftenable_buf[4]));	 // Templated
   /*
   pcx_dp_macb_l AUTO_TEMPLATE(
			  // Outputs
			  .data_out_px_l	(pcx_col@_data_px_l[129:0]),
		          .shiftenable_buf	(shiftenable_buf[@]),
			  // Inputs
			  .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[@]),
			  .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[@]),
			  .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[@]),
			  .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[@]),
			  .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[@]),
			  .src_pcx_data_pa({6'b000000,spc@_pcx_data_pa[`PCX_WIDTH-1:0]}),
        		  .data_prev_px_l	(pcx_col@"(+ @ 1)"_data_px_l[129:0]),
			  .clk		(clk),
    		         //.tmb_l		(tmb_l),
		         .scan_in	(scan_in[@]),
		         .scan_out	(scan_out[@]),
		         .shiftenable	(shiftenable_buf[@"(+ @ 1)"]));
    */
   pcx_dp_macb_l mac4(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col4_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[4]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[4]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[4]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[4]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[4]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[4]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[4]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc4_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_prev_px_l	(pcx_col5_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[4]),		 // Templated
		      .shiftenable	(shiftenable_buf[5]));	 // Templated
   pcx_dp_macb_l mac5(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col5_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[5]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[5]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[5]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[5]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[5]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[5]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[5]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc5_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_prev_px_l	(pcx_col6_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[5]),		 // Templated
		      .shiftenable	(shiftenable_buf[6]));	 // Templated
   pcx_dp_macb_l mac6(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col6_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[6]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[6]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[6]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[6]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[6]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[6]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[6]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc6_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .data_prev_px_l	(pcx_col7_data_px_l[129:0]), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[6]),		 // Templated
		      .shiftenable	(shiftenable_buf[7]));	 // Templated
      /*
   pcx_dp_maca_l AUTO_TEMPLATE(
			  // Outputs
			  .data_out_px_l	(pcx_col@_data_px_l[129:0]),
		          .shiftenable_buf	(shiftenable_buf[@]),
			  // Inputs
			  .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[@]),
			  .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[@]),
			  .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[@]),
			  .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[@]),
			  .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[@]),
			  .src_pcx_data_pa({6'b000000,spc@_pcx_data_pa[`PCX_WIDTH-1:0]}),
			  .clk		(clk),
    		         //.tmb_l		(tmb_l),
		         .scan_in	(scan_in[@]),
		         .scan_out	(scan_out[@]),
		         .shiftenable	(shiftenable));
    */
   pcx_dp_maca_l mac7(/*AUTOINST*/
		      // Outputs
		      .data_out_px_l	(pcx_col7_data_px_l[129:0]), // Templated
		      .scan_out		(scan_out[7]),		 // Templated
		      .shiftenable_buf	(shiftenable_buf[7]),	 // Templated
		      // Inputs
		      .arb_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa[7]), // Templated
		      .arb_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[7]), // Templated
		      .arb_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[7]), // Templated
		      .arb_pcxdp_shift_px(arbpc1_pcxdp_shift_px[7]), // Templated
		      .arb_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa[7]), // Templated
		      .src_pcx_data_pa	({6'b000000,spc7_pcx_data_pa[`PCX_WIDTH-1:0]}), // Templated
		      .rclk		(rclk),
		      .scan_in		(scan_in[7]),		 // Templated
		      .shiftenable	(shiftenable));		 // Templated
// Code start here
// Local Variables:
// verilog-library-directories:("." "../../../../../common/rtl")
// End:
endmodule