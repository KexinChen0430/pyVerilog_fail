module dzcpu_ucode_rom
(
	input  wire[8:0]  iAddr,
	output reg [13:0]  oUop
);
always @ ( iAddr )
begin
	case ( iAddr )
	//Regular 1 Byte mOp
		0: oUop = { `inc_eof_fu, `z801bop , `a };
	//LDSPnn
		1: oUop = { `inc, `sma, `pc   };
		2: oUop = { `inc, `nop, `null };
		3: oUop = { `op , `srm, `spl  };
		4: oUop = { `inc_eof , `srm, `sph };
	//LDHLnn
		5: oUop = { `inc, `sma, `pc   };
		6: oUop = { `inc, `nop, `null };
		7: oUop = { `op , `srm, `l    };
		8: oUop = { `inc_eof , `srm, `h    };
	//LDHLDA
		9:  oUop = { `op,  `sma,   `hl };
		10: oUop = { `op,  `smw,   `a  };
		11: oUop = { `inc, `sma,   `pc };
		12: oUop = { `eof, `dec16, `hl };
	//MAPcb 0xCB
		13: oUop = { `inc, `sma, `pc   };
		14: oUop = { `op,  `nop, `null };
		15: oUop = { `inc, `jcb, `null };
	//BIT
		16: oUop = { `eof_fu, `bit, `null };
	//JRNZ
		17: oUop = { `inc, `sma, `pc   };
		18: oUop = { `op,  `nop, `null };
		19: oUop = { `inc_eof_z,  `srm, `x8 }; 	//If z return else x8 = MEM[pc]
		20: oUop = { `op,  `sx16r, `pc };  		//x16 = pc
		21: oUop = { `op,`addx16, `x8  };       //x16 = x16 + sign_extend{8'b0,x8}
		22: oUop = { `eof, `spc, `x16  };  		//pc = x16
	//LDrn_c
		23: oUop = {`inc, `sma, `pc};
		24: oUop = { `inc,  `nop, `null };
		25: oUop = {`eof, `srm,  `c };
	//LDrn_a
		26: oUop = {`inc, `sma, `pc};
		27: oUop = { `inc,  `nop, `null };
		28: oUop = {`eof, `srm,  `a };
	//LDIOCA
		29: oUop = {`op, `sma, `io_c };
		30: oUop = {`op, `smw, `a };
		31: oUop = {`inc_eof, `sma, `pc };
	//INCr_c
		32: oUop = {`inc_eof_fu, `inc16, `c };
	//LDHLmr_a
		33: oUop = {`inc, `sma, `hl  };
		34: oUop = {`op, `smw, `a    };
		35: oUop = {`eof, `sma, `pc  };
	//LDIOnA
		36: oUop = { `inc, `sma, `pc  };
		37: oUop = { `op ,`sx8r, `c   };
		38: oUop = { `op ,`srm, `c    };
		39: oUop = { `op, `sma, `io_c };
		40: oUop = { `op, `smw, `a    };
		41: oUop = { `inc, `srx8, `c  };
		42: oUop = { `eof, `sma, `pc  };
	//LDDEnn
		43: oUop = { `inc, `sma, `pc   };
		44: oUop = { `inc, `nop, `null };
		45: oUop = { `op , `srm, `e    };
		46: oUop = { `inc_eof , `srm, `d };
	//DECr_a
		47:	oUop = { `inc_eof_fu, `dec16,    `a  };
	//DECr_c
		48:	oUop = { `inc_eof_fu, `dec16,    `c  };
	//CALLnn
		49: oUop = { `inc, `dec16,  `sp  };
		50: oUop = { `inc, `sx16r,  `hl  };
		51: oUop = { `op , `srm,    `l   }; //l = MEM[pc] = literal
		52: oUop = { `inc, `srm,    `h   }; //l = MEM[pc] = literal
		53: oUop = { `op,  `sma,    `sp  };
		54: oUop = { `op,  `smw,    `pch };	//MEM[sp] = pc[7:0]
		55: oUop = { `op,  `dec16,  `sp  };
		56: oUop = { `op , `smw,    `pc  };	//MEM[sp+1] = pc[15:8]
		57: oUop = { `op , `spc,    `hl  };
		58: oUop = { `op, `srx16,  `hl  };
		59: oUop = { `eof ,`sma,   `pc   };
	//LDrn_b
		60: oUop = { `inc, `sma, `pc   };
		61: oUop = { `inc, `nop, `null };
		62: oUop = { `eof , `srm, `b   };
	//PUSHBC
		63: oUop = { `op, `dec16,  `sp  };
		64: oUop = { `op, `sma,    `sp  };
		65: oUop = { `op ,`smw,    `b   };
		66: oUop = { `op, `dec16,  `sp  };
		67: oUop = { `op ,`smw,     `c  };
		68: oUop = { `inc_eof ,`sma,`pc };
	//RLr_r
		69: oUop = { `eof_fu, `shl,  `null  };
	//RLA
		70: oUop = { `inc_eof_fu, `shl,  `null  };
	//POPBC
		71: oUop = { `op, `sma,    `sp   };
		72: oUop = { `op ,`inc16,  `sp   };
		73: oUop = { `op ,`srm,    `c    };
		74: oUop = { `op ,`srm,    `b    };
		75: oUop = { `inc ,`inc16,  `sp  };
		76: oUop = { `eof, `sma,    `pc  };
	//UNUSED
		77:	oUop = { `inc_eof_fu, `dec16,    `b  };
	//LDHLIA
		78: oUop = {`op, `sma, `hl  };
		79: oUop = {`op, `smw, `a    };
		80: oUop = { `inc ,`inc16,  `hl };
		81: oUop = {`eof, `sma, `pc  };
	//INCHL
		82: oUop = { `inc_eof ,`inc16,  `hl };
	//INCBC
	  83: oUop = { `inc_eof ,`inc16,  `bc   };		//flags might be wrong for 16bits
  //UNUSED
		84: oUop = { `inc_eof, `nop, `null  };
	//ANDn
		85: oUop = { `inc, `sma,  `pc };
		86: oUop = { `op, `nop , `null };
		87: oUop = { `update_flags ,`anda,    `idata  };
		88: oUop = { `inc_eof ,`nop,    `null  };
	//INCDE
		89: oUop = { `inc_eof, `inc16, `de };
	//CPn
		90: oUop = { `inc, `sx16r, `a };
		91: oUop = { `op, `nop, `null };
		92: oUop = { `op, `srm, `x8   };
		93: oUop = { `inc_eof_fu, `subx16, `x8   };	//x16 = x16 - x8 -> a = a - lit
