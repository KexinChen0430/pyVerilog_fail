module test_fifodc (Data, WrClock, RdClock, WrEn, RdEn, Reset, RPReset,
    Q, Empty, Full, AlmostEmpty, AlmostFull)/* synthesis NGD_DRC_MASK=1 */;
    input wire [11:0] Data;
    input wire WrClock;
    input wire RdClock;
    input wire WrEn;
    input wire RdEn;
    input wire Reset;
    input wire RPReset;
    output wire [11:0] Q;
    output wire Empty;
    output wire Full;
    output wire AlmostEmpty;
    output wire AlmostFull;
    wire scuba_vhi;
    wire Empty_int;
    wire Full_int;
    wire scuba_vlo;
    defparam test_fifodc_0_11.FULLPOINTER1 = "0b01111111111111" ;
    defparam test_fifodc_0_11.FULLPOINTER = "0b10000000000000" ;
    defparam test_fifodc_0_11.AFPOINTER1 = "0b00011111111111" ;
    defparam test_fifodc_0_11.AFPOINTER = "0b00100000000000" ;
    defparam test_fifodc_0_11.AEPOINTER1 = "0b00000000001011" ;
    defparam test_fifodc_0_11.AEPOINTER = "0b00000000001010" ;
    defparam test_fifodc_0_11.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_0_11.GSR = "DISABLED" ;
    defparam test_fifodc_0_11.RESETMODE = "ASYNC" ;
    defparam test_fifodc_0_11.REGMODE = "NOREG" ;
    defparam test_fifodc_0_11.CSDECODE_R = "0b11" ;
    defparam test_fifodc_0_11.CSDECODE_W = "0b11" ;
    defparam test_fifodc_0_11.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_0_11.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_0_11 (.DI0(scuba_vlo), .DI1(Data[0]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[0]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[0]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(Empty_int), .AEF(AlmostEmpty), .AFF(AlmostFull), .FF(Full_int));
    defparam test_fifodc_1_10.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_1_10.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_1_10.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_1_10.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_1_10.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_1_10.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_1_10.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_1_10.GSR = "DISABLED" ;
    defparam test_fifodc_1_10.RESETMODE = "ASYNC" ;
    defparam test_fifodc_1_10.REGMODE = "NOREG" ;
    defparam test_fifodc_1_10.CSDECODE_R = "0b11" ;
    defparam test_fifodc_1_10.CSDECODE_W = "0b11" ;
    defparam test_fifodc_1_10.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_1_10.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_1_10 (.DI0(scuba_vlo), .DI1(Data[1]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[1]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[1]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_2_9.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_2_9.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_2_9.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_2_9.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_2_9.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_2_9.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_2_9.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_2_9.GSR = "DISABLED" ;
    defparam test_fifodc_2_9.RESETMODE = "ASYNC" ;
    defparam test_fifodc_2_9.REGMODE = "NOREG" ;
    defparam test_fifodc_2_9.CSDECODE_R = "0b11" ;
    defparam test_fifodc_2_9.CSDECODE_W = "0b11" ;
    defparam test_fifodc_2_9.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_2_9.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_2_9 (.DI0(scuba_vlo), .DI1(Data[2]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[2]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[2]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_3_8.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_3_8.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_3_8.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_3_8.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_3_8.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_3_8.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_3_8.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_3_8.GSR = "DISABLED" ;
    defparam test_fifodc_3_8.RESETMODE = "ASYNC" ;
    defparam test_fifodc_3_8.REGMODE = "NOREG" ;
    defparam test_fifodc_3_8.CSDECODE_R = "0b11" ;
    defparam test_fifodc_3_8.CSDECODE_W = "0b11" ;
    defparam test_fifodc_3_8.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_3_8.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_3_8 (.DI0(scuba_vlo), .DI1(Data[3]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[3]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[3]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_4_7.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_4_7.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_4_7.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_4_7.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_4_7.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_4_7.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_4_7.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_4_7.GSR = "DISABLED" ;
    defparam test_fifodc_4_7.RESETMODE = "ASYNC" ;
    defparam test_fifodc_4_7.REGMODE = "NOREG" ;
    defparam test_fifodc_4_7.CSDECODE_R = "0b11" ;
    defparam test_fifodc_4_7.CSDECODE_W = "0b11" ;
    defparam test_fifodc_4_7.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_4_7.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_4_7 (.DI0(scuba_vlo), .DI1(Data[4]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[4]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[4]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_5_6.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_5_6.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_5_6.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_5_6.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_5_6.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_5_6.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_5_6.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_5_6.GSR = "DISABLED" ;
    defparam test_fifodc_5_6.RESETMODE = "ASYNC" ;
    defparam test_fifodc_5_6.REGMODE = "NOREG" ;
    defparam test_fifodc_5_6.CSDECODE_R = "0b11" ;
    defparam test_fifodc_5_6.CSDECODE_W = "0b11" ;
    defparam test_fifodc_5_6.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_5_6.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_5_6 (.DI0(scuba_vlo), .DI1(Data[5]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[5]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[5]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_6_5.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_6_5.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_6_5.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_6_5.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_6_5.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_6_5.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_6_5.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_6_5.GSR = "DISABLED" ;
    defparam test_fifodc_6_5.RESETMODE = "ASYNC" ;
    defparam test_fifodc_6_5.REGMODE = "NOREG" ;
    defparam test_fifodc_6_5.CSDECODE_R = "0b11" ;
    defparam test_fifodc_6_5.CSDECODE_W = "0b11" ;
    defparam test_fifodc_6_5.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_6_5.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_6_5 (.DI0(scuba_vlo), .DI1(Data[6]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[6]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[6]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_7_4.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_7_4.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_7_4.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_7_4.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_7_4.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_7_4.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_7_4.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_7_4.GSR = "DISABLED" ;
    defparam test_fifodc_7_4.RESETMODE = "ASYNC" ;
    defparam test_fifodc_7_4.REGMODE = "NOREG" ;
    defparam test_fifodc_7_4.CSDECODE_R = "0b11" ;
    defparam test_fifodc_7_4.CSDECODE_W = "0b11" ;
    defparam test_fifodc_7_4.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_7_4.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_7_4 (.DI0(scuba_vlo), .DI1(Data[7]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[7]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[7]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_8_3.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_8_3.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_8_3.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_8_3.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_8_3.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_8_3.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_8_3.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_8_3.GSR = "DISABLED" ;
    defparam test_fifodc_8_3.RESETMODE = "ASYNC" ;
    defparam test_fifodc_8_3.REGMODE = "NOREG" ;
    defparam test_fifodc_8_3.CSDECODE_R = "0b11" ;
    defparam test_fifodc_8_3.CSDECODE_W = "0b11" ;
    defparam test_fifodc_8_3.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_8_3.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_8_3 (.DI0(scuba_vlo), .DI1(Data[8]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[8]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[8]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_9_2.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_9_2.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_9_2.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_9_2.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_9_2.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_9_2.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_9_2.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_9_2.GSR = "DISABLED" ;
    defparam test_fifodc_9_2.RESETMODE = "ASYNC" ;
    defparam test_fifodc_9_2.REGMODE = "NOREG" ;
    defparam test_fifodc_9_2.CSDECODE_R = "0b11" ;
    defparam test_fifodc_9_2.CSDECODE_W = "0b11" ;
    defparam test_fifodc_9_2.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_9_2.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_9_2 (.DI0(scuba_vlo), .DI1(Data[9]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[9]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[9]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    defparam test_fifodc_10_1.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_10_1.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_10_1.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_10_1.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_10_1.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_10_1.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_10_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_10_1.GSR = "DISABLED" ;
    defparam test_fifodc_10_1.RESETMODE = "ASYNC" ;
    defparam test_fifodc_10_1.REGMODE = "NOREG" ;
    defparam test_fifodc_10_1.CSDECODE_R = "0b11" ;
    defparam test_fifodc_10_1.CSDECODE_W = "0b11" ;
    defparam test_fifodc_10_1.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_10_1.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_10_1 (.DI0(scuba_vlo), .DI1(Data[10]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[10]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[10]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    VHI scuba_vhi_inst (.Z(scuba_vhi));
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    defparam test_fifodc_11_0.FULLPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_11_0.FULLPOINTER = "0b11111111111111" ;
    defparam test_fifodc_11_0.AFPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_11_0.AFPOINTER = "0b11111111111111" ;
    defparam test_fifodc_11_0.AEPOINTER1 = "0b00000000000000" ;
    defparam test_fifodc_11_0.AEPOINTER = "0b11111111111111" ;
    defparam test_fifodc_11_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam test_fifodc_11_0.GSR = "DISABLED" ;
    defparam test_fifodc_11_0.RESETMODE = "ASYNC" ;
    defparam test_fifodc_11_0.REGMODE = "NOREG" ;
    defparam test_fifodc_11_0.CSDECODE_R = "0b11" ;
    defparam test_fifodc_11_0.CSDECODE_W = "0b11" ;
    defparam test_fifodc_11_0.DATA_WIDTH_R = 1 ;
    defparam test_fifodc_11_0.DATA_WIDTH_W = 1 ;
    FIFO8KB test_fifodc_11_0 (.DI0(scuba_vlo), .DI1(Data[11]), .DI2(scuba_vlo),
        .DI3(scuba_vlo), .DI4(scuba_vlo), .DI5(scuba_vlo), .DI6(scuba_vlo),
        .DI7(scuba_vlo), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo),
        .DI11(Data[11]), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo),
        .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .CSW0(scuba_vhi),
        .CSW1(scuba_vhi), .CSR0(scuba_vhi), .CSR1(scuba_vhi), .FULLI(Full_int),
        .EMPTYI(Empty_int), .WE(WrEn), .RE(RdEn), .ORE(RdEn), .CLKW(WrClock),
        .CLKR(RdClock), .RST(Reset), .RPRST(RPReset), .DO0(Q[11]), .DO1(),
        .DO2(), .DO3(), .DO4(), .DO5(), .DO6(), .DO7(), .DO8(), .DO9(),
        .DO10(), .DO11(), .DO12(), .DO13(), .DO14(), .DO15(), .DO16(), .DO17(),
        .EF(), .AEF(), .AFF(), .FF());
    assign Empty = Empty_int;
    assign Full = Full_int;
    // exemplar begin
    // exemplar end
endmodule