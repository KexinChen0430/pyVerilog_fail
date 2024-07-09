module ACC0 (
    input wire clk,
    input wire next,
    input wire prev,
    output wire d0,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4,
    output wire d5,
    output wire d6,
    output wire d7
);
parameter ROMFILE = "rom.list";
localparam AW = 12;     //-- Address bus
localparam DW = 16;     //-- Data bus
localparam BOOT_ADDR = 12'h800;
wire [DW-1: 0] rom_dout;
genrom #(
        .ROMFILE(ROMFILE),
        .AW(AW-1),
        .DW(DW))
  ROM (
        .clk(clk),
        .cs(S[AW-1]),         //-- Bit A11 for the chip select
        .addr(S[AW-2:0]),     //-- Bits A10 - A0 for addressing the Rom (2K)
        .data_out(rom_dout)
      );
wire next_p;   //-- Next input with pull-up activated
wire clk_in;
wire prev_p;  //-- Prev input with pull-up activated
wire sw2;
wire sw1;
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(next),
   .D_IN_0(next_p)
);
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(prev),
   .D_IN_0(prev_p)
);
assign sw2 = ~prev_p;
assign sw1 = ~next_p;
wire sw1_deb;
wire sw2_deb;
debounce_pulse deb1 (
  .clk(clk),
  .sw_in(sw1),
  .sw_out(sw1_deb)
  );
debounce_pulse deb2 (
    .clk(clk),
    .sw_in(sw2),
    .sw_out(sw2_deb)
    );
assign clk_in = sw1_deb;
reg  [AW-1: 0] S = BOOT_ADDR;
always @(posedge clk) begin
    if (sw1_deb)
      S <= S + 1;
    else
      if (sw2_deb)
        S <= S - 1;
end
reg [14:0] G = 15'b0;
reg WG = 1;
always @(posedge clk)
  if (WG)
    G <= rom_dout[14:0];
assign {d6,d5,d4,d3,d2,d1,d0} = G[14:8];
assign d7 = 1'b0;
endmodule