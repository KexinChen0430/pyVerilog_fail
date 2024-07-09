module hardcopyiii_ff (
    d,
    clk,
    clrn,
    aload,
    sclr,
    sload,
    asdata,
    ena,
    devclrn,
    devpor,
    q
    );
parameter power_up = "low";
parameter x_on_violation = "on";
parameter lpm_type = "hardcopyiii_ff";
input d;
input clk;
input clrn;
input aload;
input sclr;
input sload;
input asdata;
input ena;
input devclrn;
input devpor;
output q;
tri1 devclrn;
tri1 devpor;
reg q_tmp;
wire reset;
reg d_viol;
reg sclr_viol;
reg sload_viol;
reg asdata_viol;
reg ena_viol;
reg violation;
reg clk_last_value;
reg ix_on_violation;
wire d_in;
wire clk_in;
wire clrn_in;
wire aload_in;
wire sclr_in;
wire sload_in;
wire asdata_in;
wire ena_in;
wire nosloadsclr;
wire sloaddata;
buf (d_in, d);
buf (clk_in, clk);
buf (clrn_in, clrn);
buf (aload_in, aload);
buf (sclr_in, sclr);
buf (sload_in, sload);
buf (asdata_in, asdata);
buf (ena_in, ena);
assign reset = devpor && devclrn && clrn_in && ena_in;
assign nosloadsclr = reset && (!sload_in && !sclr_in);
assign sloaddata = reset && sload_in;
specify
    $setuphold (posedge clk &&& nosloadsclr, d, 0, 0, d_viol) ;
    $setuphold (posedge clk &&& reset, sclr, 0, 0, sclr_viol) ;
    $setuphold (posedge clk &&& reset, sload, 0, 0, sload_viol) ;
    $setuphold (posedge clk &&& sloaddata, asdata, 0, 0, asdata_viol) ;
    $setuphold (posedge clk &&& reset, ena, 0, 0, ena_viol) ;
    (posedge clk => (q +: q_tmp)) = 0 ;
    (posedge clrn => (q +: 1'b0)) = (0, 0) ;
    (posedge aload => (q +: q_tmp)) = (0, 0) ;
    (asdata => q) = (0, 0) ;
endspecify
initial
begin
    violation = 'b0;
    clk_last_value = 'b0;
    if (power_up == "low")
        q_tmp = 'b0;
    else if (power_up == "high")
        q_tmp = 'b1;
    if (x_on_violation == "on")
        ix_on_violation = 1;
    else
        ix_on_violation = 0;
end
always @ (d_viol or sclr_viol or sload_viol or ena_viol or asdata_viol)
begin
    if (ix_on_violation == 1)
        violation = 'b1;
end
always @ (asdata_in or clrn_in or posedge aload_in or
          devclrn or devpor)
begin
    if (devpor == 'b0)
        q_tmp <= 'b0;
    else if (devclrn == 'b0)
        q_tmp <= 'b0;
    else if (clrn_in == 'b0)
        q_tmp <= 'b0;
    else if (aload_in == 'b1)
        q_tmp <= asdata_in;
end
always @ (clk_in or posedge clrn_in or posedge aload_in or
          devclrn or devpor or posedge violation)
begin
    if (violation == 1'b1)
    begin
        violation = 'b0;
        q_tmp <= 'bX;
    end
    else
    begin
        if (devpor == 'b0 || devclrn == 'b0 || clrn_in === 'b0)
            q_tmp <= 'b0;
        else if (aload_in === 'b1)
            q_tmp <= asdata_in;
        else if (ena_in === 'b1 && clk_in === 'b1 && clk_last_value === 'b0)
        begin
            if (sclr_in === 'b1)
                q_tmp <= 'b0 ;
            else if (sload_in === 'b1)
                q_tmp <= asdata_in;
            else
                q_tmp <= d_in;
        end
    end
    clk_last_value = clk_in;
end
and (q, q_tmp, 1'b1);
endmodule