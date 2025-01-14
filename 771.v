module SPIMemoryTest;
  // SPI interface.
  reg _select, sck, mosi;
  wire miso;
  // Memory interface.
  wire [`SPI_MEM_ADDR_WIDTH-1:0] addr;
  wire [`SPI_MEM_DATA_WIDTH-1:0] data_in;
  wire [`SPI_MEM_DATA_WIDTH-1:0] data_out;
  wire rd, wr;
  // Instantiate the Unit Under Test (UUT).
  SPIMemory spi_memory(
      ._select(_select), .sck(sck), .mosi(mosi), .miso(miso),
      .addr(addr), .data_in(data_in), .data_out(data_out), .rd(rd), .wr(wr)
  );
  // Don't have actual memory, so just use the lower byte of address as the data
  // read from memory.
  assign data_in = rd ? addr[`SPI_MEM_DATA_WIDTH-1:0] : 'bx;
  initial begin
    _select = 0;
    sck = 0;
    mosi = 0;
    #1 _select = 1;
    // Perform some writes.
    #10
    _select = 0;
    spi_transmit(8'hde);  // Write to address 0x5ead.
    spi_transmit(8'had);
    spi_transmit(8'h01);  // These are the data bytes written.
    spi_transmit(8'h02);
    spi_transmit(8'h04);
    spi_transmit(8'h08);
    _select = 1;
    #10
    _select = 0;
    spi_transmit(8'hbe);  // Write to address 0x3eef.
    spi_transmit(8'hef);
    spi_transmit(8'h11);  // These are the data bytes written.
    spi_transmit(8'h22);
    spi_transmit(8'h44);
    spi_transmit(8'h88);
    _select = 1;
    // Perform some reads.
    #10
    _select = 0;
    spi_transmit(8'h5a);  // Read from address 0x5afe.
    spi_transmit(8'hfe);
    spi_transmit(8'h01);  // These dummy data bytes should not show up.
    spi_transmit(8'h02);
    spi_transmit(8'h04);
    spi_transmit(8'h08);
    _select = 1;
    #10
    _select = 0;
    spi_transmit(8'h7f);  // Test wraparound during read.
    spi_transmit(8'hfe);
    spi_transmit(8'h11);  // These dummy data bytes should not show up.
    spi_transmit(8'h22);
    spi_transmit(8'h44);
    spi_transmit(8'h88);
    _select = 1;
    #10
    _select = 0;
    spi_transmit(8'hff);  // Test wraparound during write.
    spi_transmit(8'hfe);
    spi_transmit(8'h11);  // These dummy data bytes should not show up.
    spi_transmit(8'h22);
    spi_transmit(8'h44);
    spi_transmit(8'h88);
    _select = 1;
  end
  // Task to send a byte over SPI.
  task spi_transmit;
    input [`BYTE_WIDTH-1:0] data;
    integer i;
    begin
      sck = 0;
      #2
      sck = 0;
      for (i = 0; i < `BYTE_WIDTH; i = i + 1) begin
        mosi = data[`BYTE_WIDTH - 1 - i];
        #1
        sck = 1;
        #1
        sck = 0;
      end
      #2
      sck = 0;
    end
  endtask
endmodule