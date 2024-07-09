module section3_schematic (A, B, C, D, LED, SegA, SegB, SegC,
            SegD, SegE, SegF, SegG) /* synthesis syn_module_defined=1 */ ;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(3[8:26])
    input A;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(5[8:9])
    input B;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(6[8:9])
    input C;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(7[8:9])
    input D;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(8[8:9])
    output LED;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(9[8:11])
    output SegA;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(10[8:12])
    output SegB;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(11[8:12])
    output SegC;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(12[8:12])
    output SegD;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(13[8:12])
    output SegE;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(14[8:12])
    output SegF;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(15[8:12])
    output SegG;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(16[8:12])
    wire A_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(5[8:9])
    wire B_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(6[8:9])
    wire C_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(7[8:9])
    wire D_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(8[8:9])
    wire LED_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(9[8:11])
    wire SegA_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(10[8:12])
    wire SegB_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(11[8:12])
    wire SegC_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(12[8:12])
    wire SegD_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(13[8:12])
    wire SegE_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(14[8:12])
    wire SegF_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(15[8:12])
    wire SegG_c;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(16[8:12])
    wire N_44;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(17[6:10])
    wire N_45;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(18[6:10])
    wire N_46;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(19[6:10])
    wire N_42;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(20[6:10])
    wire N_43;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(21[6:10])
    wire N_35;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(22[6:10])
    wire N_39;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(23[6:10])
    wire N_28;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(24[6:10])
    wire N_29;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(25[6:10])
    wire N_30;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(26[6:10])
    wire N_16;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(27[6:10])
    wire N_17;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(28[6:10])
    wire N_18;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(29[6:10])
    wire N_19;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(30[6:10])
    wire N_20;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(31[6:10])
    wire N_21;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(32[6:10])
    wire N_22;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(33[6:10])
    wire N_23;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(34[6:10])
    wire N_24;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(35[6:10])
    wire N_25;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(36[6:10])
    wire N_26;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(37[6:10])
    wire N_1;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(38[6:9])
    wire N_2;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(39[6:9])
    wire N_3;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(40[6:9])
    wire N_8;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(41[6:9])
    wire N_9;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(42[6:9])
    wire N_10;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(43[6:10])
    wire N_11;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(44[6:10])
    wire N_12;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(45[6:10])
    wire N_13;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(46[6:10])
    wire N_14;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(47[6:10])
    wire N_15;   // c:/lscc/diamond/3.1_x64/bin/nt64/lab3_7segdisplaydriver/section3/section3_schematic.v(48[6:10])
    wire GND_net, VCC_net;
    IB A_pad (.I(A), .O(A_c));
    OR3 I24 (.A(N_22), .B(N_20), .C(N_21), .Z(SegE_c)) /* synthesis syn_instantiated=1 */ ;
    OR3 I18 (.A(N_3), .B(N_1), .C(N_2), .Z(SegC_c)) /* synthesis syn_instantiated=1 */ ;
    AND3 I33 (.A(N_45), .B(N_42), .C(N_44), .Z(N_28)) /* synthesis syn_instantiated=1 */ ;
    AND3 I25 (.A(N_45), .B(N_42), .C(N_46), .Z(N_18)) /* synthesis syn_instantiated=1 */ ;
    AND3 I26 (.A(N_45), .B(N_46), .C(N_35), .Z(N_17)) /* synthesis syn_instantiated=1 */ ;
    AND3 I27 (.A(N_45), .B(N_42), .C(N_35), .Z(N_16)) /* synthesis syn_instantiated=1 */ ;
    AND3 I28 (.A(N_42), .B(N_44), .C(N_35), .Z(N_20)) /* synthesis syn_instantiated=1 */ ;
    AND3 I29 (.A(N_45), .B(N_43), .C(N_44), .Z(N_22)) /* synthesis syn_instantiated=1 */ ;
    AND3 I19 (.A(N_43), .B(N_46), .C(N_35), .Z(N_25)) /* synthesis syn_instantiated=1 */ ;
    AND3 I5 (.A(N_43), .B(N_46), .C(LED_c), .Z(N_10)) /* synthesis syn_instantiated=1 */ ;
    AND3 I4 (.A(N_39), .B(N_43), .C(LED_c), .Z(N_11)) /* synthesis syn_instantiated=1 */ ;
    AND3 I3 (.A(N_39), .B(N_46), .C(N_35), .Z(N_15)) /* synthesis syn_instantiated=1 */ ;
    AND3 I2 (.A(N_39), .B(N_43), .C(LED_c), .Z(N_1)) /* synthesis syn_instantiated=1 */ ;
    AND3 I1 (.A(N_39), .B(N_43), .C(N_46), .Z(N_2)) /* synthesis syn_instantiated=1 */ ;
    OR4 I30 (.A(N_19), .B(N_16), .C(N_17), .D(N_18), .Z(SegF_c)) /* synthesis syn_instantiated=1 */ ;
    OR4 I31 (.A(N_26), .B(N_23), .C(N_24), .D(N_25), .Z(SegD_c)) /* synthesis syn_instantiated=1 */ ;
    OR4 I7 (.A(N_12), .B(N_8), .C(N_9), .D(N_13), .Z(SegA_c)) /* synthesis syn_instantiated=1 */ ;
    OR4 I6 (.A(N_14), .B(N_10), .C(N_11), .D(N_15), .Z(SegB_c)) /* synthesis syn_instantiated=1 */ ;
    AND4 I35 (.A(N_45), .B(N_43), .C(N_46), .D(N_35), .Z(N_29)) /* synthesis syn_instantiated=1 */ ;
    AND4 I34 (.A(N_39), .B(N_43), .C(N_44), .D(LED_c), .Z(N_30)) /* synthesis syn_instantiated=1 */ ;
    AND4 I32 (.A(N_39), .B(N_43), .C(N_44), .D(N_35), .Z(N_19)) /* synthesis syn_instantiated=1 */ ;
    AND4 I22 (.A(N_45), .B(N_43), .C(N_44), .D(LED_c), .Z(N_26)) /* synthesis syn_instantiated=1 */ ;
    AND4 I20 (.A(N_39), .B(N_42), .C(N_46), .D(LED_c), .Z(N_24)) /* synthesis syn_instantiated=1 */ ;
    AND4 I21 (.A(N_45), .B(N_42), .C(N_44), .D(N_35), .Z(N_23)) /* synthesis syn_instantiated=1 */ ;
    AND4 I13 (.A(N_45), .B(N_42), .C(N_44), .D(N_35), .Z(N_12)) /* synthesis syn_instantiated=1 */ ;
    AND4 I12 (.A(N_45), .B(N_43), .C(N_44), .D(LED_c), .Z(N_8)) /* synthesis syn_instantiated=1 */ ;
    AND4 I11 (.A(N_39), .B(N_43), .C(N_44), .D(N_35), .Z(N_9)) /* synthesis syn_instantiated=1 */ ;
    AND4 I10 (.A(N_39), .B(N_42), .C(N_46), .D(N_35), .Z(N_13)) /* synthesis syn_instantiated=1 */ ;
    AND4 I9 (.A(N_45), .B(N_43), .C(N_44), .D(N_35), .Z(N_14)) /* synthesis syn_instantiated=1 */ ;
    AND4 I8 (.A(N_45), .B(N_42), .C(N_46), .D(LED_c), .Z(N_3)) /* synthesis syn_instantiated=1 */ ;
    INV I15 (.A(N_46), .Z(N_44));
    OB SegG_pad (.I(SegG_c), .O(SegG));
    OB SegF_pad (.I(SegF_c), .O(SegF));
    OB SegE_pad (.I(SegE_c), .O(SegE));
    OB SegD_pad (.I(SegD_c), .O(SegD));
    OB SegC_pad (.I(SegC_c), .O(SegC));
    OB SegB_pad (.I(SegB_c), .O(SegB));
    OB SegA_pad (.I(SegA_c), .O(SegA));
    OB LED_pad (.I(LED_c), .O(LED));
    VLO i29 (.Z(GND_net));
    AND2 I23 (.A(N_45), .B(N_35), .Z(N_21)) /* synthesis syn_instantiated=1 */ ;
    OR3 I36 (.A(N_29), .B(N_30), .C(N_28), .Z(SegG_c)) /* synthesis syn_instantiated=1 */ ;
    INV I16 (.A(N_43), .Z(N_42));
    INV I37 (.A(D_c), .Z(N_35));
    INV I38 (.A(C_c), .Z(N_46));
    INV I39 (.A(B_c), .Z(N_43));
    INV I40 (.A(A_c), .Z(N_39));
    INV I17 (.A(N_39), .Z(N_45));
    INV I14 (.A(N_35), .Z(LED_c));
    IB B_pad (.I(B), .O(B_c));
    IB C_pad (.I(C), .O(C_c));
    IB D_pad (.I(D), .O(D_c));
    GSR GSR_INST (.GSR(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VHI i30 (.Z(VCC_net));
endmodule