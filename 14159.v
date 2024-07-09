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
  INBUF IN08(CLK, RST, full[0], F08_full, F08_enq, d00, F08_din, enq[0], phase, irst);
  INBUF IN09(CLK, RST, full[1], F09_full, F09_enq, d01, F09_din, enq[1], phase, irst);
  INBUF IN10(CLK, RST, full[2], F10_full, F10_enq, d02, F10_din, enq[2], phase, irst);
  INBUF IN11(CLK, RST, full[3], F11_full, F11_enq, d03, F11_din, enq[3], phase, irst);
  INBUF IN12(CLK, RST, full[4], F12_full, F12_enq, d04, F12_din, enq[4], phase, irst);
  INBUF IN13(CLK, RST, full[5], F13_full, F13_enq, d05, F13_din, enq[5], phase, irst);
  INBUF IN14(CLK, RST, full[6], F14_full, F14_enq, d06, F14_din, enq[6], phase, irst);
  INBUF IN15(CLK, RST, full[7], F15_full, F15_enq, d07, F15_din, enq[7], phase, irst);
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
  SCELL #(`SORTW, `M_LOG) S01(CLK, frst, !F02_emp, !F03_emp, F02_deq, F03_deq, F02_dot, F03_dot, F01_full, F01_din, F01_enq);
  SCELL #(`SORTW, `M_LOG) S02(CLK, frst, !F04_emp, !F05_emp, F04_deq, F05_deq, F04_dot, F05_dot, F02_full, F02_din, F02_enq);
  SCELL #(`SORTW, `M_LOG) S03(CLK, frst, !F06_emp, !F07_emp, F06_deq, F07_deq, F06_dot, F07_dot, F03_full, F03_din, F03_enq);
  SCELL #(`SORTW, `M_LOG) S04(CLK, frst, !F08_emp, !F09_emp, F08_deq, F09_deq, F08_dot, F09_dot, F04_full, F04_din, F04_enq);
  SCELL #(`SORTW, `M_LOG) S05(CLK, frst, !F10_emp, !F11_emp, F10_deq, F11_deq, F10_dot, F11_dot, F05_full, F05_din, F05_enq);
  SCELL #(`SORTW, `M_LOG) S06(CLK, frst, !F12_emp, !F13_emp, F12_deq, F13_deq, F12_dot, F13_dot, F06_full, F06_din, F06_enq);
  SCELL #(`SORTW, `M_LOG) S07(CLK, frst, !F14_emp, !F15_emp, F14_deq, F15_deq, F14_dot, F15_dot, F07_full, F07_din, F07_enq);
  assign F01_deq = deq;
  assign dot = F01_dot;
  assign emp = F01_emp;
endmodule