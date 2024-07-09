module
  //   0x800 - 0x9ff Up to 512 bytes of Debug ROM.
  wire i_icb_cmd_hsked = i_icb_cmd_valid & i_icb_cmd_ready;
  wire icb_wr_ena = i_icb_cmd_hsked & (~i_icb_cmd_read);
  wire icb_sel_cleardebint = (i_icb_cmd_addr == 12'h100);
  wire icb_sel_sethaltnot  = (i_icb_cmd_addr == 12'h10c);
  wire icb_sel_dbgrom  = (i_icb_cmd_addr[12-1:8] == 4'h8);
  wire icb_sel_dbgram  = (i_icb_cmd_addr[12-1:8] == 4'h4);
  wire icb_wr_cleardebint_ena = icb_wr_ena & icb_sel_cleardebint;
  wire icb_wr_sethaltnot_ena  = icb_wr_ena & icb_sel_sethaltnot ;
  assign icb_access_dbgram_ena = i_icb_cmd_hsked & icb_sel_dbgram;
  wire cleardebint_ena = icb_wr_cleardebint_ena;
  wire [HART_ID_W-1:0] cleardebint_r;
  wire [HART_ID_W-1:0] cleardebint_nxt = i_icb_cmd_wdata[HART_ID_W-1:0];
  sirv_gnrl_dfflr #(HART_ID_W) cleardebint_dfflr (cleardebint_ena, cleardebint_nxt, cleardebint_r, dm_clk, dm_rst_n);
  wire sethaltnot_ena = icb_wr_sethaltnot_ena;
  wire [HART_ID_W-1:0] sethaltnot_r;
  wire [HART_ID_W-1:0] sethaltnot_nxt = i_icb_cmd_wdata[HART_ID_W-1:0];
  sirv_gnrl_dfflr #(HART_ID_W) sethaltnot_dfflr (sethaltnot_ena, sethaltnot_nxt, sethaltnot_r, dm_clk, dm_rst_n);
  assign i_icb_rsp_valid = i_icb_cmd_valid;// Just directly pass back the valid in 0 cycle
  assign i_icb_cmd_ready = i_icb_rsp_ready;
  wire [31:0] rom_dout;
  assign i_icb_rsp_rdata =
            ({32{icb_sel_cleardebint}} & {{32-HART_ID_W{1'b0}}, cleardebint_r})
          | ({32{icb_sel_sethaltnot }} & {{32-HART_ID_W{1'b0}}, sethaltnot_r})
          | ({32{icb_sel_dbgrom  }} & rom_dout)
          | ({32{icb_sel_dbgram  }} & ram_dout);
   sirv_debug_rom u_sirv_debug_rom (
     .rom_addr (i_icb_cmd_addr[7-1:2]),
     .rom_dout (rom_dout)
   );
  //sirv_debug_rom_64 u_sirv_debug_rom_64(
  //  .rom_addr (i_icb_cmd_addr[8-1:2]),
  //  .rom_dout (rom_dout)
  //);
  wire         ram_cs   = dtm_access_dbgram_ena | icb_access_dbgram_ena;
  wire [3-1:0] ram_addr = dtm_access_dbgram_ena ? dtm_req_bits_addr[2:0] : i_icb_cmd_addr[4:2];
  wire         ram_rd   = dtm_access_dbgram_ena ? dtm_req_rd             : i_icb_cmd_read;
  wire [32-1:0]ram_wdat = dtm_access_dbgram_ena ? dtm_req_bits_data[31:0]: i_icb_cmd_wdata;
  sirv_debug_ram u_sirv_debug_ram(
    .clk      (dm_clk),
    .rst_n    (dm_rst_n),
    .ram_cs   (ram_cs),
    .ram_rd   (ram_rd),
    .ram_addr (ram_addr),
    .ram_wdat (ram_wdat),
    .ram_dout (ram_dout)
  );
  wire [HART_NUM-1:0] dm_haltnot_set;
  wire [HART_NUM-1:0] dm_haltnot_clr;
  wire [HART_NUM-1:0] dm_haltnot_ena;
  wire [HART_NUM-1:0] dm_haltnot_nxt;
  wire [HART_NUM-1:0] dm_debint_set;
  wire [HART_NUM-1:0] dm_debint_clr;
  wire [HART_NUM-1:0] dm_debint_ena;
  wire [HART_NUM-1:0] dm_debint_nxt;
  genvar i;
  generate
    for(i = 0; i < HART_NUM; i = i+1)//{
    begin:dm_halt_int_gen
        // The haltnot will be set by system bus set its ID to sethaltnot_r
      assign dm_haltnot_set[i] = icb_wr_sethaltnot_ena & (i_icb_cmd_wdata[HART_ID_W-1:0] == i[HART_ID_W-1:0]);
        // The haltnot will be cleared by DTM write 0 to haltnot
      assign dm_haltnot_clr[i] = dtm_wr_haltnot_ena & (dm_hartid_r == i[HART_ID_W-1:0]);
      assign dm_haltnot_ena[i] = dm_haltnot_set[i] | dm_haltnot_clr[i];
      assign dm_haltnot_nxt[i] = dm_haltnot_set[i] | (~dm_haltnot_clr[i]);
      sirv_gnrl_dfflr #(1) dm_haltnot_dfflr (dm_haltnot_ena[i], dm_haltnot_nxt[i], dm_haltnot_r[i], dm_clk, dm_rst_n);
        // The debug intr will be set by DTM write 1 to interrupt
      assign dm_debint_set[i] = dtm_wr_interrupt_ena & (dm_hartid_r == i[HART_ID_W-1:0]);
        // The debug intr will be clear by system bus set its ID to cleardebint_r
      assign dm_debint_clr[i] = icb_wr_cleardebint_ena & (i_icb_cmd_wdata[HART_ID_W-1:0] == i[HART_ID_W-1:0]);
      assign dm_debint_ena[i] = dm_debint_set[i] | dm_debint_clr[i];
      assign dm_debint_nxt[i] = dm_debint_set[i] | (~dm_debint_clr[i]);
      sirv_gnrl_dfflr #(1) dm_debint_dfflr  ( dm_debint_ena[i],  dm_debint_nxt[i],  dm_debint_r[i], dm_clk, dm_rst_n);
    end//}
  endgenerate
  assign o_dbg_irq = dm_debint_r;
  assign o_ndreset   = {HART_NUM{1'b0}};
  assign o_fullreset = {HART_NUM{1'b0}};
  assign inspect_jtag_clk = jtag_TCK;
endmodule