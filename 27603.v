module cfg ( CFG );
  // Declare the port directions.
  output  [255:0]       CFG;
  /*  Configure Device, Vendor ID, Class Code, and Revision ID */
  // Device ID and Vendor ID
  assign CFG[151:120] = 32'h0001_FEED ;
  // Class Code and  Revision ID
  assign CFG[183:152] = 32'h02000000 ;
  /*  Configure Subsystem ID and SubVendor ID                  */
  // Subsystem ID and  Subvendor ID
  assign CFG[215:184] = 32'h0000_FEED ;
  // External Subsystem ID and Subvendor ID
  assign CFG[114] = `DISABLE ;
  /*  Configure Base Address Registers                         */
  // BAR0
assign CFG[0]       = `ENABLE ;
assign CFG[32:1]    = `SIZE128M ;
assign CFG[33]      = `NOFETCH ;
assign CFG[35:34]   = `TYPE00 ;
assign CFG[36]      = `MEMORY ;
  // BAR1
assign CFG[37]      = `DISABLE ;
assign CFG[69:38]   = `SIZE2G ;
assign CFG[70]      = `NOFETCH ;
assign CFG[72:71]   = `TYPE00 ;
assign CFG[73]      = `MEMORY ;
  // BAR2
assign CFG[74]      = `DISABLE ;
assign CFG[106:75]  = `SIZE2G ;
assign CFG[107]     = `NOFETCH ;
assign CFG[109:108] = `TYPE00 ;
assign CFG[110]     = `MEMORY ;
  /*  Configure MAX_LAT MIN_GNT                                */
  assign CFG[231:224] = 8'h00 ;
  assign CFG[223:216] = 8'h00 ;
  /*  Configure other PCI options                             */
  // Latency Timer Enable
  assign CFG[112] = `ENABLE ;
  // Interrupt Enable
  assign CFG[113] = `ENABLE ;
/*  For advanced users only.                                */
  // Capability List Enable
  assign CFG[116] = `DISABLE ;
  // Capability List Pointer
  assign CFG[239:232] = 8'h00 ;
  // User Config Space Enable
  assign CFG[118] = `DISABLE ;
  // Interrupt Acknowledge
  assign CFG[240] = `DISABLE ;
  /*  Do not modify any of the following settings!     */
  // Obsolete
  assign CFG[111] = `DISABLE ;
  // Obsolete
  assign CFG[117] = `DISABLE ;
  // Obsolete
  assign CFG[119] = `DISABLE ;
  // Enable 66 MHz
  assign CFG[244] = `DISABLE ;
  assign CFG[254:245] = 10'b0010000000;
  // Do Not Modify
  assign CFG[115] = `DISABLE ;
  assign CFG[241] = `DISABLE ;
  assign CFG[242] = `DISABLE ;
  assign CFG[243] = `DISABLE ;
  assign CFG[255] = `DISABLE ;
endmodule