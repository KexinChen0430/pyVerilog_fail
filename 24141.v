module get(sink_70__payload, sink_70__ready, sink_30__valid, sink_30__payload, sink_30__ready, sink_44__valid, sink_44__payload, sink_44__ready, \output , done, start, in0, in1, funct7, rst, clk, sink_70__valid);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:154" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:154" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:122" *)
  wire clear_30;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:122" *)
  wire clear_44;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:122" *)
  wire clear_70;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  output done;
  reg done = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  reg \done$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:161" *)
  reg [6:0] f7_buf = 7'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:161" *)
  reg [6:0] \f7_buf$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
  reg [1:0] \fsm_state$next ;
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
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  output [31:0] \output ;
  reg [31:0] \output  = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  reg [31:0] \output$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg read_strobe_30 = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg \read_strobe_30$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg read_strobe_44 = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg \read_strobe_44$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg read_strobe_70 = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:123" *)
  reg \read_strobe_70$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire [31:0] reg_30_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_30_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_30_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:64" *)
  wire reg_30_invalidate;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:65" *)
  wire reg_30_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:66" *)
  wire [31:0] reg_30_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire [31:0] reg_44_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_44_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_44_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:64" *)
  wire reg_44_invalidate;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:65" *)
  wire reg_44_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:66" *)
  wire [31:0] reg_44_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire [31:0] reg_70_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_70_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:63" *)
  wire reg_70_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:64" *)
  wire reg_70_invalidate;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:65" *)
  wire reg_70_valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:66" *)
  wire [31:0] reg_70_value;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input [31:0] sink_30__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  output sink_30__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input sink_30__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input [31:0] sink_44__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  output sink_44__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input sink_44__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input [31:0] sink_70__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  output sink_70__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:121" *)
  input sink_70__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  input start;
  always @(posedge clk)
    done <= \done$next ;
  always @(posedge clk)
    \output  <= \output$next ;
  always @(posedge clk)
    f7_buf <= \f7_buf$next ;
  always @(posedge clk)
    read_strobe_70 <= \read_strobe_70$next ;
  always @(posedge clk)
    read_strobe_44 <= \read_strobe_44$next ;
  always @(posedge clk)
    read_strobe_30 <= \read_strobe_30$next ;
  always @(posedge clk)
    fsm_state <= \fsm_state$next ;
  reg_30 reg_30 (
    .clk(clk),
    .input__payload(reg_30_input__payload),
    .input__ready(reg_30_input__ready),
    .input__valid(reg_30_input__valid),
    .invalidate(reg_30_invalidate),
    .rst(rst),
    .valid(reg_30_valid),
    .value(reg_30_value)
  );
  reg_44 reg_44 (
    .clk(clk),
    .input__payload(reg_44_input__payload),
    .input__ready(reg_44_input__ready),
    .input__valid(reg_44_input__valid),
    .invalidate(reg_44_invalidate),
    .rst(rst),
    .valid(reg_44_valid),
    .value(reg_44_value)
  );
  \reg_70$1  reg_70 (
    .clk(clk),
    .input__payload(reg_70_input__payload),
    .input__ready(reg_70_input__ready),
    .input__valid(reg_70_input__valid),
    .invalidate(1'h0),
    .rst(rst),
    .valid(reg_70_valid),
    .value(reg_70_value)
  );
  always @* begin
    if (\initial ) begin end
    \read_strobe_70$next  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      /* empty */;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h44:
                      /* empty */;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h70:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_70_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \read_strobe_70$next  = 1'h1;
                      endcase
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h44:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h70:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_70_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \read_strobe_70$next  = 1'h1;
                endcase
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_strobe_70$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f7_buf$next  = f7_buf;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                \f7_buf$next  = funct7;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f7_buf$next  = 7'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \output$next  = \output ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_30_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \output$next  = reg_30_value;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h44:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_44_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \output$next  = reg_44_value;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h70:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_70_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \output$next  = reg_70_value;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
                  default:
                      \output$next  = 32'd0;
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_30_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \output$next  = reg_30_value;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h44:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_44_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \output$next  = reg_44_value;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h70:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_70_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \output$next  = reg_70_value;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
            default:
                \output$next  = 32'd0;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \output$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \done$next  = done;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_30_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \done$next  = 1'h1;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h44:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_44_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \done$next  = 1'h1;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h70:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_70_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \done$next  = 1'h1;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
                  default:
                      \done$next  = 1'h1;
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_30_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \done$next  = 1'h1;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h44:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_44_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \done$next  = 1'h1;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h70:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_70_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \done$next  = 1'h1;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
            default:
                \done$next  = 1'h1;
          endcase
      /* \nmigen.decoding  = "DONE/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:169" */
      2'h1:
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
    \fsm_state$next  = fsm_state;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_30_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \fsm_state$next  = 2'h1;
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                        default:
                            \fsm_state$next  = 2'h2;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h44:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_44_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \fsm_state$next  = 2'h1;
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                        default:
                            \fsm_state$next  = 2'h2;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h70:
                      (* full_case = 32'd1 *)
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_70_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \fsm_state$next  = 2'h1;
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                        default:
                            \fsm_state$next  = 2'h2;
                      endcase
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
                  default:
                      \fsm_state$next  = 2'h1;
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* full_case = 32'd1 *)
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_30_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \fsm_state$next  = 2'h1;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                  default:
                      \fsm_state$next  = 2'h2;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h44:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_44_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \fsm_state$next  = 2'h1;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                  default:
                      \fsm_state$next  = 2'h2;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h70:
                (* full_case = 32'd1 *)
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_70_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \fsm_state$next  = 2'h1;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:136" */
                  default:
                      \fsm_state$next  = 2'h2;
                endcase
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:138" */
            default:
                \fsm_state$next  = 2'h1;
          endcase
      /* \nmigen.decoding  = "DONE/1" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:169" */
      2'h1:
          \fsm_state$next  = 2'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \fsm_state$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_strobe_30$next  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_30_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \read_strobe_30$next  = 1'h1;
                      endcase
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_30_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \read_strobe_30$next  = 1'h1;
                endcase
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_strobe_30$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_strobe_44$next  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:162" *)
    casez (fsm_state)
      /* \nmigen.decoding  = "WAIT_START/0" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:163" */
      2'h0:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" *)
          casez (start)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:164" */
            1'h1:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
                casez (funct7)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h30:
                      /* empty */;
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
                  7'h44:
                      (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                      casez (reg_44_valid)
                        /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                        1'h1:
                            \read_strobe_44$next  = 1'h1;
                      endcase
                endcase
          endcase
      /* \nmigen.decoding  = "GETTING/2" */
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:167" */
      2'h2:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:127" *)
          casez (f7_buf)
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h30:
                /* empty */;
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:129" */
            7'h44:
                (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" *)
                casez (reg_44_valid)
                  /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/get.py:130" */
                  1'h1:
                      \read_strobe_44$next  = 1'h1;
                endcase
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_strobe_44$next  = 1'h0;
    endcase
  end
  assign clear_30 = 1'h0;
  assign clear_44 = 1'h0;
  assign clear_70 = 1'h0;
  assign in1s = in1;
  assign in0s = in0;
  assign reg_70_invalidate = 1'h0;
  assign sink_70__ready = reg_70_input__ready;
  assign reg_70_input__payload = sink_70__payload;
  assign reg_70_input__valid = sink_70__valid;
  assign reg_44_invalidate = \$3 ;
  assign sink_44__ready = reg_44_input__ready;
  assign reg_44_input__payload = sink_44__payload;
  assign reg_44_input__valid = sink_44__valid;
  assign reg_30_invalidate = \$1 ;
  assign sink_30__ready = reg_30_input__ready;
  assign reg_30_input__payload = sink_30__payload;
  assign reg_30_input__valid = sink_30__valid;
  assign \$1  = read_strobe_30;
  assign \$3  = read_strobe_44;
endmodule