//LDADEm
		94: oUop = {`inc, `sma, `de  };
		95: oUop = {`op, `nop, `null };
		96: oUop = {`op, `srm, `a    };
		97: oUop = {`eof, `sma, `pc  };
//LDmmA
		98: oUop = {`inc, `sx16r,  `hl };
		99: oUop = {`inc,  `sma,   `pc };
		100: oUop = {`op,   `srm,   `l  };
		101: oUop = {`op,   `srm,   `h  };
		102: oUop = {`op,   `sma,   `hl };
		103: oUop = {`op,   `smw,   `a  };
		104: oUop = {`inc,  `sma,   `pc };
		105: oUop = {`eof,  `srx16, `hl };
//JRZn
		106: oUop = { `inc, `sma, `pc   };
		107: oUop = { `op,  `nop, `null };
		108: oUop = { `inc_eof_nz, `srm, `x8 }; 	//If not z return else x8 = MEM[pc]
		109: oUop = { `op,  `sx16r, `pc };  		//x16 = pc
		110: oUop = { `op,`addx16, `x8  };       //x16 = x16 + sign_extend{8'b0,x8}
		111: oUop = { `eof, `spc, `x16  };  		//pc = x16
//LDrn_l
		112: oUop = {`inc, `sma, `pc     };
		113: oUop = { `inc,  `nop, `null };
		114: oUop = {`eof, `srm,  `l     };
//JRn
		115: oUop = { `inc, `sma, `pc   };
		116: oUop = { `op,  `nop, `null };
		117: oUop = { `inc, `srm, `x8   };
		118: oUop = { `op,  `sx16r, `pc };       //x16 = pc
		119: oUop = { `op,`addx16, `x8  };       //x16 = x16 + sign_extend{8'b0,x8}
		120: oUop = { `eof, `spc, `x16  };       //pc = x16
//LDrn_e
		121: oUop = {`inc, `sma, `pc     };
		122: oUop = { `inc,  `nop, `null };
		123: oUop = {`eof, `srm,  `e     };
