module id(
    //Input
    //PC
    input wire[31:0] insAddr_i,
    input wire[31:0] ins_i,
    //Registers
    input wire[31:0] regData1_i,
    input wire[31:0] regData2_i,
    //HILO
    input wire[31:0] regDataHi_i,
    input wire[31:0] regDataLo_i,
    //CP0
    input wire[31:0] CP0Data_i,
    //Exception
    input wire inDelaySlot_i,
    input wire[3:0] exception_i,
    input wire[31:0] badVAddr_i,
    //EX
    //bypass
    input wire ex_writeReg_i,
    input wire[4:0] ex_writeRegAddr_i,
    input wire[31:0] ex_writeData_i,
    input wire ex_writeRegHiLo_i,
    input wire[31:0] ex_writeDataHi_i,
    input wire[31:0] ex_writeDataLo_i,
    input wire[2:0] ex_memOp_i,
    input wire ex_writeCP0_i,
    input wire[4:0] ex_writeCP0Addr_i,
    //MEM
    //bypass
    input wire mem_writeReg_i,
    input wire[4:0] mem_writeRegAddr_i,
    input wire[31:0] mem_writeData_i,
    input wire mem_writeRegHiLo_i,
    input wire[31:0] mem_writeDataHi_i,
    input wire[31:0] mem_writeDataLo_i,
    input wire mem_writeCP0_i,
    input wire[4:0] mem_writeCP0Addr_i,
    //Output
    //Registers
    output reg[4:0] regReadAddr1_o,
    output reg[4:0] regReadAddr2_o,
    output reg regEnable1_o,
    output reg regEnable2_o,
    //CP0
    output reg CP0ReadEnable_o,
    output reg[4:0] CP0ReadAddr_o,
    //Bubble Control
    output reg bubbleRequest_o,
    //PC
    output reg branchEnable_o,
    output reg[31:0] branchAddr_o,
    //ID_EX
    output reg[31:0] insAddr_o,
    output reg nextInDelaySlot_o,
    //EX
    output reg[31:0] operand1_o,
    output reg[31:0] operand2_o,
    output reg[4:0] aluOp_o,
    //MEM
    output reg[31:0] storeData_o,
    output reg[2:0] memOp_o,
    //WB
    output reg writeReg_o,
    output reg[4:0] writeRegAddr_o,
    output reg writeRegHiLo_o,
    output reg writeCP0_o,
    output reg[4:0] writeCP0Addr_o,
    //Exception
    output reg inDelaySlot_o,
    output reg[3:0] exception_o,
    output reg[31:0] badVAddr_o
    );
    //Pass
    always @(*) begin
        insAddr_o = insAddr_i;
        badVAddr_o = badVAddr_i;
    end
    //Instruction Decoding Variables
    wire[5:0] op = ins_i[31:26];
    wire[5:0] func = ins_i[5:0];
    wire[4:0] rs = ins_i[25:21];
    wire[4:0] rt = ins_i[20:16];
    wire[4:0] rd = ins_i[15:11];
    wire[4:0] sa = ins_i[10:6];
    wire[25:0] target = ins_i[25:0];
    wire[15:0] imm = ins_i[15:0];
    wire[31:0] syscallCode = {12'b0, ins_i[25:6]};
    wire[31:0] nextInsAddr = insAddr_i + 32'h4;
    wire[31:0] nNextInsAddr = insAddr_i + 32'h8;
    wire[31:0] branchTarget = {nextInsAddr[31:28], target, 2'b00};
    wire[31:0] zeroImm = {16'h0, imm};
    wire[31:0] signImm = {{16{imm[15]}}, imm};
    wire[31:0] shiftImm = {27'h0, sa};
    wire[31:0] upperImm = {imm, 16'h0};
    wire[31:0] offsetImm = {{14{imm[15]}}, imm, 2'b00};
    //Hi Lo - bypass
    reg[31:0] regDataHi;
    reg[31:0] regDataLo;
    always @(*) begin
        if (ex_writeRegHiLo_i == `Enable) begin
            regDataHi = ex_writeDataHi_i;
            regDataLo = ex_writeDataLo_i;
        end else if (mem_writeRegHiLo_i == `Enable) begin
            regDataHi = mem_writeDataHi_i;
            regDataLo = mem_writeDataLo_i;
        end else begin
            regDataHi = regDataHi_i;
            regDataLo = regDataLo_i;
        end
    end
    //CP0 - bypass
    reg[31:0] CP0Data;
    always @(*) begin
        if (CP0ReadEnable_o == `Enable && ex_writeCP0_i == `Enable && CP0ReadAddr_o == ex_writeCP0Addr_i) begin
            CP0Data = ex_writeData_i;
        end else if (CP0ReadEnable_o == `Enable && mem_writeCP0_i == `Enable && CP0ReadAddr_o == mem_writeCP0Addr_i) begin
            CP0Data = mem_writeData_i;
        end else begin
            CP0Data = CP0Data_i;
        end
    end
    reg[31:0] regData1;
    reg[31:0] regData2;
    reg writeCP0;
    reg[4:0] writeCP0Addr;
    //regData1 - bypass
    always @(*) begin
        if (regEnable1_o ==`Enable && regReadAddr1_o == 5'h0) begin
            regData1 = regData1_i;
        end else if (regEnable1_o == `Enable && ex_writeReg_i == `Enable && regReadAddr1_o == ex_writeRegAddr_i) begin
            regData1 = ex_writeData_i;
        end else if (regEnable1_o == `Enable && mem_writeReg_i == `Enable && regReadAddr1_o == mem_writeRegAddr_i) begin
            regData1 = mem_writeData_i;
        end else begin
            regData1 = regData1_i;
        end
    end
    //regData2 - bypass
    always @(*) begin
        if (regEnable2_o ==`Enable && regReadAddr2_o == 5'h0) begin
            regData2 = regData2_i;
        end else if (regEnable2_o == `Enable && ex_writeReg_i == `Enable && regReadAddr2_o == ex_writeRegAddr_i) begin
            regData2 = ex_writeData_i;
        end else if (regEnable2_o == `Enable && mem_writeReg_i == `Enable && regReadAddr2_o == mem_writeRegAddr_i) begin
            regData2 = mem_writeData_i;
        end else begin
            regData2 = regData2_i;
        end
    end
    //Bubble Control
    wire isExLoadInst = (ex_memOp_i == `MEM_LB_OP || ex_memOp_i == `MEM_LBU_OP || ex_memOp_i == `MEM_LW_OP);
    wire isReg1ExConflict = (regEnable1_o == `Enable && ex_writeRegAddr_i == regReadAddr1_o);
    wire isReg2ExConflict = (regEnable2_o == `Enable && ex_writeRegAddr_i == regReadAddr2_o);
    always @(*) begin
        if (isExLoadInst == 1'b1 && (isReg1ExConflict == 1'b1 || isReg2ExConflict == 1'b1)) begin
            bubbleRequest_o = `Enable;
        end else begin
            bubbleRequest_o = `Disable;
        end
    end
    //Write CP0 if exceptions occur
    always @(*) begin
        if (exception_o == `EXC_NONE || exception_o == `EXC_MC0) begin
            writeCP0_o = writeCP0;
            writeCP0Addr_o = writeCP0Addr;
        end else begin
            writeCP0_o = `Enable;
            writeCP0Addr_o = `CP0_NoAddr;
        end
    end
    //Decoding
    always @(*) begin
        //Registers
            regReadAddr1_o = `ZeroWord;
            regReadAddr2_o = `ZeroWord;
            regEnable1_o = `Disable;
            regEnable2_o = `Disable;
            CP0ReadEnable_o = `Disable;
            CP0ReadAddr_o = `CP0_NoAddr;
        //PC
            branchEnable_o = `Disable;
            branchAddr_o = `ZeroWord;
        //ID_EX
            nextInDelaySlot_o = `Disable;
        //EX
            operand1_o = `ZeroWord;
            operand2_o = `ZeroWord;
            aluOp_o = `ALU_NOP_OP;
        //MEM
            storeData_o = `ZeroWord;
            memOp_o = `MEM_NOP_OP;
        //WB
            writeReg_o = `Disable;
            writeRegAddr_o = 5'h0;
            writeRegHiLo_o = `Disable;
            writeCP0 = `Disable;
            writeCP0Addr = `CP0_NoAddr;
        //Exception
            inDelaySlot_o = inDelaySlot_i;
            exception_o = exception_i;
        case (op)
            `EXE_SPECIAL_INST: begin
                case (func)
                    //Arithmetic Instructions
                    `EXE_ADDU: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_ADD_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SUBU: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SUB_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MULT: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_MULT_OP;
                        //MEM
                        //WB
                            writeRegHiLo_o = `Enable;
                        //Exception
                            if (ins_i[15:6] == 10'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SLT: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_S_SLT_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SLTU: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_UNS_SLT_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    //Logic Instructions
                    `EXE_AND: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_AND_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_OR: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_OR_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_XOR: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_XOR_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_NOR: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_NOR_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    //Shift Instructions
                    `EXE_SLLV: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SLL_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SRLV: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SRL_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SRAV: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SRA_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SLL: begin
                        //Registers
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = shiftImm;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SLL_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rs == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SRL: begin
                        //Registers
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = shiftImm;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SRL_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rs == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_SRA: begin
                        //Registers
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = shiftImm;
                            operand2_o = regData2;
                            aluOp_o = `ALU_SRA_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rs == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    //Move Instructions
                    `EXE_MFHI: begin
                        //Registers
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regDataHi;
                            operand2_o = regDataLo;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rs == 5'h0 && rt == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MFLO: begin
                        //Registers
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regDataHi;
                            operand2_o = regDataLo;
                            aluOp_o = `ALU_PASS_2_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rs == 5'h0 && rt == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MTHI: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regDataLo;
                            aluOp_o = `ALU_PASS_HILO_OP;
                        //MEM
                        //WB
                            writeRegHiLo_o = `Enable;
                        //Exception
                            if (rt == 5'h0 && rd == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MTLO: begin
                        //Registers
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rs;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regDataHi;
                            operand2_o = regData2;
                            aluOp_o = `ALU_PASS_HILO_OP;
                        //MEM
                        //WB
                            writeRegHiLo_o = `Enable;
                        //Exception
                            if (rt == 5'h0 && rd == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MOVN: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            if (regData2 != `ZeroWord) begin
                                writeReg_o = `Enable;
                                writeRegAddr_o = rd;
                            end else begin
                                writeReg_o = `Disable;
                                writeRegAddr_o = 5'h0;
                            end
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_MOVZ: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                            regEnable2_o = `Enable;
                            regReadAddr2_o = rt;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            operand2_o = regData2;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            if (regData2 == `ZeroWord) begin
                                writeReg_o = `Enable;
                                writeRegAddr_o = rd;
                            end else begin
                                writeReg_o = `Disable;
                                writeRegAddr_o = 5'h0;
                            end
                        //Exception
                            if (sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    //Branch and Jump Instructions
                    `EXE_JR: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                        //PC
                            branchEnable_o = `Enable;
                            branchAddr_o = regData1;
                        //ID_EX
                            nextInDelaySlot_o = `Enable;
                        //EX
                        //MEM
                        //WB
                        //Exception
                            if (rt == 5'h0 && rd == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    `EXE_JALR: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                        //PC
                            branchEnable_o = `Enable;
                            branchAddr_o = regData1;
                        //ID_EX
                            nextInDelaySlot_o = `Enable;
                        //EX
                            operand1_o = nNextInsAddr;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rd;
                        //Exception
                            if (rt == 5'h0 && sa == 5'h0) begin
                                exception_o = exception_i;
                            end else begin
                                exception_o = `EXC_RI;
                            end
                    end
                    //Privileged Instuctions
                    `EXE_SYSCALL: begin
                        //Registers
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = syscallCode;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                        //Exception
                            exception_o = `EXC_SYS;
                    end
                    default: begin
                        exception_o = `EXC_RI;
                    end
                endcase
            end
            `EXE_REGIMM_INST: begin
                case (rt)
                    `EXE_BLTZ: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                        //Branch
                        if (regData1[31] == 1'b1) begin
                            //PC
                            branchEnable_o = `Enable;
                            branchAddr_o = nextInsAddr + offsetImm;
                            //ID_EX
                            nextInDelaySlot_o = `Enable;
                        end else begin
                            //PC
                            branchEnable_o = `Disable;
                            branchAddr_o = `ZeroWord;
                            //ID_EX
                            nextInDelaySlot_o = `Disable;
                        end
                        //EX
                        //MEM
                        //WB
                        //Exception
                            exception_o = exception_i;
                    end
                    `EXE_BGEZ: begin
                        //Registers
                            regEnable1_o = `Enable;
                            regReadAddr1_o = rs;
                        //Branch
                        if (regData1[31] == 1'b0) begin
                            //PC
                            branchEnable_o = `Enable;
                            branchAddr_o = nextInsAddr + offsetImm;
                            //ID_EX
                            nextInDelaySlot_o = `Enable;
                        end else begin
                            //PC
                            branchEnable_o = `Disable;
                            branchAddr_o = `ZeroWord;
                            //ID_EX
                            nextInDelaySlot_o = `Disable;
                        end
                        //EX
                        //MEM
                        //WB
                        //Exception
                            exception_o = exception_i;
                    end
                    default: begin
                        exception_o = `EXC_RI;
                    end
                endcase
            end
            //CP0 Instructions
            `EXE_CP0_INST: begin
                case(rs)
                    `EXE_MFC0:begin
                        //Registers
                            CP0ReadEnable_o = `Enable;
                            CP0ReadAddr_o = rd;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = CP0Data;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            writeReg_o = `Enable;
                            writeRegAddr_o = rt;
                        //Exception
                            if (ins_i[10:3] != 8'h0) begin
                                exception_o = `EXC_RI;
                            end else begin
                                exception_o = `EXC_MC0;
                            end
                    end
                    `EXE_MTC0: begin
                        //Registers
                            regReadAddr1_o = rt;
                            regEnable1_o = `Enable;
                        //PC
                        //ID_EX
                        //EX
                            operand1_o = regData1;
                            aluOp_o = `ALU_PASS_1_OP;
                        //MEM
                        //WB
                            writeCP0 = `Enable;
                            writeCP0Addr = rd;
                        //Exception
                            if (ins_i[10:3] != 8'h0) begin
                                exception_o = `EXC_RI;
                            end else begin
                                exception_o = `EXC_MC0;
                            end
                    end
                    `EXE_ET:begin
                        case (func)
                            `EXE_ERET: begin
                                //Registers
                                //PC
                                //ID_EX
                                //EX
                                //MEM
                                //WB
                                //Exception
                                    if ({rt, rd, sa} != 15'h0) begin
                                        exception_o = `EXC_RI;
                                    end else begin
                                        exception_o = `EXC_ERET;
                                    end
                            end
                            `EXE_TLBWI: begin
                                //Registers
                                //PC
                                //ID_EX
                                //EX
                                //MEM
                                //WB
                                //Exception
                                    if ({rt, rd, sa} != 15'h0) begin
                                        exception_o = `EXC_RI;
                                    end else begin
                                        exception_o = `EXC_TLBWI;
                                    end
                            end
                            `EXE_TLBWR: begin
                                    if ({rt, rd, sa} != 15'h0) begin
                                        exception_o = `EXC_RI;
                                    end else begin
                                        exception_o = `EXC_TLBWI;
                                    end
                            end
                            default: begin
                                exception_o = `EXC_RI;
                            end
                        endcase
                    end
                    default: begin
                        exception_o = `EXC_RI;
                    end
                endcase
            end
            //Arithmetic Instructions
            `EXE_ADDIU: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_SLTI: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_S_SLT_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_SLTIU: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_UNS_SLT_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            //Logic Instructions
            `EXE_ORI: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = zeroImm;
                    aluOp_o = `ALU_OR_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_ANDI: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = zeroImm;
                    aluOp_o = `ALU_AND_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_XORI: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = zeroImm;
                    aluOp_o = `ALU_XOR_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_LUI: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //PC
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = upperImm;
                    aluOp_o = `ALU_OR_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    if (rs == 5'h0) begin
                        exception_o = exception_i;
                    end else begin
                        exception_o = `EXC_RI;
                    end
            end
            //Branch and Jump Instructions
            `EXE_J: begin
                //Registers
                //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = branchTarget;
                //ID_EX
                    nextInDelaySlot_o = `Enable;
                //EX
                //MEM
                //WB
                //Exception
                    exception_o = exception_i;
            end
            `EXE_JAL: begin
                //Registers
                //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = branchTarget;
                //ID_EX
                    nextInDelaySlot_o = `Enable;
                //EX
                    operand1_o = nNextInsAddr;
                    operand2_o = `ZeroWord;
                    aluOp_o = `ALU_PASS_1_OP;
                //MEM
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = 5'b11111;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_BEQ: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                    regEnable2_o = `Enable;
                    regReadAddr2_o = rt;
                //Branch
                if (regData1 == regData2) begin
                    //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = nextInsAddr + offsetImm;
                    //ID_EX
                    nextInDelaySlot_o = `Enable;
                end else begin
                    //PC
                    branchEnable_o = `Disable;
                    branchAddr_o = `ZeroWord;
                    //ID_EX
                    nextInDelaySlot_o = `Disable;
                end
                //EX
                //MEM
                //WB
                //Exception
                    exception_o = exception_i;
            end
            `EXE_BNE: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                    regEnable2_o = `Enable;
                    regReadAddr2_o = rt;
                //Branch
                if (regData1 != regData2) begin
                    //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = nextInsAddr + offsetImm;
                    //ID_EX
                    nextInDelaySlot_o = `Enable;
                end else begin
                    //PC
                    branchEnable_o = `Disable;
                    branchAddr_o = `ZeroWord;
                    //ID_EX
                    nextInDelaySlot_o = `Disable;
                end
                //EX
                //MEM
                //WB
                //Exception
                    exception_o = exception_i;
            end
            `EXE_BLEZ: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //Branch
                if (regData1[31] == 1'b1 || regData1 == `ZeroWord) begin
                    //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = nextInsAddr + offsetImm;
                    //ID_EX
                    nextInDelaySlot_o = `Enable;
                end else begin
                    //PC
                    branchEnable_o = `Disable;
                    branchAddr_o = `ZeroWord;
                    //ID_EX
                    nextInDelaySlot_o = `Disable;
                end
                //EX
                //MEM
                //WB
                //Exception
                    if (rt == 5'h0) begin
                        exception_o = exception_i;
                    end else begin
                        exception_o = `EXC_RI;
                    end
            end
            `EXE_BGTZ: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //Branch
                if (regData1[31] == 1'b0 && regData1 != `ZeroWord) begin
                    //PC
                    branchEnable_o = `Enable;
                    branchAddr_o = nextInsAddr + offsetImm;
                    //ID_EX
                    nextInDelaySlot_o = `Enable;
                end else begin
                    //PC
                    branchEnable_o = `Disable;
                    branchAddr_o = `ZeroWord;
                    //ID_EX
                    nextInDelaySlot_o = `Disable;
                end
                //EX
                //MEM
                //WB
                //Exception
                    if (rt == 5'h0) begin
                        exception_o = exception_i;
                    end else begin
                        exception_o = `EXC_RI;
                    end
            end
            //Load and Store Instructions
            `EXE_LB: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //Branch
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                    storeData_o = `ZeroWord;
                    memOp_o = `MEM_LB_OP;
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_LBU: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //Branch
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                    storeData_o = `ZeroWord;
                    memOp_o = `MEM_LBU_OP;
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_LW: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                //Branch
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                    storeData_o = `ZeroWord;
                    memOp_o = `MEM_LW_OP;
                //WB
                    writeReg_o = `Enable;
                    writeRegAddr_o = rt;
                //Exception
                    exception_o = exception_i;
            end
            `EXE_SB: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                    regEnable2_o = `Enable;
                    regReadAddr2_o = rt;
                //Branch
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                    storeData_o = regData2;
                    memOp_o = `MEM_SB_OP;
                //WB
                //Exception
                    exception_o = exception_i;
            end
            `EXE_SW: begin
                //Registers
                    regEnable1_o = `Enable;
                    regReadAddr1_o = rs;
                    regEnable2_o = `Enable;
                    regReadAddr2_o = rt;
                //Branch
                //ID_EX
                //EX
                    operand1_o = regData1;
                    operand2_o = signImm;
                    aluOp_o = `ALU_ADD_OP;
                //MEM
                    storeData_o = regData2;
                    memOp_o = `MEM_SW_OP;
                //WB
                //Exception
                    exception_o = exception_i;
            end
            default: begin
                exception_o = `EXC_RI;
            end
		endcase
    end
endmodule