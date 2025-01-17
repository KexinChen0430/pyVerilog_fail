module lvt_1ht
 #(  parameter MEMD = 16, // memory depth
     parameter nRP  = 1 , // number of reading ports
     parameter nWP  = 3 , // number of writing ports
     parameter WAWB = 1 , // allow Write-After-Write (need to bypass feedback ram)
     parameter RAWB = 1 , // new data for Read-after-Write (need to bypass output ram)
     parameter RDWB = 0 , // new data for Read-During-Write
     parameter ZERO = 0 , // binary / Initial RAM with zeros (has priority over FILE)
     parameter FILE = ""  // initialization file, optional
  )( input                            clk  ,  // clock
     input      [            nWP-1:0] WEnb ,  // write enable for each writing port
     input      [`log2(MEMD)*nWP-1:0] WAddr,  // write addresses    - packed from nWP write ports
     input      [`log2(MEMD)*nRP-1:0] RAddr,  // read  addresses    - packed from nRP  read  ports
     output reg [nWP        *nRP-1:0] RBank); // read bank selector - packed from nRP read ports
  localparam ADRW = `log2(MEMD); // address width
  localparam LVTW = nWP - 1    ; // required memory width
  // Register write addresses, data and enables
  reg [ADRW*nWP-1:0] WAddr_r; // registered write addresses - packed from nWP write ports
  reg [     nWP-1:0] WEnb_r ; // registered write enable for each writing port
  always @(posedge clk) begin
    WAddr_r <= WAddr;
    WEnb_r  <= WEnb ;
  end
  // unpacked/pack addresses and data
  reg  [ADRW     -1:0] WAddr2D    [nWP-1:0]          ; // write addresses            / 2D
  reg  [ADRW     -1:0] WAddr2D_r  [nWP-1:0]          ; // registered write addresses / 2D
  wire [LVTW*nRP -1:0] RDataOut2D [nWP-1:0]          ; // read data out              / 2D
  reg  [LVTW     -1:0] RDataOut3D [nWP-1:0][nRP -1:0]; // read data out              / 3D
  reg  [ADRW*LVTW-1:0] RAddrFB2D  [nWP-1:0]          ; // read address fb            / 2D
  reg  [ADRW     -1:0] RAddrFB3D  [nWP-1:0][LVTW-1:0]; // read address fb            / 3D
  wire [LVTW*LVTW-1:0] RDataFB2D  [nWP-1:0]          ; // read data fb               / 2D
  reg  [LVTW     -1:0] RDataFB3D  [nWP-1:0][LVTW-1:0]; // read data fb               / 3D
  reg  [LVTW     -1:0] WDataFB2D  [nWP-1:0]          ; // write data                 / 2D
  reg  [LVTW     -1:0] InvData2D  [nWP-1:0]          ; // write data                 / 2D
  reg  [nWP      -1:0] RBank2D    [nRP-1:0]          ; // read bank selector         / 2D
  `ARRINIT;
  always @* begin
    // packing/unpacking arrays into 1D/2D/3D structures; see utils.vh for definitions
    `ARR1D2D(nWP,       ADRW, WAddr     , WAddr2D   );
    `ARR1D2D(nWP,       ADRW, WAddr_r   , WAddr2D_r );
    `ARR2D1D(nRP, nWP       , RBank2D   , RBank     );
    `ARR2D3D(nWP, nRP , LVTW, RDataOut2D, RDataOut3D);
    `ARR3D2D(nWP, LVTW, ADRW, RAddrFB3D , RAddrFB2D );
    `ARR2D3D(nWP, LVTW, LVTW, RDataFB2D , RDataFB3D );
  end
  // generate and instantiate mulriread BRAMs
  genvar wpi;
  generate
    for (wpi=0 ; wpi<nWP ; wpi=wpi+1) begin: RPORTwpi
      // feedback multiread ram instantiation
      mrram    #( .MEMD  (MEMD            ),  // memory depth
                  .DATW  (LVTW            ),  // data width
                  .nRP   (nWP-1           ),  // number of reading ports
                  .BYPS  (WAWB||RDWB||RAWB),  // bypass? 0:none; 1:single-stage; 2:two-stages
                  .ZERO  (ZERO            ),  // binary / Initial RAM with zeros (has priority over FILE)
                  .FILE  (FILE            ))  // initialization file, optional
      mrram_fdb ( .clk   (clk             ),  // clock                                        - in
                  .WEnb  (WEnb_r[wpi]     ),  // write enable  (1 port)                       - in
                  .WAddr (WAddr2D_r[wpi]  ),  // write address (1 port)                       - in : [`log2(MEMD)    -1:0]
                  .WData (WDataFB2D[wpi]  ),  // write data (1 port)                          - in : [LVTW           -1:0]
                  .RAddr (RAddrFB2D[wpi]  ),  // read  addresses - packed from nRP read ports - in : [`log2(MEMD)*nRP-1:0]
                  .RData (RDataFB2D[wpi]  )); // read  data      - packed from nRP read ports - out: [LVTW       *nRP-1:0]
      // output multiread ram instantiation
      mrram    #( .MEMD  (MEMD           ),  // memory depth
                  .DATW  (LVTW           ),  // data width
                  .nRP   (nRP            ),  // number of reading ports
                  .BYPS  (RDWB ? 2 : RAWB),  // bypass? 0:none; 1:single-stage; 2:two-stages
                  .ZERO  (ZERO           ),  // binary / Initial RAM with zeros (has priority over FILE)
                  .FILE  (FILE           ))  // initialization file, optional
      mrram_out ( .clk   (clk            ),  // clock                                        - in
                  .WEnb  (WEnb_r[wpi]    ),  // write enable  (1 port)                       - in
                  .WAddr (WAddr2D_r[wpi] ),  // write address (1 port)                       - in : [`log2(MEMD)    -1:0]
                  .WData (WDataFB2D[wpi] ),  // write data (1 port)                          - in : [LVTW           -1:0]
                  .RAddr (RAddr          ),  // read  addresses - packed from nRP read ports - in : [`log2(MEMD)*nRP-1:0]
                  .RData (RDataOut2D[wpi])); // read  data      - packed from nRP read ports - out: [LVTW       *nRP-1:0]
    end
  endgenerate
  // combinatorial logic for output and feedback functions
  integer wp; // write port counter
  integer wf; // write feedback counter
  integer rf; // read  feedback counter
  integer rp; // read port counter
  integer lv; // lvt bit counter
  integer fi; // feedback bit index
  always @* begin
    // generate inversion vector
    for(wp=0;wp<nWP;wp=wp+1) InvData2D[wp] = (1<<wp)-1; // 2^wp-1
    // initialize output read bank
    for(rp=0;rp<nRP;rp=rp+1)
      for(wp=0;wp<nWP;wp=wp+1)
        RBank2D[rp][wp] = 1;
    // generate feedback functions
    for(wp=0;wp<nWP;wp=wp+1) begin
      wf = 0;
      for(lv=0;lv<LVTW;lv=lv+1) begin
        wf=wf+(lv==wp);
        rf=wp-(wf<wp);
        fi=wp-(InvData2D[wp][lv]);
        RAddrFB3D[wp][lv] = WAddr2D[wf];
        WDataFB2D[wp][lv] = RDataFB3D[wf][rf][fi] ^ InvData2D[wp][lv];
        for(rp=0;rp<nRP;rp=rp+1) RBank2D[rp][wp] = RBank2D[rp][wp] && (( RDataOut3D[wf][rp][fi] ^ InvData2D[wp][lv]) == RDataOut3D[wp][rp][lv]);
        wf=wf+1;
      end
    end
  end
endmodule