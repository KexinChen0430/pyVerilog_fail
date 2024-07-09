module
  reg reg_read;
  always @(posedge clk_peri) begin
    reg_read <= select & !wr_peri;
  end
  wire [17:0] sd_dat_out;
  reg [17:0] sd_dat_out_last;
  wire [17:0] sd_dat_out_spmc;
  assign sd_dat_out_spmc = sd_dat_out_last;
  assign di_peri = (reg_read ? sd_dat_out_spmc : 18'b0) | di_peri_dma;
  always @(posedge clk_peri) begin
    sd_dat_out_last <= sd_dat_out;
  end
  spiMaster sdcard(
    .clk_i(clk_peri),
    .rst_i(reset),
    .address_i(addr_peri[2:0]),
    .data_i(do_peri[17:0]),
    .data_o(sd_dat_out),
    .select(select),
    .we_i(wr_peri),
    // SPI logic clock
    .spiSysClk(clk_peri),
    //SPI bus
    .spiClkOut(sd_clk),
    .spiDataIn(sd_miso),
    .spiDataOut(sd_mosi),
    .spiCS_n(sd_cs),
    .do_peri(do_peri),
    .di_peri(di_peri_dma),
    .addr_peri(addr_peri),
    .mem_clk(mem_clk),
    .mem_access(mem_access),
    .store_access(store_access | store_access_low),
    .addr_high(addr_high)
  );
  defparam sdcard.SDCARD_CLOCK = CLOCK_FREQUENCY;
  defparam sdcard.u_readWriteSDBlock.SDCARD_CLOCK = CLOCK_FREQUENCY;
  defparam sdcard.u_spiMasterSpmcBI.SDCARD_CLOCK = CLOCK_FREQUENCY;
  defparam sdcard.DMA_ADR = DMA_BASE_ADR;
endmodule