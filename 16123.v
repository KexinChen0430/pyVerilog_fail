module ARMStb();
reg  [31:0] instrbus;
reg  [31:0] instrbusin[0:156];
wire [63:0] iaddrbus, daddrbus;
reg  [63:0] iaddrbusout[0:156], daddrbusout[0:156];
wire [63:0] databus;
reg  [63:0] databusk, databusin[0:156], databusout[0:156];
reg         clk, reset;
reg         clkd;
reg [63:0] dontcare;
reg [24*8:1] iname[0:156];
integer error, k, ntests;
//all opcode parameters to be used
parameter ADD    = 11'b10001011000;
parameter ADDI   = 10'b1001000100;
parameter ADDIS  = 10'b1011000100;
parameter ADDS   = 11'b10101011000;
parameter AND    = 11'b10001010000;
parameter ANDI   = 10'b1001001000;
parameter ANDIS  = 10'b1111001000;
parameter ANDS   = 11'b11101010000;
parameter CBNZ   =  8'b10110101;
parameter CBZ    =  8'b10110100;
parameter EOR    = 11'b11001010000;
parameter EORI   = 10'b1101001000;
parameter LDUR   = 11'b11111000010;
parameter LSL    = 11'b11010011011;
parameter LSR    = 11'b11010011010;
parameter MOVZ   =  9'b110100101;
parameter ORR    = 11'b10101010000;
parameter ORRI   = 10'b1011001000;
parameter STUR   = 11'b11111000000;
parameter SUB    = 11'b11001011000;
parameter SUBI   = 10'b1101000100;
parameter SUBIS  = 10'b1111000100;
parameter SUBS   = 11'b11101011000;
parameter B      =  6'b000101;
parameter B_EQ   =  8'b01010101;
parameter B_NE   =  8'b01010110;
parameter B_LT   =  8'b01010111;
parameter B_GE   =  8'b01011000;
//register parameters
parameter R0  = 5'b00000;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;
//other parameterz to be used
parameter zeroSham   = 6'b000000;
parameter RX         = 5'b11111;
parameter oneShamt   = 6'b000001;//shifts 1 bit
parameter twoShamt   = 6'b000010;
parameter threeShamt = 6'b000011;
parameter fourShamt  = 6'b000100;//moves 1 hex place
parameter eightShamt = 6'b001000;//moves 2 hex place
parameter move_0     = 2'b00;
parameter move_1     = 2'b01;
parameter move_2     = 2'b10;
parameter move_3     = 2'b11;
ARMS dut(.reset(reset),.clk(clk),.iaddrbus(iaddrbus),.ibus(instrbus),.daddrbus(daddrbus),.databus(databus));
initial begin
dontcare = 64'hx;
//phase 1: testing basic op commands
//                op,   rd,  rn,  rm
iname[0]        ="ADDI, R20, R31, #AAA";//testing addi, result in R20 = 0000000000000AAA
iaddrbusout[0]  = 64'h00000000;
//                opcode rm/ALUImm rn   rd
instrbusin[0]   ={ADDI,  12'hAAA,  R31, R20};
daddrbusout[0]  = dontcare;
databusin[0]    = 64'bz;
databusout[0]   = dontcare;
//                op,   rd,  rn,  rm
iname[1]        ="ADDI, R31, R23, #002";//testing addi on R31, result in R31 = 0000000000000000
iaddrbusout[1]  = 64'h00000004;
//                opcode rm/ALUImm rn   rd
instrbusin[1]   ={ADDI,  12'h002,  R23, R31};
daddrbusout[1]  = dontcare;
databusin[1]    = 64'bz;
databusout[1]   = dontcare;
//                op,   rd,  rn,  rm
iname[2]        ="ADDI, R0,  R23, #002";//testing addi on R0, result in R0 = 0000000000000002
iaddrbusout[2]  = 64'h00000008;
//                opcode rm/ALUImm rn   rd
instrbusin[2]   ={ADDI,  12'h002,  R23, R0};
daddrbusout[2]  = dontcare;
databusin[2]    = 64'bz;
databusout[2]   = dontcare;
//                op,   rd,  rn,  rm
iname[3]        ="ORRI, R21, R24, #001";//testing ori, result in R21 = 0000000000000001
iaddrbusout[3]  = 64'h0000000C;
//                opcode rm/ALUImm rn   rd
instrbusin[3]   ={ORRI,  12'h001,  R24, R21};
daddrbusout[3]  = dontcare;
databusin[3]    = 64'bz;
databusout[3]   = dontcare;
//                op,   rd,  rn,  rm
iname[4]        ="EORI, R22, R20, #000";//testing xori, result in R22 = 0000000000000AAA
iaddrbusout[4]  = 64'h00000010;
//                opcode rm/ALUImm rn   rd
instrbusin[4]   ={EORI,  12'h000,  R20, R22};
daddrbusout[4]  = dontcare;
databusin[4]    = 64'bz;
databusout[4]   = dontcare;
//                op,   rd,  rn,  rm
iname[5]        ="ANDI, R23, R0,  #003";//testing andi, result in R23 = 0000000000000002
iaddrbusout[5]  = 64'h00000014;
//                opcode rm/ALUImm rn   rd
instrbusin[5]   ={ANDI,  12'h003,  R0, R23};
daddrbusout[5]  = dontcare;
databusin[5]    = 64'bz;
databusout[5]   = dontcare;
//                op,   rd,  rn,  rm
iname[6]        ="SUBI, R24, R20, #00A";//testing subi, result in R24 = 0000000000000AA0
iaddrbusout[6]  = 64'h00000018;
//                opcode rm/ALUImm rn   rd
instrbusin[6]   ={SUBI,  12'h00A,  R20, R24};
daddrbusout[6]  = dontcare;
databusin[6]    = 64'bz;
databusout[6]   = dontcare;
//                op,   rd,  rn,  rm
iname[7]        ="ADD,  R25, R20, R0";//testing add, result in R25 = 0000000000000AAC
iaddrbusout[7]  = 64'h0000001C;
//                op,  rm, shamt,    rn,  rd
instrbusin[7]   ={ADD, R0, zeroSham, R20, R25};
daddrbusout[7]  = dontcare;
databusin[7]    = 64'bz;
databusout[7]   = dontcare;
//                op,   rd,  rn,  rm
iname[8]        ="AND,  R26, R20, R22";//testing and, result in R26 = 0000000000000AAA
iaddrbusout[8]  = 64'h00000020;
//                op,  rm,  shamt,    rn,  rd
instrbusin[8]   ={AND, R22, zeroSham, R20, R26};
daddrbusout[8]  = dontcare;
databusin[8]    = 64'bz;
databusout[8]   = dontcare;
//                op,   rd,  rn,  rm
iname[9]        ="EOR,  R27, R23, R21";//testing xor, result in R27 = 0000000000000003
iaddrbusout[9]  = 64'h00000024;
//                op,  rm,  shamt,    rn,  rd
instrbusin[9]   ={EOR, R21, zeroSham, R23, R27};
daddrbusout[9]  = dontcare;
databusin[9]    = 64'bz;
databusout[9]   = dontcare;
//                op,   rd,  rn,  rm
iname[10]       ="ORR,  R28, R25, R23";//testing or, result in R28 = 0000000000000AAE
iaddrbusout[10] = 64'h00000028;
//                op,  rm,  shamt,    rn,  rd
instrbusin[10]  ={ORR, R23, zeroSham, R25, R28};
daddrbusout[10] = dontcare;
databusin[10]   = 64'bz;
databusout[10]  = dontcare;
//                op,   rd,  rn,  rm
iname[11]       ="SUB,  R29, R20, R22";//testing sub, result in R29 = 0000000000000000
iaddrbusout[11] = 64'h0000002C;
//                op,  rm,  shamt,    rn,  rd
instrbusin[11]  ={SUB, R22, zeroSham, R20, R29};
daddrbusout[11] = dontcare;
databusin[11]   = 64'bz;
databusout[11]  = dontcare;
//                op,   rd,  rn,  aluImm
iname[12]       ="ADDI, R30, R31, #000";//testing addi on R31, result in R30 = 0000000000000000
iaddrbusout[12] = 64'h00000030;
//                opcode rm/ALUImm rn   rd
instrbusin[12]  ={ADDI,  12'h000,  R31, R30};
daddrbusout[12] = dontcare;
databusin[12]   = 64'bz;
databusout[12]  = dontcare;
//phase 2: testing basic op codes with the set flags
//                op,   rd,  rn,  aluImm
iname[13]       ="SUBIS,R20, R0,  #003";//testing subis, n flag, result in R20 = FFFFFFFFFFFFFFFF
iaddrbusout[13] = 64'h00000034;
//                opcode rm/ALUImm rn   rd
instrbusin[13]  ={SUBIS, 12'h003,  R0, R20};
daddrbusout[13] = dontcare;
databusin[13]   = 64'bz;
databusout[13]  = dontcare;
//                op,   rd,  rn,  rm
iname[14]       ="SUBS, R21, R25, R28";//testing subs, n flag, result in R21 = FFFFFFFFFFFFFFFE
iaddrbusout[14] = 64'h00000038;
//                op,  rm, shamt,    rn,  rd
instrbusin[14]  ={SUBS,R28,zeroSham, R25, R21};
daddrbusout[14] = dontcare;
databusin[14]   = 64'bz;
databusout[14]  = dontcare;
//                op,   rd,  rn,  aluImm
iname[15]       ="ADDIS,R22, R31, #000";//testing addis, z flag, result in R22 = 0000000000000000
iaddrbusout[15] = 64'h0000003C;
//                opcode rm/ALUImm rn   rd
instrbusin[15]  ={ADDIS, 12'h000,  R31, R22};
daddrbusout[15] = dontcare;
databusin[15]   = 64'bz;
databusout[15]  = dontcare;
//                op,   rd,  rn,  rm
iname[16]       ="ADDS  R23, R20, R23";//testing adds, c flag, result in R23 = 0000000000000001
iaddrbusout[16] = 64'h00000040;
//                op,  rm, shamt,    rn,  rd
instrbusin[16]  ={ADDS,R23,zeroSham, R20, R23};
daddrbusout[16] = dontcare;
databusin[16]   = 64'bz;
databusout[16]  = dontcare;
//                op,   rd,  rn,  aluImm
iname[17]       ="ANDIS,R24, R20, #002";//testing andis, reseting n,z flags to low, result in R24 = 0000000000000002
iaddrbusout[17] = 64'h00000044;
//                opcode rm/ALUImm rn   rd
instrbusin[17]  ={ANDIS, 12'h002,  R20, R24};
daddrbusout[17] = dontcare;
databusin[17]   = 64'bz;
databusout[17]  = dontcare;
//                op,   rd,  rn,  rm
iname[18]       ="ANDS, R25, R21, R20";//testing ands, n flag, result in R25 = FFFFFFFFFFFFFFFE
iaddrbusout[18] = 64'h00000048;
//                op,   rm,  shamt,    rn,  rd
instrbusin[18]  ={ANDS, R20, zeroSham, R21, R25};
daddrbusout[18] = dontcare;
databusin[18]   = 64'bz;
databusout[18]  = dontcare;
//phase 3: testing LSL, LSR
//setting up the register R20 for a test of the LSL
//                op,   rd,  rn,  rm
iname[19]       ="ADDI, R20, R31, #007";//setting up for left shift, result in R20 = 0000000000000007
iaddrbusout[19] = 64'h0000004C;
//                opcode rm/ALUImm rn   rd
instrbusin[19]  ={ADDI,  12'h007,  R31, R20};
daddrbusout[19] = dontcare;
databusin[19]   = 64'bz;
databusout[19]  = dontcare;
//                op,   rd,  rn,  rm
iname[20]       ="ADDI, R21, R31, #700";//setting up for right shift, n flag, result in R21 = 0000000000000700
iaddrbusout[20] = 64'h00000050;
//                opcode rm/ALUImm rn   rd
instrbusin[20]  ={ADDI,  12'h700,  R31, R21};
daddrbusout[20] = dontcare;
databusin[20]   = 64'bz;
databusout[20]  = dontcare;
//                op,   rd,  rn,  rm
iname[21]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[21] = 64'h00000054;
//                op,   rm,  shamt,    rn,  rd
instrbusin[21]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[21] = dontcare;
databusin[21]   = 64'bz;
databusout[21]  = dontcare;
//                op,   rd,  rn,  rm
iname[22]       ="AND,  R18, R31, R31";//delay, result in R18 = 0000000000000000
iaddrbusout[22] = 64'h00000058;
//                op,   rm,  shamt,    rn,  rd
instrbusin[22]  ={AND, R31,  zeroSham, R31, R18};
daddrbusout[22] = dontcare;
databusin[22]   = 64'bz;
databusout[22]  = dontcare;
//                op,  rd,  rn,  shamt
iname[23]       ="LSL, R20, R20, #2";//testing left shift, result in R20 = 0000000000000700
iaddrbusout[23] = 64'h0000005C;
//                op,  rm, shamt,      rn,  rd
instrbusin[23]  ={LSL, RX, eightShamt, R20, R20};
daddrbusout[23] = dontcare;
databusin[23]   = 64'bz;
databusout[23]  = dontcare;
//                op,  rd,  rn,  shamt
iname[24]       ="LSR, R21, R21, #2";//testing right shift, result in R21 = 0000000000000007
iaddrbusout[24] = 64'h00000060;
//                op,  rm, shamt,      rn,  rd
instrbusin[24]  ={LSR, RX, eightShamt, R21, R21};
daddrbusout[24] = dontcare;
databusin[24]   = 64'bz;
databusout[24]  = dontcare;
//phase 4: testing load and store and overflow bit
//                op,   rt,  rn,  DT_adr
iname[25]       ="LDUR, R22, R31, #1";//testing load, result in R22 = 42069 (from memory,databusin) [yes, really]
iaddrbusout[25] = 64'h00000064;
//                op,   DT_ADDR,      ?,     rn,  rt
instrbusin[25]  ={LDUR, 9'b000000001, 2'b00, R31, R22};
daddrbusout[25] = 64'h0000000000000001;//used for LDUR
databusin[25]   = 64'h0000000000042069;//used for LDUR
databusout[25]  = dontcare;
//                op,   rn,  DT_adr, rt
iname[26]       ="STUR, R23, #068,   R24";//testing story, result for databusout in R24 = 0000000000000002 (to memory)
//address is calculated from imm or 68, and R23, which is currently 1
iaddrbusout[26] = 64'h00000068;
//                op,   DT_ADDR,      ?,     rn,  rt
instrbusin[26]  ={STUR, 9'b001101000, 2'b00, R23, R24};
daddrbusout[26] = 64'h0000000000000069;//used for STUR
databusin[26]   = 64'bz;
databusout[26]  = 64'h0000000000000002;//used for STUR
//                op,   rd,  rn,  rm
iname[27]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[27] = 64'h0000006C;
//                op,   rm,  shamt,    rn,  rd
instrbusin[27]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[27] = dontcare;
databusin[27]   = 64'bz;
databusout[27]  = dontcare;
//                op,   rd,  rn,  rm
iname[28]       ="AND,  R18, R31, R31";//delay, result in R18 = 0000000000000000
iaddrbusout[28] = 64'h00000070;
//                op,   rm,  shamt,    rn,  rd
instrbusin[28]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[28] = dontcare;
databusin[28]   = 64'bz;
databusout[28]  = dontcare;
//                op,   rd,  rn,  rm
iname[29]       ="AND,  R17, R31, R31";//delay, result in R17 = 0000000000000000
iaddrbusout[29] = 64'h00000074;
//                op,   rm,  shamt,    rn,  rd
instrbusin[29]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[29] = dontcare;
databusin[29]   = 64'bz;
databusout[29]  = dontcare;
//phase 5: testing B branch
//                op,  BR_address
iname[30]       ="B,   #EA";//testing branch, calculated branch address should be
// (64'h0000000000000078 + 64'h000000000000003A8 = 64'h0000000000000420)
iaddrbusout[30] = 64'h00000078;
//                op,  BR_address
instrbusin[30]  ={B,   26'b00000000000000000011101010};
daddrbusout[30] = dontcare;
databusin[30]   = 64'bz;
databusout[30]  = dontcare;
//                op,   rd,  rn,  rm
iname[31]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[31] = 64'h0000007C;
//                op,   rm,  shamt,    rn,  rd
instrbusin[31]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[31] = dontcare;
databusin[31]   = 64'bz;
databusout[31]  = dontcare;
//                op,  rd,  rn,  rm
iname[32]       ="ADD, R20, R21, R20";//testing branch address result in R20 = 0000000000000707
iaddrbusout[32] = 64'h00000420;
//                op,  rm,   shamt,    rn,  rd
instrbusin[32]  ={ADD, R20,  zeroSham, R21, R20};
daddrbusout[32] = dontcare;
databusin[32]   = 64'bz;
databusout[32]  = dontcare;
//phase 6: testing B.EQ and B.NE branch
//                op,   rd,  rn,  rm
iname[33]        ="ADDI, R21, R31, #AAA";//testing addi, result in R21 = 0000000000000AAA
iaddrbusout[33]  = 64'h00000424;
//                opcode rm/ALUImm rn   rd
instrbusin[33]   ={ADDI,  12'hAAA,  R31, R21};
daddrbusout[33]  = dontcare;
databusin[33]    = 64'bz;
databusout[33]   = dontcare;
//                op,   rd,  rn,  rm
iname[34]        ="ADDI, R22, R31, #AAA";//testing addi, result in R22 = 0000000000000AAA
iaddrbusout[34]  = 64'h00000428;
//                opcode rm/ALUImm rn   rd
instrbusin[34]   ={ADDI,  12'hAAA,  R31, R22};
daddrbusout[34]  = dontcare;
databusin[34]    = 64'bz;
databusout[34]   = dontcare;
//ADDIS for FAKE BRANCH
//                op,   rd,  rn,  aluImm
iname[35]       ="ADDIS,R31, R31, #420";//testing fake branch, this should NOT set the Z high
iaddrbusout[35] = 64'h0000042C;
//                opcode rm/ALUImm rn   rd
instrbusin[35]  ={ADDIS, 12'h420,  R31, R31};
daddrbusout[35] = dontcare;
databusin[35]   = 64'bz;
databusout[35]  = dontcare;
//FAKE BRANCH
//                op,   COND_addr, rt
iname[36]       ="B_EQ, #69420,    RX";//testing to NOT take the branch, Z should be LOW
iaddrbusout[36] = 64'h00000430;
//                op,   COND_addr,               rt
instrbusin[36]  ={B_EQ, 19'b1101001010000100000, RX};
daddrbusout[36] = dontcare;
databusin[36]   = 64'bz;
databusout[36]  = dontcare;
iname[37] =    "NOP";//nada
iaddrbusout[37] = 64'h00000434;
instrbusin[37]  = 64'b0;
daddrbusout[37] = dontcare;
databusin[37]   = 64'bz;
databusout[37]  = dontcare;
//use SUBS for branch test
//                op,   rd,  rn,  rm
iname[38]       ="SUBS, R31, R21, R22";//set z flag for BEQ,
iaddrbusout[38] = 64'h00000438;
//                op,   rm,   shamt,    rn,  rd
instrbusin[38]  ={SUBS, R22,  zeroSham, R21, R31};
daddrbusout[38] = dontcare;
databusin[38]   = 64'bz;
databusout[38]  = dontcare;
//real branch for B.EQ (I have the best branches)
//                op,   COND_addr,  rt
iname[39]       ="B_EQ, #69,        RX";//take the branch to instruction count 440
iaddrbusout[39] = 64'h0000043C;
//                op,   COND_addr,               rt
instrbusin[39]  ={B_EQ, 19'b0000000000001101001, RX};
//19'b
daddrbusout[39] = dontcare;
databusin[39]   = 64'bz;
databusout[39]  = dontcare;
iname[40] =    "NOP";//nada
iaddrbusout[40] = 64'h00000440;
instrbusin[40]  = 64'b0;
daddrbusout[40] = dontcare;
databusin[40]   = 64'bz;
databusout[40]  = dontcare;
iname[41] =    "NOP";//nada
iaddrbusout[41] = 64'h000005E0;
instrbusin[41]  = 64'b0;
daddrbusout[41] = dontcare;
databusin[41]   = 64'bz;
databusout[41]  = dontcare;
//use SUBS for branch test
//                op,   rd,  rn,  rm
iname[42]       ="SUBS, R31, R21, R20";//set z flag of NOT for BNE
iaddrbusout[42] = 64'h000005E4;
//                op,   rm,   shamt,    rn,  rd
instrbusin[42]  ={SUBS, R20,  zeroSham, R21, R31};
daddrbusout[42] = dontcare;
databusin[42]   = 64'bz;
databusout[42]  = dontcare;
//test B.NE
//                op,   COND_addr,  rt
iname[43]       ="B_NE, #96,        RX";//take the branch to instruction count 840
iaddrbusout[43] = 64'h000005E8;
//                op,   COND_addr,               rt
instrbusin[43]  ={B_NE, 19'b0000000000010010110, RX};
daddrbusout[43] = dontcare;
databusin[43]   = 64'bz;
databusout[43]  = dontcare;
iname[44] =    "NOP";//nada
iaddrbusout[44] = 64'h000005EC;
instrbusin[44]  = 64'b0;
daddrbusout[44] = dontcare;
databusin[44]   = 64'bz;
databusout[44]  = dontcare;
iname[45] =    "NOP";//nada
iaddrbusout[45] = 64'h00000840;
instrbusin[45]  = 64'b0;
daddrbusout[45] = dontcare;
databusin[45]   = 64'bz;
databusout[45]  = dontcare;
//phase 7: testing CBNZ and CBZ branch
//DONT take the CBZ
//                op,   COND_addr,  rt
iname[46]       ="CBZ,  #F,         R22";//take the branch to instruction count
iaddrbusout[46] = 64'h00000844;
//                op,   COND_addr,               rt
instrbusin[46]  ={CBZ,  19'b0000000000000001111, R22};
daddrbusout[46] = dontcare;
databusin[46]   = 64'bz;
databusout[46]  = dontcare;
iname[47] =    "NOP";//nada
iaddrbusout[47] = 64'h00000848;
instrbusin[47]  = 64'b0;
daddrbusout[47] = dontcare;
databusin[47]   = 64'bz;
databusout[47]  = dontcare;
iname[48] =    "NOP";//nada
iaddrbusout[48] = 64'h0000084C;
instrbusin[48]  = 64'b0;
daddrbusout[48] = dontcare;
databusin[48]   = 64'bz;
databusout[48]  = dontcare;
//TAKE the CBZ
//                op,   COND_addr,  rt
iname[49]       ="CBZ,  #21,        R19";//take the branch to instruction count
iaddrbusout[49] = 64'h00000850;
//                op,   COND_addr,               rt
instrbusin[49]  ={CBZ,  19'b0000000000000100001, R19};
daddrbusout[49] = dontcare;
databusin[49]   = 64'bz;
databusout[49]  = dontcare;
iname[50] =    "NOP";//nada
iaddrbusout[50] = 64'h00000854;
instrbusin[50]  = 64'b0;
daddrbusout[50] = dontcare;
databusin[50]   = 64'bz;
databusout[50]  = dontcare;
iname[51] =    "NOP";//nada
iaddrbusout[51] = 64'h000008D4;
instrbusin[51]  = 64'b0;
daddrbusout[51] = dontcare;
databusin[51]   = 64'bz;
databusout[51]  = dontcare;
//DONT take the CBNZ
//                op,   COND_addr,  rt
iname[52]       ="CBNZ, #FF,        R31";//take the branch to instruction count
iaddrbusout[52] = 64'h000008D8;
//                op,   COND_addr,               rt
instrbusin[52]  ={CBNZ, 19'b0000000000011111111, R31};
daddrbusout[52] = dontcare;
databusin[52]   = 64'bz;
databusout[52]  = dontcare;
iname[53] =    "NOP";//nada
iaddrbusout[53] = 64'h000008DC;
instrbusin[53]  = 64'b0;
daddrbusout[53] = dontcare;
databusin[53]   = 64'bz;
databusout[53]  = dontcare;
iname[54] =    "NOP";//nada
iaddrbusout[54] = 64'h000008E0;
instrbusin[54]  = 64'b0;
daddrbusout[54] = dontcare;
databusin[54]   = 64'bz;
databusout[54]  = dontcare;
//TAKE the CBNZ
//                op,   COND_addr,  rt
iname[55]       ="CBNZ, #22,        R20";//take the branch to instruction count
iaddrbusout[55] = 64'h000008E4;
//                op,   COND_addr,               rt
instrbusin[55]  ={CBNZ, 19'b0000000000000100010, R20};
daddrbusout[55] = dontcare;
databusin[55]   = 64'bz;
databusout[55]  = dontcare;
iname[56] =    "NOP";//nada
iaddrbusout[56] = 64'h000008E8;
instrbusin[56]  = 64'b0;
daddrbusout[56] = dontcare;
databusin[56]   = 64'bz;
databusout[56]  = dontcare;
iname[57] =    "NOP";//nada
iaddrbusout[57] = 64'h0000096C;
instrbusin[57]  = 64'b0;
daddrbusout[57] = dontcare;
databusin[57]   = 64'bz;
databusout[57]  = dontcare;
//phase 8: testing MOVEZ and overflow bit
//4 instructions to set registers to 0
//                op,   rd,  rn,  rm
iname[58]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[58] = 64'h00000970;
//                op,   rm,  shamt,    rn,  rd
instrbusin[58]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[58] = dontcare;
databusin[58]   = 64'bz;
databusout[58]  = dontcare;
//                op,   rd,  rn,  rm
iname[59]       ="AND,  R20, R31, R31";//delay, result in R20 = 0000000000000000
iaddrbusout[59] = 64'h00000974;
//                op,   rm,  shamt,    rn,  rd
instrbusin[59]  ={AND, R31,  zeroSham, R31, R20};
daddrbusout[59] = dontcare;
databusin[59]   = 64'bz;
databusout[59]  = dontcare;
//                op,   rd,  rn,  rm
iname[60]       ="AND,  R21, R31, R31";//delay, result in R21 = 0000000000000000
iaddrbusout[60] = 64'h00000978;
//                op,   rm,  shamt,    rn,  rd
instrbusin[60]  ={AND, R31,  zeroSham, R31, R21};
daddrbusout[60] = dontcare;
databusin[60]   = 64'bz;
databusout[60]  = dontcare;
//                op,   rd,  rn,  rm
iname[61]       ="AND,  R22, R31, R31";//delay, result in R22 = 0000000000000000
iaddrbusout[61] = 64'h0000097C;
//                op,   rm,  shamt,    rn,  rd
instrbusin[61]  ={AND, R31,  zeroSham, R31, R22};
daddrbusout[61] = dontcare;
databusin[61]   = 64'bz;
databusout[61]  = dontcare;
//4 MOVZ commands
//move 0 amt
//                op,   move_amt,  MOV_imm,  rd
iname[62]       ="MOVZ, move_0,    #FFFF,    R19";//testing move,  result in R19 = 000000000000FFFF
iaddrbusout[62] = 64'h00000980;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[62]  ={MOVZ, move_0,    16'hFFFF, R19};
daddrbusout[62] = dontcare;
databusin[62]   = 64'bz;
databusout[62]  = dontcare;
//move 1 amt
//                op,   move_amt,  MOV_imm,  rd
iname[63]       ="MOVZ, move_1,    #FFFF,    R20";//testing move,  result in R20 = 00000000FFFF0000
iaddrbusout[63] = 64'h00000984;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[63]  ={MOVZ, move_1,    16'hFFFF, R20};
daddrbusout[63] = dontcare;
databusin[63]   = 64'bz;
databusout[63]  = dontcare;
//move 2 amt
//                op,   move_amt,  MOV_imm,  rd
iname[64]       ="MOVZ, move_2,    #FFFF,    R21";//testing move,  result in R21 = 0000FFFF00000000
iaddrbusout[64] = 64'h00000988;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[64]  ={MOVZ, move_2,    16'hFFFF, R21};
daddrbusout[64] = dontcare;
databusin[64]   = 64'bz;
databusout[64]  = dontcare;
//move 3 amt
//                op,   move_amt,  MOV_imm,  rd
iname[65]       ="MOVZ, move_3,    #7FFF,    R22";//testing move,  result in R22 = 7FFF000000000000
iaddrbusout[65] = 64'h0000098C;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[65]  ={MOVZ, move_3,    16'h7FFF, R22};
daddrbusout[65] = dontcare;
databusin[65]   = 64'bz;
databusout[65]  = dontcare;
//have or for move 0 and move 1
//                op,   rd,  rn,  rm
iname[66]        ="ORR,  R23, R19, R20";//testing xor, result in R23 = 00000000FFFFFFFF
iaddrbusout[66]  = 64'h00000990;
//                op,  rm,  shamt,    rn,  rd
instrbusin[66]   ={ORR, R20, zeroSham, R19, R23};
daddrbusout[66]  = dontcare;
databusin[66]    = 64'bz;
databusout[66]   = dontcare;
//delay
iname[67] =    "NOP";//nada
iaddrbusout[67] = 64'h00000994;
instrbusin[67]  = 64'b0;
daddrbusout[67] = dontcare;
databusin[67]   = 64'bz;
databusout[67]  = dontcare;
//have or for move 2 and move 3
//                op,   rd,  rn,  rm
iname[68]        ="ORR,  R24, R21, R22";//testing xor, result in R27 = 7FFFFFFF00000000
iaddrbusout[68]  = 64'h00000998;
//                op,  rm,  shamt,    rn,  rd
instrbusin[68]   ={ORR, R22, zeroSham, R21, R24};
daddrbusout[68]  = dontcare;
databusin[68]    = 64'bz;
databusout[68]   = dontcare;
//delay
iname[69] =    "NOP";//nada
iaddrbusout[69] = 64'h0000099C;
instrbusin[69]  = 64'b0;
daddrbusout[69] = dontcare;
databusin[69]   = 64'bz;
databusout[69]  = dontcare;
//delay
iname[70] =    "NOP";//nada
iaddrbusout[70] = 64'h000009A0;
instrbusin[70]  = 64'b0;
daddrbusout[70] = dontcare;
databusin[70]   = 64'bz;
databusout[70]  = dontcare;
//have or for move(0|1) and move(2|3)
//                op,   rd,  rn,  rm
iname[71]        ="ORR,  R25, R23, R24";//testing xor, result in R25 = 7FFFFFFFFFFFFFFF
iaddrbusout[71]  = 64'h000009A4;
//                op,  rm,  shamt,    rn,  rd
instrbusin[71]   ={ORR, R24, zeroSham, R23, R25};
daddrbusout[71]  = dontcare;
databusin[71]    = 64'bz;
databusout[71]   = dontcare;
//dealy
iname[72] =    "NOP";//nada
iaddrbusout[72] = 64'h000009A8;
instrbusin[72]  = 64'b0;
daddrbusout[72] = dontcare;
databusin[72]   = 64'bz;
databusout[72]  = dontcare;
//delay
iname[73] =    "NOP";//nada
iaddrbusout[73] = 64'h000009AC;
instrbusin[73]  = 64'b0;
daddrbusout[73] = dontcare;
databusin[73]   = 64'bz;
databusout[73]  = dontcare;
//addis command to trigger the V bit
//                op,   rd,  rn,  aluImm
iname[74]       ="ADDIS,R26, R25, #001";//testing xor and V bit and N bit, result in R26 = 8000000000000000
iaddrbusout[74] = 64'h000009B0;
//                opcode rm/ALUImm rn   rd
instrbusin[74]  ={ADDIS, 12'h001,  R25, R26};
daddrbusout[74] = dontcare;
databusin[74]   = 64'bz;
databusout[74]  = dontcare;
iname[75] =    "NOP";//nada
iaddrbusout[75] = 64'h000009B4;
instrbusin[75]  = 64'b0;
daddrbusout[75] = dontcare;
databusin[75]   = 64'bz;
databusout[75]  = dontcare;
iname[76] =    "NOP";//nada
iaddrbusout[76] = 64'h000009B8;
instrbusin[76]  = 64'b0;
daddrbusout[76] = dontcare;
databusin[76]   = 64'bz;
databusout[76]  = dontcare;
//phase 9: testing B.LT and B.GE branch
//7FFF+1 = N and V, 8000-1 = V
//use SUBIS for the branch condition test (B.LT test)
//                op,   rd,  rn,  aluImm
iname[77]       ="SUBIS,R26, R26,  #001";//result in R26 = 7FFFFFFFFFFFFFFF
iaddrbusout[77] = 64'h000009BC;
//                opcode rm/ALUImm rn   rd
instrbusin[77]  ={SUBIS, 12'h001,  R26, R26};
daddrbusout[77] = dontcare;
databusin[77]   = 64'bz;
databusout[77]  = dontcare;
//TAKE branch
//                op,   COND_addr, rt
iname[78]       ="B_LT, #42,       RX";//new branch address is AC8
iaddrbusout[78] = 64'h000009C0;
//                op,   COND_addr,               rt
instrbusin[78]  ={B_LT, 19'b0000000000001000010, RX};
daddrbusout[78] = dontcare;
databusin[78]   = 64'bz;
databusout[78]  = dontcare;
//delay
iname[79] =    "NOP";//nada
iaddrbusout[79] = 64'h000009C4;
instrbusin[79]  = 64'b0;
daddrbusout[79] = dontcare;
databusin[79]   = 64'bz;
databusout[79]  = dontcare;
//delay
iname[80] =    "NOP";//nada
iaddrbusout[80] = 64'h00000AC8;
instrbusin[80]  = 64'b0;
daddrbusout[80] = dontcare;
databusin[80]   = 64'bz;
databusout[80]  = dontcare;
//use ADDIS for the branch condition test B.GE test
//                op,   rd,  rn,  aluImm
iname[81]       ="ADDIS,R26, R26, #001";//result in R26 = 8000000000000000
iaddrbusout[81] = 64'h00000ACC;
//                opcode rm/ALUImm rn   rd
instrbusin[81]  ={ADDIS, 12'h001,  R26, R26};
daddrbusout[81] = dontcare;
databusin[81]   = 64'bz;
databusout[81]  = dontcare;
//TAKE branch
//                op,   COND_addr, rt
iname[82]       ="B_GE, #24,       RX";//new branch address is B60
iaddrbusout[82] = 64'h00000AD0;
//                op,   COND_addr,               rt
instrbusin[82]  ={B_GE, 19'b0000000000000100100, RX};
daddrbusout[82] = dontcare;
databusin[82]   = 64'bz;
databusout[82]  = dontcare;
//delay
iname[83] =    "NOP";//nada
iaddrbusout[83] = 64'h00000AD4;
instrbusin[83]  = 64'b0;
daddrbusout[83] = dontcare;
databusin[83]   = 64'bz;
databusout[83]  = dontcare;
//delay
iname[84] =    "NOP";//nada
iaddrbusout[84] = 64'h00000B60;
instrbusin[84]  = 64'b0;
daddrbusout[84] = dontcare;
databusin[84]   = 64'bz;
databusout[84]  = dontcare;
//finishing up
iname[85] =    "NOP";//nada
iaddrbusout[85] = 64'h00000B64;
instrbusin[85]  = 64'b0;
daddrbusout[85] = dontcare;
databusin[85]   = 64'bz;
databusout[85]  = dontcare;
iname[86] =    "NOP";//nada
iaddrbusout[86] = 64'h00000B68;
instrbusin[86]  = 64'b0;
daddrbusout[86] = dontcare;
databusin[86]   = 64'bz;
databusout[86]  = dontcare;
iname[87] =    "NOP";//nada
iaddrbusout[87] = 64'h00000B6C;
instrbusin[87]  = 64'b0;
daddrbusout[87] = dontcare;
databusin[87]   = 64'bz;
databusout[87]  = dontcare;
//done with testing: 88 instructions
//bonus round
//copy of phase 3
//phase 3: testing LSL, LSR
//setting up the register R20 for a test of the LSL
//                op,   rd,  rn,  rm
iname[88]       ="ADDI, R20, R31, #640";//setting up for left shift, result in R20 = 0000000000000640
iaddrbusout[88] = 64'h00000B70;
//                opcode rm/ALUImm rn   rd
instrbusin[88]  ={ADDI,  12'h007,  R31, R20};
daddrbusout[88] = dontcare;
databusin[88]   = 64'bz;
databusout[88]  = dontcare;
//                op,   rd,  rn,  rm
iname[89]       ="ADDI, R21, R31, #480";//setting up for right shift, n flag, result in R21 = 0000000000000480
iaddrbusout[89] = 64'h00000B74;
//                opcode rm/ALUImm rn   rd
instrbusin[89]  ={ADDI,  12'h700,  R31, R21};
daddrbusout[89] = dontcare;
databusin[89]   = 64'bz;
databusout[89]  = dontcare;
//                op,   rd,  rn,  rm
iname[90]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[90] = 64'h00000B78;
//                op,   rm,  shamt,    rn,  rd
instrbusin[90]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[90] = dontcare;
databusin[90]   = 64'bz;
databusout[90]  = dontcare;
//                op,   rd,  rn,  rm
iname[91]       ="AND,  R18, R31, R31";//delay, result in R18 = 0000000000000000
iaddrbusout[91] = 64'h00000B7C;
//                op,   rm,  shamt,    rn,  rd
instrbusin[91]  ={AND, R31,  zeroSham, R31, R18};
daddrbusout[91] = dontcare;
databusin[91]   = 64'bz;
databusout[91]  = dontcare;
//                op,  rd,  rn,  rm
iname[92]       ="LSL, R20, R20, #1";//testing left shift, result in R20 = 0000000000006400
iaddrbusout[92] = 64'h00000B80;
//                op,  rm, shamt,      rn,  rd
instrbusin[92]  ={LSL, RX, fourShamt, R20, R20};
daddrbusout[92] = dontcare;
databusin[92]   = 64'bz;
databusout[92]  = dontcare;
//                op,  rd,  rn,  rm
iname[93]       ="LSR, R21, R21, #1";//testing right shift, result in R21 = 0000000000000048
iaddrbusout[93] = 64'h00000B84;
//                op,  rm, shamt,      rn,  rd
instrbusin[93]  ={LSR, RX, fourShamt, R21, R21};
daddrbusout[93] = dontcare;
databusin[93]   = 64'bz;
databusout[93]  = dontcare;
//phase 4: testing load and store
//                op,   rt,  rn,  DT_adr
iname[94]       ="LDUR, R22, R31, #27";//testing load, result in R22 = 666 (from memory,databusin)
iaddrbusout[94] = 64'h00000B88;
//                op,   DT_ADDR,      ?,     rn,  rt
instrbusin[94]  ={LDUR, 9'b000100111, 2'b00, R31, R22};
daddrbusout[94] = 64'h0000000000000027;//used for LDUR
databusin[94]   = 64'h0000000000000666;//used for LDUR
databusout[94]  = dontcare;
//                op,   rn,  DT_adr, rt
iname[95]       ="STUR, R26, #21,   R26";//testing store, result for databusout in R26 = 8000000000000000 (to memory)
//R20, + 21 =  6421
iaddrbusout[95] = 64'h00000B8C;
//                op,   DT_ADDR,      ?,     rn,  rt
instrbusin[95]  ={STUR, 9'b000100001, 2'b00, R26, R26};
daddrbusout[95] = 64'h8000000000000021;//used for STUR
databusin[95]   = 64'bz;
databusout[95]  = 64'h8000000000000000;//used for STUR
//                op,   rd,  rn,  rm
iname[96]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[96] = 64'h00000B90;
//                op,   rm,  shamt,    rn,  rd
instrbusin[96]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[96] = dontcare;
databusin[96]   = 64'bz;
databusout[96]  = dontcare;
//                op,   rd,  rn,  rm
iname[97]       ="AND,  R18, R31, R31";//delay, result in R18 = 0000000000000000
iaddrbusout[97] = 64'h00000B94;
//                op,   rm,  shamt,    rn,  rd
instrbusin[97]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[97] = dontcare;
databusin[97]   = 64'bz;
databusout[97]  = dontcare;
//                op,   rd,  rn,  rm
iname[98]       ="AND,  R17, R31, R31";//delay, result in R17 = 0000000000000000
iaddrbusout[98] = 64'h00000B98;
//                op,   rm,  shamt,    rn,  rd
instrbusin[98]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[98] = dontcare;
databusin[98]   = 64'bz;
databusout[98]  = dontcare;
//phase 5: testing B branch
//                op,  BR_address
iname[99]       ="B,   #BEEF";//testing branch, calculated branch address should be
// (64'h? + 64'h0000000000000BEEF = 64'h?)
iaddrbusout[99] = 64'h00000B9C;
//                op,  BR_address
instrbusin[99]  ={B,   26'b00000000001011111011101111};
daddrbusout[99] = dontcare;
databusin[99]   = 64'bz;
databusout[99]  = dontcare;
//                op,   rd,  rn,  rm
iname[100]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[100] = 64'h00000BA0;
//                op,   rm,  shamt,    rn,  rd
instrbusin[100]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[100] = dontcare;
databusin[100]   = 64'bz;
databusout[100]  = dontcare;
//                op,  rd,  rn,  rm
iname[101]       ="ADD, R20, R21, R20";//testing branch address result in R20 = 0000000000006448
iaddrbusout[101] = 64'h00030758;
//                op,  rm,   shamt,    rn,  rd
instrbusin[101]  ={ADD, R20,  zeroSham, R21, R20};
daddrbusout[101] = dontcare;
databusin[101]   = 64'bz;
databusout[101]  = dontcare;
//copy of branch testing(@101)
//phase 5: testing B branch
//                op,  BR_address
iname[102]       ="B,   #1337";//testing branch, calculated branch address should be
// (64'h? + 64'h00000000000001337 = 64'h?)
iaddrbusout[102] = 64'h0003075C;
//                op,  BR_address
instrbusin[102]  ={B,   26'b00000000000001001100110111};
daddrbusout[102] = dontcare;
databusin[102]   = 64'bz;
databusout[102]  = dontcare;
//                op,   rd,  rn,  rm
iname[103]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[103] = 64'h00030760;
//                op,   rm,  shamt,    rn,  rd
instrbusin[103]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[103] = dontcare;
databusin[103]   = 64'bz;
databusout[103]  = dontcare;
//                op,  rd,  rn,  rm
iname[104]       ="ADD, R17, R31, R31";//testing branch address result in R17 = 0000000000000000
iaddrbusout[104] = 64'h00035438;
//                op,  rm,   shamt,    rn,  rd
instrbusin[104]  ={ADD, R31,  zeroSham, R31, R17};
daddrbusout[104] = dontcare;
databusin[104]   = 64'bz;
databusout[104]  = dontcare;
//phase 6: testing B.EQ and B.NE branch
//                op,   rd,  rn,   imm
iname[105]        ="ADDI, R21, R31, #002";//testing addi, result in R21 = 0000000000000002
iaddrbusout[105]  = 64'h0003543C;
//                opcode rm/ALUImm rn   rd
instrbusin[105]   ={ADDI,  12'h002,  R31, R21};
daddrbusout[105]  = dontcare;
databusin[105]    = 64'bz;
databusout[105]   = dontcare;
//                op,   rd,  rn,   imm
iname[106]        ="ADDI, R22, R31, #002";//testing addi, result in R22 = 0000000000000002
iaddrbusout[106]  = 64'h00035440;
//                opcode rm/ALUImm rn   rd
instrbusin[106]   ={ADDI,  12'h002,  R31, R22};
daddrbusout[106]  = dontcare;
databusin[106]    = 64'bz;
databusout[106]   = dontcare;
iname[107] =    "NOP";//nada
iaddrbusout[107] = 64'h00035444;
instrbusin[107]  = 64'b0;
daddrbusout[107] = dontcare;
databusin[107]   = 64'bz;
databusout[107]  = dontcare;
iname[108] =    "NOP";//nada
iaddrbusout[108] = 64'h00035448;
instrbusin[108]  = 64'b0;
daddrbusout[108] = dontcare;
databusin[108]   = 64'bz;
databusout[108]  = dontcare;
//TODO: find register to make this a fake branch for N bit
//SUBIS for FAKE BRANCH
//                op,   rd,  rn,  aluImm
iname[109]       ="SUBIS,R31, R22, #001";//testing fake branch, this should NOT set the N high
iaddrbusout[109] = 64'h0003544C;
//                opcode rm/ALUImm rn   rd
instrbusin[109]  ={SUBIS, 12'h001,  R22, R31};
daddrbusout[109] = dontcare;
databusin[109]   = 64'bz;
databusout[109]  = dontcare;
//FAKE BRANCH
//                op,   COND_addr, rt
iname[110]       ="B_EQ, #69420,    RX";//testing to NOT take the branch, N should be LOW
iaddrbusout[110] = 64'h00035450;
//                op,   COND_addr,               rt
instrbusin[110]  ={B_EQ, 19'b1101001010000100000, RX};
daddrbusout[110] = dontcare;
databusin[110]   = 64'bz;
databusout[110]  = dontcare;
iname[111] =    "NOP";//nada
iaddrbusout[111] = 64'h00035454;
instrbusin[111]  = 64'b0;
daddrbusout[111] = dontcare;
databusin[111]   = 64'bz;
databusout[111]  = dontcare;
//use SUBS for branch test
//                op,   rd,  rn,  rm
iname[112]       ="ADDS, R31, R31, R31";//set z flag for BEQ,
iaddrbusout[112] = 64'h00035458;
//                op,   rm,   shamt,    rn,  rd
instrbusin[112]  ={ADDS, R31,  zeroSham, R31, R31};
daddrbusout[112] = dontcare;
databusin[112]   = 64'bz;
databusout[112]  = dontcare;
//real branch for B.EQ (I have more of the best branches)
//                op,   COND_addr,  rt
iname[113]       ="B_EQ, #AE,        RX";//take the branch to instruction count 35714
iaddrbusout[113] = 64'h0003545C;
//                op,   COND_addr,               rt
instrbusin[113]  ={B_EQ, 19'b0000000000010101110, RX};
daddrbusout[113] = dontcare;
databusin[113]   = 64'bz;
databusout[113]  = dontcare;
iname[114] =    "NOP";//nada
iaddrbusout[114] = 64'h00035460;
instrbusin[114]  = 64'b0;
daddrbusout[114] = dontcare;
databusin[114]   = 64'bz;
databusout[114]  = dontcare;
iname[115] =    "NOP";//nada
iaddrbusout[115] = 64'h00035714;
instrbusin[115]  = 64'b0;
daddrbusout[115] = dontcare;
databusin[115]   = 64'bz;
databusout[115]  = dontcare;
//use ADDS for branch test
//                op,   rd,  rn,  rm
iname[116]       ="ADDS, R31, R21, R20";//DONT set Z bit to high
iaddrbusout[116] = 64'h00035718;
//                op,   rm,   shamt,    rn,  rd
instrbusin[116]  ={ADDS, R20,  zeroSham, R21, R31};
daddrbusout[116] = dontcare;
databusin[116]   = 64'bz;
databusout[116]  = dontcare;
//test B.EQ
//                op,   COND_addr,  rt
iname[117]       ="B_EQ, #96,        RX";//DONT take the branch to instruction count
iaddrbusout[117] = 64'h0003571C;
//                op,   COND_addr,               rt
instrbusin[117]  ={B_EQ, 19'b0000000000010010110, RX};
daddrbusout[117] = dontcare;
databusin[117]   = 64'bz;
databusout[117]  = dontcare;
iname[118] =    "NOP";//nada
iaddrbusout[118] = 64'h00035720;
instrbusin[118]  = 64'b0;
daddrbusout[118] = dontcare;
databusin[118]   = 64'bz;
databusout[118]  = dontcare;
iname[119] =    "NOP";//nada
iaddrbusout[119] = 64'h00035724;
instrbusin[119]  = 64'b0;
daddrbusout[119] = dontcare;
databusin[119]   = 64'bz;
databusout[119]  = dontcare;
//copy of move and more branch testing(@117)
//phase 8: testing MOVEZ and overflow bit
//4 instructions to set registers to 0
//                op,   rd,  rn,  rm
iname[120]       ="AND,  R19, R31, R31";//delay, result in R19 = 0000000000000000
iaddrbusout[120] = 64'h00035728;
//                op,   rm,  shamt,    rn,  rd
instrbusin[120]  ={AND, R31,  zeroSham, R31, R19};
daddrbusout[120] = dontcare;
databusin[120]   = 64'bz;
databusout[120]  = dontcare;
//                op,   rd,  rn,  rm
iname[121]       ="AND,  R20, R31, R31";//delay, result in R20 = 0000000000000000
iaddrbusout[121] = 64'h0003572C;
//                op,   rm,  shamt,    rn,  rd
instrbusin[121]  ={AND, R31,  zeroSham, R31, R20};
daddrbusout[121] = dontcare;
databusin[121]   = 64'bz;
databusout[121]  = dontcare;
//                op,   rd,  rn,  rm
iname[122]       ="AND,  R21, R31, R31";//delay, result in R21 = 0000000000000000
iaddrbusout[122] = 64'h00035730;
//                op,   rm,  shamt,    rn,  rd
instrbusin[122]  ={AND, R31,  zeroSham, R31, R21};
daddrbusout[122] = dontcare;
databusin[122]   = 64'bz;
databusout[122]  = dontcare;
//                op,   rd,  rn,  rm
iname[123]       ="AND,  R22, R31, R31";//delay, result in R22 = 0000000000000000
iaddrbusout[123] = 64'h00035734;
//                op,   rm,  shamt,    rn,  rd
instrbusin[123]  ={AND, R31,  zeroSham, R31, R22};
daddrbusout[123] = dontcare;
databusin[123]   = 64'bz;
databusout[123]  = dontcare;
//4 MOVZ commands
//move 0 amt
//                op,   move_amt,  MOV_imm,  rd
iname[124]       ="MOVZ, move_0,    #FFFF,    R19";//testing move,  result in R19 = 000000000000FFFF
iaddrbusout[124] = 64'h00035738;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[124]  ={MOVZ, move_0,    16'hFFFF, R19};
daddrbusout[124] = dontcare;
databusin[124]   = 64'bz;
databusout[124]  = dontcare;
//move 1 amt
//                op,   move_amt,  MOV_imm,  rd
iname[125]       ="MOVZ, move_1,    #FFFF,    R20";//testing move,  result in R20 = 00000000FFFF0000
iaddrbusout[125] = 64'h0003573C;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[125]  ={MOVZ, move_1,    16'hFFFF, R20};
daddrbusout[125] = dontcare;
databusin[125]   = 64'bz;
databusout[125]  = dontcare;
//move 2 amt
//                op,   move_amt,  MOV_imm,  rd
iname[126]       ="MOVZ, move_2,    #FFFF,    R21";//testing move,  result in R21 = 0000FFFF00000000
iaddrbusout[126] = 64'h00035740;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[126]  ={MOVZ, move_2,    16'hFFFF, R21};
daddrbusout[126] = dontcare;
databusin[126]   = 64'bz;
databusout[126]  = dontcare;
//move 3 amt
//                op,   move_amt,  MOV_imm,  rd
iname[127]       ="MOVZ, move_3,    #6FFF,    R22";//testing move,  result in R22 = 6FFF000000000000
iaddrbusout[127] = 64'h00035744;
//                op,   move_amt,  MOV_imm,  rd
instrbusin[127]  ={MOVZ, move_3,    16'h6FFF, R22};
daddrbusout[127] = dontcare;
databusin[127]   = 64'bz;
databusout[127]  = dontcare;
//have or for move 0 and move 1
//                op,   rd,  rn,  rm
iname[128]        ="ORR,  R23, R19, R20";//testing xor, result in R23 = 00000000FFFFFFFF
iaddrbusout[128]  = 64'h00035748;
//                op,  rm,  shamt,    rn,  rd
instrbusin[128]   ={ORR, R20, zeroSham, R19, R23};
daddrbusout[128]  = dontcare;
databusin[128]    = 64'bz;
databusout[128]   = dontcare;
//delay
iname[129] =    "NOP";//nada
iaddrbusout[129] = 64'h0003574C;
instrbusin[129]  = 64'b0;
daddrbusout[129] = dontcare;
databusin[129]   = 64'bz;
databusout[129]  = dontcare;
//have or for move 2 and move 3
//                op,   rd,  rn,  rm
iname[130]        ="ORR,  R24, R21, R22";//testing xor, result in R27 = 6FFFFFFF00000000
iaddrbusout[130]  = 64'h00035750;
//                op,  rm,  shamt,    rn,  rd
instrbusin[130]   ={ORR, R22, zeroSham, R21, R24};
daddrbusout[130]  = dontcare;
databusin[130]    = 64'bz;
databusout[130]   = dontcare;
//delay
iname[131] =    "NOP";//nada
iaddrbusout[131] = 64'h00035754;
instrbusin[131]  = 64'b0;
daddrbusout[131] = dontcare;
databusin[131]   = 64'bz;
databusout[131]  = dontcare;
//delay
iname[132] =    "NOP";//nada
iaddrbusout[132] = 64'h00035758;
instrbusin[132]  = 64'b0;
daddrbusout[132] = dontcare;
databusin[132]   = 64'bz;
databusout[132]  = dontcare;
//have or for move(0|1) and move(2|3)
//                op,   rd,  rn,  rm
iname[133]        ="ORR,  R25, R23, R24";//testing or, result in R25 = 6FFFFFFFFFFFFFFF
iaddrbusout[133]  = 64'h0003575C;
//                op,  rm,  shamt,    rn,  rd
instrbusin[133]   ={ORR, R24, zeroSham, R23, R25};
daddrbusout[133]  = dontcare;
databusin[133]    = 64'bz;
databusout[133]   = dontcare;
//dealy
iname[134] =    "NOP";//nada
iaddrbusout[134] = 64'h00035760;
instrbusin[134]  = 64'b0;
daddrbusout[134] = dontcare;
databusin[134]   = 64'bz;
databusout[134]  = dontcare;
//delay
iname[135] =    "NOP";//nada
iaddrbusout[135] = 64'h00035764;
instrbusin[135]  = 64'b0;
daddrbusout[135] = dontcare;
databusin[135]   = 64'bz;
databusout[135]  = dontcare;
//addis command to NOT trigger the V bit
//                op,   rd,  rn,  aluImm
iname[136]       ="ADDIS,R26, R25, #001";//for not V bit set, result in R26 = 7000000000000000
iaddrbusout[136] = 64'h00035768;
//                opcode rm/ALUImm rn   rd
instrbusin[136]  ={ADDIS, 12'h001,  R25, R26};
daddrbusout[136] = dontcare;
databusin[136]   = 64'bz;
databusout[136]  = dontcare;
iname[137] =    "NOP";//nada
iaddrbusout[137] = 64'h0003576C;
instrbusin[137]  = 64'b0;
daddrbusout[137] = dontcare;
databusin[137]   = 64'bz;
databusout[137]  = dontcare;
iname[138] =    "NOP";//nada
iaddrbusout[138] = 64'h00035770;
instrbusin[138]  = 64'b0;
daddrbusout[138] = dontcare;
databusin[138]   = 64'bz;
databusout[138]  = dontcare;
//phase 9: testing B.LT and B.GE branch
//7FFF+1 = N and V, 8000-1 = V
//use SUBIS for the branch condition test (B.LT test)
//DONT take branch
//                op,   rd,  rn,  aluImm
iname[139]       ="SUBIS,R26, R26,  #001";//result in R26 = 6FFFFFFFFFFFFFFF
iaddrbusout[139] = 64'h00035774;
//                opcode rm/ALUImm rn   rd
instrbusin[139]  ={SUBIS, 12'h001,  R26, R26};
daddrbusout[139] = dontcare;
databusin[139]   = 64'bz;
databusout[139]  = dontcare;
//NOT TAKE branch
//                op,   COND_addr, rt
iname[140]       ="B_LT, #42,       RX";//new branch address is
iaddrbusout[140] = 64'h00035778;
//                op,   COND_addr,               rt
instrbusin[140]  ={B_LT, 19'b0000000000001000010, RX};
daddrbusout[140] = dontcare;
databusin[140]   = 64'bz;
databusout[140]  = dontcare;
//delay
iname[141] =    "NOP";//nada
iaddrbusout[141] = 64'h0003577C;
instrbusin[141]  = 64'b0;
daddrbusout[141] = dontcare;
databusin[141]   = 64'bz;
databusout[141]  = dontcare;
//delay
iname[142] =    "NOP";//nada
iaddrbusout[142] = 64'h00035780;
instrbusin[142]  = 64'b0;
daddrbusout[142] = dontcare;
databusin[142]   = 64'bz;
databusout[142]  = dontcare;
//use ADDIS for the branch condition test B.GE test
//                op,   rd,  rn,  aluImm
iname[143]       ="ADDIS,R26, R26, #001";//result in R26 = 7000000000000000
iaddrbusout[143] = 64'h00035784;
//                opcode rm/ALUImm rn   rd
instrbusin[143]  ={ADDIS, 12'h001,  R26, R26};
daddrbusout[143] = dontcare;
databusin[143]   = 64'bz;
databusout[143]  = dontcare;
//NOT TAKE branch
//                op,   COND_addr, rt
iname[144]       ="B_LT, #24,       RX";//new branch address is B60
iaddrbusout[144] = 64'h00035788;
//                op,   COND_addr,               rt
instrbusin[144]  ={B_LT, 19'b0000000000000100100, RX};
daddrbusout[144] = dontcare;
databusin[144]   = 64'bz;
databusout[144]  = dontcare;
//delay
iname[145] =    "NOP";//nada
iaddrbusout[145] = 64'h0003578C;
instrbusin[145]  = 64'b0;
daddrbusout[145] = dontcare;
databusin[145]   = 64'bz;
databusout[145]  = dontcare;
//delay
iname[146] =    "NOP";//nada
iaddrbusout[146] = 64'h00035790;
instrbusin[146]  = 64'b0;
daddrbusout[146] = dontcare;
databusin[146]   = 64'bz;
databusout[146]  = dontcare;
//finishing up
iname[147] =    "NOP";//nada
iaddrbusout[147] = 64'h00035794;
instrbusin[147]  = 64'b0;
daddrbusout[147] = dontcare;
databusin[147]   = 64'bz;
databusout[147]  = dontcare;
iname[148] =    "NOP";//nada
iaddrbusout[148] = 64'h00035798;
instrbusin[148]  = 64'b0;
daddrbusout[148] = dontcare;
databusin[148]   = 64'bz;
databusout[148]  = dontcare;
iname[149] =    "NOP";//nada
iaddrbusout[149] = 64'h0003579C;
instrbusin[149]  = 64'b0;
daddrbusout[149] = dontcare;
databusin[149]   = 64'bz;
databusout[149]  = dontcare;
//Random(@147)//TODO: test what the registers actually are
//                op,   rd,  rn,  rm
iname[150]        ="ORRI, R21, R24, #AAA";//testing ori, result in R21 = 0000000000000001//TODO
iaddrbusout[150]  = 64'h000357A0;
//                opcode rm/ALUImm rn   rd
instrbusin[150]   ={ORRI,  12'h001,  R24, R21};
daddrbusout[150]  = dontcare;
databusin[150]    = 64'bz;
databusout[150]   = dontcare;
//                op,   rd,  rn,  rm
iname[151]        ="EORI, R22, R20, #CCC";//testing xori, result in R22 = 0000000000000AAA//TODO
iaddrbusout[151]  = 64'h000357A4;
//                opcode rm/ALUImm rn   rd
instrbusin[151]   ={EORI,  12'h000,  R20, R22};
daddrbusout[151]  = dontcare;
databusin[151]    = 64'bz;
databusout[151]   = dontcare;
//                op,   rd,  rn,  rm
iname[152]        ="ANDI, R23, R0,  #321";//testing andi, result in R23 = 0000000000000002//TODO
iaddrbusout[152]  = 64'h000357A8;
//                opcode rm/ALUImm rn   rd
instrbusin[152]   ={ANDI,  12'h003,  R0, R23};
daddrbusout[152]  = dontcare;
databusin[152]    = 64'bz;
databusout[152]   = dontcare;
//                op,   rd,  rn,  rm
iname[153]        ="SUBI, R24, R20, #123";//testing subi, result in R24 = 0000000000000AA0//TODO
iaddrbusout[153]  = 64'h000357AC;
//                opcode rm/ALUImm rn   rd
instrbusin[153]   ={SUBI,  12'h00A,  R20, R24};
daddrbusout[153]  = dontcare;
databusin[153]    = 64'bz;
databusout[153]   = dontcare;
//delay
iname[154] =    "NOP";//nada
iaddrbusout[154] = 64'h000357B0;
instrbusin[154]  = 64'b0;
daddrbusout[154] = dontcare;
databusin[154]   = 64'bz;
databusout[154]  = dontcare;
//delay
iname[155] =    "NOP";//nada
iaddrbusout[155] = 64'h000357B4;
instrbusin[155]  = 64'b0;
daddrbusout[155] = dontcare;
databusin[155]   = 64'bz;
databusout[155]  = dontcare;
//finishing up
iname[156] =    "NOP";//nada
iaddrbusout[156] = 64'h000357B8;
instrbusin[156]  = 64'b0;
daddrbusout[156] = dontcare;
databusin[156]   = 64'bz;
databusout[156]  = dontcare;
//Done. 157 instructions
//this number will be inacurate for a while(the number below)
//also remember to set k down below to ntests - 1
// (no. instructions) + (no. loads) + 2*(no. stores) = 35 + 2 + 2*7 = 51
ntests = 157;//?
$timeformat(-9,1,"ns",12);
end
//assumes positive edge FF.
//testbench reads databus when clk high, writes databus when clk low.
assign databus = clkd ? 64'bz : databusk;
//Change inputs in middle of period (falling edge).
initial begin
  error = 0;
  clkd =1;
  clk=1;
  $display ("Time=%t\n  clk=%b", $realtime, clk);
  databusk = 64'bz;
  //extended reset to set up PC MUX
  reset = 1;
  $display ("reset=%b", reset);
  #5
  clk=0;
  clkd=0;
  $display ("Time=%t\n  clk=%b", $realtime, clk);
  #5
  clk=1;
  clkd=1;
  $display ("Time=%t\n  clk=%b", $realtime, clk);
  #5
  clk=0;
  clkd=0;
  $display ("Time=%t\n  clk=%b", $realtime, clk);
  #5
  $display ("Time=%t\n  clk=%b", $realtime, clk);
for (k=0; k<= 156; k=k+1) begin
    clk=1;
    $display ("Time=%t\n  clk=%b", $realtime, clk);
    #2
    clkd=1;
    #3
    $display ("Time=%t\n  clk=%b", $realtime, clk);
    reset = 0;
    $display ("reset=%b", reset);
    //set load data for 3rd previous instruction
    if (k >=3)
      databusk = databusin[k-3];
    //check PC for this instruction
    if (k >= 0) begin
      $display ("  Testing PC for instruction %d", k);
      $display ("    Your iaddrbus =    %b", iaddrbus);
      $display ("    Correct iaddrbus = %b", iaddrbusout[k]);
      if (iaddrbusout[k] !== iaddrbus) begin
        $display ("    -------------ERROR. A Mismatch Has Occured-----------");
        error = error + 1;
      end
    end
    //put next instruction on ibus
    instrbus=instrbusin[k];
    $display ("  instrbus=%b %b %b %b %b for instruction %d: %s", instrbus[31:26], instrbus[25:21], instrbus[20:16], instrbus[15:11], instrbus[10:0], k, iname[k]);
    //check data address from 3rd previous instruction
    if ( (k >= 3) && (daddrbusout[k-3] !== dontcare) ) begin
      $display ("  Testing data address for instruction %d:", k-3);
      $display ("  %s", iname[k-3]);
      $display ("    Your daddrbus =    %b", daddrbus);
      $display ("    Correct daddrbus = %b", daddrbusout[k-3]);
      if (daddrbusout[k-3] !== daddrbus) begin
        $display ("    -------------ERROR. A Mismatch Has Occured-----------");
        error = error + 1;
      end
    end
    //check store data from 3rd previous instruction
    if ( (k >= 3) && (databusout[k-3] !== dontcare) ) begin
      $display ("  Testing store data for instruction %d:", k-3);
      $display ("  %s", iname[k-3]);
      $display ("    Your databus =    %b", databus);
      $display ("    Correct databus = %b", databusout[k-3]);
      if (databusout[k-3] !== databus) begin
        $display ("    -------------ERROR. A Mismatch Has Occured-----------");
        error = error + 1;
      end
    end
    clk = 0;
    $display ("Time=%t\n  clk=%b", $realtime, clk);
    #2
    clkd = 0;
    #3
    $display ("Time=%t\n  clk=%b", $realtime, clk);
  end
  if ( error !== 0) begin
    $display("--------- SIMULATION UNSUCCESFUL - MISMATCHES HAVE OCCURED ----------");
    $display(" No. Of Errors = %d", error);
  end
  if ( error == 0)
    $display("---------YOU DID IT!! SIMULATION SUCCESFULLY FINISHED----------");
end
endmodule