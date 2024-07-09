module wrapped(clk, w_en, w_data, w_rdy, r_rdy, r_data, r_en, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *)
  wire \$1 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *)
  wire \$3 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *)
  wire \$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:257" *)
  wire [6:0] \$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:225" *)
  wire [6:0] level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:83" *)
  output [31:0] r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:85" *)
  input r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:86" *)
  wire [6:0] r_level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:84" *)
  output r_rdy;
  reg r_rdy = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:84" *)
  reg \r_rdy$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:121" *)
  wire [5:0] unbuffered_level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:83" *)
  wire [31:0] unbuffered_r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:85" *)
  wire unbuffered_r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:84" *)
  wire unbuffered_r_rdy;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:78" *)
  wire [31:0] unbuffered_w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:80" *)
  wire unbuffered_w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:79" *)
  wire unbuffered_w_rdy;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:78" *)
  input [31:0] w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:80" *)
  input w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:81" *)
  wire [6:0] w_level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:79" *)
  output w_rdy;
  assign \$1  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *) r_rdy;
  assign \$3  = \$1  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *) r_en;
  assign \$5  = unbuffered_r_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:249" *) \$3 ;
  assign \$7  = unbuffered_level + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:257" *) r_rdy;
  always @(posedge clk)
    r_rdy <= \r_rdy$next ;
  unbuffered unbuffered (
    .clk(clk),
    .level(unbuffered_level),
    .r_data(unbuffered_r_data),
    .r_en(unbuffered_r_en),
    .r_rdy(unbuffered_r_rdy),
    .rst(rst),
    .w_data(unbuffered_w_data),
    .w_en(unbuffered_w_en),
    .w_rdy(unbuffered_w_rdy)
  );
  always @* begin
    if (\initial ) begin end
    \r_rdy$next  = r_rdy;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:251" *)
    casez ({ r_en, unbuffered_r_en })
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:251" */
      2'b?1:
          \r_rdy$next  = 1'h1;
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:253" */
      2'b1?:
          \r_rdy$next  = 1'h0;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \r_rdy$next  = 1'h0;
    endcase
  end
  assign r_level = level;
  assign w_level = level;
  assign level = \$7 ;
  assign unbuffered_r_en = \$5 ;
  assign r_data = unbuffered_r_data;
  assign w_rdy = unbuffered_w_rdy;
  assign unbuffered_w_en = w_en;
  assign unbuffered_w_data = w_data;
endmodule