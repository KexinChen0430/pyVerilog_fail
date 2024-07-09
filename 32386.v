module GRUPPE_2 ( BCLK, PHASE_0, OPREG, PHASE, SRC_1, SRC_2, REGA1, REGA2, IRRW1, IRRW2, ADRD1, ADRD2, EXR12, EXR22,
				  PHRD1, PHRD2, NXRD1, NXRW2, ACCA, OPERA,
				  STATE_0, STATE_GROUP_50, STATE_GROUP_60 );
	input			BCLK,PHASE_0;
	input	[18:0]	OPREG;
	input	 [3:0]	PHASE;	// nur die 4 LSBs
	// Source 1 & 2 Inputs
	input	 [6:0]	SRC_1,SRC_2,REGA1,REGA2,IRRW1,IRRW2;
	input	[18:0]	ADRD1,ADRD2,EXR12,EXR22;
	input	 [3:0]	PHRD1,PHRD2;
	input	 [3:0]	NXRD1,NXRW2;
	input	 [3:0]	ACCA;	// ACCA = Access type :	0x Register
							//	[3:2] or [1:0]		10 Memory
							//						11 Memory + Index
	input	[10:0]	OPERA;
	output	[66:0]	STATE_0;
	output	[66:0]	STATE_GROUP_50,STATE_GROUP_60;
	reg		[66:0]	STATE_GROUP_50,STATE_GROUP_60;
	reg		[66:0]	STATE_0,state_50,state_53,state_54,state_55,state_58,state_59,state_5A;
	reg		 [4:0]	op_code,op_reg_reg;
	reg		 [7:0]	phsrc1,phsrc2;
	reg		 [5:0]	chkreg;
	reg		 [1:0]	bwdreg;
	reg				tbit_flag,size_dw;
	reg				inss_flag;
	reg				ext_tos;
	wire	[18:0]	exoffset,re_wr,rexwr;
	wire	[10:0]	op_kust,op_bwd;
	wire	 [7:0]	phchk;
	wire	 [4:0]	op_reg;
	wire	 [6:0]	src_1l,src_2l;
	wire	 [5:0]	dest_2;
	wire	 [3:0]	get8b_s,get8b_d;
	wire	 [6:0]	rd_reg;
	wire	[10:0]	op_zext;
	wire	 [3:0]	imdi;
	parameter dont_care	= 67'hx_xxxx_xxxx_xxxx_xxxx;
	// Address-Field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	parameter addr_nop	= 19'h0;	// alle Parameter auf 0
	parameter disp2ea	= 19'bxx_0010_0000_0_0000_0010;	// pass DISP
	parameter case_op	= 19'bxx_0010_1000_0_0000_0001;	// SRC1 add to PC_ARCHI
	parameter read_byb	= 19'b00_1011_11xx_0_0000_0011;	// read of SRC2 for Bit opcodes
	parameter exr11		= {2'b10  ,4'b1011,4'h0 ,9'h080};	// 2. access External with Mem.-Pointer + 4* Disp
	parameter adrcvtp	= 19'bxx_0010_0111_0_0000_0000;	// for CVTP
	parameter addone	= 19'bxx_0010_0100_0_0000_0000;	// for INDEX : SRC1 + SRC2 , simple Add without Flags
	parameter addind	= 19'bxx_0010_0100_0_0000_0011;	// for INDEX : SRC1 + EA
	parameter src_x		= 7'hxx;
	parameter dest_x	= 6'hxx;
	parameter imme		= {1'b1,6'hxx};
	parameter F0		= 7'h20;
	parameter F0_h		= 7'h21;
	parameter w_F0		= 6'h20;
	parameter w_F0_h	= 6'h21;
	parameter temp_l	= 6'h3C;
	parameter temp_h	= 6'h3D;	// Second last place for 8B TEMP Register
	parameter temp_1	= 6'h3E;
	parameter rtmpl		= 7'h3C;
	parameter rtmph		= 7'h3D;
	parameter rtmp1		= 7'h3E;
	parameter op_mov	= {3'bx1x,8'h45};
	parameter op_adr	= {3'bx1x,8'h49};
	parameter op_addl	= {3'b01x,8'hB0};
	parameter op_addf	= {3'b11x,8'hB0};
	parameter op_mull	= {3'b01x,8'hBC};
	parameter op_mulf	= {3'b11x,8'hBC};
	parameter op_truf	= {3'b101,8'h9A};	// TRUNCFW for SCALBF
	parameter op_trul	= {3'b001,8'h9A};	// TRUNCLW for SCALBL
	parameter op_stpr	= {3'b11x,8'h54};	// Special-Op for String opcodes
	parameter op_lsh	= {3'b011,8'h65};	// EXT : shift to right : DOUBLE !
	parameter op_msk	= {3'b011,8'h80};	// reuse of EXT Opcode at INS !
	parameter op_mul	= {3'b011,8'h78};	// INDEX
	parameter op_rwv	= {3'bx1x,8'hE0};	// RDVAL+WRVAL
	always @(OPREG)	// whether the Opcode is valid is decided in DECODER !
	  casex (OPREG[13:0])
