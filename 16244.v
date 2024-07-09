module CPU_top(
	input wire stp,rst,clk,
	input wire [1:0] dptype,
	input wire [4:0] regselect,
	output wire exec,
	output wire [5:0] initype,
	output wire [3:0] node,
	output wire [7:0] segment
    );
	wire clock;
	wire memclock;
	wire resetn;
	wire [31:0] dpdata;
	reg [15:0] digit,count=0;
	wire [7:0] pc;
	wire [31:0] inst;
	wire [31:0] ealu;
	wire [31:0] malu;
	wire [31:0] walu;
	wire [7:0] bpc,jpc,npc,dpc4,epc4,pc4;
	wire [31:0] ins,da,db,ea,eb,dimm,eimm; //instÖØ¸´£¿
	wire [31:0] mb,mmo,wmo,wdi;
	wire [4:0] drn,ern0,ern,mrn,wrn,dsa,esa;
	wire [3:0] daluc,ealuc;
	wire [1:0] pcsource;
	wire  wpcir;
	wire dwreg,dm2reg,dwmem,daluimm,dshift,djal;//id stage
	wire ewreg,em2reg,ewmem,ealuimm,eshift,ejal;//exe stage
	wire mwreg,mm2reg,mwmem;//mem stage
	wire wwreg,wm2reg;//wb stage
	pbdebounce p0(clk,stp,clock);
	assign memclock=clk;
	pbdebounce p1(clk,rst,resetn);
	always @(posedge clock) count=count+1;
	pipepc prog_cnt(npc,wpcir,clock,resetn,pc);
	pipeif if_stage(pcsource,pc,bpc,da,jpc,npc,pc4,ins);
	pipeir inst_reg(pc4,ins,wpcir,clock,resetn,dpc4,inst);
	pipeid id_stage(mwreg,mrn,ern,ewreg,em2reg,mm2reg,dpc4,inst,wrn,wdi,ealu,malu,mmo,wwreg,clock,resetn,bpc,jpc,pcsource,wpcir,dwreg,dm2reg,dwmem,daluc,daluimm,da,db,dimm,drn,dshift,djal,dsa,regselect,dpdata);
	pipedereg de_reg(dwreg,dm2reg,dwmem,daluc,daluimm,da,db,dimm,drn,dshift,djal,dpc4,dsa,clock,resetn,ewreg,em2reg,ewmem,ealuc,ealuimm,ea,eb,eimm,ern0,eshift,ejal,epc4,esa);
	pipeexe exe_stage(ealuc,ealuimm,ea,eb,eimm,esa,eshift,ern0,epc4,ejal,ern,ealu);
	pipeemreg em_reg(ewreg,em2reg,ewmem,ealu,eb,ern,clock,resetn,mwreg,mm2reg,mwmem,malu,mb,mrn);
	pipemem mem_stage(mwmem,malu,mb,clock,memclock,mmo);
	pipemwreg mw_reg(mwreg,mm2reg,mmo,malu,mrn,clock,resetn,wwreg,wm2reg,wmo,walu,wrn);
	mux2x32 wb_stage(walu,wmo,wm2reg,wdi);
	display dp(clk,digit,node,segment);
	always @* begin
	 case (dptype)
	 2'b00:digit<=dpdata[15:0];
	 2'b01:digit<=dpdata[31:16];
	 2'b10:digit<={8'b0,pc[7:0]};
	 2'b11:digit<=count;
	 endcase
	end
	assign exec=clock;
	assign initype=inst[31:26];
endmodule