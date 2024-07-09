module SPIBusTest;
  // Main SPI interface.
  reg main_nss, main_sck, main_mosi;
  wire main_miso;
  // Secondary SPI interface.
  reg alt_nss, alt_sck, alt_mosi;
  wire alt_miso;
  // SPI memory bus interface.
  wire mem_nss, mem_sck, mem_mosi;
  reg mem_miso;
  // Instantiate the Unit Under Test (UUT).
  SPIBus spi_bus(main_nss, main_sck, main_mosi, main_miso,
                 alt_nss, alt_sck, alt_mosi, alt_miso,
                 mem_nss, mem_sck, mem_mosi, mem_miso);
  integer stage;      // Keeps track of test progress.
  // Generate contents of |mem_miso| as the inverse of |mem_mosi|.
  always @ (*)
    mem_miso <= ~mem_mosi;
  initial begin
    main_nss = 0;
    main_sck = 0;
    main_mosi = 0;
    alt_nss = 1;
    alt_sck = 0;
    alt_mosi = 0;
    stage = 0;
    #1 main_nss = 1;
    #10
    stage = 1;
    // Perform some memory bus accesses.
    #10
    main_nss = 0;
    main_spi_transmit(8'h01);
    main_spi_transmit(8'h02);
    main_spi_transmit(8'h04);
    main_spi_transmit(8'h08);
    main_nss = 1;
    // Attempt a secondary SPI access, should go through.
    #10
    alt_nss = 0;
    alt_spi_transmit(8'h11);
    alt_spi_transmit(8'h22);
    alt_spi_transmit(8'h44);
    alt_spi_transmit(8'h88);
    alt_nss = 1;
    #10
    stage = 2;
    // Assert the main bus and the secondary bus at the same time. Neither
    // should have nSS access, but the main bus should have SCK and MISO access.
    #10
    main_nss = 0;
    alt_nss = 0;
    main_spi_transmit(8'h01);
    main_spi_transmit(8'h02);
    main_spi_transmit(8'h04);
    main_spi_transmit(8'h08);
    alt_spi_transmit(8'h11);
    alt_spi_transmit(8'h22);
    alt_spi_transmit(8'h44);
    alt_spi_transmit(8'h88);
    main_nss = 1;
    alt_nss = 1;
    #10
    stage = 3;
  end
  // Task to send a byte over primary SPI bus.
  task main_spi_transmit;
    input [`BYTE_WIDTH-1:0] data;
    integer i;
    begin
      main_sck = 0;
      #2
      main_sck = 0;
      for (i = 0; i < `BYTE_WIDTH; i = i + 1) begin
        main_mosi = data[`BYTE_WIDTH - 1 - i];
        #1
        main_sck = 1;
        #1
        main_sck = 0;
      end
      #2
      main_sck = 0;
      main_mosi = 0;
    end
  endtask
  // Task to send a byte over secondary SPI bus.
  task alt_spi_transmit;
    input [`BYTE_WIDTH-1:0] data;
    integer i;
    begin
      alt_sck = 0;
      #2
      alt_sck = 0;
      for (i = 0; i < `BYTE_WIDTH; i = i + 1) begin
        alt_mosi = data[`BYTE_WIDTH - 1 - i];
        #1
        alt_sck = 1;
        #1
        alt_sck = 0;
      end
      #2
      alt_sck = 0;
      alt_mosi = 0;
    end
  endtask
endmodule