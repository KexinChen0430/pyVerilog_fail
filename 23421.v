module zap_thumb_decoder_main (
        // Clock and reset.
        input wire              i_clk,
        input wire              i_reset,
        // Code stall.
        input wire              i_clear_from_writeback,
        input wire              i_data_stall,
        input wire              i_clear_from_alu,
        input wire              i_stall_from_shifter,
        input wire              i_stall_from_issue,
        input wire              i_stall_from_decode,
        input wire              i_clear_from_decode,
        // Predictor status.
        input wire  [1:0]       i_taken,
        // Input from I-cache.
        // Instruction and valid qualifier.
        input wire [31:0]       i_instruction,
        input wire              i_instruction_valid,
        // Interrupts. Active high level sensitive signals.
        input wire              i_irq,
        input wire              i_fiq,
        // Aborts.
        input wire              i_iabort,
        output reg              o_iabort,
        // Ensure compressed mode is active (T bit).
        input wire              i_cpsr_ff_t,
        // Program counter.
        input wire      [31:0]  i_pc_ff,
        input wire      [31:0]  i_pc_plus_8_ff,
        // Outputs to the ARM decoder.
        // Instruction, valid, undefined by this decoder and force 32-bit
        // align signals (requires memory to keep lower 2 bits as 00).
        output reg [34:0]       o_instruction,
        output reg              o_instruction_valid,
        output reg              o_und,
        output reg              o_force32_align,
        // PCs.
        output  reg [31:0]      o_pc_ff,
        output  reg [31:0]      o_pc_plus_8_ff,
        // Interrupt status output.
        output reg              o_irq,
        output reg              o_fiq,
        // Taken
        output reg      [1:0]   o_taken_ff
);
`include "zap_defines.vh"
`include "zap_localparams.vh"
`include "zap_functions.vh"
wire [34:0] instruction_nxt;
wire instruction_valid_nxt;
wire und_nxt;
wire force32_nxt;
wire irq_nxt;
wire fiq_nxt;
reg  [1:0] taken_nxt;
zap_thumb_decoder u_zap_thumb_decoder (
        .i_instruction(i_instruction),
        .i_instruction_valid(i_instruction_valid),
        .i_irq(i_irq),
        .i_fiq(i_fiq),
        .i_offset(o_instruction[11:0]),
        .i_cpsr_ff_t(i_cpsr_ff_t),
        .o_instruction(instruction_nxt),
        .o_instruction_valid(instruction_valid_nxt),
        .o_und(und_nxt),
        .o_force32_align(force32_nxt),
        .o_irq(irq_nxt),
        .o_fiq(fiq_nxt)
);
always @ (posedge i_clk)
begin
        if ( i_reset )
        begin
                reset;
                o_instruction_valid <= 1'd0;
                o_irq <= 0;
                o_fiq <= 0;
                o_und <= 0;
                o_iabort <= 0;
        end
        else if ( i_clear_from_writeback )
        begin
                o_instruction_valid <= 1'd0;
                o_irq <= 0;
                o_fiq <= 0;
                o_und <= 0;
                o_iabort <= 0;
        end
        else if ( i_data_stall )
        begin
        end
        else if ( i_clear_from_alu )
        begin
                o_instruction_valid <= 1'd0;
                o_irq <= 0;
                o_fiq <= 0;
                o_und <= 0;
                o_iabort <= 0;
        end
        else if ( i_stall_from_shifter ) begin end
        else if ( i_stall_from_issue )   begin end
        else if ( i_stall_from_decode )  begin end
        else if ( i_clear_from_decode )
        begin
                o_instruction_valid <= 1'd0;
                o_irq <= 0;
                o_fiq <= 0;
                o_und <= 0;
                o_iabort <= 0;
        end
        else // BUG FIX.
        begin
                o_iabort                <= i_iabort;
                o_instruction_valid     <= instruction_valid_nxt;
                o_instruction           <= instruction_nxt;
                o_und                   <= und_nxt;
                o_force32_align         <= force32_nxt;
                o_pc_ff                 <= i_pc_ff;
                o_pc_plus_8_ff          <= i_pc_plus_8_ff;
                o_irq                   <= irq_nxt;
                o_fiq                   <= fiq_nxt;
                o_taken_ff              <= i_taken;
        end
end
task reset;
begin
                o_iabort                <= 0;
                o_instruction_valid     <= 0;
                o_instruction           <= 0;
                o_und                   <= 0;
                o_force32_align         <= 0;
                o_pc_ff                 <= 0;
                o_pc_plus_8_ff          <= 0;
                o_irq                   <= 0;
                o_fiq                   <= 0;
                o_taken_ff              <= 0;
end
endtask
// Helpful for debug.
zap_decompile u_zap_decompile (
        .i_instruction  ({1'd0, o_instruction}),
        .i_dav          (o_instruction_valid),
        .o_decompile    ()
);
endmodule