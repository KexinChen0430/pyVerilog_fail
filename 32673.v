module lm32_decoder (
    instruction,
    d_result_sel_0,
    d_result_sel_1,
    x_result_sel_csr,
`ifdef LM32_MC_ARITHMETIC_ENABLED
    x_result_sel_mc_arith,
`endif
`ifdef LM32_NO_BARREL_SHIFT
    x_result_sel_shift,
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
    x_result_sel_sext,
`endif
    x_result_sel_logic,
`ifdef CFG_USER_ENABLED
    x_result_sel_user,
`endif
    x_result_sel_add,
    m_result_sel_compare,
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
    m_result_sel_shift,
`endif
    w_result_sel_load,
`ifdef CFG_PL_MULTIPLY_ENABLED
    w_result_sel_mul,
`endif
    x_bypass_enable,
    m_bypass_enable,
    read_enable_0,
    read_idx_0,
    read_enable_1,
    read_idx_1,
    write_enable,
    write_idx,
    immediate,
    branch_offset,
    load,
    store,
    size,
    sign_extend,
    adder_op,
    logic_op,
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
    direction,
`endif
`ifdef CFG_MC_BARREL_SHIFT_ENABLED
    shift_left,
    shift_right,
`endif
`ifdef CFG_MC_MULTIPLY_ENABLED
    multiply,
`endif
`ifdef CFG_MC_DIVIDE_ENABLED
    divide,
    modulus,
`endif
    branch,
    branch_reg,
    condition,
    bi_conditional,
    bi_unconditional,
`ifdef CFG_DEBUG_ENABLED
    break_opcode,
`endif
    scall,
    eret,
`ifdef CFG_DEBUG_ENABLED
    bret,
`endif
`ifdef CFG_USER_ENABLED
    user_opcode,
`endif
    csr_write_enable
    );
