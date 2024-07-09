module mobile_ddr2_2_1 (
    ck,
    ck_n,
    cke,
    cs_n,
    ca,
    dm,
    dq,
    dqs,
    dqs_n
);
    `include "mobile_ddr2_parameters.vh"
    // ports
    input                       ck;
    input                       ck_n;
    input                 [1:0] cke;
    input                 [1:0] cs_n;
    input         [CA_BITS-1:0] ca;
    input         [DM_BITS-1:0] dm;
    inout         [DQ_BITS-1:0] dq;
    inout        [DQS_BITS-1:0] dqs;
    inout        [DQS_BITS-1:0] dqs_n;
    mobile_ddr2 sdrammobile_ddr2_0 (
        ck,
        ck_n,
        cke[0],
        cs_n[0],
        ca,
        dm,
        dq,
        dqs,
        dqs_n
    );
    mobile_ddr2 sdrammobile_ddr2_1 (
        ck,
        ck_n,
        cke[1],
        cs_n[1],
        ca,
        dm,
        dq,
        dqs,
        dqs_n
    );
endmodule