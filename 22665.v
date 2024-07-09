module hardcopyiii_ddr_io_reg (
        d,
        clk,
        ena,
        clrn,
        prn,
        aload,
        asdata,
        sclr,
        sload,
        devclrn,
        devpor,
        rpt_violation,
        q
);
// GLOBAL PARAMETER DECLARATION
parameter power_up = "DONT_CARE";
parameter is_wysiwyg = "false";
// LOCAL_PARAMETERS_BEGIN
parameter x_on_violation = "on";
// LOCAL_PARAMETERS_END
input d;
input clk;
input ena;
input clrn;
input prn;
input aload;
input asdata;
input sclr;
input sload;
input devclrn;
input devpor;
input rpt_violation;
output q;
wire q_tmp;
wire reset;
reg viol;
wire nosloadsclr;
wire sloaddata;
    assign reset = devpor && devclrn && clrn && ena && rpt_violation;
    assign nosloadsclr = reset && (~sload && ~sclr);
    assign sloaddata = reset && sload;
    assign q = q_tmp;
   dffeas  ddr_reg (
                   .d(d),
                   .clk(clk),
                   .clrn(clrn),
                   .aload(aload),
                   .sclr(sclr),
                   .sload(sload),
                   .asdata(asdata),
                   .ena(ena),
                   .prn(prn),
                   .q(q_tmp),
                   .devpor(devpor),
                   .devclrn(devclrn)
                  );
    defparam ddr_reg.power_up = power_up;
specify
    $setuphold (posedge clk &&& nosloadsclr, d, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, sclr, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, sload, 0, 0, viol) ;
    $setuphold (posedge clk &&& sloaddata, asdata, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, ena, 0, 0, viol) ;
    (posedge clk => (q +: d)) = 0 ;
    (posedge clrn => (q +: 1'b0)) = (0, 0) ;
    (posedge prn => (q +: 1'b1)) = (0, 0) ;
    (posedge aload => (q +: d)) = (0, 0) ;
    (asdata => q) = (0, 0) ;
endspecify
endmodule