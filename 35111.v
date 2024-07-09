module's porta input on every single clock.
always @(posedge clk)
   if (reset) porta <= 8'h00;
   else if (q1) porta <= portain;
// PORTB Output Port  (Register #6)
always @(posedge clk) begin
   if (reset) begin
      portb <= 8'h00;
   end
   else if (q4) begin
      if (fwe & specialsel & (fileaddr[2:0] == PORTB_ADDRESS) & ~istris) begin
         portb <= dbus;
      end
   end
end
// Connect the output ports to the register output.
always @(portb)
   portbout = portb;
// PORTC Output Port  (Register #7)
always @(posedge clk) begin
   if (reset) begin
      portc <= 8'h00;
   end
   else if (q4) begin
      if (fwe & specialsel & (fileaddr[2:0] == PORTC_ADDRESS) & ~istris) begin
         portc <= dbus;
      end
   end
end
// Connect the output ports to the register output.
always @(portc)
   portcout = portc;
// TRIS Registers
always @(posedge clk) begin
   if (reset) begin
      trisa <= 8'hff; // Default is to tristate them
   end
   else if (q4) begin
      if (fwe & specialsel & (fileaddr[2:0] == PORTA_ADDRESS) & istris) begin
         trisa <= dbus;
      end
   end
end
always @(posedge clk) begin
   if (reset) begin
      trisb <= 8'hff; // Default is to tristate them
   end
   else if (q4) begin
      if (fwe & specialsel & (fileaddr[2:0] == PORTB_ADDRESS) & istris) begin
         trisb <= dbus;
      end
   end
end
always @(posedge clk) begin
   if (reset) begin
      trisc <= 8'hff; // Default is to tristate them
   end
   else if (q4) begin
      if (fwe & specialsel & (fileaddr[2:0] == PORTC_ADDRESS) & istris) begin
         trisc <= dbus;
      end
   end
end
// There are 4 ways to change the PC.  They are:
//    GOTO  101k_kkkk_kkkk
//    CALL  1001_kkkk_kkkk
//    RETLW 1000_kkkk_kkkk
//    MOVF  0010_0010_0010  (e.g. a write to reg #2)
//    MOVWF 0000_0010_0010  (write from W to reg #2)
// Remember that the skip instructions work by inserting
// a NOP instruction or not into program stream and don't
// change the PC.
// Implmenent PC
// Seperate the PC_IN input bus into PC from the sequential register so that we
// can feed the PC_IN bus into the PRAM address input.
always @(posedge clk)
   if (reset) pc <= RESET_VECTOR;
   else if (q4) pc <= pc_in;
always @(inst or stacklevel or status or stack1 or stack2 or pc or dbus) begin
   casex ({inst, stacklevel}) // synopsys parallel_case
      14'b101?_????_????_??: pc_in = {status[6:5],       inst[8:0]};	// GOTO
      14'b1001_????_????_??: pc_in = {status[6:5], 1'b0, inst[7:0]};	// CALL
      14'b1000_????_????_00: pc_in = stack1;				// RETLW
      14'b1000_????_????_01: pc_in = stack1;				// RETLW
      14'b1000_????_????_10: pc_in = stack2;				// RETLW
      14'b1000_????_????_11: pc_in = stack2;				// RETLW
      14'b00?0_0010_0010_??: pc_in = {pc[10:8], dbus};		// MOVF or MOVWF where f=PC
      default:
         pc_in = pc + 1;
   endcase
