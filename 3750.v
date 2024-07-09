module axi_interconnect #(
  parameter           ADDR_WIDTH            = 32,
  parameter           DATA_WIDTH            = 32
)(
  //control signals
  input               clk,
  input               rst,
  //bus write addr path
  output      [3:0]                 i_awid,         //Write ID
  output      [ADDR_WIDTH - 1:0]    i_awaddr,       //Write Addr Path Address
  output      [3:0]                 i_awlen,        //Write Addr Path Burst Length
  output      [2:0]                 i_awsize,       //Write Addr Path Burst Size
  output      [1:0]                 i_awburst,      //Write Addr Path Burst Type
                                                        //  0 = Fixed
                                                        //  1 = Incrementing
                                                        //  2 = wrap
  output      [1:0]                 i_awlock,       //Write Addr Path Lock (atomic) information
                                                        //  0 = Normal
                                                        //  1 = Exclusive
                                                        //  2 = Locked
  output      [3:0]                 i_awcache,      //Write Addr Path Cache Type
  output      [2:0]                 i_awprot,       //Write Addr Path Protection Type
  output                            i_awvalid,      //Write Addr Path Address Valid
  input                             o_awready,      //Write Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready
    //bus write data
  output  reg [3:0]                 i_wid,          //Write ID
  output  reg [DATA_WIDTH - 1: 0]   i_wdata,        //Write Data (this size is set with the DATA_WIDTH Parameter
                                                      //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
  output  reg [DATA_WIDTH >> 3:0]   i_wstrobe,      //Write Strobe (a 1 in the write is associated with the byte to write)
  output  reg                       i_wlast,        //Write Last transfer in a write burst
  output  reg                       i_wvalid,       //Data through this bus is valid
  input                             o_wready,       //Slave is ready for data
    //Write Response Channel
  input       [3:0]                 o_bid,          //Response ID (this must match awid)
  input       [1:0]                 o_bresp,        //Write Response
                                                        //  0 = OKAY
                                                        //  1 = EXOKAY
                                                        //  2 = SLVERR
                                                        //  3 = DECERR
  input                             o_bvalid,       //Write Response is:
                                                        //  1 = Available
                                                        //  0 = Not Available
  output  reg                       i_bready,       //WBM Ready
    //bus read addr path
  output  reg  [3:0]                i_arid,         //Read ID
  output       [ADDR_WIDTH - 1:0]   i_araddr,       //Read Addr Path Address
  output  reg  [3:0]                i_arlen,        //Read Addr Path Burst Length
  output  reg  [2:0]                i_arsize,       //Read Addr Path Burst Size
  output       [1:0]                i_arburst,      //Read Addr Path Burst Type
  output       [1:0]                i_arlock,       //Read Addr Path Lock (atomic) information
  output       [3:0]                i_arcache,      //Read Addr Path Cache Type
  output       [2:0]                i_arprot,       //Read Addr Path Protection Type
  output  reg                       i_arvalid,      //Read Addr Path Address Valid
  input                             o_arready,      //Read Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready
    //bus read data
  input       [3:0]                 o_rid,          //Write ID
  input       [DATA_WIDTH - 1: 0]   o_rdata,        //Write Data (this size is set with the DATA_WIDTH Parameter
                                                    //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
  input       [DATA_WIDTH >> 3:0]   o_rstrobe,      //Write Strobe (a 1 in the write is associated with the byte to write)
  input                             o_rlast,        //Write Last transfer in a write burst
  input                             o_rvalid,       //Data through this bus is valid
  output  reg                       i_rready,       //WBM is ready for data
                                                        //  1 = WBM Ready
                                                        //  0 = Slave Ready
${PORTS}
);
${ADDRESSES}
localparam ADDR_NO_SEL = ((1 << ADDR_WIDTH) - 1);
//state
//axi slave signals
//this should be parameterized
wire [3:0]slave_select;
assign slave_select =   i_m_adr[31:24];
${DATA}
${ACK}
${ASSIGN}
endmodule