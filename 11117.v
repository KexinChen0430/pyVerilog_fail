module arriaiigz_ddio_out (
                        datainlo,
                        datainhi,
                        clk,
                        clkhi,
                        clklo,
                        muxsel,
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
parameter half_rate_mode = "false";
parameter use_new_clocking_model = "false";
parameter lpm_type = "arriaiigz_ddio_out";
//Input Ports Declaration
input datainlo;
input datainhi;
input clk;
input clkhi;
input clklo;
input muxsel;
input ena;
input areset;
input sreset;
input devpor;
input devclrn;
//Output Ports Declaration
output dataout;
//Buried Ports Declaration
output dfflo;
output [1:0] dffhi;
tri1 devclrn;
tri1 devpor;
//Internal Signals
reg ddioreg_aclr;
reg ddioreg_adatasdata;
reg ddioreg_sclr;
reg ddioreg_sload;
reg ddioreg_prn;
reg viol_notifier;
wire dfflo_tmp;
wire dffhi_tmp;
wire mux_sel;
wire dffhi1_tmp;
wire sel_mux_hi_in;
wire clk_hi;
wire clk_lo;
wire datainlo_tmp;
wire datainhi_tmp;
reg dinhi_tmp;
reg dinlo_tmp;
wire clk_hr;
reg clk1;
reg clk2;
reg muxsel1;
reg muxsel2;
reg muxsel_tmp;
reg sel_mux_lo_in_tmp;
wire muxsel3;
wire clk3;
wire sel_mux_lo_in;
initial
begin
	ddioreg_aclr = 1'b1;
	ddioreg_prn = 1'b1;
	ddioreg_adatasdata = (sync_mode == "preset") ? 1'b1: 1'b0;
    ddioreg_sclr = 1'b0;
    ddioreg_sload = 1'b0;
end
assign dfflo = dfflo_tmp;
assign dffhi[0] = dffhi_tmp;
assign dffhi[1] = dffhi1_tmp;
always@(clk)
begin
    clk1 = clk;
    clk2 <= clk1;
end
always@(muxsel)
begin
    muxsel1 = muxsel;
    muxsel2 <= muxsel1;
end
always@(dfflo_tmp)
begin
    sel_mux_lo_in_tmp <= dfflo_tmp;
end
always@(datainlo)
begin
    dinlo_tmp <= datainlo;
end
always@(datainhi)
begin
    dinhi_tmp <= datainhi;
end
always @(mux_sel) begin
   muxsel_tmp <= mux_sel;
end
always@(areset)
begin
        if(async_mode == "clear")
            begin
                ddioreg_aclr = !areset;
            end
        else if(async_mode == "preset")
            begin
                ddioreg_prn = !areset;
            end
end
always@(sreset )
begin
         if(sync_mode == "clear")
            begin
                ddioreg_sclr = sreset;
            end
        else if(sync_mode == "preset")
            begin
                ddioreg_sload = sreset;
            end
end
//DDIO HIGH Register
dffeas  ddioreg_hi(
                   .d(datainhi_tmp),
                   .clk(clk_hi),
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
assign clk_hi = (use_new_clocking_model == "true") ?  clkhi : clk;
assign datainhi_tmp = dinhi_tmp;
//DDIO Low Register
dffeas  ddioreg_lo(
                   .d(datainlo_tmp),
                   .clk(clk_lo),
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
assign clk_lo = (use_new_clocking_model == "true") ?  clklo : clk;
assign datainlo_tmp = dinlo_tmp;
//DDIO High Register
dffeas  ddioreg_hi1(
                   .d(dffhi_tmp),
                   .clk(!clk_hr),
                   .clrn(ddioreg_aclr),
                   .aload(1'b0),
                   .sclr(ddioreg_sclr),
                   .sload(ddioreg_sload),
                   .asdata(ddioreg_adatasdata),
                   .ena(ena),
                   .prn(ddioreg_prn),
                   .q(dffhi1_tmp),
                   .devpor(devpor),
                   .devclrn(devclrn)
                  );
defparam ddioreg_hi1.power_up = power_up;
assign clk_hr = (use_new_clocking_model == "true") ?  clkhi : clk;
//registered output selection
arriaiigz_mux21 sel_mux(
                    .MO(dataout),
                    .A(sel_mux_lo_in),
                    .B(sel_mux_hi_in),
                    .S(muxsel_tmp)
                   );
assign muxsel3 = muxsel2;
assign clk3 = clk2;
assign  mux_sel = (use_new_clocking_model == "true")? muxsel3 : clk3;
assign sel_mux_lo_in = sel_mux_lo_in_tmp;
assign sel_mux_hi_in = (half_rate_mode == "true") ? dffhi1_tmp : dffhi_tmp;
endmodule