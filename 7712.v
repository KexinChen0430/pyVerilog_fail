module outputs)
wire [7:0]		atom_a;			// From q0 of ccx_arb_srcq.v, ...
wire [7:0]		ctl_qsel0_a;		// From q0 of ccx_arb_srcq.v, ...
wire [7:0]		ctl_qsel1_a_l;		// From q0 of ccx_arb_srcq.v, ...
wire [7:0]		ctl_shift_a;		// From q0 of ccx_arb_srcq.v, ...
// End of automatics
wire  ccx_reset_l_d1,ccx_reset2_l_d1;
wire  dbginit_d1;
   // Global signals
   //assign dbginit = ~dbginit_l;
   assign dbginit_d1 = ~ccx_reset2_l_d1;
   // reset flop
   dffrl_async  ff_rstl(
                .din(reset_l),
                .q(ccx_reset_l_d1),
                .clk(rclk),
                .se(se),
                .rst_l(adbginit_l));
   assign       reset_d1 = ~ccx_reset_l_d1;
//   dff  dff_ccx_arb_dbginit(
//	.din           (dbginit),
//	.q             (dbginit_d1),
//	.clk           (rclk),
//	.se            (1'd0),
//	.si            (1'd0),
//	.so            ());
   dffrl_async  ff_rstl2(
                .din(reset_l),
                .q(ccx_reset2_l_d1),
                .clk(rclk),
                .se(se),
                .rst_l(adbginit_l));
   // Generate direction bit for use in setting priority direction for
   // incoming request packets.
   assign direction_in = ~direction | dbginit_d1;
   dff_s #(1) dff_ccx_com_dir(
            .din           (direction_in),
	    .q             (direction),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   //Priority Encoder related logic
   // Logic to generate selects for request mux
   assign current_req_sel = ~req_pkt_empty & ~reset_d1;
   assign fifo_req_sel    =  req_pkt_empty & (fifo_valid & ~input_req_sel_d1) & ~reset_d1;
   assign input_req_sel   =  req_pkt_empty & ~(fifo_valid & ~input_req_sel_d1) | reset_d1;
