module
output reg rw_d;
output reg dm_access_size;
always @(ALUOp, rsData, rtData)
begin : EXECUTE
	if (enable_execute == 1) begin
	branch_taken = 0;
	if(insn[31:26] == RTYPE) begin
		case (ALUOp)
			ADD: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData + rtData;
				rw_d = 0;
				dm_we = 0;
			end
			ADDU: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData + rtData;
				rw_d = 0;
				dm_we = 0;
			end
			SUB: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData - rtData;
				rw_d = 0;
				dm_we = 0;
			end
			SUBU: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData - rtData;
				rw_d = 0;
				dm_we = 0;
			end
			MUL_FUNC: begin
				temp = rsData * rtData;
				dataOut = temp[31:0];
			end
			DIV: begin
				temp = rsData / rtData;
				hi = temp[63:32];	// remainder
				lo = temp[31:0];	// quotient
			end
			DIVU: begin
				temp = rsData / rtData;
				hi = temp[63:32];	// remainder
				lo = temp[31:0];	// quotient
			end
			MFHI: begin
				dataOut = hi;
			end
			MFLO: begin
				dataOut = lo;
			end
			SLT: begin
				if (rsData < rtData) begin
					dataOut = 32'h00000001;
				end else begin
					dataOut = 32'h00000000;
				end
			end
			SLTU: begin
				if (rsData < rtData) begin
					dataOut = 32'h00000001;
				end else begin
					dataOut = 32'h00000000;
				end
			end
			SLL: begin
				dataOut = rtData << saData;
			end
			SLLV: begin
				dataOut = rtData << rsData;
			end
			SRL: begin
				dataOut = rtData >> saData;
			end
			SRLV: begin
				dataOut = rtData >> rsData;
			end
			SRA: begin
				dataOut = rtData >>> saData;
			end
			SRAV: begin
				dataOut = rtData >>> rsData;
			end
			AND: begin
				dataOut = rsData & rtData;
			end
			OR: begin
				dataOut = rsData | rtData;
			end
			XOR: begin
				dataOut = rsData ^ rtData;
			end
			NOR: begin
				dataOut = ~(rsData | rtData);
			end
			JR: begin
				dataOut = rsData;
				branch_taken = 1;
			end
			JALR: begin
				dataOut = (pc + 8);
				//pc_out_execute = rsData
				branch_taken = 1;
			end
		endcase
	end else if (insn[31:26] != 6'b000000 && insn[31:27] != 5'b00001 && insn[31:26] != 6'b000001) begin
		case (ALUOp)
			ADDI: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData + immSXData[15:0];
				rw_d = 0;
				dm_we = 0;
			end
			ADDIU: begin
				//writeback dataOut to regfile, bypass DMem
				//dataOut is data_in_alu in writeback
				dataOut = rsData + immSXData[15:0];
				rw_d = 0;
				dm_we = 0;
			end
			SLTI: begin
				if (rsData < immSXData[15:0]) begin
					dataOut = 32'h00000001;
				end else begin
					dataOut = 32'h00000000;
				end
			end
			SLTIU: begin
				if (rsData < immSXData[15:0]) begin
					dataOut = 32'h00000001;
				end else begin
					dataOut = 32'h00000000;
				end
			end
			ORI: begin
				dataOut = rsData | immSXData[15:0];
			end
			XORI: begin
				dataOut = rsData ^ immSXData[15:0];
			end
			LW: begin
				// TODO: MEMTYPE
				dm_we = 0;	//read from memory
				dm_access_size = 2'b0_0; // 1 WORD
				rw_d = 1;
				// rt <= MEM[rs + SX(imm,32)]
				// dataOut MEM ADDR of data to load
				// dataOut goes to input a of DMEM
				// writeback mem contents at MEM[dataOut] to regfile
				dataOut = rsData + immSXData[15:0];
			end
			SW: begin
				// TODO: MEMTYPE
				dm_we = 1;
				dm_access_size = 2'b0_0; // 1 WORD
				rw_d = 0;
				// MEM[rs + SX(imm)] <= rt
				// dataOut has MEM ADDR to store rt
				// get rt straight from output of decode
				// rt is input d of data memory
				// dataOut is input a of data memory
				// no writeback, disable regfile we
				// store value of rt in MEM[dataOut]
				dataOut = rsData + immSXData[15:0];
			end
			LB: begin
				// TODO: MEMTYPE (modify access size)
				// First get LW to work, then do this
				dataOut = rsData + immSXData[15:0];
			end
			LUI: begin
				// TODO: MEMTYPE
				//dataOut = immSXData[15:0] << 16;
				dataOut = {immSXData[15:0], 16'd0};
			end
			SB: begin
				// TODO: MEMTYPE (modify access size)
				dataOut = rsData + immSXData[15:0];
			end
			LBU: begin
				// TODO: MEMTYPE
				dataOut = rsData + immSXData[15:0];
			end
			BEQ: begin
		        	if (rsData == rtData) begin
		        		dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
			BNE: begin
				if (rsData != rtData) begin
					dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
			BGTZ: begin
				if (rsData > 0) begin
					dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
			BLEZ: begin
				if (rsData <= 0) begin
					dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
		endcase
	end else if (insn[31:26] == 6'b000001) begin
		// REGIMM
		case(ALUOp)
			BLTZ: begin
				if (rsData < 0) begin
					dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
			BGEZ: begin
				if (rsData >= 0) begin
			        	dataOut = pc + (immSXData[15:0] << 2);
					branch_taken = 1;
				end else begin
					branch_taken = 0;
				end
			end
		endcase
	end else if (insn[31:27] == 5'b00001) begin
		// J-Type
		case (ALUOp)
			J: begin
				dataOut[31:28] = pc[31:28];
				dataOut[27:0] = immSXData[25:0] << 2;
				branch_taken = 1;
			end
			JAL: begin
				dataOut = pc + 8;
				branch_taken = 1;
			end
		endcase
	end else if (insn == NOP) begin
		dataOut = dataOut;
	end
end
end
endmodule