//LDAIOn
		124: oUop = { `inc, `sx8r, `c    };
		125: oUop = { `op,  `nop,  `null };
		126: oUop = { `op,  `srm,  `c    };
		127: oUop = { `op,   `sma, `io_c };
		128: oUop = { `op,   `srm,  `a   };
		129: oUop = { `op,   `srx8, `c   };
		130: oUop = { `inc_eof, `sma, `pc };
//UNUSED
		131: oUop = { `op, `nop, `null };
//SUBr_b
		132: oUop = { `op, `sx16r, `a       };
		133: oUop = { `update_flags, `subx16, `b      };
		134: oUop = { `inc_eof, `srx16, `a  };
//DECr_d
		135:	oUop = { `inc_eof_fu, `dec16,    `d  };
//LDrn_d
		136: oUop = {`inc, `sma, `pc     };
		137: oUop = { `inc,  `nop, `null };
		138: oUop = {`eof, `srm,  `d     };
//JPnn
		139: oUop = {`op, `sx16r,  `hl };
		140: oUop = {`inc,  `sma,   `pc };
		141: oUop = {`inc,  `nop, `null };
		142: oUop = {`inc,   `srm,   `l  };
		143: oUop = {`op,   `srm,   `h  };
		144: oUop = {`op,   `spc,   `hl  };
		145: oUop = {`eof,  `srx16, `hl };
//LDrn_h
		146: oUop = {`inc, `sma, `pc     };
		147: oUop = { `inc,  `nop, `null };
		148: oUop = {`eof, `srm,  `h     };
//LDAHLI
		149: oUop = {`op, `sma, `hl  };
		150: oUop = {`op,  `nop, `null };
		151: oUop = {`op, `srm, `a    };
		152: oUop = { `inc ,`inc16,  `hl };
		153: oUop = {`eof, `sma, `pc  };
//LDHLmn
		154: oUop = {`inc,  `sma,   `pc };
		155: oUop = {`op,  `nop, `null };
		156: oUop = {`op,   `srm,   `x8  };
		157: oUop = {`op,   `sma,   `hl };
		158: oUop = {`op,  `nop, `null };
		159: oUop = {`op,   `smw,   `x8  };
		160: oUop = {`inc_eof,  `sma,   `pc };
//INCR_b
		161: oUop = {`inc_eof_fu, `inc16, `b };
//NOP
		162: oUop = { `inc_eof, `nop, `null };
//DI
		163: oUop = { `inc_eof, `ceti, `null }; //Disable Interruption
//INCr_d
		164: oUop = { `update_flags, `inc16, `d };
		165: oUop = { `inc_eof,  `nop, `null };
//DECr_e
		166: oUop = { `update_flags, `dec16, `e };
		167: oUop = { `inc_eof,  `nop, `null };
//DECDE
		168: oUop = { `inc_eof, `dec16, `de };
//DECBC
		169: oUop = { `inc_eof,  `dec16, `bc};
//DECr_h
		170: oUop = { `update_flags, `dec16, `h };
		171: oUop = { `inc_eof,  `nop, `null };
//DECHL
		172: oUop = { `inc_eof, `dec16, `hl };
//UNUSED
		173: oUop = { `inc_eof,  `nop, `null };
//UNUSED
		174: oUop = { `inc_eof,  `nop, `null };
//ADDr_a
		175: oUop = { `op, `sx16r, `a       };
		176: oUop = { `update_flags, `addx16u, `a };
		177: oUop = { `inc_eof, `srx16, `a  };
