module    stratixv_asmiblock    (
    dclk,
    sce,
    oe,
    data0out,
    data1out,
    data2out,
    data3out,
    data0oe,
    data1oe,
    data2oe,
    data3oe,
    data0in,
    data1in,
    data2in,
    data3in);
    parameter    lpm_type    =    "stratixv_asmiblock";
    input    dclk;
    input    sce;
    input    oe;
    input    data0out;
    input    data1out;
    input    data2out;
    input    data3out;
    input    data0oe;
    input    data1oe;
    input    data2oe;
    input    data3oe;
    output    data0in;
    output    data1in;
    output    data2in;
    output    data3in;
    stratixv_asmiblock_encrypted inst (
        .dclk(dclk),
        .sce(sce),
        .oe(oe),
        .data0out(data0out),
        .data1out(data1out),
        .data2out(data2out),
        .data3out(data3out),
        .data0oe(data0oe),
        .data1oe(data1oe),
        .data2oe(data2oe),
        .data3oe(data3oe),
        .data0in(data0in),
        .data1in(data1in),
        .data2in(data2in),
        .data3in(data3in) );
    defparam inst.lpm_type = lpm_type;
endmodule