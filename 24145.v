module memory(write_addr, write_data, write_enable, read_addr, read_data, clk);
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *)
  wire \$26 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *)
  wire \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *)
  wire \$30 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *)
  wire \$32 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *)
  wire \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *)
  wire \$36 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *)
  wire \$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *)
  wire \$40 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *)
  wire \$42 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *)
  wire \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *)
  wire \$46 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *)
  wire \$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [5:0] mem_r_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [5:0] \mem_r_addr$13 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [5:0] \mem_r_addr$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [5:0] \mem_r_addr$5 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [31:0] mem_r_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [31:0] \mem_r_data$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [31:0] \mem_r_data$22 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire [31:0] \mem_r_data$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire mem_r_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire \mem_r_en$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire \mem_r_en$20 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:62" *)
  wire \mem_r_en$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [5:0] mem_w_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [5:0] \mem_w_addr$16 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [5:0] \mem_w_addr$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [5:0] \mem_w_addr$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [31:0] mem_w_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [31:0] \mem_w_data$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [31:0] \mem_w_data$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire [31:0] \mem_w_data$9 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire mem_w_en;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire \mem_w_en$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire \mem_w_en$23 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:68" *)
  wire \mem_w_en$7 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:54" *)
  input [5:0] read_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:55" *)
  output [127:0] read_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:51" *)
  input [7:0] write_addr;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:52" *)
  input [31:0] write_data;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:53" *)
  input write_enable;
  reg [31:0] mem [63:0];
  initial begin
    mem[0] = 32'd0;
    mem[1] = 32'd0;
    mem[2] = 32'd0;
    mem[3] = 32'd0;
    mem[4] = 32'd0;
    mem[5] = 32'd0;
    mem[6] = 32'd0;
    mem[7] = 32'd0;
    mem[8] = 32'd0;
    mem[9] = 32'd0;
    mem[10] = 32'd0;
    mem[11] = 32'd0;
    mem[12] = 32'd0;
    mem[13] = 32'd0;
    mem[14] = 32'd0;
    mem[15] = 32'd0;
    mem[16] = 32'd0;
    mem[17] = 32'd0;
    mem[18] = 32'd0;
    mem[19] = 32'd0;
    mem[20] = 32'd0;
    mem[21] = 32'd0;
    mem[22] = 32'd0;
    mem[23] = 32'd0;
    mem[24] = 32'd0;
    mem[25] = 32'd0;
    mem[26] = 32'd0;
    mem[27] = 32'd0;
    mem[28] = 32'd0;
    mem[29] = 32'd0;
    mem[30] = 32'd0;
    mem[31] = 32'd0;
    mem[32] = 32'd0;
    mem[33] = 32'd0;
    mem[34] = 32'd0;
    mem[35] = 32'd0;
    mem[36] = 32'd0;
    mem[37] = 32'd0;
    mem[38] = 32'd0;
    mem[39] = 32'd0;
    mem[40] = 32'd0;
    mem[41] = 32'd0;
    mem[42] = 32'd0;
    mem[43] = 32'd0;
    mem[44] = 32'd0;
    mem[45] = 32'd0;
    mem[46] = 32'd0;
    mem[47] = 32'd0;
    mem[48] = 32'd0;
    mem[49] = 32'd0;
    mem[50] = 32'd0;
    mem[51] = 32'd0;
    mem[52] = 32'd0;
    mem[53] = 32'd0;
    mem[54] = 32'd0;
    mem[55] = 32'd0;
    mem[56] = 32'd0;
    mem[57] = 32'd0;
    mem[58] = 32'd0;
    mem[59] = 32'd0;
    mem[60] = 32'd0;
    mem[61] = 32'd0;
    mem[62] = 32'd0;
    mem[63] = 32'd0;
  end
  always @(posedge clk) begin
    if (mem_w_en)
      mem[mem_w_addr] <= mem_w_data;
  end
  reg [31:0] _0_;
  always @(posedge clk) begin
    if (mem_r_en) begin
      _0_ <= mem[mem_r_addr];
    end
  end
  assign mem_r_data = _0_;
  reg [31:0] \mem$10  [63:0];
  initial begin
    \mem$10 [0] = 32'd0;
    \mem$10 [1] = 32'd0;
    \mem$10 [2] = 32'd0;
    \mem$10 [3] = 32'd0;
    \mem$10 [4] = 32'd0;
    \mem$10 [5] = 32'd0;
    \mem$10 [6] = 32'd0;
    \mem$10 [7] = 32'd0;
    \mem$10 [8] = 32'd0;
    \mem$10 [9] = 32'd0;
    \mem$10 [10] = 32'd0;
    \mem$10 [11] = 32'd0;
    \mem$10 [12] = 32'd0;
    \mem$10 [13] = 32'd0;
    \mem$10 [14] = 32'd0;
    \mem$10 [15] = 32'd0;
    \mem$10 [16] = 32'd0;
    \mem$10 [17] = 32'd0;
    \mem$10 [18] = 32'd0;
    \mem$10 [19] = 32'd0;
    \mem$10 [20] = 32'd0;
    \mem$10 [21] = 32'd0;
    \mem$10 [22] = 32'd0;
    \mem$10 [23] = 32'd0;
    \mem$10 [24] = 32'd0;
    \mem$10 [25] = 32'd0;
    \mem$10 [26] = 32'd0;
    \mem$10 [27] = 32'd0;
    \mem$10 [28] = 32'd0;
    \mem$10 [29] = 32'd0;
    \mem$10 [30] = 32'd0;
    \mem$10 [31] = 32'd0;
    \mem$10 [32] = 32'd0;
    \mem$10 [33] = 32'd0;
    \mem$10 [34] = 32'd0;
    \mem$10 [35] = 32'd0;
    \mem$10 [36] = 32'd0;
    \mem$10 [37] = 32'd0;
    \mem$10 [38] = 32'd0;
    \mem$10 [39] = 32'd0;
    \mem$10 [40] = 32'd0;
    \mem$10 [41] = 32'd0;
    \mem$10 [42] = 32'd0;
    \mem$10 [43] = 32'd0;
    \mem$10 [44] = 32'd0;
    \mem$10 [45] = 32'd0;
    \mem$10 [46] = 32'd0;
    \mem$10 [47] = 32'd0;
    \mem$10 [48] = 32'd0;
    \mem$10 [49] = 32'd0;
    \mem$10 [50] = 32'd0;
    \mem$10 [51] = 32'd0;
    \mem$10 [52] = 32'd0;
    \mem$10 [53] = 32'd0;
    \mem$10 [54] = 32'd0;
    \mem$10 [55] = 32'd0;
    \mem$10 [56] = 32'd0;
    \mem$10 [57] = 32'd0;
    \mem$10 [58] = 32'd0;
    \mem$10 [59] = 32'd0;
    \mem$10 [60] = 32'd0;
    \mem$10 [61] = 32'd0;
    \mem$10 [62] = 32'd0;
    \mem$10 [63] = 32'd0;
  end
  always @(posedge clk) begin
    if (\mem_w_en$15 )
      \mem$10 [\mem_w_addr$16 ] <= \mem_w_data$17 ;
  end
  reg [31:0] _1_;
  always @(posedge clk) begin
    if (\mem_r_en$12 ) begin
      _1_ <= \mem$10 [\mem_r_addr$13 ];
    end
  end
  assign \mem_r_data$14  = _1_;
  reg [31:0] \mem$18  [63:0];
  initial begin
    \mem$18 [0] = 32'd0;
    \mem$18 [1] = 32'd0;
    \mem$18 [2] = 32'd0;
    \mem$18 [3] = 32'd0;
    \mem$18 [4] = 32'd0;
    \mem$18 [5] = 32'd0;
    \mem$18 [6] = 32'd0;
    \mem$18 [7] = 32'd0;
    \mem$18 [8] = 32'd0;
    \mem$18 [9] = 32'd0;
    \mem$18 [10] = 32'd0;
    \mem$18 [11] = 32'd0;
    \mem$18 [12] = 32'd0;
    \mem$18 [13] = 32'd0;
    \mem$18 [14] = 32'd0;
    \mem$18 [15] = 32'd0;
    \mem$18 [16] = 32'd0;
    \mem$18 [17] = 32'd0;
    \mem$18 [18] = 32'd0;
    \mem$18 [19] = 32'd0;
    \mem$18 [20] = 32'd0;
    \mem$18 [21] = 32'd0;
    \mem$18 [22] = 32'd0;
    \mem$18 [23] = 32'd0;
    \mem$18 [24] = 32'd0;
    \mem$18 [25] = 32'd0;
    \mem$18 [26] = 32'd0;
    \mem$18 [27] = 32'd0;
    \mem$18 [28] = 32'd0;
    \mem$18 [29] = 32'd0;
    \mem$18 [30] = 32'd0;
    \mem$18 [31] = 32'd0;
    \mem$18 [32] = 32'd0;
    \mem$18 [33] = 32'd0;
    \mem$18 [34] = 32'd0;
    \mem$18 [35] = 32'd0;
    \mem$18 [36] = 32'd0;
    \mem$18 [37] = 32'd0;
    \mem$18 [38] = 32'd0;
    \mem$18 [39] = 32'd0;
    \mem$18 [40] = 32'd0;
    \mem$18 [41] = 32'd0;
    \mem$18 [42] = 32'd0;
    \mem$18 [43] = 32'd0;
    \mem$18 [44] = 32'd0;
    \mem$18 [45] = 32'd0;
    \mem$18 [46] = 32'd0;
    \mem$18 [47] = 32'd0;
    \mem$18 [48] = 32'd0;
    \mem$18 [49] = 32'd0;
    \mem$18 [50] = 32'd0;
    \mem$18 [51] = 32'd0;
    \mem$18 [52] = 32'd0;
    \mem$18 [53] = 32'd0;
    \mem$18 [54] = 32'd0;
    \mem$18 [55] = 32'd0;
    \mem$18 [56] = 32'd0;
    \mem$18 [57] = 32'd0;
    \mem$18 [58] = 32'd0;
    \mem$18 [59] = 32'd0;
    \mem$18 [60] = 32'd0;
    \mem$18 [61] = 32'd0;
    \mem$18 [62] = 32'd0;
    \mem$18 [63] = 32'd0;
  end
  always @(posedge clk) begin
    if (\mem_w_en$23 )
      \mem$18 [\mem_w_addr$24 ] <= \mem_w_data$25 ;
  end
  reg [31:0] _2_;
  always @(posedge clk) begin
    if (\mem_r_en$20 ) begin
      _2_ <= \mem$18 [\mem_r_addr$21 ];
    end
  end
  assign \mem_r_data$22  = _2_;
  reg [31:0] \mem$2  [63:0];
  initial begin
    \mem$2 [0] = 32'd0;
    \mem$2 [1] = 32'd0;
    \mem$2 [2] = 32'd0;
    \mem$2 [3] = 32'd0;
    \mem$2 [4] = 32'd0;
    \mem$2 [5] = 32'd0;
    \mem$2 [6] = 32'd0;
    \mem$2 [7] = 32'd0;
    \mem$2 [8] = 32'd0;
    \mem$2 [9] = 32'd0;
    \mem$2 [10] = 32'd0;
    \mem$2 [11] = 32'd0;
    \mem$2 [12] = 32'd0;
    \mem$2 [13] = 32'd0;
    \mem$2 [14] = 32'd0;
    \mem$2 [15] = 32'd0;
    \mem$2 [16] = 32'd0;
    \mem$2 [17] = 32'd0;
    \mem$2 [18] = 32'd0;
    \mem$2 [19] = 32'd0;
    \mem$2 [20] = 32'd0;
    \mem$2 [21] = 32'd0;
    \mem$2 [22] = 32'd0;
    \mem$2 [23] = 32'd0;
    \mem$2 [24] = 32'd0;
    \mem$2 [25] = 32'd0;
    \mem$2 [26] = 32'd0;
    \mem$2 [27] = 32'd0;
    \mem$2 [28] = 32'd0;
    \mem$2 [29] = 32'd0;
    \mem$2 [30] = 32'd0;
    \mem$2 [31] = 32'd0;
    \mem$2 [32] = 32'd0;
    \mem$2 [33] = 32'd0;
    \mem$2 [34] = 32'd0;
    \mem$2 [35] = 32'd0;
    \mem$2 [36] = 32'd0;
    \mem$2 [37] = 32'd0;
    \mem$2 [38] = 32'd0;
    \mem$2 [39] = 32'd0;
    \mem$2 [40] = 32'd0;
    \mem$2 [41] = 32'd0;
    \mem$2 [42] = 32'd0;
    \mem$2 [43] = 32'd0;
    \mem$2 [44] = 32'd0;
    \mem$2 [45] = 32'd0;
    \mem$2 [46] = 32'd0;
    \mem$2 [47] = 32'd0;
    \mem$2 [48] = 32'd0;
    \mem$2 [49] = 32'd0;
    \mem$2 [50] = 32'd0;
    \mem$2 [51] = 32'd0;
    \mem$2 [52] = 32'd0;
    \mem$2 [53] = 32'd0;
    \mem$2 [54] = 32'd0;
    \mem$2 [55] = 32'd0;
    \mem$2 [56] = 32'd0;
    \mem$2 [57] = 32'd0;
    \mem$2 [58] = 32'd0;
    \mem$2 [59] = 32'd0;
    \mem$2 [60] = 32'd0;
    \mem$2 [61] = 32'd0;
    \mem$2 [62] = 32'd0;
    \mem$2 [63] = 32'd0;
  end
  always @(posedge clk) begin
    if (\mem_w_en$7 )
      \mem$2 [\mem_w_addr$8 ] <= \mem_w_data$9 ;
  end
  reg [31:0] _3_;
  always @(posedge clk) begin
    if (\mem_r_en$4 ) begin
      _3_ <= \mem$2 [\mem_r_addr$5 ];
    end
  end
  assign \mem_r_data$6  = _3_;
  assign \$26  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *) write_enable;
  assign \$28  = ! (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *) write_addr[1:0];
  assign \$30  = write_enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *) \$28 ;
  assign \$32  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *) write_enable;
  assign \$34  = write_addr[1:0] == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *) 1'h1;
  assign \$36  = write_enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *) \$34 ;
  assign \$38  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *) write_enable;
  assign \$40  = write_addr[1:0] == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *) 2'h2;
  assign \$42  = write_enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *) \$40 ;
  assign \$44  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:65" *) write_enable;
  assign \$46  = write_addr[1:0] == (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:72" *) 2'h3;
  assign \$48  = write_enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/mem.py:71" *) \$46 ;
  assign read_data = { \mem_r_data$22 , \mem_r_data$14 , \mem_r_data$6 , mem_r_data };
  assign \mem_w_en$23  = \$48 ;
  assign \mem_w_data$25  = write_data;
  assign \mem_w_addr$24  = write_addr[7:2];
  assign \mem_r_en$20  = \$44 ;
  assign \mem_r_addr$21  = read_addr;
  assign \mem_w_en$15  = \$42 ;
  assign \mem_w_data$17  = write_data;
  assign \mem_w_addr$16  = write_addr[7:2];
  assign \mem_r_en$12  = \$38 ;
  assign \mem_r_addr$13  = read_addr;
  assign \mem_w_en$7  = \$36 ;
  assign \mem_w_data$9  = write_data;
  assign \mem_w_addr$8  = write_addr[7:2];
  assign \mem_r_en$4  = \$32 ;
  assign \mem_r_addr$5  = read_addr;
  assign mem_w_en = \$30 ;
  assign mem_w_data = write_data;
  assign mem_w_addr = write_addr[7:2];
  assign mem_r_en = \$26 ;
  assign mem_r_addr = read_addr;
endmodule