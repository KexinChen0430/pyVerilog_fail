module hardcopyiii_dqs_enable (
	    dqsin,
	    dqsenable,
	    devclrn,
	    devpor,
	    dqsbusout
);
parameter lpm_type = "hardcopyiii_dqs_enable";
// INPUT PORTS
input        dqsin;
input        dqsenable;
input        devclrn;
input        devpor;
// OUTPUT PORTS
output       dqsbusout;
tri1 devclrn;
tri1 devpor;
wire         tmp_dqsbusout;
reg          ena_reg;
// BUFFER wrapper
wire    dqsin_in;
wire    dqsenable_in;
assign dqsin_in = dqsin;
assign dqsenable_in =  (dqsenable === 1'b1) ? 1'b1 : 1'b0;
specify
    (dqsin => dqsbusout) = (0,0);
    (dqsenable => dqsbusout) = (0,0); // annotated on the dqsenable port
endspecify
initial ena_reg = 1'b1;
assign tmp_dqsbusout = ena_reg & dqsin_in;
always @(negedge tmp_dqsbusout or posedge dqsenable_in)
begin
    if (dqsenable_in === 1'b1)
        ena_reg <= 1'b1;
    else
        ena_reg <= 1'b0;
end
pmos (dqsbusout, tmp_dqsbusout, 1'b0);
endmodule