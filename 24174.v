module unbuffered(clk, w_data, w_en, w_rdy, r_data, r_en, r_rdy, level, rst);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$11 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *)
  wire \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$19 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:133" *)
  wire \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire [6:0] \$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *)
  wire \$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *)
  wire \$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" *)
  wire \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *)
  wire \$29 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" *)
  wire \$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:167" *)
  wire [6:0] \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:167" *)
  wire [6:0] \$35 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *)
  wire \$37 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" *)
  wire \$39 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:134" *)
  wire \$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *)
  wire \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" *)
  wire \$43 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:169" *)
  wire [6:0] \$45 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:169" *)
  wire [6:0] \$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:152" *)
  wire \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *)
  wire \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:147" *)
  reg [5:0] consume = 6'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:147" *)
  reg [5:0] \consume$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:121" *)
  output [5:0] level;
  reg [5:0] level = 6'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:121" *)
  reg [5:0] \level$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:146" *)
  reg [5:0] produce = 6'h00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:146" *)
  reg [5:0] \produce$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:83" *)
  output [31:0] r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:85" *)
  input r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:86" *)
  wire [5:0] r_level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:84" *)
  output r_rdy;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:144" *)
  wire [5:0] storage_r_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:144" *)
  wire [31:0] storage_r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:144" *)
  wire storage_r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:143" *)
  wire [5:0] storage_w_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:143" *)
  wire [31:0] storage_w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:143" *)
  wire storage_w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:78" *)
  input [31:0] w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:80" *)
  input w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:81" *)
  wire [5:0] w_level;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:79" *)
  output w_rdy;
  reg [31:0] storage [62:0];
  initial begin
    storage[0] = 32'd0;
    storage[1] = 32'd0;
    storage[2] = 32'd0;
    storage[3] = 32'd0;
    storage[4] = 32'd0;
    storage[5] = 32'd0;
    storage[6] = 32'd0;
    storage[7] = 32'd0;
    storage[8] = 32'd0;
    storage[9] = 32'd0;
    storage[10] = 32'd0;
    storage[11] = 32'd0;
    storage[12] = 32'd0;
    storage[13] = 32'd0;
    storage[14] = 32'd0;
    storage[15] = 32'd0;
    storage[16] = 32'd0;
    storage[17] = 32'd0;
    storage[18] = 32'd0;
    storage[19] = 32'd0;
    storage[20] = 32'd0;
    storage[21] = 32'd0;
    storage[22] = 32'd0;
    storage[23] = 32'd0;
    storage[24] = 32'd0;
    storage[25] = 32'd0;
    storage[26] = 32'd0;
    storage[27] = 32'd0;
    storage[28] = 32'd0;
    storage[29] = 32'd0;
    storage[30] = 32'd0;
    storage[31] = 32'd0;
    storage[32] = 32'd0;
    storage[33] = 32'd0;
    storage[34] = 32'd0;
    storage[35] = 32'd0;
    storage[36] = 32'd0;
    storage[37] = 32'd0;
    storage[38] = 32'd0;
    storage[39] = 32'd0;
    storage[40] = 32'd0;
    storage[41] = 32'd0;
    storage[42] = 32'd0;
    storage[43] = 32'd0;
    storage[44] = 32'd0;
    storage[45] = 32'd0;
    storage[46] = 32'd0;
    storage[47] = 32'd0;
    storage[48] = 32'd0;
    storage[49] = 32'd0;
    storage[50] = 32'd0;
    storage[51] = 32'd0;
    storage[52] = 32'd0;
    storage[53] = 32'd0;
    storage[54] = 32'd0;
    storage[55] = 32'd0;
    storage[56] = 32'd0;
    storage[57] = 32'd0;
    storage[58] = 32'd0;
    storage[59] = 32'd0;
    storage[60] = 32'd0;
    storage[61] = 32'd0;
    storage[62] = 32'd0;
  end
  always @(posedge clk) begin
    if (storage_w_en)
      storage[storage_w_addr] <= storage_w_data;
  end
  reg [31:0] _0_;
  always @(posedge clk) begin
    if (storage_r_en) begin
      _0_ <= storage[storage_r_addr];
    end
  end
  assign storage_r_data = _0_;
  assign \$11  = produce + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 1'h1;
  assign \$14  = produce == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 6'h3e;
  assign \$13  = \$14  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 7'h00 : \$11 ;
  assign \$17  = r_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *) r_en;
  assign \$20  = consume + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 1'h1;
  assign \$23  = consume == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 6'h3e;
  assign \$22  = \$23  ? (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:93" *) 7'h00 : \$20 ;
  assign \$26  = w_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *) w_en;
  assign \$2  = level != (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:133" *) 6'h3f;
  assign \$29  = r_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *) r_en;
  assign \$28  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" *) \$29 ;
  assign \$32  = \$26  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" *) \$28 ;
  assign \$35  = level + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:167" *) 1'h1;
  assign \$37  = r_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:139" *) r_en;
  assign \$40  = w_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *) w_en;
  assign \$39  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" *) \$40 ;
  assign \$43  = \$37  & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" *) \$39 ;
  assign \$46  = level - (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:169" *) 1'h1;
  assign \$4  = | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:134" *) level;
  assign \$6  = w_en & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:152" *) w_rdy;
  assign \$8  = w_rdy & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:140" *) w_en;
  always @(posedge clk)
    level <= \level$next ;
  always @(posedge clk)
    consume <= \consume$next ;
  always @(posedge clk)
    produce <= \produce$next ;
  always @* begin
    if (\initial ) begin end
    \consume$next  = consume;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:163" *)
    casez (\$17 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:163" */
      1'h1:
          \consume$next  = \$22 [5:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \consume$next  = 6'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \level$next  = level;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" *)
    casez (\$32 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:166" */
      1'h1:
          \level$next  = \$35 [5:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" *)
    casez (\$43 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:168" */
      1'h1:
          \level$next  = \$46 [5:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \level$next  = 6'h00;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \produce$next  = produce;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:154" *)
    casez (\$8 )
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/lib/fifo.py:154" */
      1'h1:
          \produce$next  = \$13 [5:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \produce$next  = 6'h00;
    endcase
  end
  assign \$10  = \$13 ;
  assign \$19  = \$22 ;
  assign \$34  = \$35 ;
  assign \$45  = \$46 ;
  assign storage_r_en = r_en;
  assign r_data = storage_r_data;
  assign storage_r_addr = consume;
  assign storage_w_en = \$6 ;
  assign storage_w_data = w_data;
  assign storage_w_addr = produce;
  assign r_level = level;
  assign w_level = level;
  assign r_rdy = \$4 ;
  assign w_rdy = \$2 ;
endmodule