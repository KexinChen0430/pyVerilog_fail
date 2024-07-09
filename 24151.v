module ppp(clk, output__ready, offset, activation_min, activation_max, read_data__bias, read_data__multiplier, read_data__shift, read_enable, output__valid, output__payload, input__valid, input__payload, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:316" *)
  wire [32:0] \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:316" *)
  wire [32:0] \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:297" *)
  wire [15:0] \$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:299" *)
  input [7:0] activation_max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:298" *)
  input [7:0] activation_min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  input [31:0] input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  wire input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:295" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:297" *)
  input [8:0] offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  output [7:0] output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:296" *)
  output output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [31:0] rdbpot_input__payload__dividend;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [3:0] rdbpot_input__payload__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire rdbpot_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire rdbpot_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [31:0] rdbpot_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire rdbpot_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire rdbpot_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  input [15:0] read_data__bias;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  input [31:0] read_data__multiplier;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:300" *)
  input [3:0] read_data__shift;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] read_data__shift_delay_0 = 4'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] \read_data__shift_delay_0$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] read_data__shift_delay_1 = 4'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] \read_data__shift_delay_1$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] read_data__shift_delay_2 = 4'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:258" *)
  reg [3:0] \read_data__shift_delay_2$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:301" *)
  output read_enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [15:0] sap_input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire sap_input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire sap_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:230" *)
  wire [7:0] sap_max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:231" *)
  wire [7:0] sap_min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:229" *)
  wire [15:0] sap_offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [7:0] sap_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire sap_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire sap_output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [31:0] srdhm_input__payload__a;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire [31:0] srdhm_input__payload__b;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  wire srdhm_input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire [31:0] srdhm_output__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire srdhm_output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  wire srdhm_output__valid;
  assign \$2  = $signed(input__payload) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:316" *) $signed(read_data__bias);
  assign \$4  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:297" *) $signed(offset);
  always @(posedge clk)
    read_data__shift_delay_2 <= \read_data__shift_delay_2$next ;
  always @(posedge clk)
    read_data__shift_delay_1 <= \read_data__shift_delay_1$next ;
  always @(posedge clk)
    read_data__shift_delay_0 <= \read_data__shift_delay_0$next ;
  rdbpot rdbpot (
    .clk(clk),
    .input__payload__dividend(rdbpot_input__payload__dividend),
    .input__payload__shift(rdbpot_input__payload__shift),
    .input__ready(rdbpot_input__ready),
    .input__valid(rdbpot_input__valid),
    .output__payload(rdbpot_output__payload),
    .output__ready(rdbpot_output__ready),
    .output__valid(rdbpot_output__valid),
    .rst(rst)
  );
  sap sap (
    .clk(clk),
    .input__payload(sap_input__payload),
    .input__ready(sap_input__ready),
    .input__valid(sap_input__valid),
    .max(sap_max),
    .min(sap_min),
    .offset(sap_offset),
    .output__payload(sap_output__payload),
    .output__ready(sap_output__ready),
    .output__valid(sap_output__valid),
    .rst(rst)
  );
  srdhm srdhm (
    .clk(clk),
    .input__payload__a(srdhm_input__payload__a),
    .input__payload__b(srdhm_input__payload__b),
    .input__valid(srdhm_input__valid),
    .output__payload(srdhm_output__payload),
    .output__ready(srdhm_output__ready),
    .output__valid(srdhm_output__valid),
    .rst(rst)
  );
  always @* begin
    if (\initial ) begin end
    \read_data__shift_delay_0$next  = read_data__shift;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_data__shift_delay_0$next  = 4'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_data__shift_delay_1$next  = read_data__shift_delay_0;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_data__shift_delay_1$next  = 4'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \read_data__shift_delay_2$next  = read_data__shift_delay_1;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \read_data__shift_delay_2$next  = 4'h0;
    endcase
  end
  assign \$1  = \$2 ;
  assign sap_output__ready = output__ready;
  assign output__payload = sap_output__payload;
  assign output__valid = sap_output__valid;
  assign sap_max = activation_max;
  assign sap_min = activation_min;
  assign sap_offset = \$4 ;
  assign rdbpot_output__ready = sap_input__ready;
  assign sap_input__payload = rdbpot_output__payload[15:0];
  assign sap_input__valid = rdbpot_output__valid;
  assign rdbpot_input__payload__shift = read_data__shift_delay_2;
  assign rdbpot_input__payload__dividend = srdhm_output__payload;
  assign rdbpot_input__valid = srdhm_output__valid;
  assign srdhm_output__ready = rdbpot_input__ready;
  assign read_enable = input__valid;
  assign srdhm_input__payload__b = read_data__multiplier;
  assign srdhm_input__payload__a = \$2 [31:0];
  assign srdhm_input__valid = input__valid;
  assign input__ready = 1'h1;
endmodule