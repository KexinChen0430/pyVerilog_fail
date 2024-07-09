module CPU_top(
	input wire stp,rst,clk,
	input wire [1:0] dptype,
	input wire [4:0] regselect,
	output wire exec,
	output wire [5:0] initype,
	output wire [3:0] node,
	output wire [7:0] segment
    );
	wire stp_out,rst_out,zf;
	wire [31:0] i_pc;
	wire [31:0] dpdata;
	wire [31:0] o_pc;
	wire [31:0] o_ins;
	wire [31:0] o_sign,aluinputb;
	wire [4:0] w1;
	wire [31:0] pc_add4,add_branch,not_jump;
	wire [31:0]Wdata,Adat,Bdat,mem_data,alu_res;
	wire  RegDst,ALUsrcB,MemToReg,WriteReg,MemWrite,Branch,ALUop1,ALUop0,JMP;
	wire [2:0] aluoper;
	reg [15:0] digit,count=0;
	pbdebounce p0(clk,stp,stp_out);
	always @(posedge stp_out) count=count+1;
	pbdebounce p1(clk,rst,rst_out);
	single_pc PC0(stp_out,rst_out,i_pc,o_pc);
	Ins_Mem ins (o_pc[11:2],o_ins);
	RegFile regfile(stp_out,o_ins[25:21], o_ins[20:16],regselect, w1, Wdata, WriteReg,  Adat, Bdat, dpdata);
	Data_Mem data_mem (alu_res[7:2], Bdat,stp_out,MemWrite,mem_data);
	cpu_ctr cpuctr(o_ins[31:26],RegDst,ALUsrcB,MemToReg,WriteReg,MemWrite,Branch,ALUop1,ALUop0,JMP );
	aluc   alucontrol ({ALUop1,ALUop0}, o_ins[3:0], aluoper);
	alu   alut(Adat, aluinputb, aluoper, zf, alu_res);
	sign_extend sign(o_ins[15:0],o_sign);
	display dp(clk,digit,node,segment);
	add a1(o_pc,32'h4,pc_add4);
	add a2(pc_add4,{o_sign[29:0],2'b00},add_branch);
	assign w1=(RegDst==1)?o_ins[15:11]:o_ins[20:16];
	assign not_jump=(Branch & zf)?add_branch:pc_add4;
	assign i_pc=(JMP==1)?{pc_add4[31:29],o_ins[25:0],2'b00}:not_jump;
	assign aluinputb=(ALUsrcB==1)?o_sign:Bdat;
	assign Wdata=(MemToReg==1)?mem_data:alu_res;
	always @* begin
	 case (dptype)
	 2'b00:digit<=dpdata[15:0];
	 2'b01:digit<=dpdata[31:16];
	 2'b10:digit<=o_pc[15:0];
	 2'b11:digit<=count;
	 endcase
	end
	assign exec=stp_out;
	assign initype=o_ins[31:26];
endmodule