module
`ifdef UNUSED
dbg_top dbg1  (.tms_pad_i(P_TMS), .tck_pad_i(P_TCK), .trst_pad_i(P_TRST), .tdi_pad_i(P_TDI), .tdo_pad_o(P_TDO),
               .wb_rst_i(wb_rst_i), .risc_clk_i(Mclk), .risc_addr_o(), .risc_data_i(DataIn),
               .risc_data_o(), .wp_i(11'h0), .bp_i(1'b0),
               .opselect_o(), .lsstatus_i(4'h0), .istatus_i(2'h0),
               .risc_stall_o(), .reset_o()
              );
`endif
// Generation of the TCLK signal
task GenClk;
  input [7:0] Number;
  integer i;
  begin
    for(i=0; i<Number; i=i+1)
      begin
        #Tclk P_TCK<=1;
        #Tclk P_TCK<=0;
      end
  end
endtask
// sets the instruction to the IR register and goes to the RunTestIdle state
task SetInstruction;
  input [3:0] Instr;
  integer i;
  begin
    P_TMS<=#Tp 1;
    GenClk(2);
    P_TMS<=#Tp 0;
    GenClk(2);  // we are in shiftIR
    for(i=0; i<`IR_LENGTH-1; i=i+1)   // error?
    begin
      P_TDI<=#Tp Instr[i];
      GenClk(1);
    end
    P_TDI<=#Tp Instr[i]; // last shift
    P_TMS<=#Tp 1;        // going out of shiftIR
    GenClk(1);
      P_TDI<=#Tp 'hz;    // tri-state
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(1);       // we are in RunTestIdle
  end
endtask
// sets the selected scan chain and goes to the RunTestIdle state
task ChainSelect;
  input [3:0] Data;
  input [7:0] Crc;
  integer i;
  begin
    P_TMS<=#Tp 1;
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(2);  // we are in shiftDR
    for(i=0; i<`CHAIN_ID_LENGTH; i=i+1)
    begin
      P_TDI<=#Tp Data[i];
      GenClk(1);
    end
    for(i=0; i<`CRC_LENGTH-1; i=i+1)
    begin
      P_TDI<=#Tp Crc[i];
      GenClk(1);
    end
    P_TDI<=#Tp Crc[i]; // last shift
    P_TMS<=#Tp 1;        // going out of shiftIR
    GenClk(1);
      P_TDI<=#Tp 'hz; // tri-state
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(1);       // we are in RunTestIdle
  end
endtask
// Write the RISC register
task WriteRISCRegister;
  input [31:0] Data;
  input [31:0] Address;
  input [`CRC_LENGTH-1:0] Crc;
  integer i;
  begin
    P_TMS<=#Tp 1;
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(2);  // we are in shiftDR
    for(i=0; i<32; i=i+1)
    begin
      P_TDI<=#Tp Address[i];  // Shifting address
      GenClk(1);
    end
    P_TDI<=#Tp 1;             // shifting RW bit = write
    GenClk(1);
    for(i=0; i<32; i=i+1)
    begin
      P_TDI<=#Tp Data[i];     // Shifting data
      GenClk(1);
    end
    for(i=0; i<`CRC_LENGTH-1; i=i+1)
    begin
      P_TDI<=#Tp Crc[i];     // Shifting CRC
      GenClk(1);
    end
    P_TDI<=#Tp Crc[i];        // shifting last bit of CRC
    P_TMS<=#Tp 1;        // going out of shiftIR
    GenClk(1);
      P_TDI<=#Tp 'hz;        // tristate TDI
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(1);       // we are in RunTestIdle
    GenClk(10);      // Generating few clock cycles needed for the write operation to accomplish
  end
endtask
// Reads the RISC register and latches the data so it is ready for reading
task ReadRISCRegister;
  input [31:0] Address;
  input [7:0] Crc;
  output [31:0] read_data;
  integer i;
  begin
    P_TMS<=#Tp 1;
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(2);  // we are in shiftDR
    for(i=0; i<32; i=i+1)
    begin
      P_TDI<=#Tp Address[i];  // Shifting address
      GenClk(1);
    end
    P_TDI<=#Tp 0;             // shifting RW bit = read
    GenClk(1);
    for(i=0; i<32; i=i+1)
    begin
      P_TDI<=#Tp 0;     // Shifting data. Data is not important in read cycle.
      read_data[i]<=#Tp P_TDO;    // Assembling data to read_data
      GenClk(1);
    end
    for(i=0; i<`CRC_LENGTH-1; i=i+1)
    begin
      P_TDI<=#Tp Crc[i];     // Shifting CRC.
      GenClk(1);
    end
    P_TDI<=#Tp Crc[i];   // Shifting last bit of CRC.
    P_TMS<=#Tp 1;        // going out of shiftIR
    GenClk(1);
      P_TDI<=#Tp 'hz;   // Tristate TDI.
    GenClk(1);
    P_TMS<=#Tp 0;
    GenClk(1);       // we are in RunTestIdle
  end
endtask
endmodule