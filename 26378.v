module STREE(input  wire                        CLK,
             input  wire                        RST_in,
             input  wire                        irst,
             input  wire                        frst,
             input  wire [`PHASE_W]             phase_in,
             input  wire [`MERGW*`SORT_WAY-1:0] s_din,     // sorting-tree input data
             input  wire [`SORT_WAY-1:0]        enq,       // enqueue
             output wire [`SORT_WAY-1:0]        full,      // buffer is full ?
             input  wire                        deq,       // dequeue
             output wire [`MERGW-1:0]           dot,       // output data
             output wire                        emp);
  reg RST;
  always @(posedge CLK) RST <= RST_in;
  reg [`PHASE_W] phase;
  always @(posedge CLK) phase <= phase_in;
  wire [`MERGW-1:0] d00, d01, d02, d03, d04, d05, d06, d07;
  assign {d00, d01, d02, d03, d04, d05, d06, d07} = s_din;
  // wire [`MERGW-1:0] d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15;
  // assign {d00, d01, d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12, d13, d14, d15} = s_din;
  wire F01_enq, F01_deq, F01_emp, F01_full; wire [`MERGW-1:0] F01_din, F01_dot; wire [1:0] F01_cnt;
  wire F02_enq, F02_deq, F02_emp, F02_full; wire [`MERGW-1:0] F02_din, F02_dot; wire [1:0] F02_cnt;
  wire F03_enq, F03_deq, F03_emp, F03_full; wire [`MERGW-1:0] F03_din, F03_dot; wire [1:0] F03_cnt;
  wire F04_enq, F04_deq, F04_emp, F04_full; wire [`MERGW-1:0] F04_din, F04_dot; wire [1:0] F04_cnt;
  wire F05_enq, F05_deq, F05_emp, F05_full; wire [`MERGW-1:0] F05_din, F05_dot; wire [1:0] F05_cnt;
  wire F06_enq, F06_deq, F06_emp, F06_full; wire [`MERGW-1:0] F06_din, F06_dot; wire [1:0] F06_cnt;
  wire F07_enq, F07_deq, F07_emp, F07_full; wire [`MERGW-1:0] F07_din, F07_dot; wire [1:0] F07_cnt;
  wire F08_enq, F08_deq, F08_emp, F08_full; wire [`MERGW-1:0] F08_din, F08_dot; wire [1:0] F08_cnt;
  wire F09_enq, F09_deq, F09_emp, F09_full; wire [`MERGW-1:0] F09_din, F09_dot; wire [1:0] F09_cnt;
  wire F10_enq, F10_deq, F10_emp, F10_full; wire [`MERGW-1:0] F10_din, F10_dot; wire [1:0] F10_cnt;
  wire F11_enq, F11_deq, F11_emp, F11_full; wire [`MERGW-1:0] F11_din, F11_dot; wire [1:0] F11_cnt;
  wire F12_enq, F12_deq, F12_emp, F12_full; wire [`MERGW-1:0] F12_din, F12_dot; wire [1:0] F12_cnt;
  wire F13_enq, F13_deq, F13_emp, F13_full; wire [`MERGW-1:0] F13_din, F13_dot; wire [1:0] F13_cnt;
  wire F14_enq, F14_deq, F14_emp, F14_full; wire [`MERGW-1:0] F14_din, F14_dot; wire [1:0] F14_cnt;
  wire F15_enq, F15_deq, F15_emp, F15_full; wire [`MERGW-1:0] F15_din, F15_dot; wire [1:0] F15_cnt;
  // wire F01_enq, F01_deq, F01_emp, F01_full; wire [`MERGW-1:0] F01_din, F01_dot; wire [1:0] F01_cnt;
  // wire F02_enq, F02_deq, F02_emp, F02_full; wire [`MERGW-1:0] F02_din, F02_dot; wire [1:0] F02_cnt;
  // wire F03_enq, F03_deq, F03_emp, F03_full; wire [`MERGW-1:0] F03_din, F03_dot; wire [1:0] F03_cnt;
  // wire F04_enq, F04_deq, F04_emp, F04_full; wire [`MERGW-1:0] F04_din, F04_dot; wire [1:0] F04_cnt;
  // wire F05_enq, F05_deq, F05_emp, F05_full; wire [`MERGW-1:0] F05_din, F05_dot; wire [1:0] F05_cnt;
  // wire F06_enq, F06_deq, F06_emp, F06_full; wire [`MERGW-1:0] F06_din, F06_dot; wire [1:0] F06_cnt;
  // wire F07_enq, F07_deq, F07_emp, F07_full; wire [`MERGW-1:0] F07_din, F07_dot; wire [1:0] F07_cnt;
  // wire F08_enq, F08_deq, F08_emp, F08_full; wire [`MERGW-1:0] F08_din, F08_dot; wire [1:0] F08_cnt;
  // wire F09_enq, F09_deq, F09_emp, F09_full; wire [`MERGW-1:0] F09_din, F09_dot; wire [1:0] F09_cnt;
  // wire F10_enq, F10_deq, F10_emp, F10_full; wire [`MERGW-1:0] F10_din, F10_dot; wire [1:0] F10_cnt;
  // wire F11_enq, F11_deq, F11_emp, F11_full; wire [`MERGW-1:0] F11_din, F11_dot; wire [1:0] F11_cnt;
  // wire F12_enq, F12_deq, F12_emp, F12_full; wire [`MERGW-1:0] F12_din, F12_dot; wire [1:0] F12_cnt;
  // wire F13_enq, F13_deq, F13_emp, F13_full; wire [`MERGW-1:0] F13_din, F13_dot; wire [1:0] F13_cnt;
  // wire F14_enq, F14_deq, F14_emp, F14_full; wire [`MERGW-1:0] F14_din, F14_dot; wire [1:0] F14_cnt;
  // wire F15_enq, F15_deq, F15_emp, F15_full; wire [`MERGW-1:0] F15_din, F15_dot; wire [1:0] F15_cnt;
  // wire F16_enq, F16_deq, F16_emp, F16_full; wire [`MERGW-1:0] F16_din, F16_dot; wire [1:0] F16_cnt;
  // wire F17_enq, F17_deq, F17_emp, F17_full; wire [`MERGW-1:0] F17_din, F17_dot; wire [1:0] F17_cnt;
  // wire F18_enq, F18_deq, F18_emp, F18_full; wire [`MERGW-1:0] F18_din, F18_dot; wire [1:0] F18_cnt;
  // wire F19_enq, F19_deq, F19_emp, F19_full; wire [`MERGW-1:0] F19_din, F19_dot; wire [1:0] F19_cnt;
  // wire F20_enq, F20_deq, F20_emp, F20_full; wire [`MERGW-1:0] F20_din, F20_dot; wire [1:0] F20_cnt;
  // wire F21_enq, F21_deq, F21_emp, F21_full; wire [`MERGW-1:0] F21_din, F21_dot; wire [1:0] F21_cnt;
  // wire F22_enq, F22_deq, F22_emp, F22_full; wire [`MERGW-1:0] F22_din, F22_dot; wire [1:0] F22_cnt;
  // wire F23_enq, F23_deq, F23_emp, F23_full; wire [`MERGW-1:0] F23_din, F23_dot; wire [1:0] F23_cnt;
  // wire F24_enq, F24_deq, F24_emp, F24_full; wire [`MERGW-1:0] F24_din, F24_dot; wire [1:0] F24_cnt;
  // wire F25_enq, F25_deq, F25_emp, F25_full; wire [`MERGW-1:0] F25_din, F25_dot; wire [1:0] F25_cnt;
  // wire F26_enq, F26_deq, F26_emp, F26_full; wire [`MERGW-1:0] F26_din, F26_dot; wire [1:0] F26_cnt;
  // wire F27_enq, F27_deq, F27_emp, F27_full; wire [`MERGW-1:0] F27_din, F27_dot; wire [1:0] F27_cnt;
  // wire F28_enq, F28_deq, F28_emp, F28_full; wire [`MERGW-1:0] F28_din, F28_dot; wire [1:0] F28_cnt;
  // wire F29_enq, F29_deq, F29_emp, F29_full; wire [`MERGW-1:0] F29_din, F29_dot; wire [1:0] F29_cnt;
  // wire F30_enq, F30_deq, F30_emp, F30_full; wire [`MERGW-1:0] F30_din, F30_dot; wire [1:0] F30_cnt;
  // wire F31_enq, F31_deq, F31_emp, F31_full; wire [`MERGW-1:0] F31_din, F31_dot; wire [1:0] F31_cnt;
  INBUF IN08(CLK, RST, full[0], F08_full, F08_enq, d00, F08_din, enq[0], phase, irst);
  INBUF IN09(CLK, RST, full[1], F09_full, F09_enq, d01, F09_din, enq[1], phase, irst);
  INBUF IN10(CLK, RST, full[2], F10_full, F10_enq, d02, F10_din, enq[2], phase, irst);
  INBUF IN11(CLK, RST, full[3], F11_full, F11_enq, d03, F11_din, enq[3], phase, irst);
  INBUF IN12(CLK, RST, full[4], F12_full, F12_enq, d04, F12_din, enq[4], phase, irst);
  INBUF IN13(CLK, RST, full[5], F13_full, F13_enq, d05, F13_din, enq[5], phase, irst);
  INBUF IN14(CLK, RST, full[6], F14_full, F14_enq, d06, F14_din, enq[6], phase, irst);
  INBUF IN15(CLK, RST, full[7], F15_full, F15_enq, d07, F15_din, enq[7], phase, irst);
  // INBUF IN16(CLK, RST, full[0],  F16_full, F16_enq, d00, F16_din, enq[0],  phase, irst);
  // INBUF IN17(CLK, RST, full[1],  F17_full, F17_enq, d01, F17_din, enq[1],  phase, irst);
  // INBUF IN18(CLK, RST, full[2],  F18_full, F18_enq, d02, F18_din, enq[2],  phase, irst);
  // INBUF IN19(CLK, RST, full[3],  F19_full, F19_enq, d03, F19_din, enq[3],  phase, irst);
  // INBUF IN20(CLK, RST, full[4],  F20_full, F20_enq, d04, F20_din, enq[4],  phase, irst);
  // INBUF IN21(CLK, RST, full[5],  F21_full, F21_enq, d05, F21_din, enq[5],  phase, irst);
  // INBUF IN22(CLK, RST, full[6],  F22_full, F22_enq, d06, F22_din, enq[6],  phase, irst);
  // INBUF IN23(CLK, RST, full[7],  F23_full, F23_enq, d07, F23_din, enq[7],  phase, irst);
  // INBUF IN24(CLK, RST, full[8],  F24_full, F24_enq, d08, F24_din, enq[8],  phase, irst);
  // INBUF IN25(CLK, RST, full[9],  F25_full, F25_enq, d09, F25_din, enq[9],  phase, irst);
  // INBUF IN26(CLK, RST, full[10], F26_full, F26_enq, d10, F26_din, enq[10], phase, irst);
  // INBUF IN27(CLK, RST, full[11], F27_full, F27_enq, d11, F27_din, enq[11], phase, irst);
  // INBUF IN28(CLK, RST, full[12], F28_full, F28_enq, d12, F28_din, enq[12], phase, irst);
  // INBUF IN29(CLK, RST, full[13], F29_full, F29_enq, d13, F29_din, enq[13], phase, irst);
  // INBUF IN30(CLK, RST, full[14], F30_full, F30_enq, d14, F30_din, enq[14], phase, irst);
  // INBUF IN31(CLK, RST, full[15], F31_full, F31_enq, d15, F31_din, enq[15], phase, irst);
  MRE2 #(1, `MERGW) F01(CLK, frst, F01_enq, F01_deq, F01_din, F01_dot, F01_emp, F01_full, F01_cnt);
  MRE2 #(1, `MERGW) F02(CLK, frst, F02_enq, F02_deq, F02_din, F02_dot, F02_emp, F02_full, F02_cnt);
  MRE2 #(1, `MERGW) F03(CLK, frst, F03_enq, F03_deq, F03_din, F03_dot, F03_emp, F03_full, F03_cnt);
  MRE2 #(1, `MERGW) F04(CLK, frst, F04_enq, F04_deq, F04_din, F04_dot, F04_emp, F04_full, F04_cnt);
  MRE2 #(1, `MERGW) F05(CLK, frst, F05_enq, F05_deq, F05_din, F05_dot, F05_emp, F05_full, F05_cnt);
  MRE2 #(1, `MERGW) F06(CLK, frst, F06_enq, F06_deq, F06_din, F06_dot, F06_emp, F06_full, F06_cnt);
  MRE2 #(1, `MERGW) F07(CLK, frst, F07_enq, F07_deq, F07_din, F07_dot, F07_emp, F07_full, F07_cnt);
  MRE2 #(1, `MERGW) F08(CLK, frst, F08_enq, F08_deq, F08_din, F08_dot, F08_emp, F08_full, F08_cnt);
  MRE2 #(1, `MERGW) F09(CLK, frst, F09_enq, F09_deq, F09_din, F09_dot, F09_emp, F09_full, F09_cnt);
  MRE2 #(1, `MERGW) F10(CLK, frst, F10_enq, F10_deq, F10_din, F10_dot, F10_emp, F10_full, F10_cnt);
  MRE2 #(1, `MERGW) F11(CLK, frst, F11_enq, F11_deq, F11_din, F11_dot, F11_emp, F11_full, F11_cnt);
  MRE2 #(1, `MERGW) F12(CLK, frst, F12_enq, F12_deq, F12_din, F12_dot, F12_emp, F12_full, F12_cnt);
  MRE2 #(1, `MERGW) F13(CLK, frst, F13_enq, F13_deq, F13_din, F13_dot, F13_emp, F13_full, F13_cnt);
  MRE2 #(1, `MERGW) F14(CLK, frst, F14_enq, F14_deq, F14_din, F14_dot, F14_emp, F14_full, F14_cnt);
  MRE2 #(1, `MERGW) F15(CLK, frst, F15_enq, F15_deq, F15_din, F15_dot, F15_emp, F15_full, F15_cnt);
  // MRE2 #(1, `MERGW) F01(CLK, frst, F01_enq, F01_deq, F01_din, F01_dot, F01_emp, F01_full, F01_cnt);
  // MRE2 #(1, `MERGW) F02(CLK, frst, F02_enq, F02_deq, F02_din, F02_dot, F02_emp, F02_full, F02_cnt);
  // MRE2 #(1, `MERGW) F03(CLK, frst, F03_enq, F03_deq, F03_din, F03_dot, F03_emp, F03_full, F03_cnt);
  // MRE2 #(1, `MERGW) F04(CLK, frst, F04_enq, F04_deq, F04_din, F04_dot, F04_emp, F04_full, F04_cnt);
  // MRE2 #(1, `MERGW) F05(CLK, frst, F05_enq, F05_deq, F05_din, F05_dot, F05_emp, F05_full, F05_cnt);
  // MRE2 #(1, `MERGW) F06(CLK, frst, F06_enq, F06_deq, F06_din, F06_dot, F06_emp, F06_full, F06_cnt);
  // MRE2 #(1, `MERGW) F07(CLK, frst, F07_enq, F07_deq, F07_din, F07_dot, F07_emp, F07_full, F07_cnt);
  // MRE2 #(1, `MERGW) F08(CLK, frst, F08_enq, F08_deq, F08_din, F08_dot, F08_emp, F08_full, F08_cnt);
  // MRE2 #(1, `MERGW) F09(CLK, frst, F09_enq, F09_deq, F09_din, F09_dot, F09_emp, F09_full, F09_cnt);
  // MRE2 #(1, `MERGW) F10(CLK, frst, F10_enq, F10_deq, F10_din, F10_dot, F10_emp, F10_full, F10_cnt);
  // MRE2 #(1, `MERGW) F11(CLK, frst, F11_enq, F11_deq, F11_din, F11_dot, F11_emp, F11_full, F11_cnt);
  // MRE2 #(1, `MERGW) F12(CLK, frst, F12_enq, F12_deq, F12_din, F12_dot, F12_emp, F12_full, F12_cnt);
  // MRE2 #(1, `MERGW) F13(CLK, frst, F13_enq, F13_deq, F13_din, F13_dot, F13_emp, F13_full, F13_cnt);
  // MRE2 #(1, `MERGW) F14(CLK, frst, F14_enq, F14_deq, F14_din, F14_dot, F14_emp, F14_full, F14_cnt);
  // MRE2 #(1, `MERGW) F15(CLK, frst, F15_enq, F15_deq, F15_din, F15_dot, F15_emp, F15_full, F15_cnt);
  // MRE2 #(1, `MERGW) F16(CLK, frst, F16_enq, F16_deq, F16_din, F16_dot, F16_emp, F16_full, F16_cnt);
  // MRE2 #(1, `MERGW) F17(CLK, frst, F17_enq, F17_deq, F17_din, F17_dot, F17_emp, F17_full, F17_cnt);
  // MRE2 #(1, `MERGW) F18(CLK, frst, F18_enq, F18_deq, F18_din, F18_dot, F18_emp, F18_full, F18_cnt);
  // MRE2 #(1, `MERGW) F19(CLK, frst, F19_enq, F19_deq, F19_din, F19_dot, F19_emp, F19_full, F19_cnt);
  // MRE2 #(1, `MERGW) F20(CLK, frst, F20_enq, F20_deq, F20_din, F20_dot, F20_emp, F20_full, F20_cnt);
  // MRE2 #(1, `MERGW) F21(CLK, frst, F21_enq, F21_deq, F21_din, F21_dot, F21_emp, F21_full, F21_cnt);
  // MRE2 #(1, `MERGW) F22(CLK, frst, F22_enq, F22_deq, F22_din, F22_dot, F22_emp, F22_full, F22_cnt);
  // MRE2 #(1, `MERGW) F23(CLK, frst, F23_enq, F23_deq, F23_din, F23_dot, F23_emp, F23_full, F23_cnt);
  // MRE2 #(1, `MERGW) F24(CLK, frst, F24_enq, F24_deq, F24_din, F24_dot, F24_emp, F24_full, F24_cnt);
  // MRE2 #(1, `MERGW) F25(CLK, frst, F25_enq, F25_deq, F25_din, F25_dot, F25_emp, F25_full, F25_cnt);
  // MRE2 #(1, `MERGW) F26(CLK, frst, F26_enq, F26_deq, F26_din, F26_dot, F26_emp, F26_full, F26_cnt);
  // MRE2 #(1, `MERGW) F27(CLK, frst, F27_enq, F27_deq, F27_din, F27_dot, F27_emp, F27_full, F27_cnt);
  // MRE2 #(1, `MERGW) F28(CLK, frst, F28_enq, F28_deq, F28_din, F28_dot, F28_emp, F28_full, F28_cnt);
  // MRE2 #(1, `MERGW) F29(CLK, frst, F29_enq, F29_deq, F29_din, F29_dot, F29_emp, F29_full, F29_cnt);
  // MRE2 #(1, `MERGW) F30(CLK, frst, F30_enq, F30_deq, F30_din, F30_dot, F30_emp, F30_full, F30_cnt);
  // MRE2 #(1, `MERGW) F31(CLK, frst, F31_enq, F31_deq, F31_din, F31_dot, F31_emp, F31_full, F31_cnt);
  SCELL #(`SORTW, `M_LOG) S01(CLK, frst, !F02_emp, !F03_emp, F02_deq, F03_deq, F02_dot, F03_dot, F01_full, F01_din, F01_enq);
  SCELL #(`SORTW, `M_LOG) S02(CLK, frst, !F04_emp, !F05_emp, F04_deq, F05_deq, F04_dot, F05_dot, F02_full, F02_din, F02_enq);
  SCELL #(`SORTW, `M_LOG) S03(CLK, frst, !F06_emp, !F07_emp, F06_deq, F07_deq, F06_dot, F07_dot, F03_full, F03_din, F03_enq);
  SCELL #(`SORTW, `M_LOG) S04(CLK, frst, !F08_emp, !F09_emp, F08_deq, F09_deq, F08_dot, F09_dot, F04_full, F04_din, F04_enq);
  SCELL #(`SORTW, `M_LOG) S05(CLK, frst, !F10_emp, !F11_emp, F10_deq, F11_deq, F10_dot, F11_dot, F05_full, F05_din, F05_enq);
  SCELL #(`SORTW, `M_LOG) S06(CLK, frst, !F12_emp, !F13_emp, F12_deq, F13_deq, F12_dot, F13_dot, F06_full, F06_din, F06_enq);
  SCELL #(`SORTW, `M_LOG) S07(CLK, frst, !F14_emp, !F15_emp, F14_deq, F15_deq, F14_dot, F15_dot, F07_full, F07_din, F07_enq);
  // SCELL #(`SORTW, `M_LOG) S01(CLK, frst, !F02_emp, !F03_emp, F02_deq, F03_deq, F02_dot, F03_dot, F01_full, F01_din, F01_enq);
  // SCELL #(`SORTW, `M_LOG) S02(CLK, frst, !F04_emp, !F05_emp, F04_deq, F05_deq, F04_dot, F05_dot, F02_full, F02_din, F02_enq);
  // SCELL #(`SORTW, `M_LOG) S03(CLK, frst, !F06_emp, !F07_emp, F06_deq, F07_deq, F06_dot, F07_dot, F03_full, F03_din, F03_enq);
  // SCELL #(`SORTW, `M_LOG) S04(CLK, frst, !F08_emp, !F09_emp, F08_deq, F09_deq, F08_dot, F09_dot, F04_full, F04_din, F04_enq);
  // SCELL #(`SORTW, `M_LOG) S05(CLK, frst, !F10_emp, !F11_emp, F10_deq, F11_deq, F10_dot, F11_dot, F05_full, F05_din, F05_enq);
  // SCELL #(`SORTW, `M_LOG) S06(CLK, frst, !F12_emp, !F13_emp, F12_deq, F13_deq, F12_dot, F13_dot, F06_full, F06_din, F06_enq);
  // SCELL #(`SORTW, `M_LOG) S07(CLK, frst, !F14_emp, !F15_emp, F14_deq, F15_deq, F14_dot, F15_dot, F07_full, F07_din, F07_enq);
  // SCELL #(`SORTW, `M_LOG) S08(CLK, frst, !F16_emp, !F17_emp, F16_deq, F17_deq, F16_dot, F17_dot, F08_full, F08_din, F08_enq);
  // SCELL #(`SORTW, `M_LOG) S09(CLK, frst, !F18_emp, !F19_emp, F18_deq, F19_deq, F18_dot, F19_dot, F09_full, F09_din, F09_enq);
  // SCELL #(`SORTW, `M_LOG) S10(CLK, frst, !F20_emp, !F21_emp, F20_deq, F21_deq, F20_dot, F21_dot, F10_full, F10_din, F10_enq);
  // SCELL #(`SORTW, `M_LOG) S11(CLK, frst, !F22_emp, !F23_emp, F22_deq, F23_deq, F22_dot, F23_dot, F11_full, F11_din, F11_enq);
  // SCELL #(`SORTW, `M_LOG) S12(CLK, frst, !F24_emp, !F25_emp, F24_deq, F25_deq, F24_dot, F25_dot, F12_full, F12_din, F12_enq);
  // SCELL #(`SORTW, `M_LOG) S13(CLK, frst, !F26_emp, !F27_emp, F26_deq, F27_deq, F26_dot, F27_dot, F13_full, F13_din, F13_enq);
  // SCELL #(`SORTW, `M_LOG) S14(CLK, frst, !F28_emp, !F29_emp, F28_deq, F29_deq, F28_dot, F29_dot, F14_full, F14_din, F14_enq);
  // SCELL #(`SORTW, `M_LOG) S15(CLK, frst, !F30_emp, !F31_emp, F30_deq, F31_deq, F30_dot, F31_dot, F15_full, F15_din, F15_enq);
  assign F01_deq = deq;
  assign dot = F01_dot;
  assign emp = F01_emp;
endmodule