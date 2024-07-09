module extracts
// architectural register numbers.
assign  o_destination_index_nxt = // Always a register so no need for IMMED_EN.
        translate ( destination_index_nxt, i_cpsr_ff_mode );
assign  o_alu_source_nxt =
        (alu_source_nxt[32] == IMMED_EN ) ? // Constant...?
        alu_source_nxt : // Pass constant on.
        translate ( alu_source_nxt, i_cpsr_ff_mode ); // Translate index.
assign  o_shift_source_nxt =
        (shift_source_nxt[32] == IMMED_EN ) ? // Constant...?
        shift_source_nxt : // Pass constant on.
        translate ( shift_source_nxt, i_cpsr_ff_mode ); // Translate index.
assign  o_shift_length_nxt =
        (shift_length_nxt[32] == IMMED_EN ) ? // Constant...?
        shift_length_nxt : // Pass constant on.
        translate ( shift_length_nxt, i_cpsr_ff_mode ); // Translate index.
assign  o_mem_srcdest_index_nxt = // Always a register so no need for IMMED_EN.
        translate ( mem_srcdest_index_nxt, i_cpsr_ff_mode );
// The actual decision whether or not to execute this is taken in EX stage.
// At this point, we don't do anything with the SWI except take note.
always @*
        o_swi_nxt = &i_instruction[27:24];
wire [64*8-1:0] decompile_tmp;
// Flop the outputs to break the pipeline at this point.
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
                // Preserve state.
        end
        else if ( i_clear_from_alu )
        begin
                clear;
        end
        else if ( i_stall_from_shifter )
        begin
                // Preserve state.
        end
        else if ( i_stall_from_issue )
        begin
                // Preserve state.
        end
        // If no stall, only then update...
        else
        begin
                o_irq_ff                                <= o_irq_nxt;
                o_fiq_ff                                <= o_fiq_nxt;
                o_swi_ff                                <= o_swi_nxt;
                o_abt_ff                                <= o_abt_nxt;
                o_und_ff                                <= o_und_nxt;
                o_condition_code_ff                     <= o_condition_code_nxt;
                o_destination_index_ff                  <= o_destination_index_nxt;
                o_alu_source_ff                         <= o_alu_source_nxt;
                o_alu_operation_ff                      <= o_alu_operation_nxt;
                o_shift_source_ff                       <= o_shift_source_nxt;
                o_shift_operation_ff                    <= o_shift_operation_nxt;
                o_shift_length_ff                       <= o_shift_length_nxt;
                o_flag_update_ff                        <= o_flag_update_nxt;
                o_mem_srcdest_index_ff                  <= o_mem_srcdest_index_nxt;
                o_mem_load_ff                           <= o_mem_load_nxt;
                o_mem_store_ff                          <= o_mem_store_nxt;
                o_mem_pre_index_ff                      <= o_mem_pre_index_nxt;
                o_mem_unsigned_byte_enable_ff           <= o_mem_unsigned_byte_enable_nxt;
                o_mem_signed_byte_enable_ff             <= o_mem_signed_byte_enable_nxt;
                o_mem_signed_halfword_enable_ff         <= o_mem_signed_halfword_enable_nxt;
                o_mem_unsigned_halfword_enable_ff       <= o_mem_unsigned_halfword_enable_nxt;
                o_mem_translate_ff                      <= o_mem_translate_nxt;
                o_pc_plus_8_ff                          <= i_pc_plus_8_ff;
                o_pc_ff                                 <= i_pc_ff;
                o_switch_ff                             <= o_switch_nxt;
                o_force32align_ff                       <= i_force32align;
                o_taken_ff                              <= i_taken;
                // For debug
                o_decompile                             <= decompile_tmp;
        end
end
task reset;
begin
                o_irq_ff                                <= 0;
                o_fiq_ff                                <= 0;
                o_swi_ff                                <= 0;
                o_abt_ff                                <= 0;
                o_und_ff                                <= 0;
                o_condition_code_ff                     <= 0;
                o_destination_index_ff                  <= 0;
                o_alu_source_ff                         <= 0;
                o_alu_operation_ff                      <= 0;
                o_shift_source_ff                       <= 0;
                o_shift_operation_ff                    <= 0;
                o_shift_length_ff                       <= 0;
                o_flag_update_ff                        <= 0;
                o_mem_srcdest_index_ff                  <= 0;
                o_mem_load_ff                           <= 0;
                o_mem_store_ff                          <= 0;
                o_mem_pre_index_ff                      <= 0;
                o_mem_unsigned_byte_enable_ff           <= 0;
                o_mem_signed_byte_enable_ff             <= 0;
                o_mem_signed_halfword_enable_ff         <= 0;
                o_mem_unsigned_halfword_enable_ff       <= 0;
                o_mem_translate_ff                      <= 0;
                o_pc_plus_8_ff                          <= 0;
                o_pc_ff                                 <= 0;
                o_switch_ff                             <= 0;
                o_force32align_ff                       <= 0;
                o_taken_ff                              <= 0;
                o_decompile                             <= 0;
end
endtask
task clear; // Clear and refresh the unit. Clear everything and a set a dummy
            // output to NV acting like a reset.
begin
                o_irq_ff                                <= 0;
                o_fiq_ff                                <= 0;
                o_swi_ff                                <= 0;
                o_abt_ff                                <= 0;
                o_condition_code_ff                     <= NV;
                o_und_ff                                <= 0;
                o_taken_ff                              <= 0;
end
endtask
// Bulk of the decode logic is here.
zap_decode #(
        .ARCH_REGS      (ARCH_REGS),
        .ALU_OPS        (ALU_OPS),
        .SHIFT_OPS      (SHIFT_OPS)
)
u_zap_decode (
        .i_irq(i_irq),
        .i_fiq(i_fiq),
        .i_abt(i_abt),
        .i_instruction(i_instruction),
        .i_instruction_valid(i_instruction_valid),
        .i_cpsr_ff_mode(i_cpsr_ff_mode),
        .o_condition_code(o_condition_code_nxt),
        .o_destination_index(destination_index_nxt),
        .o_alu_source(alu_source_nxt),
        .o_alu_operation(o_alu_operation_nxt),
        .o_shift_source(shift_source_nxt),
        .o_shift_operation(o_shift_operation_nxt),
        .o_shift_length(shift_length_nxt),
        .o_flag_update(o_flag_update_nxt),
        .o_mem_srcdest_index(mem_srcdest_index_nxt),
        .o_mem_load(o_mem_load_nxt),
        .o_mem_store(o_mem_store_nxt),
        .o_mem_pre_index(o_mem_pre_index_nxt),
        .o_mem_unsigned_byte_enable(o_mem_unsigned_byte_enable_nxt),
        .o_mem_signed_byte_enable(o_mem_signed_byte_enable_nxt),
        .o_mem_signed_halfword_enable(o_mem_signed_halfword_enable_nxt),
        .o_mem_unsigned_halfword_enable(o_mem_unsigned_halfword_enable_nxt),
        .o_mem_translate(o_mem_translate_nxt),
        .o_und(o_und_nxt),
        .o_switch(o_switch_nxt)
);
// Decompile
zap_decompile u_zap_decompile (
        .i_instruction  (i_instruction[35:0]),
        .i_dav          (i_instruction_valid),
        .o_decompile    (decompile_tmp)
);
endmodule