module zap_decode (
i_irq,  // IRQ request from previous stage.
i_fiq,  // FIQ request from previous stage.
i_abt,  // Code abort flagged from previous stage.
// Instruction input from pre-decode.
i_instruction,
i_instruction_valid,
// CPU mode from active CPSR. Required to prevent CPSR change on MSR
// instruction in USR mode.
i_cpsr_ff_mode,
// Bits related to decoded instruction...
o_condition_code,       // 4-bit CC.
o_destination_index,    // Destination register.
o_alu_source,           // ALU source register.
o_alu_operation,        // ALU operation to be performed.
o_shift_source,         // Register to be treated as input to shifter.
o_shift_operation,      // Shift operation to perform.
o_shift_length,         // Length of the shift operation.
o_flag_update,          // 1 means flags must be updated.
// Memory related.
o_mem_srcdest_index,            // Data register.
o_mem_load,                     // Load operation.
o_mem_store,                    // Store operation.
o_mem_pre_index,                // Pre-Index.
o_mem_unsigned_byte_enable,     // Access treated as uint8_t.
o_mem_signed_byte_enable,       // Access treated as int8_t.
o_mem_signed_halfword_enable,   // Access treated as int16_t.
o_mem_unsigned_halfword_enable, // Access treated as uint16_t.
o_mem_translate,                // Force user view of memory.
o_und,   // Declare as undecodable.
o_switch // Switch between ARM and Thumb may be needed if this is 1.
);
        // Number of architectural registers.
        parameter ARCH_REGS = 32;
        // Number of opcodes.
        parameter ALU_OPS   = 32;
        // Number of shift operations.
        parameter SHIFT_OPS = 6;
                // I/O Ports.
                input   wire                            i_irq, i_fiq, i_abt;
                input    wire   [39:0]                  i_instruction;
                input    wire                           i_instruction_valid;
                input   wire    [4:0]                   i_cpsr_ff_mode;
                output   reg    [3:0]                   o_condition_code;
                output   reg    [$clog2(ARCH_REGS)-1:0] o_destination_index;
                output   reg    [32:0]                  o_alu_source;
                output   reg    [$clog2(ALU_OPS)-1:0]   o_alu_operation;
                output   reg    [32:0]                  o_shift_source;
                output   reg    [$clog2(SHIFT_OPS)-1:0] o_shift_operation;
                output   reg    [32:0]                  o_shift_length;
                output  reg                             o_flag_update;
                output  reg   [$clog2(ARCH_REGS)-1:0]   o_mem_srcdest_index;
                output  reg                             o_mem_load;
                output  reg                             o_mem_store;
                output  reg                             o_mem_pre_index;
                output  reg                             o_mem_unsigned_byte_enable;
                output  reg                             o_mem_signed_byte_enable;
                output  reg                             o_mem_signed_halfword_enable;
                output  reg                             o_mem_unsigned_halfword_enable;
                output  reg                             o_mem_translate;
                output  reg                             o_und;
                output  reg                             o_switch;
