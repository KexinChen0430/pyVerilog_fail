module Comp_P4_v1_0_0 (
    Vplus,
    CmpOut,
    Vminus);
    inout       Vplus;
    electrical  Vplus;
    output      CmpOut;
    inout       Vminus;
    electrical  Vminus;
    electrical  Net_32;
    electrical  Net_33;
    electrical  Net_34;
          wire  Net_9;
          wire  Net_1;
	// VirtualMux_1 (cy_virtualmux_v1_0)
	assign CmpOut = Net_1;
    assign Net_9 = ~Net_1;
    cy_psoc4_abuf_v1_0 cy_psoc4_abuf (
        .vplus(Vplus),
        .vminus(Vminus),
        .vout1(Net_32),
        .vout10(Net_33),
        .rs_bot(Net_34),
        .cmpout(Net_1));
    defparam cy_psoc4_abuf.has_resistor = 0;
    cy_analog_noconnect_v1_0 cy_analog_noconnect_1 (
        .noconnect(Net_32));
    cy_analog_noconnect_v1_0 cy_analog_noconnect_2 (
        .noconnect(Net_33));
    cy_analog_noconnect_v1_0 cy_analog_noconnect_3 (
        .noconnect(Net_34));
endmodule