module top(input clk, output D1, output D2, output D3, output D4, output D5,
           output TXD,        // UART TX
           input RXD,         // UART RX
           output PIOS_00,    // flash SCK
           input PIOS_01,     // flash MISO
           output PIOS_02,    // flash MOSI
           output PIOS_03,    // flash CS
           inout PIO1_02,    // PMOD 1
           inout PIO1_03,    // PMOD 2
           inout PIO1_04,    // PMOD 3
           inout PIO1_05,    // PMOD 4
           inout PIO1_06,    // PMOD 5
           inout PIO1_07,    // PMOD 6
           inout PIO1_08,    // PMOD 7
           inout PIO1_09,    // PMOD 8
           output PIO1_18,    // IR TXD
           input  PIO1_19,    // IR RXD
           output PIO1_20,    // IR SD
           input resetq,
);
  localparam MHZ = 12;
  wire io_rd, io_wr;
  wire [15:0] mem_addr;
  wire mem_wr;
  wire [15:0] dout;
  wire [15:0] io_din;
  wire [12:0] code_addr;
  reg unlocked = 0;
`include "../build/ram.v"
  j1 _j1(
    .clk(clk),
    .resetq(resetq),
    .io_rd(io_rd),
    .io_wr(io_wr),
    .mem_wr(mem_wr),
    .dout(dout),
    .io_din(io_din),
    .mem_addr(mem_addr),
    .code_addr(code_addr),
    .insn(insn));
  /*
  // ######   TICKS   #########################################
  reg [15:0] ticks;
  always @(posedge clk)
    ticks <= ticks + 16'd1;
  */
  // ######   IO SIGNALS   ####################################
  reg io_wr_, io_rd_;
  reg [15:0] dout_;
  reg [15:0] io_addr_;
  always @(posedge clk) begin
    {io_rd_, io_wr_, dout_} <= {io_rd, io_wr, dout};
    if (io_rd | io_wr)
      io_addr_ <= mem_addr;
  end
  // ######   PMOD   ##########################################
  reg [7:0] pmod_dir;   // 1:output, 0:input
  reg [7:0] pmod_out;
  wire [7:0] pmod_in;
  SB_IO #(.PIN_TYPE(6'b1010_01)) io0 (.PACKAGE_PIN(PIO1_02), .D_OUT_0(pmod_out[0]), .D_IN_0(pmod_in[0]), .OUTPUT_ENABLE(pmod_dir[0]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io1 (.PACKAGE_PIN(PIO1_03), .D_OUT_0(pmod_out[1]), .D_IN_0(pmod_in[1]), .OUTPUT_ENABLE(pmod_dir[1]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io2 (.PACKAGE_PIN(PIO1_04), .D_OUT_0(pmod_out[2]), .D_IN_0(pmod_in[2]), .OUTPUT_ENABLE(pmod_dir[2]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io3 (.PACKAGE_PIN(PIO1_05), .D_OUT_0(pmod_out[3]), .D_IN_0(pmod_in[3]), .OUTPUT_ENABLE(pmod_dir[3]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io4 (.PACKAGE_PIN(PIO1_06), .D_OUT_0(pmod_out[4]), .D_IN_0(pmod_in[4]), .OUTPUT_ENABLE(pmod_dir[4]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io5 (.PACKAGE_PIN(PIO1_07), .D_OUT_0(pmod_out[5]), .D_IN_0(pmod_in[5]), .OUTPUT_ENABLE(pmod_dir[5]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io6 (.PACKAGE_PIN(PIO1_08), .D_OUT_0(pmod_out[6]), .D_IN_0(pmod_in[6]), .OUTPUT_ENABLE(pmod_dir[6]));
  SB_IO #(.PIN_TYPE(6'b1010_01)) io7 (.PACKAGE_PIN(PIO1_09), .D_OUT_0(pmod_out[7]), .D_IN_0(pmod_in[7]), .OUTPUT_ENABLE(pmod_dir[7]));
  // ######   UART   ##########################################
  wire uart0_valid, uart0_busy;
  wire [7:0] uart0_data;
  wire uart0_wr = io_wr_ & io_addr_[12];
  wire uart0_rd = io_rd_ & io_addr_[12];
  reg [31:0] uart_baud = 115200;
  wire UART0_RX;
  buart #(.CLKFREQ(MHZ * 1000000)) _uart0 (
     .clk(clk),
     .resetq(1'b1),
     .baud(uart_baud),
     .rx(RXD),
     .tx(TXD),
     .rd(uart0_rd),
     .wr(uart0_wr),
     .valid(uart0_valid),
     .busy(uart0_busy),
     .tx_data(dout_[7:0]),
     .rx_data(uart0_data));
  reg [4:0] PIOS;
  assign {PIO1_20, PIO1_18, PIOS_00, PIOS_02, PIOS_03} = PIOS;
  reg [4:0] LEDS;
  assign {D1,D2,D3,D4,D5} = LEDS;
  // ######   IO PORTS   ######################################
  /*        bit READ            WRITE
      0001  0   PMOD rd         PMOD wr
      0002  1                   PMOD direction
      0004  2                   LEDS
      0008  3                   misc.out
      1000  12  UART RX         UART TX
      2000  13  misc.in
  */
  assign io_din =
    (io_addr_[ 0] ? {8'd0, pmod_in}                                    : 16'd0) |
    (io_addr_[ 1] ? {8'd0, pmod_dir}                                    : 16'd0) |
    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |
    (io_addr_[13] ? {12'd0, PIO1_19, PIOS_01, uart0_valid, !uart0_busy} : 16'd0);
  always @(posedge clk) begin
    if (io_wr_ & io_addr_[0])
      pmod_out <= dout_[7:0];
    if (io_wr_ & io_addr_[1])
      pmod_dir <= dout_[7:0];
    if (io_wr_ & io_addr_[2])
      LEDS <= dout_[4:0];
    if (io_wr_ & io_addr_[3])
      PIOS <= dout_[4:0];
  end
  /*
  SB_IO #(
    .PIN_TYPE(6'b011001)
  ) io0 (
	.PACKAGE_PIN(PIO1_02));
  */
  always @(negedge resetq or posedge clk)
    if (!resetq)
      unlocked <= 0;
    else
      unlocked <= unlocked | io_wr_;
endmodule