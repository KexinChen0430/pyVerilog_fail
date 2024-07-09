module lpm_fifo_dc (data,
                    rdclock,
                    wrclock,
                    aclr,
                    rdreq,
                    wrreq,
                    rdfull,
                    wrfull,
                    rdempty,
                    wrempty,
                    rdusedw,
                    wrusedw,
                    q);
// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;
    parameter lpm_widthu = 1;
    parameter lpm_numwords = 2;
    parameter lpm_showahead = "OFF";
    parameter underflow_checking = "ON";
    parameter overflow_checking = "ON";
    parameter lpm_hint = "";
    parameter lpm_type = "lpm_fifo_dc";
// LOCAL PARAMETER DECLARATION
    parameter delay_rdusedw = 1;
    parameter delay_wrusedw = 1;
    parameter rdsync_delaypipe = 3;
    parameter wrsync_delaypipe = 3;
// INPUT PORT DECLARATION
    input [lpm_width-1:0] data;
    input rdclock;
    input wrclock;
    input aclr;
    input rdreq;
    input wrreq;
// OUTPUT PORT DECLARATION
    output rdfull;
    output wrfull;
    output rdempty;
    output wrempty;
    output [lpm_widthu-1:0] rdusedw;
    output [lpm_widthu-1:0] wrusedw;
    output [lpm_width-1:0] q;
// internal reg
    wire w_rdfull_s;
    wire w_wrfull_s;
    wire w_rdempty_s;
    wire w_wrempty_s;
    wire w_rdfull_a;
    wire w_wrfull_a;
    wire w_rdempty_a;
    wire w_wrempty_a;
    wire [lpm_widthu-1:0] w_rdusedw_s;
    wire [lpm_widthu-1:0] w_wrusedw_s;
    wire [lpm_widthu-1:0] w_rdusedw_a;
    wire [lpm_widthu-1:0] w_wrusedw_a;
    wire [lpm_width-1:0] w_q_s;
    wire [lpm_width-1:0] w_q_a;
    wire i_aclr;
// INTERNAL TRI DECLARATION
    tri0 aclr;
    buf (i_aclr, aclr);
// COMPONENT INSTANTIATIONS
    lpm_fifo_dc_async ASYNC (
        .data (data),
        .rdclk (rdclock),
        .wrclk (wrclock),
        .aclr (i_aclr),
        .rdreq (rdreq),
        .wrreq (wrreq),
        .rdfull (w_rdfull_a),
        .wrfull (w_wrfull_a),
        .rdempty (w_rdempty_a),
        .wrempty (w_wrempty_a),
        .rdusedw (w_rdusedw_a),
        .wrusedw (w_wrusedw_a),
        .q (w_q_a) );
    defparam
        ASYNC.lpm_width = lpm_width,
        ASYNC.lpm_widthu = lpm_widthu,
        ASYNC.lpm_numwords = lpm_numwords,
        ASYNC.delay_rdusedw = delay_rdusedw,
        ASYNC.delay_wrusedw = delay_wrusedw,
        ASYNC.rdsync_delaypipe = rdsync_delaypipe,
        ASYNC.wrsync_delaypipe = wrsync_delaypipe,
        ASYNC.lpm_showahead = lpm_showahead,
        ASYNC.underflow_checking = underflow_checking,
        ASYNC.overflow_checking = overflow_checking,
        ASYNC.lpm_hint = lpm_hint;
// CONTINOUS ASSIGNMENT
    assign rdfull =  w_rdfull_a;
    assign wrfull =  w_wrfull_a;
    assign rdempty = w_rdempty_a;
    assign wrempty = w_wrempty_a;
    assign rdusedw = w_rdusedw_a;
    assign wrusedw = w_wrusedw_a;
    assign q = w_q_a;
endmodule