module! */
   parameter 	   ethernet = 1'b0;
   /* Bus cycles from the ep9302 processor come in to the FPGA multiplexed by
    */
   reg 		   epwbm_done, epwbm_done32;
   reg 		   isa_add1_pad_q;
   reg [23:0] 	   ep93xx_address;
   reg 		   epwbm_we_o, epwbm_stb_o;
   wire [23:0] 	   epwbm_adr_o;
   reg [15:0] 	   epwbm_dat_o;
   reg [15:0] 	   epwbm_dat_i;
   reg [15:0] 	   ep93xx_dat_latch;
   reg 		   epwbm_ack_i;
   wire 	   epwbm_clk_o = clk_75mhz_pad;
   wire 	   epwbm_cyc_o = start_cycle_posedge_q;
   wire 	   ep93xx_databus_oe = !epwbm_we_o && start_cycle_posedge && !bd_oe_pad;
   wire 	   pll_locked, clk_150mhz;
   wire 	   epwbm_rst_o = !pll_locked;
   assign 	   fl_d_pad[7:0] = ep93xx_databus_oe ?ep93xx_dat_latch[7:0] : 8'hzz;
   assign 	   bd_pad[7:0] = ep93xx_databus_oe ?ep93xx_dat_latch[15:8] : 8'hzz;
   assign 	   isa_wait_pad = start_cycle_negedge ? epwbm_done : 1'bz;
   assign 	   epwbm_adr_o[23:2] = ep93xx_address[23:2];
   reg 		   ep93xx_address1_q;
   assign 	   epwbm_adr_o[0] = ep93xx_address[0];
   assign 	   epwbm_adr_o[1] = ep93xx_address1_q;
   /* Use Altera's PLL to multiply 25Mhz from the ethernet PHY to 75Mhz */
   pll clkgencore(
		  .inclk0(clk_25mhz_pad),
		  .c0(clk_150mhz),
		  .c1(clk_75mhz_pad),
		  .locked(pll_locked)
		  );
   reg 		   ep93xx_end, ep93xx_end_q;
   reg 		   start_cycle_negedge, start_cycle_posedge, bd_oe_negedge,
		   bd_oe_posedge;
   reg 		   start_cycle_negedge_q, start_cycle_posedge_q;
   reg 		   bd_oe_negedge_q, bd_oe_posedge_q;
   always @(posedge clk_75mhz_pad)
     begin
	start_cycle_negedge_q <= start_cycle_negedge;
	start_cycle_posedge_q <= start_cycle_posedge;
	bd_oe_negedge_q <= bd_oe_negedge;
	bd_oe_posedge_q <= bd_oe_posedge;
	isa_add1_pad_q <= isa_add1_pad;
	if ((bd_oe_negedge_q && epwbm_we_o) ||
	    (start_cycle_posedge_q && !epwbm_we_o) && !epwbm_done)
	  begin
	     epwbm_stb_o <= 1'b1;
	     ep93xx_address1_q <= isa_add1_pad_q;
	     epwbm_dat_o <= {bd_pad[7:0], fl_d_pad[7:0]};
	  end
	if (epwbm_stb_o && epwbm_ack_i)
	  begin
	     epwbm_stb_o <= 1'b0;
	     epwbm_done <= 1'b1;
	     ep93xx_dat_latch <= epwbm_dat_i;
	  end
	if (epwbm_done && !epwbm_done32 &&
	    (ep93xx_address[1] !=isa_add1_pad_q))
	  begin
	     epwbm_done <= 1'b0;
	     epwbm_done32 <= 1'b1;
	  end
	ep93xx_end_q <= 1'b0;
	if ((start_cycle_negedge_q && start_cycle_posedge_q &&
	     bd_oe_negedge_q && bd_oe_posedge) || !pll_locked)
	  begin
	     ep93xx_end <= 1'b1;
	     ep93xx_end_q <= 1'b0;
	  end
	if (ep93xx_end)
	  begin
	     ep93xx_end <= 1'b0;
	     ep93xx_end_q <= 1'b1;
	     epwbm_done32 <= 1'b0;
	     epwbm_stb_o <= 1'b0;
	     epwbm_done <= 1'b0;
	     start_cycle_negedge_q <= 1'b0;
	     start_cycle_posedge_q <= 1'b0;
	     bd_oe_negedge_q <= 1'b0;
	     bd_oe_posedge_q <= 1'b0;
	  end
     end
   wire start_cycle_negedge_aset = !start_cycle_pad && pll_locked;
   always @(posedge ep93xx_end_q or posedge start_cycle_negedge_aset)
     begin
	if (start_cycle_negedge_aset)
	  start_cycle_negedge <= 1'b1;
	else start_cycle_negedge <= 1'b0;
     end
   always @(posedge start_cycle_pad or posedge ep93xx_end_q)
     begin
	if (ep93xx_end_q)
	  start_cycle_posedge <= 1'b0;
	else
	  if (start_cycle_negedge)
	    start_cycle_posedge <= 1'b1;
     end
   always @(posedge start_cycle_pad)
     begin
	epwbm_we_o <= fl_d_pad[7];
	ep93xx_address[23] <= fl_d_pad[0];
	ep93xx_address[22] <= fl_d_pad[1];
	ep93xx_address[21] <= fl_d_pad[2];
	ep93xx_address[20:17] <= add_pad[3:0];
	ep93xx_address[16] <= fl_d_pad[3];
	ep93xx_address[15] <= isa_add15_pad;
	ep93xx_address[14] <= isa_add14_pad;
	ep93xx_address[13] <= fl_d_pad[4];
	ep93xx_address[12] <= isa_add12_pad;
	ep93xx_address[11] <= isa_add11_pad;
	ep93xx_address[10] <= bd_pad[0];
	ep93xx_address[9] <= bd_pad[1];
	ep93xx_address[8] <= bd_pad[2];
	ep93xx_address[7] <= bd_pad[3];
	ep93xx_address[6] <= bd_pad[4];
	ep93xx_address[5] <= bd_pad[5];
	ep93xx_address[4] <= bd_pad[6];
	ep93xx_address[3] <= bd_pad[7];
	ep93xx_address[2] <= fl_d_pad[5];
	ep93xx_address[1] <= isa_add1_pad;
	ep93xx_address[0] <= fl_d_pad[6];
     end
   always @(negedge bd_oe_pad or posedge ep93xx_end_q)
     begin
	if (ep93xx_end_q)
	  bd_oe_negedge <= 1'b0;
	else
	  if (start_cycle_posedge)
	    bd_oe_negedge <= 1'b1;
     end
   always @(posedge bd_oe_pad or posedge ep93xx_end_q)
     begin
	if (ep93xx_end_q)
	  bd_oe_posedge <= 1'b0;
	else
	  if (bd_oe_negedge)
	    bd_oe_posedge <= 1'b1;
     end
   wire [15:0] epwbm_wb32m_bridgecore_dat;
   wire        epwbm_wb32m_bridgecore_ack;
   wire [31:0] wb32m_dat_o;
   reg [31:0]  wb32m_dat_i;
   wire [21:0] wb32m_adr_o;
   wire [3:0]  wb32m_sel_o;
   wire        wb32m_cyc_o, wb32m_stb_o, wb32m_we_o;
   reg 	       wb32m_ack_i;
   wire        wb32m_clk_o = epwbm_clk_o;
   wire        wb32m_rst_o = epwbm_rst_o;
   wb32_bridge epwbm_wb32m_bridgecore
     (
      .wb_clk_i(epwbm_clk_o),
      .wb_rst_i(epwbm_rst_o),
      .wb16_adr_i(epwbm_adr_o[23:1]),
      .wb16_dat_i(epwbm_dat_o),
      .wb16_dat_o(epwbm_wb32m_bridgecore_dat),
      .wb16_cyc_i(epwbm_cyc_o),
      .wb16_stb_i(epwbm_stb_o),
      .wb16_we_i(epwbm_we_o),
      .wb16_ack_o(epwbm_wb32m_bridgecore_ack),
      .wbm_adr_o(wb32m_adr_o),
      .wbm_dat_o(wb32m_dat_o),
      .wbm_dat_i(wb32m_dat_i),
      .wbm_cyc_o(wb32m_cyc_o),
      .wbm_stb_o(wb32m_stb_o),
      .wbm_we_o(wb32m_we_o),
      .wbm_ack_i(wb32m_ack_i),
      .wbm_sel_o(wb32m_sel_o)
      );
   /* At this point we have turned the multiplexed ep93xx bus cycle into a
    */
