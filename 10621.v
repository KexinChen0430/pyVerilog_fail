module    stratixv_jtag    (
    tms,
    tck,
    tdi,
    ntrst,
    tdoutap,
    tdouser,
    tdo,
    tmsutap,
    tckutap,
    tdiutap,
    shiftuser,
    clkdruser,
    updateuser,
    runidleuser,
    usr1user,
    ntrstcore);
    parameter    lpm_type    =    "stratixv_jtag";
    input    tms;
    input    tck;
    input    tdi;
    input    ntrst;
    input    tdoutap;
    input    tdouser;
    output    tdo;
    output    tmsutap;
    output    tckutap;
    output    tdiutap;
    output    shiftuser;
    output    clkdruser;
    output    updateuser;
    output    runidleuser;
    output    usr1user;
    input     ntrstcore;
    stratixv_jtag_encrypted inst (
        .tms(tms),
        .tck(tck),
        .tdi(tdi),
        .ntrst(ntrst),
        .tdoutap(tdoutap),
        .tdouser(tdouser),
        .tdo(tdo),
        .tmsutap(tmsutap),
        .tckutap(tckutap),
        .tdiutap(tdiutap),
        .shiftuser(shiftuser),
        .clkdruser(clkdruser),
        .updateuser(updateuser),
        .runidleuser(runidleuser),
        .usr1user(usr1user) );
    defparam inst.lpm_type = lpm_type;
endmodule