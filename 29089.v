module musb_monitor#(
    parameter CORE = ""
    )(
    input               halt,
    input               if_stall,
    input               if_flush,
    input               id_stall,
    input               id_flush,
    input               ex_stall,
    input               ex_flush,
    input               mem_stall,
    input               mem_flush,
    input               wb_stall,
    input       [31:0]  mem_exception_pc,
    input       [31:0]  id_instruction,
    input       [4:0]   wb_gpr_wa,
    input       [31:0]  wb_gpr_wd,
    input               wb_gpr_we,
    input       [31:0]  mem_address,
    input       [31:0]  mem_data,
    input               if_exception_ready,
    input               id_exception_ready,
    input               ex_exception_ready,
    input               mem_exception_ready,
    output  reg         clk_core,
    output  reg         clk_bus,
    output  reg         rst
    );
    // wires
    // registers
    reg  [256*8-1:0] trace_buffer[0:`TRACE_BUFFER_SIZE];
    reg  [31:0]      wb_exception_pc;
    reg  [31:0]      ex_instruction;
    reg  [31:0]      mem_instruction;
    reg  [31:0]      wb_instruction;
    reg  [31:0]      wb_mem_address;
    reg  [31:0]      wb_mem_store_data;
    reg              id_instruction_stalled;
    reg              id_instruction_flushed;
    reg              ex_instruction_stalled;
    reg              ex_instruction_flushed;
    reg              mem_instruction_stalled;
    reg              mem_instruction_flushed;
    reg              wb_instruction_stalled;
    reg              wb_instruction_flushed;
    reg [31:0]       cause_reg;
    reg [256*8-1:0]  cause_string;
    // counters
    integer trace_fill_counter;
    // Tasks
    // Get CP0 register
    task get_cp0_reg;
        input    [4:0]     cp0_addr;
        output   [31:0]    cp0_data;
        begin
            if (CORE == "core") begin
                case (cp0_addr)
                    5'd8   : cp0_data = core.musb_cpzero0.BadVAddr;
                    5'd9   : cp0_data = core.musb_cpzero0.Count;
                    5'd11  : cp0_data = core.musb_cpzero0.Compare;
                    5'd12  : cp0_data = core.musb_cpzero0.Status;
                    5'd13  : cp0_data = core.musb_cpzero0.Cause;
                    5'd14  : cp0_data = core.musb_cpzero0.EPC;
                    5'd15  : cp0_data = core.musb_cpzero0.PRId;
                    5'd16  : cp0_data = core.musb_cpzero0.Config1;
                    5'd30  : cp0_data = core.musb_cpzero0.ErrorEPC;
                    default: cp0_data = 32'h0000_0000;
                endcase
            end
            else begin
                case (cp0_addr)
                    5'd8   : cp0_data = soc.musb_core0.musb_cpzero0.BadVAddr;
                    5'd9   : cp0_data = soc.musb_core0.musb_cpzero0.Count;
                    5'd11  : cp0_data = soc.musb_core0.musb_cpzero0.Compare;
                    5'd12  : cp0_data = soc.musb_core0.musb_cpzero0.Status;
                    5'd13  : cp0_data = soc.musb_core0.musb_cpzero0.Cause;
                    5'd14  : cp0_data = soc.musb_core0.musb_cpzero0.EPC;
                    5'd15  : cp0_data = soc.musb_core0.musb_cpzero0.PRId;
                    5'd16  : cp0_data = soc.musb_core0.musb_cpzero0.Config1;
                    5'd30  : cp0_data = soc.musb_core0.musb_cpzero0.ErrorEPC;
                    default: cp0_data = 32'h0000_0000;
                endcase
            end
        end
    endtask
    // Decode the exception cause
    task decode_cause;
        input   [31:0]  cause;
        begin
            case (cause[6:2])
                5'h4    : $sformat(cause_string, "EXC_AdEL");
                5'h5    : $sformat(cause_string, "EXC_AdES");
                5'h7    : $sformat(cause_string, "EXC_DBE");
                5'hd    : $sformat(cause_string, "EXC_Tr");
                5'hc    : $sformat(cause_string, "EXC_Ov");
                5'h8    : $sformat(cause_string, "EXC_Sys");
                5'h9    : $sformat(cause_string, "EXC_Bp");
                5'ha    : $sformat(cause_string, "EXC_RI");
                5'hb    : $sformat(cause_string, "EXC_CpU");
                5'h4    : $sformat(cause_string, "EXC_AdIF");
                5'h6    : $sformat(cause_string, "EXC_IBE");
                5'h0    : $sformat(cause_string, "EXC_Int");
                default : $sformat(cause_string, "UNKNOWN CAUSE");
            endcase
        end
    endtask
    // Print GPR
    task print_gpr;
        integer index;
        begin
            $display("INFO-MONITOR:\tRegister file dump:\n");
            for(index = 1; index < 32; index = index + 1) begin
                if (CORE == "core") begin
                    $display("\tR[%02d] = 0x%8h ( %d )", index, core.GPR.registers[index], core.GPR.registers[index]);
                end
                else begin
                    $display("\tR[%02d] = 0x%8h ( %d )", index, soc.musb_core0.GPR.registers[index],soc.musb_core0.GPR.registers[index]);
                end
            end
            $display("\nINFO-MONITOR:\tEnd register file dump.\n");
        end
    endtask
    // Dump the memory
    task dump_memory;
        begin
            if (CORE == "core") begin
                $writememh("core_dump.txt", memory0.mem);
            end
            else begin
                $writememh("core_dump.txt", soc.memory0.mem);
            end
            $display("INFO-MONITOR:\tMemory file dump: DONE.");
        end
    endtask
    // Decode instruction, and store in a buffer
    task decode_instruction;
        input   [31:0] id_pc;
        input   [31:0] instruction;
        input   [4:0]  wb_register;
        input   [31:0] wb_data;
        input          wb_we;
        input   [31:0] mem_address;
        input   [31:0] mem_store_data;
        reg         [5:0]       opcode;
        reg         [4:0]       op_rs;
        reg         [4:0]       op_rt;
        reg         [4:0]       op_rd;
        reg         [5:0]       op_function;
        reg signed  [15:0]      op_imm16;
        reg         [25:0]      op_imm26;
        reg         [2:0]       op_cp0_select;
        reg         [256*8-1:0] instruction_string;
        reg         [256*8-1:0] wb_register_string;
        reg         [256*8-1:0] trace;
        begin
            if (~rst & ~halt) begin
                opcode             = instruction[`MUSB_INSTR_OPCODE];
                op_rs              = instruction[`MUSB_INSTR_RS];
                op_rt              = instruction[`MUSB_INSTR_RT];
                op_rd              = instruction[`MUSB_INSTR_RD];
                op_function        = instruction[`MUSB_INSTR_FUNCT];
                op_imm16           = instruction[`MUSB_INSTR_IMM16];
                op_imm26           = instruction[`MUSB_INSTR_IMM26];
                op_cp0_select      = instruction[`MUSB_INSTR_CP0_SEL];
                instruction_string = 0;
                wb_register_string = 0;
                //$write("| %-5d ns | 0x%h: | 0x%h | ", $time - 1, id_pc, instruction); // time - 1 (delay)
                case(opcode)
                    `OP_TYPE_R      :   begin
                                            case (op_function)
                                                `FUNCTION_OP_ADD        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "ADD", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_ADDU       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "ADDU", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_AND        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "AND", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_BREAK      :   begin $sformat(instruction_string, "%-10s ", "BREAK"); end
                                                `FUNCTION_OP_DIV        :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d", "DIV", op_rs, op_rt); end
                                                `FUNCTION_OP_DIVU       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d", "DIVU", op_rs, op_rt); end
                                                `FUNCTION_OP_JALR       :   begin $sformat(instruction_string, "%-10s r%-2d", "JALR", op_rs); end
                                                `FUNCTION_OP_JR         :   begin $sformat(instruction_string, "%-10s r%-2d", "JR", op_rs); end
                                                `FUNCTION_OP_MFHI       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d", "MFHI", op_rd);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_MFLO       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d", "MFLO", op_rd);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_MOVN       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "MOVN", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_MOVZ       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "MOVZ", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_MTHI       :   begin $sformat(instruction_string, "%-10s r%-2d", "MTHI", op_rs); end
                                                `FUNCTION_OP_MTLO       :   begin $sformat(instruction_string, "%-10s r%-2d", "MTLO", op_rs); end
                                                `FUNCTION_OP_MULT       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d", "MULT", op_rs, op_rt); end
                                                `FUNCTION_OP_MULTU      :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d", "MULTU", op_rs, op_rt); end
                                                `FUNCTION_OP_NOR        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "NOR", op_rd, op_rs, op_rt);
                                                                                  $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                            end
                                                `FUNCTION_OP_OR         :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "OR", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SLL        :   begin
                                                                                  if (instruction == 32'b0) begin
                                                                                      $sformat(instruction_string, "%-10s", "NOP");
                                                                                  end
                                                                                  else begin
                                                                                      $sformat(instruction_string, "%-10s r%-2d, r%-2d, %0d", "SLL", op_rd, op_rt, op_imm16[`MUSB_INSTR_SHAMT]);
                                                                                      if (~wb_instruction_flushed) begin
                                                                                          $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                      end
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SLLV       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SLLV", op_rd, op_rt, op_rs);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SLT        :   begin
                                                                                  $sformat(instruction_string, "%-10s t\tr%-2d, r%-2d, r%-2d", "SLT", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SLTU       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SLTU", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SRA        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, %0d  ", "SRA", op_rd, op_rt, op_imm16[`MUSB_INSTR_SHAMT]);
                                                                                  $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                            end
                                                `FUNCTION_OP_SRAV       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SRAV", op_rd, op_rt, op_rs);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SRL        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, %0d  ", "SRL", op_rd, op_rt, op_imm16[`MUSB_INSTR_SHAMT]);
                                                                                  $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                            end
                                                `FUNCTION_OP_SRLV       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SRLV", op_rd, op_rt, op_rs);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SUB        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SUB", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SUBU       :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "SUBU", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_SYSCALL    :   begin $sformat(instruction_string, "%-10s ", "SYSCALL"); end
                                                `FUNCTION_OP_TEQ        :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TEQ", op_rs, op_rt); end
                                                `FUNCTION_OP_TGE        :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TGE", op_rs, op_rt); end
                                                `FUNCTION_OP_TGEU       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TGEU", op_rs, op_rt); end
                                                `FUNCTION_OP_TLT        :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TLT", op_rs, op_rt); end
                                                `FUNCTION_OP_TLTU       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TLTU", op_rs, op_rt); end
                                                `FUNCTION_OP_TNE        :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "TNE", op_rs, op_rt); end
                                                `FUNCTION_OP_XOR        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d, r%-2d", "XOR", op_rd, op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                default                 :   begin $sformat(instruction_string, "Invalid R instruction"); end
                                            endcase
                                        end
                    `OP_TYPE_R2     :   begin
                                            case (op_function)
                                                `FUNCTION_OP_CLO        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "CLO", op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_CLZ        :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "CLZ", op_rs, op_rt);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `FUNCTION_OP_MADD       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "MADD", op_rs, op_rt); end
                                                `FUNCTION_OP_MADDU      :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "MADDU", op_rs, op_rt); end
                                                `FUNCTION_OP_MSUB       :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "MSUB", op_rs, op_rt); end
                                                `FUNCTION_OP_MSUBU      :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d  ", "MSUBU", op_rs, op_rt); end
                                                default                 :   begin $sformat(instruction_string, "Invalid R2 instruction"); end
                                            endcase
                                        end
                    `OP_TYPE_REGIMM :   begin
                                            case (op_rt)
                                                `RT_OP_BGEZ             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "BGEZ", op_rs,  $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                                                `RT_OP_BGEZAL           :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "BGEZAL", op_rs,  $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                                                `RT_OP_BLTZ             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "BLTZ", op_rs,  $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                                                `RT_OP_BLTZAL           :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "BLTZAL", op_rs,  $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                                                `RT_OP_TEQI             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TEQI", op_rs, op_imm16); end
                                                `RT_OP_TGEI             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TGEI", op_rs, op_imm16); end
                                                `RT_OP_TGEIU            :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TGEIU", op_rs, op_imm16); end
                                                `RT_OP_TLTI             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TLTI", op_rs, op_imm16); end
                                                `RT_OP_TLTIU            :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TLTIU", op_rs, op_imm16); end
                                                `RT_OP_TNEI             :   begin $sformat(instruction_string, "%-10s r%-2d, %0d", "TNEI", op_rs, op_imm16); end
                                                default                 :   begin $sformat(instruction_string, "Invalid REGIMM instruction"); end
                                            endcase
                                        end
                    `OP_TYPE_CP0    :   begin
                                            case (op_rs)
                                                `RS_OP_MFC              :   begin
                                                                                  $sformat(instruction_string, "%-10s r%-2d, r%-2d", "MFC0", op_rt, op_rd);
                                                                                  if (~wb_instruction_flushed) begin
                                                                                      $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                                                                  end
                                                                            end
                                                `RS_OP_MTC              :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d", "MTC0", op_rt, op_rd); end
                                                `RS_OP_ERET             :   begin $sformat(instruction_string, "%-10s", "ERET"); end
                                                default                 :   begin $sformat(instruction_string, "Invalid CP0 instruction"); end
                                            endcase
                                        end
                    `OP_ADDI        :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, %-0d", "ADDI", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_ADDIU       :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, %-0d", "ADDIU", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_ANDI        :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, 0x%-h", "ANDI", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_BEQ         :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d, 0x%-0h", "BEQ", op_rt, op_rs, $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                    `OP_BGTZ        :   begin $sformat(instruction_string, "%-10s r%-2d, 0x%-0h", "BGTZ", op_rs, $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                    `OP_BLEZ        :   begin $sformat(instruction_string, "%-10s r%-2d, 0x%-0h", "BLEZ", op_rs, $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                    `OP_BNE         :   begin $sformat(instruction_string, "%-10s r%-2d, r%-2d, 0x%-0h", "BNE", op_rt, op_rs, $signed(id_pc) + $signed({op_imm16, 2'b0}) + 4); end
                    `OP_J           :   begin $sformat(instruction_string, "%-10s 0x%-h ", "J", {id_pc[31:28], op_imm26, 2'b0}); end
                    `OP_JAL         :   begin $sformat(instruction_string, "%-10s 0x%-h ", "JAL", {id_pc[31:28], op_imm26, 2'b0}); end
                    `OP_LB          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LB", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_LBU         :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LBU", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_LH          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LH", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_LHU         :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LHU", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_LL          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LL", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_LUI         :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %-5d", "LUI", op_rt, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_LW          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "LW", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= mem[0x%h] = 0x%h (%0d)", wb_register, mem_address, wb_data, wb_data);
                                              end
                                        end
                    `OP_ORI         :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, 0x%0h", "ORI", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_SB          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "SB", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "mem[0x%h] <= 0x%2h", mem_address, mem_store_data & 32'hFF);
                                              end
                                        end
                    `OP_SC          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "SC", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "mem[0x%h] <= 0x%h (%0d)", mem_address, mem_store_data, mem_store_data);
                                              end
                                        end
                    `OP_SH          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "SH", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "mem[0x%h] <= 0x%4h", mem_address, mem_store_data & 32'hFFFF);
                                              end
                                        end
                    `OP_SLTI        :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, %-0d", "SLTI", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_SLTIU       :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, %-0d", "SLTIU", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    `OP_SW          :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, %0d(r%-2d)", "SW", op_rt, op_imm16, op_rs);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "mem[0x%h] <= 0x%h (%0d)", mem_address, mem_store_data, mem_store_data);
                                              end
                                        end
                    `OP_XORI        :   begin
                                              $sformat(instruction_string, "%-10s r%-2d, r%-2d, 0x%0h","XORI", op_rt, op_rs, op_imm16);
                                              if (~wb_instruction_flushed) begin
                                                $sformat(wb_register_string, "r%-2d <= 0x%h ( %-d ) | WE = %0d", wb_register, wb_data, wb_data, wb_we);
                                              end
                                        end
                    default         :   begin $sformat(instruction_string, "Invalid instruction"); end
                endcase
                // store info to buffer
                $sformat(trace, "| %9d | 0x%h: | 0x%h  | %-30s | %-48s | %-7s |", $time - 1, id_pc, instruction, instruction_string, wb_register_string, (wb_instruction_flushed) ? "yes" : " "); // time - 1 (delay)
                trace_buffer[trace_fill_counter] = trace;
                trace_fill_counter = trace_fill_counter + 1;
            end
        end
    endtask
    // print stats
    task print_stats;
        integer index;
        begin
            $display();
            $display("INFO-MONITOR:\tHalt signal assertion (Time: %0d ns).", $time - 1);
            $display("INFO-MONITOR:\tPrinting program trace, performing the memory dump, and the register dump.\n");
            //$display("-----------------------------------------------------------------------------------------------------------------------------");
            //$display("Program trace:");
            $display("---------------------------------------------------------------------------------------------------------------------------------------");
            $display("| %-9s | %-11s | %-11s | %-30s | %-48s | %-s |", "Time (ns)", "PC", "Instruction", "Assembler", "Result", "Flushed");
            $display("---------------------------------------------------------------------------------------------------------------------------------------");
            for(index = 0; index < trace_fill_counter; index = index + 1) begin
                $display("%-0s", trace_buffer[index]);
            end
            $display("---------------------------------------------------------------------------------------------------------------------------------------");
            $display();
            //dump_memory();
            //print_gpr();
        end
    endtask
    // Initial
    initial begin
        trace_fill_counter = 0;
        cause_reg          <= 0;
        clk_core           <= 1;
        clk_bus            <= 1;
        rst                <= 1;
    end
    // clock
    always  begin
        #(`cycle/2) clk_core <= !clk_core;      // Core clock
    end
    always  begin
        #(`cycle/4) clk_bus <= !clk_bus;        // Bus clock = 2*Core clock
    end
    // Decode instruction @ WB stage (finished instructions)
    always @(posedge clk_core) begin
        #1
        if((wb_exception_pc != 32'b0 | wb_instruction != 32'b0) & ~wb_instruction_stalled )begin       // ignore first nops in the pipeline & bubbles
            decode_instruction(wb_exception_pc,
                               wb_instruction,
                               wb_gpr_wa,
                               wb_gpr_wd,
                               wb_gpr_we,
                               wb_mem_address,
                               wb_mem_store_data
                               );
        end
    end
    // Log exceptions
    always @(posedge clk_core) begin
        if(if_exception_ready) begin
            $write("INFO-MONITOR:\tIF exception. ");
            #1
            get_cp0_reg(13, cause_reg);
            decode_cause(cause_reg);
            $write("Cause: %-0s. Time: %0d ns\n", cause_string, $time - 1);
        end
        else if(id_exception_ready) begin
            #1
            $write("INFO-MONITOR:\tID exception. ");
            get_cp0_reg(13, cause_reg);
            decode_cause(cause_reg);
            $write("Cause: %-0s. Time: %0d ns\n", cause_string, $time - 1);
        end
        else if(ex_exception_ready) begin
            $write("INFO-MONITOR:\tEX exception. ");
            #1
            get_cp0_reg(13, cause_reg);
            decode_cause(cause_reg);
            $write("Cause: %-0s. Time: %0d ns\n", cause_string, $time - 1);
        end
        else if(mem_exception_ready) begin
            $write("INFO-MONITOR:\tMEM exception. ");
            #1
            get_cp0_reg(13, cause_reg);
            decode_cause(cause_reg);
            $write("Cause: %-0s. Time: %0d ns\n", cause_string, $time - 1);
        end
    end
    // pipeline
    always @(posedge clk_core) begin
        wb_exception_pc   <= (rst) ? 32'b0 : ((wb_stall) ? wb_exception_pc   : mem_exception_pc);
        ex_instruction    <= (rst) ? 1'b0  : ((ex_stall)  ? ex_instruction   : id_instruction);
        mem_instruction   <= (rst) ? 1'b0  : ((mem_stall) ? mem_instruction  : ex_instruction);
        wb_instruction    <= (rst) ? 32'b0 : ((wb_stall)  ? wb_instruction   : mem_instruction);
        wb_mem_address    <= (rst) ? 32'b0 : ((wb_stall) ? wb_mem_address    : mem_address);
        wb_mem_store_data <= (rst) ? 32'b0 : ((wb_stall) ? wb_mem_store_data : mem_data);
        id_instruction_stalled  <= (rst) ? 1'b0 : ((ex_stall)  ? ex_instruction_stalled  : if_stall);
        id_instruction_flushed  <= (rst) ? 1'b0 : ((ex_stall)  ? ex_instruction_flushed  : if_flush);
        ex_instruction_stalled  <= (rst) ? 1'b0 : ((ex_stall)  ? ex_instruction_stalled  : id_instruction_stalled  | id_stall);
        ex_instruction_flushed  <= (rst) ? 1'b0 : ((ex_stall)  ? ex_instruction_flushed  : id_instruction_flushed  | id_flush);
        mem_instruction_stalled <= (rst) ? 1'b0 : ((mem_stall) ? mem_instruction_stalled : ex_instruction_stalled  | ex_stall);
        mem_instruction_flushed <= (rst) ? 1'b0 : ((mem_stall) ? mem_instruction_flushed : ex_instruction_flushed  | ex_flush);
        wb_instruction_stalled  <= (rst) ? 1'b0 : ((wb_stall)  ? wb_instruction_stalled  : mem_instruction_stalled | mem_stall);
        wb_instruction_flushed  <= (rst) ? 1'b0 : ((wb_stall)  ? wb_instruction_flushed  : mem_instruction_flushed | mem_flush);
    end
    // Start Simulation
    initial begin
        $display("\n\n");
        $display("--------------------------------------------------------------------------");
        $display("INFO-MONITOR:\tTesting the MIPS Core: BEGIN.");
        $display("--------------------------------------------------------------------------");
        $display();
        // dump the wave file
        `ifdef NODUMP
            $display("INFO-MONITOR:\tDump of variables: DISABLED.");
        `else
            $display("INFO-MONITOR:\tDump of variables: ENABLED.");
            $dumpfile("tb_core.vcd");
            if(CORE=="core") begin
                $dumpvars(0, tb_core);      // check this
            end
            else begin
                $dumpvars(0, tb_soc);      // check this
            end
        `endif
        // Reset
        $display("INFO-MONITOR:\tReset assertion (Time: %0d ns).", $time);
        if(CORE=="core") begin
            #(5*`cycle - 5)
            rst <= 0;
        end
        else begin
            #(2000*`cycle - 5)
            rst <= 0;
        end
        $display("INFO-MONITOR:\tReset deassertion (Time: %0d ns).", $time);
        // wait until end
        `ifdef TIMEOUT
            $display("INFO-MONITOR:\tTimeout value: %d cycles", `TIMEOUT);
            $display("INFO-MONITOR:\tCPU (core) frequency: %d MHz", 1000/`cycle);
            $display();
            #(`TIMEOUT*`cycle)
        `else
            $display("INFO-MONITOR:\tTimeout value: %d cycles", `TIMEOUT_DEFAULT);
            $display("INFO-MONITOR:\tCPU (core) frequency: %d MHz", 1000/`cycle);
            $display();
            #(`TIMEOUT_DEFAULT*`cycle)
        `endif
        // Timeout. Abort
        print_stats();
        $display("--------------------------------------------------------------------------");
        $display("INFO-MONITOR:\tTesting the MIPS Core: Aborted. Timeout after %0d cycles.", $time/`cycle);
        $display("--------------------------------------------------------------------------");
        $display("\n\n");
        $finish;
    end
    // Exit 0: Stop Simulation
    always @(negedge clk_core) begin
        if(halt) begin
            #1
            print_stats();
            $display("--------------------------------------------------------------------------");
            $display("INFO-MONITOR:\tTesting the MIPS Core: Finished after %0d cycles.", $time/`cycle);
            $display("--------------------------------------------------------------------------");
            $display("\n\n");
            $finish;
        end
    end
endmodule