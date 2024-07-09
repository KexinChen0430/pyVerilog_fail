module nco (
  clk, sine, phase_out
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [15 : 0] sine;
  output [15 : 0] phase_out;
  // synthesis translate_off
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire \blk00000025/sig000001b8 ;
  wire \blk00000025/sig000001b7 ;
  wire \blk00000025/sig000001b6 ;
  wire \blk00000025/sig000001b5 ;
  wire \blk00000025/sig000001b4 ;
  wire \blk00000025/sig000001b3 ;
  wire \blk00000025/sig000001b2 ;
  wire \blk00000025/sig000001b1 ;
  wire \blk00000025/sig000001b0 ;
  wire \blk00000025/sig000001af ;
  wire \blk00000025/sig000001ae ;
  wire \blk00000025/sig000001ad ;
  wire \blk00000025/sig000001ac ;
  wire \blk00000025/sig000001ab ;
  wire \blk00000025/sig000001aa ;
  wire \blk00000025/sig000001a9 ;
  wire \blk00000025/sig000001a8 ;
  wire \blk00000025/sig000001a7 ;
  wire \blk00000025/sig000001a6 ;
  wire \blk00000025/sig000001a5 ;
  wire \blk00000025/sig000001a4 ;
  wire \blk00000025/sig000001a3 ;
  wire \blk00000025/sig000001a2 ;
  wire \blk00000025/sig000001a1 ;
  wire \blk00000025/sig000001a0 ;
  wire \blk00000025/sig0000019f ;
  wire \blk00000025/sig0000019e ;
  wire \blk00000025/sig0000019d ;
  wire \blk00000025/sig0000019c ;
  wire \blk00000025/sig0000019b ;
  wire \blk00000025/sig0000019a ;
  wire \blk00000056/sig00000209 ;
  wire \blk00000056/sig00000208 ;
  wire \blk00000056/sig00000207 ;
  wire \blk00000056/sig00000206 ;
  wire \blk00000056/sig00000205 ;
  wire \blk00000056/sig00000204 ;
  wire \blk00000056/sig00000203 ;
  wire \blk00000056/sig00000202 ;
  wire \blk00000056/sig00000201 ;
  wire \blk00000056/sig00000200 ;
  wire \blk00000056/sig000001ff ;
  wire \blk00000056/sig000001fe ;
  wire \blk00000056/sig000001fd ;
  wire \blk00000056/sig000001fc ;
  wire \blk00000056/sig000001fb ;
  wire \blk00000056/sig000001fa ;
  wire \blk00000056/sig000001f9 ;
  wire \blk00000056/sig000001f8 ;
  wire \blk00000056/sig000001f7 ;
  wire \blk00000056/sig000001f6 ;
  wire \blk00000056/sig000001f5 ;
  wire \blk00000056/sig000001f4 ;
  wire \blk00000056/sig000001f3 ;
  wire \blk00000056/sig000001f2 ;
  wire \blk00000056/sig000001f1 ;
  wire \blk00000056/sig000001f0 ;
  wire \blk00000056/sig000001ef ;
  wire \blk00000056/sig000001ee ;
  wire \blk00000056/sig000001ed ;
  wire \blk00000056/sig000001ec ;
  wire \blk00000056/sig000001eb ;
  wire \blk00000087/sig0000021f ;
  wire \blk00000087/sig0000021e ;
  wire \blk00000087/sig0000021d ;
  wire \blk00000087/sig0000021c ;
  wire \blk00000087/sig0000021b ;
  wire \blk00000087/sig0000021a ;
  wire \blk00000087/sig00000219 ;
  wire \blk00000087/sig00000218 ;
  wire \blk00000087/sig00000217 ;
  wire \blk00000087/sig00000216 ;
  wire \blk00000087/sig00000212 ;
  wire \blk00000087/sig00000211 ;
  wire \blk00000087/sig00000210 ;
  wire \blk00000087/sig0000020f ;
  wire \blk00000087/sig0000020e ;
  wire \blk00000087/sig0000020d ;
  wire \blk00000087/sig0000020c ;
  wire \NLW_blk0000015d_DIPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<31>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<30>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<29>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<28>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<27>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<26>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<25>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<24>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<23>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<22>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<21>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<20>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<19>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<18>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<17>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<16>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<15>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<14>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<13>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<12>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<11>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<10>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<9>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<8>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<7>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<6>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<5>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOA<4>_UNCONNECTED ;
  wire \NLW_blk0000015d_ADDRA<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_ADDRA<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_ADDRB<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_ADDRB<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<31>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<30>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<29>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<28>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<27>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<26>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<25>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<24>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<23>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<22>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<21>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<20>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<19>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<18>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<17>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<16>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<15>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<14>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<13>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<12>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<11>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<10>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<9>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<8>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<7>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<6>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<5>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<4>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<3>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<2>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIB<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<31>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<30>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<29>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<28>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<27>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<26>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<25>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<24>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<23>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<22>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<21>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<20>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<19>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<18>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<17>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<16>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<15>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<14>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<13>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<12>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<11>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<10>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<9>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<8>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<7>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<6>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<5>_UNCONNECTED ;
  wire \NLW_blk0000015d_DOB<4>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<31>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<30>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<29>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<28>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<27>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<26>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<25>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<24>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<23>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<22>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<21>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<20>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<19>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<18>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<17>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<16>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<15>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<14>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<13>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<12>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<11>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<10>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<9>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<8>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<7>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<6>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<5>_UNCONNECTED ;
  wire \NLW_blk0000015d_DIA<4>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<31>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<30>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<29>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<28>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<27>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<26>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<25>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<24>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<23>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<22>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<21>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<20>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<19>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<18>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<17>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<16>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<15>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<14>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<13>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<12>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<11>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<10>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<9>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<8>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<7>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<6>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<5>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOA<4>_UNCONNECTED ;
  wire \NLW_blk0000015e_ADDRA<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_ADDRA<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_ADDRB<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_ADDRB<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<31>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<30>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<29>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<28>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<27>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<26>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<25>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<24>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<23>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<22>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<21>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<20>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<19>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<18>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<17>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<16>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<15>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<14>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<13>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<12>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<11>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<10>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<9>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<8>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<7>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<6>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<5>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<4>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<3>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<2>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIB<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<31>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<30>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<29>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<28>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<27>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<26>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<25>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<24>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<23>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<22>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<21>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<20>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<19>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<18>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<17>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<16>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<15>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<14>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<13>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<12>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<11>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<10>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<9>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<8>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<7>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<6>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<5>_UNCONNECTED ;
  wire \NLW_blk0000015e_DOB<4>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<31>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<30>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<29>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<28>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<27>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<26>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<25>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<24>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<23>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<22>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<21>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<20>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<19>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<18>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<17>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<16>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<15>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<14>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<13>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<12>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<11>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<10>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<9>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<8>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<7>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<6>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<5>_UNCONNECTED ;
  wire \NLW_blk0000015e_DIA<4>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<31>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<30>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<29>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<28>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<27>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<26>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<25>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<24>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<23>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<22>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<21>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<20>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<19>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<18>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<17>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<16>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<15>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<14>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<13>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<12>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<11>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<10>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<9>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<8>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<7>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<6>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<5>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<4>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOA<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_ADDRA<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_ADDRA<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_ADDRB<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_ADDRB<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<31>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<30>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<29>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<28>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<27>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<26>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<25>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<24>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<23>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<22>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<21>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<20>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<19>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<18>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<17>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<16>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<15>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<14>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<13>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<12>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<11>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<10>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<9>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<8>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<7>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<6>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<5>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<4>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<2>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIB<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPA<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPA<2>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPA<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPA<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPB<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPB<2>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPB<1>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOPB<0>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<31>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<30>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<29>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<28>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<27>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<26>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<25>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<24>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<23>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<22>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<21>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<20>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<19>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<18>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<17>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<16>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<15>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<14>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<13>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<12>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<11>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<10>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<9>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<8>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<7>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<6>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<5>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<4>_UNCONNECTED ;
  wire \NLW_blk0000015f_DOB<3>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<31>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<30>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<29>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<28>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<27>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<26>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<25>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<24>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<23>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<22>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<21>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<20>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<19>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<18>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<17>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<16>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<15>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<14>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<13>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<12>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<11>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<10>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<9>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<8>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<7>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<6>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<5>_UNCONNECTED ;
  wire \NLW_blk0000015f_DIA<4>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPA<3>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPA<2>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPA<1>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPA<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<31>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<30>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<29>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<28>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<27>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<26>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<25>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<24>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<23>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<22>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<21>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<20>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<19>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<18>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<17>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<16>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<15>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<14>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<13>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<12>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<11>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<10>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<9>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<8>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<7>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<6>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<5>_UNCONNECTED ;
  wire \NLW_blk00000160_DOA<4>_UNCONNECTED ;
  wire \NLW_blk00000160_ADDRA<1>_UNCONNECTED ;
  wire \NLW_blk00000160_ADDRA<0>_UNCONNECTED ;
  wire \NLW_blk00000160_ADDRB<1>_UNCONNECTED ;
  wire \NLW_blk00000160_ADDRB<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<31>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<30>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<29>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<28>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<27>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<26>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<25>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<24>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<23>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<22>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<21>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<20>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<19>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<18>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<17>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<16>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<15>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<14>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<13>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<12>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<11>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<10>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<9>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<8>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<7>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<6>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<5>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<4>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<3>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<2>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<1>_UNCONNECTED ;
  wire \NLW_blk00000160_DIB<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPA<3>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPA<2>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPA<1>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPA<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPB<3>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPB<2>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPB<1>_UNCONNECTED ;
  wire \NLW_blk00000160_DIPB<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPB<3>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPB<2>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPB<1>_UNCONNECTED ;
  wire \NLW_blk00000160_DOPB<0>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<31>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<30>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<29>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<28>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<27>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<26>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<25>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<24>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<23>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<22>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<21>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<20>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<19>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<18>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<17>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<16>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<15>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<14>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<13>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<12>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<11>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<10>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<9>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<8>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<7>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<6>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<5>_UNCONNECTED ;
  wire \NLW_blk00000160_DOB<4>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<31>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<30>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<29>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<28>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<27>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<26>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<25>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<24>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<23>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<22>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<21>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<20>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<19>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<18>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<17>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<16>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<15>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<14>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<13>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<12>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<11>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<10>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<9>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<8>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<7>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<6>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<5>_UNCONNECTED ;
  wire \NLW_blk00000160_DIA<4>_UNCONNECTED ;
  wire NLW_blk00000161_Q15_UNCONNECTED;
  wire NLW_blk00000163_Q15_UNCONNECTED;
  wire NLW_blk00000165_Q15_UNCONNECTED;
  wire NLW_blk00000167_Q15_UNCONNECTED;
  wire NLW_blk00000169_Q15_UNCONNECTED;
  wire NLW_blk0000016b_Q15_UNCONNECTED;
  wire NLW_blk0000016d_Q15_UNCONNECTED;
  wire NLW_blk0000016f_Q15_UNCONNECTED;
  wire NLW_blk00000171_Q15_UNCONNECTED;
  wire NLW_blk00000173_Q15_UNCONNECTED;
  wire NLW_blk00000175_Q15_UNCONNECTED;
  wire NLW_blk00000177_Q15_UNCONNECTED;
  wire NLW_blk00000179_Q15_UNCONNECTED;
  wire NLW_blk0000017b_Q15_UNCONNECTED;
  wire NLW_blk0000017d_Q15_UNCONNECTED;
  wire NLW_blk0000017f_Q15_UNCONNECTED;
  wire NLW_blk00000181_Q15_UNCONNECTED;
  wire NLW_blk00000183_Q15_UNCONNECTED;
  wire NLW_blk00000185_Q15_UNCONNECTED;
  wire NLW_blk00000187_Q15_UNCONNECTED;
  wire NLW_blk00000189_Q15_UNCONNECTED;
  wire NLW_blk0000018b_Q15_UNCONNECTED;
  wire NLW_blk0000018d_Q15_UNCONNECTED;
  wire NLW_blk0000018f_Q15_UNCONNECTED;
  wire NLW_blk00000191_Q15_UNCONNECTED;
  wire NLW_blk00000193_Q15_UNCONNECTED;
  wire NLW_blk00000195_Q15_UNCONNECTED;
  wire NLW_blk00000197_Q15_UNCONNECTED;
  wire NLW_blk00000199_Q15_UNCONNECTED;
  wire NLW_blk0000019b_Q15_UNCONNECTED;
  wire NLW_blk0000019d_Q15_UNCONNECTED;
  wire NLW_blk0000019f_Q15_UNCONNECTED;
  wire NLW_blk000001a1_Q15_UNCONNECTED;
  wire NLW_blk000001a3_Q15_UNCONNECTED;
  wire NLW_blk000001a5_Q15_UNCONNECTED;
  wire NLW_blk000001a7_Q15_UNCONNECTED;
  wire NLW_blk000001a9_Q15_UNCONNECTED;
  wire NLW_blk000001ab_Q15_UNCONNECTED;
  wire NLW_blk000001ad_Q15_UNCONNECTED;
  wire NLW_blk000001af_Q15_UNCONNECTED;
  wire NLW_blk000001b1_Q15_UNCONNECTED;
  wire NLW_blk000001b3_Q15_UNCONNECTED;
  wire NLW_blk000001b5_Q15_UNCONNECTED;
  wire NLW_blk000001b7_Q15_UNCONNECTED;
  wire NLW_blk000001b9_Q15_UNCONNECTED;
  wire NLW_blk000001bb_Q15_UNCONNECTED;
  wire NLW_blk000001bd_Q15_UNCONNECTED;
  wire NLW_blk000001bf_Q15_UNCONNECTED;
  wire [7 : 0] \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q ;
  wire [7 : 0] \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q ;
  wire [15 : 0] \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 ;
  assign
    sine[15] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [7],
    sine[14] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [6],
    sine[13] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [5],
    sine[12] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [4],
    sine[11] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [3],
    sine[10] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [2],
    sine[9] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [1],
    sine[8] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [0],
    sine[7] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [7],
    sine[6] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [6],
    sine[5] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [5],
    sine[4] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [4],
    sine[3] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [3],
    sine[2] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [2],
    sine[1] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [1],
    sine[0] = \U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [0],
    phase_out[15] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [15],
    phase_out[14] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [14],
    phase_out[13] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [13],
    phase_out[12] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [12],
    phase_out[11] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [11],
    phase_out[10] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [10],
    phase_out[9] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [9],
    phase_out[8] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [8],
    phase_out[7] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [7],
    phase_out[6] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [6],
    phase_out[5] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [5],
    phase_out[4] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [4],
    phase_out[3] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [3],
    phase_out[2] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [2],
    phase_out[1] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [1],
    phase_out[0] = \U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [0];
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .D(sig00000003),
    .Q(sig00000048)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .D(sig00000004),
    .Q(sig00000047)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .D(sig00000005),
    .Q(sig00000046)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .D(sig00000006),
    .Q(sig00000045)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .D(sig00000007),
    .Q(sig00000044)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .D(sig00000008),
    .Q(sig00000043)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .D(sig00000009),
    .Q(sig00000042)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .D(sig0000000a),
    .Q(sig00000041)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .D(sig0000000b),
    .Q(sig00000040)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .D(sig0000000c),
    .Q(sig0000003f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .D(sig0000000d),
    .Q(sig0000003e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .D(sig0000000e),
    .Q(sig0000003d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(clk),
    .D(sig0000000f),
    .Q(sig0000003c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(clk),
    .D(sig00000010),
    .Q(sig0000003b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(clk),
    .D(sig00000011),
    .Q(sig0000003a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(clk),
    .D(sig00000012),
    .Q(sig00000039)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(clk),
    .D(sig00000013),
    .Q(sig00000038)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000014 (
    .C(clk),
    .D(sig00000024),
    .Q(sig00000049)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000015 (
    .C(clk),
    .D(sig00000023),
    .Q(sig00000034)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000016 (
    .C(clk),
    .D(sig00000022),
    .Q(sig00000033)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000017 (
    .C(clk),
    .D(sig00000021),
    .Q(sig00000032)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000018 (
    .C(clk),
    .D(sig00000020),
    .Q(sig00000031)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000019 (
    .C(clk),
    .D(sig0000001f),
    .Q(sig00000030)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001a (
    .C(clk),
    .D(sig0000001e),
    .Q(sig0000002f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001b (
    .C(clk),
    .D(sig0000001d),
    .Q(sig0000002e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001c (
    .C(clk),
    .D(sig0000001c),
    .Q(sig0000002d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001d (
    .C(clk),
    .D(sig0000001b),
    .Q(sig0000002c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001e (
    .C(clk),
    .D(sig0000001a),
    .Q(sig0000002b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000001f (
    .C(clk),
    .D(sig00000019),
    .Q(sig0000002a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(clk),
    .D(sig00000018),
    .Q(sig00000029)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(clk),
    .D(sig00000017),
    .Q(sig00000028)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(clk),
    .D(sig00000016),
    .Q(sig00000027)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(clk),
    .D(sig00000015),
    .Q(sig00000026)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .D(sig00000014),
    .Q(sig00000025)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000009c (
    .C(clk),
    .D(sig00000034),
    .Q(sig00000059)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000009d (
    .C(clk),
    .D(sig00000033),
    .Q(sig00000058)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000009e (
    .C(clk),
    .D(sig00000032),
    .Q(sig00000057)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000009f (
    .C(clk),
    .D(sig00000031),
    .Q(sig00000056)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a0 (
    .C(clk),
    .D(sig00000030),
    .Q(sig00000055)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a1 (
    .C(clk),
    .D(sig0000002f),
    .Q(sig00000054)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a2 (
    .C(clk),
    .D(sig0000002e),
    .Q(sig00000053)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a3 (
    .C(clk),
    .D(sig0000002d),
    .Q(sig00000052)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a4 (
    .C(clk),
    .D(sig0000002c),
    .Q(sig00000051)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a5 (
    .C(clk),
    .D(sig0000002b),
    .Q(sig00000050)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a6 (
    .C(clk),
    .D(sig0000002a),
    .Q(sig0000004f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a7 (
    .C(clk),
    .D(sig00000029),
    .Q(sig0000004e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a8 (
    .C(clk),
    .D(sig00000028),
    .Q(sig0000004d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000a9 (
    .C(clk),
    .D(sig00000027),
    .Q(sig0000004c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000aa (
    .C(clk),
    .D(sig00000026),
    .Q(sig0000004b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ab (
    .C(clk),
    .D(sig00000025),
    .Q(sig0000004a)
  );
  XORCY   blk000000ac (
    .CI(sig0000006d),
    .LI(sig0000008d),
    .O(sig00000085)
  );
  MUXCY   blk000000ad (
    .CI(sig0000006d),
    .DI(sig00000002),
    .S(sig0000008d),
    .O(sig0000006c)
  );
  XORCY   blk000000ae (
    .CI(sig0000006e),
    .LI(sig0000008c),
    .O(sig00000084)
  );
  MUXCY   blk000000af (
    .CI(sig0000006e),
    .DI(sig00000002),
    .S(sig0000008c),
    .O(sig0000006d)
  );
  XORCY   blk000000b0 (
    .CI(sig0000006f),
    .LI(sig0000008b),
    .O(sig00000083)
  );
  MUXCY   blk000000b1 (
    .CI(sig0000006f),
    .DI(sig00000002),
    .S(sig0000008b),
    .O(sig0000006e)
  );
  XORCY   blk000000b2 (
    .CI(sig00000070),
    .LI(sig0000008a),
    .O(sig00000082)
  );
  MUXCY   blk000000b3 (
    .CI(sig00000070),
    .DI(sig00000002),
    .S(sig0000008a),
    .O(sig0000006f)
  );
  XORCY   blk000000b4 (
    .CI(sig00000071),
    .LI(sig00000089),
    .O(sig00000081)
  );
  MUXCY   blk000000b5 (
    .CI(sig00000071),
    .DI(sig00000002),
    .S(sig00000089),
    .O(sig00000070)
  );
  XORCY   blk000000b6 (
    .CI(sig00000072),
    .LI(sig00000088),
    .O(sig00000080)
  );
  MUXCY   blk000000b7 (
    .CI(sig00000072),
    .DI(sig00000002),
    .S(sig00000088),
    .O(sig00000071)
  );
  XORCY   blk000000b8 (
    .CI(sig00000073),
    .LI(sig00000087),
    .O(sig0000007f)
  );
  MUXCY   blk000000b9 (
    .CI(sig00000073),
    .DI(sig00000002),
    .S(sig00000087),
    .O(sig00000072)
  );
  XORCY   blk000000ba (
    .CI(sig00000074),
    .LI(sig00000086),
    .O(sig0000007e)
  );
  MUXCY   blk000000bb (
    .CI(sig00000074),
    .DI(sig00000002),
    .S(sig00000086),
    .O(sig00000073)
  );
  MUXCY   blk000000bc (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000075),
    .O(sig00000074)
  );
  XORCY   blk000000bd (
    .CI(sig00000077),
    .LI(sig000000a4),
    .O(sig0000009d)
  );
  MUXCY   blk000000be (
    .CI(sig00000077),
    .DI(sig00000002),
    .S(sig000000a4),
    .O(sig00000076)
  );
  XORCY   blk000000bf (
    .CI(sig00000078),
    .LI(sig000000a3),
    .O(sig0000009c)
  );
  MUXCY   blk000000c0 (
    .CI(sig00000078),
    .DI(sig00000002),
    .S(sig000000a3),
    .O(sig00000077)
  );
  XORCY   blk000000c1 (
    .CI(sig00000079),
    .LI(sig000000a2),
    .O(sig0000009b)
  );
  MUXCY   blk000000c2 (
    .CI(sig00000079),
    .DI(sig00000002),
    .S(sig000000a2),
    .O(sig00000078)
  );
  XORCY   blk000000c3 (
    .CI(sig0000007a),
    .LI(sig000000a1),
    .O(sig0000009a)
  );
  MUXCY   blk000000c4 (
    .CI(sig0000007a),
    .DI(sig00000002),
    .S(sig000000a1),
    .O(sig00000079)
  );
  XORCY   blk000000c5 (
    .CI(sig0000007b),
    .LI(sig000000a0),
    .O(sig00000099)
  );
  MUXCY   blk000000c6 (
    .CI(sig0000007b),
    .DI(sig00000002),
    .S(sig000000a0),
    .O(sig0000007a)
  );
  XORCY   blk000000c7 (
    .CI(sig0000007c),
    .LI(sig0000009f),
    .O(sig00000098)
  );
  MUXCY   blk000000c8 (
    .CI(sig0000007c),
    .DI(sig00000002),
    .S(sig0000009f),
    .O(sig0000007b)
  );
  XORCY   blk000000c9 (
    .CI(sig0000007d),
    .LI(sig0000009e),
    .O(sig00000097)
  );
  MUXCY   blk000000ca (
    .CI(sig0000007d),
    .DI(sig00000002),
    .S(sig0000009e),
    .O(sig0000007c)
  );
  XORCY   blk000000cb (
    .CI(sig00000002),
    .LI(sig00000137),
    .O(sig00000096)
  );
  MUXCY   blk000000cc (
    .CI(sig00000002),
    .DI(sig000000ac),
    .S(sig00000137),
    .O(sig0000007d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cd (
    .C(clk),
    .D(sig000000c6),
    .Q(sig000000d2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ce (
    .C(clk),
    .D(sig000000c5),
    .Q(sig000000d1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000cf (
    .C(clk),
    .D(sig000000c4),
    .Q(sig000000d0)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d0 (
    .C(clk),
    .D(sig000000c3),
    .Q(sig000000cf)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d1 (
    .C(clk),
    .D(sig000000c2),
    .Q(sig000000ce)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d2 (
    .C(clk),
    .D(sig000000c1),
    .Q(sig000000cd)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d3 (
    .C(clk),
    .D(sig000000c0),
    .Q(sig000000cc)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d4 (
    .C(clk),
    .D(sig000000bf),
    .Q(sig000000cb)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d5 (
    .C(clk),
    .D(sig000000be),
    .Q(sig000000ca)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d6 (
    .C(clk),
    .D(sig000000bd),
    .Q(sig000000c9)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d7 (
    .C(clk),
    .D(sig000000bc),
    .Q(sig000000c8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d8 (
    .C(clk),
    .D(sig000000bb),
    .Q(sig000000c7)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000d9 (
    .C(clk),
    .D(sig00000134),
    .Q(sig000000ac)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000da (
    .C(clk),
    .D(sig00000034),
    .Q(sig00000136)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000db (
    .C(clk),
    .D(sig00000033),
    .Q(sig00000135)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000dc (
    .C(clk),
    .D(sig00000108),
    .Q(sig000000f8)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000dd (
    .C(clk),
    .D(sig00000107),
    .Q(sig000000f7)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000de (
    .C(clk),
    .D(sig00000106),
    .Q(sig000000f6)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000df (
    .C(clk),
    .D(sig00000105),
    .Q(sig000000f5)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e0 (
    .C(clk),
    .D(sig00000104),
    .Q(sig000000f4)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e1 (
    .C(clk),
    .D(sig00000103),
    .Q(sig000000f3)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e2 (
    .C(clk),
    .D(sig00000102),
    .Q(sig000000f2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e3 (
    .C(clk),
    .D(sig00000101),
    .Q(sig000000f1)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e4 (
    .C(clk),
    .D(sig000000b3),
    .Q(sig00000100)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e5 (
    .C(clk),
    .D(sig000000b2),
    .Q(sig000000ff)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e6 (
    .C(clk),
    .D(sig000000b1),
    .Q(sig000000fe)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e7 (
    .C(clk),
    .D(sig000000b0),
    .Q(sig000000fd)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e8 (
    .C(clk),
    .D(sig000000af),
    .Q(sig000000fc)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000e9 (
    .C(clk),
    .D(sig000000ae),
    .Q(sig000000fb)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ea (
    .C(clk),
    .D(sig000000ad),
    .Q(sig000000fa)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000eb (
    .C(clk),
    .D(sig00000063),
    .Q(sig000000f9)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ec (
    .C(clk),
    .D(sig00000112),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ed (
    .C(clk),
    .D(sig00000111),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ee (
    .C(clk),
    .D(sig00000110),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ef (
    .C(clk),
    .D(sig0000010f),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f0 (
    .C(clk),
    .D(sig0000010e),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f1 (
    .C(clk),
    .D(sig0000010d),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f2 (
    .C(clk),
    .D(sig0000010c),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f3 (
    .C(clk),
    .D(sig0000010b),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f4 (
    .C(clk),
    .D(sig000000ba),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f5 (
    .C(clk),
    .D(sig000000b9),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f6 (
    .C(clk),
    .D(sig000000b8),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f7 (
    .C(clk),
    .D(sig000000b7),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f8 (
    .C(clk),
    .D(sig000000b6),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000f9 (
    .C(clk),
    .D(sig000000b5),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000fa (
    .C(clk),
    .D(sig000000b4),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000fb (
    .C(clk),
    .D(sig0000006b),
    .Q(\U0/i_synth/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000fc (
    .C(clk),
    .D(sig00000095),
    .Q(sig0000005c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000fd (
    .C(clk),
    .D(sig00000094),
    .Q(sig0000005d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000fe (
    .C(clk),
    .D(sig00000093),
    .Q(sig0000005e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000ff (
    .C(clk),
    .D(sig00000092),
    .Q(sig0000005f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000100 (
    .C(clk),
    .D(sig00000091),
    .Q(sig00000060)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000101 (
    .C(clk),
    .D(sig00000090),
    .Q(sig00000061)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000102 (
    .C(clk),
    .D(sig0000008f),
    .Q(sig00000062)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000103 (
    .C(clk),
    .D(sig0000008e),
    .Q(sig0000010a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000104 (
    .C(clk),
    .D(sig000000ac),
    .Q(sig00000064)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000105 (
    .C(clk),
    .D(sig000000ab),
    .Q(sig00000065)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000106 (
    .C(clk),
    .D(sig000000aa),
    .Q(sig00000066)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000107 (
    .C(clk),
    .D(sig000000a9),
    .Q(sig00000067)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000108 (
    .C(clk),
    .D(sig000000a8),
    .Q(sig00000068)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000109 (
    .C(clk),
    .D(sig000000a7),
    .Q(sig00000069)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010a (
    .C(clk),
    .D(sig000000a6),
    .Q(sig0000006a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010b (
    .C(clk),
    .D(sig000000a5),
    .Q(sig00000114)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010c (
    .C(clk),
    .D(sig0000006c),
    .Q(sig00000109)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010d (
    .C(clk),
    .D(sig00000085),
    .Q(sig00000108)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010e (
    .C(clk),
    .D(sig00000084),
    .Q(sig00000107)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000010f (
    .C(clk),
    .D(sig00000083),
    .Q(sig00000106)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000110 (
    .C(clk),
    .D(sig00000082),
    .Q(sig00000105)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000111 (
    .C(clk),
    .D(sig00000081),
    .Q(sig00000104)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000112 (
    .C(clk),
    .D(sig00000080),
    .Q(sig00000103)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000113 (
    .C(clk),
    .D(sig0000007f),
    .Q(sig00000102)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000114 (
    .C(clk),
    .D(sig0000007e),
    .Q(sig00000101)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000115 (
    .C(clk),
    .D(sig00000076),
    .Q(sig00000113)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000116 (
    .C(clk),
    .D(sig0000009d),
    .Q(sig00000112)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000117 (
    .C(clk),
    .D(sig0000009c),
    .Q(sig00000111)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000118 (
    .C(clk),
    .D(sig0000009b),
    .Q(sig00000110)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000119 (
    .C(clk),
    .D(sig0000009a),
    .Q(sig0000010f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011a (
    .C(clk),
    .D(sig00000099),
    .Q(sig0000010e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011b (
    .C(clk),
    .D(sig00000098),
    .Q(sig0000010d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011c (
    .C(clk),
    .D(sig00000097),
    .Q(sig0000010c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011d (
    .C(clk),
    .D(sig00000096),
    .Q(sig0000010b)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000011e (
    .I0(sig00000066),
    .I1(sig0000005a),
    .O(sig000000b8)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000011f (
    .I0(sig0000005e),
    .I1(sig0000005b),
    .O(sig000000b1)
  );
  LUT3 #(
    .INIT ( 8'hA6 ))
  blk00000120 (
    .I0(sig00000065),
    .I1(sig00000066),
    .I2(sig0000005a),
    .O(sig000000b9)
  );
  LUT3 #(
    .INIT ( 8'hA6 ))
  blk00000121 (
    .I0(sig0000005d),
    .I1(sig0000005e),
    .I2(sig0000005b),
    .O(sig000000b2)
  );
  LUT4 #(
    .INIT ( 16'hAA6A ))
  blk00000122 (
    .I0(sig00000064),
    .I1(sig00000065),
    .I2(sig00000066),
    .I3(sig0000005a),
    .O(sig000000ba)
  );
  LUT4 #(
    .INIT ( 16'hAA6A ))
  blk00000123 (
    .I0(sig0000005c),
    .I1(sig0000005d),
    .I2(sig0000005e),
    .I3(sig0000005b),
    .O(sig000000b3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000124 (
    .I0(sig00000125),
    .I1(sig00000138),
    .O(sig0000009e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000125 (
    .I0(sig00000126),
    .I1(sig00000138),
    .O(sig0000009f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000126 (
    .I0(sig00000127),
    .I1(sig00000138),
    .O(sig000000a0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000127 (
    .I0(sig00000128),
    .I1(sig00000138),
    .O(sig000000a1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000128 (
    .I0(sig00000129),
    .I1(sig00000138),
    .O(sig000000a2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000129 (
    .I0(sig0000012a),
    .I1(sig000000ac),
    .O(sig000000a3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012a (
    .I0(sig0000012b),
    .I1(sig000000ac),
    .O(sig000000a4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012b (
    .I0(sig0000012c),
    .I1(sig000000ac),
    .O(sig000000a5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012c (
    .I0(sig0000012d),
    .I1(sig000000ac),
    .O(sig000000a6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012d (
    .I0(sig0000012e),
    .I1(sig000000ac),
    .O(sig000000a7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012e (
    .I0(sig0000012f),
    .I1(sig000000ac),
    .O(sig000000a8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012f (
    .I0(sig00000130),
    .I1(sig000000ac),
    .O(sig000000a9)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000130 (
    .I0(sig00000131),
    .I1(sig000000ac),
    .O(sig000000aa)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000131 (
    .I0(sig00000132),
    .I1(sig000000ac),
    .O(sig000000ab)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000132 (
    .I0(sig00000027),
    .I1(sig00000033),
    .O(sig000000bb)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000133 (
    .I0(sig00000031),
    .I1(sig00000033),
    .O(sig000000c5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000134 (
    .I0(sig00000032),
    .I1(sig00000033),
    .O(sig000000c6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000135 (
    .I0(sig00000028),
    .I1(sig00000033),
    .O(sig000000bc)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000136 (
    .I0(sig00000029),
    .I1(sig00000033),
    .O(sig000000bd)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000137 (
    .I0(sig0000002a),
    .I1(sig00000033),
    .O(sig000000be)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000138 (
    .I0(sig0000002b),
    .I1(sig00000033),
    .O(sig000000bf)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000139 (
    .I0(sig0000002c),
    .I1(sig00000033),
    .O(sig000000c0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013a (
    .I0(sig0000002d),
    .I1(sig00000033),
    .O(sig000000c1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013b (
    .I0(sig0000002e),
    .I1(sig00000033),
    .O(sig000000c2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013c (
    .I0(sig0000002f),
    .I1(sig00000033),
    .O(sig000000c3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013d (
    .I0(sig00000030),
    .I1(sig00000033),
    .O(sig000000c4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013e (
    .I0(sig00000133),
    .I1(sig000000ac),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013f (
    .I0(sig0000010a),
    .I1(sig00000109),
    .O(sig00000063)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000140 (
    .I0(sig00000114),
    .I1(sig00000113),
    .O(sig0000006b)
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  blk00000141 (
    .I0(sig00000067),
    .I1(sig00000068),
    .I2(sig00000069),
    .I3(sig0000006a),
    .I4(sig00000113),
    .I5(sig00000114),
    .O(sig0000005a)
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  blk00000142 (
    .I0(sig0000005f),
    .I1(sig00000060),
    .I2(sig00000061),
    .I3(sig00000062),
    .I4(sig00000109),
    .I5(sig0000010a),
    .O(sig0000005b)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000143 (
    .I0(sig00000138),
    .I1(sig00000133),
    .O(sig00000075)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000144 (
    .I0(sig00000115),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig00000086)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000145 (
    .I0(sig00000116),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig00000087)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000146 (
    .I0(sig00000117),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig00000088)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000147 (
    .I0(sig00000118),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig00000089)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000148 (
    .I0(sig00000119),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig0000008a)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000149 (
    .I0(sig0000011a),
    .I1(sig00000138),
    .I2(sig00000133),
    .O(sig0000008b)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000014a (
    .I0(sig0000011b),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig0000008c)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000014b (
    .I0(sig0000011c),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig0000008d)
  );
  LUT5 #(
    .INIT ( 32'h6AAAAAAA ))
  blk0000014c (
    .I0(sig00000068),
    .I1(sig00000114),
    .I2(sig00000113),
    .I3(sig0000006a),
    .I4(sig00000069),
    .O(sig000000b6)
  );
  LUT6 #(
    .INIT ( 64'h6AAAAAAAAAAAAAAA ))
  blk0000014d (
    .I0(sig00000067),
    .I1(sig00000114),
    .I2(sig00000113),
    .I3(sig0000006a),
    .I4(sig00000069),
    .I5(sig00000068),
    .O(sig000000b7)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  blk0000014e (
    .I0(sig00000069),
    .I1(sig00000114),
    .I2(sig00000113),
    .I3(sig0000006a),
    .O(sig000000b5)
  );
  LUT5 #(
    .INIT ( 32'h6AAAAAAA ))
  blk0000014f (
    .I0(sig00000060),
    .I1(sig0000010a),
    .I2(sig00000109),
    .I3(sig00000062),
    .I4(sig00000061),
    .O(sig000000af)
  );
  LUT6 #(
    .INIT ( 64'h6AAAAAAAAAAAAAAA ))
  blk00000150 (
    .I0(sig0000005f),
    .I1(sig0000010a),
    .I2(sig00000109),
    .I3(sig00000062),
    .I4(sig00000061),
    .I5(sig00000060),
    .O(sig000000b0)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  blk00000151 (
    .I0(sig00000061),
    .I1(sig0000010a),
    .I2(sig00000109),
    .I3(sig00000062),
    .O(sig000000ae)
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  blk00000152 (
    .I0(sig00000062),
    .I1(sig0000010a),
    .I2(sig00000109),
    .O(sig000000ad)
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  blk00000153 (
    .I0(sig0000006a),
    .I1(sig00000114),
    .I2(sig00000113),
    .O(sig000000b4)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000154 (
    .I0(sig0000011d),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig0000008e)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000155 (
    .I0(sig0000011e),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig0000008f)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000156 (
    .I0(sig0000011f),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig00000090)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000157 (
    .I0(sig00000120),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig00000091)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000158 (
    .I0(sig00000121),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig00000092)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000159 (
    .I0(sig00000122),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig00000093)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000015a (
    .I0(sig00000123),
    .I1(sig00000133),
    .I2(sig000000ac),
    .O(sig00000094)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000015b (
    .I0(sig00000124),
    .O(sig00000137)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000015c (
    .C(clk),
    .D(sig00000134),
    .Q(sig00000138)
  );
  RAMB16BWER #(
    .INIT_00 ( 256'h3332222222222222222222211111111111111111111100000000000000000000 ),
    .INIT_01 ( 256'h6666665555555555555555555544444444444444444444433333333333333333 ),
    .INIT_02 ( 256'h9999999998888888888888888888877777777777777777777666666666666666 ),
    .INIT_03 ( 256'hCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999999999999 ),
    .INIT_04 ( 256'hFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDCCCCCCCCC ),
    .INIT_05 ( 256'h222222222222222211111111111111111111100000000000000000000FFFFFFF ),
    .INIT_06 ( 256'h5555555555555555554444444444444444444443333333333333333333332222 ),
    .INIT_07 ( 256'h8888888888888888888877777777777777777777766666666666666666666655 ),
    .INIT_08 ( 256'hCBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAA999999999999999999998 ),
    .INIT_09 ( 256'hFFEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCC ),
    .INIT_0A ( 256'h222111111111111111111111000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'h5554444444444444444444444333333333333333333333222222222222222222 ),
    .INIT_0C ( 256'h8887777777777777777777777666666666666666666666555555555555555555 ),
    .INIT_0D ( 256'hBBBAAAAAAAAAAAAAAAAAAAAA9999999999999999999999888888888888888888 ),
    .INIT_0E ( 256'hEDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBB ),
    .INIT_0F ( 256'h0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEE ),
    .INIT_10 ( 256'h3333333333333333333222222222222222222222221111111111111111111111 ),
    .INIT_11 ( 256'h6666666666666666555555555555555555555554444444444444444444444333 ),
    .INIT_12 ( 256'h9999999999998888888888888888888888877777777777777777777777666666 ),
    .INIT_13 ( 256'hCCCCCCCCBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAA9999999999 ),
    .INIT_14 ( 256'hFFEEEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCC ),
    .INIT_15 ( 256'h1111111111111111111000000000000000000000000FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'h4444444444433333333333333333333333322222222222222222222222211111 ),
    .INIT_17 ( 256'h7776666666666666666666666665555555555555555555555554444444444444 ),
    .INIT_18 ( 256'h9999999999999999988888888888888888888888887777777777777777777777 ),
    .INIT_19 ( 256'hCCCCCCBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAA9999999 ),
    .INIT_1A ( 256'hEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCC ),
    .INIT_1B ( 256'h1111100000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEE ),
    .INIT_1C ( 256'h3333333333333333222222222222222222222222222111111111111111111111 ),
    .INIT_1D ( 256'h5555555555555555555555555544444444444444444444444444433333333333 ),
    .INIT_1E ( 256'h8888888777777777777777777777777777766666666666666666666666666665 ),
    .INIT_1F ( 256'hAAAAAAAAAAAAAAA9999999999999999999999999999888888888888888888888 ),
    .INIT_20 ( 256'hCCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAA ),
    .INIT_21 ( 256'hEEEEEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCC ),
    .INIT_22 ( 256'h0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEE ),
    .INIT_23 ( 256'h2222222222222222222222222222221111111111111111111111111111111000 ),
    .INIT_24 ( 256'h4444444444444444444444444444443333333333333333333333333333333322 ),
    .INIT_25 ( 256'h6666666666666666666666666665555555555555555555555555555555555444 ),
    .INIT_26 ( 256'h8888888888888888888888877777777777777777777777777777777776666666 ),
    .INIT_27 ( 256'hAAAAAAAAAAAAAAA9999999999999999999999999999999999998888888888888 ),
    .INIT_28 ( 256'hCCCCCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAA ),
    .INIT_29 ( 256'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDDDDDDDDD ),
    .INIT_2B ( 256'h00000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'h2222222222222221111111111111111111111111111111111111111111100000 ),
    .INIT_2D ( 256'h3333333333333333333333333333333332222222222222222222222222222222 ),
    .INIT_2E ( 256'h5444444444444444444444444444444444444444444444444433333333333333 ),
    .INIT_2F ( 256'h6666666666666555555555555555555555555555555555555555555555555555 ),
    .INIT_30 ( 256'h7777777777777777777777766666666666666666666666666666666666666666 ),
    .INIT_31 ( 256'h8888888888888888888888888888887777777777777777777777777777777777 ),
    .INIT_32 ( 256'h9999999999999999999999999999999999888888888888888888888888888888 ),
    .INIT_33 ( 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9999999999999999999999999999999 ),
    .INIT_34 ( 256'hBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ),
    .INIT_35 ( 256'hCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB ),
    .INIT_36 ( 256'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC ),
    .INIT_37 ( 256'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCC ),
    .INIT_38 ( 256'hEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD ),
    .INIT_39 ( 256'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE ),
    .INIT_3A ( 256'hFFFFFEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .INIT_FILE ( "NONE" ))
  blk0000015d (
    .REGCEA(sig00000002),
    .CLKA(clk),
    .ENB(sig00000001),
    .RSTB(sig00000002),
    .CLKB(clk),
    .REGCEB(sig00000002),
    .RSTA(sig00000002),
    .ENA(sig00000001),
    .DIPA({\NLW_blk0000015d_DIPA<3>_UNCONNECTED , \NLW_blk0000015d_DIPA<2>_UNCONNECTED , \NLW_blk0000015d_DIPA<1>_UNCONNECTED ,
\NLW_blk0000015d_DIPA<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DOA({\NLW_blk0000015d_DOA<31>_UNCONNECTED , \NLW_blk0000015d_DOA<30>_UNCONNECTED , \NLW_blk0000015d_DOA<29>_UNCONNECTED ,
\NLW_blk0000015d_DOA<28>_UNCONNECTED , \NLW_blk0000015d_DOA<27>_UNCONNECTED , \NLW_blk0000015d_DOA<26>_UNCONNECTED ,
\NLW_blk0000015d_DOA<25>_UNCONNECTED , \NLW_blk0000015d_DOA<24>_UNCONNECTED , \NLW_blk0000015d_DOA<23>_UNCONNECTED ,
\NLW_blk0000015d_DOA<22>_UNCONNECTED , \NLW_blk0000015d_DOA<21>_UNCONNECTED , \NLW_blk0000015d_DOA<20>_UNCONNECTED ,
\NLW_blk0000015d_DOA<19>_UNCONNECTED , \NLW_blk0000015d_DOA<18>_UNCONNECTED , \NLW_blk0000015d_DOA<17>_UNCONNECTED ,
\NLW_blk0000015d_DOA<16>_UNCONNECTED , \NLW_blk0000015d_DOA<15>_UNCONNECTED , \NLW_blk0000015d_DOA<14>_UNCONNECTED ,
\NLW_blk0000015d_DOA<13>_UNCONNECTED , \NLW_blk0000015d_DOA<12>_UNCONNECTED , \NLW_blk0000015d_DOA<11>_UNCONNECTED ,
\NLW_blk0000015d_DOA<10>_UNCONNECTED , \NLW_blk0000015d_DOA<9>_UNCONNECTED , \NLW_blk0000015d_DOA<8>_UNCONNECTED ,
\NLW_blk0000015d_DOA<7>_UNCONNECTED , \NLW_blk0000015d_DOA<6>_UNCONNECTED , \NLW_blk0000015d_DOA<5>_UNCONNECTED , \NLW_blk0000015d_DOA<4>_UNCONNECTED
, sig000000ed, sig000000ec, sig000000eb, sig000000ea}),
    .ADDRA({sig000000d2, sig000000d1, sig000000d0, sig000000cf, sig000000ce, sig000000cd, sig000000cc, sig000000cb, sig000000ca, sig000000c9,
sig000000c8, sig000000c7, \NLW_blk0000015d_ADDRA<1>_UNCONNECTED , \NLW_blk0000015d_ADDRA<0>_UNCONNECTED }),
    .ADDRB({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002,
sig00000002, sig00000002, \NLW_blk0000015d_ADDRB<1>_UNCONNECTED , \NLW_blk0000015d_ADDRB<0>_UNCONNECTED }),
    .DIB({\NLW_blk0000015d_DIB<31>_UNCONNECTED , \NLW_blk0000015d_DIB<30>_UNCONNECTED , \NLW_blk0000015d_DIB<29>_UNCONNECTED ,
\NLW_blk0000015d_DIB<28>_UNCONNECTED , \NLW_blk0000015d_DIB<27>_UNCONNECTED , \NLW_blk0000015d_DIB<26>_UNCONNECTED ,
\NLW_blk0000015d_DIB<25>_UNCONNECTED , \NLW_blk0000015d_DIB<24>_UNCONNECTED , \NLW_blk0000015d_DIB<23>_UNCONNECTED ,
\NLW_blk0000015d_DIB<22>_UNCONNECTED , \NLW_blk0000015d_DIB<21>_UNCONNECTED , \NLW_blk0000015d_DIB<20>_UNCONNECTED ,
\NLW_blk0000015d_DIB<19>_UNCONNECTED , \NLW_blk0000015d_DIB<18>_UNCONNECTED , \NLW_blk0000015d_DIB<17>_UNCONNECTED ,
\NLW_blk0000015d_DIB<16>_UNCONNECTED , \NLW_blk0000015d_DIB<15>_UNCONNECTED , \NLW_blk0000015d_DIB<14>_UNCONNECTED ,
\NLW_blk0000015d_DIB<13>_UNCONNECTED , \NLW_blk0000015d_DIB<12>_UNCONNECTED , \NLW_blk0000015d_DIB<11>_UNCONNECTED ,
\NLW_blk0000015d_DIB<10>_UNCONNECTED , \NLW_blk0000015d_DIB<9>_UNCONNECTED , \NLW_blk0000015d_DIB<8>_UNCONNECTED ,
\NLW_blk0000015d_DIB<7>_UNCONNECTED , \NLW_blk0000015d_DIB<6>_UNCONNECTED , \NLW_blk0000015d_DIB<5>_UNCONNECTED , \NLW_blk0000015d_DIB<4>_UNCONNECTED
, \NLW_blk0000015d_DIB<3>_UNCONNECTED , \NLW_blk0000015d_DIB<2>_UNCONNECTED , \NLW_blk0000015d_DIB<1>_UNCONNECTED ,
\NLW_blk0000015d_DIB<0>_UNCONNECTED }),
    .DOPA({\NLW_blk0000015d_DOPA<3>_UNCONNECTED , \NLW_blk0000015d_DOPA<2>_UNCONNECTED , \NLW_blk0000015d_DOPA<1>_UNCONNECTED ,
\NLW_blk0000015d_DOPA<0>_UNCONNECTED }),
    .DIPB({\NLW_blk0000015d_DIPB<3>_UNCONNECTED , \NLW_blk0000015d_DIPB<2>_UNCONNECTED , \NLW_blk0000015d_DIPB<1>_UNCONNECTED ,
\NLW_blk0000015d_DIPB<0>_UNCONNECTED }),
    .DOPB({\NLW_blk0000015d_DOPB<3>_UNCONNECTED , \NLW_blk0000015d_DOPB<2>_UNCONNECTED , \NLW_blk0000015d_DOPB<1>_UNCONNECTED ,
\NLW_blk0000015d_DOPB<0>_UNCONNECTED }),
    .DOB({\NLW_blk0000015d_DOB<31>_UNCONNECTED , \NLW_blk0000015d_DOB<30>_UNCONNECTED , \NLW_blk0000015d_DOB<29>_UNCONNECTED ,
\NLW_blk0000015d_DOB<28>_UNCONNECTED , \NLW_blk0000015d_DOB<27>_UNCONNECTED , \NLW_blk0000015d_DOB<26>_UNCONNECTED ,
\NLW_blk0000015d_DOB<25>_UNCONNECTED , \NLW_blk0000015d_DOB<24>_UNCONNECTED , \NLW_blk0000015d_DOB<23>_UNCONNECTED ,
\NLW_blk0000015d_DOB<22>_UNCONNECTED , \NLW_blk0000015d_DOB<21>_UNCONNECTED , \NLW_blk0000015d_DOB<20>_UNCONNECTED ,
\NLW_blk0000015d_DOB<19>_UNCONNECTED , \NLW_blk0000015d_DOB<18>_UNCONNECTED , \NLW_blk0000015d_DOB<17>_UNCONNECTED ,
\NLW_blk0000015d_DOB<16>_UNCONNECTED , \NLW_blk0000015d_DOB<15>_UNCONNECTED , \NLW_blk0000015d_DOB<14>_UNCONNECTED ,
\NLW_blk0000015d_DOB<13>_UNCONNECTED , \NLW_blk0000015d_DOB<12>_UNCONNECTED , \NLW_blk0000015d_DOB<11>_UNCONNECTED ,
\NLW_blk0000015d_DOB<10>_UNCONNECTED , \NLW_blk0000015d_DOB<9>_UNCONNECTED , \NLW_blk0000015d_DOB<8>_UNCONNECTED ,
\NLW_blk0000015d_DOB<7>_UNCONNECTED , \NLW_blk0000015d_DOB<6>_UNCONNECTED , \NLW_blk0000015d_DOB<5>_UNCONNECTED , \NLW_blk0000015d_DOB<4>_UNCONNECTED
, sig000000de, sig000000dd, sig000000dc, sig000000db}),
    .WEB({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIA({\NLW_blk0000015d_DIA<31>_UNCONNECTED , \NLW_blk0000015d_DIA<30>_UNCONNECTED , \NLW_blk0000015d_DIA<29>_UNCONNECTED ,
\NLW_blk0000015d_DIA<28>_UNCONNECTED , \NLW_blk0000015d_DIA<27>_UNCONNECTED , \NLW_blk0000015d_DIA<26>_UNCONNECTED ,
\NLW_blk0000015d_DIA<25>_UNCONNECTED , \NLW_blk0000015d_DIA<24>_UNCONNECTED , \NLW_blk0000015d_DIA<23>_UNCONNECTED ,
\NLW_blk0000015d_DIA<22>_UNCONNECTED , \NLW_blk0000015d_DIA<21>_UNCONNECTED , \NLW_blk0000015d_DIA<20>_UNCONNECTED ,
\NLW_blk0000015d_DIA<19>_UNCONNECTED , \NLW_blk0000015d_DIA<18>_UNCONNECTED , \NLW_blk0000015d_DIA<17>_UNCONNECTED ,
\NLW_blk0000015d_DIA<16>_UNCONNECTED , \NLW_blk0000015d_DIA<15>_UNCONNECTED , \NLW_blk0000015d_DIA<14>_UNCONNECTED ,
\NLW_blk0000015d_DIA<13>_UNCONNECTED , \NLW_blk0000015d_DIA<12>_UNCONNECTED , \NLW_blk0000015d_DIA<11>_UNCONNECTED ,
\NLW_blk0000015d_DIA<10>_UNCONNECTED , \NLW_blk0000015d_DIA<9>_UNCONNECTED , \NLW_blk0000015d_DIA<8>_UNCONNECTED ,
\NLW_blk0000015d_DIA<7>_UNCONNECTED , \NLW_blk0000015d_DIA<6>_UNCONNECTED , \NLW_blk0000015d_DIA<5>_UNCONNECTED , \NLW_blk0000015d_DIA<4>_UNCONNECTED
, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  RAMB16BWER #(
    .INIT_00 ( 256'h110FEDDCBAA987665432210FFEDCBBA9877654432100FEDCCBA9987655432110 ),
    .INIT_01 ( 256'h432100FEDDCBA9987665432210FEEDCBBA9877654332100FEDCCBA9887655432 ),
    .INIT_02 ( 256'h654332100FEDCCBA9887655432110FEEDCBAA987665433210FFEDCBBA9887654 ),
    .INIT_03 ( 256'h87665432210FEEDCBBA9877654432100FEDCCBA9987655432210FEEDCBAA9877 ),
    .INIT_04 ( 256'hA9877654432100FEDDCBA9987665432210FFEDCBBA9877654432100FEDDCBA99 ),
    .INIT_05 ( 256'hCBA9987655432210FEEDCBBA9877654432100FEDDCBA9987665432210FEEDCBB ),
    .INIT_06 ( 256'hDCCBA9987665432210FFEDCBBA9887654432110FEDDCBAA9877654332100FEDC ),
    .INIT_07 ( 256'hFEDCCBA9987655432210FEEDCBBA9887654432110FEDDCBAA9877654332100FE ),
    .INIT_08 ( 256'h0FEEDCBAA9877654432110FEDDCBAA9877654332100FEDDCBA9987665433210F ),
    .INIT_09 ( 256'h10FEEDCBBA9887655432110FEEDCBBA9887655432110FEEDCBBA987765443211 ),
    .INIT_0A ( 256'h110FEEDCBBA9887654432110FEEDCBBA9887655432110FEEDCBBA98876554322 ),
    .INIT_0B ( 256'h210FFEDCCBA99876654332100FEDDCBAA9877654332100FEDDCBAA9877654432 ),
    .INIT_0C ( 256'h210FFEDCCBA99876654332100FEDDCBAA9877654432110FEEDCBBA9887655432 ),
    .INIT_0D ( 256'h100FEDDCBAA9877654432210FFEDCCBA99876654332100FEDDCBAA9887655432 ),
    .INIT_0E ( 256'h0FFEDDCBAA9877654432210FFEDCCBA99876654432110FEEDCBBA98876654332 ),
    .INIT_0F ( 256'hFEDDCBBA98876554332100FEDDCBAA98876554322100FEDDCBAA988765543221 ),
    .INIT_10 ( 256'hDCCBA99877654432210FFEDDCBAA98776554322100FEDDCBAA98876554322100 ),
    .INIT_11 ( 256'hBA99876654432210FFEDDCBAA98876554332100FEEDCBBA99876654432110FEE ),
    .INIT_12 ( 256'h877654432210FFEDDCBBA98876654432110FFEDCCBAA98876554332100FEEDCB ),
    .INIT_13 ( 256'h54322100FEEDCCBA998776554322100FEEDCCBA998776554322100FEEDCBBA99 ),
    .INIT_14 ( 256'h10FFEDCCBAA98876654432210FFEDDCBBA998776544322100FEEDCBBA9987765 ),
    .INIT_15 ( 256'hCBBA998776554332110FFEDCCBAA988766544322100FEEDCBBA9987765543321 ),
    .INIT_16 ( 256'h76554332110FFEEDCCBAA98876654332110FFEDDCBBA998776554332110FFEDD ),
    .INIT_17 ( 256'h100FEEDCCBAA988766554332110FFEDDCBBA998776554332110FFEDDCBBA9987 ),
    .INIT_18 ( 256'hAA988776554332110FFEEDCCBAA988766544332110FFEDDCBBA9987766544322 ),
    .INIT_19 ( 256'h332110FFEDDCCBAA988766554332110FFEEDCCBAA9887765543321100FEEDCCB ),
    .INIT_1A ( 256'hBBA9987766544322110FFEDDCCBAA9887765543322100FEEDDCBBA9988766544 ),
    .INIT_1B ( 256'h22110FFEEDCCBAA9987766544332110FFEEDCCBBA9987766544332110FFEEDCC ),
    .INIT_1C ( 256'h9887665543322110FFEEDCCBBA99887665543322100FEEDDCBBAA98877655443 ),
    .INIT_1D ( 256'hFEDDCCBAA99887665543322100FFEEDCCBBA99887665544322110FFEEDCCBBA9 ),
    .INIT_1E ( 256'h3322100FFEEDCCBBAA98877665443322100FFEEDCCBBAA98877655443321100F ),
    .INIT_1F ( 256'h776655433221100FEEDDCCBAA998877655443321100FFEEDCCBBAA9887766544 ),
    .INIT_20 ( 256'hAA9988776654433221100FEEDDCCBBAA988776655433221100FFEDDCCBBAA988 ),
    .INIT_21 ( 256'hDCCBBA9988776655443322100FFEEDDCCBBAA988776655443321100FFEEDDCCB ),
    .INIT_22 ( 256'hEDDCCBBAA9988776655443322110FFEEDDCCBBAA9988776655433221100FFEED ),
    .INIT_23 ( 256'hEEDDCCBBAA99887766554433221100FFEEDDCCBBAA9988776655443322110FFE ),
    .INIT_24 ( 256'hEDDCCBBAA998877665544433221100FFEEDDCCBBAA99887766554433221100FF ),
    .INIT_25 ( 256'hCCBBAA998877766554433221100FFEEEDDCCBBAA998877665544433221100FFE ),
    .INIT_26 ( 256'hA9988776665544332211100FFEEDDCCBBBAA998877665554433221100FFFEEDD ),
    .INIT_27 ( 256'h665544333221100FFFEEDDCCCBBAA9988877665544433221100FFFEEDDCCBBBA ),
    .INIT_28 ( 256'h11100FFFEEDDCCCBBAA999887766655443332211000FFEEDDDCCBBAAA9988776 ),
    .INIT_29 ( 256'hCBBBAA9998877766555443322211000FFEEEDDCCBBBAA9998877766554443322 ),
    .INIT_2A ( 256'h554443322211100FFFEEDDDCCBBBAA9998877766555443332211100FFFEEDDDC ),
    .INIT_2B ( 256'hDDDCCCBBAAA999887776665544433322111000FFEEEDDCCCBBBAA99988777666 ),
    .INIT_2C ( 256'h544433222111000FFFEEDDDCCCBBBAA9998887776655544433322111000FFFEE ),
    .INIT_2D ( 256'hBAAA99988877766655544433222111000FFFEEEDDDCCCBBBAA99988877766655 ),
    .INIT_2E ( 256'h0FFFEEEDDDCCCBBBAAA9998888777666555444333222111000FFFEEEDDDCCCBB ),
    .INIT_2F ( 256'h3332222111000FFFFEEEDDDCCCBBBBAAA9998887776666555444333222111100 ),
    .INIT_30 ( 256'h66555544433332221111000FFFFEEEDDDDCCCBBBBAAA99988887776665555444 ),
    .INIT_31 ( 256'h877776665555444433322221111000FFFFEEEEDDDCCCCBBBBAAA999988877776 ),
    .INIT_32 ( 256'h8877776666555544443333222211110000FFFFEEEEDDDDCCCCBBBAAAA9999888 ),
    .INIT_33 ( 256'h777666665555444433332222211110000FFFFEEEEEDDDDCCCCBBBBAAAA999988 ),
    .INIT_34 ( 256'h555444443333322222111100000FFFFEEEEEDDDDDCCCCBBBBBAAAA9999888887 ),
    .INIT_35 ( 256'h2221111100000FFFFFEEEEEDDDDDCCCCCBBBBBAAAAA999998888877777666665 ),
    .INIT_36 ( 256'hEDDDDDDCCCCCBBBBBBAAAAAA9999988888877777666666555554444433333322 ),
    .INIT_37 ( 256'h88887777776666665555555444444333333222222111111000000FFFFFFEEEEE ),
    .INIT_38 ( 256'h1111110000000FFFFFFFEEEEEEEDDDDDDDCCCCCCCBBBBBBBAAAAAA9999999888 ),
    .INIT_39 ( 256'h9999998888888887777777766666666555555554444444433333333222222211 ),
    .INIT_3A ( 256'h00000FFFFFFFFFFEEEEEEEEEEDDDDDDDDDDCCCCCCCCCBBBBBBBBBAAAAAAAAA99 ),
    .INIT_3B ( 256'h6555555555555444444444444333333333333222222222221111111111100000 ),
    .INIT_3C ( 256'hAAAAAA9999999999999999888888888888888777777777777776666666666666 ),
    .INIT_3D ( 256'hDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAA ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDD ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .INIT_FILE ( "NONE" ))
  blk0000015e (
    .REGCEA(sig00000002),
    .CLKA(clk),
    .ENB(sig00000001),
    .RSTB(sig00000002),
    .CLKB(clk),
    .REGCEB(sig00000002),
    .RSTA(sig00000002),
    .ENA(sig00000001),
    .DIPA({\NLW_blk0000015e_DIPA<3>_UNCONNECTED , \NLW_blk0000015e_DIPA<2>_UNCONNECTED , \NLW_blk0000015e_DIPA<1>_UNCONNECTED ,
\NLW_blk0000015e_DIPA<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DOA({\NLW_blk0000015e_DOA<31>_UNCONNECTED , \NLW_blk0000015e_DOA<30>_UNCONNECTED , \NLW_blk0000015e_DOA<29>_UNCONNECTED ,
\NLW_blk0000015e_DOA<28>_UNCONNECTED , \NLW_blk0000015e_DOA<27>_UNCONNECTED , \NLW_blk0000015e_DOA<26>_UNCONNECTED ,
\NLW_blk0000015e_DOA<25>_UNCONNECTED , \NLW_blk0000015e_DOA<24>_UNCONNECTED , \NLW_blk0000015e_DOA<23>_UNCONNECTED ,
\NLW_blk0000015e_DOA<22>_UNCONNECTED , \NLW_blk0000015e_DOA<21>_UNCONNECTED , \NLW_blk0000015e_DOA<20>_UNCONNECTED ,
\NLW_blk0000015e_DOA<19>_UNCONNECTED , \NLW_blk0000015e_DOA<18>_UNCONNECTED , \NLW_blk0000015e_DOA<17>_UNCONNECTED ,
\NLW_blk0000015e_DOA<16>_UNCONNECTED , \NLW_blk0000015e_DOA<15>_UNCONNECTED , \NLW_blk0000015e_DOA<14>_UNCONNECTED ,
\NLW_blk0000015e_DOA<13>_UNCONNECTED , \NLW_blk0000015e_DOA<12>_UNCONNECTED , \NLW_blk0000015e_DOA<11>_UNCONNECTED ,
\NLW_blk0000015e_DOA<10>_UNCONNECTED , \NLW_blk0000015e_DOA<9>_UNCONNECTED , \NLW_blk0000015e_DOA<8>_UNCONNECTED ,
\NLW_blk0000015e_DOA<7>_UNCONNECTED , \NLW_blk0000015e_DOA<6>_UNCONNECTED , \NLW_blk0000015e_DOA<5>_UNCONNECTED , \NLW_blk0000015e_DOA<4>_UNCONNECTED
, sig000000e9, sig000000e8, sig000000e7, sig000000e6}),
    .ADDRA({sig000000d2, sig000000d1, sig000000d0, sig000000cf, sig000000ce, sig000000cd, sig000000cc, sig000000cb, sig000000ca, sig000000c9,
sig000000c8, sig000000c7, \NLW_blk0000015e_ADDRA<1>_UNCONNECTED , \NLW_blk0000015e_ADDRA<0>_UNCONNECTED }),
    .ADDRB({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002,
sig00000002, sig00000002, \NLW_blk0000015e_ADDRB<1>_UNCONNECTED , \NLW_blk0000015e_ADDRB<0>_UNCONNECTED }),
    .DIB({\NLW_blk0000015e_DIB<31>_UNCONNECTED , \NLW_blk0000015e_DIB<30>_UNCONNECTED , \NLW_blk0000015e_DIB<29>_UNCONNECTED ,
\NLW_blk0000015e_DIB<28>_UNCONNECTED , \NLW_blk0000015e_DIB<27>_UNCONNECTED , \NLW_blk0000015e_DIB<26>_UNCONNECTED ,
\NLW_blk0000015e_DIB<25>_UNCONNECTED , \NLW_blk0000015e_DIB<24>_UNCONNECTED , \NLW_blk0000015e_DIB<23>_UNCONNECTED ,
\NLW_blk0000015e_DIB<22>_UNCONNECTED , \NLW_blk0000015e_DIB<21>_UNCONNECTED , \NLW_blk0000015e_DIB<20>_UNCONNECTED ,
\NLW_blk0000015e_DIB<19>_UNCONNECTED , \NLW_blk0000015e_DIB<18>_UNCONNECTED , \NLW_blk0000015e_DIB<17>_UNCONNECTED ,
\NLW_blk0000015e_DIB<16>_UNCONNECTED , \NLW_blk0000015e_DIB<15>_UNCONNECTED , \NLW_blk0000015e_DIB<14>_UNCONNECTED ,
\NLW_blk0000015e_DIB<13>_UNCONNECTED , \NLW_blk0000015e_DIB<12>_UNCONNECTED , \NLW_blk0000015e_DIB<11>_UNCONNECTED ,
\NLW_blk0000015e_DIB<10>_UNCONNECTED , \NLW_blk0000015e_DIB<9>_UNCONNECTED , \NLW_blk0000015e_DIB<8>_UNCONNECTED ,
\NLW_blk0000015e_DIB<7>_UNCONNECTED , \NLW_blk0000015e_DIB<6>_UNCONNECTED , \NLW_blk0000015e_DIB<5>_UNCONNECTED , \NLW_blk0000015e_DIB<4>_UNCONNECTED
, \NLW_blk0000015e_DIB<3>_UNCONNECTED , \NLW_blk0000015e_DIB<2>_UNCONNECTED , \NLW_blk0000015e_DIB<1>_UNCONNECTED ,
\NLW_blk0000015e_DIB<0>_UNCONNECTED }),
    .DOPA({\NLW_blk0000015e_DOPA<3>_UNCONNECTED , \NLW_blk0000015e_DOPA<2>_UNCONNECTED , \NLW_blk0000015e_DOPA<1>_UNCONNECTED ,
\NLW_blk0000015e_DOPA<0>_UNCONNECTED }),
    .DIPB({\NLW_blk0000015e_DIPB<3>_UNCONNECTED , \NLW_blk0000015e_DIPB<2>_UNCONNECTED , \NLW_blk0000015e_DIPB<1>_UNCONNECTED ,
\NLW_blk0000015e_DIPB<0>_UNCONNECTED }),
    .DOPB({\NLW_blk0000015e_DOPB<3>_UNCONNECTED , \NLW_blk0000015e_DOPB<2>_UNCONNECTED , \NLW_blk0000015e_DOPB<1>_UNCONNECTED ,
\NLW_blk0000015e_DOPB<0>_UNCONNECTED }),
    .DOB({\NLW_blk0000015e_DOB<31>_UNCONNECTED , \NLW_blk0000015e_DOB<30>_UNCONNECTED , \NLW_blk0000015e_DOB<29>_UNCONNECTED ,
\NLW_blk0000015e_DOB<28>_UNCONNECTED , \NLW_blk0000015e_DOB<27>_UNCONNECTED , \NLW_blk0000015e_DOB<26>_UNCONNECTED ,
\NLW_blk0000015e_DOB<25>_UNCONNECTED , \NLW_blk0000015e_DOB<24>_UNCONNECTED , \NLW_blk0000015e_DOB<23>_UNCONNECTED ,
\NLW_blk0000015e_DOB<22>_UNCONNECTED , \NLW_blk0000015e_DOB<21>_UNCONNECTED , \NLW_blk0000015e_DOB<20>_UNCONNECTED ,
\NLW_blk0000015e_DOB<19>_UNCONNECTED , \NLW_blk0000015e_DOB<18>_UNCONNECTED , \NLW_blk0000015e_DOB<17>_UNCONNECTED ,
\NLW_blk0000015e_DOB<16>_UNCONNECTED , \NLW_blk0000015e_DOB<15>_UNCONNECTED , \NLW_blk0000015e_DOB<14>_UNCONNECTED ,
\NLW_blk0000015e_DOB<13>_UNCONNECTED , \NLW_blk0000015e_DOB<12>_UNCONNECTED , \NLW_blk0000015e_DOB<11>_UNCONNECTED ,
\NLW_blk0000015e_DOB<10>_UNCONNECTED , \NLW_blk0000015e_DOB<9>_UNCONNECTED , \NLW_blk0000015e_DOB<8>_UNCONNECTED ,
\NLW_blk0000015e_DOB<7>_UNCONNECTED , \NLW_blk0000015e_DOB<6>_UNCONNECTED , \NLW_blk0000015e_DOB<5>_UNCONNECTED , \NLW_blk0000015e_DOB<4>_UNCONNECTED
, sig000000da, sig000000d9, sig000000d8, sig000000d7}),
    .WEB({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIA({\NLW_blk0000015e_DIA<31>_UNCONNECTED , \NLW_blk0000015e_DIA<30>_UNCONNECTED , \NLW_blk0000015e_DIA<29>_UNCONNECTED ,
\NLW_blk0000015e_DIA<28>_UNCONNECTED , \NLW_blk0000015e_DIA<27>_UNCONNECTED , \NLW_blk0000015e_DIA<26>_UNCONNECTED ,
\NLW_blk0000015e_DIA<25>_UNCONNECTED , \NLW_blk0000015e_DIA<24>_UNCONNECTED , \NLW_blk0000015e_DIA<23>_UNCONNECTED ,
\NLW_blk0000015e_DIA<22>_UNCONNECTED , \NLW_blk0000015e_DIA<21>_UNCONNECTED , \NLW_blk0000015e_DIA<20>_UNCONNECTED ,
\NLW_blk0000015e_DIA<19>_UNCONNECTED , \NLW_blk0000015e_DIA<18>_UNCONNECTED , \NLW_blk0000015e_DIA<17>_UNCONNECTED ,
\NLW_blk0000015e_DIA<16>_UNCONNECTED , \NLW_blk0000015e_DIA<15>_UNCONNECTED , \NLW_blk0000015e_DIA<14>_UNCONNECTED ,
\NLW_blk0000015e_DIA<13>_UNCONNECTED , \NLW_blk0000015e_DIA<12>_UNCONNECTED , \NLW_blk0000015e_DIA<11>_UNCONNECTED ,
\NLW_blk0000015e_DIA<10>_UNCONNECTED , \NLW_blk0000015e_DIA<9>_UNCONNECTED , \NLW_blk0000015e_DIA<8>_UNCONNECTED ,
\NLW_blk0000015e_DIA<7>_UNCONNECTED , \NLW_blk0000015e_DIA<6>_UNCONNECTED , \NLW_blk0000015e_DIA<5>_UNCONNECTED , \NLW_blk0000015e_DIA<4>_UNCONNECTED
, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  RAMB16BWER #(
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h1111111111111111111111111111111111111111111111111111111110000000 ),
    .INIT_06 ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_07 ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_08 ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_09 ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_0A ( 256'h2222222222222222222222222222222222222222222221111111111111111111 ),
    .INIT_0B ( 256'h2222222222222222222222222222222222222222222222222222222222222222 ),
    .INIT_0C ( 256'h2222222222222222222222222222222222222222222222222222222222222222 ),
    .INIT_0D ( 256'h2222222222222222222222222222222222222222222222222222222222222222 ),
    .INIT_0E ( 256'h2222222222222222222222222222222222222222222222222222222222222222 ),
    .INIT_0F ( 256'h3333333333333333333333222222222222222222222222222222222222222222 ),
    .INIT_10 ( 256'h3333333333333333333333333333333333333333333333333333333333333333 ),
    .INIT_11 ( 256'h3333333333333333333333333333333333333333333333333333333333333333 ),
    .INIT_12 ( 256'h3333333333333333333333333333333333333333333333333333333333333333 ),
    .INIT_13 ( 256'h3333333333333333333333333333333333333333333333333333333333333333 ),
    .INIT_14 ( 256'h3333333333333333333333333333333333333333333333333333333333333333 ),
    .INIT_15 ( 256'h4444444444444444444444444444444444444444444333333333333333333333 ),
    .INIT_16 ( 256'h4444444444444444444444444444444444444444444444444444444444444444 ),
    .INIT_17 ( 256'h4444444444444444444444444444444444444444444444444444444444444444 ),
    .INIT_18 ( 256'h4444444444444444444444444444444444444444444444444444444444444444 ),
    .INIT_19 ( 256'h4444444444444444444444444444444444444444444444444444444444444444 ),
    .INIT_1A ( 256'h4444444444444444444444444444444444444444444444444444444444444444 ),
    .INIT_1B ( 256'h5555555555555555555555555555555444444444444444444444444444444444 ),
    .INIT_1C ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_1D ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_1E ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_1F ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_20 ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_21 ( 256'h5555555555555555555555555555555555555555555555555555555555555555 ),
    .INIT_22 ( 256'h6666666666666666666666666666555555555555555555555555555555555555 ),
    .INIT_23 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_24 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_25 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_26 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_27 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_28 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_29 ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_2A ( 256'h6666666666666666666666666666666666666666666666666666666666666666 ),
    .INIT_2B ( 256'h7777777777777777777777777777777777777766666666666666666666666666 ),
    .INIT_2C ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_2D ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_2E ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_2F ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_30 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_31 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_32 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_33 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_34 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_35 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_36 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_37 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_38 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_39 ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3A ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3B ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3C ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3D ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3E ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_3F ( 256'h7777777777777777777777777777777777777777777777777777777777777777 ),
    .INIT_A ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_B ( 36'h000000000 ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .INIT_FILE ( "NONE" ))
  blk0000015f (
    .REGCEA(sig00000002),
    .CLKA(clk),
    .ENB(sig00000001),
    .RSTB(sig00000002),
    .CLKB(clk),
    .REGCEB(sig00000002),
    .RSTA(sig00000002),
    .ENA(sig00000001),
    .DIPA({\NLW_blk0000015f_DIPA<3>_UNCONNECTED , \NLW_blk0000015f_DIPA<2>_UNCONNECTED , \NLW_blk0000015f_DIPA<1>_UNCONNECTED ,
\NLW_blk0000015f_DIPA<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DOA({\NLW_blk0000015f_DOA<31>_UNCONNECTED , \NLW_blk0000015f_DOA<30>_UNCONNECTED , \NLW_blk0000015f_DOA<29>_UNCONNECTED ,
\NLW_blk0000015f_DOA<28>_UNCONNECTED , \NLW_blk0000015f_DOA<27>_UNCONNECTED , \NLW_blk0000015f_DOA<26>_UNCONNECTED ,
\NLW_blk0000015f_DOA<25>_UNCONNECTED , \NLW_blk0000015f_DOA<24>_UNCONNECTED , \NLW_blk0000015f_DOA<23>_UNCONNECTED ,
\NLW_blk0000015f_DOA<22>_UNCONNECTED , \NLW_blk0000015f_DOA<21>_UNCONNECTED , \NLW_blk0000015f_DOA<20>_UNCONNECTED ,
\NLW_blk0000015f_DOA<19>_UNCONNECTED , \NLW_blk0000015f_DOA<18>_UNCONNECTED , \NLW_blk0000015f_DOA<17>_UNCONNECTED ,
\NLW_blk0000015f_DOA<16>_UNCONNECTED , \NLW_blk0000015f_DOA<15>_UNCONNECTED , \NLW_blk0000015f_DOA<14>_UNCONNECTED ,
\NLW_blk0000015f_DOA<13>_UNCONNECTED , \NLW_blk0000015f_DOA<12>_UNCONNECTED , \NLW_blk0000015f_DOA<11>_UNCONNECTED ,
\NLW_blk0000015f_DOA<10>_UNCONNECTED , \NLW_blk0000015f_DOA<9>_UNCONNECTED , \NLW_blk0000015f_DOA<8>_UNCONNECTED ,
\NLW_blk0000015f_DOA<7>_UNCONNECTED , \NLW_blk0000015f_DOA<6>_UNCONNECTED , \NLW_blk0000015f_DOA<5>_UNCONNECTED , \NLW_blk0000015f_DOA<4>_UNCONNECTED
, \NLW_blk0000015f_DOA<3>_UNCONNECTED , sig000000f0, sig000000ef, sig000000ee}),
    .ADDRA({sig000000d2, sig000000d1, sig000000d0, sig000000cf, sig000000ce, sig000000cd, sig000000cc, sig000000cb, sig000000ca, sig000000c9,
sig000000c8, sig000000c7, \NLW_blk0000015f_ADDRA<1>_UNCONNECTED , \NLW_blk0000015f_ADDRA<0>_UNCONNECTED }),
    .ADDRB({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002,
sig00000002, sig00000002, \NLW_blk0000015f_ADDRB<1>_UNCONNECTED , \NLW_blk0000015f_ADDRB<0>_UNCONNECTED }),
    .DIB({\NLW_blk0000015f_DIB<31>_UNCONNECTED , \NLW_blk0000015f_DIB<30>_UNCONNECTED , \NLW_blk0000015f_DIB<29>_UNCONNECTED ,
\NLW_blk0000015f_DIB<28>_UNCONNECTED , \NLW_blk0000015f_DIB<27>_UNCONNECTED , \NLW_blk0000015f_DIB<26>_UNCONNECTED ,
\NLW_blk0000015f_DIB<25>_UNCONNECTED , \NLW_blk0000015f_DIB<24>_UNCONNECTED , \NLW_blk0000015f_DIB<23>_UNCONNECTED ,
\NLW_blk0000015f_DIB<22>_UNCONNECTED , \NLW_blk0000015f_DIB<21>_UNCONNECTED , \NLW_blk0000015f_DIB<20>_UNCONNECTED ,
\NLW_blk0000015f_DIB<19>_UNCONNECTED , \NLW_blk0000015f_DIB<18>_UNCONNECTED , \NLW_blk0000015f_DIB<17>_UNCONNECTED ,
\NLW_blk0000015f_DIB<16>_UNCONNECTED , \NLW_blk0000015f_DIB<15>_UNCONNECTED , \NLW_blk0000015f_DIB<14>_UNCONNECTED ,
\NLW_blk0000015f_DIB<13>_UNCONNECTED , \NLW_blk0000015f_DIB<12>_UNCONNECTED , \NLW_blk0000015f_DIB<11>_UNCONNECTED ,
\NLW_blk0000015f_DIB<10>_UNCONNECTED , \NLW_blk0000015f_DIB<9>_UNCONNECTED , \NLW_blk0000015f_DIB<8>_UNCONNECTED ,
\NLW_blk0000015f_DIB<7>_UNCONNECTED , \NLW_blk0000015f_DIB<6>_UNCONNECTED , \NLW_blk0000015f_DIB<5>_UNCONNECTED , \NLW_blk0000015f_DIB<4>_UNCONNECTED
, \NLW_blk0000015f_DIB<3>_UNCONNECTED , \NLW_blk0000015f_DIB<2>_UNCONNECTED , \NLW_blk0000015f_DIB<1>_UNCONNECTED ,
\NLW_blk0000015f_DIB<0>_UNCONNECTED }),
    .DOPA({\NLW_blk0000015f_DOPA<3>_UNCONNECTED , \NLW_blk0000015f_DOPA<2>_UNCONNECTED , \NLW_blk0000015f_DOPA<1>_UNCONNECTED ,
\NLW_blk0000015f_DOPA<0>_UNCONNECTED }),
    .DIPB({\NLW_blk0000015f_DIPB<3>_UNCONNECTED , \NLW_blk0000015f_DIPB<2>_UNCONNECTED , \NLW_blk0000015f_DIPB<1>_UNCONNECTED ,
\NLW_blk0000015f_DIPB<0>_UNCONNECTED }),
    .DOPB({\NLW_blk0000015f_DOPB<3>_UNCONNECTED , \NLW_blk0000015f_DOPB<2>_UNCONNECTED , \NLW_blk0000015f_DOPB<1>_UNCONNECTED ,
\NLW_blk0000015f_DOPB<0>_UNCONNECTED }),
    .DOB({\NLW_blk0000015f_DOB<31>_UNCONNECTED , \NLW_blk0000015f_DOB<30>_UNCONNECTED , \NLW_blk0000015f_DOB<29>_UNCONNECTED ,
\NLW_blk0000015f_DOB<28>_UNCONNECTED , \NLW_blk0000015f_DOB<27>_UNCONNECTED , \NLW_blk0000015f_DOB<26>_UNCONNECTED ,
\NLW_blk0000015f_DOB<25>_UNCONNECTED , \NLW_blk0000015f_DOB<24>_UNCONNECTED , \NLW_blk0000015f_DOB<23>_UNCONNECTED ,
\NLW_blk0000015f_DOB<22>_UNCONNECTED , \NLW_blk0000015f_DOB<21>_UNCONNECTED , \NLW_blk0000015f_DOB<20>_UNCONNECTED ,
\NLW_blk0000015f_DOB<19>_UNCONNECTED , \NLW_blk0000015f_DOB<18>_UNCONNECTED , \NLW_blk0000015f_DOB<17>_UNCONNECTED ,
\NLW_blk0000015f_DOB<16>_UNCONNECTED , \NLW_blk0000015f_DOB<15>_UNCONNECTED , \NLW_blk0000015f_DOB<14>_UNCONNECTED ,
\NLW_blk0000015f_DOB<13>_UNCONNECTED , \NLW_blk0000015f_DOB<12>_UNCONNECTED , \NLW_blk0000015f_DOB<11>_UNCONNECTED ,
\NLW_blk0000015f_DOB<10>_UNCONNECTED , \NLW_blk0000015f_DOB<9>_UNCONNECTED , \NLW_blk0000015f_DOB<8>_UNCONNECTED ,
\NLW_blk0000015f_DOB<7>_UNCONNECTED , \NLW_blk0000015f_DOB<6>_UNCONNECTED , \NLW_blk0000015f_DOB<5>_UNCONNECTED , \NLW_blk0000015f_DOB<4>_UNCONNECTED
, \NLW_blk0000015f_DOB<3>_UNCONNECTED , sig000000e1, sig000000e0, sig000000df}),
    .WEB({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIA({\NLW_blk0000015f_DIA<31>_UNCONNECTED , \NLW_blk0000015f_DIA<30>_UNCONNECTED , \NLW_blk0000015f_DIA<29>_UNCONNECTED ,
\NLW_blk0000015f_DIA<28>_UNCONNECTED , \NLW_blk0000015f_DIA<27>_UNCONNECTED , \NLW_blk0000015f_DIA<26>_UNCONNECTED ,
\NLW_blk0000015f_DIA<25>_UNCONNECTED , \NLW_blk0000015f_DIA<24>_UNCONNECTED , \NLW_blk0000015f_DIA<23>_UNCONNECTED ,
\NLW_blk0000015f_DIA<22>_UNCONNECTED , \NLW_blk0000015f_DIA<21>_UNCONNECTED , \NLW_blk0000015f_DIA<20>_UNCONNECTED ,
\NLW_blk0000015f_DIA<19>_UNCONNECTED , \NLW_blk0000015f_DIA<18>_UNCONNECTED , \NLW_blk0000015f_DIA<17>_UNCONNECTED ,
\NLW_blk0000015f_DIA<16>_UNCONNECTED , \NLW_blk0000015f_DIA<15>_UNCONNECTED , \NLW_blk0000015f_DIA<14>_UNCONNECTED ,
\NLW_blk0000015f_DIA<13>_UNCONNECTED , \NLW_blk0000015f_DIA<12>_UNCONNECTED , \NLW_blk0000015f_DIA<11>_UNCONNECTED ,
\NLW_blk0000015f_DIA<10>_UNCONNECTED , \NLW_blk0000015f_DIA<9>_UNCONNECTED , \NLW_blk0000015f_DIA<8>_UNCONNECTED ,
\NLW_blk0000015f_DIA<7>_UNCONNECTED , \NLW_blk0000015f_DIA<6>_UNCONNECTED , \NLW_blk0000015f_DIA<5>_UNCONNECTED , \NLW_blk0000015f_DIA<4>_UNCONNECTED
, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  RAMB16BWER #(
    .INIT_00 ( 256'hE158CF269D047BE158CF369D047BE258CF36AD047BE258CF36AD147BE259CF36 ),
    .INIT_01 ( 256'h158CF36AD147BE259C036AD148BF259C037AE148BF269C037AE158BF269D047A ),
    .INIT_02 ( 256'h48BF259C037AE158CF369D047BE259C036AD148BF269C037AE158CF269D047BE ),
    .INIT_03 ( 256'h59C037AE158CF36AD148BF269D047BE158CF36AD148BF269D047BE158CF36AD1 ),
    .INIT_04 ( 256'h58CF36AD148BF26AD148BF269D047BE259C037AE158CF36AD148BF269D047BE2 ),
    .INIT_05 ( 256'h259C037BE259C037BE259C037BE259C037BE259C037AE259C037AE158CF37AE1 ),
    .INIT_06 ( 256'hCF36AE158C037BE259D047BF269D148BF36AD148CF36AE158C037AE159C037AE ),
    .INIT_07 ( 256'h26AD158C037BE269D148BF36AE159C047BF26AD148CF37AE259C047BF269D148 ),
    .INIT_08 ( 256'h59C048BF37AE259D148C037BE26AD158C037BF26AD158C047BF26AD158C037BE ),
    .INIT_09 ( 256'h37BF36AE269D159C048CF37BF26AE159D148C037BF26AE159D048CF37BE26AD1 ),
    .INIT_0A ( 256'hD159D048C048C037BF37BE26AE269D159D148C048BF37BF26AE269D159D048C0 ),
    .INIT_0B ( 256'h159D159D159D159D159D159D048C048C048C048BF37BF37BF36AE26AE26AD159 ),
    .INIT_0C ( 256'h048C049D159D159D159D159D159D159E26AE26AE26AE26AE26AE26AE26AE26AD ),
    .INIT_0D ( 256'h9D159D26AE26BF37BF38C048C049D159D15AE26AE26AE37BF37BF37B048C048C ),
    .INIT_0E ( 256'hAF37C048D159E26AF37B048C159D16AE27BF37C048D159D26AE26BF37B048C04 ),
    .INIT_0F ( 256'h5AE27B048D15AE27B048D15AE27BF48C159E26BF38C059D26AE37B048C159E26 ),
    .INIT_10 ( 256'h8D16AF38C15AE37C059E27B049D16AF38C15AE27B049D16AF38C059E26BF48C1 ),
    .INIT_11 ( 256'h48D26BF49D27B049E27B059E27C059E27C059E27C059E27B059E27B049D26BF4 ),
    .INIT_12 ( 256'h6B059E38C16BF49E27C15AF48D26B059E37C16AF48D26B049E27C05AE38C16AF ),
    .INIT_13 ( 256'h05AF49E38C16B05AF48D27C16AF49E38C16B059E38D26B05AE38D26B05AE38D2 ),
    .INIT_14 ( 256'h16B05AF49E38D28D27C16B05AF49E38D27C16B05AF48D27C16B05AF49E38D16B ),
    .INIT_15 ( 256'h8D27D27C17C16B16B05A05AF49F49E38E38D27C17C16B05AF5AF49E38D27D27C ),
    .INIT_16 ( 256'h4AF5AF5AF5AF5A05A05A05A05A05AF5AF5AF5AF4AF4AF49F49E49E39E38E38D2 ),
    .INIT_17 ( 256'h7C27D28D38E39F4AF5A05B06B16B16C17C27D28D28D38E39E39E49E49F49F4AF ),
    .INIT_18 ( 256'hE49F5A06C17D28E39F4A05B16C27D38E49F4A05B16C17D28D39E49F5A05B06B1 ),
    .INIT_19 ( 256'hA05B17D39F5A06C28E39F5B17C28E4AF5B17C28E49F5B16C28D39F4A06B17D28 ),
    .INIT_1A ( 256'hA06C28E4A07D39F5B17D39F5B17D39F5B17D39F5B17D39F5B17D38E4A06C28E4 ),
    .INIT_1B ( 256'hE4A17D3A06C39F5C28E5B17D4A06C39F5B28E4A07D39F5C28E4A07D39F5B17E4 ),
    .INIT_1C ( 256'h5C29F5C29F6C3906C3906D3906D3906D3906C3906C39F6C29F5C28F5B28E5B17 ),
    .INIT_1D ( 256'h06D4A18E5C2906D4A18E5B29F6C3A07D4B18E5B29F6C3906D3A17E4B18E5B28F ),
    .INIT_1E ( 256'hD4B28F6D4B29F6D4B29F6D4B28F6D4A18F6C3A17E5C2907D4B28F6D3A17E5C29 ),
    .INIT_1F ( 256'hD4B2907E5C4B2907E5C3A18F6D4B2907E6D3A18F6D4B2907E5C3A18F6D3A18F6 ),
    .INIT_20 ( 256'hE6D4C3A2908F6D5C3B2908F6D5C3A2907E6D4B3A18F6E5C3A2907E5C4B2907E6 ),
    .INIT_21 ( 256'h291808F7E6D5C4B3A291807F6E5D4C3A291807E6D5C4B2A1907F6D5C4B2A1807 ),
    .INIT_22 ( 256'h7E6E6E5D5D4C4C3B3B2A29191808F7F6E6D5D4C4B3B2A291808F7E6E5D4C4B3A ),
    .INIT_23 ( 256'hC4D5D5D5D5D5D5C4C4C4C4C4C4C4C4C4B3B3B3B3B2A2A2A29191919080807F7F ),
    .INIT_24 ( 256'h3B4C4C5D5D6E6E6F7F7F808081919192A2A2A2B3B3B3B3B3C4C4C4C4C4C4C4C4 ),
    .INIT_25 ( 256'hA3B4C5D6E7F808192A3B4C5D5E6F7F809192A2B3C4C5D5E6E7F70809191A2A3B ),
    .INIT_26 ( 256'h1A3C4D6F7092A3C4D6E7091A3B4D5E6F8092A3C4D5E7F8091A3B4C5D6E708192 ),
    .INIT_27 ( 256'h81A3C5E7092B4D6F81A3C5E7092A3C5E7092A3C5E7081A3C5D6F81A2B4D6E709 ),
    .INIT_28 ( 256'hF82B4D7092C5E71A3C5F81A3D6F81A4D6F81A4D6F81A3C5F81A3C5E7092B4D6F ),
    .INIT_29 ( 256'h5F82B5E81B4E71A4D70A3C6F92C5F81B4E70A3D6F92B5E71A4D6092B5E71A3D6 ),
    .INIT_2A ( 256'hA4E81B5F82C6093D70A4D71B4E81B5E82B5F82C5F92C6F92C6F92C6F92C5F82C ),
    .INIT_2B ( 256'hE82C60A4F93D71B5F93D71B5F93D60A4E82C60A4E81B5F93D71A4E82C5F93D70 ),
    .INIT_2C ( 256'h1B50A4F93E82C71B60A4F93D82C61B5FA4E82D71B5FA4E82C61B5F93D72C60A4 ),
    .INIT_2D ( 256'h1C71C61C61B61B60B50B50A5FA4F94E93E83D82D71C61B60A5FA4E93E82D71C6 ),
    .INIT_2E ( 256'h0B61C72D82D83E94E94FA4FA50B50B60B61B61C61C71C71C72C72C72C72C72C7 ),
    .INIT_2F ( 256'hD94FA50C72D83FA50B61C73E94FA50B61C72D83E94FA50B61C72D83E94FA50B6 ),
    .INIT_30 ( 256'h84FB62D84FB62D84FB61D84FA61C83EA50C72E940B61D83FA50C72D94FA51C72 ),
    .INIT_31 ( 256'h1C840B73EA62D950C84FB72EA51D84FB72E951C83FB62D940C73EA51C83FA61D ),
    .INIT_32 ( 256'h62EA62FB73FB73FB73FB62EA62EA62EA62E951D951D840C840B73FB62EA61D95 ),
    .INIT_33 ( 256'h962EB730C851D962EB73FC840D951DA62EB73FB740C840D951D951DA62EA62EA ),
    .INIT_34 ( 256'h963FC952EB841DA730C952FB841DA63FC851EA730C851EA730C851EA63FB841D ),
    .INIT_35 ( 256'h730DA741EB852EB852FC852FC952FC962FC952FC952FC852EB851EB741DA730D ),
    .INIT_36 ( 256'h0EB8530DA752FC9741EB8630DA741FC9630DA741FC9630DA741EB852FC9630DA ),
    .INIT_37 ( 256'h7520DB8631EC9742FDA8530DB8631EB9641EC9741FC9741FC9741FC9641EB963 ),
    .INIT_38 ( 256'hB86420EB97530ECA8531FCA8631FCA8631FCA8531ECA7530EB9742FDB8631FCA ),
    .INIT_39 ( 256'hA97531FDCA86420ECA86531FDB97531FDB97531FDB97530ECA86420EC97531FD ),
    .INIT_3A ( 256'h75421FDCA976421FECA975420FDBA865310ECB975420EDB976420EDB975420EC ),
    .INIT_3B ( 256'h0EDCB98764320FEDBA9765321FEDBA8764310FDCA9865320FDCA9764310EDBA8 ),
    .INIT_3C ( 256'h543210FEDCBA9876543210FEDCBA987654210FEDCBA87654320FEDCB98765321 ),
    .INIT_3D ( 256'h66544322100FEEDCCBAA9877655432110FEEDCBAA987655432100FEDCBA98876 ),
    .INIT_3E ( 256'h44333222111000FFEEEDDCCCBBAA998887766554433221100FEEDDCCBAA99877 ),
    .INIT_3F ( 256'hEEEEEEEEEEEEEEDDDDDDDDDDDCCCCCCCBBBBBBAAAAA999998888777766655554 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "TRUE" ),
    .EN_RSTRAM_B ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .RSTTYPE ( "SYNC" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .INIT_FILE ( "NONE" ))
  blk00000160 (
    .REGCEA(sig00000002),
    .CLKA(clk),
    .ENB(sig00000001),
    .RSTB(sig00000002),
    .CLKB(clk),
    .REGCEB(sig00000002),
    .RSTA(sig00000002),
    .ENA(sig00000001),
    .DIPA({\NLW_blk00000160_DIPA<3>_UNCONNECTED , \NLW_blk00000160_DIPA<2>_UNCONNECTED , \NLW_blk00000160_DIPA<1>_UNCONNECTED ,
\NLW_blk00000160_DIPA<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DOA({\NLW_blk00000160_DOA<31>_UNCONNECTED , \NLW_blk00000160_DOA<30>_UNCONNECTED , \NLW_blk00000160_DOA<29>_UNCONNECTED ,
\NLW_blk00000160_DOA<28>_UNCONNECTED , \NLW_blk00000160_DOA<27>_UNCONNECTED , \NLW_blk00000160_DOA<26>_UNCONNECTED ,
\NLW_blk00000160_DOA<25>_UNCONNECTED , \NLW_blk00000160_DOA<24>_UNCONNECTED , \NLW_blk00000160_DOA<23>_UNCONNECTED ,
\NLW_blk00000160_DOA<22>_UNCONNECTED , \NLW_blk00000160_DOA<21>_UNCONNECTED , \NLW_blk00000160_DOA<20>_UNCONNECTED ,
\NLW_blk00000160_DOA<19>_UNCONNECTED , \NLW_blk00000160_DOA<18>_UNCONNECTED , \NLW_blk00000160_DOA<17>_UNCONNECTED ,
\NLW_blk00000160_DOA<16>_UNCONNECTED , \NLW_blk00000160_DOA<15>_UNCONNECTED , \NLW_blk00000160_DOA<14>_UNCONNECTED ,
\NLW_blk00000160_DOA<13>_UNCONNECTED , \NLW_blk00000160_DOA<12>_UNCONNECTED , \NLW_blk00000160_DOA<11>_UNCONNECTED ,
\NLW_blk00000160_DOA<10>_UNCONNECTED , \NLW_blk00000160_DOA<9>_UNCONNECTED , \NLW_blk00000160_DOA<8>_UNCONNECTED ,
\NLW_blk00000160_DOA<7>_UNCONNECTED , \NLW_blk00000160_DOA<6>_UNCONNECTED , \NLW_blk00000160_DOA<5>_UNCONNECTED , \NLW_blk00000160_DOA<4>_UNCONNECTED
, sig000000e5, sig000000e4, sig000000e3, sig000000e2}),
    .ADDRA({sig000000d2, sig000000d1, sig000000d0, sig000000cf, sig000000ce, sig000000cd, sig000000cc, sig000000cb, sig000000ca, sig000000c9,
sig000000c8, sig000000c7, \NLW_blk00000160_ADDRA<1>_UNCONNECTED , \NLW_blk00000160_ADDRA<0>_UNCONNECTED }),
    .ADDRB({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002,
sig00000002, sig00000002, \NLW_blk00000160_ADDRB<1>_UNCONNECTED , \NLW_blk00000160_ADDRB<0>_UNCONNECTED }),
    .DIB({\NLW_blk00000160_DIB<31>_UNCONNECTED , \NLW_blk00000160_DIB<30>_UNCONNECTED , \NLW_blk00000160_DIB<29>_UNCONNECTED ,
\NLW_blk00000160_DIB<28>_UNCONNECTED , \NLW_blk00000160_DIB<27>_UNCONNECTED , \NLW_blk00000160_DIB<26>_UNCONNECTED ,
\NLW_blk00000160_DIB<25>_UNCONNECTED , \NLW_blk00000160_DIB<24>_UNCONNECTED , \NLW_blk00000160_DIB<23>_UNCONNECTED ,
\NLW_blk00000160_DIB<22>_UNCONNECTED , \NLW_blk00000160_DIB<21>_UNCONNECTED , \NLW_blk00000160_DIB<20>_UNCONNECTED ,
\NLW_blk00000160_DIB<19>_UNCONNECTED , \NLW_blk00000160_DIB<18>_UNCONNECTED , \NLW_blk00000160_DIB<17>_UNCONNECTED ,
\NLW_blk00000160_DIB<16>_UNCONNECTED , \NLW_blk00000160_DIB<15>_UNCONNECTED , \NLW_blk00000160_DIB<14>_UNCONNECTED ,
\NLW_blk00000160_DIB<13>_UNCONNECTED , \NLW_blk00000160_DIB<12>_UNCONNECTED , \NLW_blk00000160_DIB<11>_UNCONNECTED ,
\NLW_blk00000160_DIB<10>_UNCONNECTED , \NLW_blk00000160_DIB<9>_UNCONNECTED , \NLW_blk00000160_DIB<8>_UNCONNECTED ,
\NLW_blk00000160_DIB<7>_UNCONNECTED , \NLW_blk00000160_DIB<6>_UNCONNECTED , \NLW_blk00000160_DIB<5>_UNCONNECTED , \NLW_blk00000160_DIB<4>_UNCONNECTED
, \NLW_blk00000160_DIB<3>_UNCONNECTED , \NLW_blk00000160_DIB<2>_UNCONNECTED , \NLW_blk00000160_DIB<1>_UNCONNECTED ,
\NLW_blk00000160_DIB<0>_UNCONNECTED }),
    .DOPA({\NLW_blk00000160_DOPA<3>_UNCONNECTED , \NLW_blk00000160_DOPA<2>_UNCONNECTED , \NLW_blk00000160_DOPA<1>_UNCONNECTED ,
\NLW_blk00000160_DOPA<0>_UNCONNECTED }),
    .DIPB({\NLW_blk00000160_DIPB<3>_UNCONNECTED , \NLW_blk00000160_DIPB<2>_UNCONNECTED , \NLW_blk00000160_DIPB<1>_UNCONNECTED ,
\NLW_blk00000160_DIPB<0>_UNCONNECTED }),
    .DOPB({\NLW_blk00000160_DOPB<3>_UNCONNECTED , \NLW_blk00000160_DOPB<2>_UNCONNECTED , \NLW_blk00000160_DOPB<1>_UNCONNECTED ,
\NLW_blk00000160_DOPB<0>_UNCONNECTED }),
    .DOB({\NLW_blk00000160_DOB<31>_UNCONNECTED , \NLW_blk00000160_DOB<30>_UNCONNECTED , \NLW_blk00000160_DOB<29>_UNCONNECTED ,
\NLW_blk00000160_DOB<28>_UNCONNECTED , \NLW_blk00000160_DOB<27>_UNCONNECTED , \NLW_blk00000160_DOB<26>_UNCONNECTED ,
\NLW_blk00000160_DOB<25>_UNCONNECTED , \NLW_blk00000160_DOB<24>_UNCONNECTED , \NLW_blk00000160_DOB<23>_UNCONNECTED ,
\NLW_blk00000160_DOB<22>_UNCONNECTED , \NLW_blk00000160_DOB<21>_UNCONNECTED , \NLW_blk00000160_DOB<20>_UNCONNECTED ,
\NLW_blk00000160_DOB<19>_UNCONNECTED , \NLW_blk00000160_DOB<18>_UNCONNECTED , \NLW_blk00000160_DOB<17>_UNCONNECTED ,
\NLW_blk00000160_DOB<16>_UNCONNECTED , \NLW_blk00000160_DOB<15>_UNCONNECTED , \NLW_blk00000160_DOB<14>_UNCONNECTED ,
\NLW_blk00000160_DOB<13>_UNCONNECTED , \NLW_blk00000160_DOB<12>_UNCONNECTED , \NLW_blk00000160_DOB<11>_UNCONNECTED ,
\NLW_blk00000160_DOB<10>_UNCONNECTED , \NLW_blk00000160_DOB<9>_UNCONNECTED , \NLW_blk00000160_DOB<8>_UNCONNECTED ,
\NLW_blk00000160_DOB<7>_UNCONNECTED , \NLW_blk00000160_DOB<6>_UNCONNECTED , \NLW_blk00000160_DOB<5>_UNCONNECTED , \NLW_blk00000160_DOB<4>_UNCONNECTED
, sig000000d6, sig000000d5, sig000000d4, sig000000d3}),
    .WEB({sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIA({\NLW_blk00000160_DIA<31>_UNCONNECTED , \NLW_blk00000160_DIA<30>_UNCONNECTED , \NLW_blk00000160_DIA<29>_UNCONNECTED ,
\NLW_blk00000160_DIA<28>_UNCONNECTED , \NLW_blk00000160_DIA<27>_UNCONNECTED , \NLW_blk00000160_DIA<26>_UNCONNECTED ,
\NLW_blk00000160_DIA<25>_UNCONNECTED , \NLW_blk00000160_DIA<24>_UNCONNECTED , \NLW_blk00000160_DIA<23>_UNCONNECTED ,
\NLW_blk00000160_DIA<22>_UNCONNECTED , \NLW_blk00000160_DIA<21>_UNCONNECTED , \NLW_blk00000160_DIA<20>_UNCONNECTED ,
\NLW_blk00000160_DIA<19>_UNCONNECTED , \NLW_blk00000160_DIA<18>_UNCONNECTED , \NLW_blk00000160_DIA<17>_UNCONNECTED ,
\NLW_blk00000160_DIA<16>_UNCONNECTED , \NLW_blk00000160_DIA<15>_UNCONNECTED , \NLW_blk00000160_DIA<14>_UNCONNECTED ,
\NLW_blk00000160_DIA<13>_UNCONNECTED , \NLW_blk00000160_DIA<12>_UNCONNECTED , \NLW_blk00000160_DIA<11>_UNCONNECTED ,
\NLW_blk00000160_DIA<10>_UNCONNECTED , \NLW_blk00000160_DIA<9>_UNCONNECTED , \NLW_blk00000160_DIA<8>_UNCONNECTED ,
\NLW_blk00000160_DIA<7>_UNCONNECTED , \NLW_blk00000160_DIA<6>_UNCONNECTED , \NLW_blk00000160_DIA<5>_UNCONNECTED , \NLW_blk00000160_DIA<4>_UNCONNECTED
, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000161 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000057),
    .Q(sig00000139),
    .Q15(NLW_blk00000161_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000162 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000139),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [13])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000163 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000059),
    .Q(sig0000013a),
    .Q15(NLW_blk00000163_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000164 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013a),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [15])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000165 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000058),
    .Q(sig0000013b),
    .Q15(NLW_blk00000165_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000166 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013b),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [14])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000167 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000054),
    .Q(sig0000013c),
    .Q15(NLW_blk00000167_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000168 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013c),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [10])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000169 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000056),
    .Q(sig0000013d),
    .Q15(NLW_blk00000169_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000016a (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013d),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [12])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000016b (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000055),
    .Q(sig0000013e),
    .Q15(NLW_blk0000016b_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000016c (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013e),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [11])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000016d (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000051),
    .Q(sig0000013f),
    .Q15(NLW_blk0000016d_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000016e (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000013f),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000016f (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000053),
    .Q(sig00000140),
    .Q15(NLW_blk0000016f_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000170 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000140),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [9])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000171 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000052),
    .Q(sig00000141),
    .Q15(NLW_blk00000171_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000172 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000141),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [8])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000173 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004e),
    .Q(sig00000142),
    .Q15(NLW_blk00000173_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000174 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000142),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000175 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000050),
    .Q(sig00000143),
    .Q15(NLW_blk00000175_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000176 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000143),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000177 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004f),
    .Q(sig00000144),
    .Q15(NLW_blk00000177_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000178 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000144),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000179 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004b),
    .Q(sig00000145),
    .Q15(NLW_blk00000179_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000017a (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000145),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000017b (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004d),
    .Q(sig00000146),
    .Q15(NLW_blk0000017b_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000017c (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000146),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000017d (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004c),
    .Q(sig00000147),
    .Q15(NLW_blk0000017d_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000017e (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000147),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000017f (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000136),
    .Q(sig00000148),
    .Q15(NLW_blk0000017f_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000180 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000148),
    .Q(sig00000134)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000181 (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig0000004a),
    .Q(sig00000149),
    .Q15(NLW_blk00000181_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000182 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000149),
    .Q(\U0/i_synth/i_phase_out.del/opt_has_pipe.pipe_6 [0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000183 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig00000135),
    .Q(sig0000014a),
    .Q15(NLW_blk00000183_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000184 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014a),
    .Q(sig00000133)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000185 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000df),
    .Q(sig0000014b),
    .Q15(NLW_blk00000185_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000186 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014b),
    .Q(sig00000121)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000187 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e1),
    .Q(sig0000014c),
    .Q15(NLW_blk00000187_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000188 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014c),
    .Q(sig00000123)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000189 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e0),
    .Q(sig0000014d),
    .Q15(NLW_blk00000189_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000018a (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014d),
    .Q(sig00000122)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000018b (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000dc),
    .Q(sig0000014e),
    .Q15(NLW_blk0000018b_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000018c (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014e),
    .Q(sig0000011e)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000018d (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000de),
    .Q(sig0000014f),
    .Q15(NLW_blk0000018d_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000018e (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000014f),
    .Q(sig00000120)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000018f (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000dd),
    .Q(sig00000150),
    .Q15(NLW_blk0000018f_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000190 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000150),
    .Q(sig0000011f)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000191 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d9),
    .Q(sig00000151),
    .Q15(NLW_blk00000191_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000192 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000151),
    .Q(sig0000011b)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000193 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000db),
    .Q(sig00000152),
    .Q15(NLW_blk00000193_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000194 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000152),
    .Q(sig0000011d)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000195 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000da),
    .Q(sig00000153),
    .Q15(NLW_blk00000195_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000196 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000153),
    .Q(sig0000011c)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000197 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d6),
    .Q(sig00000154),
    .Q15(NLW_blk00000197_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000198 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000154),
    .Q(sig00000118)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000199 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d8),
    .Q(sig00000155),
    .Q15(NLW_blk00000199_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019a (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000155),
    .Q(sig0000011a)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019b (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d7),
    .Q(sig00000156),
    .Q15(NLW_blk0000019b_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019c (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000156),
    .Q(sig00000119)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019d (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d3),
    .Q(sig00000157),
    .Q15(NLW_blk0000019d_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000019e (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000157),
    .Q(sig00000115)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk0000019f (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d5),
    .Q(sig00000158),
    .Q15(NLW_blk0000019f_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a0 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000158),
    .Q(sig00000117)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a1 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000d4),
    .Q(sig00000159),
    .Q15(NLW_blk000001a1_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a2 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000159),
    .Q(sig00000116)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a3 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000ee),
    .Q(sig0000015a),
    .Q15(NLW_blk000001a3_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a4 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015a),
    .Q(sig00000130)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a5 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000f0),
    .Q(sig0000015b),
    .Q15(NLW_blk000001a5_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a6 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015b),
    .Q(sig00000132)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a7 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000ef),
    .Q(sig0000015c),
    .Q15(NLW_blk000001a7_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001a8 (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015c),
    .Q(sig00000131)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001a9 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000eb),
    .Q(sig0000015d),
    .Q15(NLW_blk000001a9_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001aa (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015d),
    .Q(sig0000012d)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001ab (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000ed),
    .Q(sig0000015e),
    .Q15(NLW_blk000001ab_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ac (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015e),
    .Q(sig0000012f)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001ad (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000ec),
    .Q(sig0000015f),
    .Q15(NLW_blk000001ad_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ae (
    .C(clk),
    .CE(sig00000001),
    .D(sig0000015f),
    .Q(sig0000012e)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001af (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e8),
    .Q(sig00000160),
    .Q15(NLW_blk000001af_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001b0 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000160),
    .Q(sig0000012a)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001b1 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000ea),
    .Q(sig00000161),
    .Q15(NLW_blk000001b1_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001b2 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000161),
    .Q(sig0000012c)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001b3 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e9),
    .Q(sig00000162),
    .Q15(NLW_blk000001b3_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001b4 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000162),
    .Q(sig0000012b)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001b5 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e5),
    .Q(sig00000163),
    .Q15(NLW_blk000001b5_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001b6 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000163),
    .Q(sig00000127)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001b7 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e7),
    .Q(sig00000164),
    .Q15(NLW_blk000001b7_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001b8 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000164),
    .Q(sig00000129)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001b9 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e6),
    .Q(sig00000165),
    .Q15(NLW_blk000001b9_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ba (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000165),
    .Q(sig00000128)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001bb (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e2),
    .Q(sig00000166),
    .Q15(NLW_blk000001bb_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001bc (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000166),
    .Q(sig00000124)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001bd (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e4),
    .Q(sig00000167),
    .Q15(NLW_blk000001bd_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001be (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000167),
    .Q(sig00000126)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000001bf (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(clk),
    .D(sig000000e3),
    .Q(sig00000168),
    .Q15(NLW_blk000001bf_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001c0 (
    .C(clk),
    .CE(sig00000001),
    .D(sig00000168),
    .Q(sig00000125)
  );
  XORCY   \blk00000025/blk00000055  (
    .CI(\blk00000025/sig000001b7 ),
    .LI(\blk00000025/sig000001b8 ),
    .O(sig00000004)
  );
  MUXCY   \blk00000025/blk00000054  (
    .CI(\blk00000025/sig000001b7 ),
    .DI(sig00000047),
    .S(\blk00000025/sig000001b8 ),
    .O(sig00000003)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000053  (
    .I0(sig00000047),
    .I1(sig00000002),
    .O(\blk00000025/sig000001b8 )
  );
  XORCY   \blk00000025/blk00000052  (
    .CI(\blk00000025/sig000001b5 ),
    .LI(\blk00000025/sig000001b6 ),
    .O(sig00000005)
  );
  MUXCY   \blk00000025/blk00000051  (
    .CI(\blk00000025/sig000001b5 ),
    .DI(sig00000046),
    .S(\blk00000025/sig000001b6 ),
    .O(\blk00000025/sig000001b7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000050  (
    .I0(sig00000046),
    .I1(sig00000002),
    .O(\blk00000025/sig000001b6 )
  );
  XORCY   \blk00000025/blk0000004f  (
    .CI(\blk00000025/sig000001b3 ),
    .LI(\blk00000025/sig000001b4 ),
    .O(sig00000006)
  );
  MUXCY   \blk00000025/blk0000004e  (
    .CI(\blk00000025/sig000001b3 ),
    .DI(sig00000045),
    .S(\blk00000025/sig000001b4 ),
    .O(\blk00000025/sig000001b5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000004d  (
    .I0(sig00000045),
    .I1(sig00000002),
    .O(\blk00000025/sig000001b4 )
  );
  XORCY   \blk00000025/blk0000004c  (
    .CI(\blk00000025/sig000001b1 ),
    .LI(\blk00000025/sig000001b2 ),
    .O(sig00000007)
  );
  MUXCY   \blk00000025/blk0000004b  (
    .CI(\blk00000025/sig000001b1 ),
    .DI(sig00000044),
    .S(\blk00000025/sig000001b2 ),
    .O(\blk00000025/sig000001b3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000004a  (
    .I0(sig00000044),
    .I1(sig00000002),
    .O(\blk00000025/sig000001b2 )
  );
  XORCY   \blk00000025/blk00000049  (
    .CI(\blk00000025/sig000001af ),
    .LI(\blk00000025/sig000001b0 ),
    .O(sig00000008)
  );
  MUXCY   \blk00000025/blk00000048  (
    .CI(\blk00000025/sig000001af ),
    .DI(sig00000043),
    .S(\blk00000025/sig000001b0 ),
    .O(\blk00000025/sig000001b1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000047  (
    .I0(sig00000043),
    .I1(sig00000002),
    .O(\blk00000025/sig000001b0 )
  );
  XORCY   \blk00000025/blk00000046  (
    .CI(\blk00000025/sig000001ad ),
    .LI(\blk00000025/sig000001ae ),
    .O(sig00000009)
  );
  MUXCY   \blk00000025/blk00000045  (
    .CI(\blk00000025/sig000001ad ),
    .DI(sig00000042),
    .S(\blk00000025/sig000001ae ),
    .O(\blk00000025/sig000001af )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000044  (
    .I0(sig00000042),
    .I1(sig00000002),
    .O(\blk00000025/sig000001ae )
  );
  XORCY   \blk00000025/blk00000043  (
    .CI(\blk00000025/sig000001ab ),
    .LI(\blk00000025/sig000001ac ),
    .O(sig0000000a)
  );
  MUXCY   \blk00000025/blk00000042  (
    .CI(\blk00000025/sig000001ab ),
    .DI(sig00000041),
    .S(\blk00000025/sig000001ac ),
    .O(\blk00000025/sig000001ad )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000041  (
    .I0(sig00000041),
    .I1(sig00000001),
    .O(\blk00000025/sig000001ac )
  );
  XORCY   \blk00000025/blk00000040  (
    .CI(\blk00000025/sig000001a9 ),
    .LI(\blk00000025/sig000001aa ),
    .O(sig0000000b)
  );
  MUXCY   \blk00000025/blk0000003f  (
    .CI(\blk00000025/sig000001a9 ),
    .DI(sig00000040),
    .S(\blk00000025/sig000001aa ),
    .O(\blk00000025/sig000001ab )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000003e  (
    .I0(sig00000040),
    .I1(sig00000002),
    .O(\blk00000025/sig000001aa )
  );
  XORCY   \blk00000025/blk0000003d  (
    .CI(\blk00000025/sig000001a7 ),
    .LI(\blk00000025/sig000001a8 ),
    .O(sig0000000c)
  );
  MUXCY   \blk00000025/blk0000003c  (
    .CI(\blk00000025/sig000001a7 ),
    .DI(sig0000003f),
    .S(\blk00000025/sig000001a8 ),
    .O(\blk00000025/sig000001a9 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000003b  (
    .I0(sig0000003f),
    .I1(sig00000002),
    .O(\blk00000025/sig000001a8 )
  );
  XORCY   \blk00000025/blk0000003a  (
    .CI(\blk00000025/sig000001a5 ),
    .LI(\blk00000025/sig000001a6 ),
    .O(sig0000000d)
  );
  MUXCY   \blk00000025/blk00000039  (
    .CI(\blk00000025/sig000001a5 ),
    .DI(sig0000003e),
    .S(\blk00000025/sig000001a6 ),
    .O(\blk00000025/sig000001a7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000038  (
    .I0(sig0000003e),
    .I1(sig00000002),
    .O(\blk00000025/sig000001a6 )
  );
  XORCY   \blk00000025/blk00000037  (
    .CI(\blk00000025/sig000001a3 ),
    .LI(\blk00000025/sig000001a4 ),
    .O(sig0000000e)
  );
  MUXCY   \blk00000025/blk00000036  (
    .CI(\blk00000025/sig000001a3 ),
    .DI(sig0000003d),
    .S(\blk00000025/sig000001a4 ),
    .O(\blk00000025/sig000001a5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000035  (
    .I0(sig0000003d),
    .I1(sig00000002),
    .O(\blk00000025/sig000001a4 )
  );
  XORCY   \blk00000025/blk00000034  (
    .CI(\blk00000025/sig000001a1 ),
    .LI(\blk00000025/sig000001a2 ),
    .O(sig0000000f)
  );
  MUXCY   \blk00000025/blk00000033  (
    .CI(\blk00000025/sig000001a1 ),
    .DI(sig0000003c),
    .S(\blk00000025/sig000001a2 ),
    .O(\blk00000025/sig000001a3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000032  (
    .I0(sig00000002),
    .I1(sig0000003c),
    .O(\blk00000025/sig000001a2 )
  );
  XORCY   \blk00000025/blk00000031  (
    .CI(\blk00000025/sig0000019f ),
    .LI(\blk00000025/sig000001a0 ),
    .O(sig00000010)
  );
  MUXCY   \blk00000025/blk00000030  (
    .CI(\blk00000025/sig0000019f ),
    .DI(sig0000003b),
    .S(\blk00000025/sig000001a0 ),
    .O(\blk00000025/sig000001a1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000002f  (
    .I0(sig00000001),
    .I1(sig0000003b),
    .O(\blk00000025/sig000001a0 )
  );
  XORCY   \blk00000025/blk0000002e  (
    .CI(\blk00000025/sig0000019d ),
    .LI(\blk00000025/sig0000019e ),
    .O(sig00000011)
  );
  MUXCY   \blk00000025/blk0000002d  (
    .CI(\blk00000025/sig0000019d ),
    .DI(sig0000003a),
    .S(\blk00000025/sig0000019e ),
    .O(\blk00000025/sig0000019f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk0000002c  (
    .I0(sig00000001),
    .I1(sig0000003a),
    .O(\blk00000025/sig0000019e )
  );
  XORCY   \blk00000025/blk0000002b  (
    .CI(\blk00000025/sig0000019b ),
    .LI(\blk00000025/sig0000019c ),
    .O(sig00000012)
  );
  MUXCY   \blk00000025/blk0000002a  (
    .CI(\blk00000025/sig0000019b ),
    .DI(sig00000039),
    .S(\blk00000025/sig0000019c ),
    .O(\blk00000025/sig0000019d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000029  (
    .I0(sig00000001),
    .I1(sig00000039),
    .O(\blk00000025/sig0000019c )
  );
  XORCY   \blk00000025/blk00000028  (
    .CI(sig00000002),
    .LI(\blk00000025/sig0000019a ),
    .O(sig00000013)
  );
  MUXCY   \blk00000025/blk00000027  (
    .CI(sig00000002),
    .DI(sig00000038),
    .S(\blk00000025/sig0000019a ),
    .O(\blk00000025/sig0000019b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000025/blk00000026  (
    .I0(sig00000002),
    .I1(sig00000038),
    .O(\blk00000025/sig0000019a )
  );
  XORCY   \blk00000056/blk00000086  (
    .CI(\blk00000056/sig00000208 ),
    .LI(\blk00000056/sig00000209 ),
    .O(sig00000023)
  );
  MUXCY   \blk00000056/blk00000085  (
    .CI(\blk00000056/sig00000208 ),
    .DI(sig00000047),
    .S(\blk00000056/sig00000209 ),
    .O(sig00000024)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000084  (
    .I0(sig00000047),
    .I1(sig00000037),
    .O(\blk00000056/sig00000209 )
  );
  XORCY   \blk00000056/blk00000083  (
    .CI(\blk00000056/sig00000206 ),
    .LI(\blk00000056/sig00000207 ),
    .O(sig00000022)
  );
  MUXCY   \blk00000056/blk00000082  (
    .CI(\blk00000056/sig00000206 ),
    .DI(sig00000046),
    .S(\blk00000056/sig00000207 ),
    .O(\blk00000056/sig00000208 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000081  (
    .I0(sig00000046),
    .I1(sig00000037),
    .O(\blk00000056/sig00000207 )
  );
  XORCY   \blk00000056/blk00000080  (
    .CI(\blk00000056/sig00000204 ),
    .LI(\blk00000056/sig00000205 ),
    .O(sig00000021)
  );
  MUXCY   \blk00000056/blk0000007f  (
    .CI(\blk00000056/sig00000204 ),
    .DI(sig00000045),
    .S(\blk00000056/sig00000205 ),
    .O(\blk00000056/sig00000206 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000007e  (
    .I0(sig00000045),
    .I1(sig00000037),
    .O(\blk00000056/sig00000205 )
  );
  XORCY   \blk00000056/blk0000007d  (
    .CI(\blk00000056/sig00000202 ),
    .LI(\blk00000056/sig00000203 ),
    .O(sig00000020)
  );
  MUXCY   \blk00000056/blk0000007c  (
    .CI(\blk00000056/sig00000202 ),
    .DI(sig00000044),
    .S(\blk00000056/sig00000203 ),
    .O(\blk00000056/sig00000204 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000007b  (
    .I0(sig00000044),
    .I1(sig00000037),
    .O(\blk00000056/sig00000203 )
  );
  XORCY   \blk00000056/blk0000007a  (
    .CI(\blk00000056/sig00000200 ),
    .LI(\blk00000056/sig00000201 ),
    .O(sig0000001f)
  );
  MUXCY   \blk00000056/blk00000079  (
    .CI(\blk00000056/sig00000200 ),
    .DI(sig00000043),
    .S(\blk00000056/sig00000201 ),
    .O(\blk00000056/sig00000202 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000078  (
    .I0(sig00000043),
    .I1(sig00000037),
    .O(\blk00000056/sig00000201 )
  );
  XORCY   \blk00000056/blk00000077  (
    .CI(\blk00000056/sig000001fe ),
    .LI(\blk00000056/sig000001ff ),
    .O(sig0000001e)
  );
  MUXCY   \blk00000056/blk00000076  (
    .CI(\blk00000056/sig000001fe ),
    .DI(sig00000042),
    .S(\blk00000056/sig000001ff ),
    .O(\blk00000056/sig00000200 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000075  (
    .I0(sig00000042),
    .I1(sig00000037),
    .O(\blk00000056/sig000001ff )
  );
  XORCY   \blk00000056/blk00000074  (
    .CI(\blk00000056/sig000001fc ),
    .LI(\blk00000056/sig000001fd ),
    .O(sig0000001d)
  );
  MUXCY   \blk00000056/blk00000073  (
    .CI(\blk00000056/sig000001fc ),
    .DI(sig00000041),
    .S(\blk00000056/sig000001fd ),
    .O(\blk00000056/sig000001fe )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000072  (
    .I0(sig00000041),
    .I1(sig00000037),
    .O(\blk00000056/sig000001fd )
  );
  XORCY   \blk00000056/blk00000071  (
    .CI(\blk00000056/sig000001fa ),
    .LI(\blk00000056/sig000001fb ),
    .O(sig0000001c)
  );
  MUXCY   \blk00000056/blk00000070  (
    .CI(\blk00000056/sig000001fa ),
    .DI(sig00000040),
    .S(\blk00000056/sig000001fb ),
    .O(\blk00000056/sig000001fc )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000006f  (
    .I0(sig00000040),
    .I1(sig00000037),
    .O(\blk00000056/sig000001fb )
  );
  XORCY   \blk00000056/blk0000006e  (
    .CI(\blk00000056/sig000001f8 ),
    .LI(\blk00000056/sig000001f9 ),
    .O(sig0000001b)
  );
  MUXCY   \blk00000056/blk0000006d  (
    .CI(\blk00000056/sig000001f8 ),
    .DI(sig0000003f),
    .S(\blk00000056/sig000001f9 ),
    .O(\blk00000056/sig000001fa )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000006c  (
    .I0(sig0000003f),
    .I1(sig00000037),
    .O(\blk00000056/sig000001f9 )
  );
  XORCY   \blk00000056/blk0000006b  (
    .CI(\blk00000056/sig000001f6 ),
    .LI(\blk00000056/sig000001f7 ),
    .O(sig0000001a)
  );
  MUXCY   \blk00000056/blk0000006a  (
    .CI(\blk00000056/sig000001f6 ),
    .DI(sig0000003e),
    .S(\blk00000056/sig000001f7 ),
    .O(\blk00000056/sig000001f8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000069  (
    .I0(sig0000003e),
    .I1(sig00000037),
    .O(\blk00000056/sig000001f7 )
  );
  XORCY   \blk00000056/blk00000068  (
    .CI(\blk00000056/sig000001f4 ),
    .LI(\blk00000056/sig000001f5 ),
    .O(sig00000019)
  );
  MUXCY   \blk00000056/blk00000067  (
    .CI(\blk00000056/sig000001f4 ),
    .DI(sig0000003d),
    .S(\blk00000056/sig000001f5 ),
    .O(\blk00000056/sig000001f6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000066  (
    .I0(sig0000003d),
    .I1(sig00000037),
    .O(\blk00000056/sig000001f5 )
  );
  XORCY   \blk00000056/blk00000065  (
    .CI(\blk00000056/sig000001f2 ),
    .LI(\blk00000056/sig000001f3 ),
    .O(sig00000018)
  );
  MUXCY   \blk00000056/blk00000064  (
    .CI(\blk00000056/sig000001f2 ),
    .DI(sig0000003c),
    .S(\blk00000056/sig000001f3 ),
    .O(\blk00000056/sig000001f4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000063  (
    .I0(sig0000003c),
    .I1(sig00000037),
    .O(\blk00000056/sig000001f3 )
  );
  XORCY   \blk00000056/blk00000062  (
    .CI(\blk00000056/sig000001f0 ),
    .LI(\blk00000056/sig000001f1 ),
    .O(sig00000017)
  );
  MUXCY   \blk00000056/blk00000061  (
    .CI(\blk00000056/sig000001f0 ),
    .DI(sig0000003b),
    .S(\blk00000056/sig000001f1 ),
    .O(\blk00000056/sig000001f2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000060  (
    .I0(sig0000003b),
    .I1(sig00000037),
    .O(\blk00000056/sig000001f1 )
  );
  XORCY   \blk00000056/blk0000005f  (
    .CI(\blk00000056/sig000001ee ),
    .LI(\blk00000056/sig000001ef ),
    .O(sig00000016)
  );
  MUXCY   \blk00000056/blk0000005e  (
    .CI(\blk00000056/sig000001ee ),
    .DI(sig0000003a),
    .S(\blk00000056/sig000001ef ),
    .O(\blk00000056/sig000001f0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000005d  (
    .I0(sig0000003a),
    .I1(sig00000037),
    .O(\blk00000056/sig000001ef )
  );
  XORCY   \blk00000056/blk0000005c  (
    .CI(\blk00000056/sig000001ec ),
    .LI(\blk00000056/sig000001ed ),
    .O(sig00000015)
  );
  MUXCY   \blk00000056/blk0000005b  (
    .CI(\blk00000056/sig000001ec ),
    .DI(sig00000039),
    .S(\blk00000056/sig000001ed ),
    .O(\blk00000056/sig000001ee )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk0000005a  (
    .I0(sig00000039),
    .I1(sig00000036),
    .O(\blk00000056/sig000001ed )
  );
  XORCY   \blk00000056/blk00000059  (
    .CI(sig00000002),
    .LI(\blk00000056/sig000001eb ),
    .O(sig00000014)
  );
  MUXCY   \blk00000056/blk00000058  (
    .CI(sig00000002),
    .DI(sig00000038),
    .S(\blk00000056/sig000001eb ),
    .O(\blk00000056/sig000001ec )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000056/blk00000057  (
    .I0(sig00000038),
    .I1(sig00000035),
    .O(\blk00000056/sig000001eb )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk0000009b  (
    .I0(\blk00000087/sig00000211 ),
    .I1(\blk00000087/sig00000210 ),
    .O(\blk00000087/sig0000021f )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \blk00000087/blk0000009a  (
    .I0(sig00000035),
    .I1(\blk00000087/sig00000211 ),
    .I2(\blk00000087/sig00000210 ),
    .O(\blk00000087/sig00000218 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000099  (
    .I0(\blk00000087/sig0000020f ),
    .I1(\blk00000087/sig0000020e ),
    .O(\blk00000087/sig0000021e )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \blk00000087/blk00000098  (
    .I0(sig00000036),
    .I1(\blk00000087/sig0000020f ),
    .I2(\blk00000087/sig0000020e ),
    .O(\blk00000087/sig00000217 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000097  (
    .I0(\blk00000087/sig0000020c ),
    .I1(\blk00000087/sig0000020d ),
    .O(\blk00000087/sig0000021d )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \blk00000087/blk00000096  (
    .I0(sig00000037),
    .I1(\blk00000087/sig0000020c ),
    .I2(\blk00000087/sig0000020d ),
    .O(\blk00000087/sig00000216 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000095  (
    .I0(sig00000035),
    .I1(\blk00000087/sig00000212 ),
    .O(\blk00000087/sig0000021c )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000094  (
    .I0(sig00000037),
    .I1(\blk00000087/sig0000020f ),
    .O(\blk00000087/sig0000021a )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000093  (
    .I0(\blk00000087/sig00000212 ),
    .I1(\blk00000087/sig0000020d ),
    .O(\blk00000087/sig00000219 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000087/blk00000092  (
    .I0(sig00000036),
    .I1(\blk00000087/sig00000211 ),
    .O(\blk00000087/sig0000021b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk00000091  (
    .C(clk),
    .D(\blk00000087/sig0000021d ),
    .Q(\blk00000087/sig0000020c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk00000090  (
    .C(clk),
    .D(\blk00000087/sig0000021e ),
    .Q(\blk00000087/sig0000020e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008f  (
    .C(clk),
    .D(\blk00000087/sig0000021f ),
    .Q(\blk00000087/sig00000210 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008e  (
    .C(clk),
    .D(\blk00000087/sig00000219 ),
    .Q(\blk00000087/sig0000020d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008d  (
    .C(clk),
    .D(\blk00000087/sig0000021a ),
    .Q(\blk00000087/sig0000020f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008c  (
    .C(clk),
    .D(\blk00000087/sig0000021b ),
    .Q(\blk00000087/sig00000211 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008b  (
    .C(clk),
    .D(\blk00000087/sig0000021c ),
    .Q(\blk00000087/sig00000212 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk0000008a  (
    .C(clk),
    .D(\blk00000087/sig00000216 ),
    .Q(sig00000037)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk00000089  (
    .C(clk),
    .D(\blk00000087/sig00000217 ),
    .Q(sig00000036)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000087/blk00000088  (
    .C(clk),
    .D(\blk00000087/sig00000218 ),
    .Q(sig00000035)
  );
// synthesis translate_on
endmodule