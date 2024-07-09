module pp(activation_min, activation_max, read_data__bias, read_data__multiplier, read_data__shift, read_enable, result__valid, result__payload, result__ready, \output , done, start, in0, in1, funct7, rst, clk, offset);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:368" *)
  input [7:0] activation_max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:367" *)
  input [7:0] activation_min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  output done;
  reg done = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:53" *)
  reg \done$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:49" *)
  wire [31:0] fifo_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:49" *)
  wire fifo_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:49" *)
  wire fifo_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:50" *)
  wire [31:0] fifo_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:50" *)
  wire fifo_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/fifo.py:50" *)
  wire fifo_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:50" *)
  input [6:0] funct7;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  wire [7:0] gearbox_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  wire gearbox_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:37" *)
  wire gearbox_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  wire [31:0] gearbox_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  wire gearbox_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/gearbox.py:38" *)
  wire gearbox_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:48" *)
  input [31:0] in0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:54" *)
  wire [31:0] in0s;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:49" *)
  input [31:0] in1;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:55" *)
  wire [31:0] in1s;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:366" *)
  input [8:0] offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:51" *)
  output [31:0] \output ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:299" *)
  wire [7:0] ppp_activation_max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:298" *)
  wire [7:0] ppp_activation_min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  reg [31:0] ppp_input__payload = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  reg [31:0] \ppp_input__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  reg ppp_input__valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  reg \ppp_input__valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:297" *)
  wire [8:0] ppp_offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  wire [7:0] ppp_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  wire ppp_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  wire ppp_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  wire [15:0] ppp_read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  wire [31:0] ppp_read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  wire [3:0] ppp_read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:301" *)
  wire ppp_read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  input [15:0] read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  input [31:0] read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:369" *)
  input [3:0] read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:370" *)
  output read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  output [31:0] result__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  input result__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:371" *)
  output result__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/cfu.py:52" *)
  input start;
  assign \$1  = funct7 == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *) 2'h3;
  assign \$3  = funct7 == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *) 2'h3;
  always @(posedge clk)
    done <= \done$next ;
  always @(posedge clk)
    ppp_input__payload <= \ppp_input__payload$next ;
  always @(posedge clk)
    ppp_input__valid <= \ppp_input__valid$next ;
  fifo fifo (
    .clk(clk),
    .input__payload(fifo_input__payload),
    .input__ready(fifo_input__ready),
    .input__valid(fifo_input__valid),
    .output__payload(fifo_output__payload),
    .output__ready(fifo_output__ready),
    .output__valid(fifo_output__valid),
    .rst(rst)
  );
  gearbox gearbox (
    .clk(clk),
    .input__payload(gearbox_input__payload),
    .input__ready(gearbox_input__ready),
    .input__valid(gearbox_input__valid),
    .output__payload(gearbox_output__payload),
    .output__ready(gearbox_output__ready),
    .output__valid(gearbox_output__valid),
    .rst(rst)
  );
  ppp ppp (
    .activation_max(ppp_activation_max),
    .activation_min(ppp_activation_min),
    .clk(clk),
    .input__payload(ppp_input__payload),
    .input__valid(ppp_input__valid),
    .offset(ppp_offset),
    .output__payload(ppp_output__payload),
    .output__ready(ppp_output__ready),
    .output__valid(ppp_output__valid),
    .read_data__bias(ppp_read_data__bias),
    .read_data__multiplier(ppp_read_data__multiplier),
    .read_data__shift(ppp_read_data__shift),
    .read_enable(ppp_read_enable),
    .rst(rst)
  );
  always @* begin
    if (\initial ) begin end
    \done$next  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" */
      1'h1:
          \done$next  = 1'h1;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \done$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \ppp_input__valid$next  = 1'h0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *)
          casez (\$1 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" */
            1'h1:
                \ppp_input__valid$next  = 1'h1;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \ppp_input__valid$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \ppp_input__payload$next  = ppp_input__payload;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" *)
    casez (start)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:402" */
      1'h1:
          (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" *)
          casez (\$3 )
            /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:403" */
            1'h1:
                \ppp_input__payload$next  = in0s;
          endcase
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \ppp_input__payload$next  = 32'd0;
    endcase
  end
  assign in1s = in1;
  assign in0s = in0;
  assign \output  = 32'd0;
  assign fifo_output__ready = result__ready;
  assign result__payload = fifo_output__payload;
  assign result__valid = fifo_output__valid;
  assign gearbox_output__ready = fifo_input__ready;
  assign fifo_input__payload = gearbox_output__payload;
  assign fifo_input__valid = gearbox_output__valid;
  assign gearbox_input__payload = ppp_output__payload;
  assign gearbox_input__valid = ppp_output__valid;
  assign read_enable = ppp_read_enable;
  assign { ppp_read_data__shift, ppp_read_data__multiplier, ppp_read_data__bias } = { read_data__shift, read_data__multiplier, read_data__bias };
  assign ppp_activation_max = activation_max;
  assign ppp_activation_min = activation_min;
  assign ppp_offset = offset;
  assign ppp_output__ready = gearbox_input__ready;
endmodule