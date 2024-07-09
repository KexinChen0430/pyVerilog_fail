module dffeas (d, clk, ena, clrn, prn, aload, asdata, sclr, sload, devclrn, devpor, q );
parameter power_up = "DONT_CARE";
parameter is_wysiwyg = "false";
parameter dont_touch = "false";
parameter x_on_violation = "on";
parameter lpm_type = "dffeas";
    input d,clk,ena,clrn,prn,aload,asdata,sclr,sload,devclrn,devpor;
output q;
wire q, q_high, q_low;
tri0 aload_in, sclr_in, sload_in, asdata_in;
tri1 prn_in, clrn_in, ena_in, devclrn_in, devpor_in;
assign aload_in = aload;
assign sclr_in = sclr;
assign sload_in = sload;
assign asdata_in = asdata;
assign prn_in = prn;
assign clrn_in = clrn;
assign ena_in = ena;
assign devclrn_in = devclrn;
assign devpor_in = devpor;
    wire q_tmp;
reg viol;
reg q_tmp_dly;
    wire reset;
wire nosloadsclr;
wire sloaddata;
    assign reset = devpor_in && devclrn_in && clrn_in && prn_in && ena_in;
    assign nosloadsclr = reset && (!sload_in && !sclr_in);
    assign sloaddata = reset && sload_in;
    assign q = q_tmp_dly;
specify
    $setuphold (posedge clk &&& nosloadsclr, d, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, sclr, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, sload, 0, 0, viol) ;
    $setuphold (posedge clk &&& sloaddata, asdata, 0, 0, viol) ;
    $setuphold (posedge clk &&& reset, ena, 0, 0, viol) ;
    (posedge clk => (q +: q_tmp)) = 0 ;
    (negedge clrn => (q +: 1'b0)) = (0, 0) ;
    (negedge prn => (q +: 1'b1)) = (0, 0) ;
    (posedge aload => (q +: q_tmp)) = (0, 0) ;
    (asdata => q) = (0, 0) ;
endspecify
initial
begin
    if (power_up == "high")
        q_tmp_dly = 1'b1;
    else
        q_tmp_dly = 1'b0;
end
always @(q_tmp)
begin
    q_tmp_dly <= q_tmp;
end
generate
    if (power_up != "high") begin
        PRIM_GDFF_LOW (q_tmp,d,clk,ena_in, !clrn_in || !devpor_in || !devclrn_in,!prn_in,aload_in,asdata_in,sclr_in,sload_in,viol);
    end
endgenerate
generate
    if (power_up == "high") begin
        PRIM_GDFF_HIGH (q_tmp,d,clk,ena_in,!clrn_in || !devpor_in || !devclrn_in,!prn_in,aload_in,asdata_in,sclr_in,sload_in,viol);
    end
endgenerate
endmodule