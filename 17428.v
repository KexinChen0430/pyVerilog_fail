module top
  (
   output wire MOSI,
   output wire CSB,
   output wire DRCK1,
   input  MISO
   );
   wire   CAPTURE;
   wire   UPDATE;
   wire   TDI;
   wire   TDO1;
   reg [47:0] header;
   reg [15:0]  len;
   reg 	       have_header = 0;
   assign      MOSI = TDI ;
   wire        SEL1;
   wire        SHIFT;
   wire        RESET;
   reg 	       CS_GO = 0;
   reg 	       CS_GO_PREP = 0;
   reg 	       CS_STOP = 0;
   reg 	       CS_STOP_PREP = 0;
   reg [13:0] RAM_RADDR;
   reg [13:0] RAM_WADDR;
   wire        DRCK1_INV = !DRCK1;
   wire        RAM_DO;
   wire        RAM_DI;
   reg 	       RAM_WE = 0;
   RAMB16_S1_S1 RAMB16_S1_S1_inst
     (
      .DOA(RAM_DO),
      .DOB(),
      .ADDRA(RAM_RADDR),
      .ADDRB(RAM_WADDR),
      .CLKA(DRCK1_INV),
      .CLKB(DRCK1),
      .DIA(1'b0),
      .DIB(RAM_DI),
      .ENA(1'b1),
      .ENB(1'b1),
      .SSRA(1'b0),
      .SSRB(1'b0),
      .WEA(1'b0),
      .WEB(RAM_WE)
      );
   BSCAN_SPARTAN6 BSCAN_SPARTAN6_inst
     (
      .CAPTURE(CAPTURE),
      .DRCK(DRCK1),
      .RESET(RESET),
      .RUNTEST(),
      .SEL(SEL1),
      .SHIFT(SHIFT),
      .TCK(),
      .TDI(TDI),
      .TMS(),
      .UPDATE(UPDATE),
      .TDO(TDO1)
      );
`include "bscan_common.vh"
endmodule