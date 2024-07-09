module pippo_id(
	clk, rst,
	id_inst, id_cia, id_snia, id_valid,
	ex_inst, ex_cia, ex_snia, ex_valid,
	gpr_addr_rda, gpr_addr_rdb, gpr_addr_rdc, gpr_rda_en, gpr_rdb_en, gpr_rdc_en,
	ex_imm, ex_sel_a, ex_sel_b,
	ex_branch_addrofs, reg_zero, ex_spr_addr,
    set_atomic, clear_atomic,
	ex_bpu_uops, ex_alu_uops, ex_cr_uops, ex_lsu_uops, ex_reg_uops,
	ex_rfwb_uops, ex_gpr_addr_wra, ex_gpr_addr_wrb,
	multicycle_cnt, id_freeze, ex_freeze, wb_freeze, flushpipe,
	sig_syscall, sig_rfi, sig_rfci, sig_eieio, sig_isync, sig_sync, sig_illegal, sig_emulate,
	id_sig_ibuserr, sig_ibuserr
);
input					clk;
input					rst;
// pipeling registers
input					id_valid;
input	[31:0]			id_inst;
input	[29:0]			id_cia;
input	[29:0]			id_snia;
output					ex_valid;
output	[31:0]			ex_inst;
output	[29:0]			ex_cia;
output	[29:0]			ex_snia;
// operand signals: gpr read port - assert at current stage
output	[`GPR_ADDR_WIDTH-1:0]	gpr_addr_rda;
output	[`GPR_ADDR_WIDTH-1:0]	gpr_addr_rdb;
output	[`GPR_ADDR_WIDTH-1:0]	gpr_addr_rdc;
output					    gpr_rda_en;
output					    gpr_rdb_en;
output					    gpr_rdc_en;
// operand signals: imm and operandmux control - need pipeling, assert at following stage
output	[31:0]			    ex_imm;
output [`OPSEL_WIDTH-1:0]   ex_sel_a;
output [`OPSEL_WIDTH-1:0]   ex_sel_b;
// operand signals: address displacement or address - need pipeling, assert at following stage
output	[29:0]			    ex_branch_addrofs;
output                      reg_zero;
output	[`SPR_ADDR_WIDTH-1:0]	ex_spr_addr;
// uops signals, need pipeling, assert at following stages
output	[`BPUUOPS_WIDTH-1:0]	ex_bpu_uops;
output	[`ALUUOPS_WIDTH-1:0]	ex_alu_uops;
output	[`LSUUOPS_WIDTH-1:0]	ex_lsu_uops;
output	[`CRUOPS_WIDTH-1:0]	    ex_cr_uops;
output	[`REGUOPS_WIDTH-1:0]	ex_reg_uops;
// wb signals, need pipeling
//      note: write-back enable signals are encoded in rfwb_uops
output	[`RFWBUOPS_WIDTH-1:0]	ex_rfwb_uops;
output	[`GPR_ADDR_WIDTH-1:0]	ex_gpr_addr_wra;
output	[`GPR_ADDR_WIDTH-1:0]	ex_gpr_addr_wrb;
// pipeling control signals
input					id_freeze;
input					ex_freeze;
input					wb_freeze;
input					flushpipe;
// atomic memory access for lsu
output                  set_atomic;
output                  clear_atomic;
// multicycle instruction counter, assert at following stages
output	[`MULTICYCLE_WIDTH-1:0]	multicycle_cnt;
// exception request signals
output					sig_rfi;
output                  sig_rfci;
output					sig_syscall;
output					sig_illegal;
output                  sig_emulate;
// exception requests pipeling from IF stage
input                   id_sig_ibuserr;
output                  sig_ibuserr;
// synchronization signals
output					sig_eieio;
output                  sig_isync;
output                  sig_sync;
// Whole decoder
reg	[`BPUUOPS_WIDTH-1:0]	id_bpu_uops;
reg	[`ALUUOPS_WIDTH-1:0]	id_alu_uops;
reg	[`LSUUOPS_WIDTH-1:0]	id_lsu_uops;
reg	[`CRUOPS_WIDTH-1:0]	    id_cr_uops;
reg	[`REGUOPS_WIDTH-1:0]	id_reg_uops;
reg [`GPR_ADDR_WIDTH-1:0]	gpr_addr_rda;
reg	[`GPR_ADDR_WIDTH-1:0]	gpr_addr_rdb;
reg	[`GPR_ADDR_WIDTH-1:0]	gpr_addr_rdc;
reg					    gpr_rda_en;
reg					    gpr_rdb_en;
reg					    gpr_rdc_en;
reg	[`RFWBUOPS_WIDTH-1:0]	id_rfwb_uops;
reg	[`GPR_ADDR_WIDTH-1:0]	id_gpr_addr_wra;
reg [`GPR_ADDR_WIDTH-1:0]	id_gpr_addr_wrb;
reg	[29:0]			id_branch_addrofs;
reg                 id_reg_zero;
reg                 reg_zero;
reg	[9:0]			id_spr_addr;
reg	[31:0]			id_imm;
reg                 sel_imm;
reg                 id_set_atomic;
reg                 set_atomic;
reg                 id_clear_atomic;
reg                 clear_atomic;
reg [`MULTICYCLE_WIDTH-1:0] multicycle;
reg id_sig_illegal;
reg id_sig_emulate;
reg id_sig_syscall;
reg id_sig_eieio;
reg id_sig_isync;
reg id_sig_sync;
reg id_sig_rfi;
reg id_sig_rfci;
always @(id_inst or id_cia or id_snia or id_valid) begin
    // EX/WB uops
    id_bpu_uops = {2'b00, `BPUOP_NOP};      // {AA, LK, `BPUOP_NOP}
    id_alu_uops = {2'b00, `ALUOP_NOP};      // {OE, Rc, `ALUOP_NOP}
    id_lsu_uops = {1'b0, `LSUOP_NOP};       // {update, `LSUOP_NOP}
    id_reg_uops = `REGOP_NOP;
    id_cr_uops = `CROP_NOP;
    // gprs access
    gpr_addr_rda = id_inst[20:16];
    gpr_addr_rdb = id_inst[15:11];
    gpr_addr_rdc = id_inst[25:21];
    gpr_rda_en = 1'b0;
    gpr_rdb_en = 1'b0;
    gpr_rdc_en = 1'b0;
    // wb
    id_rfwb_uops = `RFWBOP_NOP;
    id_gpr_addr_wra = id_inst[25:21];
    id_gpr_addr_wrb = id_inst[20:16];       // b bus for load/store with update inst.'s EA write-back
    // imm
    sel_imm = 1'b0;
    id_imm = 32'd0;
    // address operands
    id_branch_addrofs = 30'd0;
    id_spr_addr = 10'd0;
    id_reg_zero = 1'b0;
    // atomic memory access
    id_set_atomic = 1'b0;
    id_clear_atomic = 1'b0;
    // multicycle instruction indicator: to extend pipeline stages - for memory access and complex insts
    multicycle = `EXTEND_ZERO_CYCLES;
    // exception request
    id_sig_illegal = 1'b1;
    id_sig_emulate = 1'b0;
    id_sig_syscall = 1'b0;
    id_sig_rfi = 1'b0;
    id_sig_rfci = 1'b0;
    // synchronization request
    id_sig_eieio = 1'b0;
    id_sig_isync = 1'b0;
    id_sig_sync = 1'b0;
    case (id_inst[31:26])		// synopsys parallel_case
        // I-Form
        //  inst: b[l][a],
        //  execution: bpu
        //  flowchart:
        //      b:     (cia+imm) -> PC
        //      ba:    imm -> PC
        //      bl:    (cia+imm) -> PC; (cia+4) -> LR
        //      bla:   imm -> PC; (cia+4) -> LR
	    `Bx_OPCD: begin
            id_bpu_uops = {id_inst[1:0], `BPUOP_BIMM}; // {AA,LK, `BPUOP_BIMM}
	        id_branch_addrofs = {{6{id_inst[25]}}, id_inst[25:2]};
	        id_sig_illegal = 1'b0;
	    end
        // B-Form
        //  inst: bc[l][a]
        //  execution: bpu
        //  flowchart:
        //      (CTR, BO, BI) -> (c)
        //      bc:     (cia+imm) ->(c) PC
        //      bca:    imm -> (c)PC
        //      bcl:    (cia+imm) -> (c)PC; (cia+4) -> LR
        //      bcla:   imm -> (c)PC; (cia+4) -> LR
	    `BCx_OPCD: begin
            id_bpu_uops = {id_inst[1:0], `BPUOP_BCIMM}; // {AA,LK, `BPUOP_BCIMM}
	        id_branch_addrofs = {{16{id_inst[15]}}, id_inst[15:2]};
	        id_sig_illegal = 1'b0;
	    end
        // SC-Form
        //  inst: sc
        //  execution: except
        //      wb: (MSR) -> (SRR1);
        //          (PC)->(SRR0);
        //          EVPR[0:15]||0x0C00 -> PC;
        //          0 -> (MSR[WE, EE, PR, DR, IR])
        `SC_OPCD: begin
            id_sig_syscall = 1;
            id_sig_illegal = 1'b0;
            `ifdef pippo_VERBOSE
            // synopsys translate_off
                $display("Generating sig_syscall");
            // synopsys translate_on
            `endif
        end
        // D-Form
        // All D-Form inst. have unique OPCD
        // addi
        `ADDI_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_ADD};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
        end
        //  addic
        `ADDIC_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_ADDC};
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
        end
        //  addic.
        `ADDICx_OPCD: begin
            id_alu_uops = {2'b01, `ALUOP_ADDC};    // record CR
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
        end
        //  addis
        `ADDIS_OPCD: begin
            id_alu_uops = {2'b01, `ALUOP_ADDC};    // record CR
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {id_inst[15:0], {16{1'b0}}};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
        end
        `ANDIx_OPCD: begin
            id_alu_uops = {2'b01, `ALUOP_AND};    // record CR
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {{16{1'b0}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        `ANDISx_OPCD: begin
            id_alu_uops = {2'b01, `ALUOP_AND};    // record CR
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {id_inst[15:0], {16{1'b0}}};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        `ORI_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_OR};
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {{16{1'b0}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        `ORIS_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_OR};
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {id_inst[15:0], {16{1'b0}}};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        `XORI_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_XOR};
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {{16{1'b0}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        `XORIS_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_XOR};
            gpr_addr_rda = id_inst[25:21];
            gpr_rda_en = 1'b1;
            id_imm = {id_inst[15:0], {16{1'b0}}};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[20:16];
            id_sig_illegal = 1'b0;
        end
        // inst: cmpi
        // execution: alu
        // flowchart:
        //      (RA) cmp EXTS(IM) -> CR[CRbf]
        `CMPI_OPCD: begin
            id_cr_uops = `CROP_CMP;
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_sig_illegal = 1'b0;
        end
        // inst: cmpli
        // execution: alu
        // flowchart:
        //      (RA) cmpl EXTS(IM) -> CR[CRbf]
        `CMPLI_OPCD: begin
            id_cr_uops = `CROP_CMPL;
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_sig_illegal = 1'b0;
        end
        // inst.: lbz
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, {24{0}, mem(EA, 1 Byte)} -> (RT)
        `LBZ_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_LBZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
    	end
        // inst.: lha
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, EXTS(mem(EA, 2 Byte)) -> (RT)
        `LHA_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_LHA};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
    	end
        // inst.: lhz
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, {16{0}, mem(EA, 2 Byte)} -> (RT)
        `LHZ_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_LHZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
    	end
        // inst.: lwz
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, mem(EA, 4 Byte) -> (RT)
        `LWZ_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_LWZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
    	end
        // inst.: stb
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, RS[7:0] -> mem(EA, 1 Byte)
        `STB_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_STB};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_sig_illegal = 1'b0;
    	end
        // inst.: sth
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, RS[15:0] -> mem(EA, 2 Byte)
        `STH_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_STH};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_sig_illegal = 1'b0;
    	end
        // inst.: stw
        // execution: lsu
        // flowchart:
        //      1, (RA|0) + EXTS(D) -> EA;
        //      2, RS[31:0] -> mem(EA, 4 Byte)
        `STW_OPCD: begin
            id_lsu_uops = {1'b0, `LSUOP_STW};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_sig_illegal = 1'b0;
    	end
        //  lbzu
        `LBZU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_LBZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);     // [TBD] invalid form, how to deal at hardware side
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUTWO;
            id_gpr_addr_wra = id_inst[25:21];
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  lhau
        `LHAU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_LHA};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUTWO;
            id_gpr_addr_wra = id_inst[25:21];
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  lhzu
        `LHZU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_LHZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUTWO;
            id_gpr_addr_wra = id_inst[25:21];
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  lwzu
        `LWZU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_LWZ};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUTWO;
            id_gpr_addr_wra = id_inst[25:21];
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  stbu
        `STBU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_STB};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUEA;
            id_gpr_addr_wrb = id_inst[20:16];       //[TBV] to use write port b
            id_sig_illegal = 1'b0;
    	end
        //  sthu
        `STHU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_STH};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUEA;
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  stwu
        `STWU_OPCD: begin
            id_lsu_uops = {1'b1, `LSUOP_STW};
            id_reg_zero = (id_inst[20:16] == 5'b00000);
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_rfwb_uops = `RFWBOP_LSUEA;
            id_gpr_addr_wrb = id_inst[20:16];
            id_sig_illegal = 1'b0;
    	end
        //  mulli
        `MULLI_OPCD: begin
            id_alu_uops = {2'b00, `ALUOP_MULLI};
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            gpr_addr_rdc = id_inst[25:21];
            gpr_rdc_en = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_sig_illegal = 1'b0;
            multicycle = `EXTEND_TWO_CYCLES;
        end
        //  lmw
        `LMW_OPCD: begin
            id_sig_illegal = 1'b0;
            id_sig_emulate = 1'b1;
        end
        //  stmw
        `STMW_OPCD: begin
            id_sig_illegal = 1'b0;
            id_sig_emulate = 1'b1;
        end
        //  subfic
        //      exe: RB - EXTS(IM) -> RT;
        `SUBFIC_OPCD: begin
            id_alu_uops = {2'b00,`ALUOP_SUBFC};
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_rfwb_uops = `RFWBOP_ALU;
            id_gpr_addr_wra = id_inst[25:21];
            id_sig_illegal = 1'b0;
        end
        //  twi
        //      exe:
        `TWI_OPCD: begin
            id_cr_uops = `CROP_TRAP;
            gpr_addr_rda = id_inst[20:16];
            gpr_rda_en = 1'b1;
            id_imm = {{16{id_inst[15]}}, id_inst[15:0]};
            sel_imm = 1'b1;
            id_sig_illegal = 1'b0;
        end
        // XL-Form
        // all XL-Form instructions have same OPCD: 19
	    `BCCTRx_OPCD: begin
            case (id_inst[10:1]) // synopsys parallel_case
                //  inst: bcctr[l], XL-Form
                //  execution: bpu
                //  flowchart:
                //      (CTR, BO, BI) -> (c)
                //      bcctr:  (CTR[31:2], 2'b00) -> (c)PC; (c)(CTR)
                //      bcctrl: (CTR[31:2], 2'b00) -> (c)PC; (c)(CTR); (cia+4) -> LR
                `BCCTRx_XO: begin
                    id_bpu_uops = {1'b0, id_inst[0], `BPUOP_BCCTR}; // {AA,LK, BPUOP}
                    id_sig_illegal = 1'b0;
                end
                //  inst: bclr[l], XL-Form
                //  execution: bpu
                //  flowchart:
                //      (CTR, BO, BI) -> (c)
                //      bclr:  (LR[31:2], 2'b00) -> (c)PC; (c)(CTR)
                //      bclrl: (LR[31:2], 2'b00) -> (c)PC; (c)(CTR); (cia+4) -> LR
                `BCLRx_XO: begin
                    id_bpu_uops = {1'b0, id_inst[0], `BPUOP_BCLR}; // {AA,LK, BPUOP}
                    id_sig_illegal = 1'b0;
                end
                // inst: crand, XL-form
                // execution: alu
                // flowchart:
                //      CR[crb_a] func CR[crb_b] -> CR[crb_d]
	            `CRAND_XO: begin
                    id_cr_uops = `CROP_AND;
                    id_sig_illegal = 1'b0;
	            end
	            `CRANDC_XO : begin
                    id_cr_uops = `CROP_ANDC;
                    id_sig_illegal = 1'b0;
	            end
	            `CREQV_XO : begin
                    id_cr_uops = `CROP_EQV;
                    id_sig_illegal = 1'b0;
	            end
	            `CRORC_XO : begin
                    id_cr_uops = `CROP_ORC;
                    id_sig_illegal = 1'b0;
	            end
	            `CRNAND_XO : begin
                    id_cr_uops = `CROP_NAND;
                    id_sig_illegal = 1'b0;
	            end
	            `CRNOR_XO : begin
                    id_cr_uops = `CROP_NOR;
                    id_sig_illegal = 1'b0;
	            end
	            `CROR_XO : begin
                    id_cr_uops = `CROP_OR;
                    id_sig_illegal = 1'b0;
	            end
	            `CRXOR_XO : begin
                    id_cr_uops = `CROP_XOR;
                    id_sig_illegal = 1'b0;
	            end
                `MCRF_XO : begin
                    id_reg_uops = `REGOP_MCRF;
                    id_sig_illegal = 1'b0;
                end
                `ISYNC_XO : begin
                    id_sig_isync = 1;
                    id_sig_illegal = 1'b0;
                    `ifdef pippo_VERBOSE
                    // synopsys translate_off
                        $display("Generating sig_isync");
                    // synopsys translate_on
                    `endif
                end
                `RFI_XO : begin
                    id_sig_rfi = 1;
                    id_sig_illegal = 1'b0;
                    `ifdef pippo_VERBOSE
                    // synopsys translate_off
                        $display("Generating sig_rfi");
                    // synopsys translate_on
                    `endif
                end
                `RFCI_XO : begin
                    id_sig_rfci = 1;
                    id_sig_illegal = 1'b0;
                    `ifdef pippo_VERBOSE
                    // synopsys translate_off
                        $display("Generating sig_rfci");
                    // synopsys translate_on
                    `endif
                end
    	    endcase // XO field of XL-Form
        end
        // OPCD: 31
        // including£º
        //      1, all XO-form instructions
        //      2, all XFX-form instructions
        //      3, part of X-form instructions, excluding fpu-related instructions(OPCD-63)
        `ADDx_OPCD: begin
            casex (id_inst[10:1]) // synopsys parallel_case
            // XO-Form
                // inst.: add[o][.]
                // execution: alu
                // flowchart:
                //      (RA)+(RB) -> (RT);
                //                   (RT)->(Rc)CR[CR0]
                //                   (RT)->(OE)XER[SO, OV]
                {1'bx, `ADDx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_ADD};    // {OE,Rc,`ALUOP_ADD}
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // inst.: addc[o][.]
                // execution: alu
                // flowchart:
                //      (RA)+(RB) -> (RT);
                //                   (RT)->XER[CA]
                //                   (RT)->(Rc)CR[CR0]
                //                   (RT)->(OE)XER[SO, OV]
                {1'bx, `ADDCx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_ADDC};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // inst: subf[o][.] - alu
                //      exe: RB - RA -> RT;
                //                      (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `SUBFx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_SUBF};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: neg[o][.] - alu
                //      exe: Rev(RA) + 1 -> RT;
                //                          (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `NEGx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_NEG};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: adde[o][.] - alu
                //      exe: RA + RB + XER[CA] -> RT, XER[CA];
                //                                (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `ADDEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_ADDE};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // ADDMEx
                // Inst: addme[o][.] - alu
                //      exe: RA + XER[CA] + (-1) -> RT, XER[CA];
                //                                  (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `ADDMEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_ADDE};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    id_imm = {32{1'b1}};
                    sel_imm = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: addze[o][.] - alu
                //      exe: RA + XER[CA] -> RT, XER[CA];
                //                          (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `ADDZEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_ADDE};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    id_imm = {32{1'b0}};
                    sel_imm = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: subfc[o][.] - alu
                //      exe: RB - RA -> RT, XER[CA];
                //                      (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `SUBFCx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_SUBFC};
                    gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: subfe[o][.] - alu
                //      exe: Rev(RA) + RB + XER[CA] -> RT, XER[CA];
                //                                     (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `SUBFEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_SUBFE};
                    gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: subfme[o][.] - alu
                //      exe: Rev(RA) - 1 + XER[CA] -> RT, XER[CA];
                //                                    (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `SUBFMEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_SUBFE};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    id_imm = {32{1'b1}};
                    sel_imm = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // Inst: subfze[o][.] - alu
                //      exe: Rev(RA) + XER[CA] -> RT, XER[CA];
                //                                    (Rc)CR[CR0], (OE)XER[SO, OV]
                {1'bx, `SUBFZEx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_SUBFE};
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    id_imm = {32{1'b0}};
                    sel_imm = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // MULHWx
                {1'b0, `MULHWx_XO}: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_MULHW};
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_sig_illegal = 1'b0;
                    multicycle = `EXTEND_TWO_CYCLES;
                end
                // MULLWx - Not Implemented Currently
                {1'bx, `MULLWx_XO}: begin
                    id_alu_uops = {id_inst[10], id_inst[0],`ALUOP_MULHWU};
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_sig_illegal = 1'b0;
                    multicycle = `EXTEND_TWO_CYCLES;
                end
                // MULHWUx - Not Implemented Currently
                {1'b0, `MULHWUx_XO}: begin
                    id_alu_uops = {1'b0, id_inst[0],`ALUOP_MULHW};
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_sig_illegal = 1'b0;
                    multicycle = `EXTEND_TWO_CYCLES;
                end
                // DIVWx - Not Implemented Currently
                {1'b0, `DIVWx_XO}: begin
                    id_sig_illegal = 1'b0;
                    id_sig_emulate = 1'b1;
                end
                // DIVWUx - Not Implemented Currently
                {1'b0, `DIVWUx_XO}: begin
                    id_sig_illegal = 1'b0;
                    id_sig_emulate = 1'b1;
                end
            // XFX-Form
                // mfspr
                `MFSPR_XO: begin
                    id_reg_uops = `REGOP_MFSPR;
                    id_spr_addr = {id_inst[15:11], id_inst[20:16]};
                    id_rfwb_uops = `RFWBOP_SPRS;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // mtspr
                `MTSPR_XO: begin
                    id_reg_uops = `REGOP_MTSPR;
                    id_spr_addr = {id_inst[15:11], id_inst[20:16]};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // mtcrf
                `MTCRF_XO: begin
                    id_reg_uops = `REGOP_MTCRF;
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                //  mftb: not-implemented
                // mfspr
                `MFTB_XO: begin
                    id_reg_uops = `REGOP_MFSPR;
                    id_spr_addr = {id_inst[15:11], id_inst[20:16]};
                    id_rfwb_uops = `RFWBOP_SPRS;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                //  mtdcr/mfdcr: not-implemented
                `MFDCR_XO: begin
                    id_reg_uops = `REGOP_MFSPR;
                    id_spr_addr = {id_inst[15:11], id_inst[20:16]};
                    id_rfwb_uops = `RFWBOP_SPRS;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                //  mtdcr/mfdcr: not-implemented
                `MTDCR_XO: begin
                    id_reg_uops = `REGOP_MTSPR;
                    id_spr_addr = {id_inst[15:11], id_inst[20:16]};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
            // X-Form
                // inst: and[.]
                // execution: alu
                // flowchart:
                //      (RS) and (RB) -> (RA)
                `ANDx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_AND};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: andc[.]
                // execution: alu
                // flowchart:
                //      (RS) andc (RB) -> (RA)
                `ANDCx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_ANDC};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: nand[.]
                // execution: alu
                // flowchart:
                //      (RS) nand (RB) -> (RA)
                `NANDx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_NAND};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: or[.]
                // execution: alu
                // flowchart:
                //      (RS) or (RB) -> (RA)
                `ORx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_OR};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: orc[.]
                // execution: alu
                // flowchart:
                //      (RS) orc (RB) -> (RA)
                `ORCx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_ORC};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: xor[.]
                // execution: alu
                // flowchart:
                //      (RS) xor (RB) -> (RA)
                `XORx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_XOR};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: nor[.]
                // execution: alu
                // flowchart:
                //      (RS) nor (RB) -> (RA)
                `NORx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_NOR};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: eqv[.]
                // execution: alu
                // flowchart:
                //      (RS) eqv (RB) -> (RA)
                `EQVx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_EQV};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: cntlzw[.]
                // execution: alu
                // flowchart:
                //      cntlzw(RS) -> (RA)
                `CNTLZWx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_CNTLZW};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: extsb[.]
                // execution: alu
                // flowchart:
                //      extsb(RS) -> (RA)
                `EXTSBx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_EXTSB};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: extsh[.]
                // execution: alu
                // flowchart:
                //      extsb(RS) -> (RA)
                `EXTSHx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_EXTSH};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: slw[.]
                // execution: alu
                // flowchart:
                //      (RS) slw (RB) -> (RA)
                `SLWx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_SLW};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: srw[.]
                // execution: alu
                // flowchart:
                //      (RS) srw (RB) -> (RA)
                `SRWx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_SRW};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: sraw[.]
                // execution: alu
                // flowchart:
                //      (RS) sraw (RB) -> (RA)
                `SRAWx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_SRAW};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: srawi[.]
                // execution: alu
                // flowchart:
                //      (RS) sraw (SH) -> (RA)
                `SRAWIx_XO: begin
                    id_alu_uops = {1'b0, id_inst[0], `ALUOP_SRAWI};
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_ALU;
                    id_gpr_addr_wra = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // inst: cmp
                // execution: alu
                // flowchart:
                //      (RA) cmp (RB) -> CR[CRbf]
                `CMP_XO: begin
                    id_cr_uops = `CROP_CMP;
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // inst: cmpl
                // execution: alu
                // flowchart:
                //      (RA) cmpl (RB) -> CR[CRbf]
                `CMPL_XO: begin
                    id_cr_uops = `CROP_CMPL;
    	            gpr_addr_rda = id_inst[20:16];
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rdb_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // inst.: lbzx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, {24{0}, mem(EA, 1 Byte)} -> (RT)
                `LBZX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LBZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // inst.: lhax
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, {16{sign}, mem(EA, 2 Byte)} -> (RT)
                `LHAX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LHA};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: lhzx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, {16{0}, mem(EA, 2 Byte)} -> (RT)
                `LHZX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LHZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: lhbrx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, {16{0}, mem(EA+1, 1 Byte), mem(EA, 1 Byte)} -> (RT)
                `LHBRX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LHZB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: lwzx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, mem(EA, 4 Byte) -> (RT)
                `LWZX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LWZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: lwbrx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, {mem(EA+3, 1 Byte), mem(EA+2, 1 Byte), mem(EA+1, 1 Byte), mem(EA, 1 Byte),  }-> (RT)
                `LWBRX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LWZB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: lwarx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + (RB) -> EA;
                //      2, mem(EA, 4 Byte) -> (RT)
                //      3, reg_atomic set to 1
                `LWARX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_LWZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    id_set_atomic = 1'b1;
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSU;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
            	end
                // inst.: stwcx.
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, RS[31:0] -> mem(EA, 4)
                `STWCXx_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STW};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    id_clear_atomic = 1'b1;
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
                // inst.: stbx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, RS[7:0] -> mem(EA, 1)
                `STBX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
                // inst.: sthx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, RS[15:0] -> mem(EA, 2)
                `STHX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STH};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
                // inst.: sthbrx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, {RS[7:0], RS[15:8]} -> mem(EA, 2)
                `STHBRX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STHB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
                // inst.: stwx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, RS[31:0] -> mem(EA, 4)
                `STWX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STW};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
                // inst.: stwbrx
                // execution: lsu
                // flowchart:
                //      1, (RA|0) + EXTS(D) -> EA;
                //      2, {RS[7:0], RS[15:8], RS[23:16], RS[31:24]} -> mem(EA, 4)
                `STWBRX_XO: begin
                    id_lsu_uops = {1'b0, `LSUOP_STWB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_sig_illegal = 1'b0;
            	end
               // lbzux
                `LBZUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_LBZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUTWO;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
                end
                // lhaux
                `LHAUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_LHA};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUTWO;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // lhzux
                `LHZUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_LHZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUTWO;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // lwzux
                `LWZUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_LWZ};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUTWO;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // stbux
                `STBUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_STB};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUEA;
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // sthux
                `STHUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_STH};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUEA;
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // stwux
                `STWUX_XO: begin
                    id_lsu_uops = {1'b1, `LSUOP_STW};
                    id_reg_zero = (id_inst[20:16] == 5'b00000);
                    gpr_addr_rda = id_inst[20:16];
                    gpr_rda_en = 1'b1;
                    gpr_addr_rdb = id_inst[15:11];
                    gpr_rdb_en = 1'b1;
                    gpr_addr_rdc = id_inst[25:21];
                    gpr_rdc_en = 1'b1;
                    id_rfwb_uops = `RFWBOP_LSUEA;
                    id_gpr_addr_wrb = id_inst[20:16];
                    id_sig_illegal = 1'b0;
            	end
                // mfcr
                `MFCR_XO: begin
                    id_reg_uops = `REGOP_MFCR;
                    id_rfwb_uops = `RFWBOP_SPRS;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // mfmsr
                `MFMSR_XO: begin
                    id_reg_uops = `REGOP_MFMSR;
                    id_rfwb_uops = `RFWBOP_SPRS;
                    id_gpr_addr_wra = id_inst[25:21];
                    id_sig_illegal = 1'b0;
                end
                // mtspr
                `MTMSR_XO: begin
                    id_reg_uops = `REGOP_MTMSR;
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // mcrxr
                `MCRXR_XO: begin
                    id_reg_uops = `REGOP_MCRXR;
                    id_sig_illegal = 1'b0;
                end
                // tw
                `TW_XO: begin
                    id_cr_uops = `CROP_TRAP;
                    gpr_addr_rda = id_inst[20:16];
    	            gpr_addr_rdb = id_inst[15:11];
                    gpr_rda_en = 1'b1;
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // sync
                `SYNC_XO: begin
                    id_sig_sync = 1;
                    id_sig_illegal = 1'b0;
                    `ifdef pippo_VERBOSE
                    // synopsys translate_off
                        $display("Generating sig_sync");
                    // synopsys translate_on
                    `endif
                end
                // eieio
                `EIEIO_XO: begin
                    id_sig_eieio = 1;
                    id_sig_illegal = 1'b0;
                    `ifdef pippo_VERBOSE
                    // synopsys translate_off
                        $display("Generating sig_eieio");
                    // synopsys translate_on
                    `endif
                end
                // inst. below are decoding as X-Form, to affirm[TBD]
                // wrtee
                `WRTEE_XO: begin
                    id_reg_uops = `REGOP_WRTEE;
    	            gpr_addr_rda = id_inst[25:21];
                    gpr_rda_en = 1'b1;
                    id_sig_illegal = 1'b0;
                end
                // wrteei
                `WRTEEI_XO: begin
                    id_reg_uops = `REGOP_WRTEE;
                    id_imm = {{16{1'bx}}, id_inst[15], {15{1'bx}}};
                    sel_imm = 1'b1;
                    id_sig_illegal = 1'b0;
                end
            endcase // XO field
    	end
        // M-Form
            // inst: rlwimix[.]
            // execution: alu
            // flowchart:
            `RLWIMIx_OPCD: begin
                id_alu_uops = {1'b0, id_inst[0], `ALUOP_RLWIMI};
	            gpr_addr_rda = id_inst[25:21];
                gpr_addr_rdb = id_inst[20:16];
                gpr_rda_en = 1'b1;
                gpr_rdb_en = 1'b1;
                id_rfwb_uops = `RFWBOP_ALU;
                id_gpr_addr_wra = id_inst[20:16];
                id_sig_illegal = 1'b0;
            end
            // inst: rlwinmx[.]
            // execution: alu
            // flowchart:
            `RLWINMx_OPCD: begin
                id_alu_uops = {1'b0, id_inst[0], `ALUOP_RLWINM};
	            gpr_addr_rda = id_inst[25:21];
                gpr_rda_en = 1'b1;
                id_rfwb_uops = `RFWBOP_ALU;
                id_gpr_addr_wra = id_inst[20:16];
                id_sig_illegal = 1'b0;
            end
            // inst: rlwnmx[.]
            // execution: alu
            // flowchart:
            `RLWNMx_OPCD: begin
                id_alu_uops = {1'b0, id_inst[0], `ALUOP_RLWNM};
	            gpr_addr_rda = id_inst[25:21];
                gpr_addr_rdb = id_inst[15:11];
                gpr_rda_en = 1'b1;
                gpr_rdb_en = 1'b1;
                id_rfwb_uops = `RFWBOP_ALU;
                id_gpr_addr_wra = id_inst[20:16];
                id_sig_illegal = 1'b0;
            end
        // XFL-Form
        //  inst: mtfsf (Move to FPSCR Fields), Not-Implemented at pippo
        // A-Form
        //   for FPU, currently non implemented
    endcase // OPCODE field
end
// Forwarding logic
// write address pipeling
// [TBV] reset and flush logic
reg	[`GPR_ADDR_WIDTH-1:0]	ex_gpr_addr_wra;
reg	[`GPR_ADDR_WIDTH-1:0]	ex_gpr_addr_wrb;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		ex_gpr_addr_wra <= #1 5'd0;
		ex_gpr_addr_wrb <= #1 5'd0;
    end
	else if (!ex_freeze & id_freeze | flushpipe) begin
		ex_gpr_addr_wra <= #1 5'd0;
		ex_gpr_addr_wrb <= #1 5'd0;
	end
	else if (!ex_freeze) begin
		ex_gpr_addr_wra <= #1 id_gpr_addr_wra;
		ex_gpr_addr_wrb <= #1 id_gpr_addr_wrb;
	end
end
// operandmux control signals: sel_a/sel_b
reg [`OPSEL_WIDTH-1:0]  id_sel_a;
reg [`OPSEL_WIDTH-1:0]  id_sel_b;
always @(gpr_addr_rda or ex_gpr_addr_wra or ex_gpr_addr_wrb or ex_rfwb_uops) begin
	if ((gpr_addr_rda == ex_gpr_addr_wra) && ex_rfwb_uops[0])
		id_sel_a = `OPSEL_WBFWD;
	else if ((gpr_addr_rda == ex_gpr_addr_wrb) && ex_rfwb_uops[1])
		id_sel_a = `OPSEL_WBFWD;
	else
		id_sel_a = `OPSEL_RF;
end
always @(sel_imm or gpr_addr_rdb or ex_gpr_addr_wra or ex_gpr_addr_wrb or ex_rfwb_uops) begin
	if (sel_imm)
		id_sel_b = `OPSEL_IMM;
	else if ((gpr_addr_rdb == ex_gpr_addr_wra) && ex_rfwb_uops[0])
		id_sel_b = `OPSEL_WBFWD;
	else if ((gpr_addr_rdb == ex_gpr_addr_wrb) && ex_rfwb_uops[1])
		id_sel_b = `OPSEL_WBFWD;
	else
		id_sel_b = `OPSEL_RF;
end
// [TBV] operandmuxÐÅºÅ£¨sel_a/sel_b£©µÄ¸´Î»Âß¼­ºÍ¶³½áÂß¼­
reg [`OPSEL_WIDTH-1:0]  ex_sel_a;
reg [`OPSEL_WIDTH-1:0]  ex_sel_b;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		ex_sel_a <= #1 `OPSEL_RF;
		ex_sel_b <= #1 `OPSEL_RF;
	end
	else if (!ex_freeze & id_freeze | flushpipe) begin
		ex_sel_a <= #1 `OPSEL_RF;
		ex_sel_b <= #1 `OPSEL_RF;
	end
	else if (!ex_freeze) begin
		ex_sel_a <= #1 id_sel_a;
		ex_sel_b <= #1 id_sel_b;
	end
end
// Multicycle stall, send at EXE stage
reg	[`MULTICYCLE_WIDTH-1:0]	multicycle_cnt;
always @(posedge clk or posedge rst) begin
	if (rst)
		multicycle_cnt <= #1 2'b00;
	else if (|multicycle_cnt)
		multicycle_cnt <= #1 multicycle_cnt - 2'd1;
	else if (|multicycle & !ex_freeze)
		multicycle_cnt <= #1 multicycle;
end
// ID/EX pipelining logic
// pipeling of uops
reg	[`BPUUOPS_WIDTH-1:0]	    ex_bpu_uops;
reg	[`ALUUOPS_WIDTH-1:0]		ex_alu_uops;
reg	[`LSUUOPS_WIDTH-1:0]		ex_lsu_uops;
reg	[`RFWBUOPS_WIDTH-1:0]		ex_reg_uops;
reg	[`RFWBUOPS_WIDTH-1:0]		ex_cr_uops;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		ex_bpu_uops <= #1 {2'b00, `BPUOP_NOP};      // {AA, LK, `BPUOP_NOP}
		ex_alu_uops <= #1 {2'b00, `ALUOP_NOP};      // {OE, Rc, `ALUOP_ADD}
		ex_lsu_uops <= #1 `LSUOP_NOP;
		ex_reg_uops <= #1 `REGOP_NOP;
		ex_cr_uops <= #1 `CROP_NOP;
	end
	else if (!ex_freeze & id_freeze | flushpipe) begin
		ex_bpu_uops <= #1 {2'b00, `BPUOP_NOP};      // {AA, LK, `BPUOP_NOP}
		ex_alu_uops <= #1 {2'b00, `ALUOP_NOP};     // {OE, Rc, `ALUOP_ADD}
		ex_lsu_uops <= #1 `LSUOP_NOP;
		ex_reg_uops <= #1 `REGOP_NOP;
		ex_cr_uops <= #1 `CROP_NOP;
	end
	else if (!ex_freeze) begin
		ex_bpu_uops <= #1 id_bpu_uops;
		ex_alu_uops <= #1 id_alu_uops;
		ex_lsu_uops <= #1 id_lsu_uops;
		ex_reg_uops <= #1 id_reg_uops;
		ex_cr_uops <= #1 id_cr_uops;
	end
end
// RFWB_UPOS pipelining
reg	[`RFWBUOPS_WIDTH-1:0]		ex_rfwb_uops;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		ex_rfwb_uops <= #1 `RFWBOP_NOP;
	end
	else if (!ex_freeze & id_freeze | flushpipe) begin
		ex_rfwb_uops <= #1 `RFWBOP_NOP;
	end
	else if (!ex_freeze) begin
		ex_rfwb_uops <= #1 id_rfwb_uops;
	end
end
// pipeling of operands
reg	[29:0]			ex_branch_addrofs;
//reg	[31:0]			ex_lsu_addrofs;
reg	[9:0]			ex_spr_addr;
reg	[31:0]			ex_imm;
always @(posedge clk or posedge rst) begin
	if (rst) begin
	    ex_branch_addrofs <= #1 30'd0;
//		ex_lsu_addrofs <= #1 32'd0;
		reg_zero <= #1 1'b0;
		ex_spr_addr <= #1 10'd0;
		ex_imm <= #1 32'd0;
        set_atomic <= 1'b0;
        clear_atomic <= 1'b0;
	end
	else if (!ex_freeze & id_freeze | flushpipe) begin
	    ex_branch_addrofs <= #1 30'd0;
//		ex_lsu_addrofs <= #1 32'd0;
		reg_zero <= #1 1'b0;
		ex_spr_addr <= #1 10'd0;
		ex_imm <= #1 32'd0;
        set_atomic <= 1'b0;
        clear_atomic <= 1'b0;
	end
	else if (!ex_freeze) begin
	    ex_branch_addrofs <= #1 id_branch_addrofs;
//		ex_lsu_addrofs <= #1 id_lsu_addrofs;
		reg_zero <= #1 id_reg_zero;
		ex_spr_addr <= #1 id_spr_addr;
		ex_imm <= #1 id_imm;
        set_atomic <= id_set_atomic;
        clear_atomic <= id_clear_atomic;
	end
end
// pipelining of exception requests
reg					sig_syscall;
reg					sig_eieio;
reg					sig_isync;
reg					sig_sync;
reg					sig_illegal;
reg                 sig_emulate;
reg					sig_rfi;
reg					sig_rfci;
reg					sig_ibuserr;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		sig_illegal <= #1 1'b0;
		sig_emulate <= #1 1'b0;
		sig_syscall <= #1 1'b0;
		sig_eieio <= #1 1'b0;
		sig_isync <= #1 1'b0;
		sig_sync <= #1 1'b0;
		sig_ibuserr <= #1 1'b0;
		sig_rfi <= #1 1'b0;
		sig_rfci <= #1 1'b0;
	end
	else if (!ex_freeze & id_freeze | flushpipe) begin
		sig_illegal <= #1 1'b0;
		sig_emulate <= #1 1'b0;
		sig_syscall <= #1 1'b0;
		sig_eieio <= #1 1'b0;
		sig_isync <= #1 1'b0;
		sig_sync <= #1 1'b0;
		sig_ibuserr <= #1 1'b0;
		sig_rfi <= #1 1'b0;
		sig_rfci <= #1 1'b0;
	end
	else if (!ex_freeze) begin
		sig_illegal <= #1 id_sig_illegal;
		sig_emulate <= #1 id_sig_emulate;
		sig_syscall <= #1 id_sig_syscall;
		sig_eieio <= #1 id_sig_eieio;
		sig_isync <= #1 id_sig_isync;
		sig_sync <= #1 id_sig_sync;
		sig_ibuserr <= #1 id_sig_ibuserr;
		sig_rfi <= #1 id_sig_rfi;
		sig_rfci <= #1 id_sig_rfci;
	end
end
// Pipelining inst./CIA/NIA
//  [TBD] the coding style of pipeling logic: functional and performance verification
reg					ex_valid, ex_valid_value;
reg	[31:0]			ex_inst, ex_inst_value;
reg	[29:0]			ex_cia, ex_cia_value;
reg	[29:0]			ex_snia, ex_snia_value;
always @(id_freeze or ex_freeze or flushpipe or
        id_valid or id_inst or id_cia or id_snia or
        ex_valid or ex_inst or ex_cia or ex_snia) begin
	casex ({id_freeze, ex_freeze, flushpipe})	// synopsys parallel_case
		3'b000: begin       // Normal pipelining.
            ex_valid_value = id_valid;
            ex_inst_value = id_inst;
            ex_cia_value = id_cia;
            ex_snia_value = id_snia;
		end
		3'bxx1: begin       // flushpipe is asserted, insert NOP bubble
            ex_valid_value = 1'b0;
            ex_inst_value = `pippo_PWR_NOP;
            ex_cia_value = id_cia;
            ex_snia_value = id_snia;
		end
		4'b100: begin       // id_freeze is asserted, ex_freeze is disasserted, insert NOP bubble
            ex_valid_value = 1'b0;
            ex_inst_value = `pippo_PWR_NOP;
            ex_cia_value = id_cia;
            ex_snia_value = id_snia;
		end
		4'b110: begin       // id_freeze/ex_freeze is asserted, insert KCS bubble
            ex_valid_value = id_valid;
            ex_inst_value = id_inst;
            ex_cia_value = id_cia;
            ex_snia_value = id_snia;
		end
		default: begin
            ex_valid_value = 1'b0;
            ex_inst_value = `pippo_PWR_NOP;
            ex_cia_value = id_cia;
            ex_snia_value = id_snia;
		end
    endcase
end
always @(posedge clk or posedge rst) begin
    if(rst) begin
        ex_valid <= #1 1'b0;
        ex_inst <= #1 `pippo_PWR_NOP;
        ex_cia <= #1 30'd0;
        ex_snia <= #1 30'd0;
    end
    else begin
        ex_valid <= #1 ex_valid_value;
        ex_inst <= #1 ex_inst_value;
        ex_cia <= #1 ex_cia_value;
        ex_snia <= #1 ex_snia_value;
        `ifdef pippo_VERBOSE
        // synopsys translate_off
            $display("%t: ex_valid <= %h", $time, ex_valid);
            $display("%t: ex_inst <= %h", $time, ex_inst);
            $display("%t: ex_cia <= %h", $time, ex_cia);
            $display("%t: ex_snia <= %h", $time, ex_snia);
        // synopsys translate_on
        `endif
    end
end
endmodule