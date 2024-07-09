module [11:2]
    .AdTrByteEnable_i(AdTrByteEnable_i),// Register Byte Enables
    .AdTrWriteVld_i(AdTrWriteVld_i),  // Valid Write Cycle in
    .AdTrWriteData_i(AdTrWriteData_i), // Write Data in
    .AdTrReadVld_i(AdTrReadVld_i),   // Read request valid from control reg indicating the address of the table is valid
    .AdTrReadData_o(AdTrReadData_o),  // Read Data out
    .AdTrReadVld_o(AdTrReadVld_o)  // Read Valid out (piped)
  );
altpciexpav_stif_txresp_cntrl
 #( .TXCPL_BUFF_ADDR_WIDTH(TXCPL_BUFF_ADDR_WIDTH),
    .CB_PCIE_RX_LITE(CB_PCIE_RX_LITE)
   )
txresp
(      .AvlClk_i(AvlClk_i),     // Avalon clock
       .Rstn_i(TxsRstn_i),    // Avalon reset
       .RxPndgRdFifoEmpty_i(RxPndgRdFifoEmpty_i),
       .RxPndgRdFifoDato_i(RxPndgRdFifoDato_i),
       .RxPndgRdFifoRdReq_o(RxPndgRdFifoRdReq_o),
       .TxReadDataValid_i(TxReadDataValid_i),
       .CplRamWrAddr_o(cplbuff_wraddr),
       .CmdFifoDatin_o(cpl_header),
       .CmdFifoWrReq_o(cpl_header_wrreq),
       .CmdFifoBusy_i(cmd_fifo_busy),        // being access by the main control
       .CmdFifoUsedw_i(cmd_fifo_usedw),
       .DevCsr_i(DevCsr_i),
       .BusDev_i(BusDev_i),
       .TxRespIdle_o(TxRespIdle_o)
);
	scfifo	txcmd_fifo (
				.rdreq (cmdfifo_rdreq),
				.clock (Clk_i),
				.wrreq (cmdfifo_wrreq_reg),
				.data (cmdfifo_datain_reg),
				.usedw (cmd_fifo_usedw),
				.empty (cmd_fifo_empty),
				.q (cmdfifo_dato),
				.full (cmd_fifo_full) ,
				.aclr (~Rstn_i),
				.almost_empty (),
				.almost_full (),
				.sclr ()
				);
	defparam
		txcmd_fifo.add_ram_output_register = "ON",
		txcmd_fifo.intended_device_family = "Stratix IV",
		txcmd_fifo.lpm_numwords = 16,
		txcmd_fifo.lpm_showahead = "OFF",
		txcmd_fifo.lpm_type = "scfifo",
		txcmd_fifo.lpm_width = 99,
		txcmd_fifo.lpm_widthu = 4,
		txcmd_fifo.overflow_checking = "ON",
		txcmd_fifo.underflow_checking = "ON",
		txcmd_fifo.use_eab = "ON";
// mux to select between wr/read and completion header
assign cmdfifo_datain =  cpl_header_wrreq? cpl_header : rd_wr_header;
assign cmdfifo_wrreq  =  cpl_header_wrreq? cpl_header_wrreq : rdwr_header_wrreq;
assign TxBufferEmpty_o = cmd_fifo_empty;
 always @(posedge AvlClk_i or negedge Rstn_i)  // state machine registers
  begin
    if(~Rstn_i)
     begin
      cmdfifo_datain_reg <= 0;
      cmdfifo_wrreq_reg <= 0;
    end
    else
      begin
       cmdfifo_datain_reg <= cmdfifo_datain;
      cmdfifo_wrreq_reg <= cmdfifo_wrreq;
      end
  end
