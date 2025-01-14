module cpu (
	input  wire					  clk,
	input  wire					  clk_,
	input  wire					  reset,
	input  wire [`WordDataBus]	  if_bus_rd_data,
	input  wire					  if_bus_rdy_,
	input  wire					  if_bus_grnt_,
	output wire					  if_bus_req_,
	output wire [`WordAddrBus]	  if_bus_addr,
	output wire					  if_bus_as_,
	output wire					  if_bus_rw,
	output wire [`WordDataBus]	  if_bus_wr_data,
	input  wire [`WordDataBus]	  mem_bus_rd_data,
	input  wire					  mem_bus_rdy_,
	input  wire					  mem_bus_grnt_,
	output wire					  mem_bus_req_,
	output wire [`WordAddrBus]	  mem_bus_addr,
	output wire					  mem_bus_as_,
	output wire					  mem_bus_rw,
	output wire [`WordDataBus]	  mem_bus_wr_data,
	input  wire [`CPU_IRQ_CH-1:0] cpu_irq
);
	wire [`WordAddrBus]			 if_pc;
	wire [`WordDataBus]			 if_insn;
	wire						 if_en;
	wire [`WordAddrBus]			 id_pc;
	wire						 id_en;
	wire [`AluOpBus]			 id_alu_op;
	wire [`WordDataBus]			 id_alu_in_0;
	wire [`WordDataBus]			 id_alu_in_1;
	wire						 id_br_flag;
	wire [`MemOpBus]			 id_mem_op;
	wire [`WordDataBus]			 id_mem_wr_data;
	wire [`CtrlOpBus]			 id_ctrl_op;
	wire [`RegAddrBus]			 id_dst_addr;
	wire						 id_gpr_we_;
	wire [`IsaExpBus]			 id_exp_code;
	wire [`WordAddrBus]			 ex_pc;
	wire						 ex_en;
	wire						 ex_br_flag;
	wire [`MemOpBus]			 ex_mem_op;
	wire [`WordDataBus]			 ex_mem_wr_data;
	wire [`CtrlOpBus]			 ex_ctrl_op;
	wire [`RegAddrBus]			 ex_dst_addr;
	wire						 ex_gpr_we_;
	wire [`IsaExpBus]			 ex_exp_code;
	wire [`WordDataBus]			 ex_out;
	wire [`WordAddrBus]			 mem_pc;
	wire						 mem_en;
	wire						 mem_br_flag;
	wire [`CtrlOpBus]			 mem_ctrl_op;
	wire [`RegAddrBus]			 mem_dst_addr;
	wire						 mem_gpr_we_;
	wire [`IsaExpBus]			 mem_exp_code;
	wire [`WordDataBus]			 mem_out;
	wire						 if_stall;
	wire						 id_stall;
	wire						 ex_stall;
	wire						 mem_stall;
	wire						 if_flush;
	wire						 id_flush;
	wire						 ex_flush;
	wire						 mem_flush;
	wire						 if_busy;
	wire						 mem_busy;
	wire [`WordAddrBus]			 new_pc;
	wire [`WordAddrBus]			 br_addr;
	wire						 br_taken;
	wire						 ld_hazard;
	wire [`WordDataBus]			 gpr_rd_data_0;
	wire [`WordDataBus]			 gpr_rd_data_1;
	wire [`RegAddrBus]			 gpr_rd_addr_0;
	wire [`RegAddrBus]			 gpr_rd_addr_1;
	wire [`CpuExeModeBus]		 exe_mode;
	wire [`WordDataBus]			 creg_rd_data;
	wire [`RegAddrBus]			 creg_rd_addr;
	wire						 int_detect;
	wire [`WordDataBus]			 if_spm_rd_data;
	wire [`WordAddrBus]			 if_spm_addr;
	wire						 if_spm_as_;
	wire						 if_spm_rw;
	wire [`WordDataBus]			 if_spm_wr_data;
	wire [`WordDataBus]			 mem_spm_rd_data;
	wire [`WordAddrBus]			 mem_spm_addr;
	wire						 mem_spm_as_;
	wire						 mem_spm_rw;
	wire [`WordDataBus]			 mem_spm_wr_data;
	wire [`WordDataBus]			 ex_fwd_data;
	wire [`WordDataBus]			 mem_fwd_data;
		if_stage if_stage (
		.clk			(clk),
		.reset			(reset),
		.spm_rd_data	(if_spm_rd_data),
		.spm_addr		(if_spm_addr),
		.spm_as_		(if_spm_as_),
		.spm_rw			(if_spm_rw),
		.spm_wr_data	(if_spm_wr_data),
		.bus_rd_data	(if_bus_rd_data),
		.bus_rdy_		(if_bus_rdy_),
		.bus_grnt_		(if_bus_grnt_),
		.bus_req_		(if_bus_req_),
		.bus_addr		(if_bus_addr),
		.bus_as_		(if_bus_as_),
		.bus_rw			(if_bus_rw),
		.bus_wr_data	(if_bus_wr_data),
		.stall			(if_stall),
		.flush			(if_flush),
		.new_pc			(new_pc),
		.br_taken		(br_taken),
		.br_addr		(br_addr),
		.busy			(if_busy),
		.if_pc			(if_pc),
		.if_insn		(if_insn),
		.if_en			(if_en)
	);
		id_stage id_stage (
		.clk			(clk),
		.reset			(reset),
		.gpr_rd_data_0	(gpr_rd_data_0),
		.gpr_rd_data_1	(gpr_rd_data_1),
		.gpr_rd_addr_0	(gpr_rd_addr_0),
		.gpr_rd_addr_1	(gpr_rd_addr_1),
		.ex_en			(ex_en),
		.ex_fwd_data	(ex_fwd_data),
		.ex_dst_addr	(ex_dst_addr),
		.ex_gpr_we_		(ex_gpr_we_),
		.mem_fwd_data	(mem_fwd_data),
		.exe_mode		(exe_mode),
		.creg_rd_data	(creg_rd_data),
		.creg_rd_addr	(creg_rd_addr),
		.stall		   (id_stall),
		.flush			(id_flush),
		.br_addr		(br_addr),
		.br_taken		(br_taken),
		.ld_hazard		(ld_hazard),
		.if_pc			(if_pc),
		.if_insn		(if_insn),
		.if_en			(if_en),
		.id_pc			(id_pc),
		.id_en			(id_en),
		.id_alu_op		(id_alu_op),
		.id_alu_in_0	(id_alu_in_0),
		.id_alu_in_1	(id_alu_in_1),
		.id_br_flag		(id_br_flag),
		.id_mem_op		(id_mem_op),
		.id_mem_wr_data (id_mem_wr_data),
		.id_ctrl_op		(id_ctrl_op),
		.id_dst_addr	(id_dst_addr),
		.id_gpr_we_		(id_gpr_we_),
		.id_exp_code	(id_exp_code)
	);
		ex_stage ex_stage (
		.clk			(clk),
		.reset			(reset),
		.stall			(ex_stall),
		.flush			(ex_flush),
		.int_detect		(int_detect),
		.fwd_data		(ex_fwd_data),
		.id_pc			(id_pc),
		.id_en			(id_en),
		.id_alu_op		(id_alu_op),
		.id_alu_in_0	(id_alu_in_0),
		.id_alu_in_1	(id_alu_in_1),
		.id_br_flag		(id_br_flag),
		.id_mem_op		(id_mem_op),
		.id_mem_wr_data (id_mem_wr_data),
		.id_ctrl_op		(id_ctrl_op),
		.id_dst_addr	(id_dst_addr),
		.id_gpr_we_		(id_gpr_we_),
		.id_exp_code	(id_exp_code),
		.ex_pc			(ex_pc),
		.ex_en			(ex_en),
		.ex_br_flag		(ex_br_flag),
		.ex_mem_op		(ex_mem_op),
		.ex_mem_wr_data (ex_mem_wr_data),
		.ex_ctrl_op		(ex_ctrl_op),
		.ex_dst_addr	(ex_dst_addr),
		.ex_gpr_we_		(ex_gpr_we_),
		.ex_exp_code	(ex_exp_code),
		.ex_out			(ex_out)
	);
		mem_stage mem_stage (
		.clk			(clk),
		.reset			(reset),
		.stall			(mem_stall),
		.flush			(mem_flush),
		.busy			(mem_busy),
		.fwd_data		(mem_fwd_data),
		.spm_rd_data	(mem_spm_rd_data),
		.spm_addr		(mem_spm_addr),
		.spm_as_		(mem_spm_as_),
		.spm_rw			(mem_spm_rw),
		.spm_wr_data	(mem_spm_wr_data),
		.bus_rd_data	(mem_bus_rd_data),
		.bus_rdy_		(mem_bus_rdy_),
		.bus_grnt_		(mem_bus_grnt_),
		.bus_req_		(mem_bus_req_),
		.bus_addr		(mem_bus_addr),
		.bus_as_		(mem_bus_as_),
		.bus_rw			(mem_bus_rw),
		.bus_wr_data	(mem_bus_wr_data),
		.ex_pc			(ex_pc),
		.ex_en			(ex_en),
		.ex_br_flag		(ex_br_flag),
		.ex_mem_op		(ex_mem_op),
		.ex_mem_wr_data (ex_mem_wr_data),
		.ex_ctrl_op		(ex_ctrl_op),
		.ex_dst_addr	(ex_dst_addr),
		.ex_gpr_we_		(ex_gpr_we_),
		.ex_exp_code	(ex_exp_code),
		.ex_out			(ex_out),
		.mem_pc			(mem_pc),
		.mem_en			(mem_en),
		.mem_br_flag	(mem_br_flag),
		.mem_ctrl_op	(mem_ctrl_op),
		.mem_dst_addr	(mem_dst_addr),
		.mem_gpr_we_	(mem_gpr_we_),
		.mem_exp_code	(mem_exp_code),
		.mem_out		(mem_out)
	);
		ctrl ctrl (
		.clk			(clk),
		.reset			(reset),
		.creg_rd_addr	(creg_rd_addr),
		.creg_rd_data	(creg_rd_data),
		.exe_mode		(exe_mode),
		.irq			(cpu_irq),
		.int_detect		(int_detect),
		.id_pc			(id_pc),
		.mem_pc			(mem_pc),
		.mem_en			(mem_en),
		.mem_br_flag	(mem_br_flag),
		.mem_ctrl_op	(mem_ctrl_op),
		.mem_dst_addr	(mem_dst_addr),
		.mem_exp_code	(mem_exp_code),
		.mem_out		(mem_out),
		.if_busy		(if_busy),
		.ld_hazard		(ld_hazard),
		.mem_busy		(mem_busy),
		.if_stall		(if_stall),
		.id_stall		(id_stall),
		.ex_stall		(ex_stall),
		.mem_stall		(mem_stall),
		.if_flush		(if_flush),
		.id_flush		(id_flush),
		.ex_flush		(ex_flush),
		.mem_flush		(mem_flush),
		.new_pc			(new_pc)
	);
		gpr gpr (
		.clk	   (clk),
		.reset	   (reset),
		.rd_addr_0 (gpr_rd_addr_0),
		.rd_data_0 (gpr_rd_data_0),
		.rd_addr_1 (gpr_rd_addr_1),
		.rd_data_1 (gpr_rd_data_1),
		.we_	   (mem_gpr_we_),
		.wr_addr   (mem_dst_addr),
		.wr_data   (mem_out)
	);
		spm spm (
		.clk			 (clk_),
		.if_spm_addr	 (if_spm_addr[`SpmAddrLoc]),
		.if_spm_as_		 (if_spm_as_),
		.if_spm_rw		 (if_spm_rw),
		.if_spm_wr_data	 (if_spm_wr_data),
		.if_spm_rd_data	 (if_spm_rd_data),
		.mem_spm_addr	 (mem_spm_addr[`SpmAddrLoc]),
		.mem_spm_as_	 (mem_spm_as_),
		.mem_spm_rw		 (mem_spm_rw),
		.mem_spm_wr_data (mem_spm_wr_data),
		.mem_spm_rd_data (mem_spm_rd_data)
	);
endmodule