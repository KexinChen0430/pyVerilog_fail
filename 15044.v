module FP16BAddSub_Test;
   reg clk, rst;
   reg [15:0] s0_arg_0;
   reg [15:0] s0_arg_1;
   reg 	      s0_arg_2;
   wire [15:0] s0_ret_0;
   wire [15:0] s0_ret_1;
   wire        s0_ret_2;
   wire        s0_ret_3;
   reg [15:0]  s1_arg_0;
   reg [15:0]  s1_arg_1;
   reg 	       s1_arg_2;
   reg 	       s1_arg_3;
   wire        s1_ret_0;
   wire        s1_ret_1;
   wire [14:0] s1_ret_2;
   wire [14:0] s1_ret_3;
   wire [7:0]  s1_ret_4;
   wire        s1_ret_5;
   wire        s1_ret_6;
   reg 		s2_arg_0;
   reg 		s2_arg_1;
   reg [14:0] 	s2_arg_2;
   reg [14:0] 	s2_arg_3;
   reg [7:0] 	s2_arg_4;
   reg 		s2_arg_5;
   reg 		s2_arg_6;
   wire [15:0] 	s2_ret_0;
   wire 	s2_ret_1;
   wire 	s2_ret_2;
   wire [7:0] 	s2_ret_3;
   wire 	s2_ret_4;
   wire 	s2_ret_5;
   reg [15:0] 	s3_arg_0;
   reg 		s3_arg_1;
   reg 		s3_arg_2;
   reg [7:0] 	s3_arg_3;
   reg 		s3_arg_4;
   reg 		s3_arg_5;
   wire [14:0] 	s3_ret_0;
   wire 	s3_ret_1;
   wire 	s3_ret_2;
   wire [7:0] 	s3_ret_3;
   wire 	s3_ret_4;
   wire 	s3_ret_5;
   wire 	s3_ret_6;
   reg [14:0] 	s4_arg_0;
   reg 		s4_arg_1;
   reg 		s4_arg_2;
   reg [7:0] 	s4_arg_3;
   reg 		s4_arg_4;
   reg 		s4_arg_5;
   reg 		s4_arg_6;
   wire [15:0] 	s4_ret_0;
   reg 	       xs;
   reg [7:0]   xe;
   reg [6:0]   xf;
   reg 	       ys;
   reg [7:0]   ye;
   reg [6:0]   yf;
   reg 	       is_sub;
   wire 	rs;
   wire [7:0] 	re;
   wire [6:0] 	rf;
   assign rs = s4_ret_0[15:15];
   assign re = s4_ret_0[14:7];
   assign rf = s4_ret_0[6:0];
   FP16BAddSubS0Of5
     inst_0(.clk(clk), .rst(rst),
	    .arg_0(s0_arg_0), .arg_1(s0_arg_1), .arg_2(s0_arg_2),
	    .ret_0(s0_ret_0), .ret_1(s0_ret_1), .ret_2(s0_ret_2), .ret_3(s0_ret_3));
   FP16BAddSubS1Of5
     inst_1(.clk(clk), .rst(rst),
	    .arg_0(s1_arg_0), .arg_1(s1_arg_1), .arg_2(s1_arg_2), .arg_3(s1_arg_3),
	    .ret_0(s1_ret_0), .ret_1(s1_ret_1), .ret_2(s1_ret_2), .ret_3(s1_ret_3), .ret_4(s1_ret_4), .ret_5(s1_ret_5), .ret_6(s1_ret_6));
   FP16BAddSubS2Of5
     inst_2(.clk(clk), .rst(rst),
	    .arg_0(s2_arg_0), .arg_1(s2_arg_1), .arg_2(s2_arg_2), .arg_3(s2_arg_3), .arg_4(s2_arg_4), .arg_5(s2_arg_5), .arg_6(s2_arg_6),
	    .ret_0(s2_ret_0), .ret_1(s2_ret_1), .ret_2(s2_ret_2), .ret_3(s2_ret_3), .ret_4(s2_ret_4), .ret_5(s2_ret_5));
   FP16BAddSubS3Of5
     inst_3(.clk(clk), .rst(rst),
	    .arg_0(s3_arg_0), .arg_1(s3_arg_1), .arg_2(s3_arg_2), .arg_3(s3_arg_3), .arg_4(s3_arg_4), .arg_5(s3_arg_5),
	    .ret_0(s3_ret_0), .ret_1(s3_ret_1), .ret_2(s3_ret_2), .ret_3(s3_ret_3), .ret_4(s3_ret_4), .ret_5(s3_ret_5), .ret_6(s3_ret_6));
   FP16BAddSubS4Of5
     inst_4(.clk(clk), .rst(rst),
	    .arg_0(s4_arg_0), .arg_1(s4_arg_1), .arg_2(s4_arg_2), .arg_3(s4_arg_3), .arg_4(s4_arg_4), .arg_5(s4_arg_5), .arg_6(s4_arg_6),
	    .ret_0(s4_ret_0));
   always @(s0_ret_0 or s0_ret_1 or s0_ret_2 or s0_ret_3) begin
      s1_arg_0 <= s0_ret_0;
      s1_arg_1 <= s0_ret_1;
      s1_arg_2 <= s0_ret_2;
      s1_arg_3 <= s0_ret_3;
      $display("S0: %d %d %d %d", s0_ret_0, s0_ret_1, s0_ret_2, s0_ret_3);
   end
   always @(s1_ret_0 or s1_ret_1 or s1_ret_2 or s1_ret_3 or s1_ret_4 or s1_ret_5 or s1_ret_6) begin
      s2_arg_0 <= s1_ret_0;
      s2_arg_1 <= s1_ret_1;
      s2_arg_2 <= s1_ret_2;
      s2_arg_3 <= s1_ret_3;
      s2_arg_4 <= s1_ret_4;
      s2_arg_5 <= s1_ret_5;
      s2_arg_6 <= s1_ret_6;
      $display("S1: %d %d %d %d %d %d %d", s1_ret_0, s1_ret_1, s1_ret_2, s1_ret_3, s1_ret_4, s1_ret_5, s1_ret_6);
   end
   always @(s2_ret_0 or s2_ret_1 or s2_ret_2 or s2_ret_3 or s2_ret_4 or s2_ret_5) begin
      s3_arg_0 <= s2_ret_0;
      s3_arg_1 <= s2_ret_1;
      s3_arg_2 <= s2_ret_2;
      s3_arg_3 <= s2_ret_3;
      s3_arg_4 <= s2_ret_4;
      s3_arg_5 <= s2_ret_5;
      $display("S2: %d %d %d %d %d %d", s2_ret_0, s2_ret_1, s2_ret_2, s2_ret_3, s2_ret_4, s2_ret_5);
   end
   always @(s3_ret_0 or s3_ret_1 or s3_ret_2 or s3_ret_3 or s3_ret_4 or s3_ret_5 or s3_ret_6) begin
      s4_arg_0 <= s3_ret_0;
      s4_arg_1 <= s3_ret_1;
      s4_arg_2 <= s3_ret_2;
      s4_arg_3 <= s3_ret_3;
      s4_arg_4 <= s3_ret_4;
      s4_arg_5 <= s3_ret_5;
      s4_arg_6 <= s3_ret_6;
      $display("S3: %d %d %d %d %d %d", s3_ret_0, s3_ret_1, s3_ret_2, s3_ret_3, s3_ret_4, s3_ret_5, s3_ret_6);
   end
   always @(s4_ret_0) begin
   end
   always @(xs or xe or xf or ys or ye or yf or is_sub) begin
      s0_arg_0 = {xs, xe, xf};
      s0_arg_1 = {ys, ye, yf};
      s0_arg_2 = is_sub;
   end
   initial begin
      // 0.0 + 0.0
      is_sub <= 0;
      xs <= 0; xe <= 0; xf <= 0;
      ys <= 0; ye <= 0; yf <= 0;
      #1
      $display("0.0+0.0= %d %s", s4_ret_0, (rs == 0 && re == 0 && rf == 0) ? "OK" : "FAIL");
      // 1.0 + 1.0
      is_sub <= 0;
      xs <= 0; xe <= 127; xf <= 0;
      ys <= 0; ye <= 127; yf <= 0;
      #1
      $display("1.0+1.0= %d %s", s4_ret_0, (rs == 0 && re == 128 && rf == 0) ? "OK" : "FAIL");
      // 1.0 + 2.0
      is_sub <= 0;
      xs <= 0; xe <= 127; xf <= 0;
      ys <= 0; ye <= 128; yf <= 0;
      #1
      $display("1.0+2.0= %d %s", s4_ret_0, (rs == 0 && re == 128 && rf == 64) ? "OK" : "FAIL");
      // 2.0 + 1.0
      is_sub <= 0;
      xs <= 0; xe <= 128; xf <= 0;
      ys <= 0; ye <= 127; yf <= 0;
      #1
      $display("2.0+1.0= %d %s", s4_ret_0, (rs == 0 && re == 128 && rf == 64) ? "OK" : "FAIL");
      // 2.0 - 1.0
      is_sub <= 1;
      xs <= 0; xe <= 128; xf <= 0;
      ys <= 0; ye <= 127; yf <= 0;
      #1
      $display("2.0-1.0= %d %s", s4_ret_0, (rs == 0 && re == 127 && rf == 0) ? "OK" : "FAIL");
      // 2.0 + - 1.0
      is_sub <= 0;
      xs <= 0; xe <= 128; xf <= 0;
      ys <= 1; ye <= 127; yf <= 0;
      #1
      $display("2.0 + -1.0= %d %s", s4_ret_0, (rs == 0 && re == 127 && rf == 0) ? "OK" : "FAIL");
      // 1.0 - 2.0
      is_sub <= 1;
      xs <= 0; xe <= 127; xf <= 0;
      ys <= 0; ye <= 128; yf <= 0;
      #1
      $display("1.0-2.0= %d %s", s4_ret_0, (rs == 1 && re == 127 && rf == 0) ? "OK" : "FAIL");
      // 2^-14 - 2.0
      is_sub <= 1;
      xs <= 0; xe <= 1; xf <= 64;
      ys <= 0; ye <= 1; yf <= 63;
      #1
      $display("192/128 * 2^-127 - 191/64*2^127= %d %s", s4_ret_0, (rs == 0 && re == 0 && rf == 0) ? "OK" : "FAIL");
      // Use this line to debug a specific case.
      $display("%d %d %d", rs, re, rf);
   end
endmodule