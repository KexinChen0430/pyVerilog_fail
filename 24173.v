module srdhm(clk, input__valid, input__payload__a, input__payload__b, output__ready, output__valid, output__payload, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *)
  wire [32:0] \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:75" *)
  wire [63:0] \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:75" *)
  wire [63:0] \$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:78" *)
  wire \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *)
  wire [63:0] \$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *)
  wire [62:0] \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *)
  wire [30:0] \$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [32:0] \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *)
  wire [63:0] \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:82" *)
  wire [32:0] \$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:80" *)
  wire [32:0] \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:82" *)
  wire [32:0] \$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:82" *)
  wire [32:0] \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *)
  wire [32:0] \$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *)
  wire [32:0] \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *)
  wire \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:80" *)
  wire [31:0] high_bits;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [31:0] input__payload__a;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [31:0] input__payload__b;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire input__ready;
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
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:67" *)
  reg [31:0] reg_a = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:67" *)
  reg [31:0] \reg_a$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:74" *)
  reg [62:0] reg_ab = 63'h0000000000000000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:74" *)
  reg [62:0] \reg_ab$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:68" *)
  reg [31:0] reg_b = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:68" *)
  reg [31:0] \reg_b$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [2:0] sr = 3'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [1:0] \sr$13  = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [1:0] \sr$13$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg [2:0] \sr$next ;
  assign \$11  = $signed(reg_a) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:75" *) $signed(reg_b);
  assign \$14  = $signed(input__payload__a) >= (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:78" *) $signed(32'd0);
  assign \$18  = \sr$13 [1] ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *) 31'h40000000 : 31'h3fffffff;
  assign \$17  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *) \$18 ;
  assign \$21  = $signed(reg_ab) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:79" *) $signed(\$17 );
  assign \$24  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:80" *) $signed(high_bits);
  assign \$26  = - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:82" *) $signed(high_bits);
  assign \$28  = \sr$13 [1] ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:82" *) \$24  : \$26 ;
  assign \$2  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *) $signed(input__payload__a);
  assign \$4  = - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *) $signed(input__payload__a);
  assign \$7  = $signed(input__payload__a) >= (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *) $signed(32'd0);
  assign \$6  = \$7  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:69" *) \$2  : \$4 ;
  always @(posedge clk)
    output__payload <= \output__payload$next ;
  always @(posedge clk)
    \sr$13  <= \sr$13$next ;
  always @(posedge clk)
    reg_ab <= \reg_ab$next ;
  always @(posedge clk)
    reg_b <= \reg_b$next ;
  always @(posedge clk)
    reg_a <= \reg_a$next ;
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
    \reg_a$next  = \$6 [31:0];
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \reg_a$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \reg_b$next  = input__payload__b;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \reg_b$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \reg_ab$next  = \$11 [62:0];
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \reg_ab$next  = 63'h0000000000000000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \sr$13$next  = { \sr$13 [0], \$14  };
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \sr$13$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \output__payload$next  = \$28 [31:0];
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \output__payload$next  = 32'd0;
    endcase
  end
  assign \$1  = \$6 ;
  assign \$10  = \$11 ;
  assign \$16  = \$21 ;
  assign \$23  = \$28 ;
  assign high_bits = \$21 [62:31];
  assign output__valid = sr[2];
  assign input__ready = output__ready;
endmodule