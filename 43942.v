module RAMB36E1 (CASCADEOUTA, CASCADEOUTB, DBITERR, DOADO, DOBDO, DOPADOP, DOPBDOP, ECCPARITY, RDADDRECC, SBITERR,
       ADDRARDADDR, ADDRBWRADDR, CASCADEINA, CASCADEINB, CLKARDCLK, CLKBWRCLK, DIADI, DIBDI, DIPADIP, DIPBDIP, ENARDEN, ENBWREN, INJECTDBITERR, INJECTSBITERR, REGCEAREGCE, REGCEB, RSTRAMARSTRAM, RSTRAMB, RSTREGARSTREG, RSTREGB, WEA, WEBWE);
    parameter integer DOA_REG = 0;
    parameter integer DOB_REG = 0;
    parameter EN_ECC_READ = "FALSE";
    parameter EN_ECC_WRITE = "FALSE";
    parameter [255:0] INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INITP_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [255:0] INIT_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter [35:0] INIT_A = 36'h0;
    parameter [35:0] INIT_B = 36'h0;
    parameter INIT_FILE = "NONE";
    parameter IS_CLKARDCLK_INVERTED = 1'b0;
    parameter IS_CLKBWRCLK_INVERTED = 1'b0;
    parameter IS_ENARDEN_INVERTED = 1'b0;
    parameter IS_ENBWREN_INVERTED = 1'b0;
    parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
    parameter IS_RSTRAMB_INVERTED = 1'b0;
    parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
    parameter IS_RSTREGB_INVERTED = 1'b0;
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    parameter RAM_EXTENSION_A = "NONE";
    parameter RAM_EXTENSION_B = "NONE";
    parameter RAM_MODE = "TDP";
    parameter RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE";
    parameter integer READ_WIDTH_A = 0;
    parameter integer READ_WIDTH_B = 0;
    parameter RSTREG_PRIORITY_A = "RSTREG";
    parameter RSTREG_PRIORITY_B = "RSTREG";
    parameter SIM_COLLISION_CHECK = "ALL";
    parameter SIM_DEVICE = "7SERIES";
    parameter [35:0] SRVAL_A = 36'h0;
    parameter [35:0] SRVAL_B = 36'h0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";
    parameter integer WRITE_WIDTH_A = 0;
    parameter integer WRITE_WIDTH_B = 0;
    localparam SETUP_ALL = 1000;
    localparam SETUP_READ_FIRST = 3000;
    output CASCADEOUTA;
    output CASCADEOUTB;
    output DBITERR;
    output [31:0] DOADO;
    output [31:0] DOBDO;
    output [3:0] DOPADOP;
    output [3:0] DOPBDOP;
    output [7:0] ECCPARITY;
    output [8:0] RDADDRECC;
    output SBITERR;
    input CLKARDCLK;
    input CLKBWRCLK;
    input ENARDEN;
    input ENBWREN;
    input REGCEAREGCE;
    input REGCEB;
    input RSTRAMARSTRAM;
    input RSTRAMB;
    input RSTREGARSTREG;
    input RSTREGB;
    input CASCADEINA;
    input CASCADEINB;
    input INJECTDBITERR;
    input INJECTSBITERR;
    input [15:0] ADDRARDADDR;
    input [15:0] ADDRBWRADDR;
    input [31:0] DIADI;
    input [31:0] DIBDI;
    input [3:0] DIPADIP;
    input [3:0] DIPBDIP;
    input [3:0] WEA;
    input [7:0] WEBWE;
    tri0 GSR = glbl.GSR;
    wire [3:0] dangle_out4;
    wire [31:0] dangle_out32;
    wire [31:0]   doado_wire, dobdo_wire;
    wire [3:0] dopadop_wire, dopbdop_wire;
    wire cascadeouta_wire, cascadeoutb_wire;
    reg [31:0] doado_out, dobdo_out;
    reg [3:0] dopadop_out, dopbdop_out;
    reg cascadeouta_out, cascadeoutb_out;
    reg notifier, notifier_a, notifier_b;
    reg notifier_addra0, notifier_addra1, notifier_addra2, notifier_addra3, notifier_addra4;
    reg notifier_addra5, notifier_addra6, notifier_addra7, notifier_addra8, notifier_addra9;
    reg notifier_addra10, notifier_addra11, notifier_addra12, notifier_addra13, notifier_addra14;
    reg notifier_addra15;
    reg notifier_addrb0, notifier_addrb1, notifier_addrb2, notifier_addrb3, notifier_addrb4;
    reg notifier_addrb5, notifier_addrb6, notifier_addrb7, notifier_addrb8, notifier_addrb9;
    reg notifier_addrb10, notifier_addrb11, notifier_addrb12, notifier_addrb13, notifier_addrb14;
    reg notifier_addrb15;
    reg   attr_err = 1'b0;
    wire cascadeina_in, regcearegce_in;
    wire cascadeinb_in, regceb_in;
    wire injectdbiterr_in, injectsbiterr_in;
    wire [15:0] addrardaddr_in;
    wire [15:0] addrbwraddr_in;
    wire [31:0] diadi_in;
    wire [31:0] dibdi_in;
    wire [3:0] dipadip_in;
    wire [3:0] dipbdip_in;
    wire [3:0] wea_in;
    wire [7:0] webwe_in;
   wire clkardclk_in;
   wire clkbwrclk_in;
   wire enarden_in;
   wire enbwren_in;
   wire rstramarstram_in;
   wire rstramb_in;
   wire rstregarstreg_in;
   wire rstregb_in;
`ifdef XIL_TIMING
    wire CLKARDCLK_delay;
    wire CLKBWRCLK_delay;
    wire ENARDEN_delay;
    wire ENBWREN_delay;
    wire INJECTDBITERR_delay;
    wire INJECTSBITERR_delay;
    wire REGCEAREGCE_delay;
    wire REGCEB_delay;
    wire RSTRAMARSTRAM_delay;
    wire RSTRAMB_delay;
    wire RSTREGARSTREG_delay;
    wire RSTREGB_delay;
    wire [15:0] ADDRARDADDR_delay;
    wire [15:0] ADDRBWRADDR_delay;
    wire [31:0] DIADI_delay;
    wire [31:0] DIBDI_delay;
    wire [3:0] DIPADIP_delay;
    wire [3:0] DIPBDIP_delay;
    wire [3:0] WEA_delay;
    wire [7:0] WEBWE_delay;
`endif
`ifdef XIL_TIMING
   assign cascadeina_in = CASCADEINA;
   assign cascadeinb_in = CASCADEINB;
   assign regcearegce_in = REGCEAREGCE_delay;
   assign regceb_in = REGCEB_delay;
   assign injectdbiterr_in = INJECTDBITERR_delay;
   assign injectsbiterr_in = INJECTSBITERR_delay;
   assign addrardaddr_in = ADDRARDADDR_delay;
   assign addrbwraddr_in = ADDRBWRADDR_delay;
   assign diadi_in = DIADI_delay;
   assign dibdi_in = DIBDI_delay;
   assign dipadip_in = DIPADIP_delay;
   assign dipbdip_in = DIPBDIP_delay;
   assign wea_in = WEA_delay;
   assign webwe_in = WEBWE_delay;
   assign clkardclk_in = CLKARDCLK_delay ^ IS_CLKARDCLK_INVERTED;
   assign clkbwrclk_in = CLKBWRCLK_delay ^ IS_CLKBWRCLK_INVERTED;
   assign enarden_in = ENARDEN_delay ^ IS_ENARDEN_INVERTED;
   assign enbwren_in = ENBWREN_delay ^ IS_ENBWREN_INVERTED;
   assign rstramarstram_in = RSTRAMARSTRAM_delay ^ IS_RSTRAMARSTRAM_INVERTED;
   assign rstramb_in = RSTRAMB_delay ^ IS_RSTRAMB_INVERTED;
   assign rstregarstreg_in = RSTREGARSTREG_delay ^ IS_RSTREGARSTREG_INVERTED;
   assign rstregb_in = RSTREGB_delay ^ IS_RSTREGB_INVERTED;
`else
   assign cascadeina_in = CASCADEINA;
   assign cascadeinb_in = CASCADEINB;
   assign regcearegce_in = REGCEAREGCE;
   assign regceb_in = REGCEB;
   assign injectdbiterr_in = INJECTDBITERR;
   assign injectsbiterr_in = INJECTSBITERR;
   assign addrardaddr_in = ADDRARDADDR;
   assign addrbwraddr_in = ADDRBWRADDR;
   assign diadi_in = DIADI;
   assign dibdi_in = DIBDI;
   assign dipadip_in = DIPADIP;
   assign dipbdip_in = DIPBDIP;
   assign wea_in = WEA;
   assign webwe_in = WEBWE;
   assign clkardclk_in = CLKARDCLK ^ IS_CLKARDCLK_INVERTED;
   assign clkbwrclk_in = CLKBWRCLK ^ IS_CLKBWRCLK_INVERTED;
   assign enarden_in = ENARDEN ^ IS_ENARDEN_INVERTED;
   assign enbwren_in = ENBWREN ^ IS_ENBWREN_INVERTED;
   assign rstramarstram_in = RSTRAMARSTRAM ^ IS_RSTRAMARSTRAM_INVERTED;
   assign rstramb_in = RSTRAMB ^ IS_RSTRAMB_INVERTED;
   assign rstregarstreg_in = RSTREGARSTREG ^ IS_RSTREGARSTREG_INVERTED;
   assign rstregb_in = RSTREGB ^ IS_RSTREGB_INVERTED;