//ADDr_b
		178: oUop = { `op, `sx16r, `a       };
		179: oUop = { `update_flags, `addx16u, `b };
		180: oUop = { `inc_eof, `srx16, `a  };
//SUBr_c
		181: oUop = { `op, `sx16r, `a       };
		182: oUop = { `update_flags, `subx16, `c      };
		183: oUop = { `inc_eof, `srx16, `a  };
//ADDr_c
		184: oUop = { `op, `sx16r, `a       };
		185: oUop = { `update_flags, `addx16u, `c };
		186: oUop = { `inc_eof, `srx16, `a  };
//ADDr_d
		187: oUop = { `op, `sx16r, `a       };
		188: oUop = { `update_flags, `addx16u, `d };
		189: oUop = { `inc_eof, `srx16, `a  };
//ADDr_e
		190: oUop = { `op, `sx16r, `a       };
		191: oUop = { `update_flags, `addx16u, `e };
		192: oUop = { `inc_eof, `srx16, `a  };
//ADDr_h
		193: oUop = { `op, `sx16r, `a       };
		194: oUop = { `update_flags, `addx16u, `h };
		195: oUop = { `inc_eof, `srx16, `a  };
//ADDr_l
		196: oUop = { `op, `sx16r, `a       };
		197: oUop = { `update_flags, `addx16u, `l };
		198: oUop = { `inc_eof, `srx16, `a  };
//SUBr_d
		199: oUop = { `op, `sx16r, `a       };
		200: oUop = { `update_flags, `subx16, `d      };
		201: oUop = { `inc_eof, `srx16, `a  };
//SUBr_e
		202: oUop = { `op, `sx16r, `a       };
		203: oUop = { `update_flags, `subx16, `e      };
		204: oUop = { `inc_eof, `srx16, `a  };
//SUBr_h
		205: oUop = { `op, `sx16r, `a       };
		206: oUop = { `update_flags, `subx16, `h      };
		207: oUop = { `inc_eof, `srx16, `a  };
//SUBr_l
		208: oUop = { `op, `sx16r, `a       };
		209: oUop = { `update_flags, `subx16, `l      };
		210: oUop = { `inc_eof, `srx16, `a  };
//SUB_a
		211: oUop = { `op, `sx16r, `a       };
		212: oUop = { `update_flags, `subx16, `a      };
		213: oUop = { `inc_eof, `srx16, `a  };
//PUSHDE
		214: oUop = { `op, `dec16,  `sp  };
		215: oUop = { `op, `sma,    `sp  };
		216: oUop = { `op ,`smw,    `d   };
		217: oUop = { `op, `dec16,  `sp  };
		218: oUop = { `op ,`smw,     `e  };
		219: oUop = { `inc_eof ,`sma,`pc };
//PUSHHL
		220: oUop = { `op, `dec16,  `sp  };
		221: oUop = { `op, `sma,    `sp  };
		222: oUop = { `op ,`smw,    `h   };
		223: oUop = { `op, `dec16,  `sp  };
		224: oUop = { `op ,`smw,     `l  };
		225: oUop = { `inc_eof ,`sma,`pc };
//POPDE
		226: oUop = { `op, `sma,    `sp   };
		227: oUop = { `op ,`inc16,  `sp   };
		228: oUop = { `op ,`srm,    `e    };
		229: oUop = { `op ,`srm,    `d    };
		230: oUop = { `inc ,`inc16,  `sp  };
		231: oUop = { `eof, `sma,    `pc  };
//POPHL
		232: oUop = { `op, `sma,    `sp   };
		233: oUop = { `op ,`inc16,  `sp   };
		234: oUop = { `op ,`srm,    `l    };
		235: oUop = { `op ,`srm,    `h    };
		236: oUop = { `inc ,`inc16,  `sp  };
		237: oUop = { `eof, `sma,    `pc  };
//LDHLmr_b
		238: oUop = {`inc, `sma, `hl  };
		239: oUop = {`op, `smw, `b    };
		240: oUop = {`eof, `sma, `pc  };
//LDHLmr_c
		241: oUop = {`inc, `sma, `hl  };
		242: oUop = {`op, `smw, `c    };
		243: oUop = {`eof, `sma, `pc  };