`include "zap_defines.vh"
`include "zap_localparams.vh"
`include "zap_functions.vh"
// Related to memory operations.
localparam [1:0] SIGNED_BYTE            = 2'd0;
localparam [1:0] UNSIGNED_HALF_WORD     = 2'd1;
localparam [1:0] SIGNED_HALF_WORD       = 2'd2;
always @*
begin: mainBlk1
        // If an unrecognized instruction enters this, the output
        // signals an NV state i.e., invalid.
        o_condition_code                = NV;
        o_destination_index             = 0;
        o_alu_source                    = 0;
        o_alu_operation                 = 0;
        o_shift_source                  = 0;
        o_shift_operation               = 0;
        o_shift_length                  = 0;
        o_flag_update                   = 0;
        o_mem_srcdest_index             = RAZ_REGISTER;
        o_mem_load                      = 0;
        o_mem_store                     = 0;
        o_mem_translate                 = 0;
        o_mem_pre_index                 = 0;
        o_mem_unsigned_byte_enable      = 0;
        o_mem_signed_byte_enable        = 0;
        o_mem_signed_halfword_enable    = 0;
        o_mem_unsigned_halfword_enable  = 0;
        o_mem_translate                 = 0;
        o_und                           = 0;
        o_switch                        = 0;
                // Based on our pattern match, call the appropriate task
                if ( i_fiq || i_irq || i_abt )
                begin
                        // Generate LR = PC - 4.
                        o_condition_code    = AL;
                        o_alu_operation     = SUB;
                        o_alu_source        = ARCH_PC;
                        o_alu_source[32]    = INDEX_EN;
                        o_destination_index = ARCH_LR;
                        o_shift_source      = 4;
                        o_shift_source[32]  = IMMED_EN;
                        o_shift_operation   = LSL;
                        o_shift_length      = 0;
                        o_shift_length[32]  = IMMED_EN;
                end
                else if ( i_instruction_valid )
                casez ( i_instruction[31:0] )
                PLD:
                begin
                        // Generate a NOP i.e., R0 = R0 & R0.
                        o_condition_code    = AL;
                        o_alu_operation     = AND;
                        o_alu_source        = 0;
                        o_alu_source[32]    = INDEX_EN;
                        o_destination_index = 0;
                        o_shift_source      = 0;
                        o_shift_source[32]  = IMMED_EN;
                        o_shift_operation   = LSL;
                        o_shift_length      = 0;
                        o_shift_length[32]  = IMMED_EN;
                end
                SMLAxy, SMLAWy,
                SMLALxy:                      decode_lmul_dsp   ( i_instruction );
                SMULWy, SMULxy:               decode_smul_dsp   ( i_instruction );
                QADD:                         decode_sat_addsub ( i_instruction );
                QSUB:                         decode_sat_addsub ( i_instruction );
                QDADD:                        decode_sat_addsub ( i_instruction );
                QDSUB:                        decode_sat_addsub ( i_instruction );
                CLZ_INSTRUCTION:              decode_clz  ( i_instruction );
                BX_INST:                      decode_bx   ( i_instruction );
                MRS:                          decode_mrs  ( i_instruction );
                MSR,MSR_IMMEDIATE:            decode_msr  ( i_instruction );
                DATA_PROCESSING_IMMEDIATE,
                DATA_PROCESSING_REGISTER_SPECIFIED_SHIFT,
                DATA_PROCESSING_INSTRUCTION_SPECIFIED_SHIFT:
                                        decode_data_processing ( i_instruction );
                BRANCH_INSTRUCTION:     decode_branch ( i_instruction );
                LS_INSTRUCTION_SPECIFIED_SHIFT,
                LS_IMMEDIATE:           decode_ls ( i_instruction );
                MULT_INST:              decode_mult ( i_instruction );
                LMULT_INST:             decode_lmult( i_instruction );
                HALFWORD_LS:            decode_halfword_ls ( i_instruction );
                SOFTWARE_INTERRUPT:     decode_swi ( i_instruction );
                default:
                begin
                        decode_und ( i_instruction );
                end
                endcase
end
// =============================
// Decode QADD/QSUB/QDADD/QDSUB
// =============================
task decode_sat_addsub ( input [35:0] i_instruction );
begin
        o_condition_code        = i_instruction[31:28];
        o_flag_update           = 1'd1;
        case(i_instruction[22:21])
        2'b00: o_alu_operation         = OP_QADD;
        2'b01: o_alu_operation         = OP_QSUB;
        2'b10: o_alu_operation         = OP_QDADD;
        2'b11: o_alu_operation         = OP_QDSUB;
        endcase
        // Rn
        o_alu_source            = i_instruction[`DP_RA];
        o_alu_source[32]        = INDEX_EN;
        // Rm
        o_shift_source          = i_instruction[`DP_RB];
        o_shift_source[32]      = INDEX_EN;
        // Rs
        o_shift_operation       = LSL_SAT;
        o_shift_length          = 1;
        o_shift_length[32]      = IMMED_EN;
end
endtask
// =============================
// Decode CLZ
// =============================
task decode_clz ( input [35:0] i_instruction );
begin: tskDecodeClz
        o_condition_code        =       i_instruction[31:28];
        o_flag_update           =       1'd0; // Instruction does not update any flags.
        o_alu_operation         =       CLZ;  // Added.
        // Rn = 0.
        o_alu_source            =       0;
        o_alu_source[32]        =       IMMED_EN;
        // Rm = register whose CLZ must be found.
        o_shift_source          =       {i_instruction[`DP_RB_EXTEND], i_instruction[`DP_RB]}; // Rm
        o_shift_source[32]      =       INDEX_EN;
        o_shift_operation       =       LSL;
        o_shift_length          =       0;
        o_shift_length[32]      =       IMMED_EN; // Shift length is 0 of course.
end
endtask
// =============================
// Decode long multiplication.
// =============================
task decode_lmult ( input [35:0] i_instruction ); // Uses bit 35. rm.rs + {rh, rn}
begin: tskLDecodeMult
        o_condition_code        =       i_instruction[31:28];
        o_flag_update           =       i_instruction[20];
        // ARM rd.
        o_destination_index     =       {i_instruction[`DP_RD_EXTEND],
                                         i_instruction[19:16]};
        // For MUL, Rd and Rn are interchanged.
        // For 64bit, this is normally high register.
        o_alu_source            =       i_instruction[11:8]; // ARM rs
        o_alu_source[32]        =       INDEX_EN;
        o_shift_source          =       {i_instruction[`DP_RB_EXTEND],
                                         i_instruction[`DP_RB]};
        o_shift_source[32]      =       INDEX_EN;            // ARM rm
        // ARM rn
        o_shift_length          =       {i_instruction[`DP_RA_EXTEND],
                                         i_instruction[`DP_RD]};
        o_shift_length[32]      =       INDEX_EN;
        // We need to generate output code.
        case ( i_instruction[22:21] )
        2'b00:
        begin
                // Unsigned MULT64
                o_alu_operation = UMLALH;
                o_mem_srcdest_index = RAZ_REGISTER; // rh.
        end
        2'b01:
        begin
                // Unsigned MAC64. Need mem_srcdest as source for RdHi.
                o_alu_operation = UMLALH;
                o_mem_srcdest_index = i_instruction[19:16];
        end
        2'b10:
        begin
                // Signed MULT64
                o_alu_operation = SMLALH;
                o_mem_srcdest_index = RAZ_REGISTER;
        end
        2'b11:
        begin
                // Signed MAC64. Need mem_srcdest as source of RdHi.
                o_alu_operation = SMLALH;
                o_mem_srcdest_index = i_instruction[19:16];
        end
        endcase
        if ( i_instruction[`OPCODE_EXTEND] == 1'd0 ) // Low request - change destination index.
        begin
                        o_destination_index = i_instruction[15:12]; // Low register.
                        o_alu_operation[0]  = 1'd0;                 // Request low operation.
        end
end
endtask
// ===============================
// Decode undefined instructions.
// ===============================
task decode_und( input [34:0] i_instruction );
begin
        // Say instruction is undefined.
        o_und = 1;
        // Generate LR = PC - 4
        o_condition_code    = AL;
        o_alu_operation     = SUB;
        o_alu_source        = ARCH_PC;
        o_alu_source[32]    = INDEX_EN;
        o_destination_index = ARCH_LR;
        o_shift_source      = 4;
        o_shift_source[32]  = IMMED_EN;
        o_shift_operation   = LSL;
        o_shift_length      = 0;
        o_shift_length[32]  = IMMED_EN;
end
endtask
// ===========================================
// Decode software interrupt instructions.
// ===========================================
task decode_swi( input [34:0] i_instruction );
begin: tskDecodeSWI
        // Generate LR = PC - 4
        o_condition_code    = AL;
        o_alu_operation     = SUB;
        o_alu_source        = ARCH_PC;
        o_alu_source[32]    = INDEX_EN;
        o_destination_index = ARCH_LR;
        o_shift_source      = 4;
        o_shift_source[32]  = IMMED_EN;
        o_shift_operation   = LSL;
        o_shift_length      = 0;
        o_shift_length[32]  = IMMED_EN;
end
endtask
// ============================
// Decode halfword LOAD/STORE.
// ============================
task decode_halfword_ls( input [34:0] i_instruction );
begin: tskDecodeHalfWordLs
        reg [11:0] temp, temp1;
        temp = i_instruction;
        temp1 = i_instruction;
        o_condition_code = i_instruction[31:28];
        temp[7:4] = temp[11:8];
        temp[11:8] = 0;
        temp1[11:4] = 0;
        if ( i_instruction[22] ) // immediate
        begin
                process_immediate ( temp );
        end
        else
        begin
                process_instruction_specified_shift ( temp1 );
        end
        o_alu_operation     = i_instruction[23] ? ADD : SUB;
        o_alu_source        = { i_instruction[`BASE_EXTEND],
                                i_instruction[`BASE]}; // Pointer register.
        o_alu_source[32]    = INDEX_EN;
        o_mem_load          = i_instruction[20];
        o_mem_store         = !o_mem_load;
        o_mem_pre_index     = i_instruction[24];
        // If post-index is used or pre-index is used with writeback,
        // take is as a request to update the base register.
        o_destination_index = (i_instruction[21] || !o_mem_pre_index) ?
                                o_alu_source :
                                RAZ_REGISTER; // Pointer register already added.
        o_mem_srcdest_index = {i_instruction[`SRCDEST_EXTEND],
                               i_instruction[`SRCDEST]};
        // Transfer size.
        o_mem_unsigned_byte_enable      = 0;
        o_mem_unsigned_halfword_enable  = 0;
        o_mem_signed_halfword_enable    = 0;
        case ( i_instruction[6:5] )
        SIGNED_BYTE:            o_mem_signed_byte_enable = 1;
        UNSIGNED_HALF_WORD:     o_mem_unsigned_halfword_enable = 1;
        SIGNED_HALF_WORD:       o_mem_signed_halfword_enable = 1;
        default:
        begin
                o_mem_unsigned_byte_enable      = 0;
                o_mem_unsigned_halfword_enable  = 0;
                o_mem_signed_halfword_enable    = 0;
        end
        endcase
end
endtask
// ==============================
// Decode short multiplication.
// ==============================
task decode_mult( input [34:0] i_instruction );
begin: tskDecodeMult
        o_condition_code        =       i_instruction[31:28];
        o_flag_update           =       i_instruction[20];
        o_alu_operation         =       UMLALL;
        o_destination_index     =       {i_instruction[`DP_RD_EXTEND],
                                         i_instruction[19:16]};
        // For MUL, Rd and Rn are interchanged.
        o_alu_source            =       i_instruction[11:8]; // ARM rs
        o_alu_source[32]        =       INDEX_EN;
        o_shift_source          =       {i_instruction[`DP_RB_EXTEND],
                                         i_instruction[`DP_RB]};
        o_shift_source[32]      =       INDEX_EN;            // ARM rm
        // ARM rn - Set for accumulate.
        o_shift_length          =       i_instruction[21] ?
                                        {i_instruction[`DP_RA_EXTEND],
                                         i_instruction[`DP_RD]} : 32'd0;
        o_shift_length[32]      =       i_instruction[21] ? INDEX_EN : IMMED_EN;
        // Set rh = 0.
        o_mem_srcdest_index = RAZ_REGISTER;
