module mrram_swt
 #(  parameter MEMD = 16, // memory depth
     parameter DATW = 32, // data width
     parameter nRPF = 2 , // number of fixed    read ports
     parameter nRPS = 2 , // number of switched read ports
     parameter BYPS = 1 , // bypass? 0:none; 1: single-stage; 2:two-stages
     parameter ZERO = 0 , // binary / Initial RAM with zeros (has priority over FILE)
     parameter FILE = ""  // initialization mif file (don't pass extension), optional
  )( input                                    clk  ,  // clock
     input                                    rdWr ,  // switch read/write (write is active low)
     input                                    WEnb ,  // write enable  (1 port)
     input      [`log2(MEMD)            -1:0] WAddr,  // write address (1 port)
     input      [DATW                   -1:0] WData,  // write data    (1 port)
     input      [`log2(MEMD)*(nRPS+nRPF)-1:0] RAddr,  // read  addresses - packed from nRPF fixed & nRPS switched read ports
     output reg [DATW       *(nRPS+nRPF)-1:0] RData); // read  data      - packed from nRPF fixed & nRPS switched read ports
  localparam nRPT = nRPS+nRPF  ; // total number of read ports
  localparam ADRW = `log2(MEMD); // address width
  // unpacked read addresses/data
  reg  [ADRW-1:0] RAddr_upk [nRPT-1:0]; // read addresses - unpacked 2D array
  wire [DATW-1:0] RData_upk [nRPT-1:0]; // read data      - unpacked 2D array
  // unpack read addresses; pack read data
  `ARRINIT;
  always @* begin
    // packing/unpacking arrays into 1D/2D/3D structures; see utils.vh for definitions
    `ARR1D2D(nRPT,ADRW,RAddr,RAddr_upk);
    `ARR2D1D(nRPT,DATW,RData_upk,RData);
  end
  // generate and instantiate generic RAM blocks
  genvar rpi;
  generate
    for (rpi=0 ; rpi<nRPF ; rpi=rpi+1) begin: RPORTrpi
      // generic dual-ported ram instantiation
      if (rpi<(nRPF-nRPS)) begin
        dpram_bbs #( .MEMD    (MEMD           ),  // memory depth
                     .DATW    (DATW           ),  // data width
                     .BYPS    (BYPS           ),  // bypass? 0: none; 1: single-stage; 2:two-stages
                     .ZERO    (ZERO           ),  // binary / Initial RAM with zeros (has priority over INITFILE)
                     .FILE    (FILE           ))  // initialization file, optional
        dpram_bbsi ( .clk     (clk            ),  // clock         - in
                     .WEnb_A  (1'b0           ),  // write enable  - in
                     .WEnb_B  (WEnb && (!rdWr)),  // write enable  - in
                     .Addr_A  (RAddr_upk[rpi] ),  // write address - in : [`log2(MEMD)-1:0]
                     .Addr_B  (WAddr          ),  // write address - in : [`log2(MEMD)-1:0]
                     .WData_A ({DATW{1'b1}}   ),  // change to 1'b0
                     .WData_B (WData          ),  // write data    - in : [DATW       -1:0]
                     .RData_A (RData_upk[rpi] ),  // read  data    - out: [DATW       -1:0]
                     .RData_B (               )); // read  data    - out: [DATW       -1:0]
      end
      else begin
        dpram_bbs #( .MEMD    (MEMD                          ),  // memory depth
                     .DATW    (DATW                          ),  // data width
                     .BYPS    (BYPS                          ),  // bypass? 0: none; 1: single-stage; 2:two-stages
                     .ZERO    (ZERO                          ),  // binary / Initial RAM with zeros (has priority over INITFILE)
                     .FILE    (FILE                          ))  // initialization file, optional
        dpram_bbsi ( .clk     (clk                           ),  // clock         - in
                     .WEnb_A  (1'b0                          ),  // write enable  - in
                     .WEnb_B  (WEnb && (!rdWr)               ),  // write enable  - in
                     .Addr_A  (    RAddr_upk[rpi]            ),  // write address - in : [`log2(MEMD)-1:0]
                     .Addr_B  (rdWr?RAddr_upk[rpi+nRPS]:WAddr),  // write address - in : [`log2(MEMD)-1:0]
                     .WData_A ({DATW{1'b1}}                  ),  // change to 1'b0
                     .WData_B (WData                         ),  // write data    - in : [DATW       -1:0]
                     .RData_A (RData_upk[rpi]                ),  // read  data    - out: [DATW       -1:0]
                     .RData_B (RData_upk[rpi+nRPS]           )); // read  data    - out: [DATW       -1:0]
      end
    end
  endgenerate
endmodule