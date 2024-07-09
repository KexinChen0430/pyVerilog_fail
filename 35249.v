module accessing to the on-board static asynchronous RAM
// RAM
//cyclone's M4k cells - just an example of instantiating 16-bit M4K altera RAM
ram16x512 ram (
        .address (dmem_addr[8:0]),
        .clken   (~dmem_cen),
        .clock   (clk_sys),
        .data    (dmem_din[15:0]),
        .q       (dmem_dout[15:0]),
        .wren    ( ~(&dmem_wen[1:0]) ),
        .byteena ( ~dmem_wen[1:0] )
);
/*
// DE1's onboard sram - only 512 words used
ext_de1_sram #(.ADDR_WIDTH(9)) ram (
        .clk(clk_sys),
        .ram_addr(dmem_addr[8:0]),
        .ram_cen(dmem_cen),
        .ram_wen(dmem_wen[1:0]),
        .ram_dout(dmem_dout[15:0]),
        .ram_din(dmem_din[15:0]),
        .SRAM_ADDR(SRAM_ADDR),
        .SRAM_DQ(SRAM_DQ),
        .SRAM_CE_N(SRAM_CE_N),
        .SRAM_OE_N(SRAM_OE_N),
        .SRAM_WE_N(SRAM_WE_N),
        .SRAM_UB_N(SRAM_UB_N),
        .SRAM_LB_N(SRAM_LB_N)
);
*/
// ROM - DEBUG ACCESS removed. If you need it, use as example original diligent's sources
rom16x2048 rom_0 (
        .clock  (clk_sys),
        .clken  (~pmem_cen),
        .address        (pmem_addr[10:0]),
        .q              ( pmem_dout )
);
//=============================================================================
// 7)  I/O CELLS
//=============================================================================
assign p3_din[7:0] = SW[7:0];
assign LEDR[7:0] = p3_dout[7:0] & p3_dout_en[7:0];
// RS-232 Port
// P1.1 (TX) and P2.2 (RX)
assign p1_io_din      = 8'h00;
assign p2_io_din[7:3] = 5'h00;
assign p2_io_din[1:0] = 2'h0;
// Mux the RS-232 port between IO port and the debug interface.
// The mux is controlled with the SW0 switch
wire   uart_txd_out = p3_din[0] ? dbg_uart_txd : p1_io_dout[1];
wire   uart_rxd_in;
assign p2_io_din[2] = p3_din[0] ? 1'b1         : uart_rxd_in;
assign dbg_uart_rxd = p3_din[0] ? uart_rxd_in  : 1'b1;
assign uart_rxd_in = UART_RXD;
assign UART_TXD = uart_txd_out;
endmodule