module asfifo9_4 (Data, WrClock, RdClock, WrEn, RdEn, Reset, RPReset, Q,
    Empty, Full);
    input wire [8:0] Data;
    input wire WrClock;
    input wire RdClock;
    input wire WrEn;
    input wire RdEn;
    input wire Reset;
    input wire RPReset;
    output wire [8:0] Q;
    output wire Empty;
    output wire Full;
    wire invout_1;
    wire invout_0;
    wire w_gdata_0;
    wire w_gdata_1;
    wire w_gdata_2;
    wire w_gdata_3;
    wire wptr_0;
    wire wptr_1;
    wire wptr_2;
    wire wptr_3;
    wire wptr_4;
    wire r_gdata_0;
    wire r_gdata_1;
    wire r_gdata_2;
    wire r_gdata_3;
    wire rptr_0;
    wire rptr_1;
    wire rptr_2;
    wire rptr_3;
    wire rptr_4;
    wire w_gcount_0;
    wire w_gcount_1;
    wire w_gcount_2;
    wire w_gcount_3;
    wire w_gcount_4;
    wire r_gcount_0;
    wire r_gcount_1;
    wire r_gcount_2;
    wire r_gcount_3;
    wire r_gcount_4;
    wire w_gcount_r20;
    wire w_gcount_r0;
    wire w_gcount_r21;
    wire w_gcount_r1;
    wire w_gcount_r22;
    wire w_gcount_r2;
    wire w_gcount_r23;
    wire w_gcount_r3;
    wire w_gcount_r24;
    wire w_gcount_r4;
    wire r_gcount_w20;
    wire r_gcount_w0;
    wire r_gcount_w21;
    wire r_gcount_w1;
    wire r_gcount_w22;
    wire r_gcount_w2;
    wire r_gcount_w23;
    wire r_gcount_w3;
    wire r_gcount_w24;
    wire r_gcount_w4;
    wire empty_i;
    wire rRst;
    wire full_i;
    wire iwcount_0;
    wire iwcount_1;
    wire w_gctr_ci;
    wire iwcount_2;
    wire iwcount_3;
    wire co0;
    wire iwcount_4;
    wire co2;
    wire wcount_4;
    wire co1;
    wire scuba_vhi;
    wire ircount_0;
    wire ircount_1;
    wire r_gctr_ci;
    wire ircount_2;
    wire ircount_3;
    wire co0_1;
    wire ircount_4;
    wire co2_1;
    wire rcount_4;
    wire co1_1;
    wire rden_i;
    wire cmp_ci;
    wire wcount_r0;
    wire w_g2b_xor_cluster_0;
    wire rcount_0;
    wire rcount_1;
    wire co0_2;
    wire wcount_r2;
    wire wcount_r3;
    wire rcount_2;
    wire rcount_3;
    wire co1_2;
    wire empty_cmp_clr;
    wire empty_cmp_set;
    wire empty_d;
    wire empty_d_c;
    wire wren_i;
    wire cmp_ci_1;
    wire rcount_w0;
    wire r_g2b_xor_cluster_0;
    wire wcount_0;
    wire wcount_1;
    wire co0_3;
    wire rcount_w2;
    wire rcount_w3;
    wire wcount_2;
    wire wcount_3;
    wire co1_3;
    wire full_cmp_clr;
    wire full_cmp_set;
    wire full_d;
    wire full_d_c;
    wire scuba_vlo;
    AND2 AND2_t10 (.A(WrEn), .B(invout_1), .Z(wren_i));
    INV INV_1 (.A(full_i), .Z(invout_1));
    AND2 AND2_t9 (.A(RdEn), .B(invout_0), .Z(rden_i));
    INV INV_0 (.A(empty_i), .Z(invout_0));
    OR2 OR2_t8 (.A(Reset), .B(RPReset), .Z(rRst));
    XOR2 XOR2_t7 (.A(wcount_0), .B(wcount_1), .Z(w_gdata_0));
    XOR2 XOR2_t6 (.A(wcount_1), .B(wcount_2), .Z(w_gdata_1));
    XOR2 XOR2_t5 (.A(wcount_2), .B(wcount_3), .Z(w_gdata_2));
    XOR2 XOR2_t4 (.A(wcount_3), .B(wcount_4), .Z(w_gdata_3));
    XOR2 XOR2_t3 (.A(rcount_0), .B(rcount_1), .Z(r_gdata_0));
    XOR2 XOR2_t2 (.A(rcount_1), .B(rcount_2), .Z(r_gdata_1));
    XOR2 XOR2_t1 (.A(rcount_2), .B(rcount_3), .Z(r_gdata_2));
    XOR2 XOR2_t0 (.A(rcount_3), .B(rcount_4), .Z(r_gdata_3));
    defparam LUT4_11.initval =  16'h6996 ;
    ROM16X1A LUT4_11 (.AD3(w_gcount_r21), .AD2(w_gcount_r22), .AD1(w_gcount_r23),
        .AD0(w_gcount_r24), .DO0(w_g2b_xor_cluster_0));
    defparam LUT4_10.initval =  16'h6996 ;
    ROM16X1A LUT4_10 (.AD3(w_gcount_r23), .AD2(w_gcount_r24), .AD1(scuba_vlo),
        .AD0(scuba_vlo), .DO0(wcount_r3));
    defparam LUT4_9.initval =  16'h6996 ;
    ROM16X1A LUT4_9 (.AD3(w_gcount_r22), .AD2(w_gcount_r23), .AD1(w_gcount_r24),
        .AD0(scuba_vlo), .DO0(wcount_r2));
    defparam LUT4_8.initval =  16'h6996 ;
    ROM16X1A LUT4_8 (.AD3(w_gcount_r20), .AD2(w_gcount_r21), .AD1(w_gcount_r22),
        .AD0(wcount_r3), .DO0(wcount_r0));
    defparam LUT4_7.initval =  16'h6996 ;
    ROM16X1A LUT4_7 (.AD3(r_gcount_w21), .AD2(r_gcount_w22), .AD1(r_gcount_w23),
        .AD0(r_gcount_w24), .DO0(r_g2b_xor_cluster_0));
    defparam LUT4_6.initval =  16'h6996 ;
    ROM16X1A LUT4_6 (.AD3(r_gcount_w23), .AD2(r_gcount_w24), .AD1(scuba_vlo),
        .AD0(scuba_vlo), .DO0(rcount_w3));
    defparam LUT4_5.initval =  16'h6996 ;
    ROM16X1A LUT4_5 (.AD3(r_gcount_w22), .AD2(r_gcount_w23), .AD1(r_gcount_w24),
        .AD0(scuba_vlo), .DO0(rcount_w2));
    defparam LUT4_4.initval =  16'h6996 ;
    ROM16X1A LUT4_4 (.AD3(r_gcount_w20), .AD2(r_gcount_w21), .AD1(r_gcount_w22),
        .AD0(rcount_w3), .DO0(rcount_w0));
    defparam LUT4_3.initval =  16'h0410 ;
    ROM16X1A LUT4_3 (.AD3(rptr_4), .AD2(rcount_4), .AD1(w_gcount_r24), .AD0(scuba_vlo),
        .DO0(empty_cmp_set));
    defparam LUT4_2.initval =  16'h1004 ;
    ROM16X1A LUT4_2 (.AD3(rptr_4), .AD2(rcount_4), .AD1(w_gcount_r24), .AD0(scuba_vlo),
        .DO0(empty_cmp_clr));
    defparam LUT4_1.initval =  16'h0140 ;
    ROM16X1A LUT4_1 (.AD3(wptr_4), .AD2(wcount_4), .AD1(r_gcount_w24), .AD0(scuba_vlo),
        .DO0(full_cmp_set));
    defparam LUT4_0.initval =  16'h4001 ;
    ROM16X1A LUT4_0 (.AD3(wptr_4), .AD2(wcount_4), .AD1(r_gcount_w24), .AD0(scuba_vlo),
        .DO0(full_cmp_clr));
    defparam pdp_ram_0_0_0.CSDECODE_B = "0b000" ;
    defparam pdp_ram_0_0_0.CSDECODE_A = "0b000" ;
    defparam pdp_ram_0_0_0.WRITEMODE_B = "NORMAL" ;
    defparam pdp_ram_0_0_0.WRITEMODE_A = "NORMAL" ;
    defparam pdp_ram_0_0_0.GSR = "DISABLED" ;
    defparam pdp_ram_0_0_0.REGMODE_B = "NOREG" ;
    defparam pdp_ram_0_0_0.REGMODE_A = "NOREG" ;
    defparam pdp_ram_0_0_0.DATA_WIDTH_B = 9 ;
    defparam pdp_ram_0_0_0.DATA_WIDTH_A = 9 ;
    DP16KC pdp_ram_0_0_0 (.DIA0(Data[0]), .DIA1(Data[1]), .DIA2(Data[2]),
        .DIA3(Data[3]), .DIA4(Data[4]), .DIA5(Data[5]), .DIA6(Data[6]),
        .DIA7(Data[7]), .DIA8(Data[8]), .DIA9(scuba_vlo), .DIA10(scuba_vlo),
        .DIA11(scuba_vlo), .DIA12(scuba_vlo), .DIA13(scuba_vlo), .DIA14(scuba_vlo),
        .DIA15(scuba_vlo), .DIA16(scuba_vlo), .DIA17(scuba_vlo), .ADA0(scuba_vlo),
        .ADA1(scuba_vlo), .ADA2(scuba_vlo), .ADA3(wptr_0), .ADA4(wptr_1),
        .ADA5(wptr_2), .ADA6(wptr_3), .ADA7(scuba_vlo), .ADA8(scuba_vlo),
        .ADA9(scuba_vlo), .ADA10(scuba_vlo), .ADA11(scuba_vlo), .ADA12(scuba_vlo),
        .ADA13(scuba_vlo), .CEA(wren_i), .CLKA(WrClock), .OCEA(wren_i),
        .WEA(scuba_vhi), .CSA0(scuba_vlo), .CSA1(scuba_vlo), .CSA2(scuba_vlo),
        .RSTA(Reset), .DIB0(scuba_vlo), .DIB1(scuba_vlo), .DIB2(scuba_vlo),
        .DIB3(scuba_vlo), .DIB4(scuba_vlo), .DIB5(scuba_vlo), .DIB6(scuba_vlo),
        .DIB7(scuba_vlo), .DIB8(scuba_vlo), .DIB9(scuba_vlo), .DIB10(scuba_vlo),
        .DIB11(scuba_vlo), .DIB12(scuba_vlo), .DIB13(scuba_vlo), .DIB14(scuba_vlo),
        .DIB15(scuba_vlo), .DIB16(scuba_vlo), .DIB17(scuba_vlo), .ADB0(scuba_vlo),
        .ADB1(scuba_vlo), .ADB2(scuba_vlo), .ADB3(rptr_0), .ADB4(rptr_1),
        .ADB5(rptr_2), .ADB6(rptr_3), .ADB7(scuba_vlo), .ADB8(scuba_vlo),
        .ADB9(scuba_vlo), .ADB10(scuba_vlo), .ADB11(scuba_vlo), .ADB12(scuba_vlo),
        .ADB13(scuba_vlo), .CEB(rden_i), .CLKB(RdClock), .OCEB(rden_i),
        .WEB(scuba_vlo), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo),
        .RSTB(Reset), .DOA0(), .DOA1(), .DOA2(), .DOA3(), .DOA4(), .DOA5(),
        .DOA6(), .DOA7(), .DOA8(), .DOA9(), .DOA10(), .DOA11(), .DOA12(),
        .DOA13(), .DOA14(), .DOA15(), .DOA16(), .DOA17(), .DOB0(Q[0]), .DOB1(Q[1]),
        .DOB2(Q[2]), .DOB3(Q[3]), .DOB4(Q[4]), .DOB5(Q[5]), .DOB6(Q[6]),
        .DOB7(Q[7]), .DOB8(Q[8]), .DOB9(), .DOB10(), .DOB11(), .DOB12(),
        .DOB13(), .DOB14(), .DOB15(), .DOB16(), .DOB17())
             /* synthesis MEM_LPC_FILE="asfifo9_4.lpc" */
             /* synthesis MEM_INIT_FILE="" */
             /* synthesis RESETMODE="SYNC" */;
    FD1P3BX FF_51 (.D(iwcount_0), .SP(wren_i), .CK(WrClock), .PD(Reset),
        .Q(wcount_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_50 (.D(iwcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wcount_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_49 (.D(iwcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wcount_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_48 (.D(iwcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wcount_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_47 (.D(iwcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wcount_4))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_46 (.D(w_gdata_0), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(w_gcount_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_45 (.D(w_gdata_1), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(w_gcount_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_44 (.D(w_gdata_2), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(w_gcount_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_43 (.D(w_gdata_3), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(w_gcount_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_42 (.D(wcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(w_gcount_4))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_41 (.D(wcount_0), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wptr_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_40 (.D(wcount_1), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wptr_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_39 (.D(wcount_2), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wptr_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_38 (.D(wcount_3), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wptr_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_37 (.D(wcount_4), .SP(wren_i), .CK(WrClock), .CD(Reset),
        .Q(wptr_4))
             /* synthesis GSR="ENABLED" */;
    FD1P3BX FF_36 (.D(ircount_0), .SP(rden_i), .CK(RdClock), .PD(rRst),
        .Q(rcount_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_35 (.D(ircount_1), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(rcount_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_34 (.D(ircount_2), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(rcount_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_33 (.D(ircount_3), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(rcount_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_32 (.D(ircount_4), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(rcount_4))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_31 (.D(r_gdata_0), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(r_gcount_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_30 (.D(r_gdata_1), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(r_gcount_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_29 (.D(r_gdata_2), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(r_gcount_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_28 (.D(r_gdata_3), .SP(rden_i), .CK(RdClock), .CD(rRst),
        .Q(r_gcount_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_27 (.D(rcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(r_gcount_4))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_26 (.D(rcount_0), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(rptr_0))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_25 (.D(rcount_1), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(rptr_1))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_24 (.D(rcount_2), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(rptr_2))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_23 (.D(rcount_3), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(rptr_3))
             /* synthesis GSR="ENABLED" */;
    FD1P3DX FF_22 (.D(rcount_4), .SP(rden_i), .CK(RdClock), .CD(rRst), .Q(rptr_4))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_21 (.D(w_gcount_0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r0))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_20 (.D(w_gcount_1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r1))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_19 (.D(w_gcount_2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r2))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_18 (.D(w_gcount_3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r3))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_17 (.D(w_gcount_4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r4))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_16 (.D(r_gcount_0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w0))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_15 (.D(r_gcount_1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w1))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_14 (.D(r_gcount_2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w2))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_13 (.D(r_gcount_3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w3))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_12 (.D(r_gcount_4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w4))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_11 (.D(w_gcount_r0), .CK(RdClock), .CD(Reset), .Q(w_gcount_r20))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_10 (.D(w_gcount_r1), .CK(RdClock), .CD(Reset), .Q(w_gcount_r21))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_9 (.D(w_gcount_r2), .CK(RdClock), .CD(Reset), .Q(w_gcount_r22))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_8 (.D(w_gcount_r3), .CK(RdClock), .CD(Reset), .Q(w_gcount_r23))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_7 (.D(w_gcount_r4), .CK(RdClock), .CD(Reset), .Q(w_gcount_r24))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_6 (.D(r_gcount_w0), .CK(WrClock), .CD(rRst), .Q(r_gcount_w20))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_5 (.D(r_gcount_w1), .CK(WrClock), .CD(rRst), .Q(r_gcount_w21))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_4 (.D(r_gcount_w2), .CK(WrClock), .CD(rRst), .Q(r_gcount_w22))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_3 (.D(r_gcount_w3), .CK(WrClock), .CD(rRst), .Q(r_gcount_w23))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_2 (.D(r_gcount_w4), .CK(WrClock), .CD(rRst), .Q(r_gcount_w24))
             /* synthesis GSR="ENABLED" */;
    FD1S3BX FF_1 (.D(empty_d), .CK(RdClock), .PD(rRst), .Q(empty_i))
             /* synthesis GSR="ENABLED" */;
    FD1S3DX FF_0 (.D(full_d), .CK(WrClock), .CD(Reset), .Q(full_i))
             /* synthesis GSR="ENABLED" */;
    FADD2B w_gctr_cia (.A0(scuba_vlo), .A1(scuba_vhi), .B0(scuba_vlo), .B1(scuba_vhi),
        .CI(scuba_vlo), .COUT(w_gctr_ci), .S0(), .S1());
    CU2 w_gctr_0 (.CI(w_gctr_ci), .PC0(wcount_0), .PC1(wcount_1), .CO(co0),
        .NC0(iwcount_0), .NC1(iwcount_1));
    CU2 w_gctr_1 (.CI(co0), .PC0(wcount_2), .PC1(wcount_3), .CO(co1), .NC0(iwcount_2),
        .NC1(iwcount_3));
    CU2 w_gctr_2 (.CI(co1), .PC0(wcount_4), .PC1(scuba_vlo), .CO(co2), .NC0(iwcount_4),
        .NC1());
    VHI scuba_vhi_inst (.Z(scuba_vhi));
    FADD2B r_gctr_cia (.A0(scuba_vlo), .A1(scuba_vhi), .B0(scuba_vlo), .B1(scuba_vhi),
        .CI(scuba_vlo), .COUT(r_gctr_ci), .S0(), .S1());
    CU2 r_gctr_0 (.CI(r_gctr_ci), .PC0(rcount_0), .PC1(rcount_1), .CO(co0_1),
        .NC0(ircount_0), .NC1(ircount_1));
    CU2 r_gctr_1 (.CI(co0_1), .PC0(rcount_2), .PC1(rcount_3), .CO(co1_1),
        .NC0(ircount_2), .NC1(ircount_3));
    CU2 r_gctr_2 (.CI(co1_1), .PC0(rcount_4), .PC1(scuba_vlo), .CO(co2_1),
        .NC0(ircount_4), .NC1());
    FADD2B empty_cmp_ci_a (.A0(scuba_vlo), .A1(rden_i), .B0(scuba_vlo),
        .B1(rden_i), .CI(scuba_vlo), .COUT(cmp_ci), .S0(), .S1());
    AGEB2 empty_cmp_0 (.A0(rcount_0), .A1(rcount_1), .B0(wcount_r0), .B1(w_g2b_xor_cluster_0),
        .CI(cmp_ci), .GE(co0_2));
    AGEB2 empty_cmp_1 (.A0(rcount_2), .A1(rcount_3), .B0(wcount_r2), .B1(wcount_r3),
        .CI(co0_2), .GE(co1_2));
    AGEB2 empty_cmp_2 (.A0(empty_cmp_set), .A1(scuba_vlo), .B0(empty_cmp_clr),
        .B1(scuba_vlo), .CI(co1_2), .GE(empty_d_c));
    FADD2B a0 (.A0(scuba_vlo), .A1(scuba_vlo), .B0(scuba_vlo), .B1(scuba_vlo),
        .CI(empty_d_c), .COUT(), .S0(empty_d), .S1());
    FADD2B full_cmp_ci_a (.A0(scuba_vlo), .A1(wren_i), .B0(scuba_vlo), .B1(wren_i),
        .CI(scuba_vlo), .COUT(cmp_ci_1), .S0(), .S1());
    AGEB2 full_cmp_0 (.A0(wcount_0), .A1(wcount_1), .B0(rcount_w0), .B1(r_g2b_xor_cluster_0),
        .CI(cmp_ci_1), .GE(co0_3));
    AGEB2 full_cmp_1 (.A0(wcount_2), .A1(wcount_3), .B0(rcount_w2), .B1(rcount_w3),
        .CI(co0_3), .GE(co1_3));
    AGEB2 full_cmp_2 (.A0(full_cmp_set), .A1(scuba_vlo), .B0(full_cmp_clr),
        .B1(scuba_vlo), .CI(co1_3), .GE(full_d_c));
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    FADD2B a1 (.A0(scuba_vlo), .A1(scuba_vlo), .B0(scuba_vlo), .B1(scuba_vlo),
        .CI(full_d_c), .COUT(), .S0(full_d), .S1());
    assign Empty = empty_i;
    assign Full = full_i;
    // exemplar begin
    // exemplar attribute pdp_ram_0_0_0 MEM_LPC_FILE asfifo9_4.lpc
    // exemplar attribute pdp_ram_0_0_0 MEM_INIT_FILE
    // exemplar attribute pdp_ram_0_0_0 RESETMODE SYNC
    // exemplar attribute FF_51 GSR ENABLED
    // exemplar attribute FF_50 GSR ENABLED
    // exemplar attribute FF_49 GSR ENABLED
    // exemplar attribute FF_48 GSR ENABLED
    // exemplar attribute FF_47 GSR ENABLED
    // exemplar attribute FF_46 GSR ENABLED
    // exemplar attribute FF_45 GSR ENABLED
    // exemplar attribute FF_44 GSR ENABLED
    // exemplar attribute FF_43 GSR ENABLED
    // exemplar attribute FF_42 GSR ENABLED
    // exemplar attribute FF_41 GSR ENABLED
    // exemplar attribute FF_40 GSR ENABLED
    // exemplar attribute FF_39 GSR ENABLED
    // exemplar attribute FF_38 GSR ENABLED
    // exemplar attribute FF_37 GSR ENABLED
    // exemplar attribute FF_36 GSR ENABLED
    // exemplar attribute FF_35 GSR ENABLED
    // exemplar attribute FF_34 GSR ENABLED
    // exemplar attribute FF_33 GSR ENABLED
    // exemplar attribute FF_32 GSR ENABLED
    // exemplar attribute FF_31 GSR ENABLED
    // exemplar attribute FF_30 GSR ENABLED
    // exemplar attribute FF_29 GSR ENABLED
    // exemplar attribute FF_28 GSR ENABLED
    // exemplar attribute FF_27 GSR ENABLED
    // exemplar attribute FF_26 GSR ENABLED
    // exemplar attribute FF_25 GSR ENABLED
    // exemplar attribute FF_24 GSR ENABLED
    // exemplar attribute FF_23 GSR ENABLED
    // exemplar attribute FF_22 GSR ENABLED
    // exemplar attribute FF_21 GSR ENABLED
    // exemplar attribute FF_20 GSR ENABLED
    // exemplar attribute FF_19 GSR ENABLED
    // exemplar attribute FF_18 GSR ENABLED
    // exemplar attribute FF_17 GSR ENABLED
    // exemplar attribute FF_16 GSR ENABLED
    // exemplar attribute FF_15 GSR ENABLED
    // exemplar attribute FF_14 GSR ENABLED
    // exemplar attribute FF_13 GSR ENABLED
    // exemplar attribute FF_12 GSR ENABLED
    // exemplar attribute FF_11 GSR ENABLED
    // exemplar attribute FF_10 GSR ENABLED
    // exemplar attribute FF_9 GSR ENABLED
    // exemplar attribute FF_8 GSR ENABLED
    // exemplar attribute FF_7 GSR ENABLED
    // exemplar attribute FF_6 GSR ENABLED
    // exemplar attribute FF_5 GSR ENABLED
    // exemplar attribute FF_4 GSR ENABLED
    // exemplar attribute FF_3 GSR ENABLED
    // exemplar attribute FF_2 GSR ENABLED
    // exemplar attribute FF_1 GSR ENABLED
    // exemplar attribute FF_0 GSR ENABLED
    // exemplar end
endmodule