module trcam
 #( parameter                CAMD = 128  ,  // CAM depth (power of 2, >=64)
    parameter                CAMW = 9    ,  // CAM/pattern width / for one stage (<=14)
    parameter                INOM = 1    ,  // binary / Initial CAM with no match
    parameter                BRAM = "M20K")  // BRAM type- "M20K":Altera's M20K; "GEN":generic
  ( input                    clk         ,  // clock
    input                    rst         ,  // global registers reset
    input                    wEnb        ,  // write enable
    input                    wrEr        ,  // Write or erase (inverted)
    input  [`log2(CAMD)-1:0] wAddr       ,  // write address
    input  [      CAMW -1:0] wPatt       ,  // write pattern
    input  [      CAMW -1:0] mPatt       ,  // patern to match
    output [      CAMD -1:0] match       ); // match / one-hot
  // Altera's M20K parameters
  localparam M20K_nBITS = 16384                                ; // total bits
  localparam M20K_MIND  = 512                                  ; // minimum depth / widest configuration
  localparam M20K_MINAW = `log2(M20K_MIND)                     ; // minimum address width (=9)
  localparam M20K_CAMW  = (CAMW<M20K_MINAW) ? M20K_MINAW : CAMW; // effective CAMW >= M20K_MINAW (14)
  localparam M20K_DW    = (M20K_nBITS/(2**M20K_CAMW))<1 ? 1 : (M20K_nBITS/(2**M20K_CAMW)) ; // M20K data width (=1)
  localparam nM20K      = CAMD       / M20K_DW                 ; // M20K count (32k)
  wire [`log2(CAMD)-`log2(M20K_DW)-1:0] M20KSel_bin = wAddr[`log2(CAMD)-1:`log2(M20K_DW)];
  reg  [nM20K                     -1:0] M20KSel_1ht                                      ;
  // binary to one-hot
  always @(*) begin
    M20KSel_1ht              = 0   ;
    M20KSel_1ht[M20KSel_bin] = wEnb;
  end
  // generate and instantiate mixed-width BRAMs
  genvar gi;
  generate
    if (BRAM=="M20K")
      for (gi=1 ; gi<=nM20K ; gi=gi+1) begin: BRAMgi
        if (CAMW<14) // M20K
          mwram_m20k  #( .WR_DW( 1                                                   ), // write width
                         .RD_DW( M20K_DW                                             ), // read width
                         .IZERO( INOM                                                )) // initialize to zeros
          mwram_m20k_i ( .clk  ( clk                                                 ), // clock
                         .rst  ( rst                                                 ), // global registers reset
                         .wEnb ( M20KSel_1ht[gi-1]                                   ), // write enable
                         .wAddr( {`ZPAD(wPatt,M20K_MINAW),wAddr[`log2(M20K_DW)-1:0]} ), // write address [13:0]
                         .wData( wrEr                                                ), // write data
                         .rAddr( `ZPAD(mPatt,M20K_MINAW)                             ), // read address [ 8:0]
                         .rData( match[gi*M20K_DW-1 -: M20K_DW])                     ); // read data [31:0]
        else if (CAMW==14) // single bit read/write M20K
          mwram_m20k  #( .WR_DW( 1                ), // write width
                         .RD_DW( 1                ), // read width
                         .IZERO( INOM             )) // initialize to zeros
          mwram_m20k_i ( .clk  ( clk              ), // clock
                         .rst  ( rst              ), // global registers reset
                         .wEnb (M20KSel_1ht[gi-1] ), // write enable
                         .wAddr( wPatt            ), // write address [13:0]
                         .wData( wrEr             ), // write data
                         .rAddr( mPatt            ), // read address [ 8:0]
                         .rData( match[gi-1])     ); // read data [31:0]
        else // CAMW>14
          sbram_m20k  #( .DEPTH( 2**CAMW           ),  // RAM depth
                         .IZERO( INOM              ))  // initialize to zeros
          sbram_m20k_i ( .clk  ( clk               ),  // clock
                         .rst  ( rst               ),  // global registers reset
                         .wEnb ( M20KSel_1ht[gi-1] ),  // write enable
                         .wAddr( wPatt             ),  // write address / [`log2(RD_D*RD_DW/WR_DW)-1:0]
                         .wData( wrEr              ),  // write data    / [WR_DW                  -1:0]
                         .rAddr( mPatt             ),  // read address  / [`log2(RD_D)            -1:0]
                         .rData( match[gi-1]       )); // read data     / [RD_DW                  -1:0]
      end
    else // generic
      mwram_gen  #( .WR_DW( 1             ),  // write data width
                    .RD_DW( CAMD          ),  // read  data width
                    .RD_D ( 2**CAMW       ),  // read depth
                    .IZERO( INOM          )) // initialize to zeros
      mwram_gen_i ( .clk  ( clk           ),  // clock
                    .rst  ( rst           ),  // global registers reset
                    .wEnb ( wEnb          ),  // write enable
                    .wAddr( {wPatt,wAddr} ),  // write address / [`log2(RD_D*RD_DW/WR_DW)-1:0]
                    .wData( wrEr          ),  // write data    / [WR_DW                  -1:0]
                    .rAddr( mPatt         ),  // read address  / [`log2(RD_D)            -1:0]
                    .rData( match         )); // read data     / [RD_DW                  -1:0]
  endgenerate
endmodule