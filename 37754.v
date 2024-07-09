module outputs)
   wire			reg_access_out;		// From mio of mio.v
   wire [PW-1:0]	reg_packet_out;		// From mio of mio.v
   wire			reg_wait_out;		// From mio of mio.v
   wire			rx_wait;		// From mio of mio.v
   wire			tx_access;		// From mio of mio.v
   wire			tx_clk;			// From mio of mio.v
   wire [NMIO-1:0]	tx_packet;		// From mio of mio.v
   // End of automatics
   assign dut_active       = 1'b1;
   assign clkout           = clk1;
   //########################################
   //# DECODE (SPLITTING CTRL+DATA)
   //########################################
   //hack: send to regfile if addr[31:20] is zero
   assign mio_access_in    = access_in & |packet_in[39:28];
   assign reg_access_in    = access_in & ~(|packet_in[39:28]);
   assign reg_packet_in    = packet_in;
   assign reg_wait_in      = wait_in;
   //########################################
   //# DUT: MIO IN LOOPBACK
   //########################################
   /*mio  AUTO_TEMPLATE (
            .io_clk         (io_clk),
            .clk	    (clk1),
	    .rx_clk	    (tx_clk),
	    .rx_access	    (tx_access),
            .rx_packet	    (tx_packet[NMIO-1:0]),
            .tx_packet	    (tx_packet[NMIO-1:0]),
	    .tx_wait        (rx_wait),
            .access_in	    (mio_access_in),
    );
    */
   mio #(.AW(AW),
	 .DEF_CFG(DEF_CFG),
	 .DEF_CLK(DEF_CLK))
   mio (/*AUTOINST*/
	// Outputs
	.tx_clk				(tx_clk),
	.tx_access			(tx_access),
	.tx_packet			(tx_packet[NMIO-1:0]),	 // Templated
	.rx_wait			(rx_wait),
	.wait_out			(wait_out),
	.access_out			(access_out),
	.packet_out			(packet_out[PW-1:0]),
	.reg_wait_out			(reg_wait_out),
	.reg_access_out			(reg_access_out),
	.reg_packet_out			(reg_packet_out[PW-1:0]),
	// Inputs
	.clk				(clk1),			 // Templated
	.nreset				(nreset),
	.tx_wait			(rx_wait),		 // Templated
	.rx_clk				(tx_clk),		 // Templated
	.rx_access			(tx_access),		 // Templated
	.rx_packet			(tx_packet[NMIO-1:0]),	 // Templated
	.access_in			(mio_access_in),	 // Templated
	.packet_in			(packet_in[PW-1:0]),
	.wait_in			(wait_in),
	.reg_access_in			(reg_access_in),
	.reg_packet_in			(reg_packet_in[PW-1:0]),
	.reg_wait_in			(reg_wait_in));
endmodule