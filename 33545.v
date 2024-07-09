module outputs)
  wire [3:0]		alu__sel;		// From Decoder of mips_decode.v
  wire			ctrl_RI;		// From Decoder of mips_decode.v
  wire			ctrl_Sys;		// From Decoder of mips_decode.v
  wire			ctrl_we;		// From Decoder of mips_decode.v
  // End of automatics
  // Generate control signals
  mips_decode Decoder(/*AUTOINST*/
 	      // Outputs
 	      .ctrl_we		(ctrl_we),
 	      .ctrl_Sys	(ctrl_Sys),
 	      .ctrl_RI		(ctrl_RI),
 	      .alu__sel	(alu__sel[3:0]),
 	      // Inputs
 	      .dcd_op		(dcd_op[5:0]),
 	      .dcd_funct2	(dcd_funct2[5:0]));
  // Register File
  // Instantiate the register file from reg_file.v here.
  // Don't forget to hookup the "halted" signal to trigger the register dump
  mips_regFile RegFile(
        .clk (clk),
        .rst_n (rst_b),
        .rdAddr0 (dcd_rs),
        .rdAddr1 (dcd_rt),
        .we (ctrl_we),
        .wrAddr (dcd_rd),
        .wrData (alu__out),
        .halted (internal_halt),
        .rdData0 (rs_data),
        .rdData1 (rt_data));
  // synthesis translate_off
  initial begin
    // Delete this block when you are ready to try for real
    $display("");
    $display("");
    $display("");
    $display("");
    $display(">>>>> This works much better after you have hooked up the reg file. <<<<<");
    $display("");
    $display("");
    $display("");
    $display("");
    $finish;
  end
  // synthesis translate_on
  mux2_1 #(32) se_e_MUX(dcd_se_imm, dcd_e_imm, isSe, imm_value);
  mux2_1 #(32) aluOP2(imm_value, rt_data, isImm, alu_op2);
  // Execute
  mips_alu ALU(.alu__out(alu__out),
               .alu__op1(rs_data),
               .alu__op2(alu_op2),
               .alu__sel(alu__sel));
  // Miscellaneous stuff (Exceptions, syscalls, and halt)
  mips_exceptionUnit EU(.exception_halt(exception_halt), .pc(pc), .rst_b(rst_b),
                    .clk(clk), .load_ex_regs(load_ex_regs),
                    .load_bva(load_bva), .load_bva_sel(load_bva_sel),
                    .cause(cause_code),
                    .IBE(inst_excpt),
                    .DBE(1'b0),
                    .RI(ctrl_RI),
                    .Ov(1'b0),
                    .BP(1'b0),
                    .AdEL_inst(pc[1:0]?1'b1:1'b0),
                    .AdEL_data(1'b0),
                    .AdES(1'b0),
                    .CpU(1'b0));
  assign r_v0 = 32'h0a; // Good enough for now. To support syscall for real,
                        // you should read the syscall
                        // argument from $v0 of the register file
  mips_syscallUnit SU(.syscall_halt(syscall_halt), .pc(pc), .clk(clk), .Sys(ctrl_Sys),
                  .r_v0(r_v0), .rst_b(rst_b));
  assign        internal_halt = exception_halt | syscall_halt;
  mips_reg #(1, 0) Halt(halted, internal_halt, clk, 1'b1, rst_b);
  mips_reg #(32, 0) EPCReg(epc, pc, clk, load_ex_regs, rst_b);
  mips_reg #(32, 0) CauseReg(cause,
                             {25'b0, cause_code, 2'b0},
                             clk, load_ex_regs, rst_b);
  mips_reg #(32, 0) BadVAddrReg(bad_v_addr, pc, clk, load_bva, rst_b);
endmodule