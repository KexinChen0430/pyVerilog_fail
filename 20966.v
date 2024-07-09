module design_1_pointer_basic_0_1 (
  s_axi_pointer_basic_io_AWADDR,
  s_axi_pointer_basic_io_AWVALID,
  s_axi_pointer_basic_io_AWREADY,
  s_axi_pointer_basic_io_WDATA,
  s_axi_pointer_basic_io_WSTRB,
  s_axi_pointer_basic_io_WVALID,
  s_axi_pointer_basic_io_WREADY,
  s_axi_pointer_basic_io_BRESP,
  s_axi_pointer_basic_io_BVALID,
  s_axi_pointer_basic_io_BREADY,
  s_axi_pointer_basic_io_ARADDR,
  s_axi_pointer_basic_io_ARVALID,
  s_axi_pointer_basic_io_ARREADY,
  s_axi_pointer_basic_io_RDATA,
  s_axi_pointer_basic_io_RRESP,
  s_axi_pointer_basic_io_RVALID,
  s_axi_pointer_basic_io_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt
);
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWADDR" *)
input wire [4 : 0] s_axi_pointer_basic_io_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWVALID" *)
input wire s_axi_pointer_basic_io_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWREADY" *)
output wire s_axi_pointer_basic_io_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WDATA" *)
input wire [31 : 0] s_axi_pointer_basic_io_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WSTRB" *)
input wire [3 : 0] s_axi_pointer_basic_io_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WVALID" *)
input wire s_axi_pointer_basic_io_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WREADY" *)
output wire s_axi_pointer_basic_io_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BRESP" *)
output wire [1 : 0] s_axi_pointer_basic_io_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BVALID" *)
output wire s_axi_pointer_basic_io_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BREADY" *)
input wire s_axi_pointer_basic_io_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARADDR" *)
input wire [4 : 0] s_axi_pointer_basic_io_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARVALID" *)
input wire s_axi_pointer_basic_io_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARREADY" *)
output wire s_axi_pointer_basic_io_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RDATA" *)
output wire [31 : 0] s_axi_pointer_basic_io_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RRESP" *)
output wire [1 : 0] s_axi_pointer_basic_io_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RVALID" *)
output wire s_axi_pointer_basic_io_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_pointer_basic_io, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50\
000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_2_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RREADY" *)
input wire s_axi_pointer_basic_io_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_pointer_basic_io, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50000000, PHASE 0.000, CLK\
_DOMAIN design_1_processing_system7_0_2_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
  pointer_basic #(
    .C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH(5),
    .C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH(32)
  ) inst (
    .s_axi_pointer_basic_io_AWADDR(s_axi_pointer_basic_io_AWADDR),
    .s_axi_pointer_basic_io_AWVALID(s_axi_pointer_basic_io_AWVALID),
    .s_axi_pointer_basic_io_AWREADY(s_axi_pointer_basic_io_AWREADY),
    .s_axi_pointer_basic_io_WDATA(s_axi_pointer_basic_io_WDATA),
    .s_axi_pointer_basic_io_WSTRB(s_axi_pointer_basic_io_WSTRB),
    .s_axi_pointer_basic_io_WVALID(s_axi_pointer_basic_io_WVALID),
    .s_axi_pointer_basic_io_WREADY(s_axi_pointer_basic_io_WREADY),
    .s_axi_pointer_basic_io_BRESP(s_axi_pointer_basic_io_BRESP),
    .s_axi_pointer_basic_io_BVALID(s_axi_pointer_basic_io_BVALID),
    .s_axi_pointer_basic_io_BREADY(s_axi_pointer_basic_io_BREADY),
    .s_axi_pointer_basic_io_ARADDR(s_axi_pointer_basic_io_ARADDR),
    .s_axi_pointer_basic_io_ARVALID(s_axi_pointer_basic_io_ARVALID),
    .s_axi_pointer_basic_io_ARREADY(s_axi_pointer_basic_io_ARREADY),
    .s_axi_pointer_basic_io_RDATA(s_axi_pointer_basic_io_RDATA),
    .s_axi_pointer_basic_io_RRESP(s_axi_pointer_basic_io_RRESP),
    .s_axi_pointer_basic_io_RVALID(s_axi_pointer_basic_io_RVALID),
    .s_axi_pointer_basic_io_RREADY(s_axi_pointer_basic_io_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt)
  );
endmodule