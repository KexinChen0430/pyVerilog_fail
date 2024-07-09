module
altpciexpav_stif_rx_resp
# (
     .CG_COMMON_CLOCK_MODE(CG_COMMON_CLOCK_MODE)
)
rxavl_resp
   ( .Clk_i(Clk_i),
     .AvlClk_i(AvlClk_i),
     .Rstn_i(Rstn_i),
     .RxmRstn_i(RxmRstn_i),
    // Interface to Transaction layer
     .CplReq_i(cpl_req),
     .CplDesc_i(cpl_desc),
     .CplRdAddr_o(cplram_rdaddr),
     .CplBufData_i(cplram_data_out),
    // interface to tx control
     .TagRelease_o(CplTagRelease_o),
    // interface to Avalon slave
     //.TxsReadData_o(TxReadData_o),
     .TxsReadDataValid_o(TxReadDataValid_o)
  );
 // Muxing the tag ram read address
  // from the two reading sources : main control and read response
generate if(CB_PCIE_MODE == 0)
begin
altsyncram
#(
        .intended_device_family("Stratix"),
        .operation_mode("DUAL_PORT"),
        .width_a(66),
        .widthad_a(RX_CPL_BUFF_ADDR_WIDTH),
        .numwords_a(CB_RX_CPL_BUFFER_DEPTH),
        .width_b(66),
        .widthad_b(RX_CPL_BUFF_ADDR_WIDTH),
        .numwords_b(CB_RX_CPL_BUFFER_DEPTH),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .outdata_reg_b("UNREGISTERED"),
        .indata_aclr_a("NONE"),
        .wrcontrol_aclr_a("NONE"),
        .address_aclr_a("NONE"),
        .address_reg_b("CLOCK0"),
        .address_aclr_b("NONE"),
        .outdata_aclr_b("NONE"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE")
)
cpl_ram (
				.wren_a (cplram_wr_ena),
				.clock0 (AvlClk_i),
				.address_a (cplram_wraddr),
				.address_b (cplram_rdaddr),
				.data_a (cplram_wrdat),
				.q_b (cplram_data_out),
				.aclr0 (),
				.aclr1 (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_a (),
				.byteena_b (),
				.clock1 (),
				.clocken0 (),
				.clocken1 (),
				.data_b (),
				.q_a (),
				.rden_b (),
				.wren_b ()
				);
assign TxReadData_o = cplram_data_out[63:0];
end
  else
    begin
      assign TxReadData_o = 64'h0;
    end
endgenerate
endmodule