//		14'bxx_xxxx_1111_1110 : op_code = {2'b01,OPREG[11:10],OPREG[8]};	// DOT/POLY/SCALB
		14'b00_0xxx_0000_1110 : op_code = 5'b1_0000;	// MOVS/CMPS
		14'b00_11xx_0000_1110 : op_code = 5'b1_0000;	// SKPS
		14'b00_0xxx_1100_1110 : op_code = 5'b1_0001;	// MOVM/CMPM
		14'bxx_xx10_0111_11xx : op_code = 5'b1_0010;	// JUMP/JSR
		14'bxx_x111_0111_11xx : op_code = 5'b1_0011;	// CASE
		14'bxx_xxxx_xx11_010x : op_code = 5'b1_0100;	// TBIT
		14'bxx_xxxx_xx11_0111 : op_code = 5'b1_0100;	// TBIT
		14'b0x_1xxx_0100_1110 : op_code = 5'b1_0100;	// CBIT/SBIT
		14'b11_10xx_0100_1110 : op_code = 5'b1_0100;	// IBIT
		14'b00_11xx_1100_1110 : op_code = 5'b1_0101;	// EXTS
		14'b10_x1xx_1100_1110 : op_code = 5'b1_0111;	// DEI/MEI
		14'bxx_x0xx_1110_1110 : op_code = 5'b1_1000;	// CHECK
		14'bxx_x0xx_0010_1110 : op_code = 5'b1_1010;	// EXT
		14'bxx_x0xx_1010_1110 : op_code = 5'b1_1011;	// INS
		14'b00_10xx_1100_1110 : op_code = 5'b1_1011;	// INSS, the same like INS !
		14'bxx_x0xx_0110_1110 : op_code = 5'b1_1100;	// CVTP
		14'bxx_x1xx_0010_1110 : op_code = 5'b1_1101;	// INDEX
		14'bxx_x000_0111_11xx : op_code = 5'b1_1110;	// CXPD
		14'b00_0xxx_0001_1110 : op_code = 5'b1_1111;	// RDVAL+WRVAL
		default				  : op_code = 5'b00_xxx;
	  endcase
	always @(posedge BCLK) if (PHASE_0) op_reg_reg <= op_code;
	assign op_reg = PHASE_0 ? op_code : op_reg_reg;
	always @(PHRD1)	// recode of States
	  casex (PHRD1)
		 4'h5 : phsrc1 = 8'h51;
		 4'h6 : phsrc1 = 8'h52;
		 4'hB : phsrc1 = 8'h53;	// ok, is in default ...
	  default : phsrc1 = 8'h53;
	  endcase
	assign get8b_s = (PHRD1 == 4'hB) ? 4'hC : 4'h0;	// Special case 8B Immeadiate, is used in State 53
	always @(PHRD2)	// recode of States
	  casex (PHRD2)
		 4'h5 : phsrc2 = 8'h56;
		 4'h6 : phsrc2 = 8'h57;
		 4'hB : phsrc2 = 8'h58;	// ok, is in default ...
	  default : phsrc2 = 8'h58;
	  endcase
	assign get8b_d = (PHRD2 == 4'hB) ? 4'hC : 4'h0;	// Special case 8B Immeadiate, is used in State 58
	assign src_1l = {SRC_1[6:1],1'b0};
	assign src_2l = {SRC_2[6:1],~SRC_2[0]};	// needed only for DEI/MEI
	assign dest_2 =  SRC_2[5:0];
	assign phchk = {7'b0101_010,size_dw};	// Phase 54 or 55
	assign op_kust = {1'bx,OPERA[9:8],8'h7A};	// Special-Opcode for MOVM/CMPM
	assign op_bwd  = {1'bx,OPERA[9:8],8'h45};	// for CASE and Bit opcodes
	assign re_wr   = {EXR22[18:17],4'b0101,4'h0, 9'h003};	// REUSE Address : Write of rmw , top 2 Bits contain size
	always @(posedge BCLK) if (PHASE_0) ext_tos <= (OPREG[18:14] == 5'h17);	// if TOS
	assign rexwr   = {EXR22[18:17],4'b0101,4'h0, ext_tos, 8'h03};	// REUSE Addresse : Write von rmw , only for EXT and EXTS !
	always @(posedge BCLK) tbit_flag <= ~OPERA[1];	// due to Timing ...
	always @(posedge BCLK) size_dw	 <=  OPERA[9];
	always @(posedge BCLK) if (PHASE_0) chkreg <= {3'b000,OPREG[13:11]};	// for CHECK
	assign rd_reg = (PHASE_0) ? {4'b0,OPREG[13:11]} : {1'b0,chkreg};	// for read operation at EXT/INS
	always @(posedge BCLK) if (PHASE_0) bwdreg <= OPREG[9:8];		// only for INS/INSS !
	assign op_zext = {1'bx,(PHASE_0 ? OPREG[9:8] : bwdreg),8'h76};
	always @(posedge BCLK) if (PHASE_0) inss_flag <= OPREG[6];	// Difference INSS to INS
	assign imdi = inss_flag ? 4'h8 : 4'hE;	// read Immediate or Displacement
	assign exoffset = inss_flag ? 19'b10_1011_0000_0_0000_0011 	// Read of SRC2 at INSS
								: 19'b10_1011_1100_0_0000_0011;	// Read of SRC1+Offset at EXT, SRC2+Offset at INS
	always @(*)
	  casex (op_reg)
		5'b1_0000 :	// MOVS Phase 0 : Entry 1. Pointer "in Page"-test prepare, 2. test for R0=0 , then jump to x'C0
			begin
			  STATE_0  = {	 addr_nop,8'h67, 7'h01, 7'h02, 1'b0,dest_x,op_stpr,	2'b00,2'b00,4'h0  };	// String-Pointer prepare
			  state_50 = dont_care;
			  state_53 = dont_care;
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0001 :	// MOVM Phase 0 : Entry with test for R0=0 , then jump to x'C0
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b1,temp_h,op_adr,  2'b00,2'b00,NXRW2 };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = {	 disp2ea, 8'h65, src_x, src_x, 1'b1,temp_1,op_adr,  2'b00,2'b00,4'b1110 };	// Read of DISP for count
			  state_59 = {	 addr_nop,8'h67, rtmph, rtmp1, 1'b0,dest_x,op_stpr,	2'b00,2'b00,4'h0  };	// String-Pointer prepare
			  state_5A = dont_care;
			end
		5'b1_0010 :	// JUMP/JSR
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h66, src_x, src_x, 1'b1,temp_h,op_adr,  2'b00,2'b00,4'h0  };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_1110 :	// CXPD
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h6B, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,4'h0  };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_1111 :	// RDVAL+WRVAL
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h00, src_x, src_x, 1'b0,dest_x,op_rwv,  2'b00,2'b10,4'h0  };	// LD_OUT set because of "F"
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0011 :	// CASE
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 case_op, 8'h54, SRC_1, src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h0  };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// only one operand in mem.
			  state_53 = {   case_op, 8'h54, imme,  src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h0  };
			  state_54 = {   addr_nop,8'h66, src_x, src_x, 1'b1,temp_h,op_adr,  2'b00,2'b00,4'h0  };
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0100 : // all Bit opcodes with Bit in memory. RMW Test in Phase x'59 = Special case, otherwise x'58
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };	// here SRC1 => TEMP_H
			  state_55 = dont_care;
			  state_58 = {	 read_byb,8'h59, rtmph, src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h1  };	// next read of Byte
			  state_59 = tbit_flag ?
						 {	 addr_nop,8'h00, src_x, imme,  1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  }		// TBIT end
					   : {	 re_wr,   8'h27, src_x, imme,  1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  };	// CBIT/SBIT/IBIT end
			  state_5A = dont_care;
			end
		5'b1_0101 : // EXTS : BASE Operand => TEMP, calculate address of Destination
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }		// here Adr(DEST) => EA
					   : {	 addr_nop,8'h59, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h8  };	// 1 Byte Immediate read
			  state_55 = dont_care;
			  state_58 = {	 addr_nop,8'h59, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h8  };	// 1 Byte Immediate read
			  state_59 = ACCA[1] ?		// _..M.
						 {	 rexwr,   8'h27, imme,  rtmph, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, imme,  rtmph, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = dont_care;
			end
		5'b1_1010 : // EXT : BASE Operand => TEMP, calculate address of Destination
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h55, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Addr => EA Reg
			  state_54 = ACCA[1] ?
						  ( ACCA[3] ?
						    {addr_nop,8'h5A, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  }
						   :{ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }	)	// here Adr(DEST) => EA
					   : {	 addr_nop,8'h59, rd_reg,(ACCA[3] ? imme : rtmph),
														   1'b1,temp_h,op_lsh,	2'b00,2'b00,4'hE  };	// Displacement read
			  state_55 = {   exoffset,8'h54, rd_reg,src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h1  };	// Read Source, EA reuse
			  state_58 = {	 addr_nop,8'h59, rd_reg,rtmph, 1'b1,temp_h,op_lsh,	2'b00,2'b00,4'hE  };	// Displacement read
			  state_59 = ACCA[1] ?		// _..M.
						 {	 rexwr,   8'h27, src_x, rtmph, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, src_x, rtmph, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 };	// special case Mem-Mem
			end
		5'b1_1011 : // INS/INSS : BASE Operand => TEMP, SRC2 read as Double ! RMW not tested (Phase x'6A) but uncritical
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };	// zext(SRC1) => TEMP
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }		// here Adr(DEST) => EA
					   : {	 addr_nop,8'h5A, SRC_2, src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,imdi  };	// Imme./Disp. read
			  state_55 = {   exoffset,8'h6A, rd_reg,src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h1  };	// Read Source, EA reuse
			  state_58 = {	 addr_nop,8'h55, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	//
			  state_59 = ACCA[1] ?		// _..M.
						 {	 re_wr,   8'h27, rtmph, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, rtmph, rtmpl, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = {	 addr_nop,8'h68, imme,  src_x, 1'b1,temp_1,op_msk,	2'b00,2'b00,4'h0  };	// Mask generate
			end
		5'b1_1101 : // INDEX :
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };	// zext(SRC1) => TEMP_H
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }		// zext(SRC2) => TEMP_L
					   : {	 addr_nop,8'h55, SRC_2, src_x, 1'b1,temp_l,op_zext, 2'b00,2'b00,4'h0  };
			  state_55 = {   addr_nop,8'h5A, rd_reg,rtmph, 1'b1,temp_h,op_mul,	2'b00,2'b00,4'h0  };	// Multiplication
			  state_58 = {	 addr_nop,8'h55, imme,  src_x, 1'b1,temp_l,op_zext, 2'b00,2'b00,4'h0  };	//
			  state_59 = {	 addind,  8'h60, rtmpl, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Add of Index in EA
			  state_5A = {	 addone,  8'h59, rd_reg,rtmph, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Add of EA (=+1)
			end
		5'b1_0111 :	// DEI + MEI , both read 8B from DEST ! RMW critical !
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }		// here SRC1 => TEMP_H
					   : {	 addr_nop,8'h59, rtmph, SRC_2, 1'b0,dest_x,OPERA,	2'b01,2'b00,4'h0  };	// 1. part of Register
			  state_55 = dont_care;
			  state_58 = size_dw ?
						 {	 addr_nop,8'h59, rtmph, imme,  1'b0,dest_x,OPERA,	2'b01,2'b00,4'h0  }		// D needs 2 accesses
					   : {	 addr_nop,8'h1F, rtmph, imme,  1'b0,dest_x,OPERA,	2'b11,2'b00,4'h0  };	// B+W start at once
			  state_59 = {	 addr_nop,8'h1F, src_x, (ACCA[1] ? imme : src_2l),							// SRC2 = memory or Reg
													   ~ACCA[1],dest_2,OPERA,	2'b10,2'b00,4'h0  };
			  state_5A = dont_care;
			end
		5'b1_1000 :	// CHECK
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// No Register !
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,phchk, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };	// No Immediate !
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }
					   : (  size_dw ?
							{addr_nop,8'h5A, SRC_2, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  }		// Upper Bound - pointer
						  : {addr_nop,8'h00, rtmph, SRC_2, 1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  } );
			  state_55 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,4'h0  };
			  state_58 = size_dw ?
						 {	 addr_nop,8'h59, imme,  src_x, 1'b1,temp_1,op_mov,	2'b00,2'b00,4'h0  }		// here SRC2 => TEMP_1
					   : {	 addr_nop,8'h00, rtmph, imme,  1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  };
			  state_59 = {	 addr_nop,8'h5A, rtmp1, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  };	// Upper Bound - pointer
			  state_5A = {	 addr_nop,8'h00, rtmph, (ACCA[1] ? rtmp1 : SRC_2),
														   1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  };	// pointer - Lower Bound
			end
		5'b1_1100 :	// CVTP
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// Address
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h54, src_x, src_x, 1'b1,temp_h,op_adr,	2'b00,2'b00,4'h0  };
			  state_54 = {	 adrcvtp, 8'h73, rtmph, rd_reg,1'b0,dest_x,op_mov,  2'b00,2'b00,4'h0  };	// 8*TEMP+Offset
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
//		5'b01_000 :	// SCALBL : RMW critical !
//			begin
//			  STATE_0  = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, src_1l,1'b1,temp_h,op_trul, 2'b11,2'b00,4'h0  };
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, src_1l,1'b1,temp_h,op_trul, 2'b11,2'b00,4'h0  };
//			  state_53 = {   addr_nop,8'h55, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,get8b_s };
//			  state_54 = ACCA[1] ?
//						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_trul, 2'b00,2'b00,NXRW2 }
//					   : {	 addr_nop,8'h5A, src_x, src_x, 1'b0,temp_h,op_trul,	2'b00,2'b00,4'h0  };
//			  state_55 = {	 addr_nop,8'h54, rtmph, imme,  1'b1,temp_h,op_trul, 2'b11,2'b00,4'h0  };	// 2. half of external SRC1
//			  state_58 = {	 addr_nop,8'h59, rtmph, imme,  1'b0,dest_2,OPERA,	2'b01,2'b00,4'h0  };
//			  state_59 = {	 addr_nop,8'h1F, src_x, (ACCA[1] ? imme : src_2l),
//													   ~ACCA[1],dest_2,OPERA,	2'b10,2'b00,4'h0  };
//			  state_5A = {	 addr_nop,8'h59, rtmph, SRC_2, 1'b0,dest_2,OPERA,	2'b01,2'b00,4'h0  };	// empty cycle for TRUNC => TEMP !
//			end
//		5'b01_001 :	// SCALBF : RMW critical !
//			begin
//			  STATE_0  = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_truf, 2'b00,2'b00,4'h0  };
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_truf, 2'b00,2'b00,4'h0  };
//			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_truf, 2'b00,2'b00,4'h0  };
//			  state_54 = ACCA[1] ?
//						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }
//					   : {	 addr_nop,8'h1F, rtmph, SRC_2, 1'b1,dest_2,OPERA,	2'b11,2'b00,4'h0  };
//			  state_55 = dont_care;
//			  state_58 = {	 addr_nop,8'h1F, rtmph, imme,  1'b0,dest_x,OPERA,	2'b11,2'b00,4'h0  };
//			  state_59 = dont_care;
//			  state_5A = dont_care;
//			end
//		5'b01_100 :	// POLYL
//			begin
//			  STATE_0  = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
//			  state_53 = {   addr_nop,8'h54, imme,  F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,get8b_s };
//			  state_54 = {	 addr_nop,8'h64, (ACCA[3] ? imme : src_1l),
//													F0,    1'b1,temp_h,op_mull, 2'b10,2'b00,4'h0  };
//			  state_55 = dont_care;
//			  state_58 = {	 addr_nop,8'h59, imme,  rtmph, 1'b0,dest_x,op_addl, 2'b01,2'b00,get8b_d };
//			  state_59 = {	 addr_nop,8'h62, (ACCA[1] ? imme : src_2l),
//													rtmpl, 1'b1,w_F0_h,op_addl, 2'b10,2'b00,4'h0  };
//			  state_5A = dont_care;
//			end
//		5'b01_101 :	// POLYF
//			begin
//			  STATE_0  = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, F0,    1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {	 addr_nop,8'h54, SRC_1, F0,    1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
//			  state_53 = {   addr_nop,8'h54, imme,  F0,    1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
//			  state_54 = ACCA[1] ?
//						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }
//					   : {	 addr_nop,8'h00, rtmph, SRC_2, 1'b1,w_F0  ,op_addf, 2'b00,2'b00,4'h0  };
//			  state_55 = dont_care;
//			  state_58 = {	 addr_nop,8'h00, rtmph, imme,  1'b1,w_F0  ,op_addf, 2'b00,2'b00,4'h0  };
//			  state_59 = dont_care;
//			  state_5A = dont_care;
//			end
//		5'b01_110 :	// DOTL
//			begin
//			  STATE_0  = (~ACCA[3] & ~ACCA[1]) ?		// _R.R.
//						 {	 addr_nop,8'h59, SRC_1, SRC_2, 1'b0,dest_x,op_mull, 2'b01,2'b00,4'h0  }
//					   : (  ACCA[3] ?		// _M...
//						    {ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//						  : {ADRD2,   phsrc2,src_x, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 } );
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
//			  state_53 = ACCA[1] ?		// _..M.
//						 {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,get8b_s }
//					   : {	 addr_nop,8'h59, imme,  SRC_2, 1'b0,dest_x,op_mull, 2'b01,2'b00,get8b_s };
//			  state_54 = {	 addr_nop,8'h55, imme,  src_x, 1'b1,temp_l,op_mov,  2'b00,2'b00,4'h0  };
//			  state_55 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
//			  state_58 = {	 addr_nop,8'h59, (ACCA[3] ? rtmph : SRC_1),		//_M...
//													imme,  1'b0,dest_x,op_mull, 2'b01,2'b00,get8b_d };
//			  state_59 = {	 addr_nop,8'h5A, (ACCA[3] ? (ACCA[1] ? rtmpl : imme) : src_1l), (ACCA[1] ? imme : src_2l),
//														   1'b1,temp_h,op_mull, 2'b10,2'b00,4'h0  };
//			  state_5A = {	 addr_nop,8'h61, rtmph, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
//			end
//		5'b01_111 :	// DOTF
//			begin
//			  STATE_0  = (~ACCA[3] & ~ACCA[1]) ?		// _R.R.
//						 {	 addr_nop,8'h63, SRC_1 ,SRC_2 ,1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  }		// opera = MULF
//					   : (  ACCA[3] ?		// _M...
//						    {ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//						  : {ADRD2,   phsrc2,src_x, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 } );
//			  state_50 = ACCA[3] ?		// _M...
//						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
//					   : {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
//			  state_53 = ACCA[1] ?		// _..M.
//						 {   addr_nop,8'h55, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,4'h0  }
//					   : {	 addr_nop,8'h63, imme,  SRC_2 ,1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
//			  state_54 = dont_care;
//			  state_55 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
//			  state_58 = {	 addr_nop,8'h63, (ACCA[3] ? rtmph : SRC_1),		//_M...
//													imme,  1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
//			  state_59 = dont_care;
//			  state_5A = dont_care;
//			end
		default
			begin
			  STATE_0  = dont_care;
			  state_50 = dont_care;
			  state_53 = dont_care;
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		endcase
	always @(*)
	  casex (PHASE)
		 4'h0 : STATE_GROUP_50 = state_50;
		// Phase 51 : wait for data and Disp2 for External Address mode : part 2 EA = (MOD+4)+4*DISP1
		 4'h1 : STATE_GROUP_50 = {exr11,   8'h52, src_x,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};
		// Phase 52 : Memory-Pointer for Memory Relative and last access External
		 4'h2 : STATE_GROUP_50 = {EXR12,   8'h53, IRRW1,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};  // atys[0] !
		 4'h3 : STATE_GROUP_50 = state_53;
		 4'h4 : STATE_GROUP_50 = state_54;
		 4'h5 : STATE_GROUP_50 = state_55;
		// Phase 56 : wait for data and Disp2 for External Address mode : part 2 EA = (MOD+4)+4*DISP1
		 4'h6 : STATE_GROUP_50 = {exr11,   8'h57, src_x,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};
		// Phase 57 : Memory-Pointer for Memory Relative and last access External
		 4'h7 : STATE_GROUP_50 = {EXR22,   8'h58, IRRW2,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};  // atyd[0] !
		 4'h8 : STATE_GROUP_50 = state_58;
		 4'h9 : STATE_GROUP_50 = state_59;
		 4'hA : STATE_GROUP_50 = state_5A;
	  default : STATE_GROUP_50 = dont_care;
	  endcase
	always @(*)
	  casex (PHASE)
		 4'h0 : STATE_GROUP_60 = {	 addr_nop,8'h00, src_x, src_x, 1'b1,chkreg,op_adr,  2'b00,2'b00,4'h0  };	// for INDEX
		 4'h1 : STATE_GROUP_60 = {	 addr_nop,8'h62, rtmpl, F0,    1'b1,w_F0_h,op_addl, 2'b10,2'b00,4'h0  };	// for DOTL
		 4'h2 : STATE_GROUP_60 = {	 addr_nop,8'h00, src_x, src_x, 1'b0,w_F0_h,op_addl, 2'b00,2'b00,4'h0  };	// for DOTL & POLYL !
		 4'h3 : STATE_GROUP_60 = {	 addr_nop,8'h00, rtmph, F0,    1'b1,w_F0,  op_addf, 2'b00,2'b00,4'h0  };	// for DOTF
		 4'h4 : STATE_GROUP_60 = ACCA[1] ?	// ..M.
								 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,temp_h,op_mull, 2'b00,2'b00,NXRW2 }
							   : {	 addr_nop,8'h59, SRC_2, rtmph, 1'b0,temp_h,op_addl, 2'b01,2'b00,4'h0  };	// for POLYL
		 4'h5 : STATE_GROUP_60 = {	 addr_nop,8'h59, src_x, src_x, 1'b1,temp_l,op_kust, 2'b00,2'b00,4'h0  };	// for MOVM/CMPM
		 4'h6 : STATE_GROUP_60 = {	 addr_nop,8'h01, rtmph, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// for JUMP/JSR/CASE
		 4'h7 : STATE_GROUP_60 = {	 addr_nop,8'hC0, (op_reg_reg[0] ? rtmpl : 7'h00),							// Jump to String execution
															src_x, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  };	// LD_OUT set, CMPS F-Flag
		// for INS
		 4'h8 : STATE_GROUP_60 = {	 addr_nop,8'h69, rd_reg,rtmph, 1'b1,temp_h,op_lsh,	2'b00,2'b00,4'h0  };	// SRC1 shift
		 4'h9 : STATE_GROUP_60 = {	 addr_nop,8'h59, rd_reg,rtmp1, 1'b0,dest_x,op_lsh,	2'b00,2'b00,4'h0  };	// Mask shift
		 4'hA : STATE_GROUP_60 = {	 addr_nop,8'h5A, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,imdi  };	// Imme./Disp. read
		// for CXPD, this State is decoded explicitly in DECODER
		 4'hB : STATE_GROUP_60 = {	 addr_nop,8'h39, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,4'h0  };	// pass PC
	  default : STATE_GROUP_60 = dont_care;
	  endcase
endmodule