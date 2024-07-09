module outputs)
    wire            dmem_request_stall;         // From LSU of musb_load_store_unit.v
    wire [4:0]      ex_alu_operation;           // From EX_register of musb_idex_register.v
    wire [1:0]      ex_alu_port_a_select;       // From EX_register of musb_idex_register.v
    wire [1:0]      ex_alu_port_b_select;       // From EX_register of musb_idex_register.v
    wire [31:0]     ex_data_rs;                 // From EX_register of musb_idex_register.v
    wire [31:0]     ex_data_rt;                 // From EX_register of musb_idex_register.v
    wire [1:0]      ex_gpr_wa_select;           // From EX_register of musb_idex_register.v
    wire            ex_gpr_we;                  // From EX_register of musb_idex_register.v
    wire            ex_mem_data_sign_ext;       // From EX_register of musb_idex_register.v
    wire            ex_mem_to_gpr_select;       // From EX_register of musb_idex_register.v
    wire            ex_mem_write;               // From EX_register of musb_idex_register.v
    wire [4:0]      ex_rs;                      // From EX_register of musb_idex_register.v
    wire [4:0]      ex_rt;                      // From EX_register of musb_idex_register.v
    wire [16:0]     ex_sign_imm16;              // From EX_register of musb_idex_register.v
    wire            ex_stall;                   // From HU of musb_hazard_unit.v
    wire            ex_stall_unit;              // From HU of musb_hazard_unit.v
    wire            exc_address_if;             // From LSU of musb_load_store_unit.v
    wire            exc_address_l_mem;          // From LSU of musb_load_store_unit.v
    wire            exc_address_s_mem;          // From LSU of musb_load_store_unit.v
    wire [1:0]      forward_ex_rs;              // From HU of musb_hazard_unit.v
    wire [1:0]      forward_ex_rt;              // From HU of musb_hazard_unit.v
    wire [1:0]      forward_id_rs;              // From HU of musb_hazard_unit.v
    wire [1:0]      forward_id_rt;              // From HU of musb_hazard_unit.v
    wire [4:0]      id_alu_operation;           // From CU of musb_control_unit.v
    wire [1:0]      id_alu_port_a_select;       // From CU of musb_control_unit.v
    wire [1:0]      id_alu_port_b_select;       // From CU of musb_control_unit.v
    wire            id_branch;                  // From CU of musb_control_unit.v
    wire [1:0]      id_gpr_wa_select;           // From CU of musb_control_unit.v
    wire            id_gpr_we;                  // From CU of musb_control_unit.v
    wire [31:0]     id_instruction;             // From ID_register of musb_ifid_register.v
    wire            id_jump;                    // From CU of musb_control_unit.v
    wire            id_mem_byte;                // From CU of musb_control_unit.v
    wire            id_mem_data_sign_ext;       // From CU of musb_control_unit.v
    wire            id_mem_halfword;            // From CU of musb_control_unit.v
    wire            id_mem_to_gpr_select;       // From CU of musb_control_unit.v
    wire            id_mem_write;               // From CU of musb_control_unit.v
    wire [31:0]     id_pc_add4;                 // From ID_register of musb_ifid_register.v
    wire [31:0]     if_pc_add4;                 // From ID_register of musb_ifid_register.v
    wire            id_stall;                   // From HU of musb_hazard_unit.v
    wire            exc_syscall;                // From CU of musb_control_unit.v
    wire            if_stall;                   // From HU of musb_hazard_unit.v
    wire            imem_request_stall;         // From LSU of musb_load_store_unit.v
    wire [31:0]     mem_alu_result;             // From MEM_register of musb_exmem_register.v
    wire [4:0]      mem_gpr_wa;                 // From MEM_register of musb_exmem_register.v
    wire            mem_gpr_we;                 // From MEM_register of musb_exmem_register.v
    wire            mem_mem_data_sign_ext;      // From MEM_register of musb_exmem_register.v
    wire [31:0]     mem_mem_store_data;         // From MEM_register of musb_exmem_register.v
    wire            mem_mem_to_gpr_select;      // From MEM_register of musb_exmem_register.v
    wire            mem_mem_write;              // From MEM_register of musb_exmem_register.v
    wire            mem_stall;                  // From HU of musb_hazard_unit.v
    wire [31:0]     pc_branch_address;          // From BU of musb_branch_unit.v
    wire [31:0]     if_pc;                      // From IF_register of musb_pc_register.v
    wire [31:0]     if_new_pc;                  // From IF_register of musb_pc_register.v
    wire            take_branch;                // From BU of musb_branch_unit.v
    wire [31:0]     wb_alu_data;                // From WB_register of musb_memwb_register.v
    wire [4:0]      wb_gpr_wa;                  // From WB_register of musb_memwb_register.v
    wire            wb_gpr_we;                  // From WB_register of musb_memwb_register.v
    wire            wb_mem_to_gpr_select;       // From WB_register of musb_memwb_register.v
    wire [31:0]     wb_read_data;               // From WB_register of musb_memwb_register.v
    wire            wb_stall;                   // From HU of musb_hazard_unit.v
    // End of automatics
    wire    [5:0]   opcode;
    wire    [4:0]   op_rs;
    wire    [4:0]   op_rt;
    wire    [4:0]   op_rd;
    wire    [5:0]   op_function;
    wire    [15:0]  op_imm16;
    wire    [25:0]  op_imm26;
    wire    [2:0]   op_cp0_select;
    wire    [31:0]  if_instruction;
    wire    [31:0]  id_gpr_rs;
    wire    [31:0]  id_gpr_rt;
    wire    [31:0]  wb_gpr_wd;
    wire    [31:0]  id_forward_rs;
    wire    [31:0]  id_forward_rt;
    wire    [31:0]  ex_forward_rs;
    wire    [31:0]  ex_forward_rt;
    wire    [31:0]  ex_alu_result;
    wire            ex_request_stall;
    wire    [31:0]  ex_pc_add4;
    wire    [31:0]  ex_alu_port_a;
    wire    [31:0]  ex_alu_port_b;
    wire    [4:0]   ex_gpr_wa;
    wire    [31:0]  mem_read_data;
    wire            halt_0;
    reg             halt_1;
    reg             halt_2;
    reg             halt_3;
    reg             rst;
    // new signals
    wire            id_mfc0;
    wire            id_mtc0;
    wire            id_eret;
    wire            id_cp1_instruction;
    wire            id_cp2_instruction;
    wire            id_cp3_instruction;
    wire            exc_overflow;
    wire            exc_trap;
    wire            exc_breakpoint;
    wire            exc_reserved;
    wire    [31:0]  id_exception_pc;
    wire    [31:0]  ex_exception_pc;
    wire    [31:0]  mem_exception_pc;
    wire            id_exception_source;
    wire            ex_exception_source;
    wire            mem_exception_source;
    wire            id_is_flushed;
    wire            if_is_bds;
    wire            id_is_bds;
    wire            ex_is_bds;
    wire            mem_is_bds;
    wire    [31:0]  cp0_data_out;
    wire            id_kernel_mode;
    wire            ex_kernel_mode;
    wire            mem_kernel_mode;
    wire            if_exception_stall;
    wire            id_exception_stall;
    wire            ex_exception_stall;
    wire            mem_exception_stall;
    wire            if_exception_flush;
    wire            id_exception_flush;
    wire            ex_exception_flush;
    wire            mem_exception_flush;
    wire            exception_pc_select;
    wire    [31:0]  pc_exception;
    wire    [31:0]  pc_pre_exc_selection;
    wire            id_llsc;
    wire            ex_llsc;
    wire            mem_llsc;
    wire            id_movn;
    wire            id_movz;
    wire            ex_movn;
    wire            ex_movz;
    wire            ex_b_is_zero;
    wire            id_trap;
    wire            ex_trap;
    wire            id_trap_condition;
    wire            ex_trap_condition;
    wire            mem_trap;
    wire            mem_trap_condition;
    wire            id_id_exception_source;
    wire            id_ex_exception_source;
    wire            id_mem_exception_source;
    wire            ex_ex_exception_source;
    wire            ex_mem_exception_source;
    wire            mem_mem_exception_source;
    wire            id_imm_sign_ext;
    wire    [31:0]  ex_cp0_data;
    wire            exception_ready;
    // assignments
    assign opcode               = id_instruction[`MUSB_INSTR_OPCODE];
    assign op_rs                = id_instruction[`MUSB_INSTR_RS];
    assign op_rt                = id_instruction[`MUSB_INSTR_RT];
    assign op_rd                = id_instruction[`MUSB_INSTR_RD];
    assign op_function          = id_instruction[`MUSB_INSTR_FUNCT];
    assign op_imm16             = id_instruction[`MUSB_INSTR_IMM16];
    assign op_imm26             = id_instruction[`MUSB_INSTR_IMM26];
    assign op_cp0_select        = id_instruction[`MUSB_INSTR_CP0_SEL];
    assign id_exception_source  = id_id_exception_source | id_ex_exception_source | id_mem_exception_source;
    assign ex_exception_source  = ex_ex_exception_source | ex_mem_exception_source;
    assign mem_exception_source = mem_mem_exception_source;
    assign if_is_bds            = take_branch;
    assign exc_trap             = mem_trap & (mem_trap_condition ^ (mem_alu_result == 32'b0));
    always @(posedge clk) begin
        rst <= rst_i;
    end
    // UPDATE: Getting the halt signal from the CP0.
    always @(posedge clk) begin
        if (rst) begin
            halt_1 <= 1'b0;
            halt_2 <= 1'b0;
            halt_3 <= 1'b0;
        end
        else begin
            halt_1 <= halt_0;
            halt_2 <= halt_1;
            halt_3 <= halt_2;
        end
    end
    assign halted = halt_3;
    // IF stage (A)
    musb_mux_2_1 pc_source_standard(
        .in0    ( if_pc_add4[31:0]                    ),
        .in1    ( pc_branch_address[31:0]             ),
        .select ( (take_branch & id_branch) | id_jump ),
        .out    ( pc_pre_exc_selection[31:0]          )
        );
    musb_mux_2_1 pc_source_exception(
        .in0    ( pc_pre_exc_selection[31:0] ),
        .in1    ( pc_exception[31:0]         ),
        .select ( exception_pc_select        ),
        .out    ( if_new_pc[31:0]                   )
        );
    musb_pc_register AIF_register(
        .clk        ( clk                          ),
        .rst        ( rst                          ),
        .if_new_pc  ( if_new_pc[31:0]              ),
        .if_stall   ( if_stall | id_stall | halt_0 ),
        .if_pc      ( if_pc[31:0]                  )
        );
    // IF stage (B)
    musb_add pc_add4(
        .add_port_a  ( if_pc[31:0]      ),
        .add_port_b  ( 32'd4            ),
        .add_result  ( if_pc_add4[31:0] )
        );
    musb_ifid_register IFID_register(/*AUTOINST*/
        // Outputs
        .id_instruction     ( id_instruction[31:0]  ),
        .id_pc_add4         ( id_pc_add4[31:0]      ),
        .id_exception_pc    ( id_exception_pc[31:0] ),
        .id_is_bds          ( id_is_bds             ),
        .id_is_flushed      ( id_is_flushed         ),
        // Inputs
        .clk                ( clk                   ),
        .rst                ( rst                   ),
        .if_instruction     ( if_instruction[31:0]  ),
        .if_pc_add4         ( if_pc_add4[31:0]      ),
        .if_pc              ( if_pc[31:0]           ),
        .if_is_bds          ( if_is_bds             ),
        .if_flush           ( if_exception_flush    ),
        .if_stall           ( if_stall              ),
        .id_stall           ( id_stall              )
        );
    // ID stage
    musb_reg_file GPR(/*AUTOINST*/
        // Outputs
        .gpr_rd_a   ( id_gpr_rs[31:0] ),
        .gpr_rd_b   ( id_gpr_rt[31:0] ),
        // Inputs
        .clk        ( clk             ),
        .gpr_ra_a   ( op_rs[4:0]      ),
        .gpr_ra_b   ( op_rt[4:0]      ),
        .gpr_wa     ( wb_gpr_wa[4:0]  ),
        .gpr_wd     ( wb_gpr_wd[31:0] ),
        .gpr_we     ( wb_gpr_we       )
        );
    musb_branch_unit musb_branch_unit0(/*AUTOINST*/
        // Outputs
        .pc_branch_address  ( pc_branch_address[31:0] ),
        .take_branch        ( take_branch             ),
        // Inputs
        .opcode             ( opcode[5:0]             ),
        .id_pc_add4         ( id_pc_add4[31:0]        ),
        .id_data_rs         ( id_forward_rs[31:0]     ),
        .id_data_rt         ( id_forward_rt[31:0]     ),
        .op_imm26           ( op_imm26[25:0]          )
        );
    musb_control_unit #(
        .ENABLE_HW_MULT  ( ENABLE_HW_MULT  ),
        .ENABLE_HW_DIV   ( ENABLE_HW_DIV   ),
        .ENABLE_HW_CLO_Z ( ENABLE_HW_CLO_Z )
        )
        musb_control_unit0(/*AUTOINST*/
        // Outputs
        .id_imm_sign_ext            ( id_imm_sign_ext           ),
        .id_movn                    ( id_movn                   ),
        .id_movz                    ( id_movz                   ),
        .id_llsc                    ( id_llsc                   ),
        .id_syscall                 ( exc_syscall               ),
        .id_breakpoint              ( exc_breakpoint            ),
        .id_reserved                ( exc_reserved              ),
        .id_mfc0                    ( id_mfc0                   ),
        .id_mtc0                    ( id_mtc0                   ),
        .id_eret                    ( id_eret                   ),
        .id_cp1                     ( id_cp1_instruction        ),
        .id_cp2                     ( id_cp2_instruction        ),
        .id_cp3                     ( id_cp3_instruction        ),
        .id_id_exception_source     ( id_id_exception_source    ),
        .id_ex_exception_source     ( id_ex_exception_source    ),
        .id_mem_exception_source    ( id_mem_exception_source   ),
        .id_trap                    ( id_trap                   ),
        .id_trap_condition          ( id_trap_condition         ),
        .id_gpr_we                  ( id_gpr_we                 ),
        .id_mem_to_gpr_select       ( id_mem_to_gpr_select      ),
        .id_alu_operation           ( id_alu_operation[4:0]     ),
        .id_alu_port_a_select       ( id_alu_port_a_select[1:0] ),
        .id_alu_port_b_select       ( id_alu_port_b_select[1:0] ),
        .id_gpr_wa_select           ( id_gpr_wa_select[1:0]     ),
        .id_jump                    ( id_jump                   ),
        .id_branch                  ( id_branch                 ),
        .id_mem_write               ( id_mem_write              ),
        .id_mem_byte                ( id_mem_byte               ),
        .id_mem_halfword            ( id_mem_halfword           ),
        .id_mem_data_sign_ext       ( id_mem_data_sign_ext      ),
        // Inputs
        .opcode                     ( opcode[5:0]               ),
        .op_function                ( op_function[5:0]          ),
        .op_rt                      ( op_rt                     ),
        .op_rs                      ( op_rs                     )
        );
    musb_mux_4_1 ForwardRsID(
        .in0    ( id_gpr_rs[31:0]      ),
        .in1    ( mem_alu_result[31:0] ),
        .in2    ( wb_gpr_wd[31:0]      ),
        .in3    ( 32'hDEAD_BEEF        ),
        .select ( forward_id_rs[1:0]   ),
        .out    ( id_forward_rs[31:0]  )
        );
    musb_mux_4_1 ForwardRtID(
        .in0    ( id_gpr_rt[31:0]      ),
        .in1    ( mem_alu_result[31:0] ),
        .in2    ( wb_gpr_wd[31:0]      ),
        .in3    ( 32'hDEAD_C0DE        ),
        .select ( forward_id_rt[1:0]   ),
        .out    ( id_forward_rt[31:0]  )
        );
    musb_idex_register IDEX_register(/*AUTOINST*/
        // Outputs
        .ex_alu_operation           ( ex_alu_operation[4:0]     ),
        .ex_data_rs                 ( ex_data_rs[31:0]          ),
        .ex_data_rt                 ( ex_data_rt[31:0]          ),
        .ex_gpr_we                  ( ex_gpr_we                 ),
        .ex_mem_to_gpr_select       ( ex_mem_to_gpr_select      ),
        .ex_mem_write               ( ex_mem_write              ),
        .ex_alu_port_a_select       ( ex_alu_port_a_select[1:0] ),
        .ex_alu_port_b_select       ( ex_alu_port_b_select[1:0] ),
        .ex_gpr_wa_select           ( ex_gpr_wa_select[1:0]     ),
        .ex_mem_byte                ( ex_mem_byte               ),
        .ex_mem_halfword            ( ex_mem_halfword           ),
        .ex_mem_data_sign_ext       ( ex_mem_data_sign_ext      ),
        .ex_rs                      ( ex_rs[4:0]                ),
        .ex_rt                      ( ex_rt[4:0]                ),
        .ex_sign_imm16              ( ex_sign_imm16[16:0]       ),
        .ex_cp0_data                ( ex_cp0_data[31:0]         ),
        .ex_exception_pc            ( ex_exception_pc[31:0]     ),
        .ex_movn                    ( ex_movn                   ),
        .ex_movz                    ( ex_movz                   ),
        .ex_llsc                    ( ex_llsc                   ),
        .ex_kernel_mode             ( ex_kernel_mode            ),
        .ex_is_bds                  ( ex_is_bds                 ),
        .ex_trap                    ( ex_trap                   ),
        .ex_trap_condition          ( ex_trap_condition         ),
        .ex_ex_exception_source     ( ex_ex_exception_source    ),
        .ex_mem_exception_source    ( ex_mem_exception_source   ),
        // Inputs
        .clk                        ( clk                       ),
        .rst                        ( rst                       ),
        .id_alu_operation           ( id_alu_operation[4:0]     ),
        .id_data_rs                 ( id_forward_rs[31:0]       ),
        .id_data_rt                 ( id_forward_rt[31:0]       ),
        .id_gpr_we                  ( id_gpr_we                 ),
        .id_mem_to_gpr_select       ( id_mem_to_gpr_select      ),
        .id_mem_write               ( id_mem_write              ),
        .id_alu_port_a_select       ( id_alu_port_a_select[1:0] ),
        .id_alu_port_b_select       ( id_alu_port_b_select[1:0] ),
        .id_gpr_wa_select           ( id_gpr_wa_select[1:0]     ),
        .id_mem_byte                ( id_mem_byte               ),
        .id_mem_halfword            ( id_mem_halfword           ),
        .id_mem_data_sign_ext       ( id_mem_data_sign_ext      ),
        .id_rs                      ( op_rs[4:0]                ),
        .id_rt                      ( op_rt[4:0]                ),
        .id_imm_sign_ext            ( id_imm_sign_ext           ),
        .id_sign_imm16              ( op_imm16[15:0]            ),
        .id_cp0_data                ( cp0_data_out[31:0]        ),
        .id_exception_pc            ( id_exception_pc[31:0]     ),
        .id_movn                    ( id_movn                   ),
        .id_movz                    ( id_movz                   ),
        .id_llsc                    ( id_llsc                   ),
        .id_kernel_mode             ( id_kernel_mode            ),
        .id_is_bds                  ( id_is_bds                 ),
        .id_trap                    ( id_trap                   ),
        .id_trap_condition          ( id_trap_condition         ),
        .id_ex_exception_source     ( id_ex_exception_source    ),
        .id_mem_exception_source    ( id_mem_exception_source   ),
        .id_flush                   ( id_exception_flush        ),
        .id_stall                   ( id_stall                  ),
        .ex_stall                   ( ex_stall                  )
        );
    // EX stage
   musb_alu #(
        .ENABLE_HW_MULT  ( ENABLE_HW_MULT  ),
        .ENABLE_HW_DIV   ( ENABLE_HW_DIV   ),
        .ENABLE_HW_CLO_Z ( ENABLE_HW_CLO_Z )
        )
        musb_alu0(
        .clk                ( clk                   ),
        .rst                ( rst                   ),
        .ex_alu_port_a      ( ex_alu_port_a[31:0]   ),
        .ex_alu_port_b      ( ex_alu_port_b[31:0]   ),
        .ex_alu_operation   ( ex_alu_operation[4:0] ),
        .ex_stall           ( ex_stall_unit         ),
        .ex_flush           ( ex_exception_flush    ),
        .ex_request_stall   ( ex_request_stall      ),
        .ex_alu_result      ( ex_alu_result[31:0]   ),
        .ex_b_is_zero       ( ex_b_is_zero          ),
        .exc_overflow       ( exc_overflow          )
        );
    musb_mux_4_1 ForwardRsEX(
        .in0    ( ex_data_rs[31:0]     ),
        .in1    ( mem_alu_result[31:0] ),
        .in2    ( wb_gpr_wd[31:0]      ),
        .in3    ( 32'hDEAD_BEEF        ),
        .select ( forward_ex_rs[1:0]   ),
        .out    ( ex_forward_rs[31:0]  )
        );
    musb_mux_4_1 ForwardRtEX(
        .in0    ( ex_data_rt[31:0]     ),
        .in1    ( mem_alu_result[31:0] ),
        .in2    ( wb_gpr_wd[31:0]      ),
        .in3    ( 32'hDEAD_C0DE        ),
        .select ( forward_ex_rt[1:0]   ),
        .out    ( ex_forward_rt[31:0]  )
        );
    musb_mux_4_1 ALUPortA(
        .in0    ( ex_forward_rs[31:0]          ),
        .in1    ( {27'b0, ex_sign_imm16[10:6]} ),   // shamnt
        .in2    ( 32'd8                        ),   // PC + 8
        .in3    ( 32'd16                       ),
        .select ( ex_alu_port_a_select[1:0]    ),
        .out    ( ex_alu_port_a[31:0]          )
        );
    musb_mux_4_1 ALUPortB(
        .in0    ( ex_forward_rt[31:0]                              ),
        .in1    ( { {15{ex_sign_imm16[16]}}, ex_sign_imm16[16:0] } ),
        .in2    ( ex_exception_pc[31:0]                            ),
        .in3    ( ex_cp0_data[31:0]                                ),
        .select ( ex_alu_port_b_select[1:0]                        ),
        .out    ( ex_alu_port_b[31:0]                              )
        );
    musb_mux_4_1 #(5) MuxRegWA(
        .in0    ( ex_sign_imm16[15:11]  ),  // Rd
        .in1    ( ex_rt[4:0]            ),
        .in2    ( 5'b11111              ),  // $31 = Ra
        .in3    ( 5'b00000              ),  // NOP
        .select ( ex_gpr_wa_select[1:0] ),
        .out    ( ex_gpr_wa[4:0]        )
        );
    musb_exmem_register EXMEM_register(/*AUTOINST*/
        // Outputs
        .mem_alu_result             ( mem_alu_result[31:0]     ),
        .mem_mem_store_data         ( mem_mem_store_data[31:0] ),
        .mem_gpr_wa                 ( mem_gpr_wa[4:0]          ),
        .mem_gpr_we                 ( mem_gpr_we               ),
        .mem_mem_to_gpr_select      ( mem_mem_to_gpr_select    ),
        .mem_mem_write              ( mem_mem_write            ),
        .mem_mem_byte               ( mem_mem_byte             ),
        .mem_mem_halfword           ( mem_mem_halfword         ),
        .mem_mem_data_sign_ext      ( mem_mem_data_sign_ext    ),
        .mem_exception_pc           ( mem_exception_pc         ),
        .mem_llsc                   ( mem_llsc                 ),
        .mem_kernel_mode            ( mem_kernel_mode          ),
        .mem_is_bds                 ( mem_is_bds               ),
        .mem_trap                   ( mem_trap                 ),
        .mem_trap_condition         ( mem_trap_condition       ),
        .mem_mem_exception_source   ( mem_mem_exception_source ),
        // Inputs
        .clk                        ( clk                      ),
        .rst                        ( rst                      ),
        .ex_alu_result              ( ex_alu_result[31:0]      ),
        .ex_mem_store_data          ( ex_forward_rt[31:0]      ),
        .ex_gpr_wa                  ( ex_gpr_wa[4:0]           ),
        .ex_gpr_we                  ( ex_gpr_we                ),
        .ex_mem_to_gpr_select       ( ex_mem_to_gpr_select     ),
        .ex_mem_write               ( ex_mem_write             ),
        .ex_mem_byte                ( ex_mem_byte              ),
        .ex_mem_halfword            ( ex_mem_halfword          ),
        .ex_mem_data_sign_ext       ( ex_mem_data_sign_ext     ),
        .ex_exception_pc            ( ex_exception_pc[31:0]    ),
        .ex_movn                    ( ex_movn                  ),
        .ex_movz                    ( ex_movz                  ),
        .ex_b_is_zero               ( ex_b_is_zero             ),
        .ex_llsc                    ( ex_llsc                  ),
        .ex_kernel_mode             ( ex_kernel_mode           ),
        .ex_is_bds                  ( ex_is_bds                ),
        .ex_trap                    ( ex_trap                  ),
        .ex_trap_condition          ( ex_trap_condition        ),
        .ex_mem_exception_source    ( ex_mem_exception_source  ),
        .ex_flush                   ( ex_exception_flush       ),
        .ex_stall                   ( ex_stall                 ),
        .mem_stall                  ( mem_stall                )
        );
    // MEM stage
    musb_memwb_register MEMWB_register(/*AUTOINST*/
        // Outputs
        .wb_read_data           ( wb_read_data[31:0]    ),
        .wb_alu_data            ( wb_alu_data[31:0]     ),
        .wb_gpr_wa              ( wb_gpr_wa[4:0]        ),
        .wb_mem_to_gpr_select   ( wb_mem_to_gpr_select  ),
        .wb_gpr_we              ( wb_gpr_we             ),
        // Inputs
        .clk                    ( clk                   ),
        .rst                    ( rst                   ),
        .mem_read_data          ( mem_read_data[31:0]   ),
        .mem_alu_data           ( mem_alu_result[31:0]  ),
        .mem_gpr_wa             ( mem_gpr_wa[4:0]       ),
        .mem_mem_to_gpr_select  ( mem_mem_to_gpr_select ),
        .mem_gpr_we             ( mem_gpr_we            ),
        .mem_flush              ( mem_exception_flush   ),
        .mem_stall              ( mem_stall             ),
        .wb_stall               ( wb_stall              )
        );
    // WB stage
     musb_mux_2_1 MuxMemALU(
        .in0    ( wb_alu_data[31:0]    ),
        .in1    ( wb_read_data[31:0]   ),
        .select ( wb_mem_to_gpr_select ),
        .out    ( wb_gpr_wd[31:0]      )
        );
    // HDU, LSU and CP0
    musb_hazard_unit musb_hazard_unit0(/*AUTOINST*/
        // Outputs
        .forward_id_rs      ( forward_id_rs[1:0]    ),
        .forward_id_rt      ( forward_id_rt[1:0]    ),
        .forward_ex_rs      ( forward_ex_rs[1:0]    ),
        .forward_ex_rt      ( forward_ex_rt[1:0]    ),
        .if_stall           ( if_stall              ),
        .id_stall           ( id_stall              ),
        .ex_stall           ( ex_stall              ),
        .ex_stall_unit      ( ex_stall_unit         ),
        .mem_stall          ( mem_stall             ),
        .wb_stall           ( wb_stall              ),
        // Inputs
        .id_rs              ( op_rs[4:0]            ),
        .id_rt              ( op_rt[4:0]            ),
        .ex_rs              ( ex_rs[4:0]            ),
        .ex_rt              ( ex_rt[4:0]            ),
        .id_mtc0            ( id_mtc0               ),
        .ex_gpr_wa          ( ex_gpr_wa[4:0]        ),
        .mem_gpr_wa         ( mem_gpr_wa[4:0]       ),
        .wb_gpr_wa          ( wb_gpr_wa[4:0]        ),
        .id_branch          ( id_branch             ),
        .id_jump            ( id_jump               ),
        .ex_mem_to_gpr      ( ex_mem_to_gpr_select  ),
        .mem_mem_to_gpr     ( mem_mem_to_gpr_select ),
        .ex_gpr_we          ( ex_gpr_we             ),
        .mem_gpr_we         ( mem_gpr_we            ),
        .wb_gpr_we          ( wb_gpr_we             ),
        .ex_request_stall   ( ex_request_stall      ),
        .dmem_request_stall ( dmem_request_stall    ),
        .imem_request_stall ( imem_request_stall    ),
        .if_exception_stall ( if_exception_stall    ),
        .id_exception_stall ( id_exception_stall    ),
        .ex_exception_stall ( ex_exception_stall    ),
        .mem_exception_stall( mem_exception_stall   )
        );
    musb_load_store_unit musb_load_store_unit0(/*AUTOINST*/
        // Outputs
        .imem_data              ( if_instruction[31:0]     ),
        .dmem_data_o            ( mem_read_data[31:0]      ),
        .iport_address          ( iport_address[31:0]      ),
        .iport_wr               ( iport_wr[3:0]            ),
        .iport_enable           ( iport_enable             ),
        .dport_address          ( dport_address[31:0]      ),
        .dport_data_o           ( dport_data_o[31:0]       ),
        .dport_wr               ( dport_wr[3:0]            ),
        .dport_enable           ( dport_enable             ),
        .exc_address_if         ( exc_address_if           ),
        .exc_address_l_mem      ( exc_address_l_mem        ),
        .exc_address_s_mem      ( exc_address_s_mem        ),
        .imem_request_stall     ( imem_request_stall       ),
        .dmem_request_stall     ( dmem_request_stall       ),
        // Inputs
        .clk                    ( clk ),
        .rst                    ( rst ),
        .imem_address           ( if_pc[31:0]              ),
        .dmem_address           ( mem_alu_result[31:0]     ),
        .dmem_data_i            ( mem_mem_store_data[31:0] ),
        .dmem_halfword          ( mem_mem_halfword         ),
        .dmem_byte              ( mem_mem_byte             ),
        .dmem_read              ( mem_mem_to_gpr_select    ),
        .dmem_write             ( mem_mem_write            ),
        .dmem_sign_extend       ( mem_mem_data_sign_ext    ),
        .iport_data_i           ( iport_data_i[31:0]       ),
        .iport_ready            ( iport_ready              ),
        .iport_error            ( iport_error              ),
        .dport_data_i           ( dport_data_i[31:0]       ),
        .dport_ready            ( dport_ready              ),
        .dport_error            ( dport_error              ),
        .exception_ready        ( exception_ready          ),
        .mem_kernel_mode        ( mem_kernel_mode          ),
        .mem_llsc               ( mem_llsc                 ),
        .id_eret                ( id_eret                  )
        );
    musb_cpzero musb_cpzero0(/*autoinst*/
        // output
        .data_output            ( cp0_data_out[31:0]     ),
        .kernel_mode            ( id_kernel_mode         ),
        .halt                   ( halt_0                 ),
        .if_exception_stall     ( if_exception_stall     ),
        .id_exception_stall     ( id_exception_stall     ),
        .ex_exception_stall     ( ex_exception_stall     ),
        .mem_exception_stall    ( mem_exception_stall    ),
        .if_exception_flush     ( if_exception_flush     ),
        .id_exception_flush     ( id_exception_flush     ),
        .ex_exception_flush     ( ex_exception_flush     ),
        .mem_exception_flush    ( mem_exception_flush    ),
        .exception_ready        ( exception_ready        ),
        .exception_pc_select    ( exception_pc_select    ),
        .pc_exception           ( pc_exception[31:0]     ),
        // input
        .clk                    ( clk                    ),
        .mfc0                   ( id_mfc0                ),
        .mtc0                   ( id_mtc0                ),
        .eret                   ( id_eret                ),
        .cp1_instruction        ( id_cp1_instruction     ),
        .cp2_instruction        ( id_cp2_instruction     ),
        .cp3_instruction        ( id_cp3_instruction     ),
        .register_address       ( op_rd[4:0]             ),
        .select                 ( op_cp0_select[2:0]     ),
        .data_input             ( id_forward_rt[31:0]    ),
        .if_stall               ( if_stall               ),
        .id_stall               ( id_stall               ),
        .interrupts             ( interrupts[4:0]        ),
        .rst                    ( rst                    ),
        .exc_nmi                ( nmi                    ),
        .exc_address_if         ( exc_address_if         ),
        .exc_address_l_mem      ( exc_address_l_mem      ),
        .exc_address_s_mem      ( exc_address_s_mem      ),
        .exc_ibus_error         ( iport_error            ),
        .exc_dbus_error         ( dport_error            ),
        .exc_overflow           ( exc_overflow           ),
        .exc_trap               ( exc_trap               ),
        .exc_syscall            ( exc_syscall            ),
        .exc_breakpoint         ( exc_breakpoint         ),
        .exc_reserved           ( exc_reserved           ),
        .id_exception_pc        ( id_exception_pc[31:0]  ),
        .ex_exception_pc        ( ex_exception_pc[31:0]  ),
        .mem_exception_pc       ( mem_exception_pc[31:0] ),
        .bad_address_if         ( if_pc[31:0]            ),
        .bad_address_mem        ( mem_alu_result[31:0]   ),
        .id_exception_source    ( id_exception_source    ),
        .ex_exception_source    ( ex_exception_source    ),
        .mem_exception_source   ( mem_exception_source   ),
        .id_is_flushed          ( id_is_flushed          ),
        .if_is_bds              ( if_is_bds              ),
        .id_is_bds              ( id_is_bds              ),
        .ex_is_bds              ( ex_is_bds              ),
        .mem_is_bds             ( mem_is_bds             )
        );
endmodule