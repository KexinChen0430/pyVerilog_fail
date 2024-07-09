module riscv_tb ();
parameter    ADDI  = 1;
parameter    ORI   = 2;
parameter    XORI  = 3;
parameter    ANDI  = 4;
parameter    SLTI  = 5;
parameter    SLTUI = 6;
parameter    SLLI  = 7;
parameter    SRLI  = 8;
parameter    SRAI  = 9;
parameter    LUI   = 10;
parameter    AUIPC = 11;
parameter    ADD   = 12;
parameter    SUB   = 13;
parameter    OR    = 14;
parameter    XOR   = 15;
parameter    AND   = 16;
parameter    SLT   = 17;
parameter    SLTU  = 18;
parameter    SLL   = 19;
parameter    SRL   = 20;
parameter    SRA   = 21;
parameter    JALR  = 22;
parameter    JAL   = 23;
parameter    SB    = 24;
parameter    SH    = 25;
parameter    SW    = 26;
parameter    LB    = 27;
parameter    LH    = 28;
parameter    LW    = 29;
parameter    LBU   = 30;
parameter    LHU   = 31;
parameter    BEQ   = 32;
parameter    BNE   = 33;
parameter    BLT   = 34;
parameter    BLTU  = 35;
parameter    BGE   = 36;
parameter    BGEU  = 37;
random_pool #(3, 32) instr_pool  ();
reg success;
reg [31:0] instr;
initial begin
/*
 */
    encoding_add(
    instr_pool.add_to_pool(SLTU, success);
    instr_pool.add_to_pool(SRA,  success);
    instr_pool.add_to_pool(JALR, success);
    instr_pool.shuffle(success);
    instr_pool.get_top(instr);
    instr_pool.get_top(instr);
    instr_pool.get_top(instr);
    instr_pool.get_top(instr);
end
endmodule