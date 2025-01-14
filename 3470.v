module and HAZ/FWD
    output reg [31:0] DataOut,      // Data to CPU
    output [31:0] MWriteData,       // Data to Memory
    output reg [3:0] WriteEnable,   // Write Enable to Memory for each of 4 bytes of Memory
    output ReadEnable,              // Read Enable to Memory
    output M_Stall,
    output EXC_AdEL,                // Load Exception
    output EXC_AdES,                // Store Exception
	 // Voter Signals for Registers
	 input  [29:0] LLSC_Address,
    input  LLSC_Atomic,
	 input  RW_Mask,
	 output reg [29:0] vote_LLSC_Address,
    output reg vote_LLSC_Atomic,
	 output reg vote_RW_Mask
    );
    `include "MIPS_Parameters.v"
    /*** Reverse Endian Mode
         Normal memory accesses in the processor are Big Endian. The endianness can be reversed
         to Little Endian in User Mode only.
    */
    wire BE = KernelMode | ~ReverseEndian;
    /*** Indicator that the current memory reference must be word-aligned ***/
    wire Word = ~(Half | Byte | Left | Right);
    // Exception Detection
    wire EXC_KernelMem = ~KernelMode & (Address < `UMem_Lower);
    wire EXC_Word = Word & (Address[1] | Address[0]);
    wire EXC_Half = Half & Address[0];
    assign EXC_AdEL = MemRead  & (EXC_KernelMem | EXC_Word | EXC_Half);
    assign EXC_AdES = MemWrite & (EXC_KernelMem | EXC_Word | EXC_Half);
    /*** Load Linked and Store Conditional logic ***
         A 32-bit register keeps track of the address for atomic Load Linked / Store Conditional
         operations. This register can be updated during stalls since it is not visible to
         forward stages. It does not need to be flushed during exceptions, since ERET destroys
         the atomicity condition and there are no detrimental effects in an exception handler.
         The atomic condition is set with a Load Linked instruction, and cleared on an ERET
         instruction or when any store instruction writes to one or more bytes covered by
         the word address register. It does not update on a stall condition.
         The MIPS32 spec states that an ERET instruction between LL and SC will cause the
         atomicity condition to fail. This implementation uses the ERET signal from the ID
         stage, which means instruction sequences such as "LL SC" could appear to have an
         ERET instruction between them even though they don't. One way to fix this is to pass
         the ERET signal through the pipeline to the MEM stage. However, because of the nature
         of LL/SC operations (they occur in a loop which checks the result at each iteration),
         an ERET will normally never be inserted into the pipeline programmatically until the
         LL/SC sequence has completed (exceptions such as interrupts can still cause ERET, but
         they can still cause them in the LL SC sequence as well). In other words, by not passing
         ERET through the pipeline, the only possible effect is a performance penalty. Also this
         may be irrelevant since currently ERET stalls for forward stages which can cause exceptions,
         which includes LL and SC.
    */
    wire LLSC_MemWrite_Mask;
    always @(posedge clock) begin
        vote_LLSC_Address <= (reset) ? 30'b0 : (MemRead & LLSC) ? Address[31:2] : LLSC_Address;
    end
    always @(posedge clock) begin
        if (reset) begin
            vote_LLSC_Atomic <= 1'b0;
        end
        else if (MemRead) begin
            vote_LLSC_Atomic <= (LLSC) ? 1'b1 : LLSC_Atomic;
        end
        else if (ERET | (~M_Stall & ~IF_Stall & MemWrite & (Address[31:2] == LLSC_Address))) begin
            vote_LLSC_Atomic <= 1'b0;
        end
        else begin
            vote_LLSC_Atomic <= LLSC_Atomic;
        end
    end
    assign LLSC_MemWrite_Mask = (LLSC & MemWrite & (~LLSC_Atomic | (Address[31:2] != LLSC_Address)));
    wire WriteCondition = MemWrite & ~(EXC_KernelMem | EXC_Word | EXC_Half) & ~LLSC_MemWrite_Mask;
    wire ReadCondition  = MemRead  & ~(EXC_KernelMem | EXC_Word | EXC_Half);
