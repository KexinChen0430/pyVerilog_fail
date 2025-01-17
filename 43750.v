module tb_alu();
	// ============================================================
	/**
	 */
	// Declare "wire" signals: outputs from the DUT
	// result output signal
	wire [0:127] res;
	// ============================================================
	// Declare "reg" signals: inputs to the DUT
	// reg_A
	reg [0:127] r_A;
	// reg_B
	reg [0:127] r_B;
	// Control signal bits - ppp; ctrl_ppp
	reg [0:2] c_ppp;
	// Control signal bits - ww; ctrl_ww
	reg [0:1] c_ww;
	/**
	 */
	reg [0:4] a_op;
	// Bus/Signal to contain the expected output/result
	reg [0:127] e_r;
	// ============================================================
	// Defining constants: parameter [name_of_constant] = value;
	//parameter size_of_input = 6'd32;
	// ============================================================
	/**
	 */
	alu alu1 (
		// instance_name(signal name),
		// Signal name can be the same as the instance name
		// alu (reg_A,reg_B,ctrl_ppp,ctrl_ww,alu_op,result)
		r_A,r_B,c_ppp,c_ww,a_op,res);
	// ============================================================
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display($time, " << Starting the simulation >>");
/*
//SLLI TEST COMMANDS - Andrew
		// aluwslli SLLI aa
		r_A=128'h11111111111111111111111111111111;
		r_B=128'h00000000000000000000000000000000;//no shift
		e_r=128'h11111111111111111111111111111111;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI aa
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e;
		c_ppp=`aa;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI aa
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (0"0001"000)
		e_r=128'h1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e;
		c_ppp=`aa;
		c_ww=`w16; // 2 byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI aa
		r_A=128'h000f000f000f000f000f000f000f000f;
		r_B=128'h08000000000000000000000000000000;//shift 1 ("00001"000)
		e_r=128'h001e001e001e001e001e001e001e001e;
		c_ppp=`aa;
		c_ww=`w32; // 2 byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h1e1e1e1e1e1e1e1e0000000000000000;
		c_ppp=`uu;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h00000000000000001e1e1e1e1e1e1e1e;
		c_ppp=`dd;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h001e001e001e001e001e001e001e001e;
		c_ppp=`oo;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h1e000000000000000000000000000000;
		c_ppp=`mm;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
*/
//SLLI TEST COMMANDS - Andrew
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h1e001e001e001e001e001e001e001e00;
		c_ppp=`ee;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
		// aluwslli SLLI
		r_A=128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
		r_B=128'h08000000000000000000000000000000;//shift 1 (00"001"000)
		e_r=128'h0000000000000000000000000000001e;
		c_ppp=`ll;
		c_ww=`w8; // byte style
		a_op=`aluwslli;
		#10;