generate if(CB_PCIE_MODE == 0)
begin
	scfifo	wrdat_fifo (
				.rdreq (wrdat_fifo_rdreq),
				.clock (Clk_i),
				.wrreq (wrdat_fifo_wrreq),
				.data (TxWriteData_i),
				.usedw (wrdat_fifo_usedw),
				.empty (),
				.q (wr_datout),
				.full () ,
				.aclr (~Rstn_i),
				.almost_empty (),
				.almost_full (),
				.sclr ()
				);
	defparam
		wrdat_fifo.add_ram_output_register = "ON",
		wrdat_fifo.intended_device_family = "Stratix IV",
		wrdat_fifo.lpm_numwords = 64,
		wrdat_fifo.lpm_showahead = "OFF",
		wrdat_fifo.lpm_type = "scfifo",
		wrdat_fifo.lpm_width = 64,
		wrdat_fifo.lpm_widthu = 6,
		wrdat_fifo.overflow_checking = "ON",
		wrdat_fifo.underflow_checking = "ON",
		wrdat_fifo.use_eab = "ON";
end
else
  begin
    assign wrdat_fifo_usedw = 0;
    assign wr_datout = 64'h0;
  end
endgenerate
generate if(CB_PCIE_MODE == 0)
begin
	scfifo	rd_bypass_fifo (
				.rdreq (rd_bpfifo_rdreq),
				.clock (Clk_i),
				.wrreq (rd_bpfifo_wrreq),
				.data (cmdfifo_dato),
				.usedw (rd_bpfifo_usedw),
				.empty (rd_bpfifo_empty),
				.q (rd_bpfifo_dat),
				.full (rd_bpfifo_full) ,
				.aclr (~Rstn_i),
				.almost_empty (),
				.almost_full (),
				.sclr ()
				);
	defparam
		rd_bypass_fifo.add_ram_output_register = "ON",
		rd_bypass_fifo.intended_device_family = "Stratix IV",
		rd_bypass_fifo.lpm_numwords = 64,
		rd_bypass_fifo.lpm_showahead = "OFF",
		rd_bypass_fifo.lpm_type = "scfifo",
		rd_bypass_fifo.lpm_width = 99,
		rd_bypass_fifo.lpm_widthu = 6,
		rd_bypass_fifo.overflow_checking = "ON",
		rd_bypass_fifo.underflow_checking = "ON",
		rd_bypass_fifo.use_eab = "ON";
end
else
  begin
    assign rd_bpfifo_dat = 99'h0;
    assign rd_bpfifo_full = 1'b0;
    assign rd_bpfifo_empty = 1'b1;
  end
endgenerate
generate if (CB_PCIE_RX_LITE == 0)
 begin
