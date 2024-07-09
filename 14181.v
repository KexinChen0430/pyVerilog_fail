module is cretaed
// will be wrong, of course
assign conv20_y_in[7:0]=     conv18_y_in[7:0];
assign conv20_yaddrw[7:0]=   conv18_yaddrw[7:0];
assign conv20_ywe=           conv18_ywe;
assign conv20_c_in[8:0]=     conv18_c_in[8:0];
assign conv20_caddrw[6:0]=   conv18_caddrw[6:0];
assign conv20_cwe=           conv18_cwe;
assign conv20_pre_first_out= conv18_pre_first_out;
// currently only 8 bits are used in the memories
   RAMB16_S9_S9 i_y_buff (
      .DOA(),                                  // Port A 8-bit Data Output
      .DOPA(),                                 // Port A 8-bit Parity Output
      .ADDRA({1'b0,wpage[1:0],yaddrw[7:0]}),   // Port A 11-bit Address Input
      .CLKA(clk),                              // Port A Clock
      .DIA(y_in[7:0]),                               // Port A 8-bit Data Input
      .DIPA(y_in[8]),                              // Port A 1-bit parity Input
      .ENA(ywe),                                // Port A RAM Enable Input
      .SSRA(1'b0),                              // Port A Synchronous Set/Reset Input
      .WEA(1'b1),                               // Port A Write Enable Input
      .DOB(y_out[7:0]),                         // Port B 8-bit Data Output
      .DOPB(y_out[8]),                                  // Port B 1-bit Parity Output
      .ADDRB({1'b0,rpage[1:0],raddr[7:0]}),     // Port B 11-bit Address Input
      .CLKB(clk),                               // Port B Clock
      .DIB(8'h0),                               // Port B 8-bit Data Input
      .DIPB(1'h0),                              // Port-B 1-bit parity Input
      .ENB(!raddr[8]),                          // PortB RAM Enable Input
      .SSRB(1'b0),                              // Port B Synchronous Set/Reset Input
      .WEB(1'b0)                                // Port B Write Enable Input
   );
   RAMB16_S9_S9 i_CrCb_buff (
      .DOA(),                                  // Port A 8-bit Data Output
      .DOPA(),                                 // Port A 8-bit Parity Output
      .ADDRA({1'b0,wpage[1:0],caddrw[7:0]}),   // Port A 11-bit Address Input
      .CLKA(clk),                              // Port A Clock
      .DIA(c_in[7:0]),                          // Port A 8-bit Data Input
      .DIPA(c_in[8]),                              // Port A 1-bit parity Input
      .ENA(cwe),                                // Port A RAM Enable Input
      .SSRA(1'b0),                              // Port A Synchronous Set/Reset Input
      .WEA(1'b1),                               // Port A Write Enable Input
      .DOB(c_out[7:0]),                         // Port B 8-bit Data Output
      .DOPB(c_out[8]),                                  // Port B 1-bit Parity Output
      .ADDRB({1'b0,rpage[1:0],raddr[7:0]}),     // Port B 11-bit Address Input
      .CLKB(clk),                               // Port B Clock
      .DIB(8'h0),                               // Port B 8-bit Data Input
      .DIPB(1'h0),                              // Port-B 1-bit parity Input
      .ENB(raddr[8]),                           // PortB RAM Enable Input
      .SSRB(1'b0),                              // Port B Synchronous Set/Reset Input
      .WEB(1'b0)                                // Port B Write Enable Input
   );
endmodule