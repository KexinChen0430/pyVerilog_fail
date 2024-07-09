module cycloneive_ddio_out (
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
parameter use_new_clocking_model = "false";
parameter lpm_type = "cycloneive_ddio_out";
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
output dffhi ;
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
wire sel_mux_hi_in;
wire clk_hi;
wire clk_lo;
wire datainlo_tmp;
wire datainhi_tmp;
reg dinhi_tmp;
reg dinlo_tmp;
reg clk1;
reg clk2;
reg muxsel1;
reg muxsel2;
reg muxsel_tmp;
reg sel_mux_lo_in_tmp;
reg sel_mux_hi_in_tmp;
reg dffhi_tmp1;
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
assign dffhi = dffhi_tmp;
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
   muxsel_tmp <= mux_sel;		//REM_SV
end
always@(dffhi_tmp)
begin
    dffhi_tmp1 <= dffhi_tmp;
end
always@(dffhi_tmp1)
begin
    sel_mux_hi_in_tmp <= dffhi_tmp1;
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
cycloneive_latch  ddioreg_hi(
                            .D(datainhi_tmp),
                            .ENA(!clk_hi & ena),
                            .PRE(ddioreg_prn),
                            .CLR(ddioreg_aclr),
                            .Q(dffhi_tmp)
                            );
assign clk_hi = (use_new_clocking_model == "true") ?  clkhi : clk;
assign datainhi_tmp =  (ddioreg_sclr == 1'b0 && ddioreg_sload == 1'b1)? 1'b1 : (ddioreg_sclr == 1'b1 && ddioreg_sload == 1'b0)? 1'b0: dinhi_tmp;
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
//registered output selection
cycloneive_mux21 sel_mux(
                    .MO(dataout),
                    .A(sel_mux_hi_in),
                    .B(sel_mux_lo_in),
                    .S(!muxsel_tmp)
                   );
assign muxsel3 = muxsel2;
assign clk3 = clk2;
assign  mux_sel = (use_new_clocking_model == "true")? muxsel3 : clk3;
assign sel_mux_lo_in = sel_mux_lo_in_tmp;
assign sel_mux_hi_in  =  sel_mux_hi_in_tmp;
endmodule