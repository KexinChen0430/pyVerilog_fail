module
a23_core amber (
    .i_clk(clk),
    .i_irq(irq),
    .i_firq(nmi),
    .i_system_rdy(1'b1),
    .o_wb_adr(adr),
    .o_wb_sel(sel),
    .o_wb_we(we),
    .i_wb_dat(dat_i),
    .o_wb_dat(dat_o),
    .o_wb_cyc(cyc),
    .o_wb_stb(stb),
    .i_wb_ack(ack),
    .i_wb_err(1'b0)
    );
  wb_switch #(
    .s0_addr_1 (32'b0000_0000_0000_0000_0000_0000_0000_0000), // ROM  at 0x00000000-0x00000003
    .s0_mask_1 (32'b0000_0011_1111_1111_1111_1111_1111_1100),
    .s0_addr_2 (32'b0000_0011_0000_0000_0000_0000_0000_0000), // ROM  at 0x03000000-0x03ffffff
    .s0_mask_2 (32'b0000_0011_0000_0000_0000_0000_0000_0000),
    .s1_addr_1 (32'b0000_0001_0000_0000_0000_0000_0000_0000), // Tube at 0x01000000-0x01ffffff
    .s1_mask_1 (32'b0000_0011_0000_0000_0000_0000_0000_0000),
    .s2_addr_1 (32'b0000_0000_0000_0000_0000_0000_0000_0000), // RAM  at 0x00000000-0x001fffff
    .s2_mask_1 (32'b0000_0011_1110_0000_0000_0000_0000_0000)
    ) wbs (
    // Master interface
    .m_dat_i (dat_o),
    .m_dat_o (dat_i),
    .m_adr_i (adr),
    .m_sel_i (sel),
    .m_we_i  (we),
    .m_cyc_i (cyc),
    .m_stb_i (stb),
    .m_ack_o (ack),
    // Slave 0 interface - ROM
    .s0_dat_i (rom_dat_o),
    .s0_dat_o (rom_dat_i),
    .s0_adr_o (rom_adr_i),
    .s0_sel_o (rom_sel_i),
    .s0_we_o  (rom_we_i),
    .s0_cyc_o (rom_cyc_i),
    .s0_stb_o (rom_stb_i),
    .s0_ack_i (rom_ack_o),
    // Slave 1 interface - Tube
    .s1_dat_i (tube_dat_o),
    .s1_dat_o (tube_dat_i),
    .s1_adr_o (tube_adr_i),
    .s1_sel_o (tube_sel_i),
    .s1_we_o  (tube_we_i),
    .s1_cyc_o (tube_cyc_i),
    .s1_stb_o (tube_stb_i),
    .s1_ack_i (tube_ack_o),
     // Slave 2 interface - RAM
    .s2_dat_i (ram_dat_o),
    .s2_dat_o (ram_dat_i),
    .s2_adr_o (ram_adr_i),
    .s2_sel_o (ram_sel_i),
    .s2_we_o  (ram_we_i),
    .s2_cyc_o (ram_cyc_i),
    .s2_stb_o (ram_stb_i),
    .s2_ack_i (ram_ack_o),
    .s3_dat_i (32'haaaaaaaa),
    .s3_dat_o (),
    .s3_adr_o (),
    .s3_sel_o (),
    .s3_we_o  (),
    .s3_cyc_o (def_cyc_i),
    .s3_stb_o (def_stb_i),
    .s3_ack_i (def_cyc_i & def_stb_i)
  );
  always @(posedge clk) begin
    irq <= ~p_irq_b;
    nmi <= ~p_nmi_b;
  end
  assign h_irq_b  = 1;
  // default to hi-impedence, to avoid conflicts with
  // a Raspberry Pi connected to the test connector
  assign test = 8'bZ;
endmodule