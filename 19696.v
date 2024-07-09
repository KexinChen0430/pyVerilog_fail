module outputs)
   // End of automatics
   input  scan_in;
   output scan_out;
       /*
   pcx_dp0 AUTO_TEMPLATE(
			  .scan_out	(),
			  .scan_in	());
*/
   pcx_dp0 pcx_dp0(/*AUTOINST*/
		   // Outputs
		   .scan_out		(),			 // Templated
		   .pcx_scache0_data_px_l(pcx_scache0_data_px_l[`PCX_WIDTH-1:0]),
		   // Inputs
		   .arbpc0_pcxdp_grant_pa(arbpc0_pcxdp_grant_pa[7:0]),
		   .arbpc0_pcxdp_q0_hold_pa(arbpc0_pcxdp_q0_hold_pa[7:0]),
		   .arbpc0_pcxdp_qsel0_pa(arbpc0_pcxdp_qsel0_pa[7:0]),
		   .arbpc0_pcxdp_qsel1_pa(arbpc0_pcxdp_qsel1_pa[7:0]),
		   .arbpc0_pcxdp_shift_px(arbpc0_pcxdp_shift_px[7:0]),
		   .rclk		(rclk),
		   .scan_in		(),			 // Templated
		   .shiftenable		(shiftenable),
		   .spc0_pcx_data_pa	(spc0_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc1_pcx_data_pa	(spc1_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc2_pcx_data_pa	(spc2_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc3_pcx_data_pa	(spc3_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc4_pcx_data_pa	(spc4_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc5_pcx_data_pa	(spc5_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc6_pcx_data_pa	(spc6_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc7_pcx_data_pa	(spc7_pcx_data_pa[`PCX_WIDTH-1:0]));
       /*
   pcx_dp2 AUTO_TEMPLATE(
			  .scan_out	(),
			  .scan_in	());
*/
   pcx_dp2 pcx_dp2(/*AUTOINST*/
		   // Outputs
		   .scan_out		(),			 // Templated
		   .pcx_scache2_data_px_l(pcx_scache2_data_px_l[`PCX_WIDTH-1:0]),
		   // Inputs
		   .arbpc2_pcxdp_grant_pa(arbpc2_pcxdp_grant_pa[7:0]),
		   .arbpc2_pcxdp_q0_hold_pa(arbpc2_pcxdp_q0_hold_pa[7:0]),
		   .arbpc2_pcxdp_qsel0_pa(arbpc2_pcxdp_qsel0_pa[7:0]),
		   .arbpc2_pcxdp_qsel1_pa(arbpc2_pcxdp_qsel1_pa[7:0]),
		   .arbpc2_pcxdp_shift_px(arbpc2_pcxdp_shift_px[7:0]),
		   .rclk		(rclk),
		   .scan_in		(),			 // Templated
		   .shiftenable		(shiftenable),
		   .spc0_pcx_data_pa	(spc0_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc1_pcx_data_pa	(spc1_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc2_pcx_data_pa	(spc2_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc3_pcx_data_pa	(spc3_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc4_pcx_data_pa	(spc4_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc5_pcx_data_pa	(spc5_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc6_pcx_data_pa	(spc6_pcx_data_pa[`PCX_WIDTH-1:0]),
		   .spc7_pcx_data_pa	(spc7_pcx_data_pa[`PCX_WIDTH-1:0]));
endmodule