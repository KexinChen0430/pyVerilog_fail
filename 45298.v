module ex(
	//input
	//EX
    input wire[31:0] insAddr_i,
	input wire[4:0] aluOp_i,
	input wire[31:0] operand1_i,
	input wire[31:0] operand2_i,
	//MEM
    input wire[31:0] storeData_i,
    input wire[2:0] memOp_i,
	//WB
	input wire[4:0] writeRegAddr_i,
	input wire writeReg_i,
    input wire writeRegHiLo_i,
    input wire writeCP0_i,
    input wire[4:0] writeCP0Addr_i,
    //Exception
    input wire inDelaySlot_i,
    input wire[3:0] exception_i,
    input wire[31:0] badVAddr_i,
	//output
	//MEM-WB
	output reg[31:0] writeData_o,
	//MEM
    output reg[31:0] insAddr_o,
    output reg[31:0] storeData_o,
    output reg[2:0] memOp_o,
	//WB
	output reg[4:0] writeRegAddr_o,
	output reg writeReg_o,
    output reg[31:0] writeDataHi_o,
    output reg[31:0] writeDataLo_o,
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
        //MEM
        insAddr_o = insAddr_i;
        storeData_o = storeData_i;
        memOp_o = memOp_i;
        //WB
        writeReg_o = writeReg_i;
        writeRegAddr_o = writeRegAddr_i;
        writeRegHiLo_o = writeRegHiLo_i;
        writeCP0_o = writeCP0_i;
        writeCP0Addr_o = writeCP0Addr_i;
        //Exception
        inDelaySlot_o = inDelaySlot_i;
        exception_o = exception_i;
        badVAddr_o = badVAddr_i;
	end
    //writeDataHiLo
    always @(*) begin
        case (aluOp_i)
            `ALU_MULT_OP: begin
                {writeDataHi_o, writeDataLo_o} = $signed(operand1_i) * $signed(operand2_i);
            end
            `ALU_PASS_HILO_OP: begin
                writeDataHi_o = operand1_i;
                writeDataLo_o = operand2_i;
            end
        default: begin
            writeDataHi_o = `ZeroWord;
            writeDataLo_o = `ZeroWord;
        end
        endcase
    end
    //writeData
    always @(*) begin
        case (aluOp_i)
            `ALU_ADD_OP: begin
                writeData_o = operand1_i + operand2_i;
            end
            `ALU_SUB_OP: begin
                writeData_o = operand1_i - operand2_i;
            end
            `ALU_S_SLT_OP: begin
                writeData_o = ($signed(operand1_i) < $signed(operand2_i)) ? 32'b1 : 32'b0;
            end
            `ALU_UNS_SLT_OP: begin
                writeData_o = (operand1_i < operand2_i) ? 32'b1 : 32'b0;
            end
            `ALU_OR_OP: begin
				writeData_o = operand1_i | operand2_i;
			end
            `ALU_AND_OP: begin
                writeData_o = operand1_i & operand2_i;
            end
            `ALU_XOR_OP: begin
                writeData_o = operand1_i ^ operand2_i;
            end
            `ALU_NOR_OP: begin
                writeData_o = ~(operand1_i | operand2_i);
            end
            `ALU_SLL_OP: begin
                writeData_o = operand2_i << operand1_i[4:0];
            end
            `ALU_SRL_OP: begin
                writeData_o = operand2_i >> operand1_i[4:0];
            end
            `ALU_SRA_OP: begin
                case (operand1_i[4:0])
                    0: writeData_o = operand2_i;
                    1: writeData_o = {operand2_i[31], operand2_i[31:1]};
                    2: writeData_o = {{2{operand2_i[31]}}, operand2_i[31:2]};
                    3: writeData_o = {{3{operand2_i[31]}}, operand2_i[31:3]};
                    4: writeData_o = {{4{operand2_i[31]}}, operand2_i[31:4]};
                    5: writeData_o = {{5{operand2_i[31]}}, operand2_i[31:5]};
                    6: writeData_o = {{6{operand2_i[31]}}, operand2_i[31:6]};
                    7: writeData_o = {{7{operand2_i[31]}}, operand2_i[31:7]};
                    8: writeData_o = {{8{operand2_i[31]}}, operand2_i[31:8]};
                    9: writeData_o = {{9{operand2_i[31]}}, operand2_i[31:9]};
                    10: writeData_o = {{10{operand2_i[31]}}, operand2_i[31:10]};
                    11: writeData_o = {{11{operand2_i[31]}}, operand2_i[31:11]};
                    12: writeData_o = {{12{operand2_i[31]}}, operand2_i[31:12]};
                    13: writeData_o = {{13{operand2_i[31]}}, operand2_i[31:13]};
                    14: writeData_o = {{14{operand2_i[31]}}, operand2_i[31:14]};
                    15: writeData_o = {{15{operand2_i[31]}}, operand2_i[31:15]};
                    16: writeData_o = {{16{operand2_i[31]}}, operand2_i[31:16]};
                    17: writeData_o = {{17{operand2_i[31]}}, operand2_i[31:17]};
                    18: writeData_o = {{18{operand2_i[31]}}, operand2_i[31:18]};
                    19: writeData_o = {{19{operand2_i[31]}}, operand2_i[31:19]};
                    20: writeData_o = {{20{operand2_i[31]}}, operand2_i[31:20]};
                    21: writeData_o = {{21{operand2_i[31]}}, operand2_i[31:21]};
                    22: writeData_o = {{22{operand2_i[31]}}, operand2_i[31:22]};
                    23: writeData_o = {{23{operand2_i[31]}}, operand2_i[31:23]};
                    24: writeData_o = {{24{operand2_i[31]}}, operand2_i[31:24]};
                    25: writeData_o = {{25{operand2_i[31]}}, operand2_i[31:25]};
                    26: writeData_o = {{26{operand2_i[31]}}, operand2_i[31:26]};
                    27: writeData_o = {{27{operand2_i[31]}}, operand2_i[31:27]};
                    28: writeData_o = {{28{operand2_i[31]}}, operand2_i[31:28]};
                    29: writeData_o = {{29{operand2_i[31]}}, operand2_i[31:29]};
                    30: writeData_o = {{30{operand2_i[31]}}, operand2_i[31:30]};
                    31: writeData_o = {{32{operand2_i[31]}}};
                    default: writeData_o = `ZeroWord;
                endcase
            end
            `ALU_PASS_1_OP: begin
                writeData_o = operand1_i;
            end
            `ALU_PASS_2_OP: begin
                writeData_o = operand2_i;
            end
            default: begin
                writeData_o = `ZeroWord;
            end
        endcase
    end
endmodule