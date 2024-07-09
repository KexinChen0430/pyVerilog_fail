module lvt_reg
 #(  parameter MEMD = 16, // memory depth
     parameter nRP  = 2 , // number of reading ports
     parameter nWP  = 2 , // number of writing ports
     parameter RDWB = 0 , // new data for Read-During-Write
     parameter ZERO = 0 , // binary / Initial RAM with zeros (has priority over FILE)
     parameter FILE = ""  // initialization file, optional
  )( input                        clk  ,  // clock
     input  [            nWP-1:0] WEnb ,  // write enable for each writing port
     input  [`log2(MEMD)*nWP-1:0] WAddr,  // write addresses    - packed from nWP write ports
     input  [`log2(MEMD)*nRP-1:0] RAddr,  // read  addresses    - packed from nRP read  ports
     output [`log2(nWP )*nRP-1:0] RBank); // read bank selector - packed from nRP read  ports
  localparam ADRW = `log2(MEMD); // address width
  localparam LVTW = `log2(nWP ); // required memory width
  // Generate Bank ID's to write into LVT
  reg  [LVTW*nWP-1:0] WData1D          ;
  wire [LVTW    -1:0] WData2D [nWP-1:0];
  genvar gi;
  generate
    for (gi=0;gi<nWP;gi=gi+1) begin: GenerateID
      assign  WData2D[gi]=gi;
    end
  endgenerate
  // packing/unpacking arrays into 1D/2D/3D structures; see utils.vh for definitions
  // pack ID's into 1D array
  `ARRINIT;
  always @* `ARR2D1D(nWP,LVTW,WData2D,WData1D);
  mpram_reg    #( .MEMD  (MEMD   ),  // memory depth
                  .DATW  (LVTW   ),  // data width
                  .nRP   (nRP    ),  // number of reading ports
                  .nWP   (nWP    ),  // number of writing ports
                  .RDWB  (RDWB   ),  // provide new data when Read-During-Write?
                  .ZERO  (ZERO   ),  // binary / Initial RAM with zeros (has priority over FILE)
                  .FILE  (FILE   ))  // initialization file, optional
  mpram_reg_ins ( .clk   (clk    ),  // clock                                         - in
                  .WEnb  (WEnb   ),  // write enable for each writing port            - in : [     nWP-1:0]
                  .WAddr (WAddr  ),  // write addresses - packed from nWP write ports - in : [ADRW*nWP-1:0]
                  .WData (WData1D),  // write data      - packed from nRP read  ports - in : [LVTW*nWP-1:0]
                  .RAddr (RAddr  ),  // read  addresses - packed from nRP read  ports - in : [ADRW*nRP-1:0]
                  .RData (RBank  )); // read  data      - packed from nRP read  ports - out: [LVTW*nRP-1:0]
endmodule