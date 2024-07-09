module stratixv_ddio_oe (
                       oe,
                       clk,
                       ena,
                       areset,
                       sreset,
                       dataout,
                       dfflo,
                       dffhi,
                       devpor,
                       devclrn
                    );
//Parameters Declaration
parameter power_up = "low";
parameter async_mode = "none";
parameter sync_mode = "none";
parameter lpm_type = "stratixv_ddio_oe";
//Input Ports Declaration
input oe;
input clk;
input ena;
input areset;
input sreset;
input devpor;
input devclrn;
//Output Ports Declaration
output dataout;
//Buried Ports Declaration
output dfflo;
output dffhi;
tri1 devclrn;
tri1 devpor;
//Internal Signals
reg ddioreg_aclr;
reg ddioreg_prn;
reg ddioreg_adatasdata;
reg ddioreg_sclr;
reg ddioreg_sload;
reg viol_notifier;
initial
begin
	ddioreg_aclr = 1'b1;
	ddioreg_prn = 1'b1;
	ddioreg_adatasdata = 1'b0;
    ddioreg_sclr = 1'b0;
    ddioreg_sload = 1'b0;
end
wire dfflo_tmp;
wire dffhi_tmp;
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
//DDIO OE Register
dffeas  ddioreg_hi(
                   .d(oe),
                   .clk(clk),
                   .clrn(ddioreg_aclr),
                   .aload(1'b0),
                   .sclr(ddioreg_sclr),
                   .sload(ddioreg_sload),
                   .asdata(ddioreg_adatasdata),
                   .ena(ena),
                   .prn(ddioreg_prn),
                   .q(dffhi_tmp),
                   .devpor(devpor),
                   .devclrn(devclrn)
                );
defparam ddioreg_hi.power_up = power_up;
//DDIO Low Register
dffeas  ddioreg_lo(
                   .d(dffhi_tmp),
                   .clk(!clk),
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
//registered output
stratixv_mux21 or_gate(
                    .MO(dataout),
                    .A(dffhi_tmp),
                    .B(dfflo_tmp),
                    .S(dfflo_tmp)
                   );
assign dfflo = dfflo_tmp;
assign dffhi = dffhi_tmp;
endmodule