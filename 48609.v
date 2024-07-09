module OpAmp_P4_v1_10_3 (
    Vplus,
    Vout,
    Vminus);
    inout       Vplus;
    electrical  Vplus;
    inout       Vout;
    electrical  Vout;
    inout       Vminus;
    electrical  Vminus;
          wire  Net_12;
    electrical  Net_29;
    electrical  Net_19;
    electrical  Net_18;
    electrical  Net_9;
    cy_psoc4_abuf_v1_0 cy_psoc4_abuf (
        .vplus(Vplus),
        .vminus(Net_9),
        .vout1(Net_18),
        .vout10(Net_19),
        .rs_bot(Net_29),
        .cmpout(Net_12));
    defparam cy_psoc4_abuf.deepsleep_available = 0;
    defparam cy_psoc4_abuf.has_resistor = 0;
    defparam cy_psoc4_abuf.needs_dsab = 0;
	// cy_analog_virtualmux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 cy_analog_virtualmux_1_connect(Net_9, Vminus);
	defparam cy_analog_virtualmux_1_connect.sig_width = 1;
	// cy_analog_virtualmux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 cy_analog_virtualmux_2_connect(Vout, Net_19);
	defparam cy_analog_virtualmux_2_connect.sig_width = 1;
    cy_analog_noconnect_v1_0 cy_analog_noconnect_1 (
        .noconnect(Net_29));
endmodule