`endif
   initial begin
          if (!((IS_CLKARDCLK_INVERTED >= 1'b0) && (IS_CLKARDCLK_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_CLKARDCLK_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_CLKARDCLK_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_CLKBWRCLK_INVERTED >= 1'b0) && (IS_CLKBWRCLK_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_CLKBWRCLK_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_CLKBWRCLK_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_ENARDEN_INVERTED >= 1'b0) && (IS_ENARDEN_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_ENARDEN_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_ENARDEN_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_ENBWREN_INVERTED >= 1'b0) && (IS_ENBWREN_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_ENBWREN_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_ENBWREN_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_RSTRAMARSTRAM_INVERTED >= 1'b0) && (IS_RSTRAMARSTRAM_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_RSTRAMARSTRAM_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTRAMARSTRAM_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_RSTRAMB_INVERTED >= 1'b0) && (IS_RSTRAMB_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_RSTRAMB_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTRAMB_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_RSTREGARSTREG_INVERTED >= 1'b0) && (IS_RSTREGARSTREG_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_RSTREGARSTREG_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTREGARSTREG_INVERTED);
        attr_err = 1'b1;
     end
          if (!((IS_RSTREGB_INVERTED >= 1'b0) && (IS_RSTREGB_INVERTED <= 1'b1))) begin
        $display("Attribute Syntax Error : The attribute IS_RSTREGB_INVERTED on RAMB36E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTREGB_INVERTED);
        attr_err = 1'b1;
     end
          if (attr_err == 1'b1) #1 $finish;
   end // initial begin
    // special handle for sdp width = 72 and < 72
    localparam [71:0] init_sdp = (READ_WIDTH_A == 72) ? {INIT_B[35:32],INIT_A[35:32],INIT_B[31:0],INIT_A[31:0]} : {INIT_B, INIT_A};
    localparam [71:0] srval_sdp = (READ_WIDTH_A == 72) ? {SRVAL_B[35:32],SRVAL_A[35:32],SRVAL_B[31:0],SRVAL_A[31:0]} : {SRVAL_B, SRVAL_A};
    generate
        case (RAM_MODE)
       "TDP" : begin : gen_tdp
      RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
              .INIT_A(INIT_A),
              .INIT_B(INIT_B),
              .INIT_FILE(INIT_FILE),
              .SRVAL_A(SRVAL_A),
              .SRVAL_B(SRVAL_B),
              .READ_WIDTH_A(READ_WIDTH_A),
              .READ_WIDTH_B(READ_WIDTH_B),
              .WRITE_WIDTH_A(WRITE_WIDTH_A),
              .WRITE_WIDTH_B(WRITE_WIDTH_B),
              .WRITE_MODE_A(WRITE_MODE_A),
              .WRITE_MODE_B(WRITE_MODE_B),
              .RAM_EXTENSION_A(RAM_EXTENSION_A),
              .RAM_EXTENSION_B(RAM_EXTENSION_B),
              .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
              .SETUP_ALL(SETUP_ALL),
              .SETUP_READ_FIRST(SETUP_READ_FIRST),
              .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
              .SIM_DEVICE(SIM_DEVICE),
              .EN_ECC_READ(EN_ECC_READ),
              .EN_ECC_WRITE(EN_ECC_WRITE),
              .DOA_REG(DOA_REG),
              .DOB_REG(DOB_REG),
              .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
              .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
              .INIT_00(INIT_00),
              .INIT_01(INIT_01),
              .INIT_02(INIT_02),
              .INIT_03(INIT_03),
              .INIT_04(INIT_04),
              .INIT_05(INIT_05),
              .INIT_06(INIT_06),
              .INIT_07(INIT_07),
              .INIT_08(INIT_08),
              .INIT_09(INIT_09),
              .INIT_0A(INIT_0A),
              .INIT_0B(INIT_0B),
              .INIT_0C(INIT_0C),
              .INIT_0D(INIT_0D),
              .INIT_0E(INIT_0E),
              .INIT_0F(INIT_0F),
              .INIT_10(INIT_10),
              .INIT_11(INIT_11),
              .INIT_12(INIT_12),
              .INIT_13(INIT_13),
              .INIT_14(INIT_14),
              .INIT_15(INIT_15),
              .INIT_16(INIT_16),
              .INIT_17(INIT_17),
              .INIT_18(INIT_18),
              .INIT_19(INIT_19),
              .INIT_1A(INIT_1A),
              .INIT_1B(INIT_1B),
              .INIT_1C(INIT_1C),
              .INIT_1D(INIT_1D),
              .INIT_1E(INIT_1E),
              .INIT_1F(INIT_1F),
              .INIT_20(INIT_20),
              .INIT_21(INIT_21),
              .INIT_22(INIT_22),
              .INIT_23(INIT_23),
              .INIT_24(INIT_24),
              .INIT_25(INIT_25),
              .INIT_26(INIT_26),
              .INIT_27(INIT_27),
              .INIT_28(INIT_28),
              .INIT_29(INIT_29),
              .INIT_2A(INIT_2A),
              .INIT_2B(INIT_2B),
              .INIT_2C(INIT_2C),
              .INIT_2D(INIT_2D),
              .INIT_2E(INIT_2E),
              .INIT_2F(INIT_2F),
              .INIT_30(INIT_30),
              .INIT_31(INIT_31),
              .INIT_32(INIT_32),
              .INIT_33(INIT_33),
              .INIT_34(INIT_34),
              .INIT_35(INIT_35),
              .INIT_36(INIT_36),
              .INIT_37(INIT_37),
              .INIT_38(INIT_38),
              .INIT_39(INIT_39),
              .INIT_3A(INIT_3A),
              .INIT_3B(INIT_3B),
              .INIT_3C(INIT_3C),
              .INIT_3D(INIT_3D),
              .INIT_3E(INIT_3E),
              .INIT_3F(INIT_3F),
              .INIT_40(INIT_40),
              .INIT_41(INIT_41),
              .INIT_42(INIT_42),
              .INIT_43(INIT_43),
              .INIT_44(INIT_44),
              .INIT_45(INIT_45),
              .INIT_46(INIT_46),
              .INIT_47(INIT_47),
              .INIT_48(INIT_48),
              .INIT_49(INIT_49),
              .INIT_4A(INIT_4A),
              .INIT_4B(INIT_4B),
              .INIT_4C(INIT_4C),
              .INIT_4D(INIT_4D),
              .INIT_4E(INIT_4E),
              .INIT_4F(INIT_4F),
              .INIT_50(INIT_50),
              .INIT_51(INIT_51),
              .INIT_52(INIT_52),
              .INIT_53(INIT_53),
              .INIT_54(INIT_54),
              .INIT_55(INIT_55),
              .INIT_56(INIT_56),
              .INIT_57(INIT_57),
              .INIT_58(INIT_58),
              .INIT_59(INIT_59),
              .INIT_5A(INIT_5A),
              .INIT_5B(INIT_5B),
              .INIT_5C(INIT_5C),
              .INIT_5D(INIT_5D),
              .INIT_5E(INIT_5E),
              .INIT_5F(INIT_5F),
              .INIT_60(INIT_60),
              .INIT_61(INIT_61),
              .INIT_62(INIT_62),
              .INIT_63(INIT_63),
              .INIT_64(INIT_64),
              .INIT_65(INIT_65),
              .INIT_66(INIT_66),
              .INIT_67(INIT_67),
              .INIT_68(INIT_68),
              .INIT_69(INIT_69),
              .INIT_6A(INIT_6A),
              .INIT_6B(INIT_6B),
              .INIT_6C(INIT_6C),
              .INIT_6D(INIT_6D),
              .INIT_6E(INIT_6E),
              .INIT_6F(INIT_6F),
              .INIT_70(INIT_70),
              .INIT_71(INIT_71),
              .INIT_72(INIT_72),
              .INIT_73(INIT_73),
              .INIT_74(INIT_74),
              .INIT_75(INIT_75),
              .INIT_76(INIT_76),
              .INIT_77(INIT_77),
              .INIT_78(INIT_78),
              .INIT_79(INIT_79),
              .INIT_7A(INIT_7A),
              .INIT_7B(INIT_7B),
              .INIT_7C(INIT_7C),
              .INIT_7D(INIT_7D),
              .INIT_7E(INIT_7E),
              .INIT_7F(INIT_7F),
              .INITP_00(INITP_00),
              .INITP_01(INITP_01),
              .INITP_02(INITP_02),
              .INITP_03(INITP_03),
              .INITP_04(INITP_04),
              .INITP_05(INITP_05),
              .INITP_06(INITP_06),
              .INITP_07(INITP_07),
              .INITP_08(INITP_08),
              .INITP_09(INITP_09),
              .INITP_0A(INITP_0A),
              .INITP_0B(INITP_0B),
              .INITP_0C(INITP_0C),
              .INITP_0D(INITP_0D),
              .INITP_0E(INITP_0E),
              .INITP_0F(INITP_0F))
              INT_RAMB_TDP (.ADDRA(addrardaddr_in),
                  .ADDRB(addrbwraddr_in),
                  .CASCADEINA(cascadeina_in),
                  .CASCADEINB(cascadeinb_in),
                  .CASCADEOUTA(cascadeouta_wire),
                  .CASCADEOUTB(cascadeoutb_wire),
                  .CLKA(clkardclk_in),
                  .CLKB(clkbwrclk_in),
                  .DBITERR(DBITERR),
                  .DIA({32'b0,diadi_in}),
                  .DIB({32'b0,dibdi_in}),
                  .DIPA(dipadip_in),
                  .DIPB({4'b0,dipbdip_in}),
                  .DOA({dangle_out32,doado_wire}),
                  .DOB(dobdo_wire),
                  .DOPA({dangle_out4,dopadop_wire}),
                  .DOPB(dopbdop_wire),
                  .ECCPARITY(ECCPARITY),
                  .ENA(enarden_in),
                  .ENB(enbwren_in),
                  .GSR(GSR),
                  .INJECTDBITERR(1'b0),
                  .INJECTSBITERR(1'b0),
                  .RDADDRECC(RDADDRECC),
                  .REGCEA(regcearegce_in),
                  .REGCEB(regceb_in),
                  .RSTRAMA(rstramarstram_in),
                  .RSTRAMB(rstramb_in),
                  .RSTREGA(rstregarstreg_in),
                  .RSTREGB(rstregb_in),
                  .SBITERR(SBITERR),
                  .WEA({2{wea_in}}),
                  .WEB(webwe_in));
       end // case: "TDP"
       "SDP" : begin : gen_sdp
      if (WRITE_WIDTH_B == 72) begin : gen_wide
          RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
              .INIT_A(init_sdp),
              .INIT_B(init_sdp),
              .INIT_FILE(INIT_FILE),
              .SRVAL_A(srval_sdp),
              .SRVAL_B(srval_sdp),
              .READ_WIDTH_A(READ_WIDTH_A),
              .READ_WIDTH_B(READ_WIDTH_A),
              .WRITE_WIDTH_A(WRITE_WIDTH_B),
              .WRITE_WIDTH_B(WRITE_WIDTH_B),
              .WRITE_MODE_A(WRITE_MODE_A),
              .WRITE_MODE_B(WRITE_MODE_B),
              .RAM_EXTENSION_A(RAM_EXTENSION_A),
              .RAM_EXTENSION_B(RAM_EXTENSION_B),
              .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
              .SETUP_ALL(SETUP_ALL),
              .SETUP_READ_FIRST(SETUP_READ_FIRST),
              .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
              .SIM_DEVICE(SIM_DEVICE),
              .EN_ECC_READ(EN_ECC_READ),
              .EN_ECC_WRITE(EN_ECC_WRITE),
              .DOA_REG(DOA_REG),
              .DOB_REG(DOB_REG),
              .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
              .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
              .INIT_00(INIT_00),
              .INIT_01(INIT_01),
              .INIT_02(INIT_02),
              .INIT_03(INIT_03),
              .INIT_04(INIT_04),
              .INIT_05(INIT_05),
              .INIT_06(INIT_06),
              .INIT_07(INIT_07),
              .INIT_08(INIT_08),
              .INIT_09(INIT_09),
              .INIT_0A(INIT_0A),
              .INIT_0B(INIT_0B),
              .INIT_0C(INIT_0C),
              .INIT_0D(INIT_0D),
              .INIT_0E(INIT_0E),
              .INIT_0F(INIT_0F),
              .INIT_10(INIT_10),
              .INIT_11(INIT_11),
              .INIT_12(INIT_12),
              .INIT_13(INIT_13),
              .INIT_14(INIT_14),
              .INIT_15(INIT_15),
              .INIT_16(INIT_16),
              .INIT_17(INIT_17),
              .INIT_18(INIT_18),
              .INIT_19(INIT_19),
              .INIT_1A(INIT_1A),
              .INIT_1B(INIT_1B),
              .INIT_1C(INIT_1C),
              .INIT_1D(INIT_1D),
              .INIT_1E(INIT_1E),
              .INIT_1F(INIT_1F),
              .INIT_20(INIT_20),
              .INIT_21(INIT_21),
              .INIT_22(INIT_22),
              .INIT_23(INIT_23),
              .INIT_24(INIT_24),
              .INIT_25(INIT_25),
              .INIT_26(INIT_26),
              .INIT_27(INIT_27),
              .INIT_28(INIT_28),
              .INIT_29(INIT_29),
              .INIT_2A(INIT_2A),
              .INIT_2B(INIT_2B),
              .INIT_2C(INIT_2C),
              .INIT_2D(INIT_2D),
              .INIT_2E(INIT_2E),
              .INIT_2F(INIT_2F),
              .INIT_30(INIT_30),
              .INIT_31(INIT_31),
              .INIT_32(INIT_32),
              .INIT_33(INIT_33),
              .INIT_34(INIT_34),
              .INIT_35(INIT_35),
              .INIT_36(INIT_36),
              .INIT_37(INIT_37),
              .INIT_38(INIT_38),
              .INIT_39(INIT_39),
              .INIT_3A(INIT_3A),
              .INIT_3B(INIT_3B),
              .INIT_3C(INIT_3C),
              .INIT_3D(INIT_3D),
              .INIT_3E(INIT_3E),
              .INIT_3F(INIT_3F),
              .INIT_40(INIT_40),
              .INIT_41(INIT_41),
              .INIT_42(INIT_42),
              .INIT_43(INIT_43),
              .INIT_44(INIT_44),
              .INIT_45(INIT_45),
              .INIT_46(INIT_46),
              .INIT_47(INIT_47),
              .INIT_48(INIT_48),
              .INIT_49(INIT_49),
              .INIT_4A(INIT_4A),
              .INIT_4B(INIT_4B),
              .INIT_4C(INIT_4C),
              .INIT_4D(INIT_4D),
              .INIT_4E(INIT_4E),
              .INIT_4F(INIT_4F),
              .INIT_50(INIT_50),
              .INIT_51(INIT_51),
              .INIT_52(INIT_52),
              .INIT_53(INIT_53),
              .INIT_54(INIT_54),
              .INIT_55(INIT_55),
              .INIT_56(INIT_56),
              .INIT_57(INIT_57),
              .INIT_58(INIT_58),
              .INIT_59(INIT_59),
              .INIT_5A(INIT_5A),
              .INIT_5B(INIT_5B),
              .INIT_5C(INIT_5C),
              .INIT_5D(INIT_5D),
              .INIT_5E(INIT_5E),
              .INIT_5F(INIT_5F),
              .INIT_60(INIT_60),
              .INIT_61(INIT_61),
              .INIT_62(INIT_62),
              .INIT_63(INIT_63),
              .INIT_64(INIT_64),
              .INIT_65(INIT_65),
              .INIT_66(INIT_66),
              .INIT_67(INIT_67),
              .INIT_68(INIT_68),
              .INIT_69(INIT_69),
              .INIT_6A(INIT_6A),
              .INIT_6B(INIT_6B),
              .INIT_6C(INIT_6C),
              .INIT_6D(INIT_6D),
              .INIT_6E(INIT_6E),
              .INIT_6F(INIT_6F),
              .INIT_70(INIT_70),
              .INIT_71(INIT_71),
              .INIT_72(INIT_72),
              .INIT_73(INIT_73),
              .INIT_74(INIT_74),
              .INIT_75(INIT_75),
              .INIT_76(INIT_76),
              .INIT_77(INIT_77),
              .INIT_78(INIT_78),
              .INIT_79(INIT_79),
              .INIT_7A(INIT_7A),
              .INIT_7B(INIT_7B),
              .INIT_7C(INIT_7C),
              .INIT_7D(INIT_7D),
              .INIT_7E(INIT_7E),
              .INIT_7F(INIT_7F),
              .INITP_00(INITP_00),
              .INITP_01(INITP_01),
              .INITP_02(INITP_02),
              .INITP_03(INITP_03),
              .INITP_04(INITP_04),
              .INITP_05(INITP_05),
              .INITP_06(INITP_06),
              .INITP_07(INITP_07),
              .INITP_08(INITP_08),
              .INITP_09(INITP_09),
              .INITP_0A(INITP_0A),
              .INITP_0B(INITP_0B),
              .INITP_0C(INITP_0C),
              .INITP_0D(INITP_0D),
              .INITP_0E(INITP_0E),
              .INITP_0F(INITP_0F))
              INT_RAMB_SDP (.ADDRA(addrardaddr_in),
                  .ADDRB(addrbwraddr_in),
                  .CASCADEINA(cascadeina_in),
                  .CASCADEINB(cascadeinb_in),
                  .CASCADEOUTA(cascadeouta_wire),
                  .CASCADEOUTB(cascadeoutb_wire),
                  .CLKA(clkardclk_in),
                  .CLKB(clkbwrclk_in),
                  .DBITERR(DBITERR),
                  .DIA(64'b0),
                  .DIB({dibdi_in,diadi_in}),
                  .DIPA(4'b0),
                  .DIPB({dipbdip_in,dipadip_in}),
                  .DOA({dobdo_wire,doado_wire}),
                  .DOB(dangle_out32),
                  .DOPA({dopbdop_wire,dopadop_wire}),
                  .DOPB(dangle_out4),
                  .ECCPARITY(ECCPARITY),
                  .ENA(enarden_in),
                  .ENB(enbwren_in),
                  .GSR(GSR),
                  .INJECTDBITERR(injectdbiterr_in),
                  .INJECTSBITERR(injectsbiterr_in),
                  .RDADDRECC(RDADDRECC),
                  .REGCEA(regcearegce_in),
                  .REGCEB(regceb_in),
                  .RSTRAMA(rstramarstram_in),
                  .RSTRAMB(rstramb_in),
                  .RSTREGA(rstregarstreg_in),
                  .RSTREGB(rstregb_in),
                  .SBITERR(SBITERR),
                  .WEA(8'b0),
                  .WEB(webwe_in));
      end // if (WRITE_WIDTH_B == 72)
      else begin : gen_narrow
          RB36_INTERNAL_VLOG #(.RAM_MODE(RAM_MODE),
              .INIT_A(init_sdp),
              .INIT_B(init_sdp),
              .INIT_FILE(INIT_FILE),
              .SRVAL_A(srval_sdp),
              .SRVAL_B(srval_sdp),
              .READ_WIDTH_A(READ_WIDTH_A),
              .READ_WIDTH_B(READ_WIDTH_A),
              .WRITE_WIDTH_A(WRITE_WIDTH_B),
              .WRITE_WIDTH_B(WRITE_WIDTH_B),
              .WRITE_MODE_A(WRITE_MODE_A),
              .WRITE_MODE_B(WRITE_MODE_B),
              .RAM_EXTENSION_A(RAM_EXTENSION_A),
              .RAM_EXTENSION_B(RAM_EXTENSION_B),
              .RDADDR_COLLISION_HWCONFIG(RDADDR_COLLISION_HWCONFIG),
              .SETUP_ALL(SETUP_ALL),
              .SETUP_READ_FIRST(SETUP_READ_FIRST),
              .SIM_COLLISION_CHECK(SIM_COLLISION_CHECK),
              .SIM_DEVICE(SIM_DEVICE),
              .EN_ECC_READ(EN_ECC_READ),
              .EN_ECC_WRITE(EN_ECC_WRITE),
              .DOA_REG(DOA_REG),
              .DOB_REG(DOB_REG),
              .RSTREG_PRIORITY_A(RSTREG_PRIORITY_A),
              .RSTREG_PRIORITY_B(RSTREG_PRIORITY_B),
              .INIT_00(INIT_00),
              .INIT_01(INIT_01),
              .INIT_02(INIT_02),
              .INIT_03(INIT_03),
              .INIT_04(INIT_04),
              .INIT_05(INIT_05),
              .INIT_06(INIT_06),
              .INIT_07(INIT_07),
              .INIT_08(INIT_08),
              .INIT_09(INIT_09),
              .INIT_0A(INIT_0A),
              .INIT_0B(INIT_0B),
              .INIT_0C(INIT_0C),
              .INIT_0D(INIT_0D),
              .INIT_0E(INIT_0E),
              .INIT_0F(INIT_0F),
              .INIT_10(INIT_10),
              .INIT_11(INIT_11),
              .INIT_12(INIT_12),
              .INIT_13(INIT_13),
              .INIT_14(INIT_14),
              .INIT_15(INIT_15),
              .INIT_16(INIT_16),
              .INIT_17(INIT_17),
              .INIT_18(INIT_18),
              .INIT_19(INIT_19),
              .INIT_1A(INIT_1A),
              .INIT_1B(INIT_1B),
              .INIT_1C(INIT_1C),
              .INIT_1D(INIT_1D),
              .INIT_1E(INIT_1E),
              .INIT_1F(INIT_1F),
              .INIT_20(INIT_20),
              .INIT_21(INIT_21),
              .INIT_22(INIT_22),
              .INIT_23(INIT_23),
              .INIT_24(INIT_24),
              .INIT_25(INIT_25),
              .INIT_26(INIT_26),
              .INIT_27(INIT_27),
              .INIT_28(INIT_28),
              .INIT_29(INIT_29),
              .INIT_2A(INIT_2A),
              .INIT_2B(INIT_2B),
              .INIT_2C(INIT_2C),
              .INIT_2D(INIT_2D),
              .INIT_2E(INIT_2E),
              .INIT_2F(INIT_2F),
              .INIT_30(INIT_30),
              .INIT_31(INIT_31),
              .INIT_32(INIT_32),
              .INIT_33(INIT_33),
              .INIT_34(INIT_34),
              .INIT_35(INIT_35),
              .INIT_36(INIT_36),
              .INIT_37(INIT_37),
              .INIT_38(INIT_38),
              .INIT_39(INIT_39),
              .INIT_3A(INIT_3A),
              .INIT_3B(INIT_3B),
              .INIT_3C(INIT_3C),
              .INIT_3D(INIT_3D),
              .INIT_3E(INIT_3E),
              .INIT_3F(INIT_3F),
              .INIT_40(INIT_40),
              .INIT_41(INIT_41),
              .INIT_42(INIT_42),
              .INIT_43(INIT_43),
              .INIT_44(INIT_44),
              .INIT_45(INIT_45),
              .INIT_46(INIT_46),
              .INIT_47(INIT_47),
              .INIT_48(INIT_48),
              .INIT_49(INIT_49),
              .INIT_4A(INIT_4A),
              .INIT_4B(INIT_4B),
              .INIT_4C(INIT_4C),
              .INIT_4D(INIT_4D),
              .INIT_4E(INIT_4E),
              .INIT_4F(INIT_4F),
              .INIT_50(INIT_50),
              .INIT_51(INIT_51),
              .INIT_52(INIT_52),
              .INIT_53(INIT_53),
              .INIT_54(INIT_54),
              .INIT_55(INIT_55),
              .INIT_56(INIT_56),
              .INIT_57(INIT_57),
              .INIT_58(INIT_58),
              .INIT_59(INIT_59),
              .INIT_5A(INIT_5A),
              .INIT_5B(INIT_5B),
              .INIT_5C(INIT_5C),
              .INIT_5D(INIT_5D),
              .INIT_5E(INIT_5E),
              .INIT_5F(INIT_5F),
              .INIT_60(INIT_60),
              .INIT_61(INIT_61),
              .INIT_62(INIT_62),
              .INIT_63(INIT_63),
              .INIT_64(INIT_64),
              .INIT_65(INIT_65),
              .INIT_66(INIT_66),
              .INIT_67(INIT_67),
              .INIT_68(INIT_68),
              .INIT_69(INIT_69),
              .INIT_6A(INIT_6A),
              .INIT_6B(INIT_6B),
              .INIT_6C(INIT_6C),
              .INIT_6D(INIT_6D),
              .INIT_6E(INIT_6E),
              .INIT_6F(INIT_6F),
              .INIT_70(INIT_70),
              .INIT_71(INIT_71),
              .INIT_72(INIT_72),
              .INIT_73(INIT_73),
              .INIT_74(INIT_74),
              .INIT_75(INIT_75),
              .INIT_76(INIT_76),
              .INIT_77(INIT_77),
              .INIT_78(INIT_78),
              .INIT_79(INIT_79),
              .INIT_7A(INIT_7A),
              .INIT_7B(INIT_7B),
              .INIT_7C(INIT_7C),
              .INIT_7D(INIT_7D),
              .INIT_7E(INIT_7E),
              .INIT_7F(INIT_7F),
              .INITP_00(INITP_00),
              .INITP_01(INITP_01),
              .INITP_02(INITP_02),
              .INITP_03(INITP_03),
              .INITP_04(INITP_04),
              .INITP_05(INITP_05),
              .INITP_06(INITP_06),
              .INITP_07(INITP_07),
              .INITP_08(INITP_08),
              .INITP_09(INITP_09),
              .INITP_0A(INITP_0A),
              .INITP_0B(INITP_0B),
              .INITP_0C(INITP_0C),
              .INITP_0D(INITP_0D),
              .INITP_0E(INITP_0E),
              .INITP_0F(INITP_0F))
              INT_RAMB_SDP (.ADDRA(addrardaddr_in),
                  .ADDRB(addrbwraddr_in),
                  .CASCADEINA(cascadeina_in),
                  .CASCADEINB(cascadeinb_in),
                  .CASCADEOUTA(cascadeouta_wire),
                  .CASCADEOUTB(cascadeoutb_wire),
                  .CLKA(clkardclk_in),
                  .CLKB(clkbwrclk_in),
                  .DBITERR(DBITERR),
                  .DIA(64'b0),
                  .DIB({32'b0,dibdi_in}),
                  .DIPA(4'b0),
                  .DIPB({4'b0,dipbdip_in}),
                  .DOA({dobdo_wire,doado_wire}),
                  .DOB(dangle_out32),
                  .DOPA({dopbdop_wire,dopadop_wire}),
                  .DOPB(dangle_out4),
                  .ECCPARITY(ECCPARITY),
                  .ENA(enarden_in),
                  .ENB(enbwren_in),
                  .GSR(GSR),
                  .INJECTDBITERR(injectdbiterr_in),
                  .INJECTSBITERR(injectsbiterr_in),
                  .RDADDRECC(RDADDRECC),
                  .REGCEA(regcearegce_in),
                  .REGCEB(regceb_in),
                  .RSTRAMA(rstramarstram_in),
                  .RSTRAMB(rstramb_in),
                  .RSTREGA(rstregarstreg_in),
                  .RSTREGB(rstregb_in),
                  .SBITERR(SBITERR),
                  .WEA(8'b0),
                  .WEB(webwe_in));
      end // else: !if(WRITE_WIDTH_B == 72)
       end // case: "SDP"
   endcase // case(RAM_MODE)
    endgenerate
    reg CASCADEOUTA_out;
    reg CASCADEOUTB_out;
    reg [31:0] DOADO_out;
    reg [31:0] DOBDO_out;
    reg [3:0] DOPADOP_out;
    reg [3:0] DOPBDOP_out;
    assign CASCADEOUTA = CASCADEOUTA_out;
    assign CASCADEOUTB = CASCADEOUTB_out;
    assign DOADO = DOADO_out;
    assign DOBDO = DOBDO_out;
    assign DOPADOP = DOPADOP_out;
    assign DOPBDOP = DOPBDOP_out;
    always @(doado_wire or rstramb_in or GSR) DOADO_out = doado_wire;
    always @(dobdo_wire or rstramb_in or GSR) DOBDO_out = dobdo_wire;
    always @(dopadop_wire or rstramb_in or GSR) DOPADOP_out = dopadop_wire;
    always @(dopbdop_wire or rstramb_in or GSR) DOPBDOP_out = dopbdop_wire;
    always @(cascadeouta_wire or rstramb_in or GSR) CASCADEOUTA_out = cascadeouta_wire;
    always @(cascadeoutb_wire or rstramb_in or GSR) CASCADEOUTB_out = cascadeoutb_wire;
`ifdef XIL_TIMING
   wire clkardclk_en_n;
   wire clkardclk_en_p;
   wire clkbwrclk_en_n;
   wire clkbwrclk_en_p;
   assign clkardclk_en_n =  IS_CLKARDCLK_INVERTED;
   assign clkardclk_en_p = ~IS_CLKARDCLK_INVERTED;
   assign clkbwrclk_en_n =  IS_CLKBWRCLK_INVERTED;
   assign clkbwrclk_en_p = ~IS_CLKBWRCLK_INVERTED;
   wire enarden_clka_n = enarden_in && clkardclk_en_n;
   wire enarden_clka_p = enarden_in && clkardclk_en_p;
   wire enbwren_clkb_n = enbwren_in && clkbwrclk_en_n;
   wire enbwren_clkb_p = enbwren_in && clkbwrclk_en_p;
   wire diadi0_enable_n = (RAM_MODE == "TDP") && enarden_in && wea_in[0] && clkardclk_en_n;
   wire diadi0_enable_p = (RAM_MODE == "TDP") && enarden_in && wea_in[0] && clkardclk_en_p;
   wire dibdi0_enable_n = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[0] && clkbwrclk_en_n) : (enbwren_in && webwe_in[4] && clkbwrclk_en_n) ;
   wire dibdi0_enable_p = (RAM_MODE == "TDP") ? (enbwren_in && webwe_in[0] && clkbwrclk_en_p) : (enbwren_in && webwe_in[4] && clkbwrclk_en_p) ;
   wire sdp_dia0_clkwr_n = (RAM_MODE == "SDP") && enbwren_in && webwe_in[0] && clkbwrclk_en_n;
   wire sdp_dia0_clkwr_p = (RAM_MODE == "SDP") && enbwren_in && webwe_in[0] && clkbwrclk_en_p;
   always @(notifier or notifier_a or notifier_addra0 or notifier_addra1 or notifier_addra2 or notifier_addra3 or notifier_addra4 or notifier_addra5 or notifier_addra6 or notifier_addra7 or notifier_addra8 or notifier_addra9 or notifier_addra10 or notifier_addra11 or notifier_addra12 or notifier_addra13 or notifier_addra14 or notifier_addra15) begin
      doado_out <= 32'hxxxxxxxx;
      dopadop_out <= 4'hx;
      cascadeouta_out <= 1'bx;
   end
   always @(notifier or notifier_b or notifier_addrb0 or notifier_addrb1 or notifier_addrb2 or notifier_addrb3 or notifier_addrb4 or notifier_addrb5 or notifier_addrb6 or notifier_addrb7 or notifier_addrb8 or notifier_addrb9 or notifier_addrb10 or notifier_addrb11 or notifier_addrb12 or notifier_addrb13 or notifier_addrb14 or notifier_addrb15) begin
      dobdo_out <= 32'hxxxxxxxx;
      dopbdop_out <= 4'hx;
      cascadeoutb_out <= 1'bx;
      if (RAM_MODE == "SDP") begin
    doado_out <= 32'hxxxxxxxx;
    dopadop_out <= 4'hx;
    cascadeouta_out <= 1'bx;
      end
   end
    always @(notifier_addra0) begin
   task_warn_msg ("ADDRARDADDR[0]", "CLKARDCLK");
    end
    always @(notifier_addra1) begin
   task_warn_msg ("ADDRARDADDR[1]", "CLKARDCLK");
    end
    always @(notifier_addra2) begin
   task_warn_msg ("ADDRARDADDR[2]", "CLKARDCLK");
    end
    always @(notifier_addra3) begin
   task_warn_msg ("ADDRARDADDR[3]", "CLKARDCLK");
    end
    always @(notifier_addra4) begin
   task_warn_msg ("ADDRARDADDR[4]", "CLKARDCLK");
    end
    always @(notifier_addra5) begin
   task_warn_msg ("ADDRARDADDR[5]", "CLKARDCLK");
    end
    always @(notifier_addra6) begin
   task_warn_msg ("ADDRARDADDR[6]", "CLKARDCLK");
    end
    always @(notifier_addra7) begin
   task_warn_msg ("ADDRARDADDR[7]", "CLKARDCLK");
    end
    always @(notifier_addra8) begin
   task_warn_msg ("ADDRARDADDR[8]", "CLKARDCLK");
    end
    always @(notifier_addra9) begin
   task_warn_msg ("ADDRARDADDR[9]", "CLKARDCLK");
    end
    always @(notifier_addra10) begin
   task_warn_msg ("ADDRARDADDR[10]", "CLKARDCLK");
    end
    always @(notifier_addra11) begin
   task_warn_msg ("ADDRARDADDR[11]", "CLKARDCLK");
    end
     always @(notifier_addra12) begin
   task_warn_msg ("ADDRARDADDR[12]", "CLKARDCLK");
    end
    always @(notifier_addra13) begin
   task_warn_msg ("ADDRARDADDR[13]", "CLKARDCLK");
    end
    always @(notifier_addra14) begin
   task_warn_msg ("ADDRARDADDR[14]", "CLKARDCLK");
    end
    always @(notifier_addra15) begin
   task_warn_msg ("ADDRARDADDR[15]", "CLKARDCLK");
    end
    always @(notifier_addrb0) begin
   task_warn_msg ("ADDRBWRADDR[0]", "CLKBWRCLK");
    end
    always @(notifier_addrb1) begin
   task_warn_msg ("ADDRBWRADDR[1]", "CLKBWRCLK");
    end
    always @(notifier_addrb2) begin
   task_warn_msg ("ADDRBWRADDR[2]", "CLKBWRCLK");
    end
    always @(notifier_addrb3) begin
   task_warn_msg ("ADDRBWRADDR[3]", "CLKBWRCLK");
    end
    always @(notifier_addrb4) begin
   task_warn_msg ("ADDRBWRADDR[4]", "CLKBWRCLK");
    end
    always @(notifier_addrb5) begin
   task_warn_msg ("ADDRBWRADDR[5]", "CLKBWRCLK");
    end
    always @(notifier_addrb6) begin
   task_warn_msg ("ADDRBWRADDR[6]", "CLKBWRCLK");
    end
    always @(notifier_addrb7) begin
   task_warn_msg ("ADDRBWRADDR[7]", "CLKBWRCLK");
    end
    always @(notifier_addrb8) begin
   task_warn_msg ("ADDRBWRADDR[8]", "CLKBWRCLK");
    end
    always @(notifier_addrb9) begin
   task_warn_msg ("ADDRBWRADDR[9]", "CLKBWRCLK");
    end
    always @(notifier_addrb10) begin
   task_warn_msg ("ADDRBWRADDR[10]", "CLKBWRCLK");
    end
    always @(notifier_addrb11) begin
   task_warn_msg ("ADDRBWRADDR[11]", "CLKBWRCLK");
    end
     always @(notifier_addrb12) begin
   task_warn_msg ("ADDRBWRADDR[12]", "CLKBWRCLK");
    end
    always @(notifier_addrb13) begin
   task_warn_msg ("ADDRBWRADDR[13]", "CLKBWRCLK");
    end
    always @(notifier_addrb14) begin
   task_warn_msg ("ADDRBWRADDR[14]", "CLKBWRCLK");
    end
    always @(notifier_addrb15) begin
   task_warn_msg ("ADDRBWRADDR[15]", "CLKBWRCLK");
    end
    task task_warn_msg;
        input [8*15:1] addr_str;
   input [8*9:1] clk_str;
   begin
       $display("Error: Setup/Hold Violation on %s with respect to %s when memory has been enabled. The memory contents at %s of the RAM can be corrupted. This corruption is not modeled in this simulation model. Please take the necessary steps to recover from this data corruption in hardware.", addr_str, clk_str, addr_str);
   end
    endtask // task_warn_msg
