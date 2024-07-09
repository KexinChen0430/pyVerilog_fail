module dlx_cu_MICROCODE_MEM_SIZE64_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE13 (
        Clk, Rst, IR_IN, stall_exe_i, mispredict_i, D1_i, D2_i, S1_LATCH_EN,
        S2_LATCH_EN, S3_LATCH_EN, S_MUX_PC_BUS, S_EXT, S_EXT_SIGN, S_EQ_NEQ,
        S_MUX_DEST, S_MUX_LINK, S_MEM_W_R, S_MEM_EN, S_RF_W_wb, S_RF_W_mem,
        S_RF_W_exe, S_MUX_ALUIN, stall_exe_o, stall_dec_o, stall_fetch_o,
        stall_btb_o, was_branch_o, was_jmp_o, ALU_WORD_o, .ALU_OPCODE({
        \ALU_OPCODE[4] , \ALU_OPCODE[3] , \ALU_OPCODE[2] , \ALU_OPCODE[1] ,
        \ALU_OPCODE[0] }), S_MUX_MEM_BAR );
  input [31:0] IR_IN;
  input [4:0] D1_i;
  input [4:0] D2_i;
  output [1:0] S_MUX_PC_BUS;
  output [1:0] S_MUX_DEST;
  output [12:0] ALU_WORD_o;
  input Clk, Rst, stall_exe_i, mispredict_i;
  output S1_LATCH_EN, S2_LATCH_EN, S3_LATCH_EN, S_EXT, S_EXT_SIGN, S_EQ_NEQ,
         S_MUX_LINK, S_MEM_W_R, S_MEM_EN, S_RF_W_wb, S_RF_W_mem, S_RF_W_exe,
         S_MUX_ALUIN, stall_exe_o, stall_dec_o, stall_fetch_o, stall_btb_o,
         was_branch_o, was_jmp_o, \ALU_OPCODE[4] , \ALU_OPCODE[3] ,
         \ALU_OPCODE[2] , \ALU_OPCODE[1] , \ALU_OPCODE[0] , S_MUX_MEM_BAR;
  wire   IR_IN_10, IR_IN_9, IR_IN_8, IR_IN_7, IR_IN_6, IR_IN_5, IR_IN_4,
         IR_IN_3, IR_IN_2, IR_IN_1, IR_IN_0, stall_exe_i, n130, S_MEM_LOAD,
         S_EXE_LOAD, next_bubble_dec, stall_dec_o_TEMP, stall_btb_o_TEMP,
         stall_fetch_o_TEMP, N20, N21, N22, N23, N24, N25, N26, N27, N29, N30,
         N31, N32, net3570, n2, n3, n4, n5, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n31, n33, n34, n37, n38, n39, n40,
         n41, n43, n44, n45, n46, n47, n48, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n111, n114, n115, n116, n118,
         n123, n124, n125, n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n29,
         n36, n42, n49;
  wire   [12:0] cw_from_mem;
  wire   [4:0] aluOpcode_d;
  assign IR_IN_10 = IR_IN[10];
  assign IR_IN_9 = IR_IN[9];
  assign IR_IN_8 = IR_IN[8];
  assign IR_IN_7 = IR_IN[7];
  assign IR_IN_6 = IR_IN[6];
  assign IR_IN_5 = IR_IN[5];
  assign IR_IN_4 = IR_IN[4];
  assign IR_IN_3 = IR_IN[3];
  assign IR_IN_2 = IR_IN[2];
  assign IR_IN_1 = IR_IN[1];
  assign IR_IN_0 = IR_IN[0];
  assign stall_exe_o = stall_exe_i;
  DFF_X1 bubble_dec_reg ( .D(n123), .CK(Clk), .Q(n36), .QN(n124) );
  DFFR_X1 \cw_e_reg[0]  ( .D(N21), .CK(net3570), .RN(n49), .Q(n130), .QN(n2)
         );
  DFFR_X1 \cw_e_reg[5]  ( .D(N26), .CK(net3570), .RN(n49), .Q(S_MUX_DEST[1])
         );
  DFFR_X1 \cw_e_reg[4]  ( .D(N25), .CK(net3570), .RN(n49), .Q(S_MUX_DEST[0])
         );
  DFFR_X1 \cw_e_reg[3]  ( .D(N24), .CK(net3570), .RN(n49), .Q(n3) );
  DFFR_X1 \cw_m_reg[3]  ( .D(N32), .CK(Clk), .RN(n49), .Q(S_MEM_EN), .QN(n125)
         );
  DFFR_X1 \cw_m_reg[2]  ( .D(N31), .CK(Clk), .RN(n49), .Q(S_MEM_W_R) );
  DFFR_X1 \cw_m_reg[1]  ( .D(N30), .CK(Clk), .RN(n49), .QN(S_MUX_MEM_BAR) );
  DFFR_X1 \cw_m_reg[0]  ( .D(N29), .CK(Clk), .RN(n49), .Q(S_RF_W_mem), .QN(
        n118) );
  DFFS_X1 \cw_w_reg[0]  ( .D(n118), .CK(Clk), .SN(n49), .QN(S_RF_W_wb) );
  XOR2_X1 U3 ( .A(S_MUX_PC_BUS[1]), .B(S_MUX_PC_BUS[0]), .Z(was_jmp_o) );
  MUX2_X1 U8 ( .A(next_bubble_dec), .B(n36), .S(Rst), .Z(n123) );
  NAND3_X1 U59 ( .A1(IR_IN_3), .A2(n77), .A3(n78), .ZN(n70) );
  NAND3_X1 U67 ( .A1(IR_IN_4), .A2(IR_IN_5), .A3(IR_IN_0), .ZN(n64) );
  NAND3_X1 U71 ( .A1(IR_IN_4), .A2(n77), .A3(n91), .ZN(n71) );
  NAND3_X1 U82 ( .A1(n48), .A2(n101), .A3(n46), .ZN(n76) );
  NAND3_X1 U122 ( .A1(IR_IN_2), .A2(IR_IN_3), .A3(n63), .ZN(n27) );
  NAND3_X1 U128 ( .A1(n43), .A2(n114), .A3(n115), .ZN(n93) );
  stall_logic_FUNC_SIZE11_OP_CODE_SIZE6 STALL_L ( .OPCODE_i(IR_IN[31:26]),
        .FUNC_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0}), .rA_i(IR_IN[25:21]), .rB_i(IR_IN[20:16]), .D1_i(D1_i), .D2_i(
        D2_i), .S_mem_LOAD_i(S_MEM_LOAD), .S_exe_LOAD_i(S_EXE_LOAD),
        .S_exe_WRITE_i(n130), .S_MUX_PC_BUS_i({1'b0, 1'b0}), .mispredict_i(
        mispredict_i), .bubble_dec_o(next_bubble_dec), .stall_dec_o(
        stall_dec_o_TEMP), .stall_btb_o(stall_btb_o_TEMP), .stall_fetch_o(
        stall_fetch_o_TEMP) );
  cw_mem_MICROCODE_MEM_SIZE64_OP_CODE_SIZE6_CW_SIZE13 CWM ( .OPCODE_IN(
        IR_IN[31:26]), .CW_OUT(cw_from_mem) );
  alu_ctrl ALU_C ( .OP(aluOpcode_d), .ALU_WORD(ALU_WORD_o) );
  SNPS_CLOCK_GATE_HIGH_dlx_cu_MICROCODE_MEM_SIZE64_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE13_0 clk_gate_cw_e_reg (
        .CLK(Clk), .EN(N20), .ENCLK(net3570) );
  AND2_X1 U17 ( .A1(n124), .A2(cw_from_mem[8]), .ZN(S_EQ_NEQ) );
  NOR2_X1 U12 ( .A1(n125), .A2(S_MEM_W_R), .ZN(S_MEM_LOAD) );
  NOR4_X1 U130 ( .A1(IR_IN_9), .A2(IR_IN_8), .A3(IR_IN_7), .A4(IR_IN_6), .ZN(
        n114) );
  NOR2_X1 U129 ( .A1(IR_IN[31]), .A2(IR_IN_10), .ZN(n115) );
  NAND2_X1 U91 ( .A1(n46), .A2(n91), .ZN(n15) );
  NAND2_X1 U126 ( .A1(IR_IN_4), .A2(IR_IN_5), .ZN(n16) );
  NAND2_X1 U105 ( .A1(IR_IN[30]), .A2(IR_IN[29]), .ZN(n111) );
  NAND2_X1 U103 ( .A1(IR_IN[31]), .A2(n19), .ZN(n24) );
  NAND2_X1 U89 ( .A1(n105), .A2(IR_IN_2), .ZN(n94) );
  NOR3_X1 U72 ( .A1(IR_IN[29]), .A2(IR_IN_0), .A3(n92), .ZN(n77) );
  OAI211_X1 U52 ( .C1(n24), .C2(n69), .A(n70), .B(n71), .ZN(n20) );
  INV_X1 U109 ( .A(IR_IN[31]), .ZN(n22) );
  NAND2_X1 U115 ( .A1(IR_IN_0), .A2(n48), .ZN(n28) );
  OAI211_X1 U23 ( .C1(n22), .C2(n23), .A(n24), .B(n25), .ZN(n21) );
  AOI211_X1 U22 ( .C1(IR_IN[26]), .C2(n19), .A(n20), .B(n21), .ZN(n17) );
  NOR2_X1 U85 ( .A1(n91), .A2(IR_IN_2), .ZN(n47) );
  NAND2_X1 U84 ( .A1(IR_IN_1), .A2(n47), .ZN(n38) );
  AOI211_X1 U32 ( .C1(n27), .C2(n38), .A(n26), .B(n16), .ZN(n37) );
  OAI211_X1 U21 ( .C1(n15), .C2(n16), .A(n17), .B(n18), .ZN(aluOpcode_d[4]) );
  NOR2_X1 U48 ( .A1(n60), .A2(n15), .ZN(n45) );
  NAND2_X1 U118 ( .A1(n48), .A2(n104), .ZN(n62) );
  NOR2_X1 U53 ( .A1(n27), .A2(n62), .ZN(n67) );
  AOI211_X1 U51 ( .C1(n46), .C2(n67), .A(n68), .B(n20), .ZN(n31) );
  AOI221_X1 U46 ( .B1(n62), .B2(n63), .C1(n62), .C2(n64), .A(IR_IN_3), .ZN(n61) );
  OAI21_X1 U41 ( .B1(IR_IN[26]), .B2(n56), .A(n23), .ZN(n34) );
  NAND2_X1 U108 ( .A1(IR_IN[29]), .A2(n22), .ZN(n44) );
  AOI221_X1 U49 ( .B1(IR_IN_2), .B2(n64), .C1(n60), .C2(n28), .A(IR_IN_1),
        .ZN(n65) );
  NOR2_X1 U125 ( .A1(IR_IN_0), .A2(n16), .ZN(n66) );
  AOI22_X1 U47 ( .A1(n46), .A2(n65), .B1(n66), .B2(n45), .ZN(n50) );
  NOR2_X1 U114 ( .A1(IR_IN_2), .A2(n28), .ZN(n58) );
  AOI22_X1 U44 ( .A1(n58), .A2(n59), .B1(n33), .B2(n60), .ZN(n51) );
  NOR2_X1 U43 ( .A1(n57), .A2(n41), .ZN(n53) );
  AOI221_X1 U39 ( .B1(n53), .B2(IR_IN[31]), .C1(n34), .C2(n22), .A(n54), .ZN(
        n52) );
  NOR2_X1 U95 ( .A1(IR_IN[30]), .A2(n44), .ZN(n84) );
  NOR4_X1 U93 ( .A1(IR_IN[31]), .A2(IR_IN[29]), .A3(n39), .A4(n40), .ZN(n99)
         );
  AOI22_X1 U92 ( .A1(n95), .A2(n84), .B1(n106), .B2(n99), .ZN(n89) );
  NOR2_X1 U88 ( .A1(IR_IN_4), .A2(n94), .ZN(n87) );
  OAI221_X1 U87 ( .B1(IR_IN_0), .B2(n63), .C1(n104), .C2(IR_IN_1), .A(n87),
        .ZN(n102) );
  OAI211_X1 U86 ( .C1(IR_IN_1), .C2(n28), .A(n102), .B(n103), .ZN(n96) );
  NAND2_X1 U81 ( .A1(n101), .A2(n66), .ZN(n100) );
  OAI22_X1 U79 ( .A1(IR_IN_0), .A2(n76), .B1(n100), .B2(n26), .ZN(n97) );
  AOI22_X1 U76 ( .A1(IR_IN[26]), .A2(n83), .B1(n23), .B2(n69), .ZN(n98) );
  AOI211_X1 U75 ( .C1(n59), .C2(n96), .A(n97), .B(n98), .ZN(n90) );
  NAND4_X1 U70 ( .A1(n73), .A2(n89), .A3(n90), .A4(n71), .ZN(aluOpcode_d[0])
         );
  NOR2_X1 U66 ( .A1(n38), .A2(n64), .ZN(n79) );
  NOR2_X1 U65 ( .A1(n86), .A2(n87), .ZN(n85) );
  AOI221_X1 U64 ( .B1(IR_IN_1), .B2(n85), .C1(n63), .C2(n64), .A(n15), .ZN(n80) );
  OAI221_X1 U62 ( .B1(IR_IN[26]), .B2(n82), .C1(n69), .C2(n23), .A(n83), .ZN(
        n81) );
  AOI211_X1 U61 ( .C1(n46), .C2(n79), .A(n80), .B(n81), .ZN(n74) );
  NAND2_X1 U57 ( .A1(IR_IN_0), .A2(n68), .ZN(n75) );
  NAND4_X1 U56 ( .A1(n73), .A2(n74), .A3(n70), .A4(n75), .ZN(aluOpcode_d[1])
         );
  OR2_X1 U5 ( .A1(stall_exe_i), .A2(stall_fetch_o_TEMP), .ZN(stall_fetch_o) );
  NOR2_X1 U133 ( .A1(n4), .A2(stall_exe_i), .ZN(N31) );
  NOR2_X1 U134 ( .A1(n5), .A2(stall_exe_i), .ZN(N30) );
  NOR2_X1 U135 ( .A1(n2), .A2(stall_exe_i), .ZN(N29) );
  INV_X1 U97 ( .A(IR_IN[26]), .ZN(n69) );
  NOR2_X1 U120 ( .A1(IR_IN_4), .A2(n105), .ZN(n48) );
  NAND4_X1 U38 ( .A1(n31), .A2(n50), .A3(n51), .A4(n52), .ZN(aluOpcode_d[2])
         );
  NOR2_X1 U144 ( .A1(stall_dec_o_TEMP), .A2(n36), .ZN(n116) );
  AND2_X1 U4 ( .A1(S_MUX_PC_BUS[1]), .A2(S_MUX_PC_BUS[0]), .ZN(was_branch_o)
         );
  AND2_X1 U16 ( .A1(n4), .A2(n3), .ZN(S_EXE_LOAD) );
  OR2_X1 U6 ( .A1(stall_exe_i), .A2(stall_dec_o_TEMP), .ZN(stall_dec_o) );
  INV_X1 U113 ( .A(IR_IN_3), .ZN(n91) );
  INV_X1 U121 ( .A(IR_IN_5), .ZN(n105) );
  INV_X1 U123 ( .A(IR_IN_1), .ZN(n63) );
  INV_X1 U74 ( .A(n95), .ZN(n55) );
  OR4_X1 U73 ( .A1(n93), .A2(n94), .A3(n63), .A4(n55), .ZN(n92) );
  INV_X1 U60 ( .A(IR_IN_4), .ZN(n78) );
  INV_X1 U80 ( .A(n46), .ZN(n26) );
  OR3_X1 U24 ( .A1(n26), .A2(n27), .A3(n28), .ZN(n25) );
  INV_X1 U31 ( .A(n37), .ZN(n18) );
  INV_X1 U50 ( .A(IR_IN_2), .ZN(n60) );
  INV_X1 U119 ( .A(IR_IN_0), .ZN(n104) );
  INV_X1 U83 ( .A(n38), .ZN(n101) );
  INV_X1 U58 ( .A(n76), .ZN(n68) );
  AND2_X1 U45 ( .A1(n61), .A2(n46), .ZN(n33) );
  INV_X1 U42 ( .A(n19), .ZN(n56) );
  INV_X1 U110 ( .A(IR_IN[30]), .ZN(n40) );
  INV_X1 U90 ( .A(n15), .ZN(n59) );
  INV_X1 U102 ( .A(n43), .ZN(n57) );
  INV_X1 U124 ( .A(n66), .ZN(n103) );
  INV_X1 U117 ( .A(n62), .ZN(n86) );
  AND2_X1 U139 ( .A1(n116), .A2(cw_from_mem[4]), .ZN(N25) );
  AND2_X1 U138 ( .A1(n116), .A2(cw_from_mem[5]), .ZN(N26) );
  AND2_X1 U141 ( .A1(n116), .A2(cw_from_mem[2]), .ZN(N23) );
  AND2_X1 U142 ( .A1(n116), .A2(cw_from_mem[1]), .ZN(N22) );
  AND2_X1 U143 ( .A1(n116), .A2(cw_from_mem[0]), .ZN(N21) );
  AND2_X1 U137 ( .A1(n116), .A2(cw_from_mem[6]), .ZN(N27) );
  AND2_X1 U140 ( .A1(n116), .A2(cw_from_mem[3]), .ZN(N24) );
  AND2_X1 U132 ( .A1(N20), .A2(n3), .ZN(N32) );
  DFFR_X2 \cw_e_reg[6]  ( .D(N27), .CK(net3570), .RN(n49), .Q(S_MUX_ALUIN) );
  AND2_X1 U10 ( .A1(n124), .A2(cw_from_mem[11]), .ZN(S_MUX_PC_BUS[0]) );
  OR2_X1 U7 ( .A1(stall_exe_i), .A2(stall_btb_o_TEMP), .ZN(stall_btb_o) );
  DFFR_X1 \cw_e_reg[2]  ( .D(N23), .CK(net3570), .RN(n49), .QN(n4) );
  DFFR_X1 \cw_e_reg[1]  ( .D(N22), .CK(net3570), .RN(n49), .QN(n5) );
  OAI21_X1 U9 ( .B1(n44), .B2(n1), .A(n18), .ZN(n8) );
  OR2_X1 U11 ( .A1(n43), .A2(n7), .ZN(n1) );
  OAI221_X1 U13 ( .B1(n45), .B2(n46), .C1(n45), .C2(n47), .A(n48), .ZN(n6) );
  AOI21_X1 U14 ( .B1(n41), .B2(n40), .A(n39), .ZN(n7) );
  AOI211_X1 U15 ( .C1(IR_IN_2), .C2(n33), .A(n34), .B(n8), .ZN(n9) );
  OAI211_X1 U18 ( .C1(IR_IN_1), .C2(n6), .A(n31), .B(n9), .ZN(aluOpcode_d[3])
         );
  NAND3_X1 U19 ( .A1(IR_IN_3), .A2(n63), .A3(n86), .ZN(n10) );
  OAI211_X1 U20 ( .C1(n66), .C2(n58), .A(IR_IN_1), .B(n91), .ZN(n11) );
  OAI211_X1 U25 ( .C1(n103), .C2(n27), .A(n10), .B(n11), .ZN(n12) );
  NOR3_X1 U26 ( .A1(n44), .A2(n57), .A3(n41), .ZN(n13) );
  OR3_X1 U27 ( .A1(n42), .A2(n44), .A3(n40), .ZN(n14) );
  AOI21_X1 U28 ( .B1(n24), .B2(n14), .A(IR_IN[26]), .ZN(n29) );
  AOI211_X1 U29 ( .C1(n46), .C2(n12), .A(n13), .B(n29), .ZN(n73) );
  AND2_X1 U30 ( .A1(cw_from_mem[12]), .A2(n124), .ZN(S_MUX_PC_BUS[1]) );
  AND2_X2 U33 ( .A1(n124), .A2(cw_from_mem[7]), .ZN(S_MUX_LINK) );
  AND2_X2 U34 ( .A1(cw_from_mem[10]), .A2(n124), .ZN(S_EXT) );
  INV_X1 U35 ( .A(Rst), .ZN(n49) );
  INV_X1 U36 ( .A(stall_exe_i), .ZN(N20) );
  INV_X1 U37 ( .A(IR_IN[28]), .ZN(n39) );
  CLKBUF_X1 U40 ( .A(IR_IN[27]), .Z(n42) );
  AND2_X1 U54 ( .A1(cw_from_mem[9]), .A2(n124), .ZN(S_EXT_SIGN) );
  NOR4_X2 U55 ( .A1(IR_IN[26]), .A2(IR_IN[29]), .A3(IR_IN[27]), .A4(n93), .ZN(
        n46) );
  AOI211_X1 U63 ( .C1(IR_IN[30]), .C2(n55), .A(IR_IN[28]), .B(n44), .ZN(n54)
         );
  NOR2_X1 U68 ( .A1(IR_IN[30]), .A2(IR_IN[28]), .ZN(n43) );
  NOR2_X1 U69 ( .A1(IR_IN[26]), .A2(n42), .ZN(n106) );
  NAND2_X1 U77 ( .A1(n42), .A2(n84), .ZN(n82) );
  NAND2_X1 U78 ( .A1(n42), .A2(n99), .ZN(n83) );
  NAND2_X1 U94 ( .A1(IR_IN[26]), .A2(n42), .ZN(n41) );
  NAND4_X1 U96 ( .A1(IR_IN[30]), .A2(IR_IN[29]), .A3(n42), .A4(n39), .ZN(n23)
         );
  NOR3_X1 U98 ( .A1(n42), .A2(n39), .A3(n111), .ZN(n19) );
  NOR2_X1 U99 ( .A1(IR_IN[27]), .A2(n69), .ZN(n95) );
endmodule