//flop and drive data ready signal
      dff_s #(1) dff_ccx_com_dr(                              //relocate this flop to ctl
            .din           (ccx_dest_data_rdy_a),        //section.
	    .q             (ccx_dest_data_rdy_x),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
      dff_s #(1) dff_ccx_atom_dr(
            .din           (ccx_dest_atom_a),
	    .q             (ccx_dest_atom_x),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   // generate stall signal
   dff_s  dff_ccx_arb_stall1(
	.din           (stall1_q),
	.q             (stall1_a),
	.clk           (rclk),
	.se            (1'd0),
	.si            (1'd0),
	.so            ());
   dff_s  dff_ccx_arb_stall2(
	.din           (stall2_q),
	.q             (stall2_a),
	.clk           (rclk),
	.se            (1'd0),
	.si            (1'd0),
	.so            ());
assign	stall_a  =  stall1_a | stall2_a;
   dff_s  dff_ccx_arb_inpsel(
	.din           (input_req_sel),
	.q             (input_req_sel_d1),
	.clk           (rclk),
	.se            (1'd0),
	.si            (1'd0),
	.so            ());
// FIFO related logic
   // setup flops for control
//   dff #(16) dff_ccx_com_fifo_vvecd1(
//            .din           (vvec_d1[15:0]),
//	    .q             (vvec_d2[15:0]),
//	    .clk           (rclk),
//	    .se            (1'b0),
//	    .si            (16'd0),
//	    .so            ());
//   dff #(16) dff_ccx_com_fifo_wrptrd1(
   dff_s #(5) dff_ccx_com_fifo_wrptrd1(
            .din           (wrptr[4:0]),
	    .q             (wrptr_d1[4:0]),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (5'd0),
	    .so            ());
//   dff #(16) dff_ccx_com_fifo_rdptrd1(
//            .din           (rdptr[15:0]),
   dff_s #(5) dff_ccx_com_fifo_rdptrd1(
            .din           (rdptr_mux[4:0]),
	    .q             (rdptr_d1[4:0]),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (5'd0),
	    .so            ());
   dff_s #(1) dff_ccx_com_fifo_wrend1(
            .din           (wr_en),
	    .q             (wr_en_d1),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   dff_s #(1) dff_ccx_com_fifo_rdend1(
            .din           (rd_en),
	    .q             (rd_en_d1),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   dff_s #(1) dff_ccx_com_fifo_emptyd1(
            .din           (fifo_empty_d1),
	    .q             (fifo_empty_d2),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   dff_s #(1) dff_ccx_com_fifo_bypassd1(
            .din           (fifo_bypass),
	    .q             (fifo_bypass_d1),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
   dff_s #(1) dff_ccx_com_fifo_fifoseld1(
            .din           (fifo_req_sel),
	    .q             (fifo_req_sel_d1),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
      dff_s #(1) dff_ccx_com_fifo_currseld1(
            .din           (current_req_sel),
	    .q             (current_req_sel_d1),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (1'b0),
	    .so            ());
      dff_s #(5) dff_ccx_rdptr_incd1(
            .din           (rdptr_inc[4:0]),
	    .q             (rdptr_inc_d1[4:0]),
	    .clk           (rclk),
	    .se            (1'b0),
	    .si            (5'd0),
	    .so            ());
   //see if any valid requests in flopped request packet.
//   assign inreg_req_vld_d1 = |(req_d1[9:0]) ;
   //compute if valid read, write ops were performed in prev cycle
   assign fifo_rd_vld_d1 =  rd_en_d1 & ~fifo_bypass_d1 & fifo_req_sel_d1;
   assign fifo_wr_vld_d1 =  wr_en_d1 & ~(fifo_bypass_d1 & fifo_req_sel_d1);
   //if valid read/write ops then compute new fifo state (vvec_d1)
//   assign vvec_wr_update_d1[15:0] = fifo_wr_vld_d1 ? wrptr_d1[15:0] : 16'd0;
//   assign vvec_rd_update_d1[15:0] = fifo_rd_vld_d1 ? rdptr_d1[15:0] : 16'd0;
//   assign vvec_unq_d1[15:0] = (vvec_wr_update_d1[15:0] | (vvec_d2[15:0] & ~vvec_rd_update_d1[15:0]));
//   assign vvec_d1[15:0] = reset_d1 ? 16'd0 : vvec_unq_d1[15:0];
   //Determine if fifo is empty
//   assign fifo_empty_d1 =~( |(vvec_d1[15:0]));
// need extra state to detect full(overflow) condition
//	0		1		2		3		4		5
//	req=1		req=1		req=1		req=1
//	wrptr=0		1		2		3		0		0
//	rdptr=0		0		0		0		0		0
//	(empty)								(full)		(full)
//	0		1		2		3		4		5
//	spc_req=1	fifo wr		fifo rd		arb(pa)		px1
//			wrptr=0		wrptr=1
//			rdptr=0		rdptr=0		rdptr=1
//			rdptr_inc=1			rdptr_inc=2
   assign fifo_empty_d1 = &(wrptr[4:0] ~^ rdptr_mux[4:0]);
   assign fifo_empty_d1_l = ~fifo_empty_d1 ;
   //Determine if data needs to be bypassed around flop array.
   assign fifo_bypass   = inreg_req_vld_d1 & fifo_empty_d1 ;
   assign fifo_bypass_l = ~fifo_bypass;
   //Determine if fifo contains valid request packet.
   assign fifo_valid    = inreg_req_vld_d1 | fifo_empty_d1_l;
   //Compute new read and write pointers
//   assign rdptr_inc[15:0]     = {rdptr_d1[14:0],rdptr_d1[15]};
//   assign wrptr_inc[15:0]     = {wrptr_d1[14:0],wrptr_d1[15]};
   // increment - rdptr + 1
   assign rdptr_inc[0] = ~rdptr_mux[0];
   assign rdptr_inc[1] =  rdptr_mux[1] ^ rdptr_mux[0];
   assign rdptr_inc[2] = (~&(rdptr_mux[1:0]) ~^ rdptr_mux[2]);
   assign rdptr_inc[3] = (~&(rdptr_mux[2:0]) ~^ rdptr_mux[3]);
   assign rdptr_inc[4] = (~&(rdptr_mux[3:0]) ~^ rdptr_mux[4]);
   // increment - wrptr + 1
   assign wrptr_inc[0] = ~wrptr_d1[0];
   assign wrptr_inc[1] =  wrptr_d1[1] ^ wrptr_d1[0];
   assign wrptr_inc[2] = (~&(wrptr_d1[1:0]) ~^ wrptr_d1[2]);
   assign wrptr_inc[3] = (~&(wrptr_d1[2:0]) ~^ wrptr_d1[3]);
   assign wrptr_inc[4] = (~&(wrptr_d1[3:0]) ~^ wrptr_d1[4]);
//   assign wrptr[15:0]=(fifo_empty_d2 & ~fifo_wr_vld_d1| reset_d1) ? {15'd0,1'b1} : (fifo_wr_vld_d1 ? wrptr_inc[15:0] : wrptr_d1[15:0]);
//   assign rdptr[15:0]=(fifo_empty_d2 & ~fifo_wr_vld_d1 | reset_d1) ? {15'd0,1'b1} : (fifo_rd_vld_d1 ? rdptr_inc[15:0] : rdptr_d1[15:0]);
   assign wrptr[4:0] = (fifo_empty_d2 & ~fifo_wr_vld_d1| reset_d1) ? 5'h0 : (fifo_wr_vld_d1 ? wrptr_inc[4:0] : wrptr_d1[4:0]);
   // decode write pointer
   assign wrptr_dcd[0]  =  (~wrptr[3] & ~wrptr[2] & ~wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[1]  =  (~wrptr[3] & ~wrptr[2] & ~wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[2]  =  (~wrptr[3] & ~wrptr[2] &  wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[3]  =  (~wrptr[3] & ~wrptr[2] &  wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[4]  =  (~wrptr[3] &  wrptr[2] & ~wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[5]  =  (~wrptr[3] &  wrptr[2] & ~wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[6]  =  (~wrptr[3] &  wrptr[2] &  wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[7]  =  (~wrptr[3] &  wrptr[2] &  wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[8]  =  ( wrptr[3] & ~wrptr[2] & ~wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[9]  =  ( wrptr[3] & ~wrptr[2] & ~wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[10] =  ( wrptr[3] & ~wrptr[2] &  wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[11] =  ( wrptr[3] & ~wrptr[2] &  wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[12] =  ( wrptr[3] &  wrptr[2] & ~wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[13] =  ( wrptr[3] &  wrptr[2] & ~wrptr[1] &  wrptr[0]);
   assign wrptr_dcd[14] =  ( wrptr[3] &  wrptr[2] &  wrptr[1] & ~wrptr[0]);
   assign wrptr_dcd[15] =  ( wrptr[3] &  wrptr[2] &  wrptr[1] &  wrptr[0]);
   assign wrptr_l[15:0] = ~(wrptr_dcd[15:0]);
   assign rdptr_mux[4:0]=(fifo_empty_d2 & ~fifo_wr_vld_d1 | reset_d1) ? 5'h0 : (fifo_rd_vld_d1 ? rdptr_inc_d1[4:0] : rdptr_d1[4:0]);
   // decode read pointer
   assign rdptr[0]  =  (~rdptr_mux[3] & ~rdptr_mux[2] & ~rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[1]  =  (~rdptr_mux[3] & ~rdptr_mux[2] & ~rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[2]  =  (~rdptr_mux[3] & ~rdptr_mux[2] &  rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[3]  =  ~|rdptr[2:0];
   assign rdptr_dcd_3  =  (~rdptr_mux[3] & ~rdptr_mux[2] &  rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[4]  =  (~rdptr_mux[3] &  rdptr_mux[2] & ~rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[5]  =  (~rdptr_mux[3] &  rdptr_mux[2] & ~rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[6]  =  (~rdptr_mux[3] &  rdptr_mux[2] &  rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[7]  =  ~|rdptr[6:4];
   assign rdptr_dcd_7  =  (~rdptr_mux[3] &  rdptr_mux[2] &  rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[8]  =  ( rdptr_mux[3] & ~rdptr_mux[2] & ~rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[9]  =  ( rdptr_mux[3] & ~rdptr_mux[2] & ~rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[10] =  ( rdptr_mux[3] & ~rdptr_mux[2] &  rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[11] =  ~|rdptr[10:8];
   assign rdptr_dcd_11 =  ( rdptr_mux[3] & ~rdptr_mux[2] &  rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[12] =  ( rdptr_mux[3] &  rdptr_mux[2] & ~rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[13] =  ( rdptr_mux[3] &  rdptr_mux[2] & ~rdptr_mux[1] &  rdptr_mux[0]);
   assign rdptr[14] =  ( rdptr_mux[3] &  rdptr_mux[2] &  rdptr_mux[1] & ~rdptr_mux[0]);
   assign rdptr[15] =  ~|rdptr[14:12];
   assign rdptr_dcd_15 =  ( rdptr_mux[3] &  rdptr_mux[2] &  rdptr_mux[1] &  rdptr_mux[0]);
   assign fifo_sel15_12 = |({rdptr_dcd_15,rdptr[14:12]});
   assign fifo_sel11_8  = |({rdptr_dcd_11,rdptr[10:8]});
   assign fifo_sel7_4   = |({rdptr_dcd_7, rdptr[6:4]});
   assign fifo_sel3_0   = |({rdptr_dcd_3, rdptr[2:0]});
   //Determine if a valid write was performed in current cycle. - wrptr will not catch up w/ rdptr 'cos the req source stalls.
//   assign wrap_wren  = ~(|(wrptr_inc[15:0] & rdptr_d1[15:0])) | fifo_empty_d1;
   assign wrap_wren  = ~(&(wrptr[3:0] ~^ rdptr_mux[3:0]) & (wrptr_inc[4] ^ rdptr_inc[4])) | fifo_empty_d1;
   assign wr_en = (inreg_req_vld_d1 & (fifo_req_sel_d1 | current_req_sel_d1)) & wrap_wren & ~reset_d1;
   //Determine if valid read was performed in current cycle.
   assign rd_en = fifo_empty_d1_l & ~reset_d1 ;
   // ARB SRC Q LOGIC
   /*
   ccx_arb_srcq    AUTO_TEMPLATE(
			// Outputs
			.qfull		(qfull[@]),
			.qsel0		(arb_dp_qsel0_a[@]),
			.qsel1		(arb_dp_qsel1_a[@]),
			.shift_x	(arb_dp_shift_x[@]),
			.shift_a	(arb_ctl_shift_a[@]),
			.q0_hold_a	(arb_dp_q0_hold_a[@]),
		  .atom_a(atom_a[@]),
			.ctl_qsel0_a		(ctl_qsel0_a[@]),
			.ctl_qsel1_a_l		(ctl_qsel1_a_l[@]),
			.ctl_shift_a	(ctl_shift_a[@]),
			// Inputs
			.req_q		(src@_arb_req_q),
			.atom_q		(src@_arb_atom_q),
			.grant_a	(grant_a[@]),
			.reset_d1	(reset_d1));
   */
   ccx_arb_srcq q0(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[0]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[0]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[0]),	 // Templated
		   .shift_x		(arb_dp_shift_x[0]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[0]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[0]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[0]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[0]),	 // Templated
		   .atom_a		(atom_a[0]),		 // Templated
		   // Inputs
		   .req_q		(src0_arb_req_q),	 // Templated
		   .atom_q		(src0_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[0]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q1(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[1]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[1]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[1]),	 // Templated
		   .shift_x		(arb_dp_shift_x[1]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[1]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[1]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[1]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[1]),	 // Templated
		   .atom_a		(atom_a[1]),		 // Templated
		   // Inputs
		   .req_q		(src1_arb_req_q),	 // Templated
		   .atom_q		(src1_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[1]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q2(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[2]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[2]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[2]),	 // Templated
		   .shift_x		(arb_dp_shift_x[2]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[2]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[2]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[2]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[2]),	 // Templated
		   .atom_a		(atom_a[2]),		 // Templated
		   // Inputs
		   .req_q		(src2_arb_req_q),	 // Templated
		   .atom_q		(src2_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[2]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q3(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[3]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[3]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[3]),	 // Templated
		   .shift_x		(arb_dp_shift_x[3]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[3]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[3]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[3]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[3]),	 // Templated
		   .atom_a		(atom_a[3]),		 // Templated
		   // Inputs
		   .req_q		(src3_arb_req_q),	 // Templated
		   .atom_q		(src3_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[3]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q4(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[4]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[4]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[4]),	 // Templated
		   .shift_x		(arb_dp_shift_x[4]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[4]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[4]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[4]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[4]),	 // Templated
		   .atom_a		(atom_a[4]),		 // Templated
		   // Inputs
		   .req_q		(src4_arb_req_q),	 // Templated
		   .atom_q		(src4_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[4]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q5(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[5]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[5]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[5]),	 // Templated
		   .shift_x		(arb_dp_shift_x[5]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[5]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[5]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[5]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[5]),	 // Templated
		   .atom_a		(atom_a[5]),		 // Templated
		   // Inputs
		   .req_q		(src5_arb_req_q),	 // Templated
		   .atom_q		(src5_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[5]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q6(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[6]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[6]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[6]),	 // Templated
		   .shift_x		(arb_dp_shift_x[6]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[6]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[6]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[6]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[6]),	 // Templated
		   .atom_a		(atom_a[6]),		 // Templated
		   // Inputs
		   .req_q		(src6_arb_req_q),	 // Templated
		   .atom_q		(src6_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[6]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
   ccx_arb_srcq q7(/*AUTOINST*/
		   // Outputs
		   .qfull		(qfull[7]),		 // Templated
		   .qsel0		(arb_dp_qsel0_a[7]),	 // Templated
		   .qsel1		(arb_dp_qsel1_a[7]),	 // Templated
		   .shift_x		(arb_dp_shift_x[7]),	 // Templated
		   .ctl_qsel0_a		(ctl_qsel0_a[7]),	 // Templated
		   .ctl_qsel1_a_l	(ctl_qsel1_a_l[7]),	 // Templated
		   .ctl_shift_a		(ctl_shift_a[7]),	 // Templated
		   .q0_hold_a		(arb_dp_q0_hold_a[7]),	 // Templated
		   .atom_a		(atom_a[7]),		 // Templated
		   // Inputs
		   .req_q		(src7_arb_req_q),	 // Templated
		   .atom_q		(src7_arb_atom_q),	 // Templated
		   .grant_a		(grant_a[7]),		 // Templated
		   .rclk		(rclk),
		   .reset_d1		(reset_d1));		 // Templated
/*
// queue to hold atomic bit - 8 instances of 2 deep entries
ccx_arb_atomq   AUTO_TEMPLATE(
                // Outputs
                .q0_dataout(arbctl_atom[@]),
                // Inputs
		.ctl_qsel0_a	(ctl_qsel0_a[@]),
		.ctl_qsel1_a_l	(ctl_qsel1_a_l[@]),
		.ctl_shift_a	(ctl_shift_a[@]),
    .atom_a(atom_a[@]));
*/
   ccx_arb_atomq atomq0(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[0]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[0]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[0]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[0]),	 // Templated
			.atom_a		(atom_a[0]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq1(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[1]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[1]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[1]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[1]),	 // Templated
			.atom_a		(atom_a[1]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq2(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[2]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[2]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[2]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[2]),	 // Templated
			.atom_a		(atom_a[2]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq3(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[3]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[3]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[3]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[3]),	 // Templated
			.atom_a		(atom_a[3]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq4(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[4]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[4]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[4]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[4]),	 // Templated
			.atom_a		(atom_a[4]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq5(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[5]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[5]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[5]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[5]),	 // Templated
			.atom_a		(atom_a[5]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq6(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[6]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[6]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[6]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[6]),	 // Templated
			.atom_a		(atom_a[6]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
   ccx_arb_atomq atomq7(/*AUTOINST*/
			// Outputs
			.q0_dataout	(arbctl_atom[7]),	 // Templated
`ifdef FPGA_SYN
			.scan_out	(/*scan_out*/),
`else
			.scan_out	(scan_out),
`endif
			// Inputs
			.ctl_qsel1_a_l	(ctl_qsel1_a_l[7]),	 // Templated
			.ctl_qsel0_a	(ctl_qsel0_a[7]),	 // Templated
			.ctl_shift_a	(ctl_shift_a[7]),	 // Templated
			.atom_a		(atom_a[7]),		 // Templated
			.rclk		(rclk),
			.reset_d1	(reset_d1));
endmodule