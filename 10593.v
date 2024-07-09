module    stratixv_dll_offset_ctrl    (
    clk,
    offsetdelayctrlin,
    offset,
    addnsub,
    aload,
    offsetctrlout,
    offsettestout);
    parameter    use_offset    =    "false";
    parameter    static_offset    =    0;
    parameter    use_pvt_compensation    =    "false";
    input    clk;
    input    [6:0]    offsetdelayctrlin;
    input    [6:0]    offset;
    input    addnsub;
    input    aload;
    output    [6:0]    offsetctrlout;
    output    [6:0]    offsettestout;
    stratixv_dll_offset_ctrl_encrypted inst (
        .clk(clk),
        .offsetdelayctrlin(offsetdelayctrlin),
        .offset(offset),
        .addnsub(addnsub),
        .aload(aload),
        .offsetctrlout(offsetctrlout),
        .offsettestout(offsettestout) );
    defparam inst.use_offset = use_offset;
    defparam inst.static_offset = static_offset;
    defparam inst.use_pvt_compensation = use_pvt_compensation;
endmodule