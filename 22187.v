module instantiations
    reg32		PC(clk, reset, pc_next, pc);
    add32 		PCADD(pc, 32'd4, pc_incr);
    add32 		BRADD(pc_incr, b_offset, b_tgt);
    reg_file	RFILE(clk, RegWrite, rs, rt, rfile_wn, rfile_rd1, rfile_rd2, rfile_wd);
    alu 		ALU(Operation, rfile_rd1, alu_b, alu_out, Zero);
    rom32 		IMEM(pc, instr);
    mem32 		DMEM(clk, MemRead, MemWrite, alu_out, rfile_rd2, dmem_rdata);
    xor  		BR_XOR(Zero2, opcode[0], Zero);
    and  		BR_AND(PCSrc, Branch, Zero2);
    mux2 #(5) 	RFMUX(RegDst, rt, rd, rfile_wn);
    mux2 #(32)	PCMUX(PCSrc, pc_incr, b_tgt, pc_next2);
    mux2 #(32) JMUX(Jmp, pc_next2, jumpTo, pc_next); // control, input, output
    mux2 #(32) ALUMUX(ALUSrc, rfile_rd2, extend_immed, alu_b);
    mux2 #(32)	WRMUX(MemtoReg, alu_out, dmem_rdata, rfile_wd);
    control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg),
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch),
                       .Jmp(Jmp), .ALUOp(ALUOp));
    alu_ctl 	ALUCTL(ALUOp, funct, Operation);
endmodule