altsyncram
#(
    .intended_device_family(INTENDED_DEVICE_FAMILY),
		.operation_mode("DUAL_PORT"),
		.width_a(64),
		.widthad_a(TXCPL_BUFF_ADDR_WIDTH),
		.numwords_a(CB_TX_CPL_BUFFER_DEPTH),
		.width_b(64),
		.widthad_b(TXCPL_BUFF_ADDR_WIDTH),
		.numwords_b(CB_TX_CPL_BUFFER_DEPTH),
		.lpm_type("altsyncram"),
		.width_byteena_a(1),
		.outdata_reg_b("UNREGISTERED"),
		.indata_aclr_a("NONE"),
		.wrcontrol_aclr_a("NONE"),
		.address_aclr_a("NONE"),
		.address_reg_b("CLOCK1"),
		.address_aclr_b("NONE"),
		.outdata_aclr_b("NONE"),
		.power_up_uninitialized("FALSE")
)
tx_cpl_buff (
				.wren_a (TxReadDataValid_i),
				.clocken1 (),
				.clock0 (AvlClk_i),
				.clock1 (Clk_i),
				.address_a (cplbuff_wraddr),
				.address_b (cplbuff_rdaddr),
				.data_a (TxReadData_i),
				.q_b (cpl_datout),
				.aclr0 (),
				.aclr1 (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_a (),
				.byteena_b (),
				.clocken0 (),
				.data_b (),
				.q_a (),
				.rden_b (),
				.wren_b ()
                );
end
else
  begin
  	always @(posedge Clk_i or negedge Rstn_i)
  	  begin
  	  	 if (~Rstn_i)
  	  	   cpl_data_reg <= 32'h0;
  	  	 else if (TxReadDataValid_i)
  	  	   cpl_data_reg <= TxReadData_i;
  	  end
  	assign cpl_datout = {cpl_data_reg[31:0], cpl_data_reg[31:0]};
  end
endgenerate
altpciexpav_stif_tx_cntrl
#(
.ADDRESS_32BIT(ADDRESS_32BIT),
.CB_PCIE_MODE(CB_PCIE_MODE),
.CG_COMMON_CLOCK_MODE(CG_COMMON_CLOCK_MODE),
.AST_WIDTH(64),
.deviceFamily(INTENDED_DEVICE_FAMILY),
.in_cvp_mode_hwtcl   (in_cvp_mode_hwtcl)
)
tx_cntrl
( .Clk_i(Clk_i),
  .Rstn_i(Rstn_i),
  // PCIe core Tx interface
  .TxStReady_i  (TxStReady_i),
  .TxStData_o   (TxStData_o),
  .TxStParity_o (TxStParity_o),
  .TxStErr_o    (TxStErr_o),
  .TxStSop_o    (TxStSop_o),
  .TxStEop_o    (TxStEop_o),
  .TxStEmpty_o  (TxStEmpty_o),
  .TxStValid_o  (TxStValid_o),
  .TxAdapterFifoEmpty_i(TxAdapterFifoEmpty_i),
  // Command Fifo interface
  .CmdFifoDat_i(cmdfifo_dato),
  .CmdFifoEmpty_i(cmd_fifo_empty),
  .CmdFifoRdReq_o(cmdfifo_rdreq),
  .MsiAddr_i(MsiAddr_i),
  .MsiData_i(MsiData_i),
 .RdBypassFifoEmpty_i(rd_bpfifo_empty),
 .RdBypassFifoFull_i(rd_bpfifo_full),
 .RdBypassFifoUsedw_i(rd_bpfifo_usedw),
 .RdBypassFifoDat_i(rd_bpfifo_dat),
 .RdBypassFifoWrReq_o(rd_bpfifo_wrreq),
 .RdBypassFifoRdReq_o(rd_bpfifo_rdreq),
 .RxCplBuffFree_i(CplTagRelease_i),
  // Completion buffer interface
  .CplBuffRdAddr_o(cplbuff_rdaddr),
  .TxCplDat_i(cpl_datout),
  // write data fifo interface
  .WrDatFifoRdReq_o(wrdat_fifo_rdreq),
  .TxWrDat_i(wr_datout),
 // .TxRdTagRamWrAddr_o(txrd_tagram_wraddr),
 // .TxRdTagRamWrEna_o(txrd_tagram_wrena),
 // .TxRdTagRamDat_o(txrd_tagram_wrdat),
  // Rx Completion interface for buffer credit keeping
  .TxCplSent_o(TxCplSent_o),
  .TxCplDwSent_o(TxCplDwSent_o),
  .CplPending_o(CplPending_o),
  // cfg register
  .BusDev_i(BusDev_i),
  .MsiCsr_i(MsiCsr_i),
  .MsiReq_o(MsiReq_o),
  .MsiAck_i(MsiAck_i),
  .IntxReq_o(IntxReq_o),
  .IntxAck_i(IntxAck_i),
  .TxCredHipCons_i(TxCredHipCons_i),
  .TxCredInfinit_i(TxCredInfinit_i),
  .TxCredNpHdrLimit_i(TxCredNpHdrLimit_i),
  .ko_cpl_spc_header(ko_cpl_spc_header),
  .ko_cpl_spc_data(ko_cpl_spc_data),
  .TxCredit_i(TxCredit_i),
  .TxNpCredOne_i(TxNpCredOne_i),
    // RP interface
  .TxRpFifoRdReq_o(TxRpFifoRdReq_o),
  .TxRpFifoData_i(TxRpFifoData_i),
  .RpTLPReady_i(RpTLPReady_i),
  .RpTLPAck_o(RpTLPAck_o),
   .pld_clk_inuse(pld_clk_inuse),
   .tx_cons_cred_sel(tx_cons_cred_sel)
);
endmodule