module CharLCDmp_v1_00_2 (
    RS,
    E,
    DB5,
    DB4,
    DB6,
    DB7);
    output      RS;
    output      E;
    output      DB5;
    output      DB4;
    output      DB6;
    output      DB7;
          wire  Net_24;
          wire  Net_23;
          wire  Net_22;
          wire  Net_26;
    CyControlReg_v1_70 Cntl_Port (
        .control_1(DB5),
        .control_2(DB6),
        .control_3(DB7),
        .control_0(DB4),
        .control_4(E),
        .control_5(RS),
        .control_6(Net_26),
        .control_7(Net_22),
        .clock(1'b0),
        .reset(1'b0));
    defparam Cntl_Port.Bit0Mode = 0;
    defparam Cntl_Port.Bit1Mode = 0;
    defparam Cntl_Port.Bit2Mode = 0;
    defparam Cntl_Port.Bit3Mode = 0;
    defparam Cntl_Port.Bit4Mode = 0;
    defparam Cntl_Port.Bit5Mode = 0;
    defparam Cntl_Port.Bit6Mode = 0;
    defparam Cntl_Port.Bit7Mode = 0;
    defparam Cntl_Port.BitValue = 0;
    defparam Cntl_Port.BusDisplay = 0;
    defparam Cntl_Port.ExtrReset = 0;
    defparam Cntl_Port.NumOutputs = 6;
endmodule