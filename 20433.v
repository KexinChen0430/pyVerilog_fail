module outputs)
   wire			fifo_access;		// From mrx_protocol of mrx_protocol.v
   wire [PW-1:0]	fifo_packet;		// From mrx_protocol of mrx_protocol.v
   wire			io_access;		// From mrx_io of mrx_io.v
   wire [2*NMIO-1:0]	io_packet;		// From mrx_io of mrx_io.v
   // End of automatics
   //########################################
   //# SYNCHRONIZATION FIFO
   //########################################
  /*oh_fifo_cdc  AUTO_TEMPLATE (
   // outputs
   .prog_full	(rx_prog_full),
   .full	(rx_full),
   .empty	(rx_empty),
   .wait_out    (rx_wait),
   .access_out  (access_out),
   .packet_out  (packet_out[PW-1:0]),
   // inputs
   .nreset	(nreset),
   .clk_in	(rx_clk),
   .access_in	(fifo_access),
   .packet_in	(fifo_packet[PW-1:0]),
   .clk_out	(clk),
   .wait_in	(wait_in),
    );
   */
   oh_fifo_cdc  #(.TARGET(TARGET),
		  .DW(PW),
		  .DEPTH(FIFO_DEPTH))
   fifo  (/*AUTOINST*/
	  // Outputs
	  .wait_out			(rx_wait),		 // Templated
	  .access_out			(access_out),		 // Templated
	  .packet_out			(packet_out[PW-1:0]),	 // Templated
	  .prog_full			(rx_prog_full),		 // Templated
	  .full				(rx_full),		 // Templated
	  .empty			(rx_empty),		 // Templated
	  // Inputs
	  .nreset			(nreset),		 // Templated
	  .clk_in			(rx_clk),		 // Templated
	  .access_in			(fifo_access),		 // Templated
	  .packet_in			(fifo_packet[PW-1:0]),	 // Templated
	  .clk_out			(clk),			 // Templated
	  .wait_in			(wait_in));		 // Templated
   //########################################
   //# PROTOCOL
   //########################################
   mrx_protocol #(.PW(PW),
		  .NMIO(NMIO))
   mrx_protocol (/*AUTOINST*/
		 // Outputs
		 .fifo_access		(fifo_access),
		 .fifo_packet		(fifo_packet[PW-1:0]),
		 // Inputs
		 .rx_clk		(rx_clk),
		 .nreset		(nreset),
		 .datasize		(datasize[7:0]),
		 .lsbfirst		(lsbfirst),
		 .io_access		(io_access),
		 .io_packet		(io_packet[2*NMIO-1:0]));
   //########################################
   //# FAST IO (DDR)
   //########################################
   mrx_io #(.NMIO(NMIO))
   mrx_io (
	   /*AUTOINST*/
	   // Outputs
	   .io_access			(io_access),
	   .io_packet			(io_packet[2*NMIO-1:0]),
	   // Inputs
	   .nreset			(nreset),
	   .rx_clk			(rx_clk),
	   .ddr_mode			(ddr_mode),
	   .lsbfirst			(lsbfirst),
	   .framepol			(framepol),
	   .rx_packet			(rx_packet[NMIO-1:0]),
	   .rx_access			(rx_access));
endmodule