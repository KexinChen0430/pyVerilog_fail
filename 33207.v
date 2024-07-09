module cycloneii_lcell_ff (
                           datain,
                           clk,
                           aclr,
                           sclr,
                           sload,
                           sdata,
                           ena,
                           devclrn,
                           devpor,
                           regout
                          );
parameter x_on_violation = "on";
parameter lpm_type = "cycloneii_lcell_ff";
input datain;
input clk;
input aclr;
input sclr;
input sload;
input sdata;
input ena;
input devclrn;
input devpor;
output regout;
reg regout_tmp;
wire reset;
reg datain_viol;
reg sclr_viol;
reg sload_viol;
reg sdata_viol;
reg ena_viol;
reg violation;
reg clk_last_value;
reg ix_on_violation;
wire datain_in;
wire clk_in;
wire aclr_in;
wire sclr_in;
wire sload_in;
wire sdata_in;
wire ena_in;
wire nosloadsclr;
wire sloaddata;
buf (datain_in, datain);
buf (clk_in, clk);
buf (aclr_in, aclr);
buf (sclr_in, sclr);
buf (sload_in, sload);
buf (sdata_in, sdata);
buf (ena_in, ena);
assign reset = devpor && devclrn && (!aclr_in) && (ena_in);
assign nosloadsclr = reset && (!sload_in && !sclr_in);
assign sloaddata = reset && sload_in;
specify
    $setuphold (posedge clk &&& nosloadsclr, datain, 0, 0, datain_viol) ;
    $setuphold (posedge clk &&& reset, sclr, 0, 0, sclr_viol) ;
    $setuphold (posedge clk &&& reset, sload, 0, 0, sload_viol) ;
    $setuphold (posedge clk &&& sloaddata, sdata, 0, 0, sdata_viol) ;
    $setuphold (posedge clk &&& reset, ena, 0, 0, ena_viol) ;
    (posedge clk => (regout +: regout_tmp)) = 0 ;
    (posedge aclr => (regout +: 1'b0)) = (0, 0) ;
endspecify
initial
begin
    violation = 'b0;
    clk_last_value = 'b0;
    regout_tmp = 'b0;
    if (x_on_violation == "on")
        ix_on_violation = 1;
    else
        ix_on_violation = 0;
end
always @ (datain_viol or sclr_viol or sload_viol or ena_viol or sdata_viol)
begin
    if (ix_on_violation == 1)
        violation = 'b1;
end
always @ (sdata_in or aclr_in or devclrn or devpor)
begin
    if (devpor == 'b0)
        regout_tmp <= 'b0;
    else if (devclrn == 'b0)
        regout_tmp <= 'b0;
    else if (aclr_in == 'b1)
        regout_tmp <= 'b0;
end
always @ (clk_in or posedge aclr_in or
          devclrn or devpor or posedge violation)
begin
    if (violation == 1'b1)
    begin
        violation = 'b0;
        regout_tmp <= 'bX;
    end
    else
    begin
        if (devpor == 'b0 || devclrn == 'b0 || aclr_in === 'b1)
            regout_tmp <= 'b0;
        else if (ena_in === 'b1 && clk_in === 'b1 && clk_last_value === 'b0)
        begin
            if (sclr_in === 'b1)
                regout_tmp <= 'b0 ;
            else if (sload_in === 'b1)
                regout_tmp <= sdata_in;
            else
                regout_tmp <= datain_in;
        end
    end
    clk_last_value = clk_in;
end
and (regout, regout_tmp, 'b1);
endmodule