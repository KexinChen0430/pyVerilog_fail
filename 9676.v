module RAMB36E1 (
    input CLKARDCLK,
    input CLKBWRCLK,
    input ENARDEN,
    input ENBWREN,
    input REGCEAREGCE,
    input REGCEB,
    input RSTRAMARSTRAM,
    input RSTRAMB,
    input RSTREGARSTREG,
    input RSTREGB,
    input [14:0] ADDRARDADDR,
    input [14:0] ADDRBWRADDR,
    input [31:0] DIADI,
    input [31:0] DIBDI,
    input [3:0] DIPADIP,
    input [3:0] DIPBDIP,
    input [3:0] WEA,
    input [7:0] WEBWE,
    output [31:0] DOADO,
    output [31:0] DOBDO,
    output [3:0] DOPADOP,
    output [3:0] DOPBDOP
);
    parameter INIT_A = 36'h0;
    parameter INIT_B = 36'h0;
    parameter SRVAL_A = 36'h0;
    parameter SRVAL_B = 36'h0;
   `define INIT_BLOCK(pre) \
    parameter ``pre``0 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``1 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``2 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``3 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``4 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``5 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``6 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``7 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``8 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``9 = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``A = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``B = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``C = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``D = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``E = 256'h0000000000000000000000000000000000000000000000000000000000000000; \
    parameter ``pre``F = 256'h0000000000000000000000000000000000000000000000000000000000000000
    `INIT_BLOCK(INITP_0);
    `INIT_BLOCK(INIT_0);
    `INIT_BLOCK(INIT_1);
    `INIT_BLOCK(INIT_2);
    `INIT_BLOCK(INIT_3);
    `INIT_BLOCK(INIT_4);
    `INIT_BLOCK(INIT_5);
    `INIT_BLOCK(INIT_6);
    `INIT_BLOCK(INIT_7);
    `undef INIT_BLOCK
    parameter IS_CLKARDCLK_INVERTED = 1'b0;
    parameter IS_CLKBWRCLK_INVERTED = 1'b0;
    parameter IS_ENARDEN_INVERTED = 1'b0;
    parameter IS_ENBWREN_INVERTED = 1'b0;
    parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
    parameter IS_RSTRAMB_INVERTED = 1'b0;
    parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
    parameter IS_RSTREGB_INVERTED = 1'b0;
    parameter _TECHMAP_CONSTMSK_CLKARDCLK_ = 0;
    parameter _TECHMAP_CONSTVAL_CLKARDCLK_ = 0;
    parameter _TECHMAP_CONSTMSK_CLKBWRCLK_ = 0;
    parameter _TECHMAP_CONSTVAL_CLKBWRCLK_ = 0;
    parameter _TECHMAP_CONSTMSK_REGCLKARDRCLK_ = 0;
    parameter _TECHMAP_CONSTVAL_REGCLKARDRCLK_ = 0;
    parameter _TECHMAP_CONSTMSK_RSTRAMARSTRAM_ = 0;
    parameter _TECHMAP_CONSTVAL_RSTRAMARSTRAM_ = 0;
    parameter _TECHMAP_CONSTMSK_RSTRAMB_ = 0;
    parameter _TECHMAP_CONSTVAL_RSTRAMB_ = 0;
    parameter _TECHMAP_CONSTMSK_RSTREGARSTREG_ = 0;
    parameter _TECHMAP_CONSTVAL_RSTREGARSTREG_ = 0;
    parameter _TECHMAP_CONSTMSK_RSTREGB_ = 0;
    parameter _TECHMAP_CONSTVAL_RSTREGB_ = 0;
    parameter RAM_MODE = "TDP";
    parameter SIM_DEVICE = "7SERIES";
    parameter DOA_REG = 1'b0;
    parameter DOB_REG = 1'b0;
    parameter integer READ_WIDTH_A = 0;
    parameter integer READ_WIDTH_B = 0;
    parameter integer WRITE_WIDTH_A = 0;
    parameter integer WRITE_WIDTH_B = 0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";
  reg _TECHMAP_FAIL_;
  wire [1023:0] _TECHMAP_DO_ = "proc; clean";
  localparam INV_CLKARDCLK = (_TECHMAP_CONSTMSK_CLKARDCLK_ == 1)  ? !_TECHMAP_CONSTVAL_CLKARDCLK_ ^ IS_CLKARDCLK_INVERTED :
                      (_TECHMAP_CONSTVAL_CLKARDCLK_ === 0) ? ~IS_CLKARDCLK_INVERTED : IS_CLKARDCLK_INVERTED;
  wire clkardclk = (_TECHMAP_CONSTMSK_CLKARDCLK_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_CLKARDCLK_ === 0) ? 1'b1 : CLKARDCLK;
  localparam INV_CLKBWRCLK = (_TECHMAP_CONSTMSK_CLKBWRCLK_ == 1)  ? !_TECHMAP_CONSTVAL_CLKBWRCLK_ ^ IS_CLKBWRCLK_INVERTED :
                      (_TECHMAP_CONSTVAL_CLKBWRCLK_ === 0) ? ~IS_CLKBWRCLK_INVERTED : IS_CLKBWRCLK_INVERTED;
  wire clkbwrclk = (_TECHMAP_CONSTMSK_CLKBWRCLK_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_CLKBWRCLK_ === 0) ? 1'b1 : CLKBWRCLK;
  localparam INV_RSTRAMARSTRAM = (_TECHMAP_CONSTMSK_RSTRAMARSTRAM_ == 1)  ? !_TECHMAP_CONSTVAL_RSTRAMARSTRAM_ ^ IS_RSTRAMARSTRAM_INVERTED :
                      (_TECHMAP_CONSTVAL_RSTRAMARSTRAM_ === 0) ? ~IS_RSTRAMARSTRAM_INVERTED : IS_RSTRAMARSTRAM_INVERTED;
  wire rstramarstram = (_TECHMAP_CONSTMSK_RSTRAMARSTRAM_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_RSTRAMARSTRAM_ === 0) ? 1'b1 : RSTRAMARSTRAM;
  localparam INV_RSTRAMB = (_TECHMAP_CONSTMSK_RSTRAMB_ == 1)  ? !_TECHMAP_CONSTVAL_RSTRAMB_ ^ IS_RSTRAMB_INVERTED :
                      (_TECHMAP_CONSTVAL_RSTRAMB_ === 0) ? ~IS_RSTRAMB_INVERTED : IS_RSTRAMB_INVERTED;
  wire rstramb = (_TECHMAP_CONSTMSK_RSTRAMB_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_RSTRAMB_ === 0) ? 1'b1 : RSTRAMB;
  localparam INV_RSTREGARSTREG = (_TECHMAP_CONSTMSK_RSTREGARSTREG_ == 1)  ? !_TECHMAP_CONSTVAL_RSTREGARSTREG_ ^ IS_RSTREGARSTREG_INVERTED :
                      (_TECHMAP_CONSTVAL_RSTREGARSTREG_ === 0) ? ~IS_RSTREGARSTREG_INVERTED : IS_RSTREGARSTREG_INVERTED;
  wire rstregarstreg = (_TECHMAP_CONSTMSK_RSTREGARSTREG_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_RSTREGARSTREG_ === 0) ? 1'b1 : RSTREGARSTREG;
  localparam INV_RSTREGB = (_TECHMAP_CONSTMSK_RSTREGB_ == 1)  ? !_TECHMAP_CONSTVAL_RSTREGB_ ^ IS_RSTREGB_INVERTED :
                      (_TECHMAP_CONSTVAL_RSTREGB_ === 0) ? ~IS_RSTREGB_INVERTED : IS_RSTREGB_INVERTED;
  wire rstregb = (_TECHMAP_CONSTMSK_RSTREGB_ == 1)  ? 1'b1 :
            (_TECHMAP_CONSTVAL_RSTREGB_ === 0) ? 1'b1 : RSTREGB;
  initial begin
    _TECHMAP_FAIL_ <= 0;
  `define INVALID_WIDTH(x) \
          ((x) != 0 \
        && (x) != 1 \
        && (x) != 2 \
        && (x) != 4 \
        && (x) != 9 \
        && (x) != 18 \
        && (x) != 36)
  `define INVALID_WIDTH_WIDE(x) \
     (`INVALID_WIDTH(x) \
        && (x) != 72)
    if(`INVALID_WIDTH_WIDE(READ_WIDTH_A))
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    if(`INVALID_WIDTH(READ_WIDTH_B))
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    if(`INVALID_WIDTH(WRITE_WIDTH_A))
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    if(`INVALID_WIDTH_WIDE(WRITE_WIDTH_B))
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    `undef INVALID_WIDTH
    `undef INVALID_WIDTH_WIDE
    if(READ_WIDTH_A > 36 && RAM_MODE != "SDP") begin
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    end
    if(WRITE_WIDTH_B > 36 && RAM_MODE != "SDP") begin
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    end
    if(WRITE_MODE_A != "WRITE_FIRST" && WRITE_MODE_A != "NO_CHANGE" && WRITE_MODE_A != "READ_FIRST")
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
    if(WRITE_MODE_B != "WRITE_FIRST" && WRITE_MODE_B != "NO_CHANGE" && WRITE_MODE_B != "READ_FIRST")
        _TECHMAP_FAIL_ <= GENERATE_ERROR;
  end
  localparam EFF_READ_WIDTH_A = (RAM_MODE == "SDP" && READ_WIDTH_A > 36) ? 36 : READ_WIDTH_A;
  localparam EFF_READ_WIDTH_B = (RAM_MODE == "SDP" && READ_WIDTH_A > 36) ? 36 : READ_WIDTH_B;
  localparam EFF_WRITE_WIDTH_A = (RAM_MODE == "SDP" && WRITE_WIDTH_B > 36) ? 36 : WRITE_WIDTH_A;
  localparam EFF_WRITE_WIDTH_B = (RAM_MODE == "SDP" && WRITE_WIDTH_B > 36) ? 36 : WRITE_WIDTH_B;
  wire REGCLKA;
  wire REGCLKB;
  assign REGCLKA = DOA_REG ? CLKARDCLK : 1'b1;
  localparam ZINV_REGCLKARDRCLK = (DOA_REG && !IS_CLKARDCLK_INVERTED);
  assign REGCLKB = DOB_REG ? CLKBWRCLK : 1'b1;
  localparam ZINV_REGCLKB = (DOB_REG && !IS_CLKBWRCLK_INVERTED);
  wire [7:0] WEBWE_WIDE;
  wire [3:0] WEA_WIDE;
  wire [3:0] DIPADIP_MAPPED;
  wire [3:0] DIPBDIP_MAPPED;
  wire [31:0] DIADI_MAPPED;
  wire [31:0] DIBDI_MAPPED;
  if(WRITE_WIDTH_A == 1) begin
      assign DIADI_MAPPED[31:2] = DIADI[31:2];
      assign DIADI_MAPPED[1] = DIADI[0];
      assign DIADI_MAPPED[0] = DIADI[0];
  end else begin
      assign DIADI_MAPPED = DIADI;
  end
  if(WRITE_WIDTH_B == 1) begin
      assign DIBDI_MAPPED[31:2] = DIBDI[31:2];
      assign DIBDI_MAPPED[1] = DIBDI[0];
      assign DIBDI_MAPPED[0] = DIBDI[0];
  end else begin
      assign DIBDI_MAPPED = DIBDI;
  end
  if(WRITE_WIDTH_A < 18) begin
      assign WEA_WIDE = {4{WEA[0]}};
      assign DIPADIP_MAPPED[3:2] = DIPADIP[3:2];
      assign DIPADIP_MAPPED[1] = DIPADIP[0];
      assign DIPADIP_MAPPED[0] = DIPADIP[0];
  end else if(WRITE_WIDTH_A == 18) begin
      assign WEA_WIDE[3] = WEA[1];
      assign WEA_WIDE[1] = WEA[1];
      assign WEA_WIDE[2] = WEA[0];
      assign WEA_WIDE[0] = WEA[0];
      assign DIPADIP_MAPPED = DIPADIP;
  end else if(WRITE_WIDTH_A == 36) begin
      assign WEA_WIDE = WEA;
      assign DIPADIP_MAPPED = DIPADIP;
  end
  if(WRITE_WIDTH_B < 18) begin
      assign WEBWE_WIDE[7:4] = 4'b0;
      assign WEBWE_WIDE[3:0] = {4{WEBWE[0]}};
      assign DIPBDIP_MAPPED[3:2] = DIPBDIP[3:2];
      assign DIPBDIP_MAPPED[1] = DIPBDIP[0];
      assign DIPBDIP_MAPPED[0] = DIPBDIP[0];
  end else if(WRITE_WIDTH_B == 18) begin
      assign WEBWE_WIDE[7:4] = 4'b0;
      assign WEBWE_WIDE[3] = WEBWE[1];
      assign WEBWE_WIDE[1] = WEBWE[1];
      assign WEBWE_WIDE[2] = WEBWE[0];
      assign WEBWE_WIDE[0] = WEBWE[0];
      assign DIPBDIP_MAPPED = DIPBDIP;
  end else if(WRITE_WIDTH_B == 36) begin
      assign WEBWE_WIDE = WEBWE;
      assign DIPBDIP_MAPPED = DIPBDIP;
  end else if(WRITE_WIDTH_B == 72) begin
      assign WEA_WIDE = 4'b0;
      assign WEBWE_WIDE = WEBWE;
      assign DIPBDIP_MAPPED = DIPBDIP;
  end
  RAMB36E1_PRIM #(
      .IN_USE(READ_WIDTH_A != 0 || READ_WIDTH_B != 0 || WRITE_WIDTH_A != 0 || WRITE_WIDTH_B != 0),
      .ZINIT_A(INIT_A ^ {36{1'b1}}),
      .ZINIT_B(INIT_B ^ {36{1'b1}}),
      .ZSRVAL_A(SRVAL_A ^ {36{1'b1}}),
      .ZSRVAL_B(SRVAL_B ^ {36{1'b1}}),
      `define INIT_PARAM_BLOCK_L(pre, n, d, upper) \
      .``pre``_``n``0(every_other_bit_256({``pre``_``d``1, ``pre``_``d``0}, upper)), \
      .``pre``_``n``1(every_other_bit_256({``pre``_``d``3, ``pre``_``d``2}, upper)), \
      .``pre``_``n``2(every_other_bit_256({``pre``_``d``5, ``pre``_``d``4}, upper)), \
      .``pre``_``n``3(every_other_bit_256({``pre``_``d``7, ``pre``_``d``6}, upper)), \
      .``pre``_``n``4(every_other_bit_256({``pre``_``d``9, ``pre``_``d``8}, upper)), \
      .``pre``_``n``5(every_other_bit_256({``pre``_``d``B, ``pre``_``d``A}, upper)), \
      .``pre``_``n``6(every_other_bit_256({``pre``_``d``D, ``pre``_``d``C}, upper)), \
      .``pre``_``n``7(every_other_bit_256({``pre``_``d``F, ``pre``_``d``E}, upper))
      `define INIT_PARAM_BLOCK_H(pre, n, d, upper) \
      .``pre``_``n``8(every_other_bit_256({``pre``_``d``1, ``pre``_``d``0}, upper)), \
      .``pre``_``n``9(every_other_bit_256({``pre``_``d``3, ``pre``_``d``2}, upper)), \
      .``pre``_``n``A(every_other_bit_256({``pre``_``d``5, ``pre``_``d``4}, upper)), \
      .``pre``_``n``B(every_other_bit_256({``pre``_``d``7, ``pre``_``d``6}, upper)), \
      .``pre``_``n``C(every_other_bit_256({``pre``_``d``9, ``pre``_``d``8}, upper)), \
      .``pre``_``n``D(every_other_bit_256({``pre``_``d``B, ``pre``_``d``A}, upper)), \
      .``pre``_``n``E(every_other_bit_256({``pre``_``d``D, ``pre``_``d``C}, upper)), \
      .``pre``_``n``F(every_other_bit_256({``pre``_``d``F, ``pre``_``d``E}, upper))
      `define INIT_PARAM_BLOCK(pre, n, lo, hi, upper) \
      `INIT_PARAM_BLOCK_L(pre, n, lo, upper), \
      `INIT_PARAM_BLOCK_H(pre, n, hi, upper)
      `INIT_PARAM_BLOCK_L(INITP, 0, 0, 0),
      `INIT_PARAM_BLOCK_H(INITP, 0, 0, 1),
      `INIT_PARAM_BLOCK(INIT, 0, 0, 1, 0),
      `INIT_PARAM_BLOCK(INIT, 1, 2, 3, 0),
      `INIT_PARAM_BLOCK(INIT, 2, 4, 5, 0),
      `INIT_PARAM_BLOCK(INIT, 3, 6, 7, 0),
      `INIT_PARAM_BLOCK(INIT, 4, 0, 1, 1),
      `INIT_PARAM_BLOCK(INIT, 5, 2, 3, 1),
      `INIT_PARAM_BLOCK(INIT, 6, 4, 5, 1),
      `INIT_PARAM_BLOCK(INIT, 7, 6, 7, 1),
      `undef INIT_PARAM_BLOCK_L
      `undef INIT_PARAM_BLOCK_H
      `undef INIT_PARAM_BLOCK
      .ZINV_CLKARDCLK(!IS_CLKARDCLK_INVERTED ^ INV_CLKARDCLK),
      .ZINV_CLKBWRCLK(!IS_CLKBWRCLK_INVERTED ^ INV_CLKBWRCLK),
      .ZINV_ENARDEN(!IS_ENARDEN_INVERTED),
      .ZINV_ENBWREN(!IS_ENBWREN_INVERTED),
      .ZINV_RSTRAMARSTRAM(!IS_RSTRAMARSTRAM_INVERTED ^ INV_RSTRAMARSTRAM),
      .ZINV_RSTRAMB(!IS_RSTRAMB_INVERTED ^ INV_RSTRAMB),
      .ZINV_RSTREGARSTREG(!IS_RSTREGARSTREG_INVERTED ^ INV_RSTREGARSTREG),
      .ZINV_RSTREGB(!IS_RSTREGB_INVERTED ^ INV_RSTREGB),
      .ZINV_REGCLKARDRCLK(ZINV_REGCLKARDRCLK),
      .ZINV_REGCLKB(ZINV_REGCLKB),
      .DOA_REG(DOA_REG),
      .DOB_REG(DOB_REG),
      `define WIDTH_PARAM(name) \
      .``name``_1(EFF_``name`` == 2 || EFF_``name`` == 1 || EFF_``name`` == 0), \
      .``name``_2(EFF_``name`` == 4), \
      .``name``_4(EFF_``name`` == 9), \
      .``name``_9(EFF_``name`` == 18), \
      .``name``_18(EFF_``name`` == 36)
      `WIDTH_PARAM(READ_WIDTH_A),
      .SDP_READ_WIDTH_36(READ_WIDTH_A > 36),
      `WIDTH_PARAM(READ_WIDTH_B),
      `WIDTH_PARAM(WRITE_WIDTH_A),
      `WIDTH_PARAM(WRITE_WIDTH_B),
      `undef WIDTH_PARAM
      .BRAM36_READ_WIDTH_A_1(EFF_READ_WIDTH_A == 1 || EFF_READ_WIDTH_A == 9),
      .BRAM36_READ_WIDTH_B_1(EFF_READ_WIDTH_B == 1 || EFF_READ_WIDTH_B == 9),
      .BRAM36_WRITE_WIDTH_A_1(EFF_WRITE_WIDTH_A == 1 || EFF_WRITE_WIDTH_A == 9),
      .BRAM36_WRITE_WIDTH_B_1(EFF_WRITE_WIDTH_B == 1 || EFF_WRITE_WIDTH_B == 9),
      .SDP_WRITE_WIDTH_36(WRITE_WIDTH_B > 36),
      .WRITE_MODE_A_NO_CHANGE(WRITE_MODE_A == "NO_CHANGE" || (WRITE_MODE_A == "WRITE_FIRST" && RAM_MODE == "SDP")),
      .WRITE_MODE_A_READ_FIRST(WRITE_MODE_A == "READ_FIRST"),
      .WRITE_MODE_B_NO_CHANGE(WRITE_MODE_B == "NO_CHANGE" || (WRITE_MODE_B == "WRITE_FIRST" && RAM_MODE == "SDP")),
      .WRITE_MODE_B_READ_FIRST(WRITE_MODE_B == "READ_FIRST"),
      .RSTREG_PRIORITY_A_RSTREG(1'b1),
      .RSTREG_PRIORITY_B_RSTREG(1'b1),
      .RAM_EXTENSION_A_NONE_OR_UPPER(1'b1),
      .RAM_EXTENSION_B_NONE_OR_UPPER(1'b1),
      .RDADDR_COLLISION_HWCONFIG_DELAYED_WRITE(1'b1),
      .ZALMOST_EMPTY_OFFSET(13'b1111111111111),
      .ZALMOST_FULL_OFFSET(13'b1111111111111)
  ) _TECHMAP_REPLACE_ (
    `define DUP(pre, in) .``pre``U(in), .``pre``L(in)
    `DUP(CLKARDCLK, clkardclk),
    `DUP(REGCLKARDRCLK, REGCLKA),
    `DUP(CLKBWRCLK, clkbwrclk),
    `DUP(REGCLKB, REGCLKB),
    `DUP(ENARDEN, ENARDEN),
    `DUP(ENBWREN, ENBWREN),
    `DUP(REGCEAREGCE, REGCEAREGCE),
    `DUP(REGCEB, REGCEB),
    .RSTRAMARSTRAMU(rstramarstram),
    .RSTRAMARSTRAMLRST(rstramarstram),
    `DUP(RSTRAMB, rstramb),
    `DUP(RSTREGARSTREG, rstregarstreg),
    `DUP(RSTREGB, rstregb),
    .ADDRARDADDRU(ADDRARDADDR),
    .ADDRARDADDRL({1'b1, ADDRARDADDR}),
    .ADDRBWRADDRU(ADDRBWRADDR),
    .ADDRBWRADDRL({1'b1, ADDRBWRADDR}),
    .DIADI(DIADI_MAPPED),
    .DIBDI(DIBDI_MAPPED),
    .DIPADIP(DIPADIP_MAPPED),
    .DIPBDIP(DIPBDIP_MAPPED),
    `DUP(WEA, WEA_WIDE),
    `DUP(WEBWE, WEBWE_WIDE),
    .DOADO(DOADO),
    .DOBDO(DOBDO),
    .DOPADOP(DOPADOP),
    .DOPBDOP(DOPBDOP)
    `undef DUP
  );
endmodule