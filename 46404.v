module zap_shifter_main
#(
        parameter PHY_REGS  = 46,
        parameter ALU_OPS   = 32,
        parameter SHIFT_OPS = 5
)
(
        // For debug
        input   wire    [64*8-1:0]              i_decompile,
        output  reg     [64*8-1:0]              o_decompile,
        // Clock and reset.
        input wire                               i_clk,
        input wire                               i_reset,
        // PC
        input wire [31:0]                       i_pc_ff,
        output reg [31:0]                       o_pc_ff,
        // Taken.
        input wire   [1:0]                       i_taken_ff,
        output reg   [1:0]                       o_taken_ff,
        // Stall and clear. Hi to low priority.
        input wire i_clear_from_writeback, // | High Priority.
        input wire i_data_stall,           // |
        input wire i_clear_from_alu,       // V Low Priority.
        // Next CPSR and FF CPSR.
        input wire [31:0] i_cpsr_nxt, i_cpsr_ff,
        // Things from Issue. Please see issue stage for signal details.
        input wire       [3:0]                   i_condition_code_ff,
        input wire       [$clog2(PHY_REGS )-1:0] i_destination_index_ff,
        input wire       [$clog2(ALU_OPS)-1:0]   i_alu_operation_ff,
        input wire       [$clog2(SHIFT_OPS)-1:0] i_shift_operation_ff,
        input wire                               i_flag_update_ff,
        input wire     [$clog2(PHY_REGS )-1:0]   i_mem_srcdest_index_ff,
        input wire                               i_mem_load_ff,
        input wire                               i_mem_store_ff,
        input wire                               i_mem_pre_index_ff,
        input wire                               i_mem_unsigned_byte_enable_ff,
        input wire                               i_mem_signed_byte_enable_ff,
        input wire                               i_mem_signed_halfword_enable_ff,
        input wire                               i_mem_unsigned_halfword_enable_ff,
        input wire                               i_mem_translate_ff,
        input wire                               i_irq_ff,
        input wire                               i_fiq_ff,
        input wire                               i_abt_ff,
        input wire                               i_swi_ff,
        // Indices/immediates enter here.
        input wire      [32:0]                  i_alu_source_ff,
        input wire                              i_alu_dav_nxt,
        input wire      [32:0]                  i_shift_source_ff,
        // Values are obtained here.
        input wire      [31:0]                  i_alu_source_value_ff,
        input wire      [31:0]                  i_shift_source_value_ff,
        input wire      [31:0]                  i_shift_length_value_ff,
        input wire      [31:0]                  i_mem_srcdest_value_ff, // This too has to be resolved.
                                                // For stores.
        // The PC value.
        input wire     [31:0]                   i_pc_plus_8_ff,
        // Shifter disable indicator. In the next stage, the output
        // will bypass the shifter. Not actually bypass it but will
        // go to the ALU value corrector unit via a MUX.
        input wire                              i_disable_shifter_ff,
        // undefined instr.
        input wire                         i_und_ff,
        output reg                         o_und_ff,
        // Value from ALU for resolver.
        input wire   [31:0]                     i_alu_value_nxt,
        // Force 32.
        input wire                         i_force32align_ff,
        output reg                         o_force32align_ff,
        // ARM <-> Compressed switch indicator.
        input wire                         i_switch_ff,
        output reg                         o_switch_ff,
        // Outputs.
        // Specific to this stage.
        output reg      [31:0]                  o_mem_srcdest_value_ff,
        output reg      [31:0]                  o_alu_source_value_ff,
        output reg      [31:0]                  o_shifted_source_value_ff,
        output reg                              o_shift_carry_ff,
        output reg                              o_shift_sat_ff,
        output reg                              o_nozero_ff,
        // Send all other outputs.
        // PC+8
        output reg      [31:0]                  o_pc_plus_8_ff,
        // Interrupts.
        output reg                              o_irq_ff,
        output reg                              o_fiq_ff,
        output reg                              o_abt_ff,
        output reg                              o_swi_ff,
        // Memory related outputs.
        output reg [$clog2(PHY_REGS )-1:0]      o_mem_srcdest_index_ff,
        output reg                              o_mem_load_ff,
        output reg                              o_mem_store_ff,
        output reg                              o_mem_pre_index_ff,
        output reg                              o_mem_unsigned_byte_enable_ff,
        output reg                              o_mem_signed_byte_enable_ff,
        output reg                              o_mem_signed_halfword_enable_ff,
        output reg                              o_mem_unsigned_halfword_enable_ff,
        output reg                              o_mem_translate_ff,
        // Other stuff.
        output reg       [3:0]                   o_condition_code_ff,
        output reg       [$clog2(PHY_REGS )-1:0] o_destination_index_ff,
        output reg       [$clog2(ALU_OPS)-1:0]   o_alu_operation_ff,
        output reg                               o_flag_update_ff,
        // Stall from shifter.
        output wire                             o_stall_from_shifter
);
`include "zap_defines.vh"
`include "zap_localparams.vh"
`include "zap_functions.vh"
wire nozero_nxt;
wire [31:0] shout;
wire shcarry, shsat;
reg [31:0] mem_srcdest_value;
reg [31:0] rm, rn;
reg shift_carry_nxt;
reg shift_sat_nxt;
wire mult_sat_nxt;
wire shifter_enabled = !i_disable_shifter_ff;
wire [31:0] mult_out;
// The MAC unit.
zap_shifter_multiply
#(
        .PHY_REGS(PHY_REGS),
        .ALU_OPS(ALU_OPS)
)
u_zap_multiply
(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_data_stall(i_data_stall),
        .i_clear_from_writeback(i_clear_from_writeback),
        .i_clear_from_alu(i_clear_from_alu),
        .i_alu_operation_ff(i_alu_operation_ff),
        .i_cc_satisfied (i_condition_code_ff == 4'd15 ? 1'd0 : 1'd1),
        .i_rm(i_alu_source_value_ff),
        .i_rn(i_shift_length_value_ff),
        .i_rs(i_shift_source_value_ff), // rm.rs + {rh,rn}
        .i_rh(i_mem_srcdest_value_ff),
        .o_rd(mult_out),
        .o_busy(o_stall_from_shifter),
        .o_sat(mult_sat_nxt),
        .o_nozero(nozero_nxt)
);
task clear; // Clear the unit out.
begin
           o_condition_code_ff               <= NV;
           o_irq_ff                          <= 0;
           o_fiq_ff                          <= 0;
           o_abt_ff                          <= 0;
           o_swi_ff                          <= 0;
           o_und_ff                          <= 0;
end
endtask
always @ (posedge i_clk)
begin
        if ( i_reset )
        begin
                reset;
                clear;
        end
        else if ( i_clear_from_writeback )
        begin
                clear;
        end
        else if ( i_data_stall )
        begin
                // Preserve values.
        end
        else if ( i_clear_from_alu )
        begin
                clear;
        end
        else
        begin
           o_condition_code_ff               <= i_condition_code_ff;
           o_destination_index_ff            <= i_destination_index_ff;
           o_alu_operation_ff                <= (
                                                 i_alu_operation_ff == UMLALL ||
                                                 i_alu_operation_ff == UMLALH ||
                                                 i_alu_operation_ff == SMLALL ||
                                                 i_alu_operation_ff == SMLALH
                                                ) ? MOV :
                                                (
                                                i_alu_operation_ff == SMULW0     ||
                                                i_alu_operation_ff == SMULW1     ||
                                                i_alu_operation_ff == SMUL00     ||
                                                i_alu_operation_ff == SMUL01     ||
                                                i_alu_operation_ff == SMUL10     ||
                                                i_alu_operation_ff == SMUL11     ||
                                                i_alu_operation_ff == SMLA00     ||
                                                i_alu_operation_ff == SMLA01     ||
                                                i_alu_operation_ff == SMLA10     ||
                                                i_alu_operation_ff == SMLA11     ||
                                                i_alu_operation_ff == SMLAW0     ||
                                                i_alu_operation_ff == SMLAW1     ||
                                                i_alu_operation_ff == SMLAL00L   ||
                                                i_alu_operation_ff == SMLAL01L   ||
                                                i_alu_operation_ff == SMLAL10L   ||
                                                i_alu_operation_ff == SMLAL11L   ||
                                                i_alu_operation_ff == SMLAL00H   ||
                                                i_alu_operation_ff == SMLAL01H   ||
                                                i_alu_operation_ff == SMLAL10H   ||
                                                i_alu_operation_ff == SMLAL11H
                                                ) ?
                                                 SAT_MOV :
                                                 i_alu_operation_ff;
           o_flag_update_ff                  <= i_flag_update_ff;
           o_mem_srcdest_index_ff            <= i_mem_srcdest_index_ff;
           o_mem_load_ff                     <= i_mem_load_ff;
           o_mem_store_ff                    <= i_mem_store_ff;
           o_mem_pre_index_ff                <= i_mem_pre_index_ff;
           o_mem_unsigned_byte_enable_ff     <= i_mem_unsigned_byte_enable_ff;
           o_mem_signed_byte_enable_ff       <= i_mem_signed_byte_enable_ff;
           o_mem_signed_halfword_enable_ff   <= i_mem_signed_halfword_enable_ff;
           o_mem_unsigned_halfword_enable_ff <= i_mem_unsigned_halfword_enable_ff;
           o_mem_translate_ff                <= i_mem_translate_ff;
           o_irq_ff                          <= i_irq_ff;
           o_fiq_ff                          <= i_fiq_ff;
           o_abt_ff                          <= i_abt_ff;
           o_swi_ff                          <= i_swi_ff;
           o_pc_plus_8_ff                    <= i_pc_plus_8_ff;
           o_mem_srcdest_value_ff            <= mem_srcdest_value;
           o_alu_source_value_ff             <= rn;
           o_shifted_source_value_ff         <= rm;
           o_shift_carry_ff                  <= shift_carry_nxt;
           o_shift_sat_ff                    <= shift_sat_nxt | mult_sat_nxt;
           o_switch_ff                       <= i_switch_ff;
           o_und_ff                          <= i_und_ff;
           o_force32align_ff                 <= i_force32align_ff;
           o_taken_ff                        <= i_taken_ff;
           o_pc_ff                           <= i_pc_ff;
           o_nozero_ff                       <= nozero_nxt;
           // For debug
           o_decompile                       <= i_decompile;
   end
end
// Barrel shifter.
zap_shifter_shift  #(
        .SHIFT_OPS(SHIFT_OPS)
)
U_SHIFT
(
        .i_source       ( i_shift_source_value_ff ),
        .i_amount       ( i_shift_length_value_ff[7:0] ),
        .i_shift_type   ( i_shift_operation_ff ),
        .i_carry        ( i_cpsr_ff[29] ),
        .o_result       ( shout ),
        .o_carry        ( shcarry ),
        .o_sat          ( shsat )
);
// Resolve conflict for ALU source value (rn)
always @*
begin
                rn = resolve_conflict ( i_alu_source_ff, i_alu_source_value_ff,
                                        o_destination_index_ff, i_alu_value_nxt, i_alu_dav_nxt );
end
// Resolve conflict for shifter source value.
always @*
begin
        shift_sat_nxt = 1'd0;
        // If we issue a multiply.
        if ( i_alu_operation_ff == UMLALL || i_alu_operation_ff == UMLALH ||
             i_alu_operation_ff == SMLALL || i_alu_operation_ff == SMLALH )
        begin
                // Get result from multiplier.
                rm              = mult_out;
                // Carry is set to a MEANINGLESS value. Zero in this case.
                shift_carry_nxt = 1'd0;
        end
        else if( shifter_enabled ) // Shifter enabled if valid shift is asked for.
        begin
                // Get result from shifter.
                rm              = shout;
                // Get carry from shifter
                shift_carry_nxt = shcarry;
                // Get saturation from shifter.
                shift_sat_nxt = shsat;
        end
        else
        begin
                // Resolve conflict.
                rm = resolve_conflict ( i_shift_source_ff, i_shift_source_value_ff,
                                        o_destination_index_ff, i_alu_value_nxt, i_alu_dav_nxt );
                // Do not touch the carry. Get from _nxt for back2back execution.
                shift_carry_nxt = i_cpsr_nxt[29];
        end
end
// Mem srcdest index. Used for
// stores. Resolve conflict.
always @*
begin
        mem_srcdest_value = resolve_conflict ( i_mem_srcdest_index_ff, i_mem_srcdest_value_ff,
                                               o_destination_index_ff, i_alu_value_nxt, i_alu_dav_nxt );
end
// This will resolve conflicts for back to back instruction execution.
// The function entirely depends only on the inputs to the function.
function [31:0] resolve_conflict (
        input    [32:0]                  index_from_issue,       // Index from issue stage. Could have immed too.
        input    [31:0]                  value_from_issue,       // Issue speculatively read value.
        input    [$clog2(PHY_REGS)-1:0]  index_from_this_stage,  // From shift (This) stage output flops.
        input    [31:0]                  result_from_alu,        // From ALU output directly.
        input                            result_from_alu_valid   // Result from ALU is VALID.
);
begin
        if ( index_from_issue[32] == IMMED_EN )
        begin
                resolve_conflict = index_from_issue[31:0];
        end
        else if ( index_from_issue == PHY_PC )
        begin
                resolve_conflict = i_pc_plus_8_ff;
        end
        else if ( index_from_this_stage == index_from_issue[$clog2(PHY_REGS)-1:0] && result_from_alu_valid )
        begin
                resolve_conflict = result_from_alu;
        end
        else
        begin
                resolve_conflict = value_from_issue[31:0];
        end
end
endfunction
task reset;
begin
           o_condition_code_ff               <= 0;
           o_destination_index_ff            <= 0;
           o_alu_operation_ff                <= 0;
           o_flag_update_ff                  <= 0;
           o_mem_srcdest_index_ff            <= 0;
           o_mem_load_ff                     <= 0;
           o_mem_store_ff                    <= 0;
           o_mem_pre_index_ff                <= 0;
           o_mem_unsigned_byte_enable_ff     <= 0;
           o_mem_signed_byte_enable_ff       <= 0;
           o_mem_signed_halfword_enable_ff   <= 0;
           o_mem_unsigned_halfword_enable_ff <= 0;
           o_mem_translate_ff                <= 0;
           o_irq_ff                          <= 0;
           o_fiq_ff                          <= 0;
           o_abt_ff                          <= 0;
           o_swi_ff                          <= 0;
           o_pc_plus_8_ff                    <= 0;
           o_mem_srcdest_value_ff            <= 0;
           o_alu_source_value_ff             <= 0;
           o_shifted_source_value_ff         <= 0;
           o_shift_carry_ff                  <= 0;
           o_shift_sat_ff                    <= 0;
           o_switch_ff                       <= 0;
           o_und_ff                          <= 0;
           o_force32align_ff                 <= 0;
           o_taken_ff                        <= 0;
           o_pc_ff                           <= 0;
           o_nozero_ff                       <= 0;
           o_decompile                       <= 0;
end
endtask
endmodule