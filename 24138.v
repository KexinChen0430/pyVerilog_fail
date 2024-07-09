module filter_flow_restrictor(input__payload, input__ready, release__payload, release__valid, output__valid, output__payload, output__ready, rst, clk, input__valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:61" *)
  wire [32:0] \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
  wire \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:61" *)
  wire [32:0] \$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [127:0] input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  output input__ready;
  reg input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output [127:0] output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output output__valid;
  reg output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  input [31:0] release__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  reg release__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:53" *)
  input release__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:56" *)
  reg [31:0] release_counter = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:56" *)
  reg [31:0] \release_counter$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  assign \$10  = release_counter - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:61" *) 1'h1;
  assign \$12  = release__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) release__ready;
  assign \$14  = release_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *) 1'h0;
  assign \$1  = release_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *) 1'h0;
  assign \$3  = release_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *) 1'h0;
  assign \$5  = release_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *) 1'h0;
  assign \$7  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  always @(posedge clk)
    release_counter <= \release_counter$next ;
  always @* begin
    if (\initial ) begin end
    input__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
    casez (\$1 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" */
      1'h1:
          input__ready = output__ready;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    output__valid = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
    casez (\$3 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" */
      1'h1:
          output__valid = input__valid;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \release_counter$next  = release_counter;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
    casez (\$5 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:60" *)
          casez (\$7 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:60" */
            1'h1:
                \release_counter$next  = \$10 [31:0];
          endcase
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:62" */
      default:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:64" *)
          casez (\$12 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:64" */
            1'h1:
                \release_counter$next  = release__payload;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \release_counter$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    release__ready = 1'h0;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" *)
    casez (\$14 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:57" */
      1'h1:
          /* empty */;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/flow.py:62" */
      default:
          release__ready = 1'h1;
    endcase
  end
  assign \$9  = \$10 ;
  assign output__payload = input__payload;
endmodule