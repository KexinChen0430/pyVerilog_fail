module gearbox(clk, input__valid, input__payload, input__ready, output__valid, output__payload, output__ready, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:64" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
  reg [1:0] \fsm_state$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  input [7:0] input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  output input__ready;
  reg input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  output [31:0] output__payload;
  reg [31:0] output__payload = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  reg [31:0] \output__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  output output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}  = 8'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}$11  = 8'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}$11$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}$12  = 8'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}$12$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:43" *)
  reg [7:0] \register{i}$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:44" *)
  reg waiting_to_send = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:44" *)
  reg \waiting_to_send$next ;
  assign \$9  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  assign \$13  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  assign \$15  = output__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) output__ready;
  assign \$17  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  assign \$1  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:64" *) waiting_to_send;
  assign \$3  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  assign \$5  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  assign \$7  = input__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) input__ready;
  always @(posedge clk)
    output__payload <= \output__payload$next ;
  always @(posedge clk)
    waiting_to_send <= \waiting_to_send$next ;
  always @(posedge clk)
    \register{i}$12  <= \register{i}$12$next ;
  always @(posedge clk)
    \register{i}$11  <= \register{i}$11$next ;
  always @(posedge clk)
    fsm_state <= \fsm_state$next ;
  always @(posedge clk)
    \register{i}  <= \register{i}$next ;
  always @* begin
    if (\initial ) begin end
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          input__ready = 1'h1;
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          input__ready = 1'h1;
      /* \nmigen.decoding  = "BYTE_2/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:58" */
      2'h2:
          input__ready = 1'h1;
      /* \nmigen.decoding  = "BYTE_3/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:63" */
      2'h3:
          input__ready = \$1 ;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \register{i}$next  = \register{i} ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          \register{i}$next  = input__payload;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \register{i}$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \fsm_state$next  = fsm_state;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:51" *)
          casez (\$3 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:51" */
            1'h1:
                \fsm_state$next  = 2'h1;
          endcase
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:56" *)
          casez (\$5 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:56" */
            1'h1:
                \fsm_state$next  = 2'h2;
          endcase
      /* \nmigen.decoding  = "BYTE_2/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:58" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:61" *)
          casez (\$7 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:61" */
            1'h1:
                \fsm_state$next  = 2'h3;
          endcase
      /* \nmigen.decoding  = "BYTE_3/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:63" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" *)
          casez (\$9 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" */
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
    \register{i}$11$next  = \register{i}$11 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          \register{i}$11$next  = input__payload;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \register{i}$11$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \register{i}$12$next  = \register{i}$12 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_2/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:58" */
      2'h2:
          \register{i}$12$next  = input__payload;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \register{i}$12$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \waiting_to_send$next  = waiting_to_send;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_2/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:58" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_3/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:63" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" *)
          casez (\$13 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" */
            1'h1:
                \waiting_to_send$next  = 1'h1;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:73" *)
    casez (\$15 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:73" */
      1'h1:
          \waiting_to_send$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \waiting_to_send$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \output__payload$next  = output__payload;
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:47" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "BYTE_0/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:48" */
      2'h0:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_1/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:53" */
      2'h1:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_2/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:58" */
      2'h2:
          /* empty */;
      /* \nmigen.decoding  = "BYTE_3/3" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:63" */
      2'h3:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" *)
          casez (\$17 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:65" */
            1'h1:
                \output__payload$next  = { input__payload, \register{i}$12 , \register{i}$11 , \register{i}  };
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \output__payload$next  = 32'd0;
    endcase
  end
  assign output__valid = waiting_to_send;
endmodule