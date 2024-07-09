module sap(clk, input__valid, input__payload, input__ready, offset, min, max, output__valid, output__payload, output__ready, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:236" *)
  wire [31:0] \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:236" *)
  wire [16:0] \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:237" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:239" *)
  wire \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input [15:0] input__payload;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  output input__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:48" *)
  input input__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:230" *)
  input [7:0] max;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:231" *)
  input [7:0] min;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:229" *)
  input [15:0] offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output [7:0] output__payload;
  reg [7:0] output__payload = 8'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  reg [7:0] \output__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  input output__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:49" *)
  output output__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg sr = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/actor.py:127" *)
  reg \sr$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:235" *)
  wire [31:0] with_offset;
  assign \$2  = $signed(input__payload) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:236" *) $signed(offset);
  assign \$1  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:236" *) $signed(\$2 );
  assign \$5  = $signed(with_offset) > (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:237" *) $signed(max);
  assign \$7  = $signed(with_offset) < (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:239" *) $signed(min);
  always @(posedge clk)
    output__payload <= \output__payload$next ;
  always @(posedge clk)
    sr <= \sr$next ;
  always @* begin
    if (\initial ) begin end
    \sr$next  = input__valid;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \sr$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    (* full_case = 32'd1 *)
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:237" *)
    casez ({ \$7 , \$5  })
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:237" */
      2'b?1:
          \output__payload$next  = max;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:239" */
      2'b1?:
          \output__payload$next  = min;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/post_process.py:241" */
      default:
          \output__payload$next  = with_offset[7:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \output__payload$next  = 8'h00;
    endcase
  end
  assign with_offset = \$1 ;
  assign output__valid = sr;
  assign input__ready = output__ready;
endmodule