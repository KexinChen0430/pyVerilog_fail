module outputs)
   wire			amode;			// From mio_regs of mio_regs.v
   wire			clkchange;		// From mio_regs of mio_regs.v
   wire [7:0]		clkdiv;			// From mio_regs of mio_regs.v
   wire [15:0]		clkphase0;		// From mio_regs of mio_regs.v
   wire [15:0]		clkphase1;		// From mio_regs of mio_regs.v
   wire [4:0]		ctrlmode;		// From mio_regs of mio_regs.v
   wire [7:0]		datasize;		// From mio_regs of mio_regs.v
   wire			ddr_mode;		// From mio_regs of mio_regs.v
   wire [AW-1:0]	dstaddr;		// From mio_regs of mio_regs.v
   wire			emode;			// From mio_regs of mio_regs.v
   wire			framepol;		// From mio_regs of mio_regs.v
   wire			io_clk;			// From oh_clockdiv of oh_clockdiv.v
   wire			lsbfirst;		// From mio_regs of mio_regs.v
   wire			rx_access_io2c;		// From mio_dp of mio_dp.v
   wire			rx_empty;		// From mio_dp of mio_dp.v
   wire			rx_en;			// From mio_regs of mio_regs.v
   wire			rx_full;		// From mio_dp of mio_dp.v
   wire [MPW-1:0]	rx_packet_io2c;		// From mio_dp of mio_dp.v
   wire			rx_prog_full;		// From mio_dp of mio_dp.v
   wire			rx_wait_c2io;		// From mio_if of mio_if.v
   wire			tx_access_c2io;		// From mio_if of mio_if.v
   wire			tx_empty;		// From mio_dp of mio_dp.v
   wire			tx_en;			// From mio_regs of mio_regs.v
   wire			tx_full;		// From mio_dp of mio_dp.v
   wire [MPW-1:0]	tx_packet_c2io;		// From mio_if of mio_if.v
   wire			tx_prog_full;		// From mio_dp of mio_dp.v
   wire			tx_wait_io2c;		// From mio_dp of mio_dp.v
   // End of automatics
   //################################
   //# CONFIGURATION REGISTERS
   //################################
   /*mio_regs  AUTO_TEMPLATE (.\(.*\)_out (reg_\1_out[]),
                              .\(.*\)_in  (reg_\1_in[]),
    );
    */
   mio_regs  #(.AW(AW),
	       .PW(PW),
	       .DEF_CFG(DEF_CFG),
	       .DEF_CLK(DEF_CLK))
   mio_regs (.dmode			(),
	     /*AUTOINST*/
	     // Outputs
	     .wait_out			(reg_wait_out),		 // Templated
	     .access_out		(reg_access_out),	 // Templated
	     .packet_out		(reg_packet_out[PW-1:0]), // Templated
	     .tx_en			(tx_en),
	     .rx_en			(rx_en),
	     .ddr_mode			(ddr_mode),
	     .emode			(emode),
	     .amode			(amode),
	     .datasize			(datasize[7:0]),
	     .lsbfirst			(lsbfirst),
	     .framepol			(framepol),
	     .ctrlmode			(ctrlmode[4:0]),
	     .dstaddr			(dstaddr[AW-1:0]),
	     .clkchange			(clkchange),
	     .clkdiv			(clkdiv[7:0]),
	     .clkphase0			(clkphase0[15:0]),
	     .clkphase1			(clkphase1[15:0]),
	     // Inputs
	     .clk			(clk),
	     .nreset			(nreset),
	     .access_in			(reg_access_in),	 // Templated
	     .packet_in			(reg_packet_in[PW-1:0]), // Templated
	     .wait_in			(reg_wait_in),		 // Templated
	     .tx_full			(tx_full),
	     .tx_prog_full		(tx_prog_full),
	     .tx_empty			(tx_empty),
	     .rx_full			(rx_full),
	     .rx_prog_full		(rx_prog_full),
	     .rx_empty			(rx_empty));
   //################################
   //# TX CLOCK DRIVER
   //################################
   /*oh_clockdiv  AUTO_TEMPLATE (
                                .clkout0	(io_clk),
                                .clkout1	(tx_clk),
                                .clken		(tx_en),
    );
    */
   oh_clockdiv oh_clockdiv(.clkrise0		(),
			   .clkfall0		(),
			   .clkrise1		(),
			   .clkfall1		(),
			   .clkstable		(),
			   /*AUTOINST*/
			   // Outputs
			   .clkout0		(io_clk),	 // Templated
			   .clkout1		(tx_clk),	 // Templated
			   // Inputs
			   .clk			(clk),
			   .nreset		(nreset),
			   .clkchange		(clkchange),
			   .clken		(tx_en),	 // Templated
			   .clkdiv		(clkdiv[7:0]),
			   .clkphase0		(clkphase0[15:0]),
			   .clkphase1		(clkphase1[15:0]));
   //################################
   //# DATAPATH
   //################################
   /*mio_dp  AUTO_TEMPLATE (.wait_in	(rx_wait_c2io),
                            .wait_out	(tx_wait_io2c),
                            .packet_out	(rx_packet_io2c[MPW-1:0]),
                            .packet_in	(tx_packet_c2io[MPW-1:0]),
                            .access_in	(tx_access_c2io),
                            .\(.*\)_out (rx_\1_io2c[]),
    );
    */
   mio_dp  #(.TARGET(TARGET),
	     .NMIO(NMIO),
	     .PW(MPW))
   mio_dp(/*AUTOINST*/
	  // Outputs
	  .tx_full			(tx_full),
	  .tx_prog_full			(tx_prog_full),
	  .tx_empty			(tx_empty),
	  .rx_full			(rx_full),
	  .rx_prog_full			(rx_prog_full),
	  .rx_empty			(rx_empty),
	  .tx_access			(tx_access),
	  .tx_packet			(tx_packet[NMIO-1:0]),
	  .rx_wait			(rx_wait),
	  .wait_out			(tx_wait_io2c),		 // Templated
	  .access_out			(rx_access_io2c),	 // Templated
	  .packet_out			(rx_packet_io2c[MPW-1:0]), // Templated
	  // Inputs
	  .clk				(clk),
	  .io_clk			(io_clk),
	  .nreset			(nreset),
	  .datasize			(datasize[7:0]),
	  .ddr_mode			(ddr_mode),
	  .lsbfirst			(lsbfirst),
	  .framepol			(framepol),
	  .tx_en			(tx_en),
	  .rx_en			(rx_en),
	  .tx_wait			(tx_wait),
	  .rx_clk			(rx_clk),
	  .rx_access			(rx_access),
	  .rx_packet			(rx_packet[NMIO-1:0]),
	  .access_in			(tx_access_c2io),	 // Templated
	  .packet_in			(tx_packet_c2io[MPW-1:0]), // Templated
	  .wait_in			(rx_wait_c2io));		 // Templated
   //################################
   //# MIO INTERFACE
   //################################
   /*mio_if  AUTO_TEMPLATE (
                              .\(.*\)_\(.*\)_out (\1_\2_c2io[]),
                              .\(.*\)_\(.*\)_in  (\1_\2_io2c[]),
    );
    */
   mio_if  #(.AW(AW),
	     .PW(PW),
	     .MPW(MPW))
   mio_if (
	   /*AUTOINST*/
	   // Outputs
	   .access_out			(access_out),
	   .packet_out			(packet_out[PW-1:0]),
	   .wait_out			(wait_out),
	   .rx_wait_out			(rx_wait_c2io),		 // Templated
	   .tx_access_out		(tx_access_c2io),	 // Templated
	   .tx_packet_out		(tx_packet_c2io[MPW-1:0]), // Templated
	   // Inputs
	   .clk				(clk),
	   .nreset			(nreset),
	   .amode			(amode),
	   .emode			(emode),
	   .lsbfirst			(lsbfirst),
	   .datasize			(datasize[7:0]),
	   .ctrlmode			(ctrlmode[4:0]),
	   .dstaddr			(dstaddr[AW-1:0]),
	   .wait_in			(wait_in),
	   .access_in			(access_in),
	   .packet_in			(packet_in[PW-1:0]),
	   .rx_access_in		(rx_access_io2c),	 // Templated
	   .rx_packet_in		(rx_packet_io2c[MPW-1:0]), // Templated
	   .tx_wait_in			(tx_wait_io2c));		 // Templated
endmodule