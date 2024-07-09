module gcd_block_design_gcd_0_1 (
  s_axi_gcd_bus_AWADDR,
  s_axi_gcd_bus_AWVALID,
  s_axi_gcd_bus_AWREADY,
  s_axi_gcd_bus_WDATA,
  s_axi_gcd_bus_WSTRB,
  s_axi_gcd_bus_WVALID,
  s_axi_gcd_bus_WREADY,
  s_axi_gcd_bus_BRESP,
  s_axi_gcd_bus_BVALID,
  s_axi_gcd_bus_BREADY,
  s_axi_gcd_bus_ARADDR,
  s_axi_gcd_bus_ARVALID,
  s_axi_gcd_bus_ARREADY,
  s_axi_gcd_bus_RDATA,
  s_axi_gcd_bus_RRESP,
  s_axi_gcd_bus_RVALID,
  s_axi_gcd_bus_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt
);
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWADDR" *)
input wire [5 : 0] s_axi_gcd_bus_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWVALID" *)
input wire s_axi_gcd_bus_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWREADY" *)
output wire s_axi_gcd_bus_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WDATA" *)
input wire [31 : 0] s_axi_gcd_bus_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WSTRB" *)
input wire [3 : 0] s_axi_gcd_bus_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WVALID" *)
input wire s_axi_gcd_bus_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WREADY" *)
output wire s_axi_gcd_bus_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BRESP" *)
output wire [1 : 0] s_axi_gcd_bus_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BVALID" *)
output wire s_axi_gcd_bus_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BREADY" *)
input wire s_axi_gcd_bus_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARADDR" *)
input wire [5 : 0] s_axi_gcd_bus_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARVALID" *)
input wire s_axi_gcd_bus_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARREADY" *)
output wire s_axi_gcd_bus_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RDATA" *)
output wire [31 : 0] s_axi_gcd_bus_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RRESP" *)
output wire [1 : 0] s_axi_gcd_bus_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RVALID" *)
output wire s_axi_gcd_bus_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_gcd_bus, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, \
ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN gcd_block_design_processing_system7_0_2_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RREADY" *)
input wire s_axi_gcd_bus_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_gcd_bus, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN \
gcd_block_design_processing_system7_0_2_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
  gcd #(
    .C_S_AXI_GCD_BUS_ADDR_WIDTH(6),
    .C_S_AXI_GCD_BUS_DATA_WIDTH(32)
  ) inst (
    .s_axi_gcd_bus_AWADDR(s_axi_gcd_bus_AWADDR),
    .s_axi_gcd_bus_AWVALID(s_axi_gcd_bus_AWVALID),
    .s_axi_gcd_bus_AWREADY(s_axi_gcd_bus_AWREADY),
    .s_axi_gcd_bus_WDATA(s_axi_gcd_bus_WDATA),
    .s_axi_gcd_bus_WSTRB(s_axi_gcd_bus_WSTRB),
    .s_axi_gcd_bus_WVALID(s_axi_gcd_bus_WVALID),
    .s_axi_gcd_bus_WREADY(s_axi_gcd_bus_WREADY),
    .s_axi_gcd_bus_BRESP(s_axi_gcd_bus_BRESP),
    .s_axi_gcd_bus_BVALID(s_axi_gcd_bus_BVALID),
    .s_axi_gcd_bus_BREADY(s_axi_gcd_bus_BREADY),
    .s_axi_gcd_bus_ARADDR(s_axi_gcd_bus_ARADDR),
    .s_axi_gcd_bus_ARVALID(s_axi_gcd_bus_ARVALID),
    .s_axi_gcd_bus_ARREADY(s_axi_gcd_bus_ARREADY),
    .s_axi_gcd_bus_RDATA(s_axi_gcd_bus_RDATA),
    .s_axi_gcd_bus_RRESP(s_axi_gcd_bus_RRESP),
    .s_axi_gcd_bus_RVALID(s_axi_gcd_bus_RVALID),
    .s_axi_gcd_bus_RREADY(s_axi_gcd_bus_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt)
  );
endmodule