//LDHLmr_d
		244: oUop = {`inc, `sma, `hl  };
		245: oUop = {`op, `smw, `d    };
		246: oUop = {`eof, `sma, `pc  };
//LDDEmA
		247: oUop = {`op, `sma, `de  };
		248: oUop = {`op, `smw, `a    };
		249: oUop = {`inc_eof, `sma, `pc    };
//INCr_e
    250:  oUop = { `update_flags, `inc16, `e };
		251:  oUop = { `inc_eof, `nop, `null };
//RET
		252: oUop = {`op ,`sma,  `sp   };
		253: oUop = {`op, `sx16r,  `hl };
		254: oUop = {`op, `inc16, `sp  };
		255: oUop = {`op,   `srm,   `l  };
		256: oUop = {`op,   `srm,   `h  };
		257: oUop = {`op,   `spc,   `hl  };
		258: oUop = {`op,  `srx16, `hl };
		259: oUop = {`op, `inc16, `sp  };
		260: oUop = { `eof ,`sma,  `pc   };
//PUSHAF
		261: oUop = { `op, `dec16,  `sp  };
		262: oUop = { `op, `sma,    `sp  };
		263: oUop = { `op ,`smw,    `a   };
		264: oUop = { `op, `dec16,  `sp  };
		265: oUop = { `op ,`smw,     `f  };
		266: oUop = { `inc_eof ,`sma,`pc };
//POPAF
		267: oUop = { `op, `sma,    `sp   };
		268: oUop = { `op ,`inc16,  `sp   };
		269: oUop = { `op ,`srm,    `f    };
		270: oUop = { `op ,`srm,    `a    };
		271: oUop = { `inc ,`inc16,  `sp  };
		272: oUop = { `eof, `sma,    `pc  };
//LDBCnn
		273: oUop = { `inc, `sma, `pc   };
		274: oUop = { `inc, `nop, `null };
	  275: oUop = { `op , `srm, `c    };
		276: oUop = { `inc_eof , `srm, `b    };
//INCBC
		277: oUop = { `inc_eof ,`inc16,  `bc };
//Z80 1 Byte op
    278: oUop = { `update_flags, `z801bop , `a };
		279: oUop = { `inc_eof, `nop , `null };
//LDAmm
	  280: oUop = { `inc, `sx16r,  `hl };
		281: oUop = { `inc, `sma , `pc };
		282: oUop = { `op ,`srm,    `l  };
		283: oUop = { `op ,`srm,    `h  };
		284: oUop = { `op, `sma ,   `hl };
		285: oUop = { `op, `nop ,   `null };	//remember to wait 1cc after sma
		286: oUop = { `op ,`srm,    `a  };
		287: oUop = { `op, `srx16,  `hl };
		288: oUop = { `inc_eof, `sma , `pc };
//CALLNZnn
		289: oUop = { `inc,  `nop,  `null  };
		290: oUop = { `inc,  `nop,  `null  };
		291: oUop = { `op , `srm,    `y8   }; //l = MEM[pc] = literal
		292: oUop = { `inc_eof_z, `srm, `x8   }; //l = MEM[pc] = literal
		293: oUop = { `op,  `sma,    `sp  };
		294: oUop = { `op,  `smw,    `pch };	//MEM[sp] = pc[7:0]
		295: oUop = { `op,  `dec16,  `sp  };
		296: oUop = { `op , `smw,    `pc  };	//MEM[sp+1] = pc[15:8]
		297: oUop = { `op,  `dec16,  `sp  };
		298: oUop = { `op , `spc,    `xy16  };
		299: oUop = { `eof ,`sma,   `pc   };
//DECr_b
		300:	oUop = { `update_flags, `dec16,    `b  };
		301:  oUop = { `inc_eof, `nop, `null};
//INCr_a
		302: oUop = { `update_flags, `inc16, `a };
		303:  oUop = { `inc_eof, `nop, `null};
//INCSP
		304: oUop = { `op, `inc16, `sp };  //increment SP
		305:  oUop = { `inc_eof, `nop, `null};
