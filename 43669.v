module kpu(
	   input wire		clk_i, // main clock
	   input		rst_i, // reset
	   input		stop_i, // when asserted freeze execution
	   input wire		io_int_i, // external interrupt
	   output wire [`N-1:0] inst_addr_o, // inst addr we are fetching
	   input wire [`N-1:0]	inst_data_i, // inst we are fetching
	   output wire [`N-1:0] data_addr_o, // data address bus
	   output wire [3:0]	data_b_sel_o, // bytes involved into the write
	   output wire [`N-1:0] data_o, // data output bus
	   input wire [`N-1:0]	data_i, // data input bus
	   input wire		debug_i // when asserted do not increase pc
	   );
	/////////////////////////////
	// Common kpu declarations //
	/////////////////////////////
	wire [`N-1:0]		pc;
	reg [`N-1:0]		pc_orig, pc_eff;
	reg [`N-1:0]		pc_next;
	reg [`N-1:0]		pc_ret;
	// We have 3 parallel channels to read out general purpose registers
	wire [`REG_NBIT-1:0]	reg1_read_n, reg2_read_n, reg3_read_n;
	wire [`REG_N-1:0]	reg1_read, reg2_read, reg3_read;
	wire			stall;
	// Branching
	reg			pcrel_branch, abs_branch, reg_branch;
	reg			pcrel_branch_orig, abs_branch_orig, reg_branch_orig;
	reg			pcrel_branch_eff, abs_branch_eff, reg_branch_eff;
	reg			dbg_status;
	// Keeps the last interesting alu flags, posedge clk updated
	reg [3:0]		alu_flags_reg;
	// status register
	wire [`N-1:0]		sr;
	// status register ext interrupt enable updates
	reg			sr_int_enable;
	reg			sr_int_enable_wr;
	// store overflow
	reg			st_ovr_int;
	///////////////////////////
	// IF stage declarations //
	///////////////////////////
	// instruction register value at this stage
	wire [`N-1:0]		ir_0;
	wire			debug_1;
	///////////////////////////
	// ID stage declarations //
	///////////////////////////
	// instruction being decoded
	wire [`N-1:0]		ir_1;
	// op code value at this stage
	wire [5:0]		op_1  = ir_1[31:26];
	reg [5:0]		op_filtered_1;
	// current program counter at this stage
	wire [`N-1:0]		pc_1;
	// content of RS1 and RS2 at this stage
	wire [`N-1:0]		rs1_1, rs2_1;
	// register numbers
	wire [`REG_NBIT-1:0]	ra_n_1	= ir_1[25:21];
	wire [`REG_NBIT-1:0]	rb_n_1	= ir_1[20:16];
	wire [`REG_NBIT-1:0]	rc_n_1	= ir_1[15:11];
	reg [`REG_NBIT-1:0]	rd_n_1, rs1_n_1, rs2_n_1;
	// immediate values decoded and sign extended
	wire [`N-1:0]		imm16_1, imm21_1, imm26_1;
	// Immediate selected at ID stage
	reg [`N-1:0]		imm_1;
	reg [`N-1:0]		imm_1_orig;
	reg [`N-1:0]		imm_1_eff;
	// will the instruction write to a reg
	reg			wr_reg_1;
	// some op classification regs
	reg			load_op_1, write_op_1, alu_rrr_op_1,
				alu_rri_op_1, invalid_op_1;
	// in case we want to flush IF from ID
	reg			flush_0_1;
	///////////////////////////
	// EX stage declarations //
	///////////////////////////
	// instruction register value at this stage
	wire [5:0]		op_2;
	// current program counter at this stage
	wire [`N-1:0]		pc_2;
	// register numbers
	wire [`REG_NBIT-1:0]	rd_n_2, rs1_n_2, rs2_n_2;
	reg [`REG_NBIT-1:0]	reg_wr_n_2;
	// content of RS1 and RS2 at this stage
	wire [`N-1:0]		rs1_2, rs2_2;
	// content of RS1 and RS2 after ctrl pipe
	wire [`N-1:0]		rs1_2_o, rs2_2_o;
	reg [`N-1:0]		rs1_2_o_orig, rs1_2_o_eff;
	// immediate coming from ID
	wire [`N-1:0]		imm_2;
	//alu inputs
	wire [`N-1:0]		alu_in_a_2;
	reg [`N-1:0]		alu_in_b_2;
	// alu op
	reg [3:0]		alu_op;
	// alu output
	wire [`N-1:0]		alu_res_2;
	// compare flags
	wire [3:0]		alu_flags_2;
	// will the instruction write to a reg
	wire			wr_reg_2;
	// some op classification regs
	wire			alu_rrr_op_2, alu_rri_op_2, load_op_2,
				write_op_2;
	// in case we want to flush IF from EX
	reg			flush_0_2;
	// status register alu updates
	reg [3:0]		sr_alu_2;
	reg			sr_wr_2;
	////////////////////////////
	// MEM stage declarations //
	////////////////////////////
	// register numbers
	wire [`REG_NBIT-1:0]	reg_wr_n_3;
	// content of RS1 and RS2 at this stage
	wire [`N-1:0]		rs1_3;
	// Resut of the logic computation in EX
	wire [`N-1:0]		alu_res_3;
	// instruction register value at this stage
	wire [5:0]		op_3;
	// addr for writing to memory
	reg [`N-1:0]		addr_3;
	// fetched register value
	wire [`N-1:0]		read_reg_3;
	// memory byte write selector
	reg [3:0]		mem_data_sel_in_3;
	// memory data input line
	reg [`N-1:0]		mem_data_in_3;
	// memory data output line
	wire [`N-1:0]		mem_data_out_3;
	// general data output line for stage 3
	reg [`N-1:0]		data_out_3;
	// immediate value decoded and sign extended
	wire [`N-1:0]		imm_3;
	// will the instruction write to a reg
	wire			wr_reg_3;
	// will the instruction write to mem
	wire			write_op_3;
	///////////////////////////
	// WB stage declarations //
	///////////////////////////
	// register numbers
	wire [`REG_NBIT-1:0]	reg_wr_n_4;
	// data from stage 4
	wire [`N-1:0]		data_4;
	// will the instruction write back a register?
	wire			wr_reg_4;
	// general purpose registers instance
	kpu_regs kpu_regs_i(.clk_i(clk_i),
			    .rst_i(rst_i),
			    .hold_i(stop_i),
			    .pc_i(pc_next),
			    .pc_o(pc),
			    .sr_int_enable_wr(sr_int_enable_wr),
			    .sr_int_enable_i(sr_int_enable),
			    .sr_alu_wr(sr_wr_2),
			    .sr_alu_i(sr_alu_2),
			    .sr_o(sr),
			    .reg_wr_en_i(wr_reg_4),
			    .reg_wr_i(data_4),
			    .reg_wr_n_i(reg_wr_n_4),
			    .reg1_read_n_i(reg1_read_n),
			    .reg1_read_o(reg1_read),
			    .reg2_read_n_i(reg2_read_n),
			    .reg2_read_o(reg2_read),
			    .reg3_read_n_i(reg3_read_n),
			    .reg3_read_o(reg3_read));
	assign inst_addr_o  = pc_eff >> 2;
	assign ir_0  = inst_data_i;
	assign data_addr_o  = addr_3;
	assign data_b_sel_o  = mem_data_sel_in_3;
	assign mem_data_out_3  = data_i; // memory coming out from memory
	assign data_o = mem_data_in_3; // memory going into memory
	// pipe control logic instance
	pipe_stall_ctrl pipe_stall_ctrl_i(.op_1_i(op_filtered_1),
					  .alu_rrr_op_1_i(alu_rrr_op_1),
					  .alu_rri_op_1_i(alu_rri_op_1),
					  .load_op_2_i(load_op_2),
					  .rd_n_1_i(ra_n_1),
					  .rs1_n_1_i(rs1_n_1),
					  .rs2_n_1_i(rs2_n_1),
					  .rd_n_2_i(rd_n_2),
					  .stall_o(stall));
 `ifdef KPU_SIM_TRACE
	monitor monitor_i(.clk_i(clk_i),
			  .rst_i(rst_i),
			  .stop_i(stop_i),
			  .sr_wr_i(sr_wr_2 || sr_int_enable_wr),
			  .sr_i(sr),
			  .reg_wr_i(wr_reg_4),
			  .stall_i(stall),
			  .branching_i(reg_branch_eff ||
				       pcrel_branch_eff ||
				       abs_branch_eff),
			  .pc_i(pc_eff),
			  .pc_next_i(pc_next),
			  .reg_wr_n_i(reg_wr_n_4),
			  .reg_wr_data_i(data_4),
			  .mem_wr_sel_i(mem_data_sel_in_3),
			  .mem_wr_addr_i(addr_3),
			  .mem_wr_data_i(mem_data_in_3));
 `endif
	///////////////////////////////
	// STAGE 0		     //
	// INSTRUCTION FETCH	     //
	///////////////////////////////
	always @(*) begin
		if (reg_branch_eff)
			// Register branch commanded from EX stage
			pc_next	 =  rs1_2_o_eff;
		else if (pcrel_branch_eff)
			// PC relative branch commanded from ID stage
			pc_next	 = (imm_1_eff << 2) + pc_eff;
		else if (abs_branch_eff)
			// Absolute branch commanded from ID stage
			pc_next	 = imm_1_eff << 2;
		else if (stall)
			pc_next = pc_eff;
		     else
			     pc_next  = pc_eff + 4;
	end // always @ (...
	//////////////////////////////////////////////////////////////
	// The following logic is needed to delay correctly	    //
	// the cpu state coming out of debug mode		    //
	//////////////////////////////////////////////////////////////
	always @(posedge clk_i) begin
		dbg_status  <= #1 debug_i;
	end
	always @(posedge debug_i) begin
		if (dbg_status == 1'b0) begin
			pc_orig		  <= #1 pc;
			pcrel_branch_orig <= #1 pcrel_branch;
			reg_branch_orig	  <= #1 reg_branch;
			abs_branch_orig	  <= #1 abs_branch;
			rs1_2_o_orig	  <= #1 rs1_2_o;
			imm_1_orig	  <= #1 imm_1;
		end
	end
	always @(*) begin
		if (dbg_status) begin
			pc_eff		  = pc_orig;
			pcrel_branch_eff  = pcrel_branch_orig;
			reg_branch_eff	  = reg_branch_orig;
			abs_branch_eff	  = abs_branch_orig;
			rs1_2_o_eff	  = rs1_2_o_orig;
			imm_1_eff	  = imm_1_orig;
		end
		else begin
			pc_eff		  = pc;
			pcrel_branch_eff  = pcrel_branch;
			abs_branch_eff	  = abs_branch;
			reg_branch_eff	  = reg_branch;
			rs1_2_o_eff	  = rs1_2_o;
			imm_1_eff	  = imm_1;
		end
	end
	// Branch can be taken at ID stage
	always @(*) begin
		pcrel_branch  = 1'b0;
		abs_branch  = 1'b0;
		case (op_filtered_1)
			`BO_OP, `BG_OP, `BEG_OP, `BEQ_OP, `BGZ_OP: begin
				pcrel_branch = op_filtered_1[3:0] & sr[3:0] ? 1'b1 : 1'b0;
			end
			`BNEQ_OP: begin
				pcrel_branch  = !sr[2];
			end
			`BL_OP: begin
				pcrel_branch  = !sr[1] & !sr[2];
			end
			`BEL_OP: begin
				pcrel_branch  = !sr[1] | sr[2];
			end
			`CALL_OP, `JMP_OP: begin
				pcrel_branch  = 1'b1;
			end
			`INT_OP: begin
				abs_branch  = 1'b1;
			end
		endcase // case (op_filtered_1)
	end // always @ (*)
	// if-id register instance
	if_id if_id_i(.clk_i(clk_i),
		      .hold_i(stall || stop_i),
		      .rst_i(rst_i || flush_0_1 || flush_0_2),
		      .int_enable_i(sr[4]),
		      .io_int_i(io_int_i),
		      .inv_op_int_i(invalid_op_1),
		      .st_ovr_int_i(st_ovr_int),
		      .ir_i(ir_0),
		      .ir_o(ir_1),
		      .debug_i(debug_i),
		      .debug_o(debug_1));
	////////////////////////
	// STAGE 1	      //
	// INSTRUCTION DECODE //
	////////////////////////
	assign imm16_1	= $signed(ir_1[15:0]);
	assign imm21_1	= $signed(ir_1[20:0]);
	assign imm26_1	= $signed(ir_1[25:0]);
	// A first op classification and concistency check
	always @(*) begin
		load_op_1     = 1'b0;
		write_op_1    = 1'b0;
		alu_rrr_op_1  = 1'b0;
		alu_rri_op_1  = 1'b0;
		invalid_op_1  = 1'b0;
		case (op_1)
			`NOP_OP: begin
			end
			`LDW_OP, `LDH_OP, `LDHU_OP, `LDB_OP, `LDBU_OP,
			`LDAW_OP: begin
				load_op_1 = 1'b1;
			end
			`STW_OP, `STH_OP, `STHU_OP, `STB_OP, `STBU_OP,
			`STAW_OP: begin
				write_op_1  = 1'b1;
			end
			`MOV_OP, `MOVI_OP: begin
				//Move
			end
			`ADD_OP, `SUB_OP, `SHR_OP, `SHL_OP, `NOT_OP, `AND_OP,
			`OR_OP, `XOR_OP, `MULT_OP, `DIV_OP, `MOD_OP, `CMPU_OP,
			`CMP_OP: begin
				alu_rrr_op_1  = 1'b1;
			end
			`ADDI_OP, `SUBI_OP, `SHRI_OP, `SHLI_OP, `ANDI_OP,
			`ORI_OP, `XORI_OP, `MULTI_OP, `DIVI_OP, `MODI_OP,
			`CMPUI_OP, `CMPI_OP: begin
				alu_rri_op_1  = 1'b1;
			end
			`JMP_OP, `CALL_OP, `INT_OP, `JMPR_OP, `BO_OP, `BG_OP,
			`BL_OP, `BEG_OP, `BEL_OP, `BEQ_OP, `BGZ_OP, `BNEQ_OP: begin
				//Branch
			end
			default: begin
				invalid_op_1  = 1'b1;
			end
		endcase
	end // always @ (*)
	always @(*) begin
		if (invalid_op_1)
			op_filtered_1  = `NOP_OP;
		else
			op_filtered_1  = op_1;
	end
	// Register selection
	always @(*) begin
		case (op_filtered_1)
			`STW_OP, `STH_OP, `STHU_OP, `STB_OP, `STBU_OP: begin
				rd_n_1	 = `REG_NBIT'bxxxxx;
				rs1_n_1	 = rb_n_1;
				rs2_n_1	 = ra_n_1;
			end
			`STAW_OP: begin
				rd_n_1	 = `REG_NBIT'bxxxxx;
				rs1_n_1	 = ra_n_1;
				rs2_n_1	 = 4'h0;
			end
			`CALL_OP: begin
				rd_n_1	 = `REG_NBIT'd`RET_PROC_N;
				rs1_n_1	 = `REG_NBIT'd`PC_N;
				rs2_n_1	 = 4'h0;
			end
			`INT_OP: begin
				rd_n_1	 = `REG_NBIT'd`RET_INT_N;
				rs1_n_1	 = `REG_NBIT'd`PC_N;
				rs2_n_1	 = 4'h0;
			end
			`JMPR_OP: begin
				rd_n_1	 = `REG_NBIT'bxxxxx;
				rs1_n_1	 = ra_n_1;
				rs2_n_1	 = `REG_NBIT'bxxxxx;
			end
			default: begin
				rd_n_1	 = ra_n_1;
				rs1_n_1	 = rb_n_1;
				rs2_n_1	 = rc_n_1;
			end
		endcase
	end
	// Registers fetch
	assign reg1_read_n  = rs1_n_1;
	assign rs1_1  = reg1_read;
	assign reg2_read_n  = rs2_n_1;
	assign rs2_1  = reg2_read;
	// Write register
	always @(*) begin
		case (op_filtered_1)
			`LDW_OP, `LDH_OP, `LDHU_OP, `LDB_OP, `LDBU_OP, `LDAW_OP,
			`MOV_OP, `MOVI_OP: begin
				wr_reg_1  = 1'b1;
			end
			`ADD_OP, `SUB_OP, `SHR_OP, `SHL_OP, `NOT_OP, `AND_OP,
			`OR_OP, `XOR_OP, `MULT_OP, `DIV_OP, `MOD_OP, `ADDI_OP,
			`SUBI_OP, `SHRI_OP, `SHLI_OP, `ANDI_OP, `ORI_OP,
			`XORI_OP, `MULTI_OP, `DIVI_OP, `MODI_OP: begin
				// All ALU inst except compares
				wr_reg_1  = 1'b1;
			end
			`CALL_OP, `INT_OP: begin
				wr_reg_1  = 1'b1;
			end
			default: begin
				wr_reg_1  = 1'b0;
			end
		endcase
	end // always @ (*)
	// Immediate selection
	always @(*) begin
		case (op_filtered_1)
			`LDW_OP, `STW_OP: begin
				imm_1  = imm16_1 << 2;
			end
			`LDH_OP, `STH_OP, `LDHU_OP, `STHU_OP: begin
				imm_1  = imm16_1 << 1;
			end
			`LDB_OP, `STB_OP, `LDBU_OP, `STBU_OP: begin
				imm_1  = imm16_1;
			end
			`LDAW_OP, `STAW_OP: begin
				imm_1  = imm16_1 << 2;
			end
			`MOVI_OP: begin
				imm_1  = imm21_1;
			end
			`ADDI_OP, `SUBI_OP, `SHRI_OP, `SHLI_OP, `ANDI_OP,
			`ORI_OP, `XORI_OP, `MULTI_OP, `DIVI_OP, `MODI_OP,
			`CMPUI_OP, `CMPI_OP: begin
				// ALU RRI insts
				imm_1  = imm16_1;
			end
			`JMP_OP, `BO_OP, `BG_OP, `BL_OP, `BEG_OP, `BEL_OP,
			`BEQ_OP, `BGZ_OP, `BNEQ_OP: begin
				// Branch insts
				imm_1  = imm26_1;
			end
			`CALL_OP: begin
				imm_1  = imm26_1;
			end
			`INT_OP: begin
				// Interrupt
				if (sr[5] == 1'b0)
					imm_1  = imm26_1 | (`ROM_ADDR >> 2);
				else
					imm_1  = imm26_1;
			end
			default: begin
				imm_1  = `N'hxxxxxxxx;
			end
		endcase
	end
	// Prevent delayed branch
	always @(*) begin
		case (op_filtered_1)
			`INT_OP: begin
				flush_0_1  = 1'b1;
			end
			default: begin
				flush_0_1  = 1'b0;
			end
		endcase
	end
	// Update interrupt lock flag
	always @(*) begin
		if (op_filtered_1 == `INT_OP) begin
			sr_int_enable	  = 1'b0;
			sr_int_enable_wr  = 1'b1;
		end
		else begin
			sr_int_enable	  = 1'b1;
			sr_int_enable_wr  = 1'b0;
		end
	end
	// Keep return pc
	always @(posedge clk_i) begin
		if (rst_i)
			pc_ret	= `N'h0;
		else if (!stop_i)
			case (op_filtered_1)
				`CALL_OP, `INT_OP: begin
					pc_ret	= pc;
				end
			endcase
	end
	// id-ex register istance
	id_ex id_ex_i(.clk_i(clk_i),
		      .hold_i(stop_i),
		      .rst_i(rst_i || stall || st_ovr_int),	// in case insert a bubble
		      .reg_wr_i(wr_reg_1),
		      .alu_rrr_op_i(alu_rrr_op_1),
		      .alu_rri_op_i(alu_rri_op_1),
		      .mem_read_i(load_op_1),
		      .mem_wr_i(write_op_1),
		      .op_i(op_filtered_1),
		      .rd_n_i(rd_n_1),
		      .rs1_n_i(rs1_n_1),
		      .rs2_n_i(rs2_n_1),
		      .rs1_i(rs1_1),
		      .rs2_i(rs2_1),
		      .imm_1_i(imm_1),
		      .reg_wr_o(wr_reg_2),
		      .alu_rrr_op_o(alu_rrr_op_2),
		      .alu_rri_op_o(alu_rri_op_2),
		      .mem_read_o(load_op_2),
		      .mem_wr_o(write_op_2),
		      .op_o(op_2),
		      .rd_n_o(rd_n_2),
		      .rs1_n_o(rs1_n_2),
		      .rs2_n_o(rs2_n_2),
		      .rs1_o(rs1_2),
		      .rs2_o(rs2_2),
		      .imm_2_o(imm_2));
	////////////////////////////
	// STAGE 2		  //
	// INSTRUCTION EXECUTION  //
	////////////////////////////
	pipe_fw_ctrl pipe_fw_ctrl_i (.rs1_2_i(rs1_2),
				     .rs2_2_i(rs2_2),
				     .wr_reg_3_i(wr_reg_3),
				     .wr_reg_4_i(wr_reg_4),
				     .data_out_3_i(data_out_3),
				     .data_4_i(data_4),
				     .rs1_n_2_i(rs1_n_2),
				     .rs2_n_2_i(rs2_n_2),
				     .reg_wr_n_3_i(reg_wr_n_3),
				     .reg_wr_n_4_i(reg_wr_n_4),
				     .rs1_2_o(rs1_2_o),
				     .rs2_2_o(rs2_2_o));
	// Delay taken from EX (we leave just one delayed slot)
	always @(*) begin
		case (op_2)
			`JMPR_OP: begin
				reg_branch  = 1'b1;
				flush_0_2   = 1'b1;
			end
			default: begin
				reg_branch  = 1'b0;
				flush_0_2   = 1'b0;
			end
		endcase
	end
	////////////////////
	// ALU ctrl logic //
	////////////////////
	assign	alu_in_a_2  = rs1_2_o;
	always @(*) begin
		case (op_2)
			`LDAW_OP, `STAW_OP: begin
				alu_op	    = 4'h0;
				alu_in_b_2  = `N'h0;
			end
			`LDW_OP, `STW_OP, `LDH_OP, `STH_OP, `LDHU_OP, `STHU_OP,
			`LDB_OP, `STB_OP, `LDBU_OP, `STBU_OP, `MOV_OP,
			`MOVI_OP: begin
				// All mem insts except LDAW and STAW
				alu_op	    = 4'h0;
				alu_in_b_2  = imm_2;
				end
			`ADD_OP, `SUB_OP, `SHR_OP, `SHL_OP, `NOT_OP, `AND_OP,
			`OR_OP, `XOR_OP, `MULT_OP, `DIV_OP, `MOD_OP, `CMPU_OP,
			`CMP_OP: begin
				// ALU RRR insts
				alu_op	    = op_2[3:0];
				alu_in_b_2  = rs2_2_o;
				end
			`ADDI_OP, `SUBI_OP, `SHRI_OP, `SHLI_OP, `ANDI_OP,
			`ORI_OP, `XORI_OP, `MULTI_OP, `DIVI_OP, `MODI_OP, `CMPUI_OP, `CMPI_OP: begin
				// ALU RRI insts
				alu_op	    = op_2[3:0];
				alu_in_b_2  = imm_2;
				end
			default: begin
				alu_op	    = `N'h0;
				alu_in_b_2  = `N'h0;
			end
		endcase
	end
	// ALU instance
	alu alu_i(.alu_op_i(alu_op),
		  .a_i(alu_in_a_2),
		  .b_i(alu_in_b_2),
		  .out_o(alu_res_2),
		  .flags_o(alu_flags_2));
	// Status Register update from EX
	always @(*)
		if (alu_rrr_op_2 || alu_rri_op_2) begin
			sr_wr_2	  = ~debug_1;
			sr_alu_2  = alu_flags_2;
		end
		else begin
			sr_wr_2	  = 1'b0;
			sr_alu_2  = `N'hxxxxxxxx;
		end
	always @(*) begin
		case (op_2)
			`STAW_OP: begin
				reg_wr_n_2  = rs1_n_2;
			end
			`STW_OP, `STH_OP, `STHU_OP, `STB_OP, `STBU_OP: begin
				reg_wr_n_2  = rs2_n_2;
			end
			default: begin
				reg_wr_n_2  = rd_n_2;
			end
		endcase
	end
	// ex-mem register istance
	ex_mem ex_mem_i(.clk_i(clk_i),
			.hold_i(stop_i),
			.rst_i(rst_i || st_ovr_int),
			.reg_wr_i(wr_reg_2),
			.alu_res_i(alu_res_2),
			.op_i(op_2),
			.reg_wr_n_i(reg_wr_n_2),
			.rs1_i(rs1_2_o),
			.imm_i(imm_2),
			.mem_wr_i(write_op_2),
			.reg_wr_o(wr_reg_3),
			.alu_res_o(alu_res_3),
			.op_o(op_3),
			.reg_wr_n_o(reg_wr_n_3),
			.rs1_o(rs1_3),
			.imm_o(imm_3),
			.mem_wr_o(write_op_3));
	//////////////
	// STAGE 3  //
	// MEMORY   //
	//////////////
	// Fetch memory
	assign reg3_read_n  = reg_wr_n_3;
	assign read_reg_3  = reg3_read;
	always @(*) begin
		data_out_3  = `N'hxxxxxxxx;
		// data out selection
		case (op_3)
			`LDW_OP, `LDAW_OP: // LDW LDAW
				data_out_3 = mem_data_out_3;
			`LDH_OP: // LDH
				case ((alu_res_3 & 2'h3) >> 1)
					1'b0:
						data_out_3 = $signed(mem_data_out_3[31:16]);
					1'b1:
						data_out_3 = $signed(mem_data_out_3[15:0]);
				endcase
			`LDHU_OP: // LDHU
				case ((alu_res_3 & 2'h3) >> 1)
					1'b0:
						data_out_3 = mem_data_out_3[31:16];
					1'b1:
						data_out_3 = mem_data_out_3[15:0];
				endcase
			`LDB_OP: // LDB
				case (alu_res_3 & 2'h3)
					2'h0:
						data_out_3 = $signed(mem_data_out_3[31:24]);
					2'h1:
						data_out_3 = $signed(mem_data_out_3[23:16]);
					2'h2:
						data_out_3 = $signed(mem_data_out_3[15:8]);
					2'h3:
						data_out_3 = $signed(mem_data_out_3[7:0]);
				endcase
			`LDBU_OP: // LDBU
				case (alu_res_3 & 2'h3)
					2'h0:
						data_out_3 = mem_data_out_3[31:24];
					2'h1:
						data_out_3 = mem_data_out_3[23:16];
					2'h2:
						data_out_3 = mem_data_out_3[15:8];
					2'h3:
						data_out_3 = mem_data_out_3[7:0];
				endcase
			`MOV_OP: // MOV
				data_out_3 = rs1_3;
			`MOVI_OP: // MOVI
				data_out_3  = imm_3;
			`ADD_OP, `SUB_OP, `SHR_OP, `SHL_OP, `NOT_OP, `AND_OP,
			`OR_OP, `XOR_OP, `MULT_OP, `DIV_OP, `MOD_OP, `CMPU_OP, `CMP_OP,
			`ADDI_OP, `SUBI_OP, `SHRI_OP, `SHLI_OP,
			`ANDI_OP, `ORI_OP, `XORI_OP, `MULTI_OP,
			`DIVI_OP, `MODI_OP, `CMPUI_OP, `CMPI_OP: begin
				// ALU RRR and RRI instructions
				data_out_3 = alu_res_3;
			end
			`CALL_OP, `INT_OP: begin
				data_out_3  = pc_ret;
			end
		endcase
	end
	always @(*) begin
		addr_3		   = `N'h0;
		mem_data_sel_in_3  = 4'b0;
		mem_data_in_3	   = `N'h0;
		st_ovr_int	   = 1'b0;
		case (op_3)
			`LDW_OP, `LDH_OP, `LDHU_OP,
			`LDB_OP, `LDBU_OP: begin
				addr_3	= alu_res_3 >> 2;
			end
			`STW_OP: begin
				mem_data_sel_in_3  = 4'b1111;
				addr_3		   = alu_res_3 >> 2;
				mem_data_in_3	   = read_reg_3;
			end
			`STH_OP: begin
				if ($signed(read_reg_3[7:0]) != read_reg_3)
					st_ovr_int  = 1'b1;
				case ((alu_res_3 & 2'h3) >> 1)
					1'b0: begin
						mem_data_sel_in_3    = 4'b1100;
						mem_data_in_3[31:16] = read_reg_3;
					end
					1'b1: begin
						mem_data_sel_in_3   = 4'b0011;
						mem_data_in_3[15:0] = read_reg_3;
					end
				endcase
				addr_3	  = alu_res_3 >> 2;
			end
			`STHU_OP: begin
				case ((alu_res_3 & 2'h3) >> 1)
					1'b0: begin
						mem_data_sel_in_3 = 4'b1100;
						mem_data_in_3[31:16] = read_reg_3 &
								       16'hffff;
					end
					1'b1: begin
						mem_data_sel_in_3 = 4'b0011;
						mem_data_in_3[15:0] = read_reg_3 &
								      16'hffff;
					end
				endcase
				addr_3	  = alu_res_3 >> 2;
			end
			`STB_OP: begin
				if ($signed(read_reg_3[7:0]) != read_reg_3)
					st_ovr_int	    = 1'b1;
				case (alu_res_3 & 2'h3)
					2'h0: begin
						mem_data_sel_in_3     = 4'b1000;
						mem_data_in_3[31:24]  = read_reg_3;
					end
					2'h1: begin
						mem_data_sel_in_3     = 4'b0100;
						mem_data_in_3[23:16]  = read_reg_3;
					end
					2'h2: begin
						mem_data_sel_in_3    = 4'b0010;
						mem_data_in_3[15:8]  = read_reg_3;
					end
					2'h3: begin
						mem_data_sel_in_3   = 4'b0001;
						mem_data_in_3[7:0]  = read_reg_3;
					end
				endcase
				addr_3	  = alu_res_3 >> 2;
			end
			`STBU_OP: begin
				case (alu_res_3 & 2'h3)
					2'h0: begin
						mem_data_sel_in_3  = 4'b1000;
						mem_data_in_3[31:24] = read_reg_3 &
								       8'hff;
					end
					2'h1: begin
						mem_data_sel_in_3  = 4'b0100;
						mem_data_in_3[23:16] = read_reg_3 &
								       8'hff;
					end
					2'h2: begin
						mem_data_sel_in_3  = 4'b0010;
						mem_data_in_3[15:8] = read_reg_3 &
								      8'hff;
					end
					2'h3: begin
						mem_data_sel_in_3  = 4'b0001;
						mem_data_in_3[7:0] = read_reg_3 &
								     8'hff;
					end
				endcase
				addr_3	  = alu_res_3 >> 2;
			end
			`LDAW_OP: begin
				addr_3	= imm_3 >> 2;
			end
			`STAW_OP: begin
				mem_data_sel_in_3 = 4'b1111;
				addr_3	      = imm_3 >> 2;
				mem_data_in_3 = read_reg_3;
			end
		endcase
	end
	////////////////
	// STAGE 4    //
	// WRITE BACK //
	////////////////
	// mem-wb register istance
	mem_wb mem_wb_i(.clk_i(clk_i),
			.hold_i(stop_i),
			.rst_i(rst_i),
			.reg_wr_i(wr_reg_3),
			.reg_wr_n_i(reg_wr_n_3),
			.data_i(data_out_3),
			.reg_wr_o(wr_reg_4),
			.reg_wr_n_o(reg_wr_n_4),
			.data_o(data_4));
endmodule