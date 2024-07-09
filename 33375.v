module mobile_ddr2_2_2 (
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
    input                       cke;
    input                       cs_n;
    input           [CA_BITS-1:0] ca;
    input         [2*DM_BITS-1:0] dm;
    inout         [2*DQ_BITS-1:0] dq;
    inout        [2*DQS_BITS-1:0] dqs;
    inout        [2*DQS_BITS-1:0] dqs_n;
    mobile_ddr2 sdrammobile_ddr2_0 (
        ck,
        ck_n,
        cke,
        cs_n,
        ca,
        dm[DM_BITS-1:0],
        dq[DQ_BITS-1:0],
        dqs[DQS_BITS-1:0],
        dqs_n[DQS_BITS-1:0]
    );
    mobile_ddr2 sdrammobile_ddr2_1 (
        ck,
        ck_n,
        cke,
        cs_n,
        ca,
        dm[2*DM_BITS-1:DM_BITS],
        dq[2*DQ_BITS-1:DQ_BITS],
        dqs[2*DQS_BITS-1:DQS_BITS],
        dqs_n[2*DQS_BITS-1:DQS_BITS]
    );
endmodule