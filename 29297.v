module
   wire [31:0]     bus_addr;        // Avalon address
   wire [3:0]      bus_byte_enable; // four bit byte read/write mask
   wire            bus_read;        // high when requesting data
   wire            bus_write;       //  high when writing data
   wire [31:0]     bus_write_data;  //  data to send to Avalog bus
   wire            bus_ack;         //  Avalon bus raises this when done
   wire [31:0]     bus_read_data;   // data from Avalon bus
   wire            rst, hps_rst;
   assign rst = ~KEY[0] || hps_rst;
   wire [31:0]     delta_left;
   wire [31:0]     delta_right;
   wire            delta_mode_left, delta_mode_right;
   wire [9:0]      triangle_wave_max_left, triangle_wave_max_right;
   EBABWrapper ebab_wrapper
     (
      // Outputs
      .bus_byte_enable(bus_byte_enable),
      .bus_read(bus_read),
      .bus_write(bus_write),
      .bus_write_data(bus_write_data),
      .bus_addr(bus_addr),
      // Inputs
      .clk(CLOCK_50),
      .rst(rst | hps_rst),
      .bus_ack(bus_ack),
      .bus_read_data(bus_read_data),
      .delta_left(delta_left),
      .delta_right(delta_right),
      .out_sel(SW[9]),
      .delta_mode_left(delta_mode_left),
      .delta_mode_right(delta_mode_right),
      .triangle_wave_max_right(triangle_wave_max_right),
      .triangle_wave_max_left(triangle_wave_max_left)
      );
   Computer_System The_System
     (
      // FPGA Side
      // Global signals
      .system_pll_ref_clk_clk     (CLOCK_50),
      .system_pll_ref_reset_reset (1'b0),
      // AV Config
      .av_config_SCLK             (FPGA_I2C_SCLK),
      .av_config_SDAT             (FPGA_I2C_SDAT),
      // Audio Subsystem
      .audio_pll_ref_clk_clk      (CLOCK3_50),
      .audio_pll_ref_reset_reset  (1'b0),
      .audio_clk_clk              (AUD_XCK),
      .audio_ADCDAT               (AUD_ADCDAT),
      .audio_ADCLRCK              (AUD_ADCLRCK),
      .audio_BCLK                 (AUD_BCLK),
      .audio_DACDAT               (AUD_DACDAT),
      .audio_DACLRCK              (AUD_DACLRCK),
      // HPS slaves
      .reset_slave_external_connection_export                   (hps_rst),
      .delta_left_slave_external_connection_export              (delta_left),
      .delta_right_slave_external_connection_export             (delta_right),
      .triangle_wave_max_left_slave_external_connection_export  (triangle_wave_max_left),
      .triangle_wave_max_right_slave_external_connection_export (triangle_wave_max_right),
      .delta_mode_right_slave_external_connection_export        (delta_mode_right),
      .delta_mode_left_slave_external_connection_export         (delta_mode_left),
      // bus-master state machine interface
      .bus_master_audio_external_interface_address              (bus_addr),
      .bus_master_audio_external_interface_byte_enable          (bus_byte_enable),
      .bus_master_audio_external_interface_read                 (bus_read),
      .bus_master_audio_external_interface_write                (bus_write),
      .bus_master_audio_external_interface_write_data           (bus_write_data),
      .bus_master_audio_external_interface_acknowledge          (bus_ack),
      .bus_master_audio_external_interface_read_data            (bus_read_data),
      // VGA Subsystem
      .vga_pll_ref_clk_clk     (CLOCK2_50),
      .vga_pll_ref_reset_reset (1'b0),
      .vga_CLK                 (VGA_CLK),
      .vga_BLANK               (VGA_BLANK_N),
      .vga_SYNC                (VGA_SYNC_N),
      .vga_HS                  (VGA_HS),
      .vga_VS                  (VGA_VS),
      .vga_R                   (VGA_R),
      .vga_G                   (VGA_G),
      .vga_B                   (VGA_B),
      // SDRAM
      .sdram_clk_clk (DRAM_CLK),
      .sdram_addr    (DRAM_ADDR),
      .sdram_ba      (DRAM_BA),
      .sdram_cas_n   (DRAM_CAS_N),
      .sdram_cke     (DRAM_CKE),
      .sdram_cs_n    (DRAM_CS_N),
      .sdram_dq      (DRAM_DQ),
      .sdram_dqm     ({DRAM_UDQM,DRAM_LDQM}),
      .sdram_ras_n   (DRAM_RAS_N),
      .sdram_we_n    (DRAM_WE_N),
      // HPS Side
      // DDR3 SDRAM
      .memory_mem_a       (HPS_DDR3_ADDR),
      .memory_mem_ba      (HPS_DDR3_BA),
      .memory_mem_ck      (HPS_DDR3_CK_P),
      .memory_mem_ck_n    (HPS_DDR3_CK_N),
      .memory_mem_cke     (HPS_DDR3_CKE),
      .memory_mem_cs_n    (HPS_DDR3_CS_N),
      .memory_mem_ras_n   (HPS_DDR3_RAS_N),
      .memory_mem_cas_n   (HPS_DDR3_CAS_N),
      .memory_mem_we_n    (HPS_DDR3_WE_N),
      .memory_mem_reset_n (HPS_DDR3_RESET_N),
      .memory_mem_dq      (HPS_DDR3_DQ),
      .memory_mem_dqs     (HPS_DDR3_DQS_P),
      .memory_mem_dqs_n   (HPS_DDR3_DQS_N),
      .memory_mem_odt     (HPS_DDR3_ODT),
      .memory_mem_dm      (HPS_DDR3_DM),
      .memory_oct_rzqin   (HPS_DDR3_RZQ),
      // Ethernet
      .hps_io_hps_io_gpio_inst_GPIO35  (HPS_ENET_INT_N),
      .hps_io_hps_io_emac1_inst_TX_CLK (HPS_ENET_GTX_CLK),
      .hps_io_hps_io_emac1_inst_TXD0   (HPS_ENET_TX_DATA[0]),
      .hps_io_hps_io_emac1_inst_TXD1   (HPS_ENET_TX_DATA[1]),
      .hps_io_hps_io_emac1_inst_TXD2   (HPS_ENET_TX_DATA[2]),
      .hps_io_hps_io_emac1_inst_TXD3   (HPS_ENET_TX_DATA[3]),
      .hps_io_hps_io_emac1_inst_RXD0   (HPS_ENET_RX_DATA[0]),
      .hps_io_hps_io_emac1_inst_MDIO   (HPS_ENET_MDIO),
      .hps_io_hps_io_emac1_inst_MDC    (HPS_ENET_MDC),
      .hps_io_hps_io_emac1_inst_RX_CTL (HPS_ENET_RX_DV),
      .hps_io_hps_io_emac1_inst_TX_CTL (HPS_ENET_TX_EN),
      .hps_io_hps_io_emac1_inst_RX_CLK (HPS_ENET_RX_CLK),
      .hps_io_hps_io_emac1_inst_RXD1   (HPS_ENET_RX_DATA[1]),
      .hps_io_hps_io_emac1_inst_RXD2   (HPS_ENET_RX_DATA[2]),
      .hps_io_hps_io_emac1_inst_RXD3   (HPS_ENET_RX_DATA[3]),
      // Flash
      .hps_io_hps_io_qspi_inst_IO0     (HPS_FLASH_DATA[0]),
      .hps_io_hps_io_qspi_inst_IO1     (HPS_FLASH_DATA[1]),
      .hps_io_hps_io_qspi_inst_IO2     (HPS_FLASH_DATA[2]),
      .hps_io_hps_io_qspi_inst_IO3     (HPS_FLASH_DATA[3]),
      .hps_io_hps_io_qspi_inst_SS0     (HPS_FLASH_NCSO),
      .hps_io_hps_io_qspi_inst_CLK     (HPS_FLASH_DCLK),
      // Accelerometer
      .hps_io_hps_io_gpio_inst_GPIO61  (HPS_GSENSOR_INT),
      //.adc_sclk                      (ADC_SCLK),
      //.adc_cs_n                      (ADC_CS_N),
      //.adc_dout                      (ADC_DOUT),
      //.adc_din                       (ADC_DIN),
      // General Purpose I/O
      .hps_io_hps_io_gpio_inst_GPIO40  (HPS_GPIO[0]),
      .hps_io_hps_io_gpio_inst_GPIO41  (HPS_GPIO[1]),
      // I2C
      .hps_io_hps_io_gpio_inst_GPIO48  (HPS_I2C_CONTROL),
      .hps_io_hps_io_i2c0_inst_SDA     (HPS_I2C1_SDAT),
      .hps_io_hps_io_i2c0_inst_SCL     (HPS_I2C1_SCLK),
      .hps_io_hps_io_i2c1_inst_SDA     (HPS_I2C2_SDAT),
      .hps_io_hps_io_i2c1_inst_SCL     (HPS_I2C2_SCLK),
      // Pushbutton
      .hps_io_hps_io_gpio_inst_GPIO54  (HPS_KEY),
      // LED
      .hps_io_hps_io_gpio_inst_GPIO53  (HPS_LED),
      // SD Card
      .hps_io_hps_io_sdio_inst_CMD     (HPS_SD_CMD),
      .hps_io_hps_io_sdio_inst_D0      (HPS_SD_DATA[0]),
      .hps_io_hps_io_sdio_inst_D1      (HPS_SD_DATA[1]),
      .hps_io_hps_io_sdio_inst_CLK     (HPS_SD_CLK),
      .hps_io_hps_io_sdio_inst_D2      (HPS_SD_DATA[2]),
      .hps_io_hps_io_sdio_inst_D3      (HPS_SD_DATA[3]),
      // SPI
      .hps_io_hps_io_spim1_inst_CLK    (HPS_SPIM_CLK),
      .hps_io_hps_io_spim1_inst_MOSI   (HPS_SPIM_MOSI),
      .hps_io_hps_io_spim1_inst_MISO   (HPS_SPIM_MISO),
      .hps_io_hps_io_spim1_inst_SS0    (HPS_SPIM_SS),
      // UART
      .hps_io_hps_io_uart0_inst_RX     (HPS_UART_RX),
      .hps_io_hps_io_uart0_inst_TX     (HPS_UART_TX),
      // USB
      .hps_io_hps_io_gpio_inst_GPIO09  (HPS_CONV_USB_N),
      .hps_io_hps_io_usb1_inst_D0      (HPS_USB_DATA[0]),
      .hps_io_hps_io_usb1_inst_D1      (HPS_USB_DATA[1]),
      .hps_io_hps_io_usb1_inst_D2      (HPS_USB_DATA[2]),
      .hps_io_hps_io_usb1_inst_D3      (HPS_USB_DATA[3]),
      .hps_io_hps_io_usb1_inst_D4      (HPS_USB_DATA[4]),
      .hps_io_hps_io_usb1_inst_D5      (HPS_USB_DATA[5]),
      .hps_io_hps_io_usb1_inst_D6      (HPS_USB_DATA[6]),
      .hps_io_hps_io_usb1_inst_D7      (HPS_USB_DATA[7]),
      .hps_io_hps_io_usb1_inst_CLK     (HPS_USB_CLKOUT),
      .hps_io_hps_io_usb1_inst_STP     (HPS_USB_STP),
      .hps_io_hps_io_usb1_inst_DIR     (HPS_USB_DIR),
      .hps_io_hps_io_usb1_inst_NXT     (HPS_USB_NXT)
      );
endmodule