//DECSP
		306: oUop = { `inc_eof, `dec16, `sp };
//UNUSED
		307:  oUop = { `inc_eof, `nop, `null};
//INCr_l
		308: oUop = { `update_flags, `inc16, `l };
		309:  oUop = { `inc_eof, `nop, `null};
//DECr_l
		310: oUop = { `update_flags, `dec16, `l };
		311:  oUop = { `inc_eof, `nop, `null};
//INCr_h
    312: oUop = { `update_flags, `inc16, `h };
		313:  oUop = { `inc_eof, `nop, `null};
//ADDn
		314: oUop = { `inc, `sma, `pc   };
		315: oUop = { `op,  `nop, `null };
		316: oUop = { `op,  `srm, `x16 };
		317: oUop = { `update_flags,  `addx16u, `a };
		318: oUop = { `inc_eof, `srx16, `a};
//SUBn
		319: oUop = { `inc, `sma, `pc   };
		320: oUop = { `op,  `nop, `null };
		321: oUop = { `op,  `srm, `x16 };
		322: oUop = { `update_flags,  `subx16, `a };
		323: oUop = { `inc_eof, `srx16, `a};
//CPr_c
		324: oUop = { `op,  `sx16r, `a };
		325: oUop = { `update_flags,  `subx16, `c };
		326: oUop = { `inc_eof, `nop, `null};
//LDrHLm_b
		327:  oUop = { `op,  `sma,   `hl };
		328:  oUop = { `op,  `nop,   `null };
		329:  oUop = { `op,  `srm,   `b };
		330:  oUop = { `inc_eof, `sma, `pc};
//LDrHLm_c
		331:  oUop = { `op,  `sma,   `hl };
		332:  oUop = { `op,  `nop,   `null };
		333:  oUop = { `op,  `srm,   `c };
		334:  oUop = { `inc_eof, `sma, `pc};
//LDrHLm_d
		335:  oUop = { `op,  `sma,   `hl };
		336:  oUop = { `op,  `nop,   `null };
		337:  oUop = { `op,  `srm,   `d };
		338:  oUop = { `inc_eof, `sma, `pc};
//XORHL
		339:  oUop = { `op,  `sma,   `hl   };
		340:  oUop = { `op,  `nop,   `null };
		341:  oUop = { `op,  `srm,   `x16  };
		342:  oUop = { `update_flags, `xorx16, `a};
		343:  oUop = { `op, `srx16, `a};
		344:  oUop = { `inc_eof, `sma, `pc};
//ADCn
		345:  oUop = { `inc,  `sma,   `pc   };
		346:  oUop = { `op,  `nop,   `null };
		347:  oUop = { `op,  `srm,   `x16  };
		348:  oUop = { `op,  `addx16,   `a  };
		349:  oUop = { `update_flags,  `addx16,   `carry  };
		350:  oUop = { `inc_eof, `sma, `pc};
//ADDHLDE
		351:  oUop = { `inc,  `sx16r,   `hl   };
		352:  oUop = { `update_flags,  `addx16,   `de   };
		353:  oUop = { `eof,  `srx16,   `hl   };
