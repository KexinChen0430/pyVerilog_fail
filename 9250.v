module (provides software interface to UART)
   uart_ctrl uart_ctrl (
     .clk(clk),
     .reset_(reset_),
     .tx(tx),
     .rx(rx),
     .addr(addr),
     .cs(uart_cs),
     .req(req),
     .rnw(rnw),
     .wr_data(wr_data),
     .rd_data(uart_rd_data),
     .rdy(uart_rdy)
   );
   // Xilinx MicroBlaze CPU core
   microblaze_mcs_v1_4 mcs_0 (
     .Clk(clk),                        // input Clk
     .Reset(~reset_),                  // input Reset
     .IO_Addr_Strobe(),                // output IO_Addr_Strobe
     .IO_Read_Strobe(mcs_rd_enable),   // output IO_Read_Strobe
     .IO_Write_Strobe(mcs_wr_enable),  // output IO_Write_Strobe
     .IO_Address(mcs_addr),            // output [31 : 0] IO_Address
     .IO_Byte_Enable(mcs_byte_enable), // output [3 : 0] IO_Byte_Enable
     .IO_Write_Data(mcs_wr_data),      // output [31 : 0] IO_Write_Data
     .IO_Read_Data(mcs_rd_data),       // input [31 : 0] IO_Read_Data
     .IO_Ready(mcs_ready)              // input IO_Ready
   );
endmodule