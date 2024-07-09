module outputs)
   wire [4:0]		ctrlmode_in;		// From p2e of packet2emesh.v
   wire [AW-1:0]	data_in;		// From p2e of packet2emesh.v
   wire [1:0]		datamode_in;		// From p2e of packet2emesh.v
   wire [AW-1:0]	dstaddr_in;		// From p2e of packet2emesh.v
   wire [AW-1:0]	srcaddr_in;		// From p2e of packet2emesh.v
   wire			write_in;		// From p2e of packet2emesh.v
   // End of automatics
   //#####################################
   //# DECODE
   //#####################################
   packet2emesh #(.AW(AW),
		  .PW(PW))
   p2e (/*AUTOINST*/
	// Outputs
	.write_in			(write_in),
	.datamode_in			(datamode_in[1:0]),
	.ctrlmode_in			(ctrlmode_in[4:0]),
	.dstaddr_in			(dstaddr_in[AW-1:0]),
	.srcaddr_in			(srcaddr_in[AW-1:0]),
	.data_in			(data_in[AW-1:0]),
	// Inputs
	.packet_in			(packet_in[PW-1:0]));
   assign reg_write      = write_in & access_in;
   assign config_write   = reg_write & (dstaddr_in[5:2]==`MIO_CONFIG);
   assign status_write   = reg_write & (dstaddr_in[5:2]==`MIO_STATUS);
   assign clkdiv_write   = reg_write & (dstaddr_in[5:2]==`MIO_CLKDIV);
   assign clkphase_write = reg_write & (dstaddr_in[5:2]==`MIO_CLKPHASE);
   assign idelay_write   = reg_write & (dstaddr_in[5:2]==`MIO_IDELAY);
   assign odelay_write   = reg_write & (dstaddr_in[5:2]==`MIO_ODELAY);
   assign addr0_write    = reg_write & (dstaddr_in[5:2]==`MIO_ADDR0);
   assign addr1_write    = reg_write & (dstaddr_in[5:2]==`MIO_ADDR1);
   assign clkchange = clkdiv_write | clkphase_write;
   //################################
   //# CONFIG
   //################################
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       begin
	  config_reg[20:0] <= DEF_CFG;
       end
     else if(config_write)
       config_reg[20:0] <= data_in[20:0];
   assign tx_en         = ~config_reg[0];         // tx disable
   assign rx_en         = ~config_reg[1];         // rx disable
   assign emode         = config_reg[3:2]==2'b00; // emesh packets
   assign dmode         = config_reg[3:2]==2'b01; // data mode (streaming)
   assign amode         = config_reg[3:2]==2'b10; // auto address mode
   assign datasize[7:0] = config_reg[11:4];       // number of flits per packet
   assign ddr_mode      = config_reg[12];         // dual data rate mode
   assign lsbfirst      = config_reg[13];         // lsb-first transmit
   assign framepol      = config_reg[14];         // frame polarity
   assign ctrlmode[4:0] = config_reg[20:16];      // ctrlmode
   //###############################
   //# STATUS
   //################################
   assign status_in[7:0] = {2'b0,       //7:6
			   tx_full,     //5
			   tx_prog_full,//4
			   tx_empty,    //3
			   rx_full,     //2
			   rx_prog_full,//1
			   rx_empty     //0
			   };
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       status_reg[15:0] <= 'b0;
     else if(status_write)
       status_reg[15:0] <= data_in[7:0];
     else
       status_reg[15:0] <= {(status_reg[15:8] | status_in[7:0]), // sticky bits
			   status_in[7:0]};                     // immediate bits
   //###############################
   //# CLKDIV
   //################################
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       clkdiv_reg[7:0] <= DEF_CLK;
     else if(clkdiv_write)
       clkdiv_reg[7:0] <= data_in[7:0];
   assign clkdiv[7:0] = clkdiv_reg[7:0];
   //###############################
   //# CLKPHASE
   //################################
   always @ (posedge clk or negedge nreset)
     if(!nreset)
       begin
	  clkphase_reg[7:0]   <= DEF_RISE0;
	  clkphase_reg[15:8]  <= DEF_FALL0;
	  clkphase_reg[23:16] <= DEF_RISE1;
	  clkphase_reg[31:24] <= DEF_FALL1;
       end
     else if(clkphase_write)
       clkphase_reg[31:0] <= data_in[31:0];
   assign clkphase0[15:0] = clkphase_reg[15:0];
   assign clkphase1[15:0] = clkphase_reg[31:16];
   //###############################
   //# RX DESTINATION ADDR ("AMODE")
   //################################
   always @ (posedge clk)
     if(addr0_write)
       addr_reg[31:0]  <= data_in[31:0];
     else if(addr1_write)
       addr_reg[63:32] <= data_in[31:0];
   assign dstaddr[AW-1:0] = addr_reg[AW-1:0];
   //###############################
   //# READBACK
   //################################
   assign access_out ='b0;
   assign wait_out   ='b0;
   assign packet_out ='b0;
endmodule