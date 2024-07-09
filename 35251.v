module
wire  keystrobe;
wire  keyack;
wire  [7:0] keydat;
reg    [7:0] sdr_latch;
`ifdef MINIMIG_PS2_KEYBOARD
wire freeze_out;
ciaa_ps2keyboard  kbd1
(
  .clk(clk),
  .clk7_en(clk7_en),
  .reset(reset),
  .ps2kdat(kbddat),
  .ps2kclk(kbdclk),
  .leda(~porta_out[1]),  // keyboard joystick LED - num lock
  .ledb(disk_led),    // disk activity LED - scroll lock
  .aflock(aflock),
  .kbdrst(kbdrst),
  .keydat(keydat[7:0]),
  .keystrobe(keystrobe),
  .keyack(keyack),
  .osd_ctrl(osd_ctrl),
  ._lmb(_lmb),
  ._rmb(_rmb),
  ._joy2(_joy2),
  .freeze(freeze_out),
  .mou_emu(mou_emu),
  .joy_emu(joy_emu)
);
assign freeze = hrtmon_en && freeze_out;
// sdr register
// !!! Amiga receives keycode ONE STEP ROTATED TO THE RIGHT AND INVERTED !!!
always @(posedge clk)
  if (clk7_en) begin
    if (reset)
      sdr_latch[7:0] <= 8'h00;
    else if (keystrobe & ~keyboard_disabled)
      sdr_latch[7:0] <= ~{keydat[6:0],keydat[7]};
    else if (wr & sdr)
      sdr_latch[7:0] <= data_in[7:0];
  end
`else
//`define NEW_KEYB
`ifdef NEW_KEYB
// MiST keyboard
reg  [ 2:0] kms_level_sync;
wire        kms;
reg  [ 7:0] kmd_sync[0:1];
wire [ 7:0] kmd;
reg  [ 1:0] kmt_sync[0:1];
wire [ 1:0] kmt;
reg  [ 7:0] osd_ctrl_reg;
reg         freeze_reg=0;
// sync kms_level to clk28
always @ (posedge clk) begin
  if (clk7_en) begin
    kms_level_sync <= #1 {kms_level_sync[1:0], kms_level};
  end
end
//recreate kbd_mouse strobe in clk28 domain
assign kms = kms_level_sync[2] ^ kms_level_sync[1];
// synced data
assign kmt = kmt_sync[1];
assign kmd = kmd_sync[1];
// sync kbd_mouse_data to clk28
always @ (posedge clk) begin
  if (clk7_en) begin
    kmd_sync[0] <= #1 kbd_mouse_data;
    kmd_sync[1] <= #1 kmd_sync[0];
    kmt_sync[0] <= #1 kbd_mouse_type;
    kmt_sync[1] <= #1 kmt_sync[0];
  end
end
// sdr register
// !!! Amiga receives keycode ONE STEP ROTATED TO THE RIGHT AND INVERTED !!!
always @ (posedge clk) begin
  if (clk7_en) begin
    if (reset) begin
      sdr_latch[7:0] <= 8'h00;
      freeze_reg <= #1 1'b0;
    end else if (kms && (kmt == 2) && ~keyboard_disabled) begin
      sdr_latch[7:0] <= ~{kmd[6:0],kmd[7]};
      if (hrtmon_en && (kmd == 8'h5f)) freeze_reg <= #1 1'b1;
      else freeze_reg <= #1 1'b0;
    end else if (wr & sdr) begin
        sdr_latch[7:0] <= data_in[7:0];
    end
  end
end
always @ (posedge clk) begin
  if (clk7_en) begin
    if (reset)
      osd_ctrl_reg[7:0] <= 8'd0;
    else if (kms && ((kmt == 2) || (kmt == 3)))
      osd_ctrl_reg[7:0] <= kbd_mouse_data;
  end
end
assign kbdrst = 1'b0;
assign _lmb = 1'b1;
assign _rmb = 1'b1;
assign _joy2 = 6'b11_1111;
assign joy_emu = 6'b11_1111;
assign mou_emu = 6'b11_1111;
assign freeze = freeze_reg;
assign aflock = 1'b0;
assign keystrobe = kms && ((kmt == 2));
assign osd_ctrl = osd_ctrl_reg;
`else
assign kbdrst = 1'b0;
assign _lmb = 1'b1;
assign _rmb = 1'b1;
assign _joy2 = 6'b11_1111;
assign joy_emu = 6'b11_1111;
assign mou_emu = 6'b11_1111;
reg freeze_reg=0;
assign freeze = freeze_reg;
assign aflock = 1'b0;
reg [7:0] osd_ctrl_reg;
reg keystrobe_reg;
assign keystrobe = keystrobe_reg && ((kbd_mouse_type == 2) || (kbd_mouse_type == 3));
assign osd_ctrl = osd_ctrl_reg;
// generate a keystrobe which is valid exactly one clk cycle
reg kbd_mouse_strobeD, kbd_mouse_strobeD2;
always @(posedge clk)
  if (clk7_en) begin
    kbd_mouse_strobeD <= kbd_mouse_strobe;
  end
always @(posedge clk) begin
  if (clk7n_en) begin
    kbd_mouse_strobeD2 <= kbd_mouse_strobeD;
    keystrobe_reg <= kbd_mouse_strobeD && !kbd_mouse_strobeD2;
  end
