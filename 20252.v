module
// =================================================================================
reg [31:0] tmp_address;
    // Data access
always @( posedge i_clk )
    // Data Write
    if ( get_1bit_signal(0) && !get_1bit_signal(1) )
        begin
        $fwrite(decompile_file, "%09d              write   addr ", `U_TB.clk_count);
        tmp_address = get_32bit_signal(2);
        fwrite_hex_drop_zeros(decompile_file, {tmp_address [31:2], 2'd0} );
        $fwrite(decompile_file, ", data %08h, be %h",
                get_32bit_signal(3),    // u_cache.i_write_data
                get_4bit_signal (0));   // u_cache.i_byte_enable
        if ( get_1bit_signal(2) ) // Abort! address translation failed
            $fwrite(decompile_file, " aborted!\n");
        else
            $fwrite(decompile_file, "\n");
        end
    // Data Read
    else if (get_1bit_signal(3) && !get_1bit_signal(0)  && !get_1bit_signal(1))
        begin
        $fwrite(decompile_file, "%09d              read    addr ", `U_TB.clk_count);
        tmp_address = get_32bit_signal(2);
        fwrite_hex_drop_zeros(decompile_file, {tmp_address[31:2], 2'd0} );
        $fwrite(decompile_file, ", data %08h", get_32bit_signal(4));  // u_decode.i_read_data
        if ( get_1bit_signal(2) ) // Abort! address translation failed
            $fwrite(decompile_file, " aborted!\n");
        else
            $fwrite(decompile_file, "\n");
        end
// =================================================================================
// Tasks
// =================================================================================
// Write Condition field
task wcond;
    begin
    case( condition)
        4'h0:    $fwrite(decompile_file,"eq");
        4'h1:    $fwrite(decompile_file,"ne");
        4'h2:    $fwrite(decompile_file,"cs");
        4'h3:    $fwrite(decompile_file,"cc");
        4'h4:    $fwrite(decompile_file,"mi");
        4'h5:    $fwrite(decompile_file,"pl");
        4'h6:    $fwrite(decompile_file,"vs");
        4'h7:    $fwrite(decompile_file,"vc");
        4'h8:    $fwrite(decompile_file,"hi");
        4'h9:    $fwrite(decompile_file,"ls");
        4'ha:    $fwrite(decompile_file,"ge");
        4'hb:    $fwrite(decompile_file,"lt");
        4'hc:    $fwrite(decompile_file,"gt");
        4'hd:    $fwrite(decompile_file,"le");
        4'he:    $fwrite(decompile_file,"  ");  // Always
        default: $fwrite(decompile_file,"nv");  // Never
    endcase
    end
endtask
// ldm and stm types
task w_mtrans_type;
    begin
    case( mtrans_itype )
        4'h0:    $fwrite(decompile_file,"da");
        4'h1:    $fwrite(decompile_file,"ia");
        4'h2:    $fwrite(decompile_file,"db");
        4'h3:    $fwrite(decompile_file,"ib");
        default: $fwrite(decompile_file,"xx");
    endcase
    end
endtask
// e.g. mrc	15, 0, r9, cr0, cr0, {0}
task cortrans_args;
    begin
    // Co-Processor Number
    $fwrite(decompile_file,"%1d, ", execute_instruction[11:8]);
    // opcode1
    $fwrite(decompile_file,"%1d, ", execute_instruction[23:21]);
    // Rd [15:12]
    warmreg(reg_d);
    // CRn [19:16]
    $fwrite(decompile_file,", cr%1d", execute_instruction[19:16]);
    // CRm [3:0]
    $fwrite(decompile_file,", cr%1d", execute_instruction[3:0]);
    // Opcode2 [7:5]
    $fwrite(decompile_file,", {%1d}",   execute_instruction[7:5]);
    end
endtask
// ldc	15, 0, r9, cr0, cr0, {0}
task codtrans_args;
    begin
    // Co-Processor Number
    $fwrite(decompile_file,"%1d, ", execute_instruction[11:8]);
    // CRd [15:12]
    $fwrite(decompile_file,"cr%1d, ", execute_instruction[15:12]);
    // Rd [19:16]
    warmreg(reg_n);
    end
endtask
task branch_args;
reg [31:0] shift_amount;
    begin
    if (execute_instruction[23]) // negative
        shift_amount = {~execute_instruction[23:0] + 24'd1, 2'd0};
    else
        shift_amount = {execute_instruction[23:0], 2'd0};
    if (execute_instruction[23]) // negative
        fwrite_hex_drop_zeros ( decompile_file, get_reg_val( 5'd21 ) - shift_amount );
    else
        fwrite_hex_drop_zeros ( decompile_file, get_reg_val( 5'd21 ) + shift_amount );
    end
endtask
task mult_args;
    begin
    warmreg(reg_n);  // Rd is in the Rn position for MULT instructions
    $fwrite(decompile_file,", ");
    warmreg(reg_m);
    $fwrite(decompile_file,", ");
    warmreg(reg_s);
    if (execute_instruction[21]) // MLA
        begin
        $fwrite(decompile_file,", ");
        warmreg(reg_d);
        end
    end
endtask
task swap_args;
    begin
    warmreg(reg_d);
    $fwrite(decompile_file,", ");
    warmreg(reg_m);
    $fwrite(decompile_file,", [");
    warmreg(reg_n);
    $fwrite(decompile_file,"]");
    end
endtask
task regop_args;
    begin
    if (!opcode_compare)
        warmreg(reg_d);
    if (!opcode_move )
        begin
        if (!opcode_compare)
            begin
            $fwrite(decompile_file,", ");
            if (reg_d < 4'd10 || reg_d > 4'd12)
                $fwrite(decompile_file," ");
            end
        warmreg(reg_n);
        $fwrite(decompile_file,", ");
        if (reg_n < 4'd10 || reg_n > 4'd12)
            $fwrite(decompile_file," ");
        end
    else
        begin
        $fwrite(decompile_file,", ");
        if (reg_d < 4'd10 || reg_d > 4'd12)
            $fwrite(decompile_file," ");
        end
    if (shift_op_imm)
        begin
        if (|imm32[31:15])
            $fwrite(decompile_file,"#0x%08h", imm32);
        else
            $fwrite(decompile_file,"#%1d", imm32);
        end
    else // Rm
        begin
        warmreg(reg_m);
        if (execute_instruction[4])
            // Register Shifts
            wshiftreg;
        else
            // Immediate shifts
            wshift;
        end
    end
endtask
task trans_args;
    begin
    warmreg(reg_d);   // Destination register
    casez ({execute_instruction[25:23], execute_instruction[21], no_shift, offset12==12'd0})
           6'b0100?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #-%1d]" , offset12); end
           6'b0110?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #%1d]"  , offset12); end
           6'b0100?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0110?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0101?? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #-%1d]!", offset12); end
           6'b0111?? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #%1d]!" , offset12); end
           6'b0000?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #-%1d", offset12); end
           6'b0010?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #%1d" , offset12); end
           6'b0001?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #-%1d", offset12); end
           6'b0011?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #%1d" , offset12); end
           6'b0000?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0010?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0001?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0011?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b11001? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); $fwrite(decompile_file,"]");  end
           6'b11101? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); $fwrite(decompile_file,"]");  end
           6'b11011? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); $fwrite(decompile_file,"]!"); end
           6'b11111? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); $fwrite(decompile_file,"]!"); end
           6'b10001? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m);  end
           6'b10101? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m);  end
           6'b10011? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m);  end
           6'b10111? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m);  end
           6'b11000? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); wshift; $fwrite(decompile_file,"]"); end
           6'b11100? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); wshift; $fwrite(decompile_file,"]"); end
           6'b11010? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); wshift; $fwrite(decompile_file,"]!");end
           6'b11110? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); wshift; $fwrite(decompile_file,"]!");end
           6'b10000? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m); wshift; end
           6'b10100? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m); wshift; end
           6'b10010? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m); wshift; end
           6'b10110? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m); wshift; end
    endcase
    end
endtask
task mtrans_args;
    begin
    warmreg(reg_n);
    if (execute_instruction[21]) $fwrite(decompile_file,"!");
    $fwrite(decompile_file,", {");
    for (i=0;i<16;i=i+1)
        if (execute_instruction[i])
            begin
            warmreg(i);
            if (more_to_come(execute_instruction[15:0], i))
                $fwrite(decompile_file,", ");
            end
    $fwrite(decompile_file,"}");
    // SDM: store the user mode registers, when in priviledged mode
    if (execute_instruction[22:20] == 3'b100)
        $fwrite(decompile_file,"^");
    end
endtask
task wshift;
    begin
    // Check that its a valid shift operation. LSL by #0 is the null operator
    if (execute_instruction[6:5] != LSL || shift_imm != 5'd0)
        begin
        case(execute_instruction[6:5])
            2'd0: $fwrite(decompile_file,", lsl");
            2'd1: $fwrite(decompile_file,", lsr");
            2'd2: $fwrite(decompile_file,", asr");
            2'd3: if (shift_imm == 5'd0) $fwrite(decompile_file,", rrx"); else $fwrite(decompile_file,", ror");
        endcase
       if (execute_instruction[6:5] != 2'd3 || shift_imm != 5'd0)
           $fwrite(decompile_file," #%1d", shift_imm);
       end
    end
endtask
task wshiftreg;
    begin
    case(execute_instruction[6:5])
        2'd0: $fwrite(decompile_file,", lsl ");
        2'd1: $fwrite(decompile_file,", lsr ");
        2'd2: $fwrite(decompile_file,", asr ");
        2'd3: $fwrite(decompile_file,", ror ");
    endcase
    warmreg(reg_s);
    end
endtask
task warmreg;
input [3:0] regnum;
    begin
    if (regnum < 4'd12)
        $fwrite(decompile_file,"r%1d", regnum);
    else
    case (regnum)
        4'd12   : $fwrite(decompile_file,"ip");
        4'd13   : $fwrite(decompile_file,"sp");
        4'd14   : $fwrite(decompile_file,"lr");
        4'd15   : $fwrite(decompile_file,"pc");
    endcase
    end
endtask
task fwrite_hex_drop_zeros;
input [31:0] file;
input [31:0] num;
    begin
    if (num[31:28] != 4'd0)
        $fwrite(file, "%x", num);
    else if (num[27:24] != 4'd0)
        $fwrite(file, "%x", num[27:0]);
    else if (num[23:20] != 4'd0)
        $fwrite(file, "%x", num[23:0]);
    else if (num[19:16] != 4'd0)
        $fwrite(file, "%x", num[19:0]);
    else if (num[15:12] != 4'd0)
        $fwrite(file, "%x", num[15:0]);
    else if (num[11:8] != 4'd0)
        $fwrite(file, "%x", num[11:0]);
    else if (num[7:4] != 4'd0)
        $fwrite(file, "%x", num[7:0]);
    else
        $fwrite(file, "%x", num[3:0]);
    end
endtask
// =================================================================================
// Functions
// =================================================================================
// Get current value of register
function [31:0] get_reg_val;
input [4:0] regnum;
begin
    case (regnum)
        5'd0   : get_reg_val = `U_REGISTER_BANK.r0_out;
        5'd1   : get_reg_val = `U_REGISTER_BANK.r1_out;
        5'd2   : get_reg_val = `U_REGISTER_BANK.r2_out;
        5'd3   : get_reg_val = `U_REGISTER_BANK.r3_out;
        5'd4   : get_reg_val = `U_REGISTER_BANK.r4_out;
        5'd5   : get_reg_val = `U_REGISTER_BANK.r5_out;
        5'd6   : get_reg_val = `U_REGISTER_BANK.r6_out;
        5'd7   : get_reg_val = `U_REGISTER_BANK.r7_out;
        5'd8   : get_reg_val = `U_REGISTER_BANK.r8_out;
        5'd9   : get_reg_val = `U_REGISTER_BANK.r9_out;
        5'd10  : get_reg_val = `U_REGISTER_BANK.r10_out;
        5'd11  : get_reg_val = `U_REGISTER_BANK.r11_out;
        5'd12  : get_reg_val = `U_REGISTER_BANK.r12_out;
        5'd13  : get_reg_val = `U_REGISTER_BANK.r13_out;
        5'd14  : get_reg_val = `U_REGISTER_BANK.r14_out;
        5'd15  : get_reg_val = `U_REGISTER_BANK.r15_out_rm; // the version of pc with status bits
        5'd16  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd17  : get_reg_val = `U_REGISTER_BANK.r14_firq;
        5'd18  : get_reg_val = `U_REGISTER_BANK.r14_irq;
        5'd19  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd20  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd21  : get_reg_val = `U_REGISTER_BANK.r15_out_rn; // the version of pc without status bits
    endcase
end
endfunction
function [31:0] get_32bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_32bit_signal = `U_EXECUTE.pc_nxt;
        3'd1: get_32bit_signal = `U_FETCH.i_address;
        3'd2: get_32bit_signal = `U_FETCH.i_address;
        3'd3: get_32bit_signal = `U_CACHE.i_write_data;
        3'd4: get_32bit_signal = `U_DECODE.i_read_data;
    endcase
end
endfunction
function get_1bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_1bit_signal = `U_FETCH.i_write_enable;
        3'd1: get_1bit_signal = `U_AMBER.fetch_stall;
        3'd2: get_1bit_signal = 1'd0;
        3'd3: get_1bit_signal = `U_FETCH.i_data_access;
    endcase
end
endfunction
function [3:0] get_4bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_4bit_signal = `U_CACHE.i_byte_enable;
    endcase
end
endfunction
function [3:0] numchars;
input [(5*8)-1:0] xINSTRUCTION_EXECUTE;
begin
     if (xINSTRUCTION_EXECUTE[31:0] == "    ")
    numchars = 4'd1;
else if (xINSTRUCTION_EXECUTE[23:0] == "   ")
    numchars = 4'd2;
else if (xINSTRUCTION_EXECUTE[15:0] == "  ")
    numchars = 4'd3;
else if (xINSTRUCTION_EXECUTE[7:0]  == " ")
    numchars = 4'd4;
else
    numchars = 4'd5;
end
endfunction
function more_to_come;
input [15:0] regs;
input [31:0] i;
begin
case (i)
    15 : more_to_come = 1'd0;
    14 : more_to_come =  regs[15]    ? 1'd1 : 1'd0;
    13 : more_to_come = |regs[15:14] ? 1'd1 : 1'd0;
    12 : more_to_come = |regs[15:13] ? 1'd1 : 1'd0;
    11 : more_to_come = |regs[15:12] ? 1'd1 : 1'd0;
    10 : more_to_come = |regs[15:11] ? 1'd1 : 1'd0;
     9 : more_to_come = |regs[15:10] ? 1'd1 : 1'd0;
     8 : more_to_come = |regs[15: 9] ? 1'd1 : 1'd0;
     7 : more_to_come = |regs[15: 8] ? 1'd1 : 1'd0;
     6 : more_to_come = |regs[15: 7] ? 1'd1 : 1'd0;
     5 : more_to_come = |regs[15: 6] ? 1'd1 : 1'd0;
     4 : more_to_come = |regs[15: 5] ? 1'd1 : 1'd0;
     3 : more_to_come = |regs[15: 4] ? 1'd1 : 1'd0;
     2 : more_to_come = |regs[15: 3] ? 1'd1 : 1'd0;
     1 : more_to_come = |regs[15: 2] ? 1'd1 : 1'd0;
     0 : more_to_come = |regs[15: 1] ? 1'd1 : 1'd0;
endcase
end
endfunction
`endif
endmodule