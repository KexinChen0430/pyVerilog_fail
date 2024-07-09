module    stratixv_prblock    (
    clk,
    corectl,
    prrequest,
    data,
    externalrequest,
    error,
    ready,
    done);
    parameter    lpm_type    =    "stratixv_prblock";
    input    clk;
    input    corectl;
    input    prrequest;
    input    [15:0]    data;
    output    externalrequest;
    output    error;
    output    ready;
    output    done;
    stratixv_prblock_encrypted inst (
        .clk(clk),
        .corectl(corectl),
        .prrequest(prrequest),
        .data(data),
        .externalrequest(externalrequest),
        .error(error),
        .ready(ready),
        .done(done) );
    defparam inst.lpm_type = lpm_type;
endmodule