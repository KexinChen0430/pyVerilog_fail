module ACC1 (
    input wire clk,       //-- System clock
    input wire next,      //-- Process next instruction/data
    input wire selmode,   //-- Toggle Mode: Manual / automatic
    output wire d0,       //-- Output leds
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4,
    output wire d5,
    output wire d6,
    output wire d7
);
localparam MANUAL_MODE = 1'b1;
localparam AUTOMATIC_MODE = 1'b0;
localparam SLOW = 24;    //--  1.4 secs
localparam MEDIUM = 22;  //--  350 ms
localparam FAST = 20;    //--  90 ms
localparam  TCF = 3'b001;  //-- Transfer Control Fixed. Unconditional jump
parameter ROMFILE = "rom.list";
localparam AW = 12;     //-- Address bus
localparam DW = 16;     //-- Data bus
localparam BOOT_ADDR = 12'h800;
localparam G_INIT = 15'hAA00;
//localparam DEFAULT_MODE = AUTOMATIC_MODE;
localparam DEFAULT_MODE = MANUAL_MODE;
//localparam AUTOMATIC_MODE_SPEED = SLOW;
localparam AUTOMATIC_MODE_SPEED = MEDIUM;
//localparam  AUTOMATIC_MODE_SPEED = FAST;
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
wire selmode_p; //-- Selmode button with pull-up activated
wire sw1;
wire sw2;
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
   .PACKAGE_PIN(selmode),
   .D_IN_0(selmode_p)
);
assign sw1 = ~next_p;
assign sw2 = ~selmode_p;
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
debounce_pulse deb3 (
  .clk(clk),
  .sw_in(timer_trig),
  .sw_out(timer_trig_pulse)
  );
reg  [AW-1: 0] S = BOOT_ADDR;
always @(posedge clk) begin
    if (WS)
      S <= dir12;
    else
      if (INCS)
        S <= S + 1;
end
reg [14:0] G = G_INIT;
wire [2:0]  opcode = G[14:12]; //-- Opcode: 3 bits
wire [11:0] dir12 = G[11:0];   //-- Dir12: 12 bits
always @(posedge clk)
  if (WG)
    G <= rom_dout[14:0];
assign {d6,d5,d4,d3,d2,d1,d0} = G[14:8];
assign d7 = mode;
wire timer_trig;
wire timer_trig_pulse;
prescaler #(
  .N(AUTOMATIC_MODE_SPEED)
) timer_automatic (
  .clk_in(clk),
  .ena(1'b1),
  .clk_out(timer_trig)
);
reg mode = DEFAULT_MODE;
always @(posedge clk) begin
  if (sw2_deb)
    mode = ~mode;
end
wire event_trig = (mode == MANUAL_MODE) ? sw1_deb : timer_trig_pulse;
localparam  FETCH = 0;
localparam  READ_OP = 1;
localparam  EXEC0 = 2;
localparam  WAIT = 3;
reg [1:0] state = WAIT;
reg [1:0] next_state;
reg WG = 0;    //-- Load the G register
reg INCS = 0;  //-- Increment the S register
reg WS = 0;    //-- Load the S register
always @(posedge clk)
  state <= next_state;
always @(*) begin
  next_state = state;      //-- Stay in the same state by default
  WG = 0;
  INCS = 0;
  WS = 0;
  case (state)
    FETCH: begin
      next_state = READ_OP;
    end
    READ_OP: begin
      WG = 1;   //-- Read the opcode into the G register
      INCS = 1; //-- Increment the S reg
      next_state = EXEC0;
    end
    EXEC0: begin
      if (opcode == TCF)
        WS = 1;
      next_state = WAIT;
    end
    WAIT: begin
      if (event_trig)
        next_state = FETCH;
    end
    default: begin
    end
  endcase
end
endmodule