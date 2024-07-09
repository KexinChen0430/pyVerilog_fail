module that instantiates the MicroBlaze CPU but otherwise
  // provides no logic.
  assign reset = ~reset_;
  microblaze_mcs_v1_4 mcs_0 (
    .Clk(clk),      // input 32Mhz clk
    .Reset(reset),  // input **active high** reset
    .GPO1(led),     // output [7:0] GPO1
    // Trace bus connections: for waveform debugging, only
    .Trace_Instruction(tr_instruction),
    .Trace_Valid_Instr(tr_valid_instruction),
    .Trace_PC(tr_pc),
    .Trace_Reg_Write(tr_reg_write),
    .Trace_Reg_Addr(tr_reg_addr),
    .Trace_MSR_Reg(tr_msr_reg),
    .Trace_New_Reg_Value(tr_new_reg_val),
    .Trace_Jump_Taken(tr_jump_taken),
    .Trace_Delay_Slot(tr_delay_slot),
    .Trace_Data_Address(tr_data_addr),
    .Trace_Data_Access(tr_data_access),
    .Trace_Data_Read(tr_data_read),
    .Trace_Data_Write(tr_data_write),
    .Trace_Data_Write_Value(tr_data_write_val),
    .Trace_Data_Byte_Enable(tr_data_byte_en),
    .Trace_MB_Halted(tr_halted)
  );
endmodule