// Inputs
input [`LM32_INSTRUCTION_RNG] instruction;       // Instruction to decode
// Outputs
output [`LM32_D_RESULT_SEL_0_RNG] d_result_sel_0;
reg    [`LM32_D_RESULT_SEL_0_RNG] d_result_sel_0;
output [`LM32_D_RESULT_SEL_1_RNG] d_result_sel_1;
reg    [`LM32_D_RESULT_SEL_1_RNG] d_result_sel_1;
output x_result_sel_csr;
reg    x_result_sel_csr;
`ifdef LM32_MC_ARITHMETIC_ENABLED
output x_result_sel_mc_arith;
reg    x_result_sel_mc_arith;
`endif
`ifdef LM32_NO_BARREL_SHIFT
output x_result_sel_shift;
reg    x_result_sel_shift;
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
output x_result_sel_sext;
reg    x_result_sel_sext;
`endif
output x_result_sel_logic;
reg    x_result_sel_logic;
`ifdef CFG_USER_ENABLED
output x_result_sel_user;
reg    x_result_sel_user;
`endif
output x_result_sel_add;
reg    x_result_sel_add;
output m_result_sel_compare;
reg    m_result_sel_compare;
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
output m_result_sel_shift;
reg    m_result_sel_shift;
`endif
output w_result_sel_load;
reg    w_result_sel_load;
`ifdef CFG_PL_MULTIPLY_ENABLED
output w_result_sel_mul;
reg    w_result_sel_mul;
`endif
output x_bypass_enable;
wire   x_bypass_enable;
output m_bypass_enable;
wire   m_bypass_enable;
output read_enable_0;
wire   read_enable_0;
output [`LM32_REG_IDX_RNG] read_idx_0;
wire   [`LM32_REG_IDX_RNG] read_idx_0;
output read_enable_1;
wire   read_enable_1;
output [`LM32_REG_IDX_RNG] read_idx_1;
wire   [`LM32_REG_IDX_RNG] read_idx_1;
output write_enable;
wire   write_enable;
output [`LM32_REG_IDX_RNG] write_idx;
wire   [`LM32_REG_IDX_RNG] write_idx;
output [`LM32_WORD_RNG] immediate;
wire   [`LM32_WORD_RNG] immediate;
output [`LM32_PC_RNG] branch_offset;
wire   [`LM32_PC_RNG] branch_offset;
output load;
wire   load;
output store;
wire   store;
output [`LM32_SIZE_RNG] size;
wire   [`LM32_SIZE_RNG] size;
output sign_extend;
wire   sign_extend;
output adder_op;
wire   adder_op;
output [`LM32_LOGIC_OP_RNG] logic_op;
wire   [`LM32_LOGIC_OP_RNG] logic_op;
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
output direction;
wire   direction;
`endif
`ifdef CFG_MC_BARREL_SHIFT_ENABLED
output shift_left;
wire   shift_left;
output shift_right;
wire   shift_right;
`endif
`ifdef CFG_MC_MULTIPLY_ENABLED
output multiply;
wire   multiply;
`endif
`ifdef CFG_MC_DIVIDE_ENABLED
output divide;
wire   divide;
output modulus;
wire   modulus;
`endif
output branch;
wire   branch;
output branch_reg;
wire   branch_reg;
output [`LM32_CONDITION_RNG] condition;
wire   [`LM32_CONDITION_RNG] condition;
output bi_conditional;
wire bi_conditional;
output bi_unconditional;
wire bi_unconditional;
`ifdef CFG_DEBUG_ENABLED
output break_opcode;
wire   break_opcode;
`endif
output scall;
wire   scall;
output eret;
wire   eret;
`ifdef CFG_DEBUG_ENABLED
output bret;
wire   bret;
`endif
`ifdef CFG_USER_ENABLED
output [`LM32_USER_OPCODE_RNG] user_opcode;
wire   [`LM32_USER_OPCODE_RNG] user_opcode;
`endif
output csr_write_enable;
wire   csr_write_enable;
// Internal nets and registers
wire [`LM32_WORD_RNG] extended_immediate;       // Zero or sign extended immediate
wire [`LM32_WORD_RNG] high_immediate;           // Immediate as high 16 bits
wire [`LM32_WORD_RNG] call_immediate;           // Call immediate
wire [`LM32_WORD_RNG] branch_immediate;         // Conditional branch immediate
wire sign_extend_immediate;                     // Whether the immediate should be sign extended (`TRUE) or zero extended (`FALSE)
wire select_high_immediate;                     // Whether to select the high immediate
wire select_call_immediate;                     // Whether to select the call immediate
// Functions
`include "lm32_functions.v"
// Combinational logic
// Determine opcode
assign op_add    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_ADD;
assign op_and    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_AND;
assign op_andhi  = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_ANDHI;
assign op_b      = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_B;
assign op_bi     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BI;
assign op_be     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BE;
assign op_bg     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BG;
assign op_bge    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BGE;
assign op_bgeu   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BGEU;
assign op_bgu    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BGU;
assign op_bne    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_BNE;
assign op_call   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_CALL;
assign op_calli  = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_CALLI;
assign op_cmpe   = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPE;
assign op_cmpg   = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPG;
assign op_cmpge  = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPGE;
assign op_cmpgeu = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPGEU;
assign op_cmpgu  = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPGU;
assign op_cmpne  = instruction[`LM32_OP_RNG] == `LM32_OPCODE_CMPNE;
`ifdef CFG_MC_DIVIDE_ENABLED
assign op_divu   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_DIVU;
`endif
assign op_lb     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_LB;
assign op_lbu    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_LBU;
assign op_lh     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_LH;
assign op_lhu    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_LHU;
assign op_lw     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_LW;
`ifdef CFG_MC_DIVIDE_ENABLED
assign op_modu   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_MODU;
`endif
`ifdef LM32_MULTIPLY_ENABLED
assign op_mul    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_MUL;
`endif
assign op_nor    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_NOR;
assign op_or     = instruction[`LM32_OP_RNG] == `LM32_OPCODE_OR;
assign op_orhi   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_ORHI;
assign op_raise  = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_RAISE;
assign op_rcsr   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_RCSR;
assign op_sb     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SB;
`ifdef CFG_SIGN_EXTEND_ENABLED
assign op_sextb  = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SEXTB;
assign op_sexth  = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SEXTH;
`endif
assign op_sh     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SH;
`ifdef LM32_BARREL_SHIFT_ENABLED
assign op_sl     = instruction[`LM32_OP_RNG] == `LM32_OPCODE_SL;
`endif
assign op_sr     = instruction[`LM32_OP_RNG] == `LM32_OPCODE_SR;
assign op_sru    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_SRU;
assign op_sub    = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SUB;
assign op_sw     = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_SW;
assign op_user   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_USER;
assign op_wcsr   = instruction[`LM32_OPCODE_RNG] == `LM32_OPCODE_WCSR;
assign op_xnor   = instruction[`LM32_OP_RNG] == `LM32_OPCODE_XNOR;
assign op_xor    = instruction[`LM32_OP_RNG] == `LM32_OPCODE_XOR;
// Group opcodes by function
assign arith = op_add | op_sub;
assign logical = op_and | op_andhi | op_nor | op_or | op_orhi | op_xor | op_xnor;
assign cmp = op_cmpe | op_cmpg | op_cmpge | op_cmpgeu | op_cmpgu | op_cmpne;
assign bi_conditional = op_be | op_bg | op_bge | op_bgeu  | op_bgu | op_bne;
assign bi_unconditional = op_bi;
assign bra = op_b | bi_unconditional | bi_conditional;
assign call = op_call | op_calli;
`ifdef LM32_BARREL_SHIFT_ENABLED
assign shift = op_sl | op_sr | op_sru;
`endif
`ifdef LM32_NO_BARREL_SHIFT
assign shift = op_sr | op_sru;
`endif
`ifdef CFG_MC_BARREL_SHIFT_ENABLED
assign shift_left = op_sl;
assign shift_right = op_sr | op_sru;
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
assign sext = op_sextb | op_sexth;
`endif
`ifdef LM32_MULTIPLY_ENABLED
assign multiply = op_mul;
`endif
`ifdef CFG_MC_DIVIDE_ENABLED
assign divide = op_divu;
assign modulus = op_modu;
`endif
assign load = op_lb | op_lbu | op_lh | op_lhu | op_lw;
assign store = op_sb | op_sh | op_sw;
// Select pipeline multiplexor controls
always @(*)
begin
    // D stage
    if (call)
        d_result_sel_0 = `LM32_D_RESULT_SEL_0_NEXT_PC;
    else
        d_result_sel_0 = `LM32_D_RESULT_SEL_0_REG_0;
    if (call)
        d_result_sel_1 = `LM32_D_RESULT_SEL_1_ZERO;
    else if ((instruction[31] == 1'b0) && !bra)
        d_result_sel_1 = `LM32_D_RESULT_SEL_1_IMMEDIATE;
    else
        d_result_sel_1 = `LM32_D_RESULT_SEL_1_REG_1;
    // X stage
    x_result_sel_csr = `FALSE;
`ifdef LM32_MC_ARITHMETIC_ENABLED
    x_result_sel_mc_arith = `FALSE;
`endif
`ifdef LM32_NO_BARREL_SHIFT
    x_result_sel_shift = `FALSE;
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
    x_result_sel_sext = `FALSE;
`endif
    x_result_sel_logic = `FALSE;
`ifdef CFG_USER_ENABLED
    x_result_sel_user = `FALSE;
`endif
    x_result_sel_add = `FALSE;
    if (op_rcsr)
        x_result_sel_csr = `TRUE;
`ifdef LM32_MC_ARITHMETIC_ENABLED
`ifdef CFG_MC_BARREL_SHIFT_ENABLED
    else if (shift_left | shift_right)
        x_result_sel_mc_arith = `TRUE;
`endif
`ifdef CFG_MC_DIVIDE_ENABLED
    else if (divide | modulus)
        x_result_sel_mc_arith = `TRUE;
`endif
`ifdef CFG_MC_MULTIPLY_ENABLED
    else if (multiply)
        x_result_sel_mc_arith = `TRUE;
`endif
`endif
`ifdef LM32_NO_BARREL_SHIFT
    else if (shift)
        x_result_sel_shift = `TRUE;
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
    else if (sext)
        x_result_sel_sext = `TRUE;
`endif
    else if (logical)
        x_result_sel_logic = `TRUE;
`ifdef CFG_USER_ENABLED
    else if (op_user)
        x_result_sel_user = `TRUE;
`endif
    else
        x_result_sel_add = `TRUE;
    // M stage
    m_result_sel_compare = cmp;
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
    m_result_sel_shift = shift;
`endif
    // W stage
    w_result_sel_load = load;
`ifdef CFG_PL_MULTIPLY_ENABLED
    w_result_sel_mul = op_mul;
`endif
end
// Set if result is valid at end of X stage
assign x_bypass_enable =  arith
                        | logical
`ifdef CFG_MC_BARREL_SHIFT_ENABLED
                        | shift_left
                        | shift_right
`endif
`ifdef CFG_MC_MULTIPLY_ENABLED
                        | multiply
`endif
`ifdef CFG_MC_DIVIDE_ENABLED
                        | divide
                        | modulus
`endif
`ifdef LM32_NO_BARREL_SHIFT
                        | shift
`endif
`ifdef CFG_SIGN_EXTEND_ENABLED
                        | sext
`endif
`ifdef CFG_USER_ENABLED
                        | op_user
`endif
                        | op_rcsr
                        ;
// Set if result is valid at end of M stage
assign m_bypass_enable = x_bypass_enable
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
                        | shift
`endif
                        | cmp
                        ;
// Register file read port 0
assign read_enable_0 = ~(op_bi | op_calli);
assign read_idx_0 = instruction[25:21];
// Register file read port 1
assign read_enable_1 = ~(op_bi | op_calli | load);
assign read_idx_1 = instruction[20:16];
// Register file write port
assign write_enable = ~(bra | op_raise | store | op_wcsr);
assign write_idx = call
                    ? 5'd29
                    : instruction[31] == 1'b0
                        ? instruction[20:16]
                        : instruction[15:11];
// Size of load/stores
assign size = instruction[27:26];
// Whether to sign or zero extend
assign sign_extend = instruction[28];
// Set adder_op to 1 to perform a subtraction
assign adder_op = op_sub | op_cmpe | op_cmpg | op_cmpge | op_cmpgeu | op_cmpgu | op_cmpne | bra;
// Logic operation (and, or, etc)
assign logic_op = instruction[29:26];
`ifdef CFG_PL_BARREL_SHIFT_ENABLED
// Shift direction
assign direction = instruction[29];
`endif
// Control flow microcodes
assign branch = bra | call;
assign branch_reg = op_call | op_b;
assign condition = instruction[28:26];
`ifdef CFG_DEBUG_ENABLED
assign break_opcode = op_raise & ~instruction[2];
`endif
assign scall = op_raise & instruction[2];
assign eret = op_b & (instruction[25:21] == 5'd30);
`ifdef CFG_DEBUG_ENABLED
assign bret = op_b & (instruction[25:21] == 5'd31);
`endif
`ifdef CFG_USER_ENABLED
// Extract user opcode
assign user_opcode = instruction[10:0];
`endif
// CSR read/write
assign csr_write_enable = op_wcsr;
// Extract immediate from instruction
assign sign_extend_immediate = ~(op_and | op_cmpgeu | op_cmpgu | op_nor | op_or | op_xnor | op_xor);
assign select_high_immediate = op_andhi | op_orhi;
assign select_call_immediate = instruction[31];
assign high_immediate = {instruction[15:0], 16'h0000};
assign extended_immediate = {{16{sign_extend_immediate & instruction[15]}}, instruction[15:0]};
assign call_immediate = {{6{instruction[25]}}, instruction[25:0]};
assign branch_immediate = {{16{instruction[15]}}, instruction[15:0]};
assign immediate = select_high_immediate == `TRUE
                        ? high_immediate
                        : extended_immediate;
assign branch_offset = select_call_immediate == `TRUE
                        ? call_immediate
                        : branch_immediate;
endmodule