/******************************************************************
   wire [31:0] usercore_dat;
   wire        usercore_ack;
   reg 	       usercore_stb;
   wire [40:1]  headerpin_i;
   reg [40:1]  temp_reg;
   wire [40:1] headerpin_oe, headerpin_o;
   integer     i;
   // grab the current inputs
   assign headerpin_i[1]  = blue_pad[0];
   assign headerpin_i[3]  = blue_pad[1];
   assign headerpin_i[5]  = blue_pad[2];
   assign headerpin_i[7]  = blue_pad[3];
   assign headerpin_i[9]  = blue_pad[4];
   assign headerpin_i[11] = green_pad[0];
   assign headerpin_i[13] = green_pad[1];
   assign headerpin_i[15] = green_pad[2];
   assign headerpin_i[17] = green_pad[3];
   assign headerpin_i[19] = green_pad[4];
   assign headerpin_i[4]  = red_pad[0];
   assign headerpin_i[6]  = red_pad[1];
   assign headerpin_i[8]  = red_pad[2];
   assign headerpin_i[10] = red_pad[3];
   assign headerpin_i[12] = red_pad[4];
   assign headerpin_i[21] = dio0to8_pad[0];
   assign headerpin_i[23] = dio0to8_pad[1];
   assign headerpin_i[25] = dio0to8_pad[2];
   assign headerpin_i[27] = dio0to8_pad[3];
   assign headerpin_i[29] = dio0to8_pad[4];
   assign headerpin_i[31] = dio0to8_pad[5];
   assign headerpin_i[33] = dio0to8_pad[6];
   assign headerpin_i[35] = dio0to8_pad[7];
   assign headerpin_i[37] = dio0to8_pad[8];
   assign headerpin_i[24] = dio10to17_pad[0];
   assign headerpin_i[26] = dio10to17_pad[1];
   assign headerpin_i[28] = dio10to17_pad[2];
   assign headerpin_i[30] = dio10to17_pad[3];
   assign headerpin_i[32] = dio10to17_pad[4];
   assign headerpin_i[34] = dio10to17_pad[5];
   assign headerpin_i[36] = dio10to17_pad[6];
   assign headerpin_i[38] = dio10to17_pad[7];
   assign headerpin_i[39] = dio9_pad;
   assign headerpin_i[14] = hsync_pad;
   assign headerpin_i[16] = vsync_pad;
// misc fixed values
   assign headerpin_i[22] = 1'b0;
   assign headerpin_i[40] = 1'b1;
   assign headerpin_i[2] = 1'b0;
   assign headerpin_i[20] = 1'b1;
   assign headerpin_i[18] = 1'b0;
// assign outputs or tristates
   assign blue_pad[0] = temp_reg[1];
   assign blue_pad[1] = temp_reg[3];
   assign blue_pad[2] = temp_reg[5];
   assign blue_pad[3] = temp_reg[7];
   assign blue_pad[4] = temp_reg[9];
   assign green_pad[0] = temp_reg[11];
   assign green_pad[1] = temp_reg[13];
   assign green_pad[2] = temp_reg[15];
   assign green_pad[3] = temp_reg[17];
   assign green_pad[4] = temp_reg[19];
   assign red_pad[0] = temp_reg[4];
   assign red_pad[1] = temp_reg[6];
   assign red_pad[2] = temp_reg[8];
   assign red_pad[3] = temp_reg[10];
   assign red_pad[4] = temp_reg[12];
   assign vsync_pad = temp_reg[16];
   assign hsync_pad = temp_reg[14];
   assign dio0to8_pad[0] = temp_reg[21];
   assign dio0to8_pad[1] = temp_reg[23];
   assign dio0to8_pad[2] = temp_reg[25];
   assign dio0to8_pad[3] = temp_reg[27];
   assign dio0to8_pad[4] = temp_reg[29];
   assign dio0to8_pad[5] = temp_reg[31];
   assign dio0to8_pad[6] = temp_reg[33];
   assign dio0to8_pad[7] = temp_reg[35];
   assign dio0to8_pad[8] = temp_reg[37];
   assign dio10to17_pad[0] = temp_reg[24];
   assign dio10to17_pad[1] = temp_reg[26];
   assign dio10to17_pad[2] = temp_reg[28];
   assign dio10to17_pad[3] = temp_reg[30];
   assign dio10to17_pad[4] = temp_reg[32];
   assign dio10to17_pad[5] = temp_reg[34];
   assign dio10to17_pad[6] = temp_reg[36];
   assign dio10to17_pad[7] = temp_reg[38];
always @( headerpin_o or headerpin_oe )
     begin
	for (i = 0; i < 5; i = i + 1)
	  begin
	     if (headerpin_oe[1 + (i * 2)])
	       temp_reg[1+(i*2)] =headerpin_o[1 + (i * 2)];
	     else
	       temp_reg[1 + (i * 2)] = 1'bz;
	     if (headerpin_oe[11 + (i * 2)])
	       temp_reg[11 + (i * 2)] = headerpin_o[11 + (i * 2)];
	     else
	       temp_reg[11 + (i * 2)] = 1'bz;
	     if (headerpin_oe[4 + (i * 2)])
	       temp_reg[4 + (i * 2)] = headerpin_o[4 + (i * 2)];
	     else
	      temp_reg[4 + (i * 2)] = 1'bz;
	  end
	for (i = 0; i < 8; i = i + 1)
	  begin
	     if (headerpin_oe[24 + (i * 2)])
	       temp_reg[24 + (i * 2)] = headerpin_o[24 + (i * 2)];
	     else
	       temp_reg[24 + (i * 2)] = 1'bz;
	     if (headerpin_oe[21 + (i * 2)])
	       temp_reg[21 + (i * 2)] = headerpin_o[21 + (i * 2)];
	     else
	       temp_reg[21 + (i * 2)] = 1'bz;
	  end
	if (headerpin_oe[14])
	  temp_reg[14] = headerpin_o[14];
	else
	  temp_reg[14] = 1'bz;
	if (headerpin_oe[16])
	  temp_reg[16] = headerpin_o[16];
	else
	  temp_reg[16] = 1'bz;
	if (headerpin_oe[37])
	  temp_reg[37] = headerpin_o[37];
	else
	  temp_reg[37] = 1'bz;
     end
   wire usercore_drq, usercore_irq;
   // SDRAM
   wire [12:0] uc_sdram_add_pad;
   wire        uc_sdram_ras_pad;
   wire        uc_sdram_cas_pad;
   wire        uc_sdram_we_pad;
   wire [1:0]  uc_sdram_ba_pad;
   wire [15:0] uc_sdram_data_pad_i;
   wire [15:0] uc_sdram_data_pad_o;
   reg 	       uc_sdram_data_pad_oe;
   // this is the interface to your component. It shouldn't need changing//
   ts7300_usercore usercore
     (
      .wb_clk_i(wb32m_clk_o),
      .wb_rst_i(wb32m_rst_o),
      .wb_cyc_i(wb32m_cyc_o),
      .wb_stb_i(usercore_stb),
      .wb_we_i(wb32m_we_o),
      .wb_ack_o(usercore_ack),
      .wb_dat_o(usercore_dat),
      .wb_dat_i(wb32m_dat_o),
      .wb_adr_i(wb32m_adr_o),
      .headerpin_i(headerpin_i[40:1]),
      .headerpin_o(headerpin_o[40:1]),
      .headerpin_oe_o(headerpin_oe[40:1]),
      .irq_o(usercore_irq),
      .sdram_ras_o( sdram_ras_pad ),
      .sdram_cas_o( sdram_cas_pad ),
      .sdram_we_n_o( sdram_we_pad ),
      .sdram_ba_o( sdram_ba_pad ),
      .sdram_saddr_o( sdram_add_pad ),
      .sdram_sdata_i( uc_sdram_data_pad_i ),
      .sdram_sdata_o( uc_sdram_data_pad_o ),
      .sdram_sdata_oe( uc_sdram_data_pad_oe )
      );
   /* IRQ7 is actually ep9302 VIC IRQ #40 */
   assign      irq7_pad = ( usercore_irq ) ? 1'b1 : 1'bz;
   //assign sdram_add_pad = uc_sdram_add_pad;
   //assign sdram_ba_pad = uc_sdram_ba_pad;
   //assign sdram_cas_pad = uc_sdram_cas_pad;
   //assign sdram_ras_pad = uc_sdram_ras_pad;
   //assign sdram_we_pad = uc_sdram_we_pad;
   assign      sdram_clk_pad = clk_75mhz_pad & pll_locked;
   assign      sdram_data_pad = uc_sdram_data_pad_oe ? uc_sdram_data_pad_o :
				16'bz;
   assign      uc_sdram_data_pad_i = uc_sdram_data_pad_oe ?
				     uc_sdram_data_pad_i : sdram_data_pad;
   /* Now we set up the address decode and the return WISHBONE master
    */
   always @(epwbm_adr_o or epwbm_wb32m_bridgecore_dat or
	    epwbm_wb32m_bridgecore_ack or usercore_dat or usercore_ack or
	    wb32m_adr_o or wb32m_stb_o)
     begin
	epwbm_dat_i = 16'hxxxx;
	epwbm_ack_i = 1'bx;
	if (epwbm_adr_o >= 24'h100000)
	  begin
	     epwbm_dat_i = epwbm_wb32m_bridgecore_dat;
	     epwbm_ack_i = epwbm_wb32m_bridgecore_ack;
	  end
	usercore_stb = 1'b0;
	// ethcore_stb = 1'b0;
	// ethramcore_stb = 1'b0;
	// if (wb32m_adr_o >= 22'h280000) begin
	usercore_stb = wb32m_stb_o;
	wb32m_dat_i = usercore_dat;
	wb32m_ack_i = usercore_ack;
	// end
     end
   /* Various defaults for signals not used in this boilerplate project: */
   /* No use for DMA -- used by TS-SDCORE on shipped bitstream */
   assign dma_req_pad = 1'bz;
   /* PHY always on */
   assign eth_pd_pad = 1'b1;
   /* SDRAM signals outputing 0's -- used by TS-VIDCORE in shipped
    bitstream */
   /*
    assign sdram_add_pad = 12'd0;
    assign sdram_ba_pad = 2'd0;
    assign sdram_cas_pad = 1'b0;
    assign sdram_ras_pad = 1'b0;
    assign sdram_we_pad = 1'b0;
    assign sdram_clk_pad = 1'b0;
    assign sdram_data_pad = 16'd0;
    */
   /* serial (RS232) mux signals safely "parked" -- used by TS-UART */
   assign rd_mux_pad = 1'b1;
   assign mux_cntrl_pad = 1'b0;
   assign wr_232_pad = 1'b1;
   assign mux_pad = 4'hz;
   /* SD flash card signals "parked" -- used by TS-SDCORE */
   assign sd_soft_power_pad = 1'b0;
   assign sd_hard_power_pad = 1'b1;
   assign sd_dat_pad = 4'hz;
   assign sd_clk_pad = 1'b0;
   assign sd_cmd_pad = 1'bz;
endmodule