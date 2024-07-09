module macc(offset, operands__valid, operands__payload__inputs, operands__payload__filters, operands__ready, result__valid, result__payload, result__ready, rst, clk, enable);
  reg \initial  = 0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:76" *)
  wire \$10 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$101 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$104 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$105 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$107 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$108 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$111 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$114 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$115 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$117 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$118 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$12 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$121 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$124 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$125 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$127 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$128 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$131 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$134 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$135 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$137 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$138 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$14 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$141 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$144 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$145 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$147 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$148 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$15 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$151 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$154 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$155 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$157 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$158 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$161 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$164 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$165 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$167 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$168 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$17 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [31:0] \$170 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$171 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$173 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [18:0] \$175 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$177 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$179 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$18 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [18:0] \$181 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [19:0] \$183 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$185 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$187 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [18:0] \$189 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$191 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [17:0] \$193 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [18:0] \$195 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [19:0] \$197 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *)
  wire [20:0] \$199 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:73" *)
  wire \$2 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$21 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$24 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$25 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$27 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$28 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$31 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$34 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$35 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$37 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$38 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *)
  wire \$4 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$41 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$44 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$45 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$47 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$48 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$51 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$54 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$55 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$57 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$58 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:77" *)
  wire \$6 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$61 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$64 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$65 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$67 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$68 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$71 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$74 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$75 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$77 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$78 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:77" *)
  wire \$8 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$81 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$84 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$85 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$87 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$88 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *)
  wire [8:0] \$91 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$94 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *)
  wire [9:0] \$95 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$97 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *)
  wire [17:0] \$98 ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input clk;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:56" *)
  input enable;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] f_tmp = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$100  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$100$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$110  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$110$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$120  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$120$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$130  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$130$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$140  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$140$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$150  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$150$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$160  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$160$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$20  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$20$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$30  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$30$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$40  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$40$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$50  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$50$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$60  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$60$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$70  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$70$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$80  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$80$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$90  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$90$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:96" *)
  reg [8:0] \f_tmp$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] i_tmp = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$103  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$103$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$113  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$113$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$123  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$123$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$133  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$133$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$143  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$143$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$153  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$153$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$163  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$163$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$23  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$23$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$33  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$33$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$43  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$43$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$53  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$53$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$63  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$63$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$73  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$73$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$83  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$83$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$93  = 9'h000;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$93$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:98" *)
  reg [8:0] \i_tmp$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:69" *)
  reg next_valid = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:69" *)
  reg \next_valid$1  = 1'h0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:69" *)
  reg \next_valid$1$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:69" *)
  reg \next_valid$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:57" *)
  input [8:0] offset;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  input [127:0] operands__payload__filters;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  input [127:0] operands__payload__inputs;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  output operands__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:58" *)
  input operands__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:64" *)
  wire pipe_flowing;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_00;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_01;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_02;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_03;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_04;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_05;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_06;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_07;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_08;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_09;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0a;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0b;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0c;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0d;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0e;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:90" *)
  reg [16:0] product_0f;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  output [31:0] result__payload;
  reg [31:0] result__payload = 32'd0;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  reg [31:0] \result__payload$next ;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  input result__ready;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:60" *)
  output result__valid;
  (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/ir.py:524" *)
  input rst;
  assign \$101  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[79:72]);
  assign \$105  = $signed(operands__payload__inputs[79:72]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$108  = $signed(\i_tmp$103 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$100 );
  assign \$10  = enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:76" *) \$8 ;
  assign \$111  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[87:80]);
  assign \$115  = $signed(operands__payload__inputs[87:80]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$118  = $signed(\i_tmp$113 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$110 );
  assign \$121  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[95:88]);
  assign \$125  = $signed(operands__payload__inputs[95:88]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$128  = $signed(\i_tmp$123 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$120 );
  assign \$12  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[7:0]);
  assign \$131  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[103:96]);
  assign \$135  = $signed(operands__payload__inputs[103:96]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$138  = $signed(\i_tmp$133 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$130 );
  assign \$141  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[111:104]);
  assign \$145  = $signed(operands__payload__inputs[111:104]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$148  = $signed(\i_tmp$143 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$140 );
  assign \$151  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[119:112]);
  assign \$155  = $signed(operands__payload__inputs[119:112]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$158  = $signed(\i_tmp$153 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$150 );
  assign \$15  = $signed(operands__payload__inputs[7:0]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$161  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[127:120]);
  assign \$165  = $signed(operands__payload__inputs[127:120]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$168  = $signed(\i_tmp$163 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$160 );
  assign \$171  = $signed(product_00) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_01);
  assign \$173  = $signed(product_02) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_03);
  assign \$175  = $signed(\$171 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$173 );
  assign \$177  = $signed(product_04) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_05);
  assign \$179  = $signed(product_06) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_07);
  assign \$181  = $signed(\$177 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$179 );
  assign \$183  = $signed(\$175 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$181 );
  assign \$185  = $signed(product_08) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_09);
  assign \$187  = $signed(product_0a) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_0b);
  assign \$18  = $signed(i_tmp) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(f_tmp);
  assign \$189  = $signed(\$185 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$187 );
  assign \$191  = $signed(product_0c) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_0d);
  assign \$193  = $signed(product_0e) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(product_0f);
  assign \$195  = $signed(\$191 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$193 );
  assign \$197  = $signed(\$189 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$195 );
  assign \$199  = $signed(\$183 ) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$197 );
  assign \$170  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/python/nmigen_cfu/util.py:44" *) $signed(\$199 );
  assign \$21  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[15:8]);
  assign \$25  = $signed(operands__payload__inputs[15:8]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$28  = $signed(\i_tmp$23 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$20 );
  assign \$2  = enable & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:73" *) \next_valid$1 ;
  assign \$31  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[23:16]);
  assign \$35  = $signed(operands__payload__inputs[23:16]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$38  = $signed(\i_tmp$33 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$30 );
  assign \$41  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[31:24]);
  assign \$45  = $signed(operands__payload__inputs[31:24]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$48  = $signed(\i_tmp$43 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$40 );
  assign \$4  = result__valid & (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/stream/stream.py:98" *) result__ready;
  assign \$51  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[39:32]);
  assign \$55  = $signed(operands__payload__inputs[39:32]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$58  = $signed(\i_tmp$53 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$50 );
  assign \$61  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[47:40]);
  assign \$65  = $signed(operands__payload__inputs[47:40]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$68  = $signed(\i_tmp$63 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$60 );
  assign \$6  = ~ (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:77" *) \next_valid$1 ;
  assign \$71  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[55:48]);
  assign \$75  = $signed(operands__payload__inputs[55:48]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$78  = $signed(\i_tmp$73 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$70 );
  assign \$81  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[63:56]);
  assign \$85  = $signed(operands__payload__inputs[63:56]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$88  = $signed(\i_tmp$83 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$80 );
  assign \$8  = \$4  | (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:77" *) \$6 ;
  assign \$91  = + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:85" *) $signed(operands__payload__filters[71:64]);
  assign \$95  = $signed(operands__payload__inputs[71:64]) + (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:99" *) $signed(offset);
  assign \$98  = $signed(\i_tmp$93 ) * (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:101" *) $signed(\f_tmp$90 );
  always @(posedge clk)
    result__payload <= \result__payload$next ;
  always @(posedge clk)
    \i_tmp$163  <= \i_tmp$163$next ;
  always @(posedge clk)
    \f_tmp$160  <= \f_tmp$160$next ;
  always @(posedge clk)
    \i_tmp$153  <= \i_tmp$153$next ;
  always @(posedge clk)
    \f_tmp$150  <= \f_tmp$150$next ;
  always @(posedge clk)
    \i_tmp$143  <= \i_tmp$143$next ;
  always @(posedge clk)
    \f_tmp$140  <= \f_tmp$140$next ;
  always @(posedge clk)
    \i_tmp$133  <= \i_tmp$133$next ;
  always @(posedge clk)
    \f_tmp$130  <= \f_tmp$130$next ;
  always @(posedge clk)
    \i_tmp$123  <= \i_tmp$123$next ;
  always @(posedge clk)
    \f_tmp$120  <= \f_tmp$120$next ;
  always @(posedge clk)
    \i_tmp$113  <= \i_tmp$113$next ;
  always @(posedge clk)
    \f_tmp$110  <= \f_tmp$110$next ;
  always @(posedge clk)
    \i_tmp$103  <= \i_tmp$103$next ;
  always @(posedge clk)
    \f_tmp$100  <= \f_tmp$100$next ;
  always @(posedge clk)
    \i_tmp$93  <= \i_tmp$93$next ;
  always @(posedge clk)
    \f_tmp$90  <= \f_tmp$90$next ;
  always @(posedge clk)
    \i_tmp$83  <= \i_tmp$83$next ;
  always @(posedge clk)
    \f_tmp$80  <= \f_tmp$80$next ;
  always @(posedge clk)
    \i_tmp$73  <= \i_tmp$73$next ;
  always @(posedge clk)
    \f_tmp$70  <= \f_tmp$70$next ;
  always @(posedge clk)
    \i_tmp$63  <= \i_tmp$63$next ;
  always @(posedge clk)
    \f_tmp$60  <= \f_tmp$60$next ;
  always @(posedge clk)
    \i_tmp$53  <= \i_tmp$53$next ;
  always @(posedge clk)
    \f_tmp$50  <= \f_tmp$50$next ;
  always @(posedge clk)
    \i_tmp$43  <= \i_tmp$43$next ;
  always @(posedge clk)
    \f_tmp$40  <= \f_tmp$40$next ;
  always @(posedge clk)
    \i_tmp$33  <= \i_tmp$33$next ;
  always @(posedge clk)
    \f_tmp$30  <= \f_tmp$30$next ;
  always @(posedge clk)
    \i_tmp$23  <= \i_tmp$23$next ;
  always @(posedge clk)
    \f_tmp$20  <= \f_tmp$20$next ;
  always @(posedge clk)
    i_tmp <= \i_tmp$next ;
  always @(posedge clk)
    f_tmp <= \f_tmp$next ;
  always @(posedge clk)
    \next_valid$1  <= \next_valid$1$next ;
  always @(posedge clk)
    next_valid <= \next_valid$next ;
  always @* begin
    if (\initial ) begin end
    \next_valid$next  = next_valid;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:70" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:70" */
      1'h1:
          \next_valid$next  = operands__valid;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \next_valid$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \next_valid$1$next  = \next_valid$1 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:70" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:70" */
      1'h1:
          \next_valid$1$next  = next_valid;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \next_valid$1$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_01 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_01 = \$28 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$30$next  = \f_tmp$30 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$30$next  = \$31 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$30$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$33$next  = \i_tmp$33 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$33$next  = \$35 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$33$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_02 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_02 = \$38 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$40$next  = \f_tmp$40 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$40$next  = \$41 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$40$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$43$next  = \i_tmp$43 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$43$next  = \$45 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$43$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_03 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_03 = \$48 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$50$next  = \f_tmp$50 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$50$next  = \$51 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$50$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$53$next  = \i_tmp$53 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$53$next  = \$55 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$53$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_04 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_04 = \$58 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$60$next  = \f_tmp$60 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$60$next  = \$61 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$60$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$63$next  = \i_tmp$63 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$63$next  = \$65 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$63$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_05 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_05 = \$68 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$70$next  = \f_tmp$70 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$70$next  = \$71 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$70$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$73$next  = \i_tmp$73 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$73$next  = \$75 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$73$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_06 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_06 = \$78 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$80$next  = \f_tmp$80 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$80$next  = \$81 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$80$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$83$next  = \i_tmp$83 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$83$next  = \$85 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$83$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_07 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_07 = \$88 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$90$next  = \f_tmp$90 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$90$next  = \$91 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$90$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$93$next  = \i_tmp$93 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$93$next  = \$95 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$93$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_08 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_08 = \$98 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$100$next  = \f_tmp$100 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$100$next  = \$101 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$100$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$103$next  = \i_tmp$103 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$103$next  = \$105 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$103$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_09 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_09 = \$108 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$110$next  = \f_tmp$110 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$110$next  = \$111 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$110$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$113$next  = \i_tmp$113 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$113$next  = \$115 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$113$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0a = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0a = \$118 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$120$next  = \f_tmp$120 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$120$next  = \$121 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$120$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$123$next  = \i_tmp$123 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$123$next  = \$125 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$123$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0b = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0b = \$128 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$130$next  = \f_tmp$130 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$130$next  = \$131 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$130$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$133$next  = \i_tmp$133 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$133$next  = \$135 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$133$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0c = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0c = \$138 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$140$next  = \f_tmp$140 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$140$next  = \$141 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$140$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$143$next  = \i_tmp$143 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$143$next  = \$145 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$143$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0d = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0d = \$148 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$150$next  = \f_tmp$150 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$150$next  = \$151 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$150$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$153$next  = \i_tmp$153 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$153$next  = \$155 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$153$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0e = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0e = \$158 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$next  = f_tmp;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$next  = \$12 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$160$next  = \f_tmp$160 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$160$next  = \$161 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$160$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$163$next  = \i_tmp$163 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$163$next  = \$165 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$163$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_0f = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_0f = \$168 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \result__payload$next  = result__payload;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \result__payload$next  = \$170 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \result__payload$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$next  = i_tmp;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$next  = \$15 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    product_00 = 17'h00000;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          product_00 = \$18 [16:0];
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \f_tmp$20$next  = \f_tmp$20 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \f_tmp$20$next  = \$21 ;
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \f_tmp$20$next  = 9'h000;
    endcase
  end
  always @* begin
    if (\initial ) begin end
    \i_tmp$23$next  = \i_tmp$23 ;
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" *)
    casez (pipe_flowing)
      /* src = "/media/tim/GIT/tcal-x/CFU-Playground/proj/hps_accel/gateware/gen1/macc.py:94" */
      1'h1:
          \i_tmp$23$next  = \$25 [8:0];
    endcase
    (* src = "/media/tim/GIT/tcal-x/CFU-Playground/third_party/python/nmigen/nmigen/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \i_tmp$23$next  = 9'h000;
    endcase
  end
  assign \$14  = \$15 ;
  assign \$17  = \$18 ;
  assign \$24  = \$25 ;
  assign \$27  = \$28 ;
  assign \$34  = \$35 ;
  assign \$37  = \$38 ;
  assign \$44  = \$45 ;
  assign \$47  = \$48 ;
  assign \$54  = \$55 ;
  assign \$57  = \$58 ;
  assign \$64  = \$65 ;
  assign \$67  = \$68 ;
  assign \$74  = \$75 ;
  assign \$77  = \$78 ;
  assign \$84  = \$85 ;
  assign \$87  = \$88 ;
  assign \$94  = \$95 ;
  assign \$97  = \$98 ;
  assign \$104  = \$105 ;
  assign \$107  = \$108 ;
  assign \$114  = \$115 ;
  assign \$117  = \$118 ;
  assign \$124  = \$125 ;
  assign \$127  = \$128 ;
  assign \$134  = \$135 ;
  assign \$137  = \$138 ;
  assign \$144  = \$145 ;
  assign \$147  = \$148 ;
  assign \$154  = \$155 ;
  assign \$157  = \$158 ;
  assign \$164  = \$165 ;
  assign \$167  = \$168 ;
  assign operands__ready = pipe_flowing;
  assign pipe_flowing = \$10 ;
  assign result__valid = \$2 ;
endmodule