end
endtask
// ====================================
// Decode 16-bit DSP multiplication
// ====================================
task decode_smul_dsp ( input [34:0] i_instruction );
begin
        o_condition_code    = i_instruction[31:28];
        o_flag_update       = 1'd1;
        o_alu_operation = ((i_instruction[22:21] == 2'b01) && i_instruction[5] && i_instruction[15:12] == 0) ?
                          (i_instruction[6] ? OP_SMULW0 : OP_SMULW1) :
                          (i_instruction[6:5] == 2'b00 ? OP_SMUL00 :
                           i_instruction[6:5] == 2'b01 ? OP_SMUL01 :
                           i_instruction[6:5] == 2'b10 ? OP_SMUL10 :
                           i_instruction[6:5] == 2'b11 ? OP_SMUL11 : OP_SMUL11) ;
        // ARM rd
        o_destination_index = {i_instruction[`DP_RD_EXTEND], i_instruction[19:16]};
        // ARM Rs.
        o_alu_source = i_instruction[11:8];
        o_alu_source[32] = INDEX_EN;
        // ARM rm
        o_shift_source = {i_instruction[`DP_RB_EXTEND], i_instruction[`DP_RB]};
        o_shift_source[32] = INDEX_EN;
        // ARM rm=0
        o_shift_length     = 32'd0;
        o_shift_length[32] = INDEX_EN;
        // Set rh=0
        o_mem_srcdest_index = RAZ_REGISTER;
end
endtask
// =============================
// Decode 16-bit long DSP (48-bit)
// =============================
task decode_lmul_dsp ( input [35:0] i_instruction ); // (rm.rs) + {rh, rn} = {rh, rn}
begin: tskLDecodeMultDsp
        o_condition_code        =       i_instruction[31:28];
        o_flag_update           =       1'd1;
        // ARM rd.
        o_destination_index     =       {i_instruction[`DP_RD_EXTEND],
                                         i_instruction[19:16]};
        // For MUL, Rd and Rn are interchanged.
        // For 64bit, this is normally high register.
        o_alu_source            =       i_instruction[11:8]; // ARM rs
        o_alu_source[32]        =       INDEX_EN;
        o_shift_source          =       {i_instruction[`DP_RB_EXTEND],
                                         i_instruction[`DP_RB]};
        o_shift_source[32]      =       INDEX_EN;            // ARM rm
        o_shift_length          =       // ARM rn.
                                        {i_instruction[`DP_RA_EXTEND],
                                         i_instruction[`DP_RD]};
        o_shift_length[32]      =       INDEX_EN;
        // We need to generate output code.
        casez ( i_instruction[31:0] )
        SMLAxy:
        begin
                o_alu_operation     = i_instruction[6:5] == 2'b00 ? SMLA00 :
                                      i_instruction[6:5] == 2'b01 ? SMLA01 :
                                      i_instruction[6:5] == 2'b10 ? SMLA10 :
                                                                    SMLA11;
                o_mem_srcdest_index = RAZ_REGISTER; // rh.
        end
        SMLAWy:
        begin
                o_alu_operation     = i_instruction[6] ? SMLAW1 : SMLAW0;
                o_mem_srcdest_index = i_instruction[19:16]; // rh
        end
        SMLALxy:
        begin
                o_alu_operation     = i_instruction[6:5] == 2'b00 ? SMLAL00H :
                                      i_instruction[6:5] == 2'b01 ? SMLAL01H :
                                      i_instruction[6:5] == 2'b10 ? SMLAL10H :
                                      i_instruction[6:5] == 2'b11 ? SMLAL11H : SMLAL11H ;
                o_mem_srcdest_index = i_instruction[19:16]; // rh
        end
        endcase
        if ( i_instruction[`OPCODE_EXTEND] == 1'd0 ) // Low request.
        begin
                        o_destination_index = i_instruction[15:12]; // Low register.
                        o_alu_operation[0]  = 1'd0;                 // Request low operation.
                        o_alu_operation     =
                                      i_instruction[6:5] == 2'b00 ? SMLAL00L :
                                      i_instruction[6:5] == 2'b01 ? SMLAL01L :
                                      i_instruction[6:5] == 2'b10 ? SMLAL10L :
                                      i_instruction[6:5] == 2'b11 ? SMLAL11L : SMLAL11L ;
        end
end
endtask
// =============================
// BX decode.
// =============================
// Converted into a MOV to PC. The task of setting the T-bit in the CPSR is
// the job of the writeback stage.
task decode_bx( input [34:0] i_instruction );
begin: tskDecodeBx
        reg [34:0] temp;
        temp = i_instruction[31:0];
        temp[31:4] = 0; // Zero out stuff to avoid conflicts in the function.
        process_instruction_specified_shift(temp);
        // The RAW ALU source does not matter.
        o_condition_code        = i_instruction[31:28];
        o_alu_operation         = MOV;
        o_destination_index     = ARCH_PC;
        // We will force an immediate in alu source to prevent unwanted locks.
        o_alu_source            = 0;
        o_alu_source[32]        = IMMED_EN;
        // Indicate switch. This is a primary differentiator.
        o_switch = 1;
end
endtask
// =============================================
// Task for decoding load-store instructions.
// =============================================
task decode_ls( input [34:0] i_instruction );
begin: tskDecodeLs
        o_condition_code = i_instruction[31:28];
        if ( !i_instruction[25] ) // immediate
        begin
                o_shift_source          = i_instruction[11:0];
                o_shift_source[32]      = IMMED_EN;
                o_shift_length          = 0;
                o_shift_length[32]      = IMMED_EN;
                o_shift_operation       = LSL;
        end
        else
        begin
              process_instruction_specified_shift ( i_instruction[11:0] );
        end
        o_alu_operation = i_instruction[23] ? ADD : SUB;
        // Pointer register.
        o_alu_source    = {i_instruction[`BASE_EXTEND], i_instruction[`BASE]};
        o_alu_source[32] = INDEX_EN;
        o_mem_load          = i_instruction[20];
        o_mem_store         = !o_mem_load;
        o_mem_pre_index     = i_instruction[24];
        // If post-index is used or pre-index is used with writeback,
        // take is as a request to update the base register.
        o_destination_index = (i_instruction[21] || !o_mem_pre_index) ?
                                o_alu_source :
                                RAZ_REGISTER; // Pointer register already added.
        o_mem_unsigned_byte_enable = i_instruction[22];
        o_mem_srcdest_index = {i_instruction[`SRCDEST_EXTEND], i_instruction[`SRCDEST]};
        if ( !o_mem_pre_index ) // Post-index, writeback has no meaning.
        begin
                if ( i_instruction[21] )
                begin
                        // Use it for force usr mode memory mappings.
                        o_mem_translate = 1'd1;
                end
        end
end
endtask
task decode_mrs( input [34:0] i_instruction );
begin
        process_immediate ( i_instruction[11:0] );
        o_condition_code    = i_instruction[31:28];
        o_destination_index = {i_instruction[`DP_RD_EXTEND], i_instruction[`DP_RD]};
        o_alu_source        = i_instruction[22] ? ARCH_CURR_SPSR : ARCH_CPSR;
        o_alu_source[32]    = INDEX_EN;
        o_alu_operation     = ADD;
end
endtask
task decode_msr( input [34:0] i_instruction );
begin
        if ( i_instruction[25] ) // Immediate present.
        begin
                process_immediate ( i_instruction[11:0] );
        end
        else
        begin
                process_instruction_specified_shift ( i_instruction[11:0] );
        end
        // Destination.
        o_destination_index = i_instruction[22] ? ARCH_CURR_SPSR : ARCH_CPSR;
        o_condition_code = i_instruction[31:28];
        // Make srcdest as SPSR. useful for MMOV.
        o_mem_srcdest_index = ARCH_CURR_SPSR;
        // Select SPSR or CPSR.
        o_alu_operation  = i_instruction[22] ? MMOV : FMOV;
        o_alu_source     = i_instruction[19:16];
        o_alu_source[32] = IMMED_EN;
        // Part of the instruction will silently fail when changing mode bits
        // in user mode. This is as per the ARM spec.
        if  ( i_cpsr_ff_mode == USR )
        begin
                o_alu_source[2:0] = 3'b0;
        end
end
endtask
// ========================
// Decode B
// ========================
task decode_branch( input [34:0] i_instruction );
begin
        // A branch is decayed into PC = PC + $signed(immed)
        o_condition_code        = i_instruction[31:28];
        o_alu_operation         = ADD;
        o_destination_index     = ARCH_PC;
        o_alu_source            = ARCH_PC;
        o_alu_source[32]        = INDEX_EN;
        o_shift_source          = ($signed(i_instruction[23:0]));
        o_shift_source[32]      = IMMED_EN;
        o_shift_operation       = LSL;
        o_shift_length          = i_instruction[34] ? 1 : 2; // Thumb branches sometimes need only a shift of 1.
        o_shift_length[32]      = IMMED_EN;
end
endtask
// Common data processing handles the common section of all 3 data processing
// formats.
task decode_data_processing( input [34:0] i_instruction );
begin
        o_condition_code        = i_instruction[31:28];
        o_alu_operation         = i_instruction[24:21];
        o_flag_update           = i_instruction[20];
        o_destination_index     = {i_instruction[`DP_RD_EXTEND], i_instruction[`DP_RD]};
        o_alu_source            = i_instruction[`DP_RA];
        o_alu_source[32]        = INDEX_EN;
        o_mem_srcdest_index     = ARCH_CURR_SPSR;
        if (    o_alu_operation == CMP ||
                o_alu_operation == CMN ||
                o_alu_operation == TST ||
                o_alu_operation == TEQ )
        begin
                o_destination_index = RAZ_REGISTER;
        end
        casez ( {i_instruction[25],i_instruction[7],i_instruction[4]} )
        3'b1??: process_immediate ( i_instruction );
        3'b0?0: process_instruction_specified_shift ( i_instruction );
        3'b001: process_register_specified_shift ( i_instruction );
        default:
        begin
                // error.
        end
        endcase
end
endtask
// If an immediate value is to be rotated right by an
// immediate value, this mode is used.
task process_immediate ( input [34:0] instruction );
begin
        o_shift_length          = instruction[11:8] << 1'd1;
        o_shift_length[32]      = IMMED_EN;
        o_shift_source          = instruction[7:0];
        o_shift_source[32]      = IMMED_EN;
        o_shift_operation       = RORI;
end
endtask
// The shifter source is a register but the
// amount to shift is in the instruction itself.
task process_instruction_specified_shift ( input [34:0] instruction );
begin
        // ROR #0 = RRC, ASR #0 = ASR #32, LSL #0 = LSL #0, LSR #0 = LSR #32
        // ROR #n = ROR_1 #n ( n > 0 )
        o_shift_length          = instruction[11:7];
        o_shift_length[32]      = IMMED_EN;
        o_shift_source          = {i_instruction[`DP_RB_EXTEND],instruction[`DP_RB]};
        o_shift_source[32]      = INDEX_EN;
        o_shift_operation       = instruction[6:5];
        case ( o_shift_operation )
                LSR: if ( !o_shift_length[31:0] ) o_shift_length[31:0] = 32;
                ASR: if ( !o_shift_length[31:0] ) o_shift_length[31:0] = 32;
                ROR:
                begin
                        if ( !o_shift_length[31:0] )
                                o_shift_operation    = RRC;
                        else
                                o_shift_operation    = ROR_1;
                                // Differs in carry generation behavior.
                end
                default: // For lint.
                begin
                end
        endcase
        // Reinforce the fact.
        o_shift_length[32] = IMMED_EN;
end
endtask
// The source register and the amount of shift are both in registers.
task process_register_specified_shift ( input [34:0] instruction );
begin
        o_shift_length          = instruction[11:8];
        o_shift_length[32]      = INDEX_EN;
        o_shift_source          = {i_instruction[`DP_RB_EXTEND], instruction[`DP_RB]};
        o_shift_source[32]      = INDEX_EN;
        o_shift_operation       = instruction[6:5];
end
endtask
endmodule