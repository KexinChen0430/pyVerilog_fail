module outputs)
   wire [AW-1:0]        ahb_sram_addr;          // From U_AHB_TO_SSRAM of ahb_to_ssram.v
   wire [31:0]          ahb_sram_din;           // From U_AHB_TO_SSRAM of ahb_to_ssram.v
   wire [3:0]           ahb_sram_wb;            // From U_AHB_TO_SSRAM of ahb_to_ssram.v
   wire [31:0]          sram_ahb_dout;          // From U_RAM of bytewrite_ram_1b.v
   // End of automatics
   wire [3:0]           ahb_sram_wb_qual;
     ahb_to_ssram  #(.AW(AW)) U_AHB_TO_SSRAM
  (
   .ahb_sram_we                         (),
   .ahb_sram_en                         (),
   .ahb_sram_enb                        (),
   /*AUTOINST*/
   // Outputs
   .HREADYOUT                           (HREADYOUT),
   .HRDATA                              (HRDATA[31:0]),
   .HRESP                               (HRESP),
   .ahb_sram_addr                       (ahb_sram_addr[AW-1:0]),
   .ahb_sram_wb                         (ahb_sram_wb[3:0]),
   .ahb_sram_din                        (ahb_sram_din[31:0]),
   // Inputs
   .HCLK                                (HCLK),
   .HRESETn                             (HRESETn),
   .HSEL                                (HSEL),
   .HADDR                               (HADDR[AW-1:0]),
   .HTRANS                              (HTRANS[1:0]),
   .HSIZE                               (HSIZE[2:0]),
   .HWRITE                              (HWRITE),
   .HWDATA                              (HWDATA[31:0]),
   .HREADY                              (HREADY),
   .sram_ahb_dout                       (sram_ahb_dout[31:0]));
   assign ahb_sram_wb_qual = ahb_sram_wb & {4{!ROM}};
/* -----\/----- EXCLUDED -----\/-----
   /-* sync_ram_wf_x32 AUTO_TEMPLATE(
    .dout            (sram_ahb_dout[31:0]),
    .din            (ahb_sram_din[31:0]),
    .enb              (ahb_sram_enb[@]),
    .addr            (ahb_sram_addr[9:0]),
    .clk(HCLK),
    ); *-/
   sync_ram_wf_x32 #(.ADDR_WIDTH(AW-2))
   U_RAM(
         .web                           (ahb_sram_wb_qual[3:0]),
         /-*AUTOINST*-/
         // Outputs
         .dout                          (sram_ahb_dout[31:0]),
         // Inputs
         .clk                           (HCLK),
         .enb                           (ahb_sram_enb[3:0]),
         .addr                          (ahb_sram_addr[9:0]),
         .din                           (ahb_sram_din[31:0]));
 -----/\----- EXCLUDED -----/\----- */
    /* bytewrite_ram_32bits  AUTO_TEMPLATE(
     .dout            (sram_ahb_dout[31:0]),
     .din             (ahb_sram_din[31:0]),
     .enb             (ahb_sram_enb[@]),
     .we              (ahb_sram_wb[3:0]),
     .addr            (ahb_sram_addr[9:0]),
     .clk(HCLK),
     ); */
   bytewrite_ram_32bits
   #(.SIZE(1<<(AW-2)),.ADDR_WIDTH(AW-2))
   U_RAM (
                           /*AUTOINST*/
          // Outputs
          .dout                         (sram_ahb_dout[31:0]),   // Templated
          // Inputs
          .clk                          (HCLK),                  // Templated
          .we                           (ahb_sram_wb[3:0]),      // Templated
          .addr                         (ahb_sram_addr[AW-1:2]),    // Templated
          .din                          (ahb_sram_din[31:0]));    // Templated
endmodule