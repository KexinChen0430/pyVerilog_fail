module \reg_70$1 (clk, input__valid, input__payload, input__ready, invalidate, valid, value, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  input [31:0] input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  output input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:64" *)
  input invalidate;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:65" *)
  output valid;
  reg valid = 1'h1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:65" *)
  reg \valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:66" *)
  output [31:0] value;
  reg [31:0] value = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:66" *)
  reg [31:0] \value$next ;
  always @(posedge clk)
    value <= \value$next ;
  always @(posedge clk)
    valid <= \valid$next ;
  always @* begin
    if (\initial ) begin end
    \valid$next  = valid;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:73" *)
    casez (invalidate)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:73" */
      1'h1:
          \valid$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:75" *)
    casez (\$1 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:75" */
      1'h1:
          \valid$next  = 1'h1;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \valid$next  = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \value$next  = value;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:75" *)
    casez (\$3 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:75" */
      1'h1:
          \value$next  = input__payload;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \value$next  = 32'd0;
    endcase
  end
  assign input__ready = 1'h1;
  assign \$1  = input__valid;
  assign \$3  = input__valid;
endmodule