`endif //  `ifdef XIL_TIMING
    wire ram_mode_wire = (RAM_MODE == "TDP") ? 1 : 0;
`ifdef XIL_TIMING
    wire ram_extension_a_wire = (RAM_EXTENSION_A == "UPPER") ? 1 : 0;
    wire ram_extension_b_wire = (RAM_EXTENSION_B == "UPPER") ? 1 : 0;
`endif //  `ifdef XIL_TIMING
    specify
        (CASCADEINA *> DOADO) = (0:0:0, 0:0:0);
        (CASCADEINB *> DOBDO) = (0:0:0, 0:0:0);
        (CLKARDCLK *> DOADO) = (100:100:100, 100:100:100);
        (CLKARDCLK *> DOPADOP) = (100:100:100, 100:100:100);
        (CLKARDCLK *> RDADDRECC) = (100:100:100, 100:100:100);
        (CLKARDCLK => DBITERR) = (100:100:100, 100:100:100);
        (CLKARDCLK => SBITERR) = (100:100:100, 100:100:100);
          (CLKARDCLK => CASCADEOUTA) = (100:100:100, 100:100:100);
   if (ram_mode_wire == 0) (CLKARDCLK *> DOBDO) = (100:100:100, 100:100:100);
        if (ram_mode_wire == 0) (CLKARDCLK *> DOPBDOP) = (100:100:100, 100:100:100);
        if (ram_mode_wire == 1) (CLKBWRCLK *> DOBDO) = (100:100:100, 100:100:100);
        if (ram_mode_wire == 1) (CLKBWRCLK *> DOPBDOP) = (100:100:100, 100:100:100);
   (CLKBWRCLK *> ECCPARITY) = (100:100:100, 100:100:100);
   (CLKBWRCLK => CASCADEOUTB) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
   if (ram_extension_a_wire == 1) (CASCADEINA => DOADO[0]) = (0:0:0, 0:0:0);
   if (ram_extension_b_wire == 1) (CASCADEINB => DOBDO[0]) = (0:0:0, 0:0:0);
   $setuphold (posedge CLKARDCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier_addra0, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, ADDRARDADDR_delay);
          $setuphold (posedge CLKARDCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier_addra0, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, ADDRARDADDR_delay);
          $setuphold (posedge CLKARDCLK, posedge DIADI, 0:0:0, 0:0:0, notifier_a, diadi0_enable_p, diadi0_enable_p, CLKARDCLK_delay, DIADI_delay);
          $setuphold (posedge CLKARDCLK, negedge DIADI, 0:0:0, 0:0:0, notifier_a, diadi0_enable_p, diadi0_enable_p, CLKARDCLK_delay, DIADI_delay);
          $setuphold (posedge CLKARDCLK, posedge DIPADIP, 0:0:0, 0:0:0, notifier_a, diadi0_enable_p, diadi0_enable_p, CLKARDCLK_delay, DIPADIP_delay);
          $setuphold (posedge CLKARDCLK, negedge DIPADIP, 0:0:0, 0:0:0, notifier_a, diadi0_enable_p, diadi0_enable_p, CLKARDCLK_delay, DIPADIP_delay);
   $setuphold (posedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, ENARDEN_delay);
          $setuphold (posedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, ENARDEN_delay);
          $setuphold (posedge CLKARDCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier_a, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
          $setuphold (posedge CLKARDCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier_a, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
   $setuphold (posedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, RSTREGARSTREG_delay);
          $setuphold (posedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, RSTREGARSTREG_delay);
   $setuphold (posedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, REGCEAREGCE_delay);
          $setuphold (posedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a, clkardclk_en_p, clkardclk_en_p, CLKARDCLK_delay, REGCEAREGCE_delay);
          $setuphold (posedge CLKARDCLK, posedge WEA, 0:0:0, 0:0:0, notifier_a, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, WEA_delay);
          $setuphold (posedge CLKARDCLK, negedge WEA, 0:0:0, 0:0:0, notifier_a, enarden_clka_p, enarden_clka_p, CLKARDCLK_delay, WEA_delay);
   $setuphold (posedge CLKBWRCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier_addrb0, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, ADDRBWRADDR_delay);
          $setuphold (posedge CLKBWRCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier_addrb0, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, ADDRBWRADDR_delay);
          $setuphold (posedge CLKBWRCLK, posedge DIADI, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_p, sdp_dia0_clkwr_p, CLKBWRCLK_delay, DIADI_delay);
   $setuphold (posedge CLKBWRCLK, negedge DIADI, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_p, sdp_dia0_clkwr_p, CLKBWRCLK_delay, DIADI_delay);
          $setuphold (posedge CLKBWRCLK, posedge DIPADIP, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_p, sdp_dia0_clkwr_p, CLKBWRCLK_delay, DIPADIP_delay);
          $setuphold (posedge CLKBWRCLK, negedge DIPADIP, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_p, sdp_dia0_clkwr_p, CLKBWRCLK_delay, DIPADIP_delay);
   $setuphold (posedge CLKBWRCLK, posedge DIBDI, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_p, dibdi0_enable_p, CLKBWRCLK_delay, DIBDI_delay);
   $setuphold (posedge CLKBWRCLK, negedge DIBDI, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_p, dibdi0_enable_p, CLKBWRCLK_delay, DIBDI_delay);
          $setuphold (posedge CLKBWRCLK, posedge DIPBDIP, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_p, dibdi0_enable_p, CLKBWRCLK_delay, DIPBDIP_delay);
          $setuphold (posedge CLKBWRCLK, negedge DIPBDIP, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_p, dibdi0_enable_p, CLKBWRCLK_delay, DIPBDIP_delay);
   $setuphold (posedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, ENBWREN_delay);
          $setuphold (posedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, ENBWREN_delay);
   $setuphold (posedge CLKBWRCLK, posedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, INJECTDBITERR_delay);
   $setuphold (posedge CLKBWRCLK, negedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, INJECTDBITERR_delay);
   $setuphold (posedge CLKBWRCLK, posedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, INJECTSBITERR_delay);
   $setuphold (posedge CLKBWRCLK, negedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, INJECTSBITERR_delay);
   $setuphold (posedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, REGCEB_delay);
          $setuphold (posedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, REGCEB_delay);
          $setuphold (posedge CLKBWRCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, RSTRAMB_delay);
          $setuphold (posedge CLKBWRCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, RSTRAMB_delay);
   $setuphold (posedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, RSTREGB_delay);
          $setuphold (posedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_p, clkbwrclk_en_p, CLKBWRCLK_delay, RSTREGB_delay);
          $setuphold (posedge CLKBWRCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, WEBWE_delay);
          $setuphold (posedge CLKBWRCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_p, enbwren_clkb_p, CLKBWRCLK_delay, WEBWE_delay);
   $setuphold (negedge CLKARDCLK, posedge ADDRARDADDR, 0:0:0, 0:0:0, notifier_addra0, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, ADDRARDADDR_delay);
          $setuphold (negedge CLKARDCLK, negedge ADDRARDADDR, 0:0:0, 0:0:0, notifier_addra0, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, ADDRARDADDR_delay);
          $setuphold (negedge CLKARDCLK, posedge DIADI, 0:0:0, 0:0:0, notifier_a, diadi0_enable_n, diadi0_enable_n, CLKARDCLK_delay, DIADI_delay);
          $setuphold (negedge CLKARDCLK, negedge DIADI, 0:0:0, 0:0:0, notifier_a, diadi0_enable_n, diadi0_enable_n, CLKARDCLK_delay, DIADI_delay);
          $setuphold (negedge CLKARDCLK, posedge DIPADIP, 0:0:0, 0:0:0, notifier_a, diadi0_enable_n, diadi0_enable_n, CLKARDCLK_delay, DIPADIP_delay);
          $setuphold (negedge CLKARDCLK, negedge DIPADIP, 0:0:0, 0:0:0, notifier_a, diadi0_enable_n, diadi0_enable_n, CLKARDCLK_delay, DIPADIP_delay);
   $setuphold (negedge CLKARDCLK, posedge ENARDEN, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, ENARDEN_delay);
          $setuphold (negedge CLKARDCLK, negedge ENARDEN, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, ENARDEN_delay);
          $setuphold (negedge CLKARDCLK, posedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier_a, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
          $setuphold (negedge CLKARDCLK, negedge RSTRAMARSTRAM, 0:0:0, 0:0:0, notifier_a, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, RSTRAMARSTRAM_delay);
   $setuphold (negedge CLKARDCLK, posedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, RSTREGARSTREG_delay);
          $setuphold (negedge CLKARDCLK, negedge RSTREGARSTREG, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, RSTREGARSTREG_delay);
   $setuphold (negedge CLKARDCLK, posedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, REGCEAREGCE_delay);
          $setuphold (negedge CLKARDCLK, negedge REGCEAREGCE, 0:0:0, 0:0:0, notifier_a, clkardclk_en_n, clkardclk_en_n, CLKARDCLK_delay, REGCEAREGCE_delay);
          $setuphold (negedge CLKARDCLK, posedge WEA, 0:0:0, 0:0:0, notifier_a, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, WEA_delay);
          $setuphold (negedge CLKARDCLK, negedge WEA, 0:0:0, 0:0:0, notifier_a, enarden_clka_n, enarden_clka_n, CLKARDCLK_delay, WEA_delay);
   $setuphold (negedge CLKBWRCLK, posedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier_addrb0, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, ADDRBWRADDR_delay);
          $setuphold (negedge CLKBWRCLK, negedge ADDRBWRADDR, 0:0:0, 0:0:0, notifier_addrb0, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, ADDRBWRADDR_delay);
          $setuphold (negedge CLKBWRCLK, posedge DIADI, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_n, sdp_dia0_clkwr_n, CLKBWRCLK_delay, DIADI_delay);
   $setuphold (negedge CLKBWRCLK, negedge DIADI, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_n, sdp_dia0_clkwr_n, CLKBWRCLK_delay, DIADI_delay);
          $setuphold (negedge CLKBWRCLK, posedge DIPADIP, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_n, sdp_dia0_clkwr_n, CLKBWRCLK_delay, DIPADIP_delay);
          $setuphold (negedge CLKBWRCLK, negedge DIPADIP, 0:0:0, 0:0:0, notifier_b, sdp_dia0_clkwr_n, sdp_dia0_clkwr_n, CLKBWRCLK_delay, DIPADIP_delay);
   $setuphold (negedge CLKBWRCLK, posedge DIBDI, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_n, dibdi0_enable_n, CLKBWRCLK_delay, DIBDI_delay);
   $setuphold (negedge CLKBWRCLK, negedge DIBDI, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_n, dibdi0_enable_n, CLKBWRCLK_delay, DIBDI_delay);
          $setuphold (negedge CLKBWRCLK, posedge DIPBDIP, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_n, dibdi0_enable_n, CLKBWRCLK_delay, DIPBDIP_delay);
          $setuphold (negedge CLKBWRCLK, negedge DIPBDIP, 0:0:0, 0:0:0, notifier_b, dibdi0_enable_n, dibdi0_enable_n, CLKBWRCLK_delay, DIPBDIP_delay);
   $setuphold (negedge CLKBWRCLK, posedge ENBWREN, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, ENBWREN_delay);
          $setuphold (negedge CLKBWRCLK, negedge ENBWREN, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, ENBWREN_delay);
   $setuphold (negedge CLKBWRCLK, posedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, INJECTDBITERR_delay);
   $setuphold (negedge CLKBWRCLK, negedge INJECTDBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, INJECTDBITERR_delay);
   $setuphold (negedge CLKBWRCLK, posedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, INJECTSBITERR_delay);
   $setuphold (negedge CLKBWRCLK, negedge INJECTSBITERR, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, INJECTSBITERR_delay);
   $setuphold (negedge CLKBWRCLK, posedge REGCEB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, REGCEB_delay);
          $setuphold (negedge CLKBWRCLK, negedge REGCEB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, REGCEB_delay);
          $setuphold (negedge CLKBWRCLK, posedge RSTRAMB, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, RSTRAMB_delay);
          $setuphold (negedge CLKBWRCLK, negedge RSTRAMB, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, RSTRAMB_delay);
   $setuphold (negedge CLKBWRCLK, posedge RSTREGB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, RSTREGB_delay);
          $setuphold (negedge CLKBWRCLK, negedge RSTREGB, 0:0:0, 0:0:0, notifier_b, clkbwrclk_en_n, clkbwrclk_en_n, CLKBWRCLK_delay, RSTREGB_delay);
          $setuphold (negedge CLKBWRCLK, posedge WEBWE, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, WEBWE_delay);
          $setuphold (negedge CLKBWRCLK, negedge WEBWE, 0:0:0, 0:0:0, notifier_b, enbwren_clkb_n, enbwren_clkb_n, CLKBWRCLK_delay, WEBWE_delay);
        $period (negedge CLKARDCLK, 0:0:0, notifier_a);
        $period (negedge CLKBWRCLK, 0:0:0, notifier_b);
   $period (posedge CLKARDCLK, 0:0:0, notifier_a);
   $period (posedge CLKBWRCLK, 0:0:0, notifier_b);
   $width (posedge CLKARDCLK &&& ENARDEN, 0:0:0, 0, notifier_a);
        $width (negedge CLKARDCLK &&& ENARDEN, 0:0:0, 0, notifier_a);
        $width (posedge CLKBWRCLK &&& ENBWREN, 0:0:0, 0, notifier_b);
        $width (negedge CLKBWRCLK &&& ENBWREN, 0:0:0, 0, notifier_b);
`endif //  `ifdef XIL_TIMING
   specparam PATHPULSE$ = 0;
    endspecify
endmodule