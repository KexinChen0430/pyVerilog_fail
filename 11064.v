module regs
reg           ntsc = 0;
reg           a1k = 0;
reg           ecs = 0;
reg           aga = 0;
reg  [ 9-1:1] rga_adr = 0;
reg  [16-1:0] rga_dat_w = 0;
wire [ 9-1:0] hpos;
wire [11-1:0] vpos;
wire          _hsync;
wire          _vsync;
wire          _csync;
wire          blank;
wire          vbl;
wire          vblend;
wire          eol;
wire          eof;
wire          vbl_int;
wire [ 9-1:1] htotal;
reg           dma_bpl_ena = 0;
wire          dma_bpl;
wire [ 9-1:1] bpl_rga_adr;
wire [21-1:1] bpl_adr;
// testbench
initial begin
  // bench start
  $display("BENCH : start");
  repeat(8) @ posedge CLK28;
  // default settings
  repeat (4) @ (posedge CLK28);
  RST = 0;
  // TODO
  // test 1 bpl
  // TODO
end
// reg write task
task reg_wr;
  input [9:0] adr;
  input [15:0] dat;
begin
  wait (!CLK7_EN);
  @ (posedge CLK28);
  rga_adr = adr;
  rga_dat = dat;
  wait(CLK7_EN);
  @ (posedge CLK28);
  rga_adr = 0;
  rga_dat = 0;
end
endtask
// agnus_beamcounter
agnus_beamcounter beamcounter (
  .clk            (CLK28),
  .clk7_en        (CLK7_EN),
  .reset          (RST),
  .cck            (CCK),
  .ntsc           (ntsc),
  .aga            (aga),
  .ecs            (ecs),
  .a1k            (a1k),
  .data_in        (rga_dat_w),
  .data_out       (),
  .reg_address_in (rga_adr),
  .hpos           (hpos),
  .vpos           (vpos),
  ._hsync         (_hsync),
  ._vsync         (_vsync),
  ._csync         (_csync),
  .blank          (blank),
  .vbl            (vbl),
  .vblend         (vblend),
  .eol            (sol),
  .eof            (sof),
  .vbl_int        (vbl_int),
  .htotal         (htotal)
);
// agnus_bitplanedma
agnus_bitplanedma bitplanedma (
  .clk            (CLK28),
  .clk7_en        (CLK7_EN),
  .reset          (RST),
  .aga            (aga),
  .ecs            (ecs),
  .a1k            (a1k),
  .sof            (sof),
  .dmaena         (dma_bpl_ena),
  .vpos           (vpos),
  .hpos           (hpos),
  .dma            (dma_bpl),
  .reg_address_in (rga_adr),
  .reg_address_out(bpl_rga_adr),
  .data_in        (rga_dat_W),
  .address_out    (bpl_adr)
);
endmodule