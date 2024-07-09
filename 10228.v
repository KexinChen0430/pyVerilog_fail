module STREE(input  wire                        CLK,
             input  wire                        RST_in,
             input  wire                        irst,
             input  wire                        frst,
             input  wire [`PHASE_W]             phase_in,
             input  wire [`SORTW*`SORT_WAY-1:0] s_din,     // sorting-tree input data
             input  wire [`SORT_WAY-1:0]        enq,       // enqueue
             output wire [`SORT_WAY-1:0]        full,      // buffer is full ?
             input  wire                        deq,       // dequeue
             output wire [`SORTW-1:0]           dot,       // output data
             output wire                        emp);
  reg RST;
  always @(posedge CLK) RST <= RST_in;
  reg [`PHASE_W] phase;
  always @(posedge CLK) phase <= phase_in;
  wire [`SORTW-1:0] d00, d01, d02, d03;
  assign {d00, d01, d02, d03} = s_din;
  wire F01_enq, F01_deq, F01_emp, F01_full; wire [31:0] F01_din, F01_dot; wire [1:0] F01_cnt;
  wire F02_enq, F02_deq, F02_emp, F02_full; wire [31:0] F02_din, F02_dot; wire [1:0] F02_cnt;
  wire F03_enq, F03_deq, F03_emp, F03_full; wire [31:0] F03_din, F03_dot; wire [1:0] F03_cnt;
  wire F04_enq, F04_deq, F04_emp, F04_full; wire [31:0] F04_din, F04_dot; wire [1:0] F04_cnt;
  wire F05_enq, F05_deq, F05_emp, F05_full; wire [31:0] F05_din, F05_dot; wire [1:0] F05_cnt;
  wire F06_enq, F06_deq, F06_emp, F06_full; wire [31:0] F06_din, F06_dot; wire [1:0] F06_cnt;
  wire F07_enq, F07_deq, F07_emp, F07_full; wire [31:0] F07_din, F07_dot; wire [1:0] F07_cnt;
  INBUF IN04(CLK, RST, full[0], F04_full, F04_enq, d00, F04_din, enq[0], phase, irst);
  INBUF IN05(CLK, RST, full[1], F05_full, F05_enq, d01, F05_din, enq[1], phase, irst);
  INBUF IN06(CLK, RST, full[2], F06_full, F06_enq, d02, F06_din, enq[2], phase, irst);
  INBUF IN07(CLK, RST, full[3], F07_full, F07_enq, d03, F07_din, enq[3], phase, irst);
  MRE2 #(1,32) F01(CLK, frst, F01_enq, F01_deq, F01_din, F01_dot, F01_emp, F01_full, F01_cnt);
  MRE2 #(1,32) F02(CLK, frst, F02_enq, F02_deq, F02_din, F02_dot, F02_emp, F02_full, F02_cnt);
  MRE2 #(1,32) F03(CLK, frst, F03_enq, F03_deq, F03_din, F03_dot, F03_emp, F03_full, F03_cnt);
  MRE2 #(1,32) F04(CLK, frst, F04_enq, F04_deq, F04_din, F04_dot, F04_emp, F04_full, F04_cnt);
  MRE2 #(1,32) F05(CLK, frst, F05_enq, F05_deq, F05_din, F05_dot, F05_emp, F05_full, F05_cnt);
  MRE2 #(1,32) F06(CLK, frst, F06_enq, F06_deq, F06_din, F06_dot, F06_emp, F06_full, F06_cnt);
  MRE2 #(1,32) F07(CLK, frst, F07_enq, F07_deq, F07_din, F07_dot, F07_emp, F07_full, F07_cnt);
  SCELL S01(!F02_emp, !F03_emp, F02_deq, F03_deq, F02_dot, F03_dot, F01_full, F01_din, F01_enq);
  SCELL S02(!F04_emp, !F05_emp, F04_deq, F05_deq, F04_dot, F05_dot, F02_full, F02_din, F02_enq);
  SCELL S03(!F06_emp, !F07_emp, F06_deq, F07_deq, F06_dot, F07_dot, F03_full, F03_din, F03_enq);
  assign F01_deq = deq;
  assign dot = F01_dot;
  assign emp = F01_emp;
endmodule