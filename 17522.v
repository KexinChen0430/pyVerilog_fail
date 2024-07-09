module Counter_v2_40_0 (
    clock,
    comp,
    tc,
    reset,
    interrupt,
    enable,
    capture,
    upCnt,
    downCnt,
    up_ndown,
    count);
    input       clock;
    output      comp;
    output      tc;
    input       reset;
    output      interrupt;
    input       enable;
    input       capture;
    input       upCnt;
    input       downCnt;
    input       up_ndown;
    input       count;
    parameter CaptureMode = 0;
    parameter ClockMode = 3;
    parameter CompareMode = 1;
    parameter CompareStatusEdgeSense = 1;
    parameter EnableMode = 1;
    parameter ReloadOnCapture = 0;
    parameter ReloadOnCompare = 0;
    parameter ReloadOnOverUnder = 0;
    parameter ReloadOnReset = 1;
    parameter Resolution = 8;
    parameter RunMode = 1;
    parameter UseInterrupt = 1;
          wire  Net_95;
          wire  Net_89;
	// VirtualMux_1 (cy_virtualmux_v1_0)
	assign Net_89 = Net_95;
    ZeroTerminal ZeroTerminal_2 (
        .z(Net_95));
    B_Counter_v2_40 CounterUDB (
        .reset(reset),
        .tc_out(tc),
        .cmp_out(comp),
        .clock(clock),
        .irq_out(interrupt),
        .up_ndown(Net_89),
        .upcnt(upCnt),
        .dwncnt(downCnt),
        .enable(enable),
        .capture(capture),
        .count(count));
    defparam CounterUDB.CaptureMode = 0;
    defparam CounterUDB.ClockMode = 3;
    defparam CounterUDB.CompareMode = 1;
    defparam CounterUDB.CompareStatusEdgeSense = 1;
    defparam CounterUDB.EnableMode = 1;
    defparam CounterUDB.ReloadOnCapture = 0;
    defparam CounterUDB.ReloadOnCompare = 0;
    defparam CounterUDB.ReloadOnOverUnder = 0;
    defparam CounterUDB.ReloadOnReset = 1;
    defparam CounterUDB.Resolution = 8;
    defparam CounterUDB.RunMode = 1;
    defparam CounterUDB.UseInterrupt = 1;
endmodule