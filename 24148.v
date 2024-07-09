module operands_buffer(payload, ready, \valid$1 , \payload$2 , \ready$3 , output__valid, output__payload__inputs, output__payload__filters, output__ready, rst, clk, valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *)
  wire \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *)
  wire \$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$31 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *)
  wire \$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:140" *)
  wire [127:0] \$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *)
  wire \$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$47 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$50 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$52 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$56 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$57 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:140" *)
  wire [127:0] \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
  wire \$60 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$62 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:148" *)
  wire \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:146" *)
  wire [1:0] \$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:133" *)
  reg [127:0] buffered_filters = 128'h00000000000000000000000000000000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:133" *)
  reg [127:0] \buffered_filters$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:133" *)
  reg [127:0] buffered_inputs = 128'h00000000000000000000000000000000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:133" *)
  reg [127:0] \buffered_inputs$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:129" *)
  reg buffering_filters = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:129" *)
  reg \buffering_filters$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:129" *)
  reg buffering_inputs = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:129" *)
  reg \buffering_inputs$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  output [127:0] output__payload__filters;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  output [127:0] output__payload__inputs;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:123" *)
  output output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  input [127:0] payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  input [127:0] \payload$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  output ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  output \ready$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:124" *)
  wire reset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  input valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:122" *)
  input \valid$1 ;
  assign \$9  = { \valid$1 , valid } | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:146" *) { buffering_filters, buffering_inputs };
  assign \$8  = & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:148" *) \$9 ;
  assign \$12  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *) buffering_inputs;
  assign \$14  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$16  = \$12  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *) \$14 ;
  assign \$18  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) buffering_inputs;
  assign \$21  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$20  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$21 ;
  assign \$24  = \$18  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$20 ;
  assign \$26  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$28  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) buffering_inputs;
  assign \$31  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$30  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$31 ;
  assign \$34  = \$28  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$30 ;
  assign \$36  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$38  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *) buffering_filters;
  assign \$40  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$42  = \$38  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:153" *) \$40 ;
  assign \$44  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) buffering_filters;
  assign \$47  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$46  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$47 ;
  assign \$4  = buffering_inputs ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:140" *) buffered_inputs : payload;
  assign \$50  = \$44  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$46 ;
  assign \$52  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$54  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) buffering_filters;
  assign \$57  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$56  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$57 ;
  assign \$60  = \$54  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *) \$56 ;
  assign \$62  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$6  = buffering_filters ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:140" *) buffered_filters : \payload$2 ;
  always @(posedge clk)
    buffered_filters <= \buffered_filters$next ;
  always @(posedge clk)
    buffering_filters <= \buffering_filters$next ;
  always @(posedge clk)
    buffered_inputs <= \buffered_inputs$next ;
  always @(posedge clk)
    buffering_inputs <= \buffering_inputs$next ;
  always @* begin
    if (\initial ) begin end
    \buffering_inputs$next  = buffering_inputs;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" *)
    casez (valid)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
          casez (\$24 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" */
            1'h1:
                \buffering_inputs$next  = 1'h1;
          endcase
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:164" */
      default:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:165" *)
          casez (\$26 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:165" */
            1'h1:
                \buffering_inputs$next  = 1'h0;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" */
      1'h1:
          \buffering_inputs$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \buffering_inputs$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \buffered_inputs$next  = buffered_inputs;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" *)
    casez (valid)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" */
      1'h1:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
          casez (\$34 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" */
            1'h1:
                \buffered_inputs$next  = payload;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:162" *)
          casez (\$36 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:162" */
            1'h1:
                \buffered_inputs$next  = payload;
          endcase
        end
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" */
      1'h1:
          \buffered_inputs$next  = 128'h00000000000000000000000000000000;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \buffered_inputs$next  = 128'h00000000000000000000000000000000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \buffering_filters$next  = buffering_filters;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" *)
    casez (\valid$1 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
          casez (\$50 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" */
            1'h1:
                \buffering_filters$next  = 1'h1;
          endcase
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:164" */
      default:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:165" *)
          casez (\$52 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:165" */
            1'h1:
                \buffering_filters$next  = 1'h0;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" */
      1'h1:
          \buffering_filters$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \buffering_filters$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \buffered_filters$next  = buffered_filters;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" *)
    casez (\valid$1 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:156" */
      1'h1:
        begin
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" *)
          casez (\$60 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:158" */
            1'h1:
                \buffered_filters$next  = \payload$2 ;
          endcase
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:162" *)
          casez (\$62 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:162" */
            1'h1:
                \buffered_filters$next  = \payload$2 ;
          endcase
        end
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" *)
    casez (reset)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/buffer.py:169" */
      1'h1:
          \buffered_filters$next  = 128'h00000000000000000000000000000000;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \buffered_filters$next  = 128'h00000000000000000000000000000000;
    endcase
  end
  assign reset = 1'h0;
  assign \ready$3  = \$42 ;
  assign ready = \$16 ;
  assign output__valid = \$8 ;
  assign output__payload__filters = \$6 ;
  assign output__payload__inputs = \$4 ;
endmodule