module clock_counter (clk_slow, clk, GND_net) /* synthesis syn_module_defined=1 */ ;
    output clk_slow;
    input clk;
    input GND_net;
    wire [15:0]count;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab6_finaldesign/section6_finaldesign/source/clock_counter.v(8[14:19])
    wire n24, n26;
    wire [14:0]n66;
    wire n104, n8, n14, n112, n8_adj_1, n110, n109, n108, n107,
        n106, n105;
    LUT4 i15_2_lut (.A(clk_slow), .B(n24), .Z(n26)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i15_2_lut.init = 16'h6666;
    FD1S3IX dff_11_31_32__i1 (.D(n66[0]), .CK(clk), .CD(n24), .Q(count[0]));
    defparam dff_11_31_32__i1.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i15 (.D(n66[14]), .CK(clk), .CD(n24), .Q(count[14]));
    defparam dff_11_31_32__i15.GSR = "ENABLED";
    FD1S3AX clk_o_13 (.D(n26), .CK(clk), .Q(clk_slow));
    defparam clk_o_13.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i14 (.D(n66[13]), .CK(clk), .CD(n24), .Q(count[13]));
    defparam dff_11_31_32__i14.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i13 (.D(n66[12]), .CK(clk), .CD(n24), .Q(count[12]));
    defparam dff_11_31_32__i13.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i12 (.D(n66[11]), .CK(clk), .CD(n24), .Q(count[11]));
    defparam dff_11_31_32__i12.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i11 (.D(n66[10]), .CK(clk), .CD(n24), .Q(count[10]));
    defparam dff_11_31_32__i11.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i10 (.D(n66[9]), .CK(clk), .CD(n24), .Q(count[9]));
    defparam dff_11_31_32__i10.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i9 (.D(n66[8]), .CK(clk), .CD(n24), .Q(count[8]));
    defparam dff_11_31_32__i9.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i8 (.D(n66[7]), .CK(clk), .CD(n24), .Q(count[7]));
    defparam dff_11_31_32__i8.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i7 (.D(n66[6]), .CK(clk), .CD(n24), .Q(count[6]));
    defparam dff_11_31_32__i7.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i6 (.D(n66[5]), .CK(clk), .CD(n24), .Q(count[5]));
    defparam dff_11_31_32__i6.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i5 (.D(n66[4]), .CK(clk), .CD(n24), .Q(count[4]));
    defparam dff_11_31_32__i5.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i4 (.D(n66[3]), .CK(clk), .CD(n24), .Q(count[3]));
    defparam dff_11_31_32__i4.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i3 (.D(n66[2]), .CK(clk), .CD(n24), .Q(count[2]));
    defparam dff_11_31_32__i3.GSR = "ENABLED";
    FD1S3IX dff_11_31_32__i2 (.D(n66[1]), .CK(clk), .CD(n24), .Q(count[1]));
    defparam dff_11_31_32__i2.GSR = "ENABLED";
    CCU2D dff_11_31_32_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net),
          .COUT(n104), .S1(n66[0]));
    defparam dff_11_31_32_add_4_1.INIT0 = 16'hF000;
    defparam dff_11_31_32_add_4_1.INIT1 = 16'h0555;
    defparam dff_11_31_32_add_4_1.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_1.INJECT1_1 = "NO";
    LUT4 i50_4_lut (.A(count[0]), .B(count[3]), .C(count[2]), .D(count[1]),
         .Z(n8)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;
    defparam i50_4_lut.init = 16'hfcec;
    LUT4 i49_4_lut (.A(count[5]), .B(count[6]), .C(count[4]), .D(n8),
         .Z(n14)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i49_4_lut.init = 16'heccc;
    LUT4 i3_4_lut (.A(n14), .B(count[9]), .C(count[8]), .D(count[7]),
         .Z(n112)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i3_3_lut (.A(count[13]), .B(count[12]), .C(count[10]), .Z(n8_adj_1)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i3_3_lut.init = 16'hfefe;
    LUT4 i48_4_lut (.A(count[11]), .B(count[14]), .C(n8_adj_1), .D(n112),
         .Z(n24)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i48_4_lut.init = 16'hccc8;
    CCU2D dff_11_31_32_add_4_15 (.A0(count[13]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[14]), .B1(GND_net), .C1(GND_net),
          .D1(GND_net), .CIN(n110), .S0(n66[13]), .S1(n66[14]));
    defparam dff_11_31_32_add_4_15.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_15.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_15.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_15.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_13 (.A0(count[11]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[12]), .B1(GND_net), .C1(GND_net),
          .D1(GND_net), .CIN(n109), .COUT(n110), .S0(n66[11]), .S1(n66[12]));
    defparam dff_11_31_32_add_4_13.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_13.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_13.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_13.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_11 (.A0(count[9]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[10]), .B1(GND_net), .C1(GND_net),
          .D1(GND_net), .CIN(n108), .COUT(n109), .S0(n66[9]), .S1(n66[10]));
    defparam dff_11_31_32_add_4_11.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_11.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_11.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_11.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_9 (.A0(count[7]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net),
          .CIN(n107), .COUT(n108), .S0(n66[7]), .S1(n66[8]));
    defparam dff_11_31_32_add_4_9.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_9.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_9.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_9.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_7 (.A0(count[5]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net),
          .CIN(n106), .COUT(n107), .S0(n66[5]), .S1(n66[6]));
    defparam dff_11_31_32_add_4_7.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_7.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_7.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_7.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_5 (.A0(count[3]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net),
          .CIN(n105), .COUT(n106), .S0(n66[3]), .S1(n66[4]));
    defparam dff_11_31_32_add_4_5.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_5.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_5.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_5.INJECT1_1 = "NO";
    CCU2D dff_11_31_32_add_4_3 (.A0(count[1]), .B0(GND_net), .C0(GND_net),
          .D0(GND_net), .A1(count[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net),
          .CIN(n104), .COUT(n105), .S0(n66[1]), .S1(n66[2]));
    defparam dff_11_31_32_add_4_3.INIT0 = 16'hfaaa;
    defparam dff_11_31_32_add_4_3.INIT1 = 16'hfaaa;
    defparam dff_11_31_32_add_4_3.INJECT1_0 = "NO";
    defparam dff_11_31_32_add_4_3.INJECT1_1 = "NO";
endmodule