/*
//PRM TEST COMMANDS - Andrew
		// aluwprm PRM aa
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h000102030405060708090a0b0c0d0e0f;
		e_r=128'h0123456789abcdef0123456789abcdef;
		c_ppp=`aa;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM aa
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h23456789abcdef0123456789abcdef01;
		c_ppp=`aa;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM uu
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h23456789abcdef010000000000000000;
		c_ppp=`uu;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM dd
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h000000000000000023456789abcdef01;
		c_ppp=`dd;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM ee
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h23006700ab00ef0023006700ab00ef00;
		c_ppp=`ee;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM oo
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h0045008900cd00010045008900cd0001;
		c_ppp=`oo;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM mm
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h23000000000000000000000000000000;
		c_ppp=`mm;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
		// aluwprm PRM ll
		r_A=128'h0123456789abcdef0123456789abcdef;
		r_B=128'h0102030405060708090a0b0c0d0e0f00;
		e_r=128'h00000000000000000000000000000001;
		c_ppp=`ll;
		c_ww=`w8; // this does not matter, but must be specified
		a_op=`aluwprm;
		#10;
*/
/*
//ZHIYANG's TEST CASES FOR ALU
		// aluwadd AND aa AND w8
		r_A=128'h0102030405060708090a0b0c0d0e0f10;
		r_B=128'h01020304010203040507070809050607;
		e_r=128'h0204060806080a0c0e11121416131517;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND aa AND w8
		r_A=128'hfffffffffffffffffffffffffffffff9;
		r_B=128'h00000000000000000000000000000008;
		e_r=128'hffffffffffffffffffffffffffffff01;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND aa AND w16
		r_A=128'h00010002000300040005000600070008;
		r_B=128'h0002000400060008000c001000120014;
		e_r=128'h000300060009000c001100160019001c;
		c_ppp=`aa;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND aa AND w32
		r_A=128'h00000001000000020000000300000004;
		r_B=128'h00000005000000060000000700000008;
		e_r=128'h00000006000000080000000a0000000c;
		c_ppp=`aa;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=40
		// aluwadd AND uu AND w8
		r_A=128'h0102030405060708090a0b0c0d0f1011;
		r_B=128'h01010202030303030405060104050601;
		e_r=128'h0203050608090a0b0d10130d11141612;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND uu AND w32
		r_A=128'h00010002000300040005000600070008;
		r_B=128'h00020002000300030001000100010003;
		e_r=128'h0003000400060007000600070008000b;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND uu AND w32
		r_A=128'h00000001000000020000000300000004;
		r_B=128'h00000005000000060000000700000008;
		e_r=128'h00000006000000080000000100000002;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=70
		// aluwadd AND dd AND w8
		r_A=128'h090a0b0c0d0f10110102030405060708;
		r_B=128'h04050601040506010101020203030303;
		e_r=128'h0d10130d111416120203050608090a0b;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND dd AND w32
		r_A=128'h00050006000700080001000200030004;
		r_B=128'h00010001000100030002000200030003;
		e_r=128'h000600070008000b0003000400060007;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND dd AND w32
		r_A=128'h00000003000000040000000100000002;
		r_B=128'h00000007000000080000000500000006;
		e_r=128'h00000001000000020000000600000008;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=100
		// aluwadd AND oo AND w8
		r_A=128'h090a0b0c0d0f10110102030405060708;
		r_B=128'h04050601040506010101020203030303;
		e_r=128'hff0ffe0dfd14fc12fb03fa06f909f80b;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`oo;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND oo AND w32
		r_A=128'h00050006000700080001000200030004;
		r_B=128'h00010001000100030002000200030003;
		e_r=128'he0010007e002000be0030004e0040007;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`oo;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND oo AND w32
		r_A=128'h00000003000000040000000100000002;
		r_B=128'h00000007000000080000000500000006;
		e_r=128'hff0000f10000000cff0000f200000008;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`oo;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=130
		// aluwadd AND ee AND w8
		r_A=128'h090a0b0c0d0f10110102030405060708;
		r_B=128'h04050601040506010101020203030303;
		e_r=128'h0dff11fe11fd16fc02fb05fa08f90afb;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ee;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND ee AND w32
		r_A=128'h00050006000700080001000200030004;
		r_B=128'h00010001000100030002000200030003;
		e_r=128'h0006e0010008e0020003e0030006e004;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ee;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND ee AND w32
		r_A=128'h00000003000000040000000100000002;
		r_B=128'h00000007000000080000000500000006;
		e_r=128'h0000000aff0000f100000006f200000d;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ee;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=160
		// aluwadd AND mm AND w8
		r_A=128'h090a0b0c0d0f10110102030405060708;
		r_B=128'h04050601040506010101020203030303;
		e_r=128'h0dff11ffdd004499bb7733ccdd221199;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`mm;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND mm AND w32
		r_A=128'h00050006000700080001000200030004;
		r_B=128'h00010001000100030002000200030003;
		e_r=128'h0006e00e0008e002e003e003e006e004;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`mm;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND mm AND w32
		r_A=128'h00000003000000040000000100000002;
		r_B=128'h00000007000000080000000500000006;
		e_r=128'h0000000aff0000f1ff000006ff00000d;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`mm;
		c_ww=`w32;
		a_op=`aluwadd;
		// ======================================
		#10								//TIME=190
		// aluwadd AND ll AND w8
		r_A=128'h090a0b0c0d0f10110102030405060708;
		r_B=128'h04050601040506010101020203030303;
		e_r=128'hcdff11ffdd004499bb7733ccdd22110b;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ll;
		c_ww=`w8;
		a_op=`aluwadd;
		#10
		// aluwadd AND ll AND w32
		r_A=128'h00050006000700080001000200000004;
		r_B=128'h00010001000100030002000200000003;
		e_r=128'hc006e00e0008e002e003e003e0000007;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ll;
		c_ww=`w16;
		a_op=`aluwadd;
		#10
		// aluwadd AND ll AND w32
		r_A=128'h00000003000000040000000100000002;
		r_B=128'h00000007000000080000000500000006;
		e_r=128'hc000000dff0000f1ff00000600000008;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ll;
		c_ww=`w32;
		a_op=`aluwadd;
		/ * *
		#10								//TIME=220
		// aluwand AND aa AND w8
		r_A=128'h5b76abfdedbe9389ddcf35f657afebb6;
		r_B=128'h9389ddcf35f65b76abfdedbe98dc3f39;
		e_r=128'h130089cd25b6130089cd25b6108c2b30;
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwand;
		#10
		// aluwand AND aa AND w16
		r_A=128'h00050007000d000e001e00d600170018;
		r_B=128'h0009000800050006001300f600180017;
		e_r=128'h0001000000050006001200d600100010;
		c_ppp=`aa;
		c_ww=`w16;
		a_op=`aluwand;
		#10
		// aluwand AND aa AND w32
		r_A=128'h0000000f0000000e0000000b0000000a;
		r_B=128'h0000000c000000030000000d0000000d;
		e_r=128'h0000000c000000020000000900000008;
		c_ppp=`aa;
		c_ww=`w32;
		a_op=`aluwand;
		// ======================================
		#10								//TIME=250
		// aluwand AND uu AND w8
		r_A=128'h0e0a0d0d0b0e0d0b090a0b0c0d0f1011;
		r_B=128'h030d0f050f060b030405060104050601;
		e_r=128'h02080d050b0609030d10130d11141612;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w8;
		a_op=`aluwand;
		#10
		// aluwadd AND uu AND w32
		r_A=128'h000d000d000e000b0006000f000a000d;
		r_B=128'h000f00050006000f0009000c000d000b;
		e_r=128'h000d00050006000b0000000c00080009;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w16;
		a_op=`aluwand;
		#10
		// aluwadd AND uu AND w32
		r_A=128'h00000001000000020000000300000004;
		r_B=128'h00000005000000060000000700000008;
		e_r=128'h00000001000000020000000100000002;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w32;
		a_op=`aluwand;
		// ======================================
		#10								//TIME=280
		// aluwand AND dd AND w8
		r_A=128'h090a0b0c0d0f1011010e0b02050b070a;
		r_B=128'h040506010405060101060d020d0d080d;
		e_r=128'h0d10130d111416120106090205090008;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w8;
		a_op=`aluwand;
		#10
		// aluwand AND dd AND w32
		r_A=128'h000500060007000800020002000e000d;
		r_B=128'h0001000100010003000d000200030005;
		e_r=128'h000600070008000b0000000200020005;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w16;
		a_op=`aluwand;
		#10
		// aluwand AND dd AND w32
		r_A=128'h00000003000000040000000b0000000e;
		r_B=128'h00000007000000080000000f00000003;
		e_r=128'h00000001000000020000000b00000002;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w32;
		a_op=`aluwand;
		// ======================================
		#10								//TIME=310
		// aluwand AND oo AND w8
		r_A=128'h090a0b0c0d0f1011010e030b05060708;
		r_B=128'h040d060f040d06110103020d03060307;
		e_r=128'hff08fe0cfd0dfc11fb02fa09f906f800;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`oo;
		c_ww=`w8;
		a_op=`aluwand;
		/ * *
		// ======================================
		#10								//TIME=320
		// aluwnot AND aa AND w8
		r_A=128'h090a0b0c0d0f1011010e030b05060708;
		r_B=128'h040d060f040d06110103020d03060307;
		e_r=128'hf6f5f4f3f2f0efeefef1fcf4faf9f8f7;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwnot;
		#10
		// aluwnot AND ee AND w8
		r_A=128'h44ff55ff22ff33ff66009900cc00bb00;
		r_B=128'h040d060f040d06110103020d03060307;
		e_r=128'hbb00aa00dd00cc0099ff66ff33ff44ff;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`ee;
		c_ww=`w8;
		a_op=`aluwnot;
		#10
		// aluwnot AND mm AND w32
		r_A=128'hba98fedc0d0f1011010e030b05060708;
		r_B=128'h040d060f040d06110103020d03060307;
		e_r=128'h45670123f2f0efeefef1fcf4faf9f8f7;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`mm;
		c_ww=`w32;
		a_op=`aluwnot;
		#10
		// aluwnot AND uu AND w16
		r_A=128'h0123456789abcdeeffffffffffffffff;
		r_B=128'h040d060f040d06110103020d03060307;
		e_r=128'hfedcba98765432110000000000000000;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`uu;
		c_ww=`w16;
		a_op=`aluwnot;
		// ======================================
		#10								//TIME=360
		// aluwor AND aa AND w8
		r_A=128'h5b4924086211598192408624b5268261;
		r_B=128'hac8241a24596a229241a2458ca442446;
		e_r=128'hffcb65aa6797fba9b65aa67cff66a667;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`aa;
		c_ww=`w8;
		a_op=`aluwor;
		#10
		// aluwor AND oo AND w16
		r_A=128'hffff0004ffff0000ffff0002ffff000b;
		r_B=128'h33330001333300aa333300053333000c;
		e_r=128'h44440005444400aa444400074444000f;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`oo;
		c_ww=`w16;
		a_op=`aluwor;
		#10
		// aluwor AND dd AND w32
		r_A=128'h88888888888888880000000500000004;
		r_B=128'h33333333333333330000000a00000008;
		e_r=128'hcccccccccccccccc0000000f0000000c;
		//		 hhhhHHHHhhhhHHHHllllLLLLllllLLLL
		c_ppp=`dd;
		c_ww=`w32;
		a_op=`aluwor;
*/
		// end simulation
		#30
		$display($time, " << Finishing the simulation >>");
		$finish;
	end
endmodule