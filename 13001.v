module IDAC_P4_v1_0_1 (
    Iout);
    inout       Iout;
    electrical  Iout;
          wire  Net_3;
    cy_psoc4_csidac_v1_0 cy_psoc4_idac (
        .en(Net_3),
        .iout(Iout));
    defparam cy_psoc4_idac.resolution = 7;
    OneTerminal OneTerminal_1 (
        .o(Net_3));
endmodule