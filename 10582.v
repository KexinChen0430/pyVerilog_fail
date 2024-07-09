module stratixv_ddio_in (
                      datain,
                      clk,
                      clkn,
                      ena,
                      areset,
                      sreset,
                      regoutlo,
                      regouthi,
                      dfflo,
                      devpor,
                      devclrn
                    );
//Parameters Declaration
parameter power_up = "low";
parameter async_mode = "none";
parameter sync_mode = "none";
parameter use_clkn = "false";
parameter lpm_type = "stratixv_ddio_in";
//Input Ports Declaration
input datain;
input clk;
input clkn;
input ena;
input areset;
input sreset;
input devpor;
input devclrn;
//Output Ports Declaration
output regoutlo;
output regouthi;
//burried port;
output dfflo;
tri1 devclrn;
tri1 devpor;
//Internal Signals
reg ddioreg_aclr;
reg ddioreg_prn;
reg ddioreg_adatasdata;
reg ddioreg_sclr;
reg ddioreg_sload;
reg viol_notifier;
wire ddioreg_clk;
wire dfflo_tmp;
wire regout_tmp_hi;
wire regout_tmp_lo;
wire dff_ena;
initial
begin
	ddioreg_aclr = 1'b1;
	ddioreg_prn = 1'b1;
	ddioreg_adatasdata = 1'b0;
    ddioreg_sclr = 1'b0;
    ddioreg_sload = 1'b0;
end
assign ddioreg_clk = (use_clkn == "false") ? !clk : clkn;
//Decode the control values for the DDIO registers
always@(areset or sreset )
    begin
        if(async_mode == "clear")
            begin
                ddioreg_aclr = !areset;
                ddioreg_prn = 1'b1;
            end
        else if(async_mode == "preset")
            begin
                ddioreg_aclr = 'b1;
                ddioreg_prn = !areset;
            end
         else
            begin
                ddioreg_aclr = 'b1;
                ddioreg_prn = 'b1;
            end
         if(sync_mode == "clear")
            begin
                ddioreg_adatasdata = 'b0;
                ddioreg_sclr = sreset;
                ddioreg_sload = 'b0;
            end
        else if(sync_mode == "preset")
            begin
                ddioreg_adatasdata = 'b1;
                ddioreg_sclr = 'b0;
                ddioreg_sload = sreset;
            end
        else
            begin
                ddioreg_adatasdata = 'b0;
                ddioreg_sclr = 'b0;
                ddioreg_sload = 'b0;
            end
    end
//DDIO high Register
dffeas  ddioreg_hi(
                   .d(datain),
                   .clk(clk),
                   .clrn(ddioreg_aclr),
                   .aload(1'b0),
                   .sclr(ddioreg_sclr),
                   .sload(ddioreg_sload),
                   .asdata(ddioreg_adatasdata),
                   .ena(ena),
                   .prn(ddioreg_prn),
                   .q(regout_tmp_hi),
                   .devpor(devpor),
                   .devclrn(devclrn)
                   );
defparam ddioreg_hi.power_up = power_up;
//DDIO Low Register
dffeas  ddioreg_lo(
                   .d(datain),
                   .clk(ddioreg_clk),
                   .clrn(ddioreg_aclr),
                   .aload(1'b0),
                   .sclr(ddioreg_sclr),
                   .sload(ddioreg_sload),
                   .asdata(ddioreg_adatasdata),
                   .ena(ena),
                   .prn(ddioreg_prn),
                   .q(dfflo_tmp),
                   .devpor(devpor),
                   .devclrn(devclrn)
                  );
defparam ddioreg_lo.power_up = power_up;
dffeas  ddioreg_lo1(
                    .d(dfflo_tmp),
                    .clk(clk),
                    .clrn(ddioreg_aclr),
                    .aload(1'b0),
                    .sclr(ddioreg_sclr),
                    .sload(ddioreg_sload),
                    .asdata(ddioreg_adatasdata),
                    .ena(ena),
                    .prn(ddioreg_prn),
                    .q(regout_tmp_lo),
                    .devpor(devpor),
                    .devclrn(devclrn)
                   );
defparam ddioreg_lo1.power_up = power_up;
assign regouthi = regout_tmp_hi;
assign regoutlo = regout_tmp_lo;
assign dfflo = dfflo_tmp;
endmodule