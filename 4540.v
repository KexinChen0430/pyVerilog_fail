module.
 */
task clear ( input [31:0] flags );
begin
                o_dav_ff                         <= 0;
                flags_ff                         <= flags;
                o_abt_ff                         <= 0;
                o_irq_ff                         <= 0;
                o_fiq_ff                         <= 0;
                o_swi_ff                         <= 0;
                o_und_ff                         <= 0;
                sleep_ff                         <= 0;
                o_mem_load_ff                    <= 0;
                o_mem_store_ff                   <= 0;
end
endtask
/*
 */
function [31:0] duplicate (     input ub, // Unsigned byte.
                                input sb, // Signed byte.
                                input uh, // Unsigned halfword.
                                input sh, // Signed halfword.
                                input [31:0] val        );
reg [31:0] x;
begin
        if ( ub || sb)
        begin
                // Byte.
                x = {val[7:0], val[7:0], val[7:0], val[7:0]};
        end
        else if (uh || sh)
        begin
                // Halfword.
                x = {val[15:0], val[15:0]};
        end
        else
        begin
                x = val;
        end
        duplicate = x;
end
endfunction
/*
 */
function [3:0] generate_ben (   input ub, // Unsigned byte.
                                input sb, // Signed byte.
                                input uh, // Unsigned halfword.
                                input sh, // Signed halfword.
                                input [31:0] addr       );
reg [3:0] x;
begin
        if ( ub || sb ) // Byte oriented.
        begin
                case ( addr[1:0] ) // Based on address lower 2-bits.
                0: x = 1;
                1: x = 1 << 1;
                2: x = 1 << 2;
                3: x = 1 << 3;
                endcase
        end
        else if ( uh || sh ) // Halfword. A word = 2 half words.
        begin
                case ( addr[1] )
                0: x = 4'b0011;
                1: x = 4'b1100;
                endcase
        end
        else
        begin
                x = 4'b1111; // Word oriented.
        end
        generate_ben = x;
end
endfunction // generate_ben
task reset;
begin
                o_alu_result_ff                  <= 0;
                o_dav_ff                         <= 0;
                o_pc_plus_8_ff                   <= 0;
                o_destination_index_ff           <= 0;
                flags_ff                         <= 0;
                o_abt_ff                         <= 0;
                o_irq_ff                         <= 0;
                o_fiq_ff                         <= 0;
                o_swi_ff                         <= 0;
                o_mem_srcdest_index_ff           <= 0;
                o_mem_srcdest_index_ff           <= 0;
                o_mem_load_ff                    <= 0;
                o_mem_store_ff                   <= 0;
                o_mem_unsigned_byte_enable_ff    <= 0;
                o_mem_signed_byte_enable_ff      <= 0;
                o_mem_signed_halfword_enable_ff  <= 0;
                o_mem_unsigned_halfword_enable_ff<= 0;
                o_mem_translate_ff               <= 0;
                o_mem_srcdest_value_ff           <= 0;
                o_ben_ff                         <= 0;
                o_decompile                      <= 0;
end
endtask
endmodule