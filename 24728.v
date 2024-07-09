module mem_stage (
	/********** NbN & Zbg **********/
	input  wire				   clk,			   // NbN
	input  wire				   reset,		   // ñ¯úZbg
	/********** pCvC§äM **********/
	input  wire				   stall,		   // Xg[
	input  wire				   flush,		   // tbV
	output wire				   busy,		   // rW[M
	/********** tH[fBO **********/
	output wire [`WordDataBus] fwd_data,	   // tH[fBOf[^
	/********** SPMC^tF[X **********/
	input  wire [`WordDataBus] spm_rd_data,	   // ÇÝoµf[^
	output wire [`WordAddrBus] spm_addr,	   // AhX
	output wire				   spm_as_,		   // AhXXg[u
	output wire				   spm_rw,		   // ÇÝ^«
	output wire [`WordDataBus] spm_wr_data,	   // «Ýf[^
	/********** oXC^tF[X **********/
	input  wire [`WordDataBus] bus_rd_data,	   // ÇÝoµf[^
	input  wire				   bus_rdy_,	   // fB
	input  wire				   bus_grnt_,	   // oXOg
	output wire				   bus_req_,	   // oXNGXg
	output wire [`WordAddrBus] bus_addr,	   // AhX
	output wire				   bus_as_,		   // AhXXg[u
	output wire				   bus_rw,		   // ÇÝ^«
	output wire [`WordDataBus] bus_wr_data,	   // «Ýf[^
	/********** EX/MEMpCvCWX^ **********/
	input  wire [`WordAddrBus] ex_pc,		   // vOJE^
	input  wire				   ex_en,		   // pCvCf[^ÌLø
	input  wire				   ex_br_flag,	   // ªòtO
	input  wire [`MemOpBus]	   ex_mem_op,	   // Iy[V
	input  wire [`WordDataBus] ex_mem_wr_data, // «Ýf[^
	input  wire [`CtrlOpBus]   ex_ctrl_op,	   // §äWX^Iy[V
	input  wire [`RegAddrBus]  ex_dst_addr,	   // ÄpWX^«ÝAhX
	input  wire				   ex_gpr_we_,	   // ÄpWX^«ÝLø
	input  wire [`IsaExpBus]   ex_exp_code,	   // áOR[h
	input  wire [`WordDataBus] ex_out,		   // Ê
	/********** MEM/WBpCvCWX^ **********/
	output wire [`WordAddrBus] mem_pc,		   // vOJE^
	output wire				   mem_en,		   // pCvCf[^ÌLø
	output wire				   mem_br_flag,	   // ªòtO
	output wire [`CtrlOpBus]   mem_ctrl_op,	   // §äWX^Iy[V
	output wire [`RegAddrBus]  mem_dst_addr,   // ÄpWX^«ÝAhX
	output wire				   mem_gpr_we_,	   // ÄpWX^«ÝLø
	output wire [`IsaExpBus]   mem_exp_code,   // áOR[h
	output wire [`WordDataBus] mem_out		   // Ê
);
	/********** àM **********/
	wire [`WordDataBus]		   rd_data;		   // ÇÝoµf[^
	wire [`WordAddrBus]		   addr;		   // AhX
	wire					   as_;			   // AhXLø
	wire					   rw;			   // ÇÝ^«
	wire [`WordDataBus]		   wr_data;		   // «Ýf[^
	wire [`WordDataBus]		   out;			   // ANZXÊ
	wire					   miss_align;	   // ~XAC
	/********** ÊÌtH[fBO **********/
	assign fwd_data	 = out;
	/********** ANZX§äjbg **********/
	mem_ctrl mem_ctrl (
		/********** EX/MEMpCvCWX^ **********/
		.ex_en			(ex_en),			   // pCvCf[^ÌLø
		.ex_mem_op		(ex_mem_op),		   // Iy[V
		.ex_mem_wr_data (ex_mem_wr_data),	   // «Ýf[^
		.ex_out			(ex_out),			   // Ê
		/********** ANZXC^tF[X **********/
		.rd_data		(rd_data),			   // ÇÝoµf[^
		.addr			(addr),				   // AhX
		.as_			(as_),				   // AhXLø
		.rw				(rw),				   // ÇÝ^«
		.wr_data		(wr_data),			   // «Ýf[^
		/********** ANZXÊ **********/
		.out			(out),				   // ANZXÊ
		.miss_align		(miss_align)		   // ~XAC
	);
	/********** oXC^tF[X **********/
	bus_if bus_if (
		/********** NbN & Zbg **********/
		.clk		 (clk),					   // NbN
		.reset		 (reset),				   // ñ¯úZbg
		/********** pCvC§äM **********/
		.stall		 (stall),				   // Xg[
		.flush		 (flush),				   // tbVM
		.busy		 (busy),				   // rW[M
		/********** CPUC^tF[X **********/
		.addr		 (addr),				   // AhX
		.as_		 (as_),					   // AhXLø
		.rw			 (rw),					   // ÇÝ^«
		.wr_data	 (wr_data),				   // «Ýf[^
		.rd_data	 (rd_data),				   // ÇÝoµf[^
		/********** XNb`pbhC^tF[X **********/
		.spm_rd_data (spm_rd_data),			   // ÇÝoµf[^
		.spm_addr	 (spm_addr),			   // AhX
		.spm_as_	 (spm_as_),				   // AhXXg[u
		.spm_rw		 (spm_rw),				   // ÇÝ^«
		.spm_wr_data (spm_wr_data),			   // «Ýf[^
		/********** oXC^tF[X **********/
		.bus_rd_data (bus_rd_data),			   // ÇÝoµf[^
		.bus_rdy_	 (bus_rdy_),			   // fB
		.bus_grnt_	 (bus_grnt_),			   // oXOg
		.bus_req_	 (bus_req_),			   // oXNGXg
		.bus_addr	 (bus_addr),			   // AhX
		.bus_as_	 (bus_as_),				   // AhXXg[u
		.bus_rw		 (bus_rw),				   // ÇÝ^«
		.bus_wr_data (bus_wr_data)			   // «Ýf[^
	);
	/********** MEMXe[WpCvCWX^ **********/
	mem_reg mem_reg (
		/********** NbN & Zbg **********/
		.clk		  (clk),				   // NbN
		.reset		  (reset),				   // ñ¯úZbg
		/********** ANZXÊ **********/
		.out		  (out),				   // Ê
		.miss_align	  (miss_align),			   // ~XAC
		/********** pCvC§äM **********/
		.stall		  (stall),				   // Xg[
		.flush		  (flush),				   // tbV
		/********** EX/MEMpCvCWX^ **********/
		.ex_pc		  (ex_pc),				   // vOJE^
		.ex_en		  (ex_en),				   // pCvCf[^ÌLø
		.ex_br_flag	  (ex_br_flag),			   // ªòtO
		.ex_ctrl_op	  (ex_ctrl_op),			   // §äWX^Iy[V
		.ex_dst_addr  (ex_dst_addr),		   // ÄpWX^«ÝAhX
		.ex_gpr_we_	  (ex_gpr_we_),			   // ÄpWX^«ÝLø
		.ex_exp_code  (ex_exp_code),		   // áOR[h
		/********** MEM/WBpCvCWX^ **********/
		.mem_pc		  (mem_pc),				   // vOJE^
		.mem_en		  (mem_en),				   // pCvCf[^ÌLø
		.mem_br_flag  (mem_br_flag),		   // ªòtO
		.mem_ctrl_op  (mem_ctrl_op),		   // §äWX^Iy[V
		.mem_dst_addr (mem_dst_addr),		   // ÄpWX^«ÝAhX
		.mem_gpr_we_  (mem_gpr_we_),		   // ÄpWX^«ÝLø
		.mem_exp_code (mem_exp_code),		   // áOR[h
		.mem_out	  (mem_out)				   // Ê
	);
endmodule