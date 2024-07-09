module outputs)
   wire			dut_access;		// From dv_elink of dv_elink.v
   wire			dut_failed;		// From dv_elink of dv_elink.v
   wire [PW-1:0]	dut_packet;		// From dv_elink of dv_elink.v
   wire			dut_passed;		// From dv_elink of dv_elink.v
   wire			dut_rd_wait;		// From dv_elink of dv_elink.v
   wire			dut_wr_wait;		// From dv_elink of dv_elink.v
   // End of automatics
   emesh2packet e2p (
		     // Outputs
		     .packet_out	(ext_packet[PW-1:0]),
		     // Inputs
		     .access_in		(ext_access),
		     .write_in		(ext_write),
		     .datamode_in	(ext_datamode[1:0]),
		     .ctrlmode_in	(ext_ctrlmode[3:0]),
		     .dstaddr_in	(ext_dstaddr[AW-1:0]),
		     .data_in		(ext_data[DW-1:0]),
		     .srcaddr_in	(ext_srcaddr[AW-1:0]));
   //dut
   dv_elink dv_elink(/*AUTOINST*/
		     // Outputs
		     .dut_passed	(dut_passed),
		     .dut_failed	(dut_failed),
		     .dut_rd_wait	(dut_rd_wait),
		     .dut_wr_wait	(dut_wr_wait),
		     .dut_access	(dut_access),
		     .dut_packet	(dut_packet[PW-1:0]),
		     // Inputs
		     .clk		(clk),
		     .reset		(reset),
		     .ext_access	(ext_access),
		     .ext_packet	(ext_packet[PW-1:0]),
		     .ext_rd_wait	(ext_rd_wait),
		     .ext_wr_wait	(ext_wr_wait));
endmodule