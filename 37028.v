module does this for us
rom r(.clock(clk), .address(addr[11:0]), .q(rom_data), .data(data), .wren(~cs0_ & ~we_));
rom_tristate r_ts(.cs_(cs0_), .oe_(oe_), .data_in(rom_data), .data_out(data));
// UART at 12MiB
uart_mmio #(2604) uart(.clk(clk), .rst_(new_rst_), .data(data), .addr(addr[7:0]), .cs_(cs3_), .oe_(oe_), .we_(we_), .TxD(uart_TxD));
// VGA at 16MiB
vga vga(.clk(clk), .data(data), .addr(addr[11:0]), .cs_(cs4_), .oe_(oe_), .we_(we_), .r(vga_r), .g(vga_g), .b(vga_b), .hs(vga_hs), .vs(vga_vs));
// SPI at 20MiB
spi spi(.clk(clk), .data(data), .rst_(new_rst_), .addr(addr[7:0]), .cs_(cs5_), .oe_(oe_), .we_(we_), .spi_ncs(spi_ncs), .spi_mosi(spi_mosi), .spi_miso(spi_miso), .spi_sclk(spi_sclk));
// Timer at 24 MiB
timer timer(.clk(clk), .data(data), .rst_(new_rst_), .addr(addr[7:0]), .cs_(cs6_), .oe_(oe_), .we_(we_), .interrupt(irpts[0]));
// interrupt controller at 28 MiB
irq_ctrl irq(.clk(clk), .rst_(new_rst_), .data(data), .addr(addr[7:0]), .cs_(cs7_), .oe_(oe_), .we_(we_), .irpts(irpts), .cpu_int(cpu_int), .cpu_int_ack(cpu_int_ack));
endmodule