end
// sdr register
// !!! Amiga receives keycode ONE STEP ROTATED TO THE RIGHT AND INVERTED !!!
always @(posedge clk) begin
  if (clk7_en) begin
    if (reset) begin
      sdr_latch[7:0] <= 8'h00;
      osd_ctrl_reg[7:0] <= 8'd0;
      freeze_reg <= #1 1'b0;
     end else begin
      if (keystrobe && (kbd_mouse_type == 2) && ~keyboard_disabled) begin
        sdr_latch[7:0] <= ~{kbd_mouse_data[6:0],kbd_mouse_data[7]};
        if (hrtmon_en && (kbd_mouse_data == 8'h5f)) freeze_reg <= #1 1'b1;
        else freeze_reg <= #1 1'b0;
      end else if (wr & sdr)
        sdr_latch[7:0] <= data_in[7:0];
      if(keystrobe && ((kbd_mouse_type == 2) || (kbd_mouse_type == 3)))
        osd_ctrl_reg[7:0] <= kbd_mouse_data;
    end
  end
end
`endif
`endif
// sdr register read
assign sdr_out = (!wr && sdr) ? sdr_latch[7:0] : 8'h00;
// keyboard acknowledge
assign keyack = (!wr && sdr) ? 1'b1 : 1'b0;
// serial port transmision in progress
always @(posedge clk)
  if (clk7_en) begin
    if (reset || !spmode) // reset or not in output mode
      ser_tx_run <= 0;
    else if (sdr && wr) // write to serial port data register when serial port is in output mode
      ser_tx_run <= 1;
    else if (ser_tx_irq) // last bit has been transmitted
      ser_tx_run <= 0;
  end
// serial port transmitted bits counter
always @(posedge clk)
  if (clk7_en) begin
    if (!ser_tx_run)
      ser_tx_cnt <= 4'd0;
    else if (tmra_ovf) // bits are transmitted when tmra overflows
      ser_tx_cnt <= ser_tx_cnt + 4'd1;
  end
assign ser_tx_irq = &ser_tx_cnt & tmra_ovf; // signal irq when ser_tx_cnt overflows
// porta
reg [7:2] porta_in2;
reg [3:0] regporta;
reg [7:0] ddrporta;
// synchronizing of input data
always @(posedge clk)
  if (clk7_en) begin
    porta_in2[7:2] <= porta_in[7:2];
  end
// writing of output port
always @(posedge clk)
  if (clk7_en) begin
    if (reset)
      regporta[3:0] <= 4'd0;
    else if (wr && pra)
      regporta[3:0] <= {data_in[7:6], data_in[1:0]};
  end
// writing of ddr register
always @(posedge clk)
  if (clk7_en) begin
    if (reset)
      ddrporta[7:0] <= 8'd0;
    else if (wr && ddra)
       ddrporta[7:0] <= data_in[7:0];
  end
// reading of port/ddr register
always @(*)
begin
  if (!wr && pra)
    pa_out[7:0] = {porta_in2[7:2],porta_out[1:0]};
  else if (!wr && ddra)
    pa_out[7:0] = ddrporta[7:0];
  else
    pa_out[7:0] = 8'h00;
end
// assignment of output port while keeping in mind that the original 8520 uses pull-ups
assign porta_out[3:0] = {(~ddrporta[7:6] | regporta[3:2]), (~ddrporta[1:0] | regporta[1:0])};
// portb
reg [7:0] regportb;
reg [7:0] ddrportb;
// writing of output port
always @(posedge clk)
  if (clk7_en) begin
    if (reset)
      regportb[7:0] <= 8'd0;
    else if (wr && prb)
      regportb[7:0] <= (data_in[7:0]);
  end
// writing of ddr register
always @(posedge clk)
  if (clk7_en) begin
    if (reset)
      ddrportb[7:0] <= 8'd0;
    else if (wr && ddrb)
      ddrportb[7:0] <= (data_in[7:0]);
  end
// reading of port/ddr register
always @(*)
begin
  if (!wr && prb)
    pb_out[7:0] = (portb_out[7:0]);
  else if (!wr && ddrb)
    pb_out[7:0] = (ddrportb[7:0]);
  else
    pb_out[7:0] = 8'h00;
end
// assignment of output port while keeping in mind that the original 8520 uses pull-ups
assign portb_out[7:0] = ((~ddrportb[7:0]) | (regportb[7:0]));
// delayed tick signal for edge detection
always @(posedge clk)
  if (clk7_en) begin
    tick_del <= tick;
  end
// instantiate cia interrupt controller
cia_int cnt
(
  .clk(clk),
  .clk7_en(clk7_en),
  .wr(wr),
  .reset(reset),
  .icrs(icrs),
  .ta(ta),
  .tb(tb),
  .alrm(alrm),
  .flag(1'b0),
  .ser(keystrobe & ~keyboard_disabled | ser_tx_irq),
  .data_in(data_in),
  .data_out(icr_out),
  .irq(irq)
);
// instantiate timer A
cia_timera tmra
(
  .clk(clk),
  .clk7_en(clk7_en),
  .wr(wr),
  .reset(reset),
  .tlo(talo),
  .thi(tahi),
  .tcr(cra),
  .data_in(data_in),
  .data_out(tmra_out),
  .eclk(eclk),
  .spmode(spmode),
  .tmra_ovf(tmra_ovf),
  .irq(ta)
);
// instantiate timer B
cia_timerb tmrb
(
  .clk(clk),
  .clk7_en(clk7_en),
  .wr(wr),
  .reset(reset),
  .tlo(tblo),
  .thi(tbhi),
  .tcr(crb),
  .data_in(data_in),
  .data_out(tmrb_out),
  .eclk(eclk),
  .tmra_ovf(tmra_ovf),
  .irq(tb)
);
// instantiate timer D
cia_timerd tmrd
(
  .clk(clk),
  .clk7_en(clk7_en),
  .wr(wr),
  .reset(reset),
  .tlo(tdlo),
  .tme(tdme),
  .thi(tdhi),
  .tcr(crb),
  .data_in(data_in),
  .data_out(tmrd_out),
  .count(tick & ~tick_del),
  .irq(alrm)
);
endmodule