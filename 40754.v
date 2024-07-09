module MainAVR(clk, _reset,
               _mpu_rd, _mpu_wr, mpu_ale, mpu_ah, mpu_ad,
               _vram_en, _vram_rd, _vram_wr, _vram_be, vram_addr, vram_data,
               vsync, hsync, rgb);
  input clk;
  input _reset;
  // To AVR-style memory interface.
  // TODO: support other interfaces.
  input _mpu_rd;            // Read enable (active low)
  input _mpu_wr;            // Write enable (active low)
  input mpu_ale;            // Address latch enable
  input [`AVR_MPU_AH_BUS_WIDTH-1:0] mpu_ah;  // Upper address bus
  inout [`AVR_MPU_AD_BUS_WIDTH-1:0] mpu_ad;  // Multiplexed lower A/D bus
  // To VRAM.
  output _vram_en;          // Enable access (active low)
  output _vram_rd;          // Read enable (active low)
  output _vram_wr;          // Write enable (active low)
  output [1:0] _vram_be;    // Byte enable (active low)
  output [`VRAM_ADDR_WIDTH-1:0] vram_addr;   // Address bus
  inout [`VRAM_DATA_WIDTH-1:0]  vram_data;   // Data bus
  // To VGA connector.
  output vsync;
  output hsync;
  output [`RGB_COLOR_DEPTH-1:0] rgb;
  // Internal MPU bus conversion.
  // Convert a multiplexed 8-bit data bus to a full 16-bit data bus.
  wire [`AVR_MPU_ADDR_WIDTH-1:0] cc_addr;
  wire [`AVR_MPU_DATA_WIDTH-1:0] mpu_data_in;
  wire [`AVR_MPU_DATA_WIDTH-1:0] mpu_data_out;
  // Latch lower address bits.
  wire [`AVR_MPU_AD_BUS_WIDTH-1:0] mpu_al;
  CC_DLatch #(`AVR_MPU_AD_BUS_WIDTH)
    address_latch(.en(mpu_ale),
                  .d(mpu_ad),
                  .q(mpu_al));
  // Shift the address bits down by 1 to convert to a 16-bit bus address.
  assign cc_addr = {1'b0, mpu_ah, mpu_al[`AVR_MPU_AD_BUS_WIDTH-1:1]};
  // Handle bidirectional data port.
  assign mpu_ad = (~_mpu_rd & _mpu_wr & ~mpu_ale) ? mpu_data_out
                                                  : {`AVR_MPU_DATA_WIDTH{1'bz}};
  // Distribute the incoming 8-bit data to both bytes of the 16-bit data port.
  wire [`MPU_DATA_WIDTH-1:0] cc_data_in;
  wire [`MPU_DATA_WIDTH-1:0] cc_data_out;
  assign cc_data_in = {mpu_ad, mpu_ad};
  // Convert an outgoing 16-bit data bus to an 8-bit data bus by selecting the
  // high or low byte.
  assign mpu_data_out =
      mpu_al[0] ? cc_data_out[`MPU_DATA_WIDTH-1:`AVR_MPU_DATA_WIDTH]
                : cc_data_out[`AVR_MPU_DATA_WIDTH-1:0];
  // Determine byte enable based on whether the incoming address is odd or even.
  wire [1:0] _mpu_be = mpu_al[0] ? 2'b01 : 2'b10;
  // Bus enable is just if either read or write is enabled.
  wire _mpu_en = ~(~_mpu_rd ^ ~_mpu_wr);
  // VRAM interface
  wire vram_en;          // All control signals are internally active high.
  wire vram_rd;
  wire vram_wr;
  wire [1:0] vram_be;
  assign _vram_en = ~vram_en;
  assign _vram_rd = ~vram_rd;
  assign _vram_wr = ~vram_wr;
  assign _vram_be = ~vram_be;
  // Set up VRAM bidirectional I/Os.
  wire [`VRAM_DATA_WIDTH-1:0] vram_data_in;
  wire [`VRAM_DATA_WIDTH-1:0] vram_data_out;
  // Output to VRAM active only during write.
  assign vram_data = (vram_en & vram_wr) ? vram_data_out
                                         : {`VRAM_DATA_WIDTH {1'bz}};
  assign vram_data_in = vram_data;
  Core core(.clk(clk),
            .reset(~_reset),
            .mpu_rd(~_mpu_rd),
            .mpu_wr(~_mpu_wr),
            .mpu_en(~_mpu_en),
            .mpu_be(~_mpu_be),
            .mpu_addr_in(cc_addr),
            .mpu_data_in(cc_data_in),
            .mpu_data_out(cc_data_out),
            .vram_en(vram_en),
            .vram_rd(vram_rd),
            .vram_wr(vram_wr),
            .vram_be(vram_be),
            .vram_addr(vram_addr),
            .vram_data_in(vram_data_in),
            .vram_data_out(vram_data_out),
            .vga_vsync(vsync),
            .vga_hsync(hsync),
            .vga_rgb(rgb)
            );
endmodule