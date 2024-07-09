module rdbpot(clk, input__ready, input__valid, input__payload__dividend, input__payload__shift, output__valid, output__payload, output__ready, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$101 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$103 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$105 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$107 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *)
  wire [32:0] \$109 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *)
  wire [31:0] \$110 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *)
  wire \$111 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *)
  wire \$112 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *)
  wire [32:0] \$116 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [2:0] \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$29 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [3:0] \$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$35 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$37 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [4:0] \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$43 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$45 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [5:0] \$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$51 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$53 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [6:0] \$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$59 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$61 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [7:0] \$64 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$67 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$68 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$69 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [8:0] \$72 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$75 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$76 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$77 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [9:0] \$80 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [31:0] \$83 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$84 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *)
  wire \$85 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *)
  wire [10:0] \$88 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *)
  wire [31:0] \$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$91 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$93 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$95 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$97 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:131" *)
  wire [31:0] \$99 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:113" *)
  reg [31:0] dividend = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:113" *)
  reg [31:0] \dividend$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [31:0] input__payload__dividend;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [3:0] input__payload__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  output input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output [31:0] output__payload;
  reg [31:0] output__payload = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  reg [31:0] \output__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:122" *)
  reg [31:0] quotient;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:120" *)
  reg [31:0] remainder;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:119" *)
  reg [31:0] result = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:119" *)
  reg [31:0] \result$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:114" *)
  reg [3:0] shift = 4'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:114" *)
  reg [3:0] \shift$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [2:0] sr = 3'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [2:0] \sr$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:121" *)
  reg [31:0] threshold;
  assign \$9  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd127);
  assign \$112  = $signed(remainder) > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *) $signed(threshold);
  assign \$111  = \$112  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *) 1'h1 : 1'h0;
  assign \$110  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *) \$111 ;
  assign \$116  = $signed(quotient) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:132" *) $signed(\$110 );
  assign \$11  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd255);
  assign \$13  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd511);
  assign \$15  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd1023);
  assign \$17  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd2047);
  assign \$1  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd7);
  assign \$21  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$20  = \$21  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$24  = 2'h3 + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$20 ;
  assign \$19  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$24 ;
  assign \$29  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$28  = \$29  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$32  = 3'h7 + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$28 ;
  assign \$27  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$32 ;
  assign \$37  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$36  = \$37  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$3  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd15);
  assign \$40  = 4'hf + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$36 ;
  assign \$35  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$40 ;
  assign \$45  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$44  = \$45  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$48  = 5'h1f + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$44 ;
  assign \$43  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$48 ;
  assign \$53  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$52  = \$53  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$56  = 6'h3f + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$52 ;
  assign \$51  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$56 ;
  assign \$5  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd31);
  assign \$61  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$60  = \$61  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$64  = 7'h7f + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$60 ;
  assign \$59  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$64 ;
  assign \$69  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$68  = \$69  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$72  = 8'hff + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$68 ;
  assign \$67  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$72 ;
  assign \$77  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$76  = \$77  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$7  = $signed(dividend) & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:128" *) $signed(32'd63);
  assign \$80  = 9'h1ff + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$76 ;
  assign \$75  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$80 ;
  assign \$85  = $signed(dividend) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) $signed(32'd0);
  assign \$84  = \$85  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:130" *) 1'h1 : 1'h0;
  assign \$88  = 10'h3ff + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$84 ;
  assign \$83  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:129" *) \$88 ;
  always @(posedge clk)
    output__payload <= \output__payload$next ;
  always @(posedge clk)
    result <= \result$next ;
  always @(posedge clk)
    shift <= \shift$next ;
  always @(posedge clk)
    dividend <= \dividend$next ;
  always @(posedge clk)
    sr <= \sr$next ;
  always @* begin
    if (\initial ) begin end
    \sr$next  = { sr[1:0], input__valid };
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \sr$next  = 3'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \dividend$next  = input__payload__dividend;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \dividend$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \shift$next  = input__payload__shift;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \shift$next  = 4'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    remainder = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:124" *)
    casez (shift)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h3:
          remainder = \$1 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h4:
          remainder = \$3 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h5:
          remainder = \$5 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h6:
          remainder = \$7 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h7:
          remainder = \$9 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h8:
          remainder = \$11 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h9:
          remainder = \$13 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'ha:
          remainder = \$15 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'hb:
          remainder = \$17 ;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    threshold = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:124" *)
    casez (shift)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h3:
          threshold = \$19 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h4:
          threshold = \$27 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h5:
          threshold = \$35 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h6:
          threshold = \$43 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h7:
          threshold = \$51 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h8:
          threshold = \$59 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h9:
          threshold = \$67 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'ha:
          threshold = \$75 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'hb:
          threshold = \$83 ;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    quotient = 32'd0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:124" *)
    casez (shift)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h3:
          quotient = \$91 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h4:
          quotient = \$93 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h5:
          quotient = \$95 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h6:
          quotient = \$97 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h7:
          quotient = \$99 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h8:
          quotient = \$101 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'h9:
          quotient = \$103 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'ha:
          quotient = \$105 ;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:126" */
      4'hb:
          quotient = \$107 ;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \result$next  = \$116 [31:0];
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \result$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \output__payload$next  = result;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \output__payload$next  = 32'd0;
    endcase
  end
  assign \$109  = \$116 ;
  assign output__valid = sr[2];
  assign input__ready = output__ready;
  assign \$91  = { dividend[31], dividend[31], dividend[31], dividend[31:3] };
  assign \$95  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:5] };
  assign \$93  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:4] };
  assign \$97  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:6] };
  assign \$101  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:8] };
  assign \$105  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:10] };
  assign \$103  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:9] };
  assign \$107  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:11] };
  assign \$99  = { dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31], dividend[31:7] };
endmodule