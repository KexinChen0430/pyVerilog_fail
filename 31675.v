module FB_MULT_ADD(A_IN,
                   B_IN,
                   CEMULTCARRYIN_IN,
                   CLK_IN,
                   C_IN,
                   P_OUT);
    input [20:0] A_IN;
    input [12:0] B_IN;
    input CEMULTCARRYIN_IN;
    input CLK_IN;
    input [47:0] C_IN;
   output [47:0] P_OUT;
   wire GND_ALUMODE;
   wire [2:0] GND_BUS_3;
   wire [17:0] GND_BUS_18;
   wire [29:0] GND_BUS_30;
   wire [47:0] GND_BUS_48;
   wire GND_OPMODE;
   wire VCC_OPMODE;
   assign GND_ALUMODE = 0;
   assign GND_BUS_3 = 3'b000;
   assign GND_BUS_18 = 18'b000000000000000000;
   assign GND_BUS_30 = 30'b000000000000000000000000000000;
   assign GND_BUS_48 = 48'b000000000000000000000000000000000000000000000000;
   assign GND_OPMODE = 0;
   assign VCC_OPMODE = 1;
   DSP48E DSP48E_INST (.A({A_IN[20:20], A_IN[20:20], A_IN[20:20], A_IN[20:20],
         A_IN[20:20], A_IN[20:20], A_IN[20:20], A_IN[20:20], A_IN[20:20],
         A_IN[20:0]}),
                       .ACIN(GND_BUS_30[29:0]),
                       .ALUMODE({GND_ALUMODE, GND_ALUMODE, GND_ALUMODE,
         GND_ALUMODE}),
                       .B({B_IN[12:12], B_IN[12:12], B_IN[12:12], B_IN[12:12],
         B_IN[12:12], B_IN[12:0]}),
                       .BCIN(GND_BUS_18[17:0]),
                       .C(C_IN[47:0]),
                       .CARRYCASCIN(GND_ALUMODE),
                       .CARRYIN(GND_ALUMODE),
                       .CARRYINSEL(GND_BUS_3[2:0]),
                       .CEALUMODE(VCC_OPMODE),
                       .CEA1(VCC_OPMODE),
                       .CEA2(VCC_OPMODE),
                       .CEB1(VCC_OPMODE),
                       .CEB2(VCC_OPMODE),
                       .CEC(VCC_OPMODE),
                       .CECARRYIN(VCC_OPMODE),
                       .CECTRL(VCC_OPMODE),
                       .CEM(VCC_OPMODE),
                       .CEMULTCARRYIN(CEMULTCARRYIN_IN),
                       .CEP(VCC_OPMODE),
                       .CLK(CLK_IN),
                       .MULTSIGNIN(GND_ALUMODE),
                       .OPMODE({GND_OPMODE, VCC_OPMODE, VCC_OPMODE, GND_OPMODE,
         VCC_OPMODE, GND_OPMODE, VCC_OPMODE}),
                       .PCIN(GND_BUS_48[47:0]),
                       .RSTA(GND_ALUMODE),
                       .RSTALLCARRYIN(GND_ALUMODE),
                       .RSTALUMODE(GND_ALUMODE),
                       .RSTB(GND_ALUMODE),
                       .RSTC(GND_ALUMODE),
                       .RSTCTRL(GND_ALUMODE),
                       .RSTM(GND_ALUMODE),
                       .RSTP(GND_ALUMODE),
                       .ACOUT(),
                       .BCOUT(),
                       .CARRYCASCOUT(),
                       .CARRYOUT(),
                       .MULTSIGNOUT(),
                       .OVERFLOW(),
                       .P(P_OUT[47:0]),
                       .PATTERNBDETECT(),
                       .PATTERNDETECT(),
                       .PCOUT(),
                       .UNDERFLOW());
   defparam DSP48E_INST.ACASCREG = 1;
   defparam DSP48E_INST.ALUMODEREG = 0;
   defparam DSP48E_INST.AREG = 1;
   defparam DSP48E_INST.AUTORESET_PATTERN_DETECT = "FALSE";
   defparam DSP48E_INST.AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
   defparam DSP48E_INST.A_INPUT = "DIRECT";
   defparam DSP48E_INST.BCASCREG = 1;
   defparam DSP48E_INST.BREG = 1;
   defparam DSP48E_INST.B_INPUT = "DIRECT";
   defparam DSP48E_INST.CARRYINREG = 0;
   defparam DSP48E_INST.CARRYINSELREG = 0;
   defparam DSP48E_INST.CREG = 1;
   defparam DSP48E_INST.MASK = 48'h3FFFFFFFFFFF;
   defparam DSP48E_INST.MREG = 1;
   defparam DSP48E_INST.MULTCARRYINREG = 1;
   defparam DSP48E_INST.OPMODEREG = 0;
   defparam DSP48E_INST.PATTERN = 48'h000000000000;
   defparam DSP48E_INST.PREG = 1;
   defparam DSP48E_INST.SEL_MASK = "MASK";
   defparam DSP48E_INST.SEL_PATTERN = "PATTERN";
   defparam DSP48E_INST.SEL_ROUNDING_MASK = "SEL_MASK";
   defparam DSP48E_INST.USE_MULT = "MULT_S";
   defparam DSP48E_INST.USE_PATTERN_DETECT = "NO_PATDET";
   defparam DSP48E_INST.USE_SIMD = "ONE48";
endmodule