/*    always @(posedge clock) begin
        vote_RW_Mask <= (reset) ? 1'b0 : (((MemWrite | MemRead) & DataMem_Ready) ? 1'b1 : ((~M_Stall & ~IF_Stall) ? 1'b0 : RW_Mask));
    end*/
    assign M_Stall = ((ReadEnable | (WriteEnable != 4'b0000)) && ~DataMem_Ready) | M_Exception_Stall;
    assign ReadEnable  = ReadCondition  /*& ~RW_Mask*/;
    wire Half_Access_L  = (Address[1] ^  BE);
    wire Half_Access_R  = (Address[1] ~^ BE);
    wire Byte_Access_LL = Half_Access_L & (Address[1] ~^ Address[0]);
    wire Byte_Access_LM = Half_Access_L & (Address[0] ~^ BE);
    wire Byte_Access_RM = Half_Access_R & (Address[0] ^  BE);
    wire Byte_Access_RR = Half_Access_R & (Address[1] ~^ Address[0]);
    // Write-Enable Signals to Memory
    always @(*) begin
        if (WriteCondition /*& ~RW_Mask*/) begin
            if (Byte) begin
                WriteEnable[3] <= Byte_Access_LL;
                WriteEnable[2] <= Byte_Access_LM;
                WriteEnable[1] <= Byte_Access_RM;
                WriteEnable[0] <= Byte_Access_RR;
            end
            else if (Half) begin
                WriteEnable[3] <= Half_Access_L;
                WriteEnable[2] <= Half_Access_L;
                WriteEnable[1] <= Half_Access_R;
                WriteEnable[0] <= Half_Access_R;
            end
            else if (Left) begin
                case (Address[1:0])
                    2'b00 : WriteEnable <= (BE) ? 4'b1111 : 4'b0001;
                    2'b01 : WriteEnable <= (BE) ? 4'b0111 : 4'b0011;
                    2'b10 : WriteEnable <= (BE) ? 4'b0011 : 4'b0111;
                    2'b11 : WriteEnable <= (BE) ? 4'b0001 : 4'b1111;
                endcase
            end
            else if (Right) begin
                case (Address[1:0])
                    2'b00 : WriteEnable <= (BE) ? 4'b1000 : 4'b1111;
                    2'b01 : WriteEnable <= (BE) ? 4'b1100 : 4'b1110;
                    2'b10 : WriteEnable <= (BE) ? 4'b1110 : 4'b1100;
                    2'b11 : WriteEnable <= (BE) ? 4'b1111 : 4'b1000;
                endcase
            end
            else begin
                WriteEnable <= 4'b1111;
            end
        end
        else begin
            WriteEnable <= 4'b0000;
        end
    end
    // Data Going to Memory
    assign MWriteData[31:24] = (Byte) ? DataIn[7:0] : ((Half) ? DataIn[15:8] : DataIn[31:24]);
    assign MWriteData[23:16] = (Byte | Half) ? DataIn[7:0] : DataIn[23:16];
    assign MWriteData[15:8]  = (Byte) ? DataIn[7:0] : DataIn[15:8];
    assign MWriteData[7:0]   = DataIn[7:0];
    // Data Read from Memory
    always @(*) begin
        if (Byte) begin
            if (Byte_Access_LL) begin
                DataOut <= (SignExtend & MReadData[31]) ? {24'hFFFFFF, MReadData[31:24]} : {24'h000000, MReadData[31:24]};
            end
            else if (Byte_Access_LM) begin
                DataOut <= (SignExtend & MReadData[23]) ? {24'hFFFFFF, MReadData[23:16]} : {24'h000000, MReadData[23:16]};
            end
            else if (Byte_Access_RM) begin
                DataOut <= (SignExtend & MReadData[15]) ? {24'hFFFFFF, MReadData[15:8]}  : {24'h000000, MReadData[15:8]};
            end
            else begin
                DataOut <= (SignExtend & MReadData[7])  ? {24'hFFFFFF, MReadData[7:0]}   : {24'h000000, MReadData[7:0]};
            end
        end
        else if (Half) begin
            if (Half_Access_L) begin
                DataOut <= (SignExtend & MReadData[31]) ? {16'hFFFF, MReadData[31:16]} : {16'h0000, MReadData[31:16]};
            end
            else begin
                DataOut <= (SignExtend & MReadData[15]) ? {16'hFFFF, MReadData[15:0]}  : {16'h0000, MReadData[15:0]};
            end
        end
        else if (LLSC & MemWrite) begin
            DataOut <= (LLSC_Atomic & (Address[31:2] == LLSC_Address)) ? 32'h0000_0001 : 32'h0000_0000;
        end
        else if (Left) begin
            case (Address[1:0])
                2'b00 : DataOut <= (BE) ?  MReadData                      : {MReadData[7:0],  DataIn[23:0]};
                2'b01 : DataOut <= (BE) ? {MReadData[23:0], DataIn[7:0]}  : {MReadData[15:0], DataIn[15:0]};
                2'b10 : DataOut <= (BE) ? {MReadData[15:0], DataIn[15:0]} : {MReadData[23:0], DataIn[7:0]};
                2'b11 : DataOut <= (BE) ? {MReadData[7:0],  DataIn[23:0]} :  MReadData;
            endcase
        end
        else if (Right) begin
            case (Address[1:0])
                2'b00 : DataOut <= (BE) ? {DataIn[31:8],  MReadData[31:24]} : MReadData;
                2'b01 : DataOut <= (BE) ? {DataIn[31:16], MReadData[31:16]} : {DataIn[31:24], MReadData[31:8]};
                2'b10 : DataOut <= (BE) ? {DataIn[31:24], MReadData[31:8]}  : {DataIn[31:16], MReadData[31:16]};
                2'b11 : DataOut <= (BE) ? MReadData                         : {DataIn[31:8],  MReadData[31:24]};
            endcase
        end
        else begin
            DataOut <= MReadData;
        end
    end
endmodule