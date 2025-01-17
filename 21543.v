module mpram_xor
 #(  parameter MEMD = 16, // memory depth
     parameter DATW = 32, // data width
     parameter nRP  = 2 , // number of reading ports
     parameter nWP  = 2 , // number of writing ports
     parameter WAWB = 1 , // allow Write-After-Write (need to bypass feedback ram)
     parameter RAWB = 1 , // new data for Read-after-Write (need to bypass output ram)
     parameter RDWB = 0 , // new data for Read-During-Write
     parameter FILE = ""  // initialization file, optional
  )( input                            clk  ,  // clock
     input      [nWP-1:0            ] WEnb ,  // write enable for each writing port
     input      [`log2(MEMD)*nWP-1:0] WAddr,  // write addresses - packed from nWP write ports
     input      [DATW       *nWP-1:0] WData,  // write data      - packed from nWP read ports
     input      [`log2(MEMD)*nRP-1:0] RAddr,  // read  addresses - packed from nRP read  ports
     output reg [DATW       *nRP-1:0] RData); // read  data      - packed from nRP read ports
  localparam ADRW = `log2(MEMD); // address width
  // Register write addresses, data and enables
  reg [ADRW*nWP-1:0] WAddr_r; // registered write addresses - packed from nWP write ports
  reg [DATW*nWP-1:0] WData_r; // registered write data - packed from nWP read ports
  reg [     nWP-1:0] WEnb_r ; // registered write enable for each writing port
  always @(posedge clk) begin
    WAddr_r <= WAddr;
    WData_r <= WData;
    WEnb_r  <= WEnb ;
  end
  // unpacked/pack addresses/data
  reg  [ADRW        -1:0] WAddr2D    [nWP-1:0]             ; // write addresses            / 2D
  reg  [ADRW        -1:0] WAddr2D_r  [nWP-1:0]             ; // registered write addresses / 2D
  reg  [DATW        -1:0] WData2D    [nWP-1:0]             ; // write data                 / 2D
  reg  [DATW        -1:0] WData2D_r  [nWP-1:0]             ; // registered write data      / 2D
  wire [DATW* nRP   -1:0] RDataOut2D [nWP-1:0]             ; // read data out              / 2D
  reg  [DATW        -1:0] RDataOut3D [nWP-1:0][nRP-1:0]; // read data out              / 3D
  reg  [ADRW*(nWP-1)-1:0] RAddrFB2D  [nWP-1:0]             ; // read address fb            / 2D
  reg  [ADRW        -1:0] RAddrFB3D  [nWP-1:0][nWP-2:0]; // read address fb            / 3D
  wire [DATW*(nWP-1)-1:0] RDataFB2D  [nWP-1:0]             ; // read data fb               / 2D
  reg  [DATW        -1:0] RDataFB3D  [nWP-1:0][nWP-2:0]; // read data fb               / 3D
  reg  [DATW        -1:0] WDataFB2D  [nWP-1:0]             ; // write data                 / 2D
  reg  [DATW        -1:0] RData2D    [nRP-1:0]             ; // read data                  / 2D
  `ARRINIT;
  always  @* begin
    // packing/unpacking arrays into 1D/2D/3D structures; see utils.vh for definitions
    `ARR1D2D(nWP,      ADRW,WAddr     ,WAddr2D   );
    `ARR1D2D(nWP,      ADRW,WAddr_r   ,WAddr2D_r );
    `ARR1D2D(nWP,      DATW,WData     ,WData2D   );
    `ARR1D2D(nWP,      DATW,WData_r   ,WData2D_r );
    `ARR2D1D(nRP,      DATW,RData2D   ,RData     );
    `ARR2D3D(nWP,nRP  ,DATW,RDataOut2D,RDataOut3D);
    `ARR3D2D(nWP,nWP-1,ADRW,RAddrFB3D ,RAddrFB2D );
    `ARR2D3D(nWP,nWP-1,DATW,RDataFB2D ,RDataFB3D );
  end
  // generate and instantiate mulriread RAM blocks
  genvar wpi;
  generate
    for (wpi=0 ; wpi<nWP ; wpi=wpi+1) begin: RPORTwpi
      // feedback multiread ram instantiation
      mrram    #( .MEMD  (MEMD                ),  // memory depth
                  .DATW  (DATW                ),  // data width
                  .nRP   (nWP-1               ),  // number of reading ports
                  .BYPS  (WAWB || RDWB || RAWB),  // bypass? 0:none; 1:single-stage; 2:two-stages
                  .ZERO  ((wpi>0)&&(FILE!="") ),  // binary / Initial RAM with zeros (has priority over FILE)
                  .FILE  (FILE                ))  // initialization file, optional
      mrram_fdb ( .clk   (clk                 ),  // clock                                            - in
                  .WEnb  (WEnb_r[wpi]         ),  // write enable  (1 port)                           - in
                  .WAddr (WAddr2D_r[wpi]      ),  // write address (1 port)                           - in : [`log2(MEMD)        -1:0]
                  .WData (WDataFB2D[wpi]      ),  // write data    (1 port)                           - in : [DATW              -1:0]
                  .RAddr (RAddrFB2D[wpi]      ),  // read  addresses - packed from nRP read ports - in : [`log2(MEMD)*nRP-1:0]
                  .RData (RDataFB2D[wpi]      )); // read  data      - packed from nRP read ports - out: [DATW      *nRP-1:0]
      // output multiread ram instantiation
      mrram    #( .MEMD  (MEMD                ),  // memory depth
                  .DATW  (DATW                ),  // data width
                  .nRP   (nRP                 ),  // number of reading ports
                  .BYPS  (RDWB ? 2 : RAWB     ),  // bypass? 0:none; 1:single-stage; 2:two-stages
                  .ZERO  ((wpi>0)&&(FILE!="") ),  // binary / Initial RAM with zeros (has priority over FILE)
                  .FILE  (FILE                ))  // initialization file, optional
      mrram_out ( .clk   (clk                 ),  // clock                                        - in
                  .WEnb  (WEnb_r[wpi]         ),  // write enable  (1 port)                       - in
                  .WAddr (WAddr2D_r[wpi]      ),  // write address (1 port)                       - in : [`log2(MEMD)    -1:0]
                  .WData (WDataFB2D[wpi]      ),  // write data    (1 port)                       - in : [DATW           -1:0]
                  .RAddr (RAddr               ),  // read  addresses - packed from nRP read ports - in : [`log2(MEMD)*nRP-1:0]
                  .RData (RDataOut2D[wpi]     )); // read  data      - packed from nRP read ports - out: [DATW       *nRP-1:0]
    end
  endgenerate
  // combinatorial logic for output and feedback functions
  integer i,j,k;
  always @* begin
    // generate output read functions
    for(i=0;i<nRP;i=i+1) begin
      RData2D[i] = RDataOut3D[0][i];
      for(j=1;j<nWP;j=j+1) RData2D[i] = RData2D[i] ^ RDataOut3D[j][i];
    end
    // generate feedback functions
    for(i=0;i<nWP;i=i+1) WDataFB2D[i] = WData2D_r[i];
    for(i=0;i<nWP;i=i+1) begin
      k = 0;
      for(j=0;j<nWP-1;j=j+1) begin
        k=k+(j==i);
        RAddrFB3D[i][j] = WAddr2D[k];
        WDataFB2D[k] = WDataFB2D[k] ^ RDataFB3D[i][j];
        k=k+1;
      end
    end
  end
endmodule