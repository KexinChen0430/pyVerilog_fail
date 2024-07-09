module pcie3_7x_0_pcie_bram_7vx_cpl #(
  parameter IMPL_TARGET = "HARD",         // the implementation target, HARD or SOFT
  parameter NO_DECODE_LOGIC = "TRUE",     // No decode logic, TRUE or FALSE
  parameter INTERFACE_SPEED = "500 MHZ",  // the memory interface speed, 500 MHz or 250 MHz.
  parameter COMPLETION_SPACE = "16 KB"    // the completion FIFO spec, 8KB or 16KB
) (
  input               clk_i,     // user clock
  input               reset_i,   // bram reset
  input    [9:0]      waddr0_i,  // write address
  input    [9:0]      waddr1_i,  // write address
  input    [9:0]      waddr2_i,  // write address
  input    [9:0]      waddr3_i,  // write address
  input  [127:0]      wdata_i,   // write data
  input   [15:0]      wdip_i,    // write parity
  input               wen0_i,    // write enable Bank0
  input               wen1_i,    // write enable Bank1
  input               wen2_i,    // write enable Bank2
  input               wen3_i,    // write enable Bank3
  input               wen4_i,    // write enable Bank4
  input               wen5_i,    // write enable Bank5
  input               wen6_i,    // write enable Bank6
  input               wen7_i,    // write enable Bank7
  input    [9:0]      raddr0_i,  // write address
  input    [9:0]      raddr1_i,  // write address
  input    [9:0]      raddr2_i,  // write address
  input    [9:0]      raddr3_i,  // write address
  output [127:0]      rdata_o,   // read data
  output  [15:0]      rdop_o,    // read parity
  input               ren0_i,    // read enable Bank0
  input               ren1_i,    // read enable Bank1
  input               ren2_i,    // read enable Bank2
  input               ren3_i,    // read enable Bank3
  input               ren4_i,    // read enable Bank4
  input               ren5_i,    // read enable Bank5
  input               ren6_i,    // read enable Bank6
  input               ren7_i     // read enable Bank7
);
  generate begin
  if (COMPLETION_SPACE == "16KB") begin : CPL_FIFO_16KB
    pcie3_7x_0_pcie_bram_7vx_16k # (
      .IMPL_TARGET(IMPL_TARGET),
      .NO_DECODE_LOGIC(NO_DECODE_LOGIC),
      .INTERFACE_SPEED(INTERFACE_SPEED),
      .COMPLETION_SPACE(COMPLETION_SPACE)
    )
    U0
    (
      .clk_i              (clk_i),
      .reset_i            (reset_i),
      .waddr0_i           (waddr0_i[9:0]),
      .waddr1_i           (waddr1_i[9:0]),
      .waddr2_i           (waddr2_i[9:0]),
      .waddr3_i           (waddr3_i[9:0]),
      .wdata_i            (wdata_i[127:0]),
      .wdip_i             (wdip_i[15:0]),
      .wen_i              ({wen7_i, wen6_i, wen5_i, wen4_i, wen3_i, wen2_i, wen1_i, wen0_i}),
      .raddr0_i           (raddr0_i[9:0]),
      .raddr1_i           (raddr1_i[9:0]),
      .raddr2_i           (raddr2_i[9:0]),
      .raddr3_i           (raddr3_i[9:0]),
      .rdata_o            (rdata_o[127:0]),
      .rdop_o             (rdop_o[15:0]),
      .ren_i              ({ren7_i, ren6_i, ren5_i, ren4_i, ren3_i, ren2_i, ren1_i, ren0_i})
    );
  end else begin : CPL_FIFO_8KB
    pcie3_7x_0_pcie_bram_7vx_8k # (
      .IMPL_TARGET(IMPL_TARGET),
      .INTERFACE_SPEED(INTERFACE_SPEED),
      .COMPLETION_SPACE(COMPLETION_SPACE)
    )
    U0
    (
      .clk_i              (clk_i),
      .reset_i            (reset_i),
      .waddr0_i           (waddr0_i[8:0]),
      .waddr1_i           (waddr1_i[8:0]),
      .wdata_i            (wdata_i[127:0]),
      .wdip_i             (wdip_i[15:0]),
      .wen_i              ({wen3_i, wen2_i, wen1_i, wen0_i}),
      .raddr0_i           (raddr0_i[8:0]),
      .raddr1_i           (raddr1_i[8:0]),
      .rdata_o            (rdata_o[127:0]),
      .rdop_o             (rdop_o[15:0]),
      .ren_i              ({ren3_i, ren2_i, ren1_i, ren0_i})
    );
    end
    end
  endgenerate
endmodule