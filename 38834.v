module
`ifdef UNUSED
dbg_top dbg1  (.tms_pad_i(P_TMS), .tck_pad_i(P_TCK), .trst_pad_i(P_TRST), .tdi_pad_i(P_TDI), .tdo_pad_o(P_TDO),
               .wb_rst_i(wb_rst_i), .risc_clk_i(Mclk), .risc_addr_o(), .risc_data_i(DataIn),
               .risc_data_o(), .wp_i(11'h0), .bp_i(1'b0),
               .opselect_o(), .lsstatus_i(4'h0), .istatus_i(2'h0),
               .risc_stall_o(), .reset_o()
              );
`endif
endmodule