end
// Implement STACK1 and STACK2 registers
// The Stack registers are only fed from the PC itself!
always @(posedge clk) begin
   if (reset) begin
      stack1 <= 9'h000;
   end
   else if (q4) begin
      // CALL instruction
      if (inst[11:8] == 4'b1001) begin
         case (stacklevel) // synopsys parallel_case
            2'b00:
               // No previous CALLs
               begin
                  stack1 <= pc;
               end
            2'b01:
               // ONE previous CALL
               begin
                  stack2 <= pc;
               end
            2'b10:
               // TWO previous CALLs -- This is illegal on the 16C5X!
               begin
                  $display ("Too many CALLs!!");
               end
            2'b11:
               begin
                  $display ("Too many CALLs!!");
               end
         endcase
      end
   end
end
// Write to stacklevel
// The stacklevel register keeps track of the current stack depth.  On this
// puny processor, there are only 2 levels (you could fiddle with this and
// increase the stack depth).  There are two stack registers, stack1 and stack2.
// The stack1 register is used first (e.g. the first time a call is performed),
// then stack2.  As CALLs are done, stacklevel increments.  Conversely, as
// RETs are done, stacklevel goes down.
always @(posedge clk) begin
   if (reset == 1'b1) begin
      stacklevel <= 2'b00;  // On reset, there should be no CALLs in progress
   end
   else if (q4) begin
      casex ({inst, stacklevel}) // synopsys parallel_case
         // Call instructions
         14'b1001_????_????_00: stacklevel <= 2'b01;  // Record 1st CALL
         14'b1001_????_????_01: stacklevel <= 2'b10;  // Record 2nd CALL
         14'b1001_????_????_10: stacklevel <= 2'b10;  // Already 2! Ignore
         14'b1001_????_????_11: stacklevel <= 2'b00;  // {shouldn't happen}
         // Return instructions
         14'b1000_????_????_00: stacklevel <= 2'b00;  // {shouldn't happen}
         14'b1000_????_????_01: stacklevel <= 2'b00;  // Go back to no CALL in progress
         14'b1000_????_????_10: stacklevel <= 2'b01;  // Go back to 1 CALL in progress
         14'b1000_????_????_11: stacklevel <= 2'b10;  // {shouldn't happen} sort of like, Go back to 2 calls in progress
         default:
            stacklevel <= stacklevel;
      endcase
   end
end
// The following is NOT synthesizable.  This code simply allows you to see the ASCII name
// for the instruction in the INST register while in a waveform viewer.
// synopsys translate_off
reg [8*8-1:0] inst_string;
always @(inst) begin
   casex (inst)
      12'b0000_0000_0000: inst_string = "NOP     ";
      12'b0000_001X_XXXX: inst_string = "MOVWF   ";
      12'b0000_0100_0000: inst_string = "CLRW    ";
      12'b0000_011X_XXXX: inst_string = "CLRF    ";
      12'b0000_10XX_XXXX: inst_string = "SUBWF   ";
      12'b0000_11XX_XXXX: inst_string = "DECF    ";
      12'b0001_00XX_XXXX: inst_string = "IORWF   ";
      12'b0001_01XX_XXXX: inst_string = "ANDWF   ";
      12'b0001_10XX_XXXX: inst_string = "XORWF   ";
      12'b0001_11XX_XXXX: inst_string = "ADDWF   ";
      12'b0010_00XX_XXXX: inst_string = "MOVF    ";
      12'b0010_01XX_XXXX: inst_string = "COMF    ";
      12'b0010_10XX_XXXX: inst_string = "INCF    ";
      12'b0010_11XX_XXXX: inst_string = "DECFSZ  ";
      12'b0011_00XX_XXXX: inst_string = "RRF     ";
      12'b0011_01XX_XXXX: inst_string = "RLF     ";
      12'b0011_10XX_XXXX: inst_string = "SWAPF   ";
      12'b0011_11XX_XXXX: inst_string = "INCFSZ  ";
      12'b0100_XXXX_XXXX: inst_string = "BCF     ";
      12'b0101_XXXX_XXXX: inst_string = "BSF     ";
      12'b0110_XXXX_XXXX: inst_string = "BTFSC   ";
      12'b0111_XXXX_XXXX: inst_string = "BTFSS   ";
      12'b0000_0000_0010: inst_string = "OPTION  ";
      12'b0000_0000_0011: inst_string = "SLEEP   ";
      12'b0000_0000_0100: inst_string = "CLRWDT  ";
      12'b0000_0000_0101: inst_string = "TRIS    ";
      12'b0000_0000_0110: inst_string = "TRIS    ";
      12'b0000_0000_0111: inst_string = "TRIS    ";
      12'b1000_XXXX_XXXX: inst_string = "RETLW   ";
      12'b1001_XXXX_XXXX: inst_string = "CALL    ";
      12'b101X_XXXX_XXXX: inst_string = "GOTO    ";
      12'b1100_XXXX_XXXX: inst_string = "MOVLW   ";
      12'b1101_XXXX_XXXX: inst_string = "IORLW   ";
      12'b1110_XXXX_XXXX: inst_string = "ANDLW   ";
      12'b1111_XXXX_XXXX: inst_string = "XORLW   ";
      default:            inst_string = "-XXXXXX-";
   endcase
end
// synopsys translate_on
endmodule