module or1200_sprs(
		// Clk & Rst
		clk, rst,
		// Internal CPU interface
		flagforw, flag_we, flag, cyforw, cy_we, carry,
		addrbase, addrofs, dat_i, alu_op, branch_op,
		epcr, eear, esr, except_started,
		to_wbmux, epcr_we, eear_we, esr_we, pc_we, sr_we, to_sr, sr,
		spr_dat_cfgr, spr_dat_rf, spr_dat_npc, spr_dat_ppc, spr_dat_mac,
		// From/to other RISC units
		spr_dat_pic, spr_dat_tt, spr_dat_pm,
		spr_dat_dmmu, spr_dat_immu, spr_dat_du,
	        spr_addr, spr_dat_o, spr_cs, spr_we,
		du_addr, du_dat_du, du_read,
		du_write, du_dat_cpu
);
parameter width = `OR1200_OPERAND_WIDTH;
// I/O Ports
// Internal CPU interface
input				clk; 		// Clock
input 				rst;		// Reset
input 				flagforw;	// From ALU
input 				flag_we;	// From ALU
output 				flag;		// SR[F]
input 				cyforw;		// From ALU
input 				cy_we;		// From ALU
output 				carry;		// SR[CY]
input	[width-1:0] 		addrbase;	// SPR base address
input	[15:0] 			addrofs;	// SPR offset
input	[width-1:0]		dat_i;		// SPR write data
input	[`OR1200_ALUOP_WIDTH-1:0]	alu_op;		// ALU operation
input	[`OR1200_BRANCHOP_WIDTH-1:0]	branch_op;	// Branch operation
input	[width-1:0] 		epcr;		// EPCR0
input	[width-1:0] 		eear;		// EEAR0
input	[`OR1200_SR_WIDTH-1:0] 	esr;		// ESR0
input 				except_started; // Exception was started
output	[width-1:0]		to_wbmux;	// For l.mfspr
output				epcr_we;	// EPCR0 write enable
output				eear_we;	// EEAR0 write enable
output				esr_we;		// ESR0 write enable
output				pc_we;		// PC write enable
output 				sr_we;		// Write enable SR
output	[`OR1200_SR_WIDTH-1:0]	to_sr;		// Data to SR
output	[`OR1200_SR_WIDTH-1:0]	sr;		// SR
input	[31:0]			spr_dat_cfgr;	// Data from CFGR
input	[31:0]			spr_dat_rf;	// Data from RF
input	[31:0]			spr_dat_npc;	// Data from NPC
input	[31:0]			spr_dat_ppc;	// Data from PPC
input	[31:0]			spr_dat_mac;	// Data from MAC
// To/from other RISC units
input	[31:0]			spr_dat_pic;	// Data from PIC
input	[31:0]			spr_dat_tt;	// Data from TT
input	[31:0]			spr_dat_pm;	// Data from PM
input	[31:0]			spr_dat_dmmu;	// Data from DMMU
input	[31:0]			spr_dat_immu;	// Data from IMMU
input	[31:0]			spr_dat_du;	// Data from DU
output	[31:0]			spr_addr;	// SPR Address
output	[31:0]			spr_dat_o;	// Data to unit
output	[31:0]			spr_cs;		// Unit select
output				spr_we;		// SPR write enable
// To/from Debug Unit
input	[width-1:0]		du_addr;	// Address
input	[width-1:0]		du_dat_du;	// Data from DU to SPRS
input				du_read;	// Read qualifier
input				du_write;	// Write qualifier
output	[width-1:0]		du_dat_cpu;	// Data from SPRS to DU
// Internal regs & wires
reg	[`OR1200_SR_WIDTH-1:0]		sr;		// SR
reg				write_spr;	// Write SPR
reg				read_spr;	// Read SPR
reg	[width-1:0]		to_wbmux;	// For l.mfspr
wire				cfgr_sel;	// Select for cfg regs
wire				rf_sel;		// Select for RF
wire				npc_sel;	// Select for NPC
wire				ppc_sel;	// Select for PPC
wire 				sr_sel;		// Select for SR
wire 				epcr_sel;	// Select for EPCR0
wire 				eear_sel;	// Select for EEAR0
wire 				esr_sel;	// Select for ESR0
wire	[31:0]			sys_data;	// Read data from system SPRs
wire				du_access;	// Debug unit access
wire	[`OR1200_ALUOP_WIDTH-1:0]	sprs_op;	// ALU operation
reg	[31:0]			unqualified_cs;	// Unqualified chip selects
// Decide if it is debug unit access
assign du_access = du_read | du_write;
// Generate sprs opcode
assign sprs_op = du_write ? `OR1200_ALUOP_MTSR : du_read ? `OR1200_ALUOP_MFSR : alu_op;
// Generate SPR address from base address and offset
// OR from debug unit address
assign spr_addr = du_access ? du_addr : addrbase | {16'h0000, addrofs};
// SPR is written by debug unit or by l.mtspr
assign spr_dat_o = du_write ? du_dat_du : dat_i;
// debug unit data input:
assign du_dat_cpu = du_write ? du_dat_du : du_read ? to_wbmux : dat_i;
// Write into SPRs when l.mtspr
assign spr_we = du_write | write_spr;
// Qualify chip selects
assign spr_cs = unqualified_cs & {32{read_spr | write_spr}};
// Decoding of groups
always @(spr_addr)
	case (spr_addr[`OR1200_SPR_GROUP_BITS])	// synopsys parallel_case
		`OR1200_SPR_GROUP_WIDTH'd00: unqualified_cs = 32'b00000000_00000000_00000000_00000001;
		`OR1200_SPR_GROUP_WIDTH'd01: unqualified_cs = 32'b00000000_00000000_00000000_00000010;
		`OR1200_SPR_GROUP_WIDTH'd02: unqualified_cs = 32'b00000000_00000000_00000000_00000100;
		`OR1200_SPR_GROUP_WIDTH'd03: unqualified_cs = 32'b00000000_00000000_00000000_00001000;
		`OR1200_SPR_GROUP_WIDTH'd04: unqualified_cs = 32'b00000000_00000000_00000000_00010000;
		`OR1200_SPR_GROUP_WIDTH'd05: unqualified_cs = 32'b00000000_00000000_00000000_00100000;
		`OR1200_SPR_GROUP_WIDTH'd06: unqualified_cs = 32'b00000000_00000000_00000000_01000000;
		`OR1200_SPR_GROUP_WIDTH'd07: unqualified_cs = 32'b00000000_00000000_00000000_10000000;
		`OR1200_SPR_GROUP_WIDTH'd08: unqualified_cs = 32'b00000000_00000000_00000001_00000000;
		`OR1200_SPR_GROUP_WIDTH'd09: unqualified_cs = 32'b00000000_00000000_00000010_00000000;
		`OR1200_SPR_GROUP_WIDTH'd10: unqualified_cs = 32'b00000000_00000000_00000100_00000000;
		`OR1200_SPR_GROUP_WIDTH'd11: unqualified_cs = 32'b00000000_00000000_00001000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd12: unqualified_cs = 32'b00000000_00000000_00010000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd13: unqualified_cs = 32'b00000000_00000000_00100000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd14: unqualified_cs = 32'b00000000_00000000_01000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd15: unqualified_cs = 32'b00000000_00000000_10000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd16: unqualified_cs = 32'b00000000_00000001_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd17: unqualified_cs = 32'b00000000_00000010_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd18: unqualified_cs = 32'b00000000_00000100_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd19: unqualified_cs = 32'b00000000_00001000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd20: unqualified_cs = 32'b00000000_00010000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd21: unqualified_cs = 32'b00000000_00100000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd22: unqualified_cs = 32'b00000000_01000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd23: unqualified_cs = 32'b00000000_10000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd24: unqualified_cs = 32'b00000001_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd25: unqualified_cs = 32'b00000010_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd26: unqualified_cs = 32'b00000100_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd27: unqualified_cs = 32'b00001000_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd28: unqualified_cs = 32'b00010000_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd29: unqualified_cs = 32'b00100000_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd30: unqualified_cs = 32'b01000000_00000000_00000000_00000000;
		`OR1200_SPR_GROUP_WIDTH'd31: unqualified_cs = 32'b10000000_00000000_00000000_00000000;
	endcase
// SPRs System Group
// What to write into SR
assign to_sr[`OR1200_SR_FO:`OR1200_SR_OV] =
		(branch_op == `OR1200_BRANCHOP_RFE) ? esr[`OR1200_SR_FO:`OR1200_SR_OV] :
		(write_spr && sr_sel) ? {1'b1, spr_dat_o[`OR1200_SR_FO-1:`OR1200_SR_OV]}:
		sr[`OR1200_SR_FO:`OR1200_SR_OV];
assign to_sr[`OR1200_SR_CY] =
		(branch_op == `OR1200_BRANCHOP_RFE) ? esr[`OR1200_SR_CY] :
		cy_we ? cyforw :
		(write_spr && sr_sel) ? spr_dat_o[`OR1200_SR_CY] :
		sr[`OR1200_SR_CY];
assign to_sr[`OR1200_SR_F] =
		(branch_op == `OR1200_BRANCHOP_RFE) ? esr[`OR1200_SR_F] :
		flag_we ? flagforw :
		(write_spr && sr_sel) ? spr_dat_o[`OR1200_SR_F] :
		sr[`OR1200_SR_F];
assign to_sr[`OR1200_SR_CE:`OR1200_SR_SM] =
		(branch_op == `OR1200_BRANCHOP_RFE) ? esr[`OR1200_SR_CE:`OR1200_SR_SM] :
		(write_spr && sr_sel) ? spr_dat_o[`OR1200_SR_CE:`OR1200_SR_SM]:
		sr[`OR1200_SR_CE:`OR1200_SR_SM];
// Selects for system SPRs
assign cfgr_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:4] == `OR1200_SPR_CFGR));
assign rf_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:5] == `OR1200_SPR_RF));
assign npc_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_NPC));
assign ppc_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_PPC));
assign sr_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_SR));
assign epcr_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_EPCR));
assign eear_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_EEAR));
assign esr_sel = (spr_cs[`OR1200_SPR_GROUP_SYS] && (spr_addr[10:0] == `OR1200_SPR_ESR));
// Write enables for system SPRs
assign sr_we = (write_spr && sr_sel) | (branch_op == `OR1200_BRANCHOP_RFE) | flag_we | cy_we;
assign pc_we = (write_spr && (npc_sel | ppc_sel));
assign epcr_we = (write_spr && epcr_sel);
assign eear_we = (write_spr && eear_sel);
assign esr_we = (write_spr && esr_sel);
// Output from system SPRs
assign sys_data = (spr_dat_cfgr & {32{read_spr & cfgr_sel}}) |
		  (spr_dat_rf & {32{read_spr & rf_sel}}) |
		  (spr_dat_npc & {32{read_spr & npc_sel}}) |
		  (spr_dat_ppc & {32{read_spr & ppc_sel}}) |
		  ({{32-`OR1200_SR_WIDTH{1'b0}},sr} & {32{read_spr & sr_sel}}) |
		  (epcr & {32{read_spr & epcr_sel}}) |
		  (eear & {32{read_spr & eear_sel}}) |
		  ({{32-`OR1200_SR_WIDTH{1'b0}},esr} & {32{read_spr & esr_sel}});
// Flag alias
assign flag = sr[`OR1200_SR_F];
// Carry alias
assign carry = sr[`OR1200_SR_CY];
// Supervision register
always @(posedge clk or posedge rst)
	if (rst)
		sr <= #1 {1'b1, `OR1200_SR_EPH_DEF, {`OR1200_SR_WIDTH-3{1'b0}}, 1'b1};
	else if (except_started) begin
		sr[`OR1200_SR_SM]  <= #1 1'b1;
		sr[`OR1200_SR_TEE] <= #1 1'b0;
		sr[`OR1200_SR_IEE] <= #1 1'b0;
		sr[`OR1200_SR_DME] <= #1 1'b0;
		sr[`OR1200_SR_IME] <= #1 1'b0;
	end
	else if (sr_we)
		sr <= #1 to_sr[`OR1200_SR_WIDTH-1:0];
// MTSPR/MFSPR interface
always @(sprs_op or spr_addr or sys_data or spr_dat_mac or spr_dat_pic or spr_dat_pm or
	spr_dat_dmmu or spr_dat_immu or spr_dat_du or spr_dat_tt) begin
	case (sprs_op)	// synopsys parallel_case
		`OR1200_ALUOP_MTSR : begin
			write_spr = 1'b1;
			read_spr = 1'b0;
			to_wbmux = 32'b0;
		end
		`OR1200_ALUOP_MFSR : begin
			casex (spr_addr[`OR1200_SPR_GROUP_BITS]) // synopsys parallel_case
				`OR1200_SPR_GROUP_TT:
					to_wbmux = spr_dat_tt;
				`OR1200_SPR_GROUP_PIC:
					to_wbmux = spr_dat_pic;
				`OR1200_SPR_GROUP_PM:
					to_wbmux = spr_dat_pm;
				`OR1200_SPR_GROUP_DMMU:
					to_wbmux = spr_dat_dmmu;
				`OR1200_SPR_GROUP_IMMU:
					to_wbmux = spr_dat_immu;
				`OR1200_SPR_GROUP_MAC:
					to_wbmux = spr_dat_mac;
				`OR1200_SPR_GROUP_DU:
					to_wbmux = spr_dat_du;
				`OR1200_SPR_GROUP_SYS:
					to_wbmux = sys_data;
				default:
					to_wbmux = 32'b0;
			endcase
			write_spr = 1'b0;
			read_spr = 1'b1;
		end
		default : begin
			write_spr = 1'b0;
			read_spr = 1'b0;
			to_wbmux = 32'b0;
		end
	endcase
end
endmodule