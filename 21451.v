module mem(
    //input
    //MemControl
    input wire[31:0] memData_i,
    //MEM-WB
    input wire[31:0] writeData_i,
    //MEM
    input wire[31:0] storeData_i,
    input wire[2:0] memOp_i,
    //Exception
    input wire insValid_i,
    input wire[31:0] insAddr_i,
    input wire inDelaySlot_i,
    input wire[3:0] exception_i,
    input wire[31:0] badVAddr_i,
    input wire[3:0] exceptionMC_i,
    input wire timeInt_i,
    input wire serialInt_i,
    //WB
    input wire writeReg_i,
    input wire[4:0] writeRegAddr_i,
    input wire[31:0] writeDataHi_i,
    input wire[31:0] writeDataLo_i,
    input wire writeRegHiLo_i,
    input wire writeCP0_i,
    input wire[4:0] writeCP0Addr_i,
    //CP0
    input wire[31:0] cp0_Status_i,
    input wire[31:0] cp0_EntryHi_i,
    input wire[31:0] cp0_Ebase_i,
    input wire[31:0] cp0_EPC_i,
    //output
    //MemControl
    output reg[2:0] memOp_o,
    output reg[31:0] storeData_o,
    output reg[31:0] memAddr_o,
    //WB
    output reg writeReg_o,
    output reg[4:0] writeRegAddr_o,
    output reg[31:0] writeData_o,
    output reg[31:0] writeDataHi_o,
    output reg[31:0] writeDataLo_o,
    output reg writeRegHiLo_o,
    output reg writeCP0_o,
    output reg[4:0] writeCP0Addr_o,
    //Exception Control
    output reg flush_o,
    output reg[31:0] excAddr_o,
    //Exception
    output reg[3:0] exception_o,
    output reg inDelaySlot_o,
    output reg[31:0] insAddr_o,
    output reg[31:0] badVAddr_o
    );
    wire EXL = cp0_Status_i[`Status_EXL];
    wire ERL = cp0_Status_i[`Status_ERL];
    wire UM = cp0_Status_i[`Status_UM];
    wire BEV = cp0_Status_i[`Status_BEV];
    wire IE = cp0_Status_i[`Status_IE];
    wire[7:0] IM = cp0_Status_i[`Status_IM];
    wire isUserMode = (UM == 1'b1 && EXL == 1'b0 && ERL == 1'b0);
    wire[7:0] pendingInt = {timeInt_i, 2'h0, serialInt_i, 4'h0};
    wire[7:0] intVector = IM & pendingInt;
    wire isIntEnable = (IE == 1'b1 && EXL == 1'b0 && ERL == 1'b0 && (|intVector) == 1'b1 && insValid_i == `Enable);
    //Data Pass
    always @(*) begin
    //Exception
        inDelaySlot_o = inDelaySlot_i;
        insAddr_o = insAddr_i;
    //WB
        writeRegAddr_o = writeRegAddr_i;
        writeDataHi_o = writeDataHi_i;
        writeDataLo_o = writeDataLo_i;
        writeCP0Addr_o = writeCP0Addr_i;
    end
    //Pre Exception
    reg[3:0] preException;
    always @(*) begin
        if (isIntEnable == `Enable) begin
        //INT
            preException = `EXC_INT;
        end else if (isUserMode == `Enable && (exception_i == `EXC_ERET || exception_i == `EXC_TLBWI || exception_i == `EXC_MC0)) begin
        //CpU
            preException = `EXC_CPU;
        end else begin
            preException = exception_i;
        end
    end
    //Memory Operation
    //memOp
    reg[2:0] memOp;
    always @(*) begin
        if (preException == `EXC_NONE) begin
            memOp = memOp_i;
        end else begin
            memOp = `MEM_NOP_OP;
        end
    end
    //Data Fetch
    wire[31:0] signData = {{24{memData_i[7]}}, memData_i[7:0]};
    wire[31:0] zeroData = {24'h0, memData_i[7:0]};
    reg[31:0] writeData;
    always @(*) begin
        //MMU
            memOp_o = memOp;
            storeData_o = `ZeroWord;
            memAddr_o = `ZeroWord;
        //Data
            writeData = `ZeroWord;
        case (memOp)
            `MEM_NOP_OP: begin
                //Data
                    writeData = writeData_i;
            end
            `MEM_LB_OP: begin
                //MMU
                    memAddr_o = writeData_i;
                //Data
                    writeData = signData;
            end
            `MEM_LBU_OP: begin
                //MMU
                    memAddr_o = writeData_i;
                //Data
                    writeData = zeroData;
            end
            `MEM_LW_OP: begin
                //MMU
                    memAddr_o = writeData_i;
                //Data
                    writeData = memData_i;
            end
            `MEM_SB_OP: begin
                //MMU
                    storeData_o = storeData_i;
                    memAddr_o = writeData_i;
            end
            `MEM_SW_OP: begin
                //MMU
                    storeData_o = storeData_i;
                    memAddr_o = writeData_i;
            end
            default: begin
            end
        endcase
    end
    //Post Exception
    always @(*) begin
        if (preException != `EXC_NONE) begin
            exception_o = preException;
            badVAddr_o = badVAddr_i;
        end else begin
        //Use MC Exception
        //ADE, TLB, MCHECK
            exception_o = exceptionMC_i;
            badVAddr_o = writeData_i;
        end
    end
    //Control-signal
    always @(*) begin
        if (exception_o == `EXC_NONE || exception_o == `EXC_MC0 || exception_o == `EXC_TLBWI) begin
            //WB
                writeReg_o = writeReg_i;
                writeData_o = writeData;
                writeRegHiLo_o = writeRegHiLo_i;
                writeCP0_o = writeCP0_i;
            //Exception Control
                flush_o = `Disable;
                excAddr_o = `ZeroWord;
        end else begin
            //Exception happeded
            //WB
                writeReg_o = `Disable;
                writeData_o = {24'h0, intVector};
                writeRegHiLo_o = `Disable;
                writeCP0_o = `Disable;
            //WB
                flush_o = `Enable;
                if (exception_o == `EXC_ERET) begin
                    excAddr_o = cp0_EPC_i;
                end else begin
                    excAddr_o = cp0_Ebase_i;
                end
        end
    end
endmodule