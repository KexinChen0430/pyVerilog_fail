module result_accumulator(results__payload, results__ready, num_results__payload, num_results__valid, accumulated__valid, accumulated__payload, accumulated__ready, rst, clk, results__valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *)
  wire \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:97" *)
  wire [32:0] \$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:97" *)
  wire [32:0] \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:100" *)
  wire [32:0] \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:100" *)
  wire [32:0] \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  output [31:0] accumulated__payload;
  reg [31:0] accumulated__payload = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  reg [31:0] \accumulated__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  input accumulated__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  output accumulated__valid;
  reg accumulated__valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:83" *)
  reg \accumulated__valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:87" *)
  reg [31:0] accumulator = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:87" *)
  reg [31:0] \accumulator$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
  reg [1:0] \fsm_state$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:81" *)
  input [31:0] num_results__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:81" *)
  reg num_results__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:81" *)
  input num_results__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  input [31:0] results__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  output results__ready;
  reg results__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:82" *)
  input results__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:86" *)
  reg [31:0] results_counter = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:86" *)
  reg [31:0] \results_counter$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  assign \$10  = num_results__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_results__ready;
  assign \$12  = results__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) results__ready;
  assign \$14  = results_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *) 1'h1;
  assign \$16  = accumulated__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) accumulated__ready;
  assign \$18  = results__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) results__ready;
  assign \$1  = num_results__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) num_results__ready;
  assign \$21  = $signed(accumulator) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:97" *) $signed(results__payload);
  assign \$23  = accumulated__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) accumulated__ready;
  assign \$3  = results__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) results__ready;
  assign \$5  = results_counter > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *) 1'h1;
  assign \$8  = results_counter - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:100" *) 1'h1;
  always @(posedge clk)
    accumulated__valid <= \accumulated__valid$next ;
  always @(posedge clk)
    accumulated__payload <= \accumulated__payload$next ;
  always @(posedge clk)
    accumulator <= \accumulator$next ;
  always @(posedge clk)
    fsm_state <= \fsm_state$next ;
  always @(posedge clk)
    results_counter <= \results_counter$next ;
  always @* begin
    if (\initial ) begin end
    num_results__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          num_results__ready = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \results_counter$next  = results_counter;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:91" *)
          casez (\$1 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:91" */
            1'h1:
                \results_counter$next  = num_results__payload;
          endcase
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" *)
          casez (\$3 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *)
                casez (\$5 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" */
                  1'h1:
                      \results_counter$next  = \$8 [31:0];
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:101" */
                  default:
                      \results_counter$next  = 32'd0;
                endcase
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \results_counter$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \fsm_state$next  = fsm_state;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:91" *)
          casez (\$10 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:91" */
            1'h1:
                \fsm_state$next  = 2'h1;
          endcase
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" *)
          casez (\$12 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" *)
                casez (\$14 )
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:99" */
                  1'h1:
                      /* empty */;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:101" */
                  default:
                      \fsm_state$next  = 2'h2;
                endcase
          endcase
      /* \nmigen.decoding  = "DONE/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:104" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:108" *)
          casez (\$16 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:108" */
            1'h1:
                \fsm_state$next  = 2'h0;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \fsm_state$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    results__ready = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          results__ready = 1'h1;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \accumulator$next  = accumulator;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" *)
          casez (\$18 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:96" */
            1'h1:
                \accumulator$next  = \$21 [31:0];
          endcase
      /* \nmigen.decoding  = "DONE/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:104" */
      2'h2:
          \accumulator$next  = 32'd0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \accumulator$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \accumulated__payload$next  = accumulated__payload;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "DONE/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:104" */
      2'h2:
          \accumulated__payload$next  = accumulator;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \accumulated__payload$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \accumulated__valid$next  = accumulated__valid;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:88" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "IDLE/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:89" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "ACCUMULATING/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:94" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "DONE/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:104" */
      2'h2:
        begin
          \accumulated__valid$next  = 1'h1;
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:108" *)
          casez (\$23 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/hps_cfu.py:108" */
            1'h1:
                \accumulated__valid$next  = 1'h0;
          endcase
        end
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \accumulated__valid$next  = 1'h0;
    endcase
  end
  assign \$7  = \$8 ;
  assign \$20  = \$21 ;
endmodule