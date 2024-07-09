module outputs)
   wire [7:0]		arbpc0_pcxdp_grant_arbbf_pa;// From arb0 of ccx_arb.v
   wire [7:0]		arbpc0_pcxdp_grant_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc0_pcxdp_q0_hold_arbbf_pa;// From arb0 of ccx_arb.v
   wire [7:0]		arbpc0_pcxdp_q0_hold_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc0_pcxdp_qsel0_arbbf_pa;// From arb0 of ccx_arb.v
   wire [7:0]		arbpc0_pcxdp_qsel0_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc0_pcxdp_qsel1_arbbf_pa;// From arb0 of ccx_arb.v
   wire [7:0]		arbpc0_pcxdp_qsel1_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc0_pcxdp_shift_arbbf_px;// From arb0 of ccx_arb.v
   wire [7:0]		arbpc0_pcxdp_shift_px;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc1_pcxdp_grant_arbbf_pa;// From arb1 of ccx_arb.v
   wire [7:0]		arbpc1_pcxdp_grant_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc1_pcxdp_q0_hold_arbbf_pa;// From arb1 of ccx_arb.v
   wire [7:0]		arbpc1_pcxdp_q0_hold_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc1_pcxdp_qsel0_arbbf_pa;// From arb1 of ccx_arb.v
   wire [7:0]		arbpc1_pcxdp_qsel0_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc1_pcxdp_qsel1_arbbf_pa;// From arb1 of ccx_arb.v
   wire [7:0]		arbpc1_pcxdp_qsel1_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc1_pcxdp_shift_arbbf_px;// From arb1 of ccx_arb.v
   wire [7:0]		arbpc1_pcxdp_shift_px;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc2_pcxdp_grant_arbbf_pa;// From arb2 of ccx_arb.v
   wire [7:0]		arbpc2_pcxdp_grant_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc2_pcxdp_q0_hold_arbbf_pa;// From arb2 of ccx_arb.v
   wire [7:0]		arbpc2_pcxdp_q0_hold_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc2_pcxdp_qsel0_arbbf_pa;// From arb2 of ccx_arb.v
   wire [7:0]		arbpc2_pcxdp_qsel0_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc2_pcxdp_qsel1_arbbf_pa;// From arb2 of ccx_arb.v
   wire [7:0]		arbpc2_pcxdp_qsel1_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc2_pcxdp_shift_arbbf_px;// From arb2 of ccx_arb.v
   wire [7:0]		arbpc2_pcxdp_shift_px;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc3_pcxdp_grant_arbbf_pa;// From arb3 of ccx_arb.v
   wire [7:0]		arbpc3_pcxdp_grant_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc3_pcxdp_q0_hold_arbbf_pa;// From arb3 of ccx_arb.v
   wire [7:0]		arbpc3_pcxdp_q0_hold_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc3_pcxdp_qsel0_arbbf_pa;// From arb3 of ccx_arb.v
   wire [7:0]		arbpc3_pcxdp_qsel0_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc3_pcxdp_qsel1_arbbf_pa;// From arb3 of ccx_arb.v
   wire [7:0]		arbpc3_pcxdp_qsel1_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc3_pcxdp_shift_arbbf_px;// From arb3 of ccx_arb.v
   wire [7:0]		arbpc3_pcxdp_shift_px;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc4_pcxdp_grant_arbbf_pa;// From arb4 of ccx_arb.v
   wire [7:0]		arbpc4_pcxdp_grant_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc4_pcxdp_q0_hold_arbbf_pa;// From arb4 of ccx_arb.v
   wire [7:0]		arbpc4_pcxdp_q0_hold_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc4_pcxdp_qsel0_arbbf_pa;// From arb4 of ccx_arb.v
   wire [7:0]		arbpc4_pcxdp_qsel0_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc4_pcxdp_qsel1_arbbf_pa;// From arb4 of ccx_arb.v
   wire [7:0]		arbpc4_pcxdp_qsel1_pa_l;// From pcx_buf_top of pcx_buf_top.v
   wire [7:0]		arbpc4_pcxdp_shift_arbbf_px;// From arb4 of ccx_arb.v
   wire [7:0]		arbpc4_pcxdp_shift_px;	// From pcx_buf_top of pcx_buf_top.v
   wire			io_pcx_stall_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			pcx_arb0_so_0;		// From arb0 of ccx_arb.v
   wire			pcx_arb1_so_0;		// From arb1 of ccx_arb.v
   wire			pcx_arb2_so_0;		// From arb2 of ccx_arb.v
   wire			pcx_arb3_so_0;		// From arb3 of ccx_arb.v
   wire			pcx_arb4_so_0;		// From arb4 of ccx_arb.v
   wire			pcx_dp_array02_so_1;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_dp_array134_so_0;	// From pcx_dp_array of pcx_dp_array.v
   wire [`PCX_WIDTH-1:0]pcx_fpio_data_px_l;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_fpio_data_rdy_arb_px;// From arb4 of ccx_arb.v
   wire			pcx_scache0_atom_px;	// From arb0 of ccx_arb.v
   wire [`PCX_WIDTH-1:0]pcx_scache0_data_px_l;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_scache0_data_rdy_arb_px;// From arb0 of ccx_arb.v
   wire			pcx_scache1_atom_px;	// From arb1 of ccx_arb.v
   wire [`PCX_WIDTH-1:0]pcx_scache1_data_px_l;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_scache1_data_rdy_arb_px;// From arb1 of ccx_arb.v
   wire			pcx_scache2_atom_px;	// From arb2 of ccx_arb.v
   wire [`PCX_WIDTH-1:0]pcx_scache2_data_px_l;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_scache2_data_rdy_arb_px;// From arb2 of ccx_arb.v
   wire			pcx_scache3_atom_px;	// From arb3 of ccx_arb.v
   wire [`PCX_WIDTH-1:0]pcx_scache3_data_px_l;	// From pcx_dp_array of pcx_dp_array.v
   wire			pcx_scache3_data_rdy_arb_px;// From arb3 of ccx_arb.v
   wire [4:0]		pcx_spc0_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc1_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc2_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc3_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc4_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc5_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc6_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire [4:0]		pcx_spc7_grant_pa;	// From arb0 of ccx_arb.v, ...
   wire			scache0_pcx_stall_bufp1_pq;// From pcx_buf_top of pcx_buf_top.v
   wire			scache3_pcx_stall_bufp3_pq;// From pcx_buf_top of pcx_buf_top.v
   wire			sctag1_pcx_stall_bufp1_pq;// From pcx_buf_top of pcx_buf_top.v
   wire			spc0_pcx_atom_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc0_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc0_pcx_req_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc1_pcx_atom_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc1_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc1_pcx_req_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc2_pcx_atom_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc2_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc2_pcx_req_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc3_pcx_atom_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc3_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc3_pcx_req_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc4_pcx_atom_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc4_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc4_pcx_req_bufp1_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc5_pcx_atom_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc5_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc5_pcx_req_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc6_pcx_atom_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc6_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc6_pcx_req_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire			spc7_pcx_atom_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   wire [`PCX_WIDTH-1:0]spc7_pcx_data_buf_pa;	// From pcx_buf_top of pcx_buf_top.v
   wire [4:0]		spc7_pcx_req_bufp3_pq;	// From pcx_buf_top of pcx_buf_top.v
   // End of automatics
   /*
    pcx_dp_array AUTO_TEMPLATE(
  			     //.scan_out_0(pcx_dp_array134_so_0),
    			     //.si_0(si_0),
                             .arbpc0_pcxdp_q0_hold_pa(arbpc0_pcxdp_q0_hold_pa_l[7:0]),
                             .arbpc1_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa_l[7:0]),
                             .arbpc2_pcxdp_q0_hold_pa(arbpc2_pcxdp_q0_hold_pa_l[7:0]),
                             .arbpc3_pcxdp_q0_hold_pa(arbpc3_pcxdp_q0_hold_pa_l[7:0]),
                             .arbpc4_pcxdp_q0_hold_pa(arbpc4_pcxdp_q0_hold_pa_l[7:0]),
                             .arbpc0_pcxdp_qsel1_pa(arbpc0_pcxdp_qsel1_pa_l[7:0]),
                             .arbpc1_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa_l[7:0]),
                             .arbpc2_pcxdp_qsel1_pa(arbpc2_pcxdp_qsel1_pa_l[7:0]),
                             .arbpc3_pcxdp_qsel1_pa(arbpc3_pcxdp_qsel1_pa_l[7:0]),
                             .arbpc4_pcxdp_qsel1_pa(arbpc4_pcxdp_qsel1_pa_l[7:0]),
			     .spc0_pcx_data_pa(spc0_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc1_pcx_data_pa(spc1_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc2_pcx_data_pa(spc2_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc3_pcx_data_pa(spc3_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc4_pcx_data_pa(spc4_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc5_pcx_data_pa(spc5_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc6_pcx_data_pa(spc6_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			     .spc7_pcx_data_pa(spc7_pcx_data_buf_pa[`PCX_WIDTH-1:0]));
*/
   pcx_dp_array pcx_dp_array(/*AUTOINST*/
			     // Outputs
			     .pcx_dp_array02_so_1(pcx_dp_array02_so_1),
			     .pcx_dp_array134_so_0(pcx_dp_array134_so_0),
			     .pcx_fpio_data_px_l(pcx_fpio_data_px_l[`PCX_WIDTH-1:0]),
			     .pcx_scache0_data_px_l(pcx_scache0_data_px_l[`PCX_WIDTH-1:0]),
			     .pcx_scache1_data_px_l(pcx_scache1_data_px_l[`PCX_WIDTH-1:0]),
			     .pcx_scache2_data_px_l(pcx_scache2_data_px_l[`PCX_WIDTH-1:0]),
			     .pcx_scache3_data_px_l(pcx_scache3_data_px_l[`PCX_WIDTH-1:0]),
			     // Inputs
			     .arbpc0_pcxdp_grant_pa(arbpc0_pcxdp_grant_pa[7:0]),
			     .arbpc0_pcxdp_q0_hold_pa(arbpc0_pcxdp_q0_hold_pa_l[7:0]), // Templated
			     .arbpc0_pcxdp_qsel0_pa(arbpc0_pcxdp_qsel0_pa[7:0]),
			     .arbpc0_pcxdp_qsel1_pa(arbpc0_pcxdp_qsel1_pa_l[7:0]), // Templated
			     .arbpc0_pcxdp_shift_px(arbpc0_pcxdp_shift_px[7:0]),
			     .arbpc1_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[7:0]),
			     .arbpc1_pcxdp_q0_hold_pa(arbpc1_pcxdp_q0_hold_pa_l[7:0]), // Templated
			     .arbpc1_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[7:0]),
			     .arbpc1_pcxdp_qsel1_pa(arbpc1_pcxdp_qsel1_pa_l[7:0]), // Templated
			     .arbpc1_pcxdp_shift_px(arbpc1_pcxdp_shift_px[7:0]),
			     .arbpc2_pcxdp_grant_pa(arbpc2_pcxdp_grant_pa[7:0]),
			     .arbpc2_pcxdp_q0_hold_pa(arbpc2_pcxdp_q0_hold_pa_l[7:0]), // Templated
			     .arbpc2_pcxdp_qsel0_pa(arbpc2_pcxdp_qsel0_pa[7:0]),
			     .arbpc2_pcxdp_qsel1_pa(arbpc2_pcxdp_qsel1_pa_l[7:0]), // Templated
			     .arbpc2_pcxdp_shift_px(arbpc2_pcxdp_shift_px[7:0]),
			     .arbpc3_pcxdp_grant_pa(arbpc3_pcxdp_grant_pa[7:0]),
			     .arbpc3_pcxdp_q0_hold_pa(arbpc3_pcxdp_q0_hold_pa_l[7:0]), // Templated
			     .arbpc3_pcxdp_qsel0_pa(arbpc3_pcxdp_qsel0_pa[7:0]),
			     .arbpc3_pcxdp_qsel1_pa(arbpc3_pcxdp_qsel1_pa_l[7:0]), // Templated
			     .arbpc3_pcxdp_shift_px(arbpc3_pcxdp_shift_px[7:0]),
			     .arbpc4_pcxdp_grant_pa(arbpc4_pcxdp_grant_pa[7:0]),
			     .arbpc4_pcxdp_q0_hold_pa(arbpc4_pcxdp_q0_hold_pa_l[7:0]), // Templated
			     .arbpc4_pcxdp_qsel0_pa(arbpc4_pcxdp_qsel0_pa[7:0]),
			     .arbpc4_pcxdp_qsel1_pa(arbpc4_pcxdp_qsel1_pa_l[7:0]), // Templated
			     .arbpc4_pcxdp_shift_px(arbpc4_pcxdp_shift_px[7:0]),
			     .rclk	(rclk),
			     .se_buf1_bottom(se_buf1_bottom),
			     .se_buf1_top(se_buf1_top),
			     .si_0	(si_0),
			     .si_1	(si_1),
			     .spc0_pcx_data_pa(spc0_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc1_pcx_data_pa(spc1_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc2_pcx_data_pa(spc2_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc3_pcx_data_pa(spc3_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc4_pcx_data_pa(spc4_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc5_pcx_data_pa(spc5_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc6_pcx_data_pa(spc6_pcx_data_buf_pa[`PCX_WIDTH-1:0]), // Templated
			     .spc7_pcx_data_pa(spc7_pcx_data_buf_pa[`PCX_WIDTH-1:0])); // Templated
/*
   ccx_arb  AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbpc@_pcxdp_grant_arbbf_pa[7:0]),
   	   .arb_dp_q0_hold_a		(arbpc@_pcxdp_q0_hold_arbbf_pa[7:0]),
	   .arb_dp_qsel0_a		(arbpc@_pcxdp_qsel0_arbbf_pa[7:0]),
	   .arb_dp_qsel1_a		(arbpc@_pcxdp_qsel1_arbbf_pa[7:0]),
	   .arb_dp_shift_x		(arbpc@_pcxdp_shift_arbbf_px[7:0]),
	   .arb_src0_grant_a		(pcx_spc0_grant_pa[@]),
	   .arb_src1_grant_a		(pcx_spc1_grant_pa[@]),
	   .arb_src2_grant_a		(pcx_spc2_grant_pa[@]),
	   .arb_src3_grant_a		(pcx_spc3_grant_pa[@]),
	   .arb_src4_grant_a		(pcx_spc4_grant_pa[@]),
	   .arb_src5_grant_a		(pcx_spc5_grant_pa[@]),
	   .arb_src6_grant_a		(pcx_spc6_grant_pa[@]),
	   .arb_src7_grant_a		(pcx_spc7_grant_pa[@]),
	   .ccx_dest_data_rdy_x	(pcx_scache@_data_rdy_arb_px),
	   .ccx_dest_atom_x	(pcx_scache@_atom_px),
	     .scan_out			(pcx_arb0_so_0),
	   // Inputs
           .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq),
	   .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[@]),
	   .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq),
	   .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[@]),
	   .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq),
	   .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[@]),
	   .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq),
	   .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[@]),
	   .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq),
	   .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[@]),
	   .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq),
	   .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[@]),
	   .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq),
	   .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[@]),
	   .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq),
	   .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[@]),
	   .stall1_q			(scache@_pcx_stall_bufp1_pq),
	   .stall2_q			(1'b0),
	   .adbginit_l		        (adbginit_l_buf2_middle),
           .reset_l                     (rst_l_buf2_middle),
	     //.tmb_l			(tmb_l),
	     .scan_in			(pcx_dp_array134_so_0),
	     .se			(se_buf2_middle));
      */
ccx_arb arb0(/*AUTOINST*/
	     // Outputs
	     .arb_dp_grant_a		(arbpc0_pcxdp_grant_arbbf_pa[7:0]), // Templated
	     .arb_dp_q0_hold_a		(arbpc0_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel0_a		(arbpc0_pcxdp_qsel0_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel1_a		(arbpc0_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
	     .arb_dp_shift_x		(arbpc0_pcxdp_shift_arbbf_px[7:0]), // Templated
	     .arb_src0_grant_a		(pcx_spc0_grant_pa[0]),	 // Templated
	     .arb_src1_grant_a		(pcx_spc1_grant_pa[0]),	 // Templated
	     .arb_src2_grant_a		(pcx_spc2_grant_pa[0]),	 // Templated
	     .arb_src3_grant_a		(pcx_spc3_grant_pa[0]),	 // Templated
	     .arb_src4_grant_a		(pcx_spc4_grant_pa[0]),	 // Templated
	     .arb_src5_grant_a		(pcx_spc5_grant_pa[0]),	 // Templated
	     .arb_src6_grant_a		(pcx_spc6_grant_pa[0]),	 // Templated
	     .arb_src7_grant_a		(pcx_spc7_grant_pa[0]),	 // Templated
	     .ccx_dest_atom_x		(pcx_scache0_atom_px),	 // Templated
	     .ccx_dest_data_rdy_x	(pcx_scache0_data_rdy_arb_px), // Templated
	     .scan_out			(pcx_arb0_so_0),	 // Templated
	     // Inputs
	     .adbginit_l		(adbginit_l_buf2_middle), // Templated
	     .rclk			(rclk),
	     .reset_l			(rst_l_buf2_middle),	 // Templated
	     .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq), // Templated
	     .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[0]), // Templated
	     .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq), // Templated
	     .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[0]), // Templated
	     .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq), // Templated
	     .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[0]), // Templated
	     .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq), // Templated
	     .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[0]), // Templated
	     .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq), // Templated
	     .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[0]), // Templated
	     .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq), // Templated
	     .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[0]), // Templated
	     .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq), // Templated
	     .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[0]), // Templated
	     .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq), // Templated
	     .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[0]), // Templated
	     .stall1_q			(scache0_pcx_stall_bufp1_pq), // Templated
	     .stall2_q			(1'b0),			 // Templated
	     .scan_in			(pcx_dp_array134_so_0),	 // Templated
	     .se			(se_buf2_middle));	 // Templated
/*
   ccx_arb  AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbpc@_pcxdp_grant_arbbf_pa[7:0]),
   	   .arb_dp_q0_hold_a		(arbpc@_pcxdp_q0_hold_arbbf_pa[7:0]),
	   .arb_dp_qsel0_a		(arbpc@_pcxdp_qsel0_arbbf_pa[7:0]),
	   .arb_dp_qsel1_a		(arbpc@_pcxdp_qsel1_arbbf_pa[7:0]),
	   .arb_dp_shift_x		(arbpc@_pcxdp_shift_arbbf_px[7:0]),
	   .arb_src0_grant_a		(pcx_spc0_grant_pa[@]),
	   .arb_src1_grant_a		(pcx_spc1_grant_pa[@]),
	   .arb_src2_grant_a		(pcx_spc2_grant_pa[@]),
	   .arb_src3_grant_a		(pcx_spc3_grant_pa[@]),
	   .arb_src4_grant_a		(pcx_spc4_grant_pa[@]),
	   .arb_src5_grant_a		(pcx_spc5_grant_pa[@]),
	   .arb_src6_grant_a		(pcx_spc6_grant_pa[@]),
	   .arb_src7_grant_a		(pcx_spc7_grant_pa[@]),
	   .ccx_dest_data_rdy_x	(pcx_scache@_data_rdy_arb_px),
	   .ccx_dest_atom_x	(pcx_scache@_atom_px),
	     .scan_out			(pcx_arb1_so_0),
	   // Inputs
           .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq),
	   .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[@]),
	   .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq),
	   .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[@]),
	   .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq),
	   .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[@]),
	   .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq),
	   .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[@]),
	   .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq),
	   .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[@]),
	   .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq),
	   .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[@]),
	   .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq),
	   .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[@]),
	   .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq),
	   .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[@]),
	   .stall1_q			(sctag@_pcx_stall_bufp1_pq),
	   .stall2_q			(1'b0),
	   .adbginit_l		        (adbginit_l_buf2_middle),
           .reset_l                     (rst_l_buf2_middle),
	     //.tmb_l			(tmb_l),
	     .scan_in			(pcx_arb0_so_0),
	     .se			(se_buf2_middle));
      */
ccx_arb arb1(/*AUTOINST*/
	     // Outputs
	     .arb_dp_grant_a		(arbpc1_pcxdp_grant_arbbf_pa[7:0]), // Templated
	     .arb_dp_q0_hold_a		(arbpc1_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel0_a		(arbpc1_pcxdp_qsel0_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel1_a		(arbpc1_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
	     .arb_dp_shift_x		(arbpc1_pcxdp_shift_arbbf_px[7:0]), // Templated
	     .arb_src0_grant_a		(pcx_spc0_grant_pa[1]),	 // Templated
	     .arb_src1_grant_a		(pcx_spc1_grant_pa[1]),	 // Templated
	     .arb_src2_grant_a		(pcx_spc2_grant_pa[1]),	 // Templated
	     .arb_src3_grant_a		(pcx_spc3_grant_pa[1]),	 // Templated
	     .arb_src4_grant_a		(pcx_spc4_grant_pa[1]),	 // Templated
	     .arb_src5_grant_a		(pcx_spc5_grant_pa[1]),	 // Templated
	     .arb_src6_grant_a		(pcx_spc6_grant_pa[1]),	 // Templated
	     .arb_src7_grant_a		(pcx_spc7_grant_pa[1]),	 // Templated
	     .ccx_dest_atom_x		(pcx_scache1_atom_px),	 // Templated
	     .ccx_dest_data_rdy_x	(pcx_scache1_data_rdy_arb_px), // Templated
	     .scan_out			(pcx_arb1_so_0),	 // Templated
	     // Inputs
	     .adbginit_l		(adbginit_l_buf2_middle), // Templated
	     .rclk			(rclk),
	     .reset_l			(rst_l_buf2_middle),	 // Templated
	     .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq), // Templated
	     .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[1]), // Templated
	     .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq), // Templated
	     .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[1]), // Templated
	     .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq), // Templated
	     .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[1]), // Templated
	     .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq), // Templated
	     .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[1]), // Templated
	     .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq), // Templated
	     .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[1]), // Templated
	     .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq), // Templated
	     .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[1]), // Templated
	     .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq), // Templated
	     .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[1]), // Templated
	     .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq), // Templated
	     .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[1]), // Templated
	     .stall1_q			(sctag1_pcx_stall_bufp1_pq), // Templated
	     .stall2_q			(1'b0),			 // Templated
	     .scan_in			(pcx_arb0_so_0),	 // Templated
	     .se			(se_buf2_middle));	 // Templated
/*
   ccx_arb  AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbpc@_pcxdp_grant_arbbf_pa[7:0]),
   	   .arb_dp_q0_hold_a		(arbpc@_pcxdp_q0_hold_arbbf_pa[7:0]),
	   .arb_dp_qsel0_a		(arbpc@_pcxdp_qsel0_arbbf_pa[7:0]),
	   .arb_dp_qsel1_a		(arbpc@_pcxdp_qsel1_arbbf_pa[7:0]),
	   .arb_dp_shift_x		(arbpc@_pcxdp_shift_arbbf_px[7:0]),
	   .arb_src0_grant_a		(pcx_spc0_grant_pa[@]),
	   .arb_src1_grant_a		(pcx_spc1_grant_pa[@]),
	   .arb_src2_grant_a		(pcx_spc2_grant_pa[@]),
	   .arb_src3_grant_a		(pcx_spc3_grant_pa[@]),
	   .arb_src4_grant_a		(pcx_spc4_grant_pa[@]),
	   .arb_src5_grant_a		(pcx_spc5_grant_pa[@]),
	   .arb_src6_grant_a		(pcx_spc6_grant_pa[@]),
	   .arb_src7_grant_a		(pcx_spc7_grant_pa[@]),
	   .ccx_dest_data_rdy_x	(pcx_scache@_data_rdy_arb_px),
	   .ccx_dest_atom_x	(pcx_scache@_atom_px),
	     .scan_out			(pcx_arb2_so_0),
	   // Inputs
           .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq),
	   .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[@]),
	   .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq),
	   .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[@]),
	   .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq),
	   .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[@]),
	   .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq),
	   .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[@]),
	   .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq),
	   .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[@]),
	   .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq),
	   .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[@]),
	   .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq),
	   .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[@]),
	   .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq),
	   .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[@]),
	   .stall1_q			(sctag@_pcx_stall_pq),
	   .stall2_q			(1'b0),
	   .adbginit_l		        (adbginit_l_buf2_middle),
           .reset_l                     (rst_l_buf2_middle),
	     //.tmb_l			(tmb_l),
	     .scan_in			(pcx_arb1_so_0),
	     .se			(se_buf2_middle));
      */
ccx_arb arb2(/*AUTOINST*/
	     // Outputs
	     .arb_dp_grant_a		(arbpc2_pcxdp_grant_arbbf_pa[7:0]), // Templated
	     .arb_dp_q0_hold_a		(arbpc2_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel0_a		(arbpc2_pcxdp_qsel0_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel1_a		(arbpc2_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
	     .arb_dp_shift_x		(arbpc2_pcxdp_shift_arbbf_px[7:0]), // Templated
	     .arb_src0_grant_a		(pcx_spc0_grant_pa[2]),	 // Templated
	     .arb_src1_grant_a		(pcx_spc1_grant_pa[2]),	 // Templated
	     .arb_src2_grant_a		(pcx_spc2_grant_pa[2]),	 // Templated
	     .arb_src3_grant_a		(pcx_spc3_grant_pa[2]),	 // Templated
	     .arb_src4_grant_a		(pcx_spc4_grant_pa[2]),	 // Templated
	     .arb_src5_grant_a		(pcx_spc5_grant_pa[2]),	 // Templated
	     .arb_src6_grant_a		(pcx_spc6_grant_pa[2]),	 // Templated
	     .arb_src7_grant_a		(pcx_spc7_grant_pa[2]),	 // Templated
	     .ccx_dest_atom_x		(pcx_scache2_atom_px),	 // Templated
	     .ccx_dest_data_rdy_x	(pcx_scache2_data_rdy_arb_px), // Templated
	     .scan_out			(pcx_arb2_so_0),	 // Templated
	     // Inputs
	     .adbginit_l		(adbginit_l_buf2_middle), // Templated
	     .rclk			(rclk),
	     .reset_l			(rst_l_buf2_middle),	 // Templated
	     .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq), // Templated
	     .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[2]), // Templated
	     .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq), // Templated
	     .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[2]), // Templated
	     .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq), // Templated
	     .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[2]), // Templated
	     .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq), // Templated
	     .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[2]), // Templated
	     .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq), // Templated
	     .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[2]), // Templated
	     .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq), // Templated
	     .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[2]), // Templated
	     .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq), // Templated
	     .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[2]), // Templated
	     .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq), // Templated
	     .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[2]), // Templated
	     .stall1_q			(sctag2_pcx_stall_pq),	 // Templated
	     .stall2_q			(1'b0),			 // Templated
	     .scan_in			(pcx_arb1_so_0),	 // Templated
	     .se			(se_buf2_middle));	 // Templated
/*
   ccx_arb  AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbpc@_pcxdp_grant_arbbf_pa[7:0]),
   	   .arb_dp_q0_hold_a		(arbpc@_pcxdp_q0_hold_arbbf_pa[7:0]),
	   .arb_dp_qsel0_a		(arbpc@_pcxdp_qsel0_arbbf_pa[7:0]),
	   .arb_dp_qsel1_a		(arbpc@_pcxdp_qsel1_arbbf_pa[7:0]),
	   .arb_dp_shift_x		(arbpc@_pcxdp_shift_arbbf_px[7:0]),
	   .arb_src0_grant_a		(pcx_spc0_grant_pa[@]),
	   .arb_src1_grant_a		(pcx_spc1_grant_pa[@]),
	   .arb_src2_grant_a		(pcx_spc2_grant_pa[@]),
	   .arb_src3_grant_a		(pcx_spc3_grant_pa[@]),
	   .arb_src4_grant_a		(pcx_spc4_grant_pa[@]),
	   .arb_src5_grant_a		(pcx_spc5_grant_pa[@]),
	   .arb_src6_grant_a		(pcx_spc6_grant_pa[@]),
	   .arb_src7_grant_a		(pcx_spc7_grant_pa[@]),
	   .ccx_dest_data_rdy_x	(pcx_scache@_data_rdy_arb_px),
	   .ccx_dest_atom_x	(pcx_scache@_atom_px),
	     .scan_out			(pcx_arb3_so_0),
	   // Inputs
           .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq),
	   .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[@]),
	   .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq),
	   .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[@]),
	   .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq),
	   .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[@]),
	   .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq),
	   .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[@]),
	   .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq),
	   .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[@]),
	   .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq),
	   .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[@]),
	   .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq),
	   .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[@]),
	   .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq),
	   .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[@]),
	   .stall1_q			(scache@_pcx_stall_bufp3_pq),
	   .stall2_q			(1'b0),
	   .adbginit_l		        (adbginit_l_buf1_middle),
           .reset_l                     (rst_l_buf1_middle),
	     //.tmb_l			(tmb_l),
	     .scan_in			(pcx_arb2_so_0),
	     .se			(se_buf1_middle));
      */
ccx_arb arb3(/*AUTOINST*/
	     // Outputs
	     .arb_dp_grant_a		(arbpc3_pcxdp_grant_arbbf_pa[7:0]), // Templated
	     .arb_dp_q0_hold_a		(arbpc3_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel0_a		(arbpc3_pcxdp_qsel0_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel1_a		(arbpc3_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
	     .arb_dp_shift_x		(arbpc3_pcxdp_shift_arbbf_px[7:0]), // Templated
	     .arb_src0_grant_a		(pcx_spc0_grant_pa[3]),	 // Templated
	     .arb_src1_grant_a		(pcx_spc1_grant_pa[3]),	 // Templated
	     .arb_src2_grant_a		(pcx_spc2_grant_pa[3]),	 // Templated
	     .arb_src3_grant_a		(pcx_spc3_grant_pa[3]),	 // Templated
	     .arb_src4_grant_a		(pcx_spc4_grant_pa[3]),	 // Templated
	     .arb_src5_grant_a		(pcx_spc5_grant_pa[3]),	 // Templated
	     .arb_src6_grant_a		(pcx_spc6_grant_pa[3]),	 // Templated
	     .arb_src7_grant_a		(pcx_spc7_grant_pa[3]),	 // Templated
	     .ccx_dest_atom_x		(pcx_scache3_atom_px),	 // Templated
	     .ccx_dest_data_rdy_x	(pcx_scache3_data_rdy_arb_px), // Templated
	     .scan_out			(pcx_arb3_so_0),	 // Templated
	     // Inputs
	     .adbginit_l		(adbginit_l_buf1_middle), // Templated
	     .rclk			(rclk),
	     .reset_l			(rst_l_buf1_middle),	 // Templated
	     .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq), // Templated
	     .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[3]), // Templated
	     .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq), // Templated
	     .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[3]), // Templated
	     .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq), // Templated
	     .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[3]), // Templated
	     .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq), // Templated
	     .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[3]), // Templated
	     .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq), // Templated
	     .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[3]), // Templated
	     .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq), // Templated
	     .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[3]), // Templated
	     .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq), // Templated
	     .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[3]), // Templated
	     .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq), // Templated
	     .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[3]), // Templated
	     .stall1_q			(scache3_pcx_stall_bufp3_pq), // Templated
	     .stall2_q			(1'b0),			 // Templated
	     .scan_in			(pcx_arb2_so_0),	 // Templated
	     .se			(se_buf1_middle));	 // Templated
   /*
   ccx_arb AUTO_TEMPLATE(
	   // Outputs
	   .arb_dp_grant_a		(arbpc@_pcxdp_grant_arbbf_pa[7:0]),
   	   .arb_dp_q0_hold_a		(arbpc@_pcxdp_q0_hold_arbbf_pa[7:0]),
	   .arb_dp_qsel0_a		(arbpc@_pcxdp_qsel0_arbbf_pa[7:0]),
	   .arb_dp_qsel1_a		(arbpc@_pcxdp_qsel1_arbbf_pa[7:0]),
	   .arb_dp_shift_x		(arbpc@_pcxdp_shift_arbbf_px[7:0]),
	   .arb_src0_grant_a		(pcx_spc0_grant_pa[@]),
	   .arb_src1_grant_a		(pcx_spc1_grant_pa[@]),
	   .arb_src2_grant_a		(pcx_spc2_grant_pa[@]),
	   .arb_src3_grant_a		(pcx_spc3_grant_pa[@]),
	   .arb_src4_grant_a		(pcx_spc4_grant_pa[@]),
	   .arb_src5_grant_a		(pcx_spc5_grant_pa[@]),
	   .arb_src6_grant_a		(pcx_spc6_grant_pa[@]),
	   .arb_src7_grant_a		(pcx_spc7_grant_pa[@]),
	   .ccx_dest_data_rdy_x	        (pcx_fpio_data_rdy_arb_px),
	   .ccx_dest_atom_x	(),
	     .scan_out			(pcx_arb4_so_0),
    	   // Inputs
           .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq),
	   .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[@]),
	   .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq),
	   .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[@]),
	   .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq),
	   .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[@]),
	   .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq),
	   .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[@]),
	   .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq),
	   .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[@]),
	   .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq),
	   .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[@]),
	   .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq),
	   .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[@]),
	   .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq),
	   .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[@]),
	   .stall1_q			(1'b0),
	   .stall2_q			(io_pcx_stall_bufp3_pq),
	   .adbginit_l		        (adbginit_l_buf1_middle),
           .reset_l                     (rst_l_buf1_middle),
	     //.tmb_l			(tmb_l),
	     .scan_in			(pcx_arb3_so_0),
	     .se			(se_buf1_middle));
     */
ccx_arb arb4(/*AUTOINST*/
	     // Outputs
	     .arb_dp_grant_a		(arbpc4_pcxdp_grant_arbbf_pa[7:0]), // Templated
	     .arb_dp_q0_hold_a		(arbpc4_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel0_a		(arbpc4_pcxdp_qsel0_arbbf_pa[7:0]), // Templated
	     .arb_dp_qsel1_a		(arbpc4_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
	     .arb_dp_shift_x		(arbpc4_pcxdp_shift_arbbf_px[7:0]), // Templated
	     .arb_src0_grant_a		(pcx_spc0_grant_pa[4]),	 // Templated
	     .arb_src1_grant_a		(pcx_spc1_grant_pa[4]),	 // Templated
	     .arb_src2_grant_a		(pcx_spc2_grant_pa[4]),	 // Templated
	     .arb_src3_grant_a		(pcx_spc3_grant_pa[4]),	 // Templated
	     .arb_src4_grant_a		(pcx_spc4_grant_pa[4]),	 // Templated
	     .arb_src5_grant_a		(pcx_spc5_grant_pa[4]),	 // Templated
	     .arb_src6_grant_a		(pcx_spc6_grant_pa[4]),	 // Templated
	     .arb_src7_grant_a		(pcx_spc7_grant_pa[4]),	 // Templated
	     .ccx_dest_atom_x		(),			 // Templated
	     .ccx_dest_data_rdy_x	(pcx_fpio_data_rdy_arb_px), // Templated
	     .scan_out			(pcx_arb4_so_0),	 // Templated
	     // Inputs
	     .adbginit_l		(adbginit_l_buf1_middle), // Templated
	     .rclk			(rclk),
	     .reset_l			(rst_l_buf1_middle),	 // Templated
	     .src0_arb_atom_q		(spc0_pcx_atom_bufp1_pq), // Templated
	     .src0_arb_req_q		(spc0_pcx_req_bufp1_pq[4]), // Templated
	     .src1_arb_atom_q		(spc1_pcx_atom_bufp1_pq), // Templated
	     .src1_arb_req_q		(spc1_pcx_req_bufp1_pq[4]), // Templated
	     .src2_arb_atom_q		(spc2_pcx_atom_bufp1_pq), // Templated
	     .src2_arb_req_q		(spc2_pcx_req_bufp1_pq[4]), // Templated
	     .src3_arb_atom_q		(spc3_pcx_atom_bufp1_pq), // Templated
	     .src3_arb_req_q		(spc3_pcx_req_bufp1_pq[4]), // Templated
	     .src4_arb_atom_q		(spc4_pcx_atom_bufp1_pq), // Templated
	     .src4_arb_req_q		(spc4_pcx_req_bufp1_pq[4]), // Templated
	     .src5_arb_atom_q		(spc5_pcx_atom_bufp3_pq), // Templated
	     .src5_arb_req_q		(spc5_pcx_req_bufp3_pq[4]), // Templated
	     .src6_arb_atom_q		(spc6_pcx_atom_bufp3_pq), // Templated
	     .src6_arb_req_q		(spc6_pcx_req_bufp3_pq[4]), // Templated
	     .src7_arb_atom_q		(spc7_pcx_atom_bufp3_pq), // Templated
	     .src7_arb_req_q		(spc7_pcx_req_bufp3_pq[4]), // Templated
	     .stall1_q			(1'b0),			 // Templated
	     .stall2_q			(io_pcx_stall_bufp3_pq), // Templated
	     .scan_in			(pcx_arb3_so_0),	 // Templated
	     .se			(se_buf1_middle));	 // Templated
/*
   pcx_buf_top AUTO_TEMPLATE(
		// Outputs
                           .pcx_scache0_atom_px1(pcx_sctag0_atm_px1),
                           .pcx_scache0_data_px2(pcx_sctag0_data_px2[`PCX_WIDTH-1:0]),
                           .pcx_scache0_data_rdy_px(pcx_sctag0_data_rdy_px1),
                           .pcx_scache1_atom_px1(pcx_sctag1_atm_px1),
                           .pcx_scache1_data_px2(pcx_sctag1_data_px2[`PCX_WIDTH-1:0]),
                           .pcx_scache1_data_rdy_px(pcx_sctag1_data_rdy_px1),
                           .pcx_scache2_atom_px1(pcx_sctag2_atm_px1),
                           .pcx_scache2_data_px2(pcx_sctag2_data_px2[`PCX_WIDTH-1:0]),
                           .pcx_scache2_data_rdy_px(pcx_sctag2_data_rdy_px1),
                           .pcx_scache3_atom_px1(pcx_sctag3_atm_px1),
                           .pcx_scache3_data_px2(pcx_sctag3_data_px2[`PCX_WIDTH-1:0]),
                           .pcx_scache3_data_rdy_px(pcx_sctag3_data_rdy_px1),
		// Inputs
                           .si_0(pcx_arb4_so_0),
                           .si_1(pcx_dp_array02_so_1),
                           //.se(shiftenable),
                           .arbpc0_pcxdp_q0_hold_arbbf_pa_l(arbpc0_pcxdp_q0_hold_arbbf_pa[7:0]),
                           .arbpc1_pcxdp_q0_hold_arbbf_pa_l(arbpc1_pcxdp_q0_hold_arbbf_pa[7:0]),
                           .arbpc2_pcxdp_q0_hold_arbbf_pa_l(arbpc2_pcxdp_q0_hold_arbbf_pa[7:0]),
                           .arbpc3_pcxdp_q0_hold_arbbf_pa_l(arbpc3_pcxdp_q0_hold_arbbf_pa[7:0]),
                           .arbpc4_pcxdp_q0_hold_arbbf_pa_l(arbpc4_pcxdp_q0_hold_arbbf_pa[7:0]),
                           .arbpc0_pcxdp_qsel1_arbbf_pa_l(arbpc0_pcxdp_qsel1_arbbf_pa[7:0]),
                           .arbpc1_pcxdp_qsel1_arbbf_pa_l(arbpc1_pcxdp_qsel1_arbbf_pa[7:0]),
                           .arbpc2_pcxdp_qsel1_arbbf_pa_l(arbpc2_pcxdp_qsel1_arbbf_pa[7:0]),
                           .arbpc3_pcxdp_qsel1_arbbf_pa_l(arbpc3_pcxdp_qsel1_arbbf_pa[7:0]),
                           .arbpc4_pcxdp_qsel1_arbbf_pa_l(arbpc4_pcxdp_qsel1_arbbf_pa[7:0]),
                           .scache0_pcx_stall_pq(sctag0_pcx_stall_pq),
                           .scache3_pcx_stall_pq(sctag3_pcx_stall_pq));
*/
   pcx_buf_top pcx_buf_top(/*AUTOINST*/
			   // Outputs
			   .arbpc0_pcxdp_grant_pa(arbpc0_pcxdp_grant_pa[7:0]),
			   .arbpc0_pcxdp_q0_hold_pa_l(arbpc0_pcxdp_q0_hold_pa_l[7:0]),
			   .arbpc0_pcxdp_qsel0_pa(arbpc0_pcxdp_qsel0_pa[7:0]),
			   .arbpc0_pcxdp_qsel1_pa_l(arbpc0_pcxdp_qsel1_pa_l[7:0]),
			   .arbpc0_pcxdp_shift_px(arbpc0_pcxdp_shift_px[7:0]),
			   .arbpc1_pcxdp_grant_pa(arbpc1_pcxdp_grant_pa[7:0]),
			   .arbpc1_pcxdp_q0_hold_pa_l(arbpc1_pcxdp_q0_hold_pa_l[7:0]),
			   .arbpc1_pcxdp_qsel0_pa(arbpc1_pcxdp_qsel0_pa[7:0]),
			   .arbpc1_pcxdp_qsel1_pa_l(arbpc1_pcxdp_qsel1_pa_l[7:0]),
			   .arbpc1_pcxdp_shift_px(arbpc1_pcxdp_shift_px[7:0]),
			   .arbpc2_pcxdp_grant_pa(arbpc2_pcxdp_grant_pa[7:0]),
			   .arbpc2_pcxdp_q0_hold_pa_l(arbpc2_pcxdp_q0_hold_pa_l[7:0]),
			   .arbpc2_pcxdp_qsel0_pa(arbpc2_pcxdp_qsel0_pa[7:0]),
			   .arbpc2_pcxdp_qsel1_pa_l(arbpc2_pcxdp_qsel1_pa_l[7:0]),
			   .arbpc2_pcxdp_shift_px(arbpc2_pcxdp_shift_px[7:0]),
			   .arbpc3_pcxdp_grant_pa(arbpc3_pcxdp_grant_pa[7:0]),
			   .arbpc3_pcxdp_q0_hold_pa_l(arbpc3_pcxdp_q0_hold_pa_l[7:0]),
			   .arbpc3_pcxdp_qsel0_pa(arbpc3_pcxdp_qsel0_pa[7:0]),
			   .arbpc3_pcxdp_qsel1_pa_l(arbpc3_pcxdp_qsel1_pa_l[7:0]),
			   .arbpc3_pcxdp_shift_px(arbpc3_pcxdp_shift_px[7:0]),
			   .arbpc4_pcxdp_grant_pa(arbpc4_pcxdp_grant_pa[7:0]),
			   .arbpc4_pcxdp_q0_hold_pa_l(arbpc4_pcxdp_q0_hold_pa_l[7:0]),
			   .arbpc4_pcxdp_qsel0_pa(arbpc4_pcxdp_qsel0_pa[7:0]),
			   .arbpc4_pcxdp_qsel1_pa_l(arbpc4_pcxdp_qsel1_pa_l[7:0]),
			   .arbpc4_pcxdp_shift_px(arbpc4_pcxdp_shift_px[7:0]),
			   .arst_l_buf_fpio_inff(arst_l_buf_fpio_inff),
			   .io_pcx_stall_bufp3_pq(io_pcx_stall_bufp3_pq),
			   .pcx_buf_top_pt0_so_0(pcx_buf_top_pt0_so_0),
			   .pcx_fpio_data_px2(pcx_fpio_data_px2[`PCX_WIDTH-1:0]),
			   .pcx_fpio_data_rdy_px2(pcx_fpio_data_rdy_px2),
			   .pcx_io_data_px2(pcx_io_data_px2[`PCX_WIDTH-1:0]),
			   .pcx_io_data_rdy_px2(pcx_io_data_rdy_px2),
			   .pcx_iodata_px2_so_1(pcx_iodata_px2_so_1),
			   .pcx_scache0_atom_px1(pcx_sctag0_atm_px1), // Templated
			   .pcx_scache0_dat_px2_so_1(pcx_scache0_dat_px2_so_1),
			   .pcx_scache0_data_px2(pcx_sctag0_data_px2[`PCX_WIDTH-1:0]), // Templated
			   .pcx_scache0_data_rdy_px(pcx_sctag0_data_rdy_px1), // Templated
			   .pcx_scache1_atom_px1(pcx_sctag1_atm_px1), // Templated
			   .pcx_scache1_dat_px2_so_1(pcx_scache1_dat_px2_so_1),
			   .pcx_scache1_data_px2(pcx_sctag1_data_px2[`PCX_WIDTH-1:0]), // Templated
			   .pcx_scache1_data_rdy_px(pcx_sctag1_data_rdy_px1), // Templated
			   .pcx_scache2_atom_px1(pcx_sctag2_atm_px1), // Templated
			   .pcx_scache2_dat_px2_so_1(pcx_scache2_dat_px2_so_1),
			   .pcx_scache2_data_px2(pcx_sctag2_data_px2[`PCX_WIDTH-1:0]), // Templated
			   .pcx_scache2_data_rdy_px(pcx_sctag2_data_rdy_px1), // Templated
			   .pcx_scache3_atom_px1(pcx_sctag3_atm_px1), // Templated
			   .pcx_scache3_data_px2(pcx_sctag3_data_px2[`PCX_WIDTH-1:0]), // Templated
			   .pcx_scache3_data_rdy_px(pcx_sctag3_data_rdy_px1), // Templated
			   .pcx_spc0_grant_px(pcx_spc0_grant_px[4:0]),
			   .pcx_spc1_grant_px(pcx_spc1_grant_px[4:0]),
			   .pcx_spc2_grant_px(pcx_spc2_grant_px[4:0]),
			   .pcx_spc3_grant_px(pcx_spc3_grant_px[4:0]),
			   .pcx_spc4_grant_px(pcx_spc4_grant_px[4:0]),
			   .pcx_spc5_grant_px(pcx_spc5_grant_px[4:0]),
			   .pcx_spc6_grant_px(pcx_spc6_grant_px[4:0]),
			   .pcx_spc7_grant_px(pcx_spc7_grant_px[4:0]),
			   .scache0_pcx_stall_bufp1_pq(scache0_pcx_stall_bufp1_pq),
			   .scache3_pcx_stall_bufp3_pq(scache3_pcx_stall_bufp3_pq),
			   .sctag1_pcx_stall_bufp1_pq(sctag1_pcx_stall_bufp1_pq),
			   .spc0_pcx_atom_bufp1_pq(spc0_pcx_atom_bufp1_pq),
			   .spc0_pcx_data_buf_pa(spc0_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc0_pcx_req_bufp1_pq(spc0_pcx_req_bufp1_pq[4:0]),
			   .spc1_pcx_atom_bufp1_pq(spc1_pcx_atom_bufp1_pq),
			   .spc1_pcx_data_buf_pa(spc1_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc1_pcx_req_bufp1_pq(spc1_pcx_req_bufp1_pq[4:0]),
			   .spc2_pcx_atom_bufp1_pq(spc2_pcx_atom_bufp1_pq),
			   .spc2_pcx_data_buf_pa(spc2_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc2_pcx_req_bufp1_pq(spc2_pcx_req_bufp1_pq[4:0]),
			   .spc3_pcx_atom_bufp1_pq(spc3_pcx_atom_bufp1_pq),
			   .spc3_pcx_data_buf_pa(spc3_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc3_pcx_req_bufp1_pq(spc3_pcx_req_bufp1_pq[4:0]),
			   .spc4_pcx_atom_bufp1_pq(spc4_pcx_atom_bufp1_pq),
			   .spc4_pcx_data_buf_pa(spc4_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc4_pcx_req_bufp1_pq(spc4_pcx_req_bufp1_pq[4:0]),
			   .spc5_pcx_atom_bufp3_pq(spc5_pcx_atom_bufp3_pq),
			   .spc5_pcx_data_buf_pa(spc5_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc5_pcx_req_bufp3_pq(spc5_pcx_req_bufp3_pq[4:0]),
			   .spc6_pcx_atom_bufp3_pq(spc6_pcx_atom_bufp3_pq),
			   .spc6_pcx_data_buf_pa(spc6_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc6_pcx_req_bufp3_pq(spc6_pcx_req_bufp3_pq[4:0]),
			   .spc7_pcx_atom_bufp3_pq(spc7_pcx_atom_bufp3_pq),
			   .spc7_pcx_data_buf_pa(spc7_pcx_data_buf_pa[`PCX_WIDTH-1:0]),
			   .spc7_pcx_req_bufp3_pq(spc7_pcx_req_bufp3_pq[4:0]),
			   // Inputs
			   .arbpc0_pcxdp_grant_arbbf_pa(arbpc0_pcxdp_grant_arbbf_pa[7:0]),
			   .arbpc0_pcxdp_q0_hold_arbbf_pa_l(arbpc0_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
			   .arbpc0_pcxdp_qsel0_arbbf_pa(arbpc0_pcxdp_qsel0_arbbf_pa[7:0]),
			   .arbpc0_pcxdp_qsel1_arbbf_pa_l(arbpc0_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
			   .arbpc0_pcxdp_shift_arbbf_px(arbpc0_pcxdp_shift_arbbf_px[7:0]),
			   .arbpc1_pcxdp_grant_arbbf_pa(arbpc1_pcxdp_grant_arbbf_pa[7:0]),
			   .arbpc1_pcxdp_q0_hold_arbbf_pa_l(arbpc1_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
			   .arbpc1_pcxdp_qsel0_arbbf_pa(arbpc1_pcxdp_qsel0_arbbf_pa[7:0]),
			   .arbpc1_pcxdp_qsel1_arbbf_pa_l(arbpc1_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
			   .arbpc1_pcxdp_shift_arbbf_px(arbpc1_pcxdp_shift_arbbf_px[7:0]),
			   .arbpc2_pcxdp_grant_arbbf_pa(arbpc2_pcxdp_grant_arbbf_pa[7:0]),
			   .arbpc2_pcxdp_q0_hold_arbbf_pa_l(arbpc2_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
			   .arbpc2_pcxdp_qsel0_arbbf_pa(arbpc2_pcxdp_qsel0_arbbf_pa[7:0]),
			   .arbpc2_pcxdp_qsel1_arbbf_pa_l(arbpc2_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
			   .arbpc2_pcxdp_shift_arbbf_px(arbpc2_pcxdp_shift_arbbf_px[7:0]),
			   .arbpc3_pcxdp_grant_arbbf_pa(arbpc3_pcxdp_grant_arbbf_pa[7:0]),
			   .arbpc3_pcxdp_q0_hold_arbbf_pa_l(arbpc3_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
			   .arbpc3_pcxdp_qsel0_arbbf_pa(arbpc3_pcxdp_qsel0_arbbf_pa[7:0]),
			   .arbpc3_pcxdp_qsel1_arbbf_pa_l(arbpc3_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
			   .arbpc3_pcxdp_shift_arbbf_px(arbpc3_pcxdp_shift_arbbf_px[7:0]),
			   .arbpc4_pcxdp_grant_arbbf_pa(arbpc4_pcxdp_grant_arbbf_pa[7:0]),
			   .arbpc4_pcxdp_q0_hold_arbbf_pa_l(arbpc4_pcxdp_q0_hold_arbbf_pa[7:0]), // Templated
			   .arbpc4_pcxdp_qsel0_arbbf_pa(arbpc4_pcxdp_qsel0_arbbf_pa[7:0]),
			   .arbpc4_pcxdp_qsel1_arbbf_pa_l(arbpc4_pcxdp_qsel1_arbbf_pa[7:0]), // Templated
			   .arbpc4_pcxdp_shift_arbbf_px(arbpc4_pcxdp_shift_arbbf_px[7:0]),
			   .ccx_clk_hdr_so_1(ccx_clk_hdr_so_1),
			   .cmp_arst_l	(cmp_arst_l),
			   .cpx_buf_top_pt0_so_1(cpx_buf_top_pt0_so_1),
			   .io_pcx_stall_pq(io_pcx_stall_pq),
			   .pcx_fpio_data_px_l(pcx_fpio_data_px_l[`PCX_WIDTH-1:0]),
			   .pcx_fpio_data_rdy_arb_px(pcx_fpio_data_rdy_arb_px),
			   .pcx_scache0_atom_px(pcx_scache0_atom_px),
			   .pcx_scache0_data_px_l(pcx_scache0_data_px_l[`PCX_WIDTH-1:0]),
			   .pcx_scache0_data_rdy_arb_px(pcx_scache0_data_rdy_arb_px),
			   .pcx_scache1_atom_px(pcx_scache1_atom_px),
			   .pcx_scache1_data_px_l(pcx_scache1_data_px_l[`PCX_WIDTH-1:0]),
			   .pcx_scache1_data_rdy_arb_px(pcx_scache1_data_rdy_arb_px),
			   .pcx_scache2_atom_px(pcx_scache2_atom_px),
			   .pcx_scache2_data_px_l(pcx_scache2_data_px_l[`PCX_WIDTH-1:0]),
			   .pcx_scache2_data_rdy_arb_px(pcx_scache2_data_rdy_arb_px),
			   .pcx_scache3_atom_px(pcx_scache3_atom_px),
			   .pcx_scache3_data_px_l(pcx_scache3_data_px_l[`PCX_WIDTH-1:0]),
			   .pcx_scache3_data_rdy_arb_px(pcx_scache3_data_rdy_arb_px),
			   .pcx_spc0_grant_pa(pcx_spc0_grant_pa[4:0]),
			   .pcx_spc1_grant_pa(pcx_spc1_grant_pa[4:0]),
			   .pcx_spc2_grant_pa(pcx_spc2_grant_pa[4:0]),
			   .pcx_spc3_grant_pa(pcx_spc3_grant_pa[4:0]),
			   .pcx_spc4_grant_pa(pcx_spc4_grant_pa[4:0]),
			   .pcx_spc5_grant_pa(pcx_spc5_grant_pa[4:0]),
			   .pcx_spc6_grant_pa(pcx_spc6_grant_pa[4:0]),
			   .pcx_spc7_grant_pa(pcx_spc7_grant_pa[4:0]),
			   .pt1_so_1	(pt1_so_1),
			   .rclk	(rclk),
			   .scache0_pcx_stall_pq(sctag0_pcx_stall_pq), // Templated
			   .scache3_pcx_stall_pq(sctag3_pcx_stall_pq), // Templated
			   .sctag1_pcx_stall_pq(sctag1_pcx_stall_pq),
			   .se_buf0_middle(se_buf0_middle),
			   .se_buf1_bottom(se_buf1_bottom),
			   .se_buf1_top	(se_buf1_top),
			   .se_buf2_bottom(se_buf2_bottom),
			   .se_buf2_top	(se_buf2_top),
			   .se_buf3_bottom(se_buf3_bottom),
			   .se_buf3_middle(se_buf3_middle),
			   .se_buf3_top	(se_buf3_top),
			   .se_buf4_bottom(se_buf4_bottom),
			   .se_buf4_top	(se_buf4_top),
			   .se_buf5_bottom(se_buf5_bottom),
			   .se_buf5_top	(se_buf5_top),
			   .si_0	(pcx_arb4_so_0),	 // Templated
			   .si_1	(pcx_dp_array02_so_1),	 // Templated
			   .spc0_pcx_atom_pq(spc0_pcx_atom_pq),
			   .spc0_pcx_req_pq(spc0_pcx_req_pq[4:0]),
			   .spc1_pcx_atom_pq(spc1_pcx_atom_pq),
			   .spc1_pcx_req_pq(spc1_pcx_req_pq[4:0]),
			   .spc2_pcx_atom_pq(spc2_pcx_atom_pq),
			   .spc2_pcx_req_pq(spc2_pcx_req_pq[4:0]),
			   .spc3_pcx_atom_pq(spc3_pcx_atom_pq),
			   .spc3_pcx_req_pq(spc3_pcx_req_pq[4:0]),
			   .spc4_pcx_atom_pq(spc4_pcx_atom_pq),
			   .spc4_pcx_req_pq(spc4_pcx_req_pq[4:0]),
			   .spc5_pcx_atom_pq(spc5_pcx_atom_pq),
			   .spc5_pcx_req_pq(spc5_pcx_req_pq[4:0]),
			   .spc6_pcx_atom_pq(spc6_pcx_atom_pq),
			   .spc6_pcx_req_pq(spc6_pcx_req_pq[4:0]),
			   .spc7_pcx_atom_pq(spc7_pcx_atom_pq),
			   .spc7_pcx_req_pq(spc7_pcx_req_pq[4:0]),
			   .spc1_pcx_data_pa(spc1_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc3_pcx_data_pa(spc3_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc5_pcx_data_pa(spc5_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc7_pcx_data_pa(spc7_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc0_pcx_data_pa(spc0_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc2_pcx_data_pa(spc2_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc4_pcx_data_pa(spc4_pcx_data_pa[`PCX_WIDTH-1:0]),
			   .spc6_pcx_data_pa(spc6_pcx_data_pa[`PCX_WIDTH-1:0]));
endmodule