module VexRiscv (
      input   timerInterrupt,
      input   externalInterrupt,
      input   debug_bus_cmd_valid,
      output  debug_bus_cmd_ready,
      input   debug_bus_cmd_payload_wr,
      input  [7:0] debug_bus_cmd_payload_address,
      input  [31:0] debug_bus_cmd_payload_data,
      output reg [31:0] debug_bus_rsp_data,
      output  debug_resetOut,
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output [31:0] iBus_cmd_payload_pc,
      input   iBus_rsp_ready,
      input   iBus_rsp_error,
      input  [31:0] iBus_rsp_inst,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [1:0] dBus_cmd_payload_size,
      input   dBus_rsp_ready,
      input   dBus_rsp_error,
      input  [31:0] dBus_rsp_data,
      input   io_mainClk,
      input   resetCtrl_systemReset,
      input   resetCtrl_mainClkReset);
  reg [31:0] _zz_133;
  reg [31:0] _zz_134;
  wire  _zz_135;
  wire [1:0] _zz_136;
  wire [31:0] _zz_137;
  reg  _zz_138;
  reg [31:0] _zz_139;
  wire  _zz_140;
  wire  _zz_141;
  wire  _zz_142;
  wire [0:0] _zz_143;
  wire  _zz_144;
  wire  _zz_145;
  wire [1:0] _zz_146;
  wire  _zz_147;
  wire [1:0] _zz_148;
  wire [1:0] _zz_149;
  wire [2:0] _zz_150;
  wire [3:0] _zz_151;
  wire [4:0] _zz_152;
  wire [31:0] _zz_153;
  wire [0:0] _zz_154;
  wire [0:0] _zz_155;
  wire [0:0] _zz_156;
  wire [0:0] _zz_157;
  wire [0:0] _zz_158;
  wire [0:0] _zz_159;
  wire [0:0] _zz_160;
  wire [0:0] _zz_161;
  wire [0:0] _zz_162;
  wire [0:0] _zz_163;
  wire [0:0] _zz_164;
  wire [11:0] _zz_165;
  wire [11:0] _zz_166;
  wire [31:0] _zz_167;
  wire [31:0] _zz_168;
  wire [31:0] _zz_169;
  wire [31:0] _zz_170;
  wire [1:0] _zz_171;
  wire [31:0] _zz_172;
  wire [1:0] _zz_173;
  wire [1:0] _zz_174;
  wire [31:0] _zz_175;
  wire [32:0] _zz_176;
  wire [19:0] _zz_177;
  wire [11:0] _zz_178;
  wire [11:0] _zz_179;
  wire [0:0] _zz_180;
  wire [0:0] _zz_181;
  wire [0:0] _zz_182;
  wire [0:0] _zz_183;
  wire [0:0] _zz_184;
  wire [0:0] _zz_185;
  wire [0:0] _zz_186;
  wire [31:0] _zz_187;
  wire [31:0] _zz_188;
  wire [0:0] _zz_189;
  wire [0:0] _zz_190;
  wire [0:0] _zz_191;
  wire [0:0] _zz_192;
  wire  _zz_193;
  wire [0:0] _zz_194;
  wire [17:0] _zz_195;
  wire [0:0] _zz_196;
  wire [2:0] _zz_197;
  wire [0:0] _zz_198;
  wire [1:0] _zz_199;
  wire [2:0] _zz_200;
  wire [2:0] _zz_201;
  wire  _zz_202;
  wire [0:0] _zz_203;
  wire [13:0] _zz_204;
  wire [31:0] _zz_205;
  wire [31:0] _zz_206;
  wire  _zz_207;
  wire  _zz_208;
  wire [31:0] _zz_209;
  wire [31:0] _zz_210;
  wire  _zz_211;
  wire [0:0] _zz_212;
  wire [0:0] _zz_213;
  wire [0:0] _zz_214;
  wire [1:0] _zz_215;
  wire [0:0] _zz_216;
  wire [0:0] _zz_217;
  wire  _zz_218;
  wire [0:0] _zz_219;
  wire [10:0] _zz_220;
  wire [31:0] _zz_221;
  wire [31:0] _zz_222;
  wire [31:0] _zz_223;
  wire [31:0] _zz_224;
  wire [31:0] _zz_225;
  wire [31:0] _zz_226;
  wire [31:0] _zz_227;
  wire [31:0] _zz_228;
  wire [31:0] _zz_229;
  wire  _zz_230;
  wire  _zz_231;
  wire  _zz_232;
  wire [0:0] _zz_233;
  wire [0:0] _zz_234;
  wire  _zz_235;
  wire [0:0] _zz_236;
  wire [8:0] _zz_237;
  wire [31:0] _zz_238;
  wire [31:0] _zz_239;
  wire [0:0] _zz_240;
  wire [0:0] _zz_241;
  wire [1:0] _zz_242;
  wire [1:0] _zz_243;
  wire  _zz_244;
  wire [0:0] _zz_245;
  wire [5:0] _zz_246;
  wire [31:0] _zz_247;
  wire [31:0] _zz_248;
  wire [31:0] _zz_249;
  wire [31:0] _zz_250;
  wire [31:0] _zz_251;
  wire [31:0] _zz_252;
  wire  _zz_253;
  wire [0:0] _zz_254;
  wire [0:0] _zz_255;
  wire  _zz_256;
  wire [0:0] _zz_257;
  wire [2:0] _zz_258;
  wire [31:0] _zz_259;
  wire [31:0] _zz_260;
  wire [31:0] _zz_261;
  wire [0:0] _zz_262;
  wire [0:0] _zz_263;
  wire [1:0] _zz_264;
  wire [1:0] _zz_265;
  wire [3:0] _zz_266;
  wire [3:0] _zz_267;
  wire [31:0] _zz_268;
  wire [31:0] _zz_269;
  wire [31:0] _zz_270;
  wire [31:0] _zz_271;
  wire [31:0] _zz_272;
  wire  _zz_273;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [31:0] fetch_FORMAL_PC_NEXT;
  wire [31:0] prefetch_FORMAL_PC_NEXT;
  wire [31:0] fetch_INSTRUCTION;
  wire `ShiftCtrlEnum_binary_sequancial_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_1;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_2;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_3;
  wire `BranchCtrlEnum_binary_sequancial_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_4;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_5;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_6;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire [31:0] decode_RS1;
  wire  execute_BRANCH_DO;
  wire `AluCtrlEnum_binary_sequancial_type decode_ALU_CTRL;
  wire `AluCtrlEnum_binary_sequancial_type _zz_7;
  wire `AluCtrlEnum_binary_sequancial_type _zz_8;
  wire `AluCtrlEnum_binary_sequancial_type _zz_9;
  wire  decode_SRC_LESS_UNSIGNED;
  wire [31:0] execute_BRANCH_CALC;
  wire [31:0] decode_SRC1;
  wire `EnvCtrlEnum_binary_sequancial_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_10;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_11;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_12;
  wire `EnvCtrlEnum_binary_sequancial_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_13;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_14;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_15;
  wire  decode_MEMORY_ENABLE;
  wire [31:0] decode_SRC2;
  wire [31:0] decode_RS2;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_16;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_17;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_18;
  wire  decode_CSR_READ_OPCODE;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire  decode_CSR_WRITE_OPCODE;
  wire [31:0] memory_PC;
  wire [31:0] fetch_PC;
  wire  decode_IS_EBREAK;
  wire  execute_IS_EBREAK;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] _zz_19;
  wire [31:0] execute_PC;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_binary_sequancial_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_20;
  wire  _zz_21;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  wire `ShiftCtrlEnum_binary_sequancial_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_22;
  wire  _zz_23;
  wire [31:0] _zz_24;
  wire [31:0] _zz_25;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_26;
  wire [31:0] _zz_27;
  wire `Src2CtrlEnum_binary_sequancial_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_28;
  wire [31:0] _zz_29;
  wire [31:0] _zz_30;
  wire `Src1CtrlEnum_binary_sequancial_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_31;
  wire [31:0] _zz_32;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_binary_sequancial_type execute_ALU_CTRL;
  wire `AluCtrlEnum_binary_sequancial_type _zz_33;
  wire [31:0] _zz_34;
  wire [31:0] execute_SRC2;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_35;
  wire [31:0] _zz_36;
  wire  _zz_37;
  reg  _zz_38;
  wire [31:0] _zz_39;
  wire [31:0] _zz_40;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_41;
  wire  _zz_42;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_43;
  wire  _zz_44;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_45;
  wire  _zz_46;
  wire `AluCtrlEnum_binary_sequancial_type _zz_47;
  wire  _zz_48;
  wire  _zz_49;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_50;
  wire  _zz_51;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_52;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_53;
  wire  _zz_54;
  wire  _zz_55;
  wire  _zz_56;
  wire  _zz_57;
  reg [31:0] _zz_58;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_SRC1;
  wire  execute_IS_CSR;
  wire  decode_IS_CSR;
  wire  _zz_59;
  wire  _zz_60;
  wire `EnvCtrlEnum_binary_sequancial_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_61;
  wire [31:0] prefetch_PC_CALC_WITHOUT_JUMP;
  reg [31:0] _zz_62;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_63;
  wire [1:0] _zz_64;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_65;
  wire [31:0] _zz_66;
  wire [31:0] _zz_67;
  reg [31:0] _zz_68;
  wire [31:0] _zz_69;
  reg [31:0] _zz_70;
  wire [31:0] prefetch_PC;
  wire [31:0] _zz_71;
  wire [31:0] _zz_72;
  wire [31:0] _zz_73;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  prefetch_arbitration_haltItself;
  reg  prefetch_arbitration_haltByOther;
  reg  prefetch_arbitration_removeIt;
  wire  prefetch_arbitration_flushAll;
  wire  prefetch_arbitration_redoIt;
  reg  prefetch_arbitration_isValid;
  wire  prefetch_arbitration_isStuck;
  wire  prefetch_arbitration_isStuckByOthers;
  wire  prefetch_arbitration_isFlushed;
  wire  prefetch_arbitration_isMoving;
  wire  prefetch_arbitration_isFiring;
  reg  fetch_arbitration_haltItself;
  wire  fetch_arbitration_haltByOther;
  reg  fetch_arbitration_removeIt;
  wire  fetch_arbitration_flushAll;
  wire  fetch_arbitration_redoIt;
  reg  fetch_arbitration_isValid;
  wire  fetch_arbitration_isStuck;
  wire  fetch_arbitration_isStuckByOthers;
  wire  fetch_arbitration_isFlushed;
  wire  fetch_arbitration_isMoving;
  wire  fetch_arbitration_isFiring;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  wire  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
  reg  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  wire  memory_arbitration_flushAll;
  wire  memory_arbitration_redoIt;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  wire  writeBack_arbitration_redoIt;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  _zz_74;
  reg [31:0] _zz_75;
  wire  contextSwitching;
  reg [1:0] _zz_76;
  reg  _zz_77;
  wire  _zz_78;
  reg [31:0] prefetch_PcManagerSimplePlugin_pcReg /* verilator public */ ;
  (* syn_keep , keep *) wire [31:0] prefetch_PcManagerSimplePlugin_pcPlus4 /* synthesis syn_keep = 1 */ ;
  wire  prefetch_PcManagerSimplePlugin_jump_pcLoad_valid;
  wire [31:0] prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_79;
  wire  _zz_80;
  reg  prefetch_IBusSimplePlugin_pendingCmd;
  reg  _zz_81;
  reg [31:0] _zz_82;
  reg [31:0] _zz_83;
  reg [3:0] _zz_84;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_85;
  reg [31:0] _zz_86;
  wire  _zz_87;
  reg [31:0] _zz_88;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
  wire [31:0] CsrPlugin_mtvec;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mbadaddr;
  reg [63:0] CsrPlugin_mcycle = 64'b0000010001001101000000101000010001000111110101110010011001010011;
  reg [63:0] CsrPlugin_minstret = 64'b1110011011100100100100010001110100010111101010011111010100011101;
  reg  CsrPlugin_pipelineLiberator_enable;
  wire  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptRequest;
  wire  CsrPlugin_interrupt;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_writeBackWasWfi;
  reg [31:0] _zz_89;
  reg  _zz_90;
  reg  execute_CsrPlugin_illegalAccess;
  wire [31:0] execute_CsrPlugin_writeSrc;
  reg [31:0] execute_CsrPlugin_readData;
  reg  execute_CsrPlugin_readDataRegValid;
  reg [31:0] execute_CsrPlugin_writeData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  wire [11:0] execute_CsrPlugin_csrAddress;
  wire [23:0] _zz_91;
  wire  _zz_92;
  wire  _zz_93;
  wire  _zz_94;
  wire  _zz_95;
  wire  _zz_96;
  wire  _zz_97;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_98;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_99;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_100;
  wire `AluCtrlEnum_binary_sequancial_type _zz_101;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_102;
  wire `EnvCtrlEnum_binary_sequancial_type _zz_103;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_104;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire  _zz_105;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  wire  _zz_106;
  reg  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg  _zz_107;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_108;
  reg [31:0] _zz_109;
  wire  _zz_110;
  reg [19:0] _zz_111;
  wire  _zz_112;
  reg [19:0] _zz_113;
  reg [31:0] _zz_114;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_115;
  reg  _zz_116;
  reg  _zz_117;
  reg  _zz_118;
  reg [4:0] _zz_119;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_120;
  reg  _zz_121;
  reg  _zz_122;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_123;
  reg [10:0] _zz_124;
  wire  _zz_125;
  reg [19:0] _zz_126;
  wire  _zz_127;
  reg [18:0] _zz_128;
  reg [31:0] _zz_129;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  reg  DebugPlugin_insertDecodeInstruction;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipActive;
  reg  _zz_130;
  wire  DebugPlugin_isPipBusy;
  reg  DebugPlugin_haltedByBreak;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_131;
  reg  _zz_132;
  reg  decode_to_execute_IS_EBREAK;
  reg [31:0] prefetch_to_fetch_PC;
  reg [31:0] fetch_to_decode_PC;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg `AluBitwiseCtrlEnum_binary_sequancial_type decode_to_execute_ALU_BITWISE_CTRL;
  reg [31:0] decode_to_execute_RS2;
  reg [31:0] decode_to_execute_SRC2;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg `EnvCtrlEnum_binary_sequancial_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_binary_sequancial_type execute_to_memory_ENV_CTRL;
  reg [31:0] decode_to_execute_SRC1;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg `AluCtrlEnum_binary_sequancial_type decode_to_execute_ALU_CTRL;
  reg  execute_to_memory_BRANCH_DO;
  reg [31:0] decode_to_execute_RS1;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg `BranchCtrlEnum_binary_sequancial_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg `ShiftCtrlEnum_binary_sequancial_type decode_to_execute_SHIFT_CTRL;
  reg [31:0] fetch_to_decode_INSTRUCTION;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg [31:0] prefetch_to_fetch_FORMAL_PC_NEXT;
  reg [31:0] fetch_to_decode_FORMAL_PC_NEXT;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign iBus_cmd_valid = _zz_135;
  assign dBus_cmd_payload_size = _zz_136;
  assign dBus_cmd_payload_address = _zz_137;
  assign debug_bus_cmd_ready = _zz_138;
  assign _zz_140 = (execute_arbitration_isFiring && execute_IS_EBREAK);
  assign _zz_141 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_142 = (! execute_arbitration_isStuckByOthers);
  assign _zz_143 = debug_bus_cmd_payload_address[2 : 2];
  assign _zz_144 = (memory_ENV_CTRL == `EnvCtrlEnum_binary_sequancial_MRET);
  assign _zz_145 = (CsrPlugin_exception || (CsrPlugin_interrupt && CsrPlugin_pipelineLiberator_done));
  assign _zz_146 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_147 = execute_INSTRUCTION[13];
  assign _zz_148 = (_zz_79 & (~ _zz_149));
  assign _zz_149 = (_zz_79 - (2'b01));
  assign _zz_150 = ((CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE) ? (3'b011) : (3'b111));
  assign _zz_151 = {1'd0, _zz_150};
  assign _zz_152 = execute_INSTRUCTION[19 : 15];
  assign _zz_153 = {27'd0, _zz_152};
  assign _zz_154 = _zz_91[0 : 0];
  assign _zz_155 = _zz_91[1 : 1];
  assign _zz_156 = _zz_91[2 : 2];
  assign _zz_157 = _zz_91[3 : 3];
  assign _zz_158 = _zz_91[8 : 8];
  assign _zz_159 = _zz_91[11 : 11];
  assign _zz_160 = _zz_91[12 : 12];
  assign _zz_161 = _zz_91[15 : 15];
  assign _zz_162 = _zz_91[18 : 18];
  assign _zz_163 = _zz_91[21 : 21];
  assign _zz_164 = execute_SRC_LESS;
  assign _zz_165 = decode_INSTRUCTION[31 : 20];
  assign _zz_166 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_167 = ($signed(_zz_168) + $signed(_zz_172));
  assign _zz_168 = ($signed(_zz_169) + $signed(_zz_170));
  assign _zz_169 = execute_SRC1;
  assign _zz_170 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_171 = (execute_SRC_USE_SUB_LESS ? _zz_173 : _zz_174);
  assign _zz_172 = {{30{_zz_171[1]}}, _zz_171};
  assign _zz_173 = (2'b01);
  assign _zz_174 = (2'b00);
  assign _zz_175 = (_zz_176 >>> 1);
  assign _zz_176 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequancial_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_177 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_178 = execute_INSTRUCTION[31 : 20];
  assign _zz_179 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_180 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_181 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_182 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_183 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_184 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_185 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_186 = _zz_80;
  assign _zz_187 = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign _zz_188 = (32'b00000000000000000001000000000000);
  assign _zz_189 = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_190 = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_191 = ((decode_INSTRUCTION & (32'b00000000000100000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_192 = (1'b0);
  assign _zz_193 = 1'b0;
  assign _zz_194 = ({_zz_97,{_zz_196,_zz_197}} != (5'b00000));
  assign _zz_195 = {({_zz_198,_zz_199} != (3'b000)),{(_zz_200 != _zz_201),{_zz_202,{_zz_203,_zz_204}}}};
  assign _zz_196 = _zz_96;
  assign _zz_197 = {(_zz_205 == _zz_206),{_zz_207,_zz_208}};
  assign _zz_198 = _zz_97;
  assign _zz_199 = {_zz_95,(_zz_209 == _zz_210)};
  assign _zz_200 = {_zz_97,{_zz_96,_zz_95}};
  assign _zz_201 = (3'b000);
  assign _zz_202 = ({_zz_211,{_zz_212,_zz_213}} != (3'b000));
  assign _zz_203 = ({_zz_214,_zz_215} != (3'b000));
  assign _zz_204 = {(_zz_216 != _zz_217),{_zz_218,{_zz_219,_zz_220}}};
  assign _zz_205 = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_206 = (32'b00000000000000000001000000010000);
  assign _zz_207 = ((decode_INSTRUCTION & _zz_221) == (32'b00000000000000000010000000010000));
  assign _zz_208 = ((decode_INSTRUCTION & _zz_222) == (32'b00000000000000000000000000010000));
  assign _zz_209 = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_210 = (32'b00000000000000000000000000100000);
  assign _zz_211 = ((decode_INSTRUCTION & _zz_223) == (32'b01000000000000000000000000110000));
  assign _zz_212 = (_zz_224 == _zz_225);
  assign _zz_213 = (_zz_226 == _zz_227);
  assign _zz_214 = (_zz_228 == _zz_229);
  assign _zz_215 = {_zz_230,_zz_231};
  assign _zz_216 = _zz_92;
  assign _zz_217 = (1'b0);
  assign _zz_218 = (_zz_232 != (1'b0));
  assign _zz_219 = (_zz_233 != _zz_234);
  assign _zz_220 = {_zz_235,{_zz_236,_zz_237}};
  assign _zz_221 = (32'b00000000000000000010000000010000);
  assign _zz_222 = (32'b00000000000000000000000001010000);
  assign _zz_223 = (32'b01000000000000000000000000110000);
  assign _zz_224 = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_225 = (32'b00000000000000000010000000010000);
  assign _zz_226 = (decode_INSTRUCTION & (32'b00000000000000000000000001010100));
  assign _zz_227 = (32'b00000000000000000000000001000000);
  assign _zz_228 = (decode_INSTRUCTION & (32'b00000000000000000100000000000100));
  assign _zz_229 = (32'b00000000000000000100000000000000);
  assign _zz_230 = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_231 = ((decode_INSTRUCTION & (32'b00000000000000000011000000000100)) == (32'b00000000000000000001000000000000));
  assign _zz_232 = ((decode_INSTRUCTION & (32'b00100000000000000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_233 = _zz_94;
  assign _zz_234 = (1'b0);
  assign _zz_235 = ((_zz_238 == _zz_239) != (1'b0));
  assign _zz_236 = ({_zz_240,_zz_241} != (2'b00));
  assign _zz_237 = {(_zz_242 != _zz_243),{_zz_244,{_zz_245,_zz_246}}};
  assign _zz_238 = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_239 = (32'b00000000000000000101000000010000);
  assign _zz_240 = ((decode_INSTRUCTION & _zz_247) == (32'b01000000000000000001000000010000));
  assign _zz_241 = ((decode_INSTRUCTION & _zz_248) == (32'b00000000000000000001000000010000));
  assign _zz_242 = {(_zz_249 == _zz_250),(_zz_251 == _zz_252)};
  assign _zz_243 = (2'b00);
  assign _zz_244 = (_zz_93 != (1'b0));
  assign _zz_245 = (_zz_253 != (1'b0));
  assign _zz_246 = {(_zz_254 != _zz_255),{_zz_256,{_zz_257,_zz_258}}};
  assign _zz_247 = (32'b01000000000000000011000001010100);
  assign _zz_248 = (32'b00000000000000000111000001010100);
  assign _zz_249 = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_250 = (32'b00000000000000000010000000000000);
  assign _zz_251 = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_252 = (32'b00000000000000000001000000000000);
  assign _zz_253 = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign _zz_254 = _zz_93;
  assign _zz_255 = (1'b0);
  assign _zz_256 = (((decode_INSTRUCTION & _zz_259) == (32'b00000000000000000000000000000100)) != (1'b0));
  assign _zz_257 = ((_zz_260 == _zz_261) != (1'b0));
  assign _zz_258 = {({_zz_262,_zz_263} != (2'b00)),{(_zz_264 != _zz_265),(_zz_266 != _zz_267)}};
  assign _zz_259 = (32'b00000000000000000000000001000100);
  assign _zz_260 = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_261 = (32'b00000000000000000000000000000000);
  assign _zz_262 = ((decode_INSTRUCTION & (32'b00000000000000000000000000110100)) == (32'b00000000000000000000000000100000));
  assign _zz_263 = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100000));
  assign _zz_264 = {((decode_INSTRUCTION & _zz_268) == (32'b00000000000000000001000001010000)),((decode_INSTRUCTION & _zz_269) == (32'b00000000000000000010000001010000))};
  assign _zz_265 = (2'b00);
  assign _zz_266 = {((decode_INSTRUCTION & _zz_270) == (32'b00000000000000000000000000000000)),{(_zz_271 == _zz_272),{_zz_92,_zz_273}}};
  assign _zz_267 = (4'b0000);
  assign _zz_268 = (32'b00000000000000000001000001010000);
  assign _zz_269 = (32'b00000000000000000010000001010000);
  assign _zz_270 = (32'b00000000000000000000000001000100);
  assign _zz_271 = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_272 = (32'b00000000000000000000000000000000);
  assign _zz_273 = ((decode_INSTRUCTION & (32'b00000000000000000101000000000100)) == (32'b00000000000000000001000000000000));
  always @ (posedge io_mainClk) begin
    if(_zz_38) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end
  always @ (posedge io_mainClk) begin
    if(_zz_105) begin
      _zz_133 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end
  always @ (posedge io_mainClk) begin
    if(_zz_106) begin
      _zz_134 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end
  always @(*) begin
    case(_zz_186)
      1'b0 : begin
        _zz_139 = memory_BRANCH_CALC;
      end
      default : begin
        _zz_139 = _zz_75;
      end
    endcase
  end
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_64;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = fetch_to_decode_FORMAL_PC_NEXT;
  assign fetch_FORMAL_PC_NEXT = prefetch_to_fetch_FORMAL_PC_NEXT;
  assign prefetch_FORMAL_PC_NEXT = _zz_71;
  assign fetch_INSTRUCTION = _zz_68;
  assign decode_SHIFT_CTRL = _zz_1;
  assign _zz_2 = _zz_3;
  assign decode_BRANCH_CTRL = _zz_4;
  assign _zz_5 = _zz_6;
  assign memory_MEMORY_READ_DATA = _zz_63;
  assign decode_RS1 = _zz_40;
  assign execute_BRANCH_DO = _zz_21;
  assign decode_ALU_CTRL = _zz_7;
  assign _zz_8 = _zz_9;
  assign decode_SRC_LESS_UNSIGNED = _zz_51;
  assign execute_BRANCH_CALC = _zz_19;
  assign decode_SRC1 = _zz_32;
  assign execute_ENV_CTRL = _zz_10;
  assign _zz_11 = _zz_12;
  assign decode_ENV_CTRL = _zz_13;
  assign _zz_14 = _zz_15;
  assign decode_MEMORY_ENABLE = _zz_54;
  assign decode_SRC2 = _zz_29;
  assign decode_RS2 = _zz_39;
  assign decode_ALU_BITWISE_CTRL = _zz_16;
  assign _zz_17 = _zz_18;
  assign decode_CSR_READ_OPCODE = _zz_59;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_34;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_42;
  assign decode_SRC_USE_SUB_LESS = _zz_46;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_49;
  assign decode_CSR_WRITE_OPCODE = _zz_60;
  assign memory_PC = execute_to_memory_PC;
  assign fetch_PC = prefetch_to_fetch_PC;
  assign decode_IS_EBREAK = _zz_48;
  assign execute_IS_EBREAK = decode_to_execute_IS_EBREAK;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_20;
  assign decode_RS2_USE = _zz_55;
  assign decode_RS1_USE = _zz_57;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign execute_SHIFT_CTRL = _zz_22;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_26 = decode_PC;
  assign _zz_27 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_28;
  assign _zz_30 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_31;
  assign execute_SRC_ADD_SUB = _zz_25;
  assign execute_SRC_LESS = _zz_23;
  assign execute_ALU_CTRL = _zz_33;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_35;
  assign _zz_36 = writeBack_INSTRUCTION;
  assign _zz_37 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_38 = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_38 = 1'b1;
    end
  end
  assign decode_INSTRUCTION_ANTICIPATED = _zz_67;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_44;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end
  always @ (*) begin
    _zz_58 = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_readDataRegValid)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_58 = execute_CsrPlugin_readData;
    end
    if(_zz_141)begin
      _zz_58 = _zz_115;
      if(_zz_142)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
  end
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign decode_IS_CSR = _zz_56;
  assign memory_ENV_CTRL = _zz_61;
  assign prefetch_PC_CALC_WITHOUT_JUMP = _zz_73;
  always @ (*) begin
    _zz_62 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_62 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_SRC_ADD = _zz_24;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_ALIGNEMENT_FAULT = _zz_65;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign _zz_66 = fetch_INSTRUCTION;
  assign _zz_69 = prefetch_PC;
  always @ (*) begin
    _zz_70 = execute_FORMAL_PC_NEXT;
    if(_zz_74)begin
      _zz_70 = _zz_75;
    end
  end
  assign prefetch_PC = _zz_72;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = fetch_to_decode_PC;
  assign decode_INSTRUCTION = fetch_to_decode_INSTRUCTION;
  always @ (*) begin
    prefetch_arbitration_haltItself = 1'b0;
    if(((! iBus_cmd_ready) || (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))))begin
      prefetch_arbitration_haltItself = 1'b1;
    end
  end
  always @ (*) begin
    prefetch_arbitration_haltByOther = 1'b0;
    decode_arbitration_flushAll = 1'b0;
    if(CsrPlugin_pipelineLiberator_enable)begin
      prefetch_arbitration_haltByOther = 1'b1;
    end
    if(_zz_140)begin
      prefetch_arbitration_haltByOther = 1'b1;
      decode_arbitration_flushAll = 1'b1;
    end
    if(DebugPlugin_haltIt)begin
      prefetch_arbitration_haltByOther = 1'b1;
    end
  end
  always @ (*) begin
    prefetch_arbitration_removeIt = 1'b0;
    if(prefetch_arbitration_isFlushed)begin
      prefetch_arbitration_removeIt = 1'b1;
    end
  end
  assign prefetch_arbitration_flushAll = 1'b0;
  assign prefetch_arbitration_redoIt = 1'b0;
  always @ (*) begin
    fetch_arbitration_haltItself = 1'b0;
    if(((fetch_arbitration_isValid && (! iBus_rsp_ready)) && (! _zz_81)))begin
      fetch_arbitration_haltItself = 1'b1;
    end
  end
  assign fetch_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    fetch_arbitration_removeIt = 1'b0;
    if(fetch_arbitration_isFlushed)begin
      fetch_arbitration_removeIt = 1'b1;
    end
  end
  assign fetch_arbitration_flushAll = 1'b0;
  assign fetch_arbitration_redoIt = 1'b0;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((decode_arbitration_isValid && decode_IS_CSR) && (execute_arbitration_isValid || memory_arbitration_isValid)))begin
      decode_arbitration_haltItself = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_116 || _zz_117)))begin
      decode_arbitration_haltItself = 1'b1;
    end
    DebugPlugin_insertDecodeInstruction = 1'b0;
    _zz_138 = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_143)
        1'b0 : begin
        end
        default : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_insertDecodeInstruction = 1'b1;
            if(DebugPlugin_secondCycle)begin
              decode_arbitration_haltItself = 1'b1;
            end
            _zz_138 = (! ((DebugPlugin_firstCycle || DebugPlugin_secondCycle) || decode_arbitration_isValid));
          end
        end
      endcase
    end
  end
  assign decode_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end
  assign decode_arbitration_redoIt = 1'b0;
  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end
  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(_zz_144)begin
      if(memory_arbitration_isFiring)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
    if(_zz_78)begin
      execute_arbitration_flushAll = 1'b1;
    end
  end
  assign execute_arbitration_redoIt = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    _zz_74 = 1'b0;
    _zz_75 = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_145)begin
      _zz_74 = 1'b1;
      _zz_75 = CsrPlugin_mtvec;
    end
    if(_zz_144)begin
      memory_arbitration_haltItself = writeBack_arbitration_isValid;
      if(memory_arbitration_isFiring)begin
        _zz_74 = 1'b1;
        _zz_75 = CsrPlugin_mepc;
      end
    end
  end
  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end
  assign memory_arbitration_flushAll = 1'b0;
  assign memory_arbitration_redoIt = 1'b0;
  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end
  assign writeBack_arbitration_flushAll = 1'b0;
  assign writeBack_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_77 = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      _zz_77 = 1'b0;
    end
  end
  assign prefetch_PcManagerSimplePlugin_pcPlus4 = (prefetch_PcManagerSimplePlugin_pcReg + (32'b00000000000000000000000000000100));
  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_valid = (_zz_74 || _zz_78);
  assign _zz_79 = {_zz_74,_zz_78};
  assign _zz_80 = _zz_148[1];
  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_payload = _zz_139;
  assign _zz_73 = prefetch_PcManagerSimplePlugin_pcReg;
  assign _zz_72 = prefetch_PcManagerSimplePlugin_pcReg;
  assign _zz_71 = (prefetch_PC + (32'b00000000000000000000000000000100));
  assign _zz_135 = (((prefetch_arbitration_isValid && (! prefetch_arbitration_removeIt)) && (! prefetch_arbitration_isStuckByOthers)) && (! (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))));
  assign iBus_cmd_payload_pc = _zz_69;
  always @ (*) begin
    _zz_68 = iBus_rsp_inst;
    if(_zz_81)begin
      _zz_68 = _zz_82;
    end
  end
  assign _zz_67 = (decode_arbitration_isStuck ? decode_INSTRUCTION : _zz_66);
  assign _zz_65 = 1'b0;
  assign dBus_cmd_valid = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_removeIt)) && (! execute_ALIGNEMENT_FAULT));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign _zz_137 = execute_SRC_ADD;
  assign _zz_136 = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(_zz_136)
      2'b00 : begin
        _zz_83 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_83 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_83 = execute_RS2[31 : 0];
      end
    endcase
  end
  assign dBus_cmd_payload_data = _zz_83;
  assign _zz_64 = _zz_137[1 : 0];
  always @ (*) begin
    case(_zz_136)
      2'b00 : begin
        _zz_84 = (4'b0001);
      end
      2'b01 : begin
        _zz_84 = (4'b0011);
      end
      default : begin
        _zz_84 = (4'b1111);
      end
    endcase
  end
  assign execute_DBusSimplePlugin_formalMask = (_zz_84 <<< _zz_137[1 : 0]);
  assign _zz_63 = dBus_rsp_data;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end
  assign _zz_85 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_86[31] = _zz_85;
    _zz_86[30] = _zz_85;
    _zz_86[29] = _zz_85;
    _zz_86[28] = _zz_85;
    _zz_86[27] = _zz_85;
    _zz_86[26] = _zz_85;
    _zz_86[25] = _zz_85;
    _zz_86[24] = _zz_85;
    _zz_86[23] = _zz_85;
    _zz_86[22] = _zz_85;
    _zz_86[21] = _zz_85;
    _zz_86[20] = _zz_85;
    _zz_86[19] = _zz_85;
    _zz_86[18] = _zz_85;
    _zz_86[17] = _zz_85;
    _zz_86[16] = _zz_85;
    _zz_86[15] = _zz_85;
    _zz_86[14] = _zz_85;
    _zz_86[13] = _zz_85;
    _zz_86[12] = _zz_85;
    _zz_86[11] = _zz_85;
    _zz_86[10] = _zz_85;
    _zz_86[9] = _zz_85;
    _zz_86[8] = _zz_85;
    _zz_86[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end
  assign _zz_87 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_88[31] = _zz_87;
    _zz_88[30] = _zz_87;
    _zz_88[29] = _zz_87;
    _zz_88[28] = _zz_87;
    _zz_88[27] = _zz_87;
    _zz_88[26] = _zz_87;
    _zz_88[25] = _zz_87;
    _zz_88[24] = _zz_87;
    _zz_88[23] = _zz_87;
    _zz_88[22] = _zz_87;
    _zz_88[21] = _zz_87;
    _zz_88[20] = _zz_87;
    _zz_88[19] = _zz_87;
    _zz_88[18] = _zz_87;
    _zz_88[17] = _zz_87;
    _zz_88[16] = _zz_87;
    _zz_88[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end
  always @ (*) begin
    case(_zz_146)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_86;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_88;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end
  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000001000010);
  assign CsrPlugin_mtvec = (32'b10000000000000000000000000100000);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_enable = 1'b0;
    if(CsrPlugin_interrupt)begin
      CsrPlugin_pipelineLiberator_enable = 1'b1;
    end
  end
  assign CsrPlugin_pipelineLiberator_done = (! ((((fetch_arbitration_isValid || decode_arbitration_isValid) || execute_arbitration_isValid) || memory_arbitration_isValid) || writeBack_arbitration_isValid));
  assign CsrPlugin_interruptRequest = ((((CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE) || (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE)) || (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE)) && CsrPlugin_mstatus_MIE);
  assign CsrPlugin_interrupt = (CsrPlugin_interruptRequest && _zz_77);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_writeBackWasWfi = 1'b0;
  always @ (*) begin
    case(CsrPlugin_exception)
      1'b1 : begin
        _zz_89 = writeBack_PC;
      end
      default : begin
        _zz_89 = (CsrPlugin_writeBackWasWfi ? writeBack_PC : prefetch_PC_CALC_WITHOUT_JUMP);
      end
    endcase
  end
  assign contextSwitching = _zz_74;
  assign _zz_60 = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_59 = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = (execute_arbitration_isValid && execute_IS_CSR);
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
    if((_zz_76 < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
  end
  assign execute_CsrPlugin_writeSrc = (execute_INSTRUCTION[14] ? _zz_153 : execute_SRC1);
  always @ (*) begin
    case(_zz_147)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_CsrPlugin_writeSrc;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (memory_REGFILE_WRITE_DATA & (~ execute_CsrPlugin_writeSrc)) : (memory_REGFILE_WRITE_DATA | execute_CsrPlugin_writeSrc));
      end
    endcase
  end
  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && execute_CsrPlugin_readDataRegValid);
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_readDataRegValid));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_92 = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign _zz_93 = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_94 = ((decode_INSTRUCTION & (32'b00000000000000000000000000010000)) == (32'b00000000000000000000000000010000));
  assign _zz_95 = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_96 = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_97 = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_91 = {({(_zz_187 == _zz_188),_zz_97} != (2'b00)),{({_zz_97,{_zz_189,_zz_190}} != (3'b000)),{(_zz_94 != (1'b0)),{(_zz_191 != _zz_192),{_zz_193,{_zz_194,_zz_195}}}}}};
  assign _zz_57 = _zz_154[0];
  assign _zz_56 = _zz_155[0];
  assign _zz_55 = _zz_156[0];
  assign _zz_54 = _zz_157[0];
  assign _zz_98 = _zz_91[5 : 4];
  assign _zz_53 = _zz_98;
  assign _zz_99 = _zz_91[7 : 6];
  assign _zz_52 = _zz_99;
  assign _zz_51 = _zz_158[0];
  assign _zz_100 = _zz_91[10 : 9];
  assign _zz_50 = _zz_100;
  assign _zz_49 = _zz_159[0];
  assign _zz_48 = _zz_160[0];
  assign _zz_101 = _zz_91[14 : 13];
  assign _zz_47 = _zz_101;
  assign _zz_46 = _zz_161[0];
  assign _zz_102 = _zz_91[17 : 16];
  assign _zz_45 = _zz_102;
  assign _zz_44 = _zz_162[0];
  assign _zz_103 = _zz_91[20 : 19];
  assign _zz_43 = _zz_103;
  assign _zz_42 = _zz_163[0];
  assign _zz_104 = _zz_91[23 : 22];
  assign _zz_41 = _zz_104;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign _zz_105 = 1'b1;
  assign decode_RegFilePlugin_rs1Data = _zz_133;
  assign _zz_106 = 1'b1;
  assign decode_RegFilePlugin_rs2Data = _zz_134;
  assign _zz_40 = decode_RegFilePlugin_rs1Data;
  assign _zz_39 = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    writeBack_RegFilePlugin_regFileWrite_valid = (_zz_37 && writeBack_arbitration_isFiring);
    if(_zz_107)begin
      writeBack_RegFilePlugin_regFileWrite_valid = 1'b1;
    end
  end
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_36[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_62;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequancial_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_XOR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = execute_SRC1;
      end
    endcase
  end
  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequancial_BITWISE : begin
        _zz_108 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_binary_sequancial_SLT_SLTU : begin
        _zz_108 = {31'd0, _zz_164};
      end
      default : begin
        _zz_108 = execute_SRC_ADD_SUB;
      end
    endcase
  end
  assign _zz_34 = _zz_108;
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequancial_RS : begin
        _zz_109 = _zz_30;
      end
      `Src1CtrlEnum_binary_sequancial_FOUR : begin
        _zz_109 = (32'b00000000000000000000000000000100);
      end
      default : begin
        _zz_109 = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
    endcase
  end
  assign _zz_32 = _zz_109;
  assign _zz_110 = _zz_165[11];
  always @ (*) begin
    _zz_111[19] = _zz_110;
    _zz_111[18] = _zz_110;
    _zz_111[17] = _zz_110;
    _zz_111[16] = _zz_110;
    _zz_111[15] = _zz_110;
    _zz_111[14] = _zz_110;
    _zz_111[13] = _zz_110;
    _zz_111[12] = _zz_110;
    _zz_111[11] = _zz_110;
    _zz_111[10] = _zz_110;
    _zz_111[9] = _zz_110;
    _zz_111[8] = _zz_110;
    _zz_111[7] = _zz_110;
    _zz_111[6] = _zz_110;
    _zz_111[5] = _zz_110;
    _zz_111[4] = _zz_110;
    _zz_111[3] = _zz_110;
    _zz_111[2] = _zz_110;
    _zz_111[1] = _zz_110;
    _zz_111[0] = _zz_110;
  end
  assign _zz_112 = _zz_166[11];
  always @ (*) begin
    _zz_113[19] = _zz_112;
    _zz_113[18] = _zz_112;
    _zz_113[17] = _zz_112;
    _zz_113[16] = _zz_112;
    _zz_113[15] = _zz_112;
    _zz_113[14] = _zz_112;
    _zz_113[13] = _zz_112;
    _zz_113[12] = _zz_112;
    _zz_113[11] = _zz_112;
    _zz_113[10] = _zz_112;
    _zz_113[9] = _zz_112;
    _zz_113[8] = _zz_112;
    _zz_113[7] = _zz_112;
    _zz_113[6] = _zz_112;
    _zz_113[5] = _zz_112;
    _zz_113[4] = _zz_112;
    _zz_113[3] = _zz_112;
    _zz_113[2] = _zz_112;
    _zz_113[1] = _zz_112;
    _zz_113[0] = _zz_112;
  end
  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequancial_RS : begin
        _zz_114 = _zz_27;
      end
      `Src2CtrlEnum_binary_sequancial_IMI : begin
        _zz_114 = {_zz_111,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_binary_sequancial_IMS : begin
        _zz_114 = {_zz_113,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_114 = _zz_26;
      end
    endcase
  end
  assign _zz_29 = _zz_114;
  assign execute_SrcPlugin_addSub = _zz_167;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_25 = execute_SrcPlugin_addSub;
  assign _zz_24 = execute_SrcPlugin_addSub;
  assign _zz_23 = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_binary_sequancial_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequancial_SLL_1 : begin
        _zz_115 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_115 = _zz_175;
      end
    endcase
  end
  always @ (*) begin
    _zz_116 = 1'b0;
    _zz_117 = 1'b0;
    if(_zz_118)begin
      if((_zz_119 == decode_INSTRUCTION[19 : 15]))begin
        _zz_116 = 1'b1;
      end
      if((_zz_119 == decode_INSTRUCTION[24 : 20]))begin
        _zz_117 = 1'b1;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! 1'b1)))begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_116 = 1'b1;
        end
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_117 = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_116 = 1'b1;
        end
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_117 = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_116 = 1'b1;
        end
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_117 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_116 = 1'b0;
    end
    if((! decode_RS2_USE))begin
      _zz_117 = 1'b0;
    end
  end
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_120 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_120 == (3'b000))) begin
        _zz_121 = execute_BranchPlugin_eq;
    end else if((_zz_120 == (3'b001))) begin
        _zz_121 = (! execute_BranchPlugin_eq);
    end else if((((_zz_120 & (3'b101)) == (3'b101)))) begin
        _zz_121 = (! execute_SRC_LESS);
    end else begin
        _zz_121 = execute_SRC_LESS;
    end
  end
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_INC : begin
        _zz_122 = 1'b0;
      end
      `BranchCtrlEnum_binary_sequancial_JAL : begin
        _zz_122 = 1'b1;
      end
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        _zz_122 = 1'b1;
      end
      default : begin
        _zz_122 = _zz_121;
      end
    endcase
  end
  assign _zz_21 = _zz_122;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_JALR) ? execute_RS1 : execute_PC);
  assign _zz_123 = _zz_177[19];
  always @ (*) begin
    _zz_124[10] = _zz_123;
    _zz_124[9] = _zz_123;
    _zz_124[8] = _zz_123;
    _zz_124[7] = _zz_123;
    _zz_124[6] = _zz_123;
    _zz_124[5] = _zz_123;
    _zz_124[4] = _zz_123;
    _zz_124[3] = _zz_123;
    _zz_124[2] = _zz_123;
    _zz_124[1] = _zz_123;
    _zz_124[0] = _zz_123;
  end
  assign _zz_125 = _zz_178[11];
  always @ (*) begin
    _zz_126[19] = _zz_125;
    _zz_126[18] = _zz_125;
    _zz_126[17] = _zz_125;
    _zz_126[16] = _zz_125;
    _zz_126[15] = _zz_125;
    _zz_126[14] = _zz_125;
    _zz_126[13] = _zz_125;
    _zz_126[12] = _zz_125;
    _zz_126[11] = _zz_125;
    _zz_126[10] = _zz_125;
    _zz_126[9] = _zz_125;
    _zz_126[8] = _zz_125;
    _zz_126[7] = _zz_125;
    _zz_126[6] = _zz_125;
    _zz_126[5] = _zz_125;
    _zz_126[4] = _zz_125;
    _zz_126[3] = _zz_125;
    _zz_126[2] = _zz_125;
    _zz_126[1] = _zz_125;
    _zz_126[0] = _zz_125;
  end
  assign _zz_127 = _zz_179[11];
  always @ (*) begin
    _zz_128[18] = _zz_127;
    _zz_128[17] = _zz_127;
    _zz_128[16] = _zz_127;
    _zz_128[15] = _zz_127;
    _zz_128[14] = _zz_127;
    _zz_128[13] = _zz_127;
    _zz_128[12] = _zz_127;
    _zz_128[11] = _zz_127;
    _zz_128[10] = _zz_127;
    _zz_128[9] = _zz_127;
    _zz_128[8] = _zz_127;
    _zz_128[7] = _zz_127;
    _zz_128[6] = _zz_127;
    _zz_128[5] = _zz_127;
    _zz_128[4] = _zz_127;
    _zz_128[3] = _zz_127;
    _zz_128[2] = _zz_127;
    _zz_128[1] = _zz_127;
    _zz_128[0] = _zz_127;
  end
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_JAL : begin
        _zz_129 = {{_zz_124,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        _zz_129 = {_zz_126,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_129 = {{_zz_128,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end
  assign execute_BranchPlugin_branch_src2 = _zz_129;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_19 = {execute_BranchPlugin_branchAdder[31 : 1],((execute_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_JALR) ? 1'b0 : execute_BranchPlugin_branchAdder[0])};
  assign _zz_78 = (memory_arbitration_isFiring && memory_BRANCH_DO);
  assign DebugPlugin_isPipBusy = (DebugPlugin_isPipActive || _zz_130);
  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_131))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end
  assign debug_resetOut = _zz_132;
  assign _zz_18 = decode_ALU_BITWISE_CTRL;
  assign _zz_16 = _zz_41;
  assign _zz_35 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_15 = decode_ENV_CTRL;
  assign _zz_12 = execute_ENV_CTRL;
  assign _zz_13 = _zz_43;
  assign _zz_10 = decode_to_execute_ENV_CTRL;
  assign _zz_61 = execute_to_memory_ENV_CTRL;
  assign _zz_31 = _zz_53;
  assign _zz_9 = decode_ALU_CTRL;
  assign _zz_7 = _zz_47;
  assign _zz_33 = decode_to_execute_ALU_CTRL;
  assign _zz_28 = _zz_45;
  assign _zz_6 = decode_BRANCH_CTRL;
  assign _zz_4 = _zz_52;
  assign _zz_20 = decode_to_execute_BRANCH_CTRL;
  assign _zz_3 = decode_SHIFT_CTRL;
  assign _zz_1 = _zz_50;
  assign _zz_22 = decode_to_execute_SHIFT_CTRL;
  assign prefetch_arbitration_isFlushed = (((((prefetch_arbitration_flushAll || fetch_arbitration_flushAll) || decode_arbitration_flushAll) || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign fetch_arbitration_isFlushed = ((((fetch_arbitration_flushAll || decode_arbitration_flushAll) || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign decode_arbitration_isFlushed = (((decode_arbitration_flushAll || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign execute_arbitration_isFlushed = ((execute_arbitration_flushAll || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign memory_arbitration_isFlushed = (memory_arbitration_flushAll || writeBack_arbitration_flushAll);
  assign writeBack_arbitration_isFlushed = writeBack_arbitration_flushAll;
  assign prefetch_arbitration_isStuckByOthers = (prefetch_arbitration_haltByOther || (((((1'b0 || fetch_arbitration_haltItself) || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign prefetch_arbitration_isStuck = (prefetch_arbitration_haltItself || prefetch_arbitration_isStuckByOthers);
  assign prefetch_arbitration_isMoving = ((! prefetch_arbitration_isStuck) && (! prefetch_arbitration_removeIt));
  assign prefetch_arbitration_isFiring = ((prefetch_arbitration_isValid && (! prefetch_arbitration_isStuck)) && (! prefetch_arbitration_removeIt));
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((1'b0 || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers);
  assign fetch_arbitration_isMoving = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign fetch_arbitration_isFiring = ((fetch_arbitration_isValid && (! fetch_arbitration_isStuck)) && (! fetch_arbitration_removeIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_haltItself));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      prefetch_arbitration_isValid <= 1'b0;
      fetch_arbitration_isValid <= 1'b0;
      decode_arbitration_isValid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_76 <= (2'b11);
      prefetch_PcManagerSimplePlugin_pcReg <= (32'b10000000000000000000000000000000);
      prefetch_IBusSimplePlugin_pendingCmd <= 1'b0;
      _zz_81 <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mip_MEIP <= 1'b0;
      CsrPlugin_mip_MTIP <= 1'b0;
      CsrPlugin_mip_MSIP <= 1'b0;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      _zz_107 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_118 <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      prefetch_arbitration_isValid <= 1'b1;
      if(prefetch_arbitration_isFiring)begin
        prefetch_PcManagerSimplePlugin_pcReg <= prefetch_PcManagerSimplePlugin_pcPlus4;
      end
      if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
        prefetch_PcManagerSimplePlugin_pcReg <= prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
      end
      if(iBus_rsp_ready)begin
        prefetch_IBusSimplePlugin_pendingCmd <= 1'b0;
      end
      if((_zz_135 && iBus_cmd_ready))begin
        prefetch_IBusSimplePlugin_pendingCmd <= 1'b1;
      end
      if(iBus_rsp_ready)begin
        _zz_81 <= 1'b1;
      end
      if((! fetch_arbitration_isStuck))begin
        _zz_81 <= 1'b0;
      end
      CsrPlugin_mip_MEIP <= externalInterrupt;
      CsrPlugin_mip_MTIP <= timerInterrupt;
      if(_zz_145)begin
        CsrPlugin_mstatus_MIE <= 1'b0;
        CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
        CsrPlugin_mstatus_MPP <= _zz_76;
      end
      if(_zz_144)begin
        if(memory_arbitration_isFiring)begin
          CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
          _zz_76 <= CsrPlugin_mstatus_MPP;
        end
      end
      _zz_107 <= 1'b0;
      if(_zz_141)begin
        if(_zz_142)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_118 <= (_zz_37 && writeBack_arbitration_isFiring);
      if(debug_bus_cmd_valid)begin
        case(_zz_143)
          1'b0 : begin
          end
          default : begin
            if(debug_bus_cmd_payload_wr)begin
              if(DebugPlugin_firstCycle)begin
                decode_arbitration_isValid <= 1'b1;
              end
            end
          end
        endcase
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if(((! fetch_arbitration_isStuck) || fetch_arbitration_removeIt))begin
        fetch_arbitration_isValid <= 1'b0;
      end
      if(((! prefetch_arbitration_isStuck) && (! prefetch_arbitration_removeIt)))begin
        fetch_arbitration_isValid <= prefetch_arbitration_isValid;
      end
      if(((! decode_arbitration_isStuck) || decode_arbitration_removeIt))begin
        decode_arbitration_isValid <= 1'b0;
      end
      if(((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt)))begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(execute_CsrPlugin_csrAddress)
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_180[0];
            CsrPlugin_mstatus_MIE <= _zz_181[0];
          end
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_182[0];
          end
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_183[0];
            CsrPlugin_mie_MTIE <= _zz_184[0];
            CsrPlugin_mie_MSIE <= _zz_185[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
    end
  end
  always @ (posedge io_mainClk) begin
    if((! _zz_81))begin
      _zz_82 <= iBus_rsp_inst;
    end
    if (!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if (!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_145)begin
      CsrPlugin_mepc <= _zz_89;
      CsrPlugin_mcause_interrupt <= CsrPlugin_interrupt;
      CsrPlugin_mcause_exceptionCode <= ((CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE) ? (4'b1011) : _zz_151);
    end
    _zz_90 <= CsrPlugin_exception;
    if(_zz_90)begin
      CsrPlugin_mbadaddr <= (32'b00000000000000000000000000000000);
      CsrPlugin_mcause_exceptionCode <= (4'b0000);
    end
    if(execute_arbitration_isValid)begin
      execute_CsrPlugin_readDataRegValid <= 1'b1;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_readDataRegValid <= 1'b0;
    end
    if(_zz_141)begin
      if(_zz_142)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    _zz_119 <= _zz_36[11 : 7];
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_EBREAK <= decode_IS_EBREAK;
    end
    if((! fetch_arbitration_isStuck))begin
      prefetch_to_fetch_PC <= _zz_69;
    end
    if((! decode_arbitration_isStuck))begin
      fetch_to_decode_PC <= fetch_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_26;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_58;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_17;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_27;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_14;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_8;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_30;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_5;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_2;
    end
    if((! decode_arbitration_isStuck))begin
      fetch_to_decode_INSTRUCTION <= _zz_66;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! fetch_arbitration_isStuck))begin
      prefetch_to_fetch_FORMAL_PC_NEXT <= prefetch_FORMAL_PC_NEXT;
    end
    if((! decode_arbitration_isStuck))begin
      fetch_to_decode_FORMAL_PC_NEXT <= fetch_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_70;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(DebugPlugin_insertDecodeInstruction)begin
      fetch_to_decode_INSTRUCTION <= debug_bus_cmd_payload_data;
    end
  end
  always @ (posedge io_mainClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(_zz_138)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipActive <= ((((fetch_arbitration_isValid || decode_arbitration_isValid) || execute_arbitration_isValid) || memory_arbitration_isValid) || writeBack_arbitration_isValid);
    _zz_130 <= DebugPlugin_isPipActive;
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_62;
    end
    _zz_131 <= debug_bus_cmd_payload_address[2];
    _zz_132 <= DebugPlugin_resetIt;
  end
  always @ (posedge io_mainClk or posedge resetCtrl_mainClkReset) begin
    if (resetCtrl_mainClkReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
    end else begin
      if(debug_bus_cmd_valid)begin
        case(_zz_143)
          1'b0 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_140)begin
        DebugPlugin_haltIt <= 1'b1;
        DebugPlugin_haltedByBreak <= 1'b1;
      end
      if((DebugPlugin_stepIt && prefetch_arbitration_isFiring))begin
        DebugPlugin_haltIt <= 1'b1;
      end
      if((DebugPlugin_stepIt && ({writeBack_arbitration_redoIt,{memory_arbitration_redoIt,{execute_arbitration_redoIt,{decode_arbitration_redoIt,{fetch_arbitration_redoIt,prefetch_arbitration_redoIt}}}}} != (6'b000000))))begin
        DebugPlugin_haltIt <= 1'b0;
      end
    end
  end
endmodule