//UNUSED
		354:  oUop = { `inc,  `sma,   `pc   };
		355:  oUop = { `op, `xorx16, `x16 };
		356:  oUop = { `update_flags,  `addx16,   `carry  };
		357:  oUop = { `inc_eof_nz,  `srm, `x16 };
		358:  oUop = { `eof,  `addx16, `x16 };
//XORn
		359: oUop = { `inc, `sma,  `pc };
		360: oUop = { `op, `sx16r , `a };
		361: oUop = { `update_flags ,`xorx16, `idata  };
		362: oUop = { `inc_eof ,`srx16,  `a  };
//RRA
		363: oUop = { `update_flags, `rrot,  `null  };
		364: oUop = { `inc_eof, `nop,  `null  };
//RETNC
		365:  oUop = { `op, `xorx16, `x16 };
		366:  oUop = { `update_flags,  `addx16,   `carry  };
		367:  oUop = { `inc_eof_nz,  `srm, `x16 };
		368: oUop = {`op ,`sma,  `sp   };
		369: oUop = {`op, `sx16r,  `hl };
		370: oUop = {`op, `inc16, `sp  };
		371: oUop = {`op,   `srm,   `l  };
		372: oUop = {`op,   `srm,   `h  };
		373: oUop = {`op,   `spc,   `hl  };
		374: oUop = {`op,  `srx16, `hl };
		375: oUop = {`op, `inc16, `sp  };
		376: oUop = { `eof ,`sma,  `pc   };
//RETZ
		377: oUop = { `inc_eof_z,  `nop, `null };
		378: oUop = {`op ,`sma,  `sp   };
		379: oUop = {`op, `sx16r,  `hl };
		380: oUop = {`op, `inc16, `sp  };
		381: oUop = {`op,   `srm,   `l  };
		382: oUop = {`op,   `srm,   `h  };
		383: oUop = {`op,   `spc,   `hl  };
		384: oUop = {`op,  `srx16, `hl };
		385: oUop = {`op, `inc16, `sp  };
		386: oUop = { `eof ,`sma,  `pc   };
//ORHL
		387: oUop = {`op ,`sma,  `hl   };
		388: oUop = {`op,  `nop,   `null };
		389: oUop = {`update_flags,   `xora,   `idata  };
		390: oUop = { `inc_eof ,`sma,  `pc   };
//DECHLm
		391: oUop = {`op ,`sma,  `hl   };
		392: oUop = {`op,  `nop,   `null };
		393: oUop = {`op,  `srm,   `x16  };
		394: oUop = {`update_flags,  `dec16,   `x16 };
		395: oUop = {`nop,  `smw,   `x16 };
		396: oUop = {`inc_eof,  `sma,   `pc };
//LDrHLm_l
		397: oUop = {`op ,`sma,  `hl   };
		398: oUop = {`op,  `nop,   `null };
		399: oUop = {`op,  `srm,   `l  };
		400: oUop = {`inc_eof,  `sma,   `pc };
//RETNZ
		401: oUop = { `inc_eof_nz,  `nop, `null };
		402: oUop = {`op ,`sma,  `sp   };
		403: oUop = {`op, `sx16r,  `hl };
		404: oUop = {`op, `inc16, `sp  };
		405: oUop = {`op,   `srm,   `l  };
		406: oUop = {`op,   `srm,   `h  };
		407: oUop = {`op,   `spc,   `hl  };
		408: oUop = {`op,  `srx16, `hl };
		409: oUop = {`op, `inc16, `sp  };
		410: oUop = { `eof ,`sma,  `pc   };
//ADDHLHL
		411: oUop = {`op, `sx16r,  `hl   };
		412: oUop = {`update_flags, `addx16r16,  `x16 };
		413: oUop = {`inc_eof, `srx16,  `hl   };
//JRNCn
		414:  oUop = { `inc,  `sma,   `pc   };
		415:  oUop = { `op, `xorx16, `x16 };
		416:  oUop = { `update_flags,  `addx16,   `carry  };
		417:  oUop = { `inc_eof_nz,  `srm, `x16 };
		418:  oUop = { `nop,  `addx16, `pc };
		419:  oUop = { `eof,  `spc, `x16 };
//ANDHL
			420: oUop = { `inc, `sma,  `hl };
			421: oUop = { `op, `nop , `null };
			422: oUop = { `update_flags ,`anda,    `idata  };
			423: oUop = { `inc_eof ,`nop,    `null  };
//LDHLmr_e
			424: oUop = {`inc, `sma, `hl  };
			425: oUop = {`op, `smw, `e    };
			426: oUop = {`eof, `sma, `pc  };
//LDHLmr_h
			427: oUop = {`inc, `sma, `hl  };
			428: oUop = {`op, `smw, `h    };
			429: oUop = {`eof, `sma, `pc  };
//LDHLmr_h
			430: oUop = {`inc, `sma, `hl  };
			431: oUop = {`op, `smw, `l    };
			432: oUop = {`eof, `sma, `pc  };
//LDABCm
			433: oUop = {`inc, `sma, `bc  };
			434: oUop = {`op, `nop, `null };
			435: oUop = {`op, `srm, `a    };
			436: oUop = {`eof, `sma, `pc  };
//LDrHLm_a
			437: oUop = {`inc, `sma, `hl  };
			438: oUop = {`op, `nop, `null };
			439: oUop = {`op, `srm, `a    };
			440: oUop = {`eof, `sma, `pc  };
//LDrHLm_e
			441: oUop = {`inc, `sma, `hl  };
			442: oUop = {`op, `nop, `null };
			443: oUop = {`op, `srm, `e    };
			444: oUop = {`eof, `sma, `pc  };
//LDrHLm_e
			445: oUop = {`inc, `sma, `hl  };
			446: oUop = {`op, `nop, `null };
			447: oUop = {`op, `srm, `h    };
			448: oUop = {`eof, `sma, `pc  };
//ADCr_a
			449: oUop = { `op, `sx16r, `a  };
			450: oUop = { `op, `addx16, `carry };
			451: oUop = { `update_flags, `addx16, `a};
			452: oUop = { `inc_eof, `srx16, `a  };
//ADCr_b
			453: oUop = { `op, `sx16r, `a  };
			454: oUop = { `op, `addx16, `carry };
			455: oUop = { `update_flags, `addx16, `b};
			456: oUop = { `inc_eof, `srx16, `a  };
//ADCr_c
			457: oUop = { `op, `sx16r, `a  };
			458: oUop = { `op, `addx16, `carry };
			459: oUop = { `update_flags, `addx16, `c};
			460: oUop = { `inc_eof, `srx16, `a  };
//ADCr_d
			461: oUop = { `op, `sx16r, `a  };
			462: oUop = { `op, `addx16, `carry };
			463: oUop = { `update_flags, `addx16, `d};
			464: oUop = { `inc_eof, `srx16, `a  };
//ADCr_e
			465: oUop = { `op, `sx16r, `a  };
			466: oUop = { `op, `addx16, `carry };
			467: oUop = { `update_flags, `addx16, `e};
			468: oUop = { `inc_eof, `srx16, `a  };
//ADCr_h
			469: oUop = { `op, `sx16r, `a  };
			470: oUop = { `op, `addx16, `carry };
			471: oUop = { `update_flags, `addx16, `h};
			472: oUop = { `inc_eof, `srx16, `a  };
//ADCr_l
			473: oUop = { `op, `sx16r, `a  };
			474: oUop = { `op, `addx16, `carry };
			475: oUop = { `update_flags, `addx16, `l};
			476: oUop = { `inc_eof, `srx16, `a  };
//SHR
		  477: oUop = { `update_flags, `shr,  `null  };
			478: oUop = { `inc_eof, `nop, `null  };
//FLOW_ID_INT_VBLANK
/*
        163: oUop = { `op, `ceti, `null};  //Disable interruption
        164: oUop = { `inc, `dec16,  `sp  };
        165: oUop = { `inc, `sx16r,  `hl  };
        166: oUop = { `op , `srm,    `l   }; //l = MEM[pc] = literal
        167: oUop = { `inc, `srm,    `h   }; //l = MEM[pc] = literal
        168: oUop = { `op,  `sma,    `sp  };
        169: oUop = { `op,  `smw,    `pch }; //MEM[sp] = pc[7:0]
        170: oUop = { `op,  `dec16,  `sp  };
        171: oUop = { `op , `smw,    `pc  }; //MEM[sp+1] = pc[15:8]
        172: oUop = { `op , `sx16l,    8'h40  };
        173: oUop = { `op, `srx16,  `pc  };
        174: oUop = { `inc ,`sma,   `pc   };
		*/
	/*
	//RETI
	inc sma shadow_addr_reg
	op  smw
	op  inc16 x16
	op  smw b
	op  inc16 x16
	op  smw c
	op  inc16 x16
	op  smw e
	op  inc16 x16
	op  smw h
	op  inc16 x16
	op  smw l
	op  inc16 x16
	op  smw spl
	op  inc16 x16
	op  smw sph
	*/
	default:
		oUop = {`op, `nop, `null };
	endcase
end
endmodule