module.
alu X0 (
	.clock (clock),
	.enable_execute (enable_execute),
	.pc (pc_execute),
	.insn (insn_execute),
	.rsData (rsData_execute),
	.rtData (rtData_execute),
	.saData (saData_execute),
	.ALUOp (ALUOp_execute),
	.immSXData (imm_execute),
	.dataOut (dataOut_execute),
	.branch_taken (branch_taken_execute)
);
initial begin
	fd = $fopen("SimpleAdd.x", "r");
	if (!fd)
		$display("Could not open");
	clock = 0;
	address = start_addr;
	scan_fd = $fscanf(fd, "%x", data_in);
	access_size = 2'b0_0;
	enable = 1;
	rw = 0;		// Start writing first.
	words_read = 0;
	words_written = 1;
	words_fetched = 0;
	words_decoded = 0;
	words_executed = 0;
	words_processed = 0;
	words_run = 0;
	fetch_not_enabled = 1;
	decode_not_enabled = 1;
	execute_not_enabled = 1;
	stall = 0;
end
always 	@(posedge clock) begin: POPULATE
	if (rw == 0) begin
		enable = 1;
		//rw = 0;
		scan_fd = $fscanf(fd, "%x", line);
		if (!$feof(fd)) begin
			data_in = line;
			$display("line = %x", data_in);
			address = address + 4;
			words_written = words_written + 1;
		end
		else begin: ENDWRITE
			rw <= 1;
			address <= 32'h80020000;
			//enable_fetch <= 1;
			stall = 0;
		end
	end
	if (rw == 1 && fetch_not_enabled == 1) begin : ENABLEFETCH
		//address <= 32'h80020000;
		//pc_decode <= pc_fetch;
		enable_fetch <= 1;
		fetch_not_enabled = 0;
	end
	if (enable_fetch && (words_fetched <= words_written)) begin : FETCHSTAGE
		address = pc_fetch;
		insn_decode <= data_out;
		pc_from_fetch_temp <= pc_fetch;
		pc_decode = pc_from_fetch_temp;
		words_fetched <= words_fetched + 1;
		//enable_decode <= 1;
	end
	if ((rw_fetch == 1) && (decode_not_enabled == 1)) begin : ENABLEDECODE
		//address <= 32'h80020000;
		enable_decode <= 1;
		decode_not_enabled = 0;
	end
	if (enable_decode && (words_decoded <= words_written)) begin : DECODESTAGE
		//pc_decode <= pc_fetch;
		//pc_decode = pc_from_fetch_temp;
		opcode_out_tb = opcode_out;
		rs_out_tb = rs_out;
		rt_out_tb = rt_out;
		rd_out_tb = rd_out;
		sa_out_tb = sa_out;
		func_out_tb = func_out;
		imm_out_tb = imm_out;
		pc_out_tb = pc_out;
		insn_out_tb = insn_decode_out;
		rsOut_regfile_tb = rsOut_regfile;
		rtOut_regfile_tb = rtOut_regfile;
		imm_out_sx_decode_tb = imm_out_sx_decode;
		pc_from_decode_temp <= pc_out;
		//pc_execute = pc_from_decode_temp;
		insn_execute_temp <= insn_decode;
		//insn_execute = insn_execute_temp;
		enable_execute <= 1;
		words_decoded <= words_decoded + 1;
		if (opcode_out_tb == 6'b000000 && rs_out_tb == 5'b00000 && rt_out_tb == 5'b00000 && rd_out_tb == 5'b00000 && sa_out_tb == 5'b00000 && func_out_tb == 6'b000000) begin
			$display("%x:\t%x\tNOP", pc_out_tb, insn_out_tb);
		end else if (opcode_out_tb == RTYPE || opcode_out_tb == MUL_OP) begin
			// INSN is R-TYPE (including MUL, which has a non-zer0 opcode)
			case (func_out_tb)
				ADD: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tADD RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				ADDU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tADDU RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SUB: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSUB RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SUBU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSUBU RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				MUL_FUNC: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tMUL RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				MULT: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tMULT RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				MULTU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tMULTU RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				DIV: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tDIV RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				DIVU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tDIVU RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				MFHI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tMFHI RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				MFLO: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tMFLO RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SLT: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLT RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SLTU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLTU RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SLL: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLL RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SLLV: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLLV RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SRL: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSRL RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SRLV: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSRLV RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SRA: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSRA RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				SRAV: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSRAV RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				AND: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tAND RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				OR: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tOR RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				XOR: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tXOR RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				NOR: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tNOR RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				JALR: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tJALR RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
				JR: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tJR RS=%b RT=%b RD=%b SA=%b rsOut_regfile=%b rtOut_regfile=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, rsOut_regfile_tb, rtOut_regfile_tb);
					end
				end
			endcase
		end else if (opcode_out_tb != 6'b000000 && opcode_out_tb[5:1] != 5'b00001) begin
			// INSN is I-TYPE
			case (opcode_out_tb)
				ADDI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tADDI RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				ADDIU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tADDIU RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				SLTI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLTI RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				SLTIU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSLTIU RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				ORI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tORI RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				XORI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tXORI RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				LW: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tLW RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				SW: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSW RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				LB: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tLB RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				LUI: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tLUI RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				SB: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tSB RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				LBU: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tLBU RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				BEQ: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tBEQ RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				BNE: begin
					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tBNE RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
				BGTZ: begin
  					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tBGTZ RS=%b RT=%b rsOut_regfile=%b IMM=%b", pc_out_tb, insn_out_tb, rs_out_tb, rt_out_tb, rsOut_regfile_tb, imm_out_tb[25:10]);
					end
				end
			endcase
		end else if (opcode_out_tb[5:1] == 5'b00001) begin
			// INSN is J-Type
			case (opcode_out_tb)
				J: begin
  					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tJ IMM=%b", pc_out_tb, insn_out_tb, imm_out_tb);
					end
				end
				JAL: begin
  					if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
						words_processed = words_processed + 1;
						$display("%x:\t%x\tJAL IMM=%b", pc_out_tb, insn_out_tb, imm_out_tb);
					end
				end
			endcase
		end else
			if((words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_processed < words_written)) begin
				words_processed = words_processed + 1;
				$display("PC=%x INSN=%x OPCODE=%b RS/BASE=%b RT=%b RD=%b SA/OFFSET=%b IMM=%b FUNC=%b", pc_out_tb, insn_out_tb, opcode_out_tb, rs_out_tb, rt_out_tb, rd_out_tb, sa_out_tb, imm_out_tb, func_out_tb);
			end
		end
	if (words_decoded > 0) begin : ENABLEEXECUTE
		//enable_execute = 1;
		execute_not_enabled = 0;
		we_regfile <= 1;
	end
	if (enable_execute == 1 && execute_not_enabled == 0 && words_executed <= words_written) begin : EXECUTESTAGE
		dataOut_execute_tb = dataOut_execute;
		branch_taken_tb = branch_taken_execute;
		pc_execute = pc_from_decode_temp;
		rsData_execute <= rsOut_regfile;
		rtData_execute <= rtOut_regfile;
		saData_execute <= sa_out;
		imm_execute <= imm_out_sx_decode;
		ALUOp_execute <= ALUOp_decode;
		insn_execute <= insn_execute_temp;
		dVal_regfile <= dataOut_execute;
		we_regfile <= 0;
		words_executed <= words_executed + 1;
		if((words_executed > 0) && (words_decoded > 0) && (words_fetched > 0) && enable_fetch && enable_decode && (words_run < words_written)) begin
			words_run = words_run + 1;
			if (branch_taken_tb == 1) begin
				$display("%x INSN=%x ALUOp_execute=%b DATAOUT=%x branch_taken=%b", pc_execute, insn_execute, ALUOp_execute, dataOut_execute_tb, branch_taken_tb);
			end else begin
				$display("%x INSN=%x ALUOp_execute=%b DATAOUT=%x branch_taken=NA", pc_execute, insn_execute, ALUOp_execute, dataOut_execute_tb);
			end
		end
	end
end
always
	#5 clock = ! clock;
endmodule