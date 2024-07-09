module named dut to include at compile time
   //#############################################################
   dut #(.PW(PW),
	  .N(N)
	  )
   dut (// Outputs
	.dut_active	(dut_active),
	.clkout		(clkout),
	.wait_out	(dut_wait[N-1:0]),
	.access_out	(dut_access[N-1:0]),
	.packet_out	(dut_packet[N*PW-1:0]),
	// Inputs
	.clk1		(clk1),
	.clk2		(clk2),
	.nreset		(nreset),
	.vdd		(vdd[N*N-1:0]),
	.vss	        (vss),
	.access_in	(stim_access[N-1:0]),
	.packet_in	(stim_packet[N*PW-1:0]),
	.wait_in	(stim_wait[N-1:0]));
   //##############################
   //# STIMULUS + MONITORS
   //##############################
   /*dv_driver AUTO_TEMPLATE(
    .name         (@"(substring vl-cell-name  0 2)"_name[]),
    .coreid	  (@"(substring vl-cell-name  0 2)"_coreid[IDW-1:0]),
            );
    */
   dv_driver #(.AW(AW),
	       .N(N),
	       .NAME("test"),
	       .IDW(IDW)
	     )
   dv_driver (.coreid			(dv_coreid[IDW-1:0]),
	      .clkin			(clk1),
	      /*AUTOINST*/
	      // Outputs
	      .stim_access		(stim_access[N-1:0]),
	      .stim_packet		(stim_packet[N*PW-1:0]),
	      .stim_wait		(stim_wait[N-1:0]),
	      .stim_done		(stim_done),
	      // Inputs
	      .clkout			(clkout),
	      .nreset			(nreset),
	      .start			(start),
	      .dut_access		(dut_access[N-1:0]),
	      .dut_packet		(dut_packet[N*PW-1:0]),
	      .dut_wait			(dut_wait[N-1:0]));
endmodule