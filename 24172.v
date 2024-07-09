module set(payload, ready, \valid$1 , \payload$2 , \ready$3 , \valid$4 , \payload$5 , \ready$6 , \valid$7 , \payload$8 , \ready$9 , \valid$10 , \payload$11 , \ready$12 , \$signal , \payload$13 , \valid$14 , \ready$15 , \$signal$16 , \$signal$17 , \$signal$18
, \$signal$19 , \$signal$20 , \$signal$21 , \$signal$22 , \$signal$23 , done, start, in0, in1, funct7, rst, clk, valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  output \$signal$19 ;
  reg \$signal$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  output \$signal$20 ;
  reg \$signal$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  output [31:0] \$signal$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$31 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$33 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$35 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$39 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$43 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$47 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$49 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$50 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$51 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:102" *)
  wire [31:0] \$signal$55 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$59 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:103" *)
  reg \$signal$63 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  output done;
  reg done = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  reg \done$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  input [6:0] funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  input [31:0] in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:54" *)
  wire [31:0] in0s;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  input [31:0] in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:55" *)
  wire [31:0] in1s;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] \payload$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] \payload$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] \payload$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$29 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$37 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$41 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$45 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] \payload$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$53 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$57 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$61 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire [31:0] \payload$65 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output [31:0] \payload$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input \ready$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input \ready$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input \ready$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$58 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input \ready$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$62 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \ready$66 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  input \ready$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_01_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_01_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_01_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_01_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_01_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_02_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_02_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_02_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_02_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_02_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_03_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_03_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_03_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_03_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_03_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_04_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_04_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_04_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_04_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_04_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_05_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_05_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_05_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_05_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_05_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_06_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_06_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_06_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_06_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_06_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_07_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_07_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_07_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_07_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_07_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_08_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_08_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_08_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_08_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_08_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_1f_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_1f_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_1f_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_1f_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_1f_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_40_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_40_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_40_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_40_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_40_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_41_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_41_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_41_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_41_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_41_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_42_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_42_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_42_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_42_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_42_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_43_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_43_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_43_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_43_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_43_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:49" *)
  reg reg_70_new_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:50" *)
  reg [31:0] reg_70_new_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire [31:0] reg_70_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_70_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:47" *)
  wire reg_70_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  input start;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output \valid$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output \valid$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output \valid$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output \valid$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  wire \valid$64 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:100" *)
  output \valid$7 ;
  always @(posedge clk)
    done <= \done$next ;
  reg_01 reg_01 (
    .clk(clk),
    .new_en(reg_01_new_en),
    .new_value(reg_01_new_value),
    .output__payload(reg_01_output__payload),
    .output__ready(reg_01_output__ready),
    .output__valid(reg_01_output__valid),
    .rst(rst)
  );
  reg_02 reg_02 (
    .clk(clk),
    .new_en(reg_02_new_en),
    .new_value(reg_02_new_value),
    .output__payload(reg_02_output__payload),
    .output__ready(reg_02_output__ready),
    .output__valid(reg_02_output__valid),
    .rst(rst)
  );
  reg_03 reg_03 (
    .clk(clk),
    .new_en(reg_03_new_en),
    .new_value(reg_03_new_value),
    .output__payload(reg_03_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_03_output__valid),
    .rst(rst)
  );
  reg_04 reg_04 (
    .clk(clk),
    .new_en(reg_04_new_en),
    .new_value(reg_04_new_value),
    .output__payload(reg_04_output__payload),
    .output__ready(reg_04_output__ready),
    .output__valid(reg_04_output__valid),
    .rst(rst)
  );
  reg_05 reg_05 (
    .clk(clk),
    .new_en(reg_05_new_en),
    .new_value(reg_05_new_value),
    .output__payload(reg_05_output__payload),
    .output__ready(reg_05_output__ready),
    .output__valid(reg_05_output__valid),
    .rst(rst)
  );
  reg_06 reg_06 (
    .clk(clk),
    .new_en(reg_06_new_en),
    .new_value(reg_06_new_value),
    .output__payload(reg_06_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_06_output__valid),
    .rst(rst)
  );
  reg_07 reg_07 (
    .clk(clk),
    .new_en(reg_07_new_en),
    .new_value(reg_07_new_value),
    .output__payload(reg_07_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_07_output__valid),
    .rst(rst)
  );
  reg_08 reg_08 (
    .clk(clk),
    .new_en(reg_08_new_en),
    .new_value(reg_08_new_value),
    .output__payload(reg_08_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_08_output__valid),
    .rst(rst)
  );
  reg_1f reg_1f (
    .clk(clk),
    .new_en(reg_1f_new_en),
    .new_value(reg_1f_new_value),
    .output__payload(reg_1f_output__payload),
    .output__ready(reg_1f_output__ready),
    .output__valid(reg_1f_output__valid),
    .rst(rst)
  );
  reg_40 reg_40 (
    .clk(clk),
    .new_en(reg_40_new_en),
    .new_value(reg_40_new_value),
    .output__payload(reg_40_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_40_output__valid),
    .rst(rst)
  );
  reg_41 reg_41 (
    .clk(clk),
    .new_en(reg_41_new_en),
    .new_value(reg_41_new_value),
    .output__payload(reg_41_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_41_output__valid),
    .rst(rst)
  );
  reg_42 reg_42 (
    .clk(clk),
    .new_en(reg_42_new_en),
    .new_value(reg_42_new_value),
    .output__payload(reg_42_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_42_output__valid),
    .rst(rst)
  );
  reg_43 reg_43 (
    .clk(clk),
    .new_en(reg_43_new_en),
    .new_value(reg_43_new_value),
    .output__payload(reg_43_output__payload),
    .output__ready(1'h0),
    .output__valid(reg_43_output__valid),
    .rst(rst)
  );
  reg_70 reg_70 (
    .clk(clk),
    .new_en(reg_70_new_en),
    .new_value(reg_70_new_value),
    .output__payload(reg_70_output__payload),
    .output__ready(reg_70_output__ready),
    .output__valid(reg_70_output__valid),
    .rst(rst)
  );
  always @* begin
    if (\initial ) begin end
    \$signal$31  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                \$signal$31  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$33  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                \$signal$33  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$35  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                \$signal$35  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$39  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                \$signal$39  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$43  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                \$signal$43  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$47  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                \$signal$47  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$25  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                \$signal$25  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$49  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                \$signal$49  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$51  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                \$signal$51  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$20  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                \$signal$20  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$59  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                \$signal$59  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$63  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                \$signal$63  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$19  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h43:
                \$signal$19  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          \done$next  = 1'h1;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:122" */
      default:
          \done$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \done$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_01_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                reg_01_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_01_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                reg_01_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_02_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                reg_02_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_02_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                reg_02_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_03_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                reg_03_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_03_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                reg_03_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_04_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                reg_04_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_04_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                reg_04_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_05_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                reg_05_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_05_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                reg_05_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_06_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                reg_06_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_06_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                reg_06_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_07_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                reg_07_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_07_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                reg_07_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_08_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                reg_08_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_08_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                reg_08_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_1f_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                reg_1f_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_1f_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                reg_1f_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_70_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                reg_70_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \$signal$27  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                \$signal$27  = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_70_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                reg_70_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_40_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                reg_40_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_40_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                reg_40_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_41_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                reg_41_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_41_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                reg_41_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_42_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                reg_42_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_42_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                reg_42_new_value = in0;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_43_new_en = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h43:
                reg_43_new_en = 1'h1;
          endcase
    endcase
  end
  always @* begin
    if (\initial ) begin end
    reg_43_new_value = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:113" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:116" *)
          casez (funct7)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h01:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h02:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h03:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h04:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h05:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h06:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h07:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h08:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h1f:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h70:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h40:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h41:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h42:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/set.py:118" */
            7'h43:
                reg_43_new_value = in0;
          endcase
    endcase
  end
  assign \ready$30  = 1'h0;
  assign \ready$38  = 1'h0;
  assign \ready$42  = 1'h0;
  assign \ready$46  = 1'h0;
  assign \ready$54  = 1'h0;
  assign \ready$58  = 1'h0;
  assign \ready$62  = 1'h0;
  assign \ready$66  = 1'h0;
  assign in1s = in1;
  assign in0s = in0;
  assign \$signal$18  = reg_43_output__payload;
  assign reg_43_output__ready = 1'h0;
  assign \payload$65  = reg_43_output__payload;
  assign \valid$64  = reg_43_output__valid;
  assign \$signal$17  = reg_42_output__payload;
  assign reg_42_output__ready = 1'h0;
  assign \payload$61  = reg_42_output__payload;
  assign \valid$60  = reg_42_output__valid;
  assign \$signal$16  = reg_41_output__payload;
  assign reg_41_output__ready = 1'h0;
  assign \payload$57  = reg_41_output__payload;
  assign \valid$56  = reg_41_output__valid;
  assign \$signal$55  = reg_40_output__payload;
  assign reg_40_output__ready = 1'h0;
  assign \payload$53  = reg_40_output__payload;
  assign \valid$52  = reg_40_output__valid;
  assign \$signal$50  = reg_70_output__payload;
  assign reg_70_output__ready = ready;
  assign payload = reg_70_output__payload;
  assign valid = reg_70_output__valid;
  assign \$signal$48  = reg_1f_output__payload;
  assign reg_1f_output__ready = \ready$15 ;
  assign \payload$13  = reg_1f_output__payload;
  assign \valid$14  = reg_1f_output__valid;
  assign \$signal$23  = reg_08_output__payload;
  assign reg_08_output__ready = 1'h0;
  assign \payload$45  = reg_08_output__payload;
  assign \valid$44  = reg_08_output__valid;
  assign \$signal$22  = reg_07_output__payload;
  assign reg_07_output__ready = 1'h0;
  assign \payload$41  = reg_07_output__payload;
  assign \valid$40  = reg_07_output__valid;
  assign \$signal$21  = reg_06_output__payload;
  assign reg_06_output__ready = 1'h0;
  assign \payload$37  = reg_06_output__payload;
  assign \valid$36  = reg_06_output__valid;
  assign \$signal$34  = reg_05_output__payload;
  assign reg_05_output__ready = \ready$6 ;
  assign \payload$5  = reg_05_output__payload;
  assign \valid$4  = reg_05_output__valid;
  assign \$signal$32  = reg_04_output__payload;
  assign reg_04_output__ready = \ready$12 ;
  assign \payload$11  = reg_04_output__payload;
  assign \valid$10  = reg_04_output__valid;
  assign \$signal  = reg_03_output__payload;
  assign reg_03_output__ready = 1'h0;
  assign \payload$29  = reg_03_output__payload;
  assign \valid$28  = reg_03_output__valid;
  assign \$signal$26  = reg_02_output__payload;
  assign reg_02_output__ready = \ready$3 ;
  assign \payload$2  = reg_02_output__payload;
  assign \valid$1  = reg_02_output__valid;
  assign \$signal$24  = reg_01_output__payload;
  assign reg_01_output__ready = \ready$9 ;
  assign \payload$8  = reg_01_output__payload;
  assign \valid$7  = reg_01_output__valid;
endmodule