module FPU_Add_Subtract_Function
   (clk,
    rst,
    beg_FSM,
    ack_FSM,
    Data_X,
    Data_Y,
    add_subt,
    r_mode,
    overflow_flag,
    underflow_flag,
    ready,
    final_result_ieee);
  input clk;
  input rst;
  input beg_FSM;
  input ack_FSM;
  input [31:0]Data_X;
  input [31:0]Data_Y;
  input add_subt;
  input [1:0]r_mode;
  output overflow_flag;
  output underflow_flag;
  output ready;
  output [31:0]final_result_ieee;
  wire Add_Subt_Sgf_module_n_22;
  wire Add_Subt_Sgf_module_n_23;
  wire Add_Subt_Sgf_module_n_24;
  wire Add_Subt_Sgf_module_n_25;
  wire Add_Subt_Sgf_module_n_26;
  wire Add_Subt_Sgf_module_n_27;
  wire Add_Subt_Sgf_module_n_33;
  wire Add_Subt_Sgf_module_n_34;
  wire Add_Subt_Sgf_module_n_35;
  wire Add_Subt_Sgf_module_n_36;
  wire Add_Subt_Sgf_module_n_37;
  wire Add_Subt_Sgf_module_n_38;
  wire Add_Subt_Sgf_module_n_39;
  wire Add_Subt_Sgf_module_n_40;
  wire Add_Subt_Sgf_module_n_41;
  wire Add_Subt_Sgf_module_n_42;
  wire Add_Subt_Sgf_module_n_43;
  wire Add_Subt_Sgf_module_n_44;
  wire Add_Subt_Sgf_module_n_45;
  wire Add_Subt_Sgf_module_n_46;
  wire Add_Subt_Sgf_module_n_47;
  wire Add_Subt_Sgf_module_n_48;
  wire Add_Subt_Sgf_module_n_49;
  wire Add_Subt_Sgf_module_n_50;
  wire Add_Subt_Sgf_module_n_51;
  wire Add_Subt_Sgf_module_n_52;
  wire Add_Subt_Sgf_module_n_53;
  wire Add_Subt_Sgf_module_n_54;
  wire Add_Subt_Sgf_module_n_55;
  wire Add_Subt_Sgf_module_n_56;
  wire Add_Subt_Sgf_module_n_57;
  wire Add_Subt_Sgf_module_n_58;
  wire Barrel_Shifter_module_n_0;
  wire Barrel_Shifter_module_n_17;
  wire Barrel_Shifter_module_n_18;
  wire Barrel_Shifter_module_n_19;
  wire Barrel_Shifter_module_n_20;
  wire Barrel_Shifter_module_n_21;
  wire Barrel_Shifter_module_n_22;
  wire Barrel_Shifter_module_n_23;
  wire Barrel_Shifter_module_n_24;
  wire Barrel_Shifter_module_n_25;
  wire Barrel_Shifter_module_n_27;
  wire Barrel_Shifter_module_n_28;
  wire Barrel_Shifter_module_n_29;
  wire Barrel_Shifter_module_n_30;
  wire Barrel_Shifter_module_n_31;
  wire Barrel_Shifter_module_n_32;
  wire Barrel_Shifter_module_n_33;
  wire Barrel_Shifter_module_n_34;
  wire Barrel_Shifter_module_n_35;
  wire Barrel_Shifter_module_n_36;
  wire Barrel_Shifter_module_n_37;
  wire Barrel_Shifter_module_n_38;
  wire Barrel_Shifter_module_n_39;
  wire Barrel_Shifter_module_n_40;
  wire Barrel_Shifter_module_n_41;
  wire Barrel_Shifter_module_n_42;
  wire Barrel_Shifter_module_n_43;
  wire Barrel_Shifter_module_n_44;
  wire Barrel_Shifter_module_n_45;
  wire Barrel_Shifter_module_n_46;
  wire Barrel_Shifter_module_n_47;
  wire Barrel_Shifter_module_n_48;
  wire Barrel_Shifter_module_n_49;
  wire Barrel_Shifter_module_n_50;
  wire [4:0]Codec_to_Reg;
  wire [0:0]Data_A;
  wire [15:0]Data_Reg;
  wire [31:0]Data_X;
  wire [31:0]Data_X_IBUF;
  wire [31:0]Data_Y;
  wire [31:0]Data_Y_IBUF;
  wire Exp_Operation_Module_n_10;
  wire Exp_Operation_Module_n_11;
  wire Exp_Operation_Module_n_12;
  wire Exp_Operation_Module_n_13;
  wire Exp_Operation_Module_n_14;
  wire Exp_Operation_Module_n_15;
  wire Exp_Operation_Module_n_16;
  wire Exp_Operation_Module_n_17;
  wire Exp_Operation_Module_n_18;
  wire Exp_Operation_Module_n_19;
  wire Exp_Operation_Module_n_20;
  wire Exp_Operation_Module_n_21;
  wire Exp_Operation_Module_n_22;
  wire Exp_Operation_Module_n_23;
  wire Exp_Operation_Module_n_24;
  wire Exp_Operation_Module_n_25;
  wire Exp_Operation_Module_n_26;
  wire Exp_Operation_Module_n_27;
  wire Exp_Operation_Module_n_28;
  wire Exp_Operation_Module_n_29;
  wire Exp_Operation_Module_n_3;
  wire Exp_Operation_Module_n_30;
  wire Exp_Operation_Module_n_31;
  wire Exp_Operation_Module_n_32;
  wire Exp_Operation_Module_n_33;
  wire Exp_Operation_Module_n_4;
  wire Exp_Operation_Module_n_40;
  wire Exp_Operation_Module_n_41;
  wire Exp_Operation_Module_n_42;
  wire Exp_Operation_Module_n_43;
  wire Exp_Operation_Module_n_44;
  wire Exp_Operation_Module_n_45;
  wire Exp_Operation_Module_n_46;
  wire Exp_Operation_Module_n_47;
  wire Exp_Operation_Module_n_48;
  wire Exp_Operation_Module_n_5;
  wire Exp_Operation_Module_n_6;
  wire Exp_Operation_Module_n_7;
  wire Exp_Operation_Module_n_8;
  wire Exp_Operation_Module_n_9;
  wire FSM_Add_Subt_Sgf_load;
  wire FSM_LZA_load;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire FSM_barrel_shifter_load;
  wire FSM_exp_operation_A_S;
  wire FSM_exp_operation_load_diff;
  wire FSM_op_start_in_load_a;
  wire FSM_op_start_in_load_b;
  wire [1:0]FSM_selector_B;
  wire FSM_selector_C;
  wire FSM_selector_D;
  wire FS_Module_n_10;
  wire FS_Module_n_11;
  wire FS_Module_n_12;
  wire FS_Module_n_13;
  wire FS_Module_n_2;
  wire FS_Module_n_23;
  wire FS_Module_n_24;
  wire FS_Module_n_25;
  wire FS_Module_n_5;
  wire FS_Module_n_6;
  wire FS_Module_n_7;
  wire FS_Module_n_8;
  wire FS_Module_n_9;
  wire [4:0]LZA_output;
  wire [25:0]\Mux_Array/Data_array[3]_0 ;
  wire [25:10]\Mux_Array/Data_array[4]_1 ;
  wire Oper_Start_in_module_n_10;
  wire Oper_Start_in_module_n_11;
  wire Oper_Start_in_module_n_12;
  wire Oper_Start_in_module_n_13;
  wire Oper_Start_in_module_n_14;
  wire Oper_Start_in_module_n_15;
  wire Oper_Start_in_module_n_16;
  wire Oper_Start_in_module_n_17;
  wire Oper_Start_in_module_n_18;
  wire Oper_Start_in_module_n_19;
  wire Oper_Start_in_module_n_20;
  wire Oper_Start_in_module_n_21;
  wire Oper_Start_in_module_n_22;
  wire Oper_Start_in_module_n_23;
  wire Oper_Start_in_module_n_24;
  wire Oper_Start_in_module_n_25;
  wire Oper_Start_in_module_n_26;
  wire Oper_Start_in_module_n_27;
  wire Oper_Start_in_module_n_28;
  wire Oper_Start_in_module_n_29;
  wire Oper_Start_in_module_n_3;
  wire Oper_Start_in_module_n_33;
  wire Oper_Start_in_module_n_34;
  wire Oper_Start_in_module_n_35;
  wire Oper_Start_in_module_n_36;
  wire Oper_Start_in_module_n_37;
  wire Oper_Start_in_module_n_38;
  wire Oper_Start_in_module_n_39;
  wire Oper_Start_in_module_n_4;
  wire Oper_Start_in_module_n_40;
  wire Oper_Start_in_module_n_41;
  wire Oper_Start_in_module_n_42;
  wire Oper_Start_in_module_n_43;
  wire Oper_Start_in_module_n_44;
  wire Oper_Start_in_module_n_45;
  wire Oper_Start_in_module_n_46;
  wire Oper_Start_in_module_n_47;
  wire Oper_Start_in_module_n_48;
  wire Oper_Start_in_module_n_49;
  wire Oper_Start_in_module_n_5;
  wire Oper_Start_in_module_n_50;
  wire Oper_Start_in_module_n_51;
  wire Oper_Start_in_module_n_52;
  wire Oper_Start_in_module_n_53;
  wire Oper_Start_in_module_n_54;
  wire Oper_Start_in_module_n_55;
  wire Oper_Start_in_module_n_56;
  wire Oper_Start_in_module_n_57;
  wire Oper_Start_in_module_n_58;
  wire Oper_Start_in_module_n_59;
  wire Oper_Start_in_module_n_6;
  wire Oper_Start_in_module_n_60;
  wire Oper_Start_in_module_n_61;
  wire Oper_Start_in_module_n_62;
  wire Oper_Start_in_module_n_63;
  wire Oper_Start_in_module_n_64;
  wire Oper_Start_in_module_n_65;
  wire Oper_Start_in_module_n_66;
  wire Oper_Start_in_module_n_67;
  wire Oper_Start_in_module_n_68;
  wire Oper_Start_in_module_n_69;
  wire Oper_Start_in_module_n_7;
  wire Oper_Start_in_module_n_70;
  wire Oper_Start_in_module_n_71;
  wire Oper_Start_in_module_n_72;
  wire Oper_Start_in_module_n_73;
  wire Oper_Start_in_module_n_74;
  wire Oper_Start_in_module_n_75;
  wire Oper_Start_in_module_n_76;
  wire Oper_Start_in_module_n_77;
  wire Oper_Start_in_module_n_78;
  wire Oper_Start_in_module_n_79;
  wire Oper_Start_in_module_n_8;
  wire Oper_Start_in_module_n_80;
  wire Oper_Start_in_module_n_81;
  wire Oper_Start_in_module_n_82;
  wire Oper_Start_in_module_n_83;
  wire Oper_Start_in_module_n_84;
  wire Oper_Start_in_module_n_85;
  wire Oper_Start_in_module_n_86;
  wire Oper_Start_in_module_n_87;
  wire Oper_Start_in_module_n_88;
  wire Oper_Start_in_module_n_89;
  wire Oper_Start_in_module_n_9;
  wire Oper_Start_in_module_n_90;
  wire Oper_Start_in_module_n_91;
  wire Oper_Start_in_module_n_92;
  wire Oper_Start_in_module_n_93;
  wire Oper_Start_in_module_n_94;
  wire Oper_Start_in_module_n_95;
  wire Sel_A_n_0;
  wire Sel_B_n_0;
  wire Sel_B_n_1;
  wire Sel_B_n_10;
  wire Sel_B_n_11;
  wire Sel_B_n_12;
  wire Sel_B_n_16;
  wire Sel_B_n_17;
  wire Sel_B_n_2;
  wire Sel_B_n_3;
  wire Sel_B_n_34;
  wire Sel_B_n_35;
  wire Sel_B_n_36;
  wire Sel_B_n_37;
  wire Sel_B_n_4;
  wire Sel_B_n_40;
  wire Sel_B_n_41;
  wire Sel_B_n_5;
  wire Sel_B_n_6;
  wire Sel_B_n_7;
  wire Sel_B_n_8;
  wire Sel_B_n_9;
  wire Sel_D_n_1;
  wire [1:0]Sgf_normalized_result;
  wire Sign_S_mux;
  wire ack_FSM;
  wire ack_FSM_IBUF;
  wire add_overflow_flag;
  wire add_subt;
  wire add_subt_IBUF;
  wire beg_FSM;
  wire beg_FSM_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire eqXY;
  wire [4:0]exp_oper_result;
  wire [31:0]final_result_ieee;
  wire [31:0]final_result_ieee_OBUF;
  wire intAS;
  wire [31:31]intDX;
  wire [31:31]intDY;
  wire overflow_flag;
  wire overflow_flag_OBUF;
  wire [1:0]r_mode;
  wire [1:0]r_mode_IBUF;
  wire ready;
  wire ready_OBUF;
  wire round_flag;
  wire rst;
  wire rst_IBUF;
  wire rst_int;
  wire sign_final_result;
  wire underflow_flag;
  wire underflow_flag_OBUF;
  wire zero_flag;
initial begin
 $sdf_annotate("Testbench_FPU_Add_Subt_time_synth.sdf",,,,"tool_control");
end
  Add_Subt Add_Subt_Sgf_module
       (.AR(FS_Module_n_25),
        .CLK(clk_IBUF_BUFG),
        .D(\Mux_Array/Data_array[3]_0 [20:0]),
        .E(FSM_Add_Subt_Sgf_load),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_selector_B(FSM_selector_B),
        .FSM_selector_C(FSM_selector_C),
        .FSM_selector_D(FSM_selector_D),
        .O({Oper_Start_in_module_n_27,Oper_Start_in_module_n_28,Oper_Start_in_module_n_29}),
        .Q({Add_Subt_Sgf_module_n_26,Add_Subt_Sgf_module_n_27}),
        .\Q_reg[0] ({Add_Subt_Sgf_module_n_57,Add_Subt_Sgf_module_n_58}),
        .\Q_reg[0]_0 (FS_Module_n_2),
        .\Q_reg[0]_1 (Sel_B_n_40),
        .\Q_reg[0]_2 (LZA_output[0]),
        .\Q_reg[0]_3 (exp_oper_result[0]),
        .\Q_reg[11] ({Add_Subt_Sgf_module_n_41,Add_Subt_Sgf_module_n_42,Add_Subt_Sgf_module_n_43,Add_Subt_Sgf_module_n_44}),
        .\Q_reg[15] (Add_Subt_Sgf_module_n_25),
        .\Q_reg[15]_0 ({Add_Subt_Sgf_module_n_45,Add_Subt_Sgf_module_n_46,Add_Subt_Sgf_module_n_47,Add_Subt_Sgf_module_n_48}),
        .\Q_reg[16] (Add_Subt_Sgf_module_n_23),
        .\Q_reg[17] (Add_Subt_Sgf_module_n_24),
        .\Q_reg[18] (Add_Subt_Sgf_module_n_22),
        .\Q_reg[19] ({Add_Subt_Sgf_module_n_49,Add_Subt_Sgf_module_n_50,Add_Subt_Sgf_module_n_51,Add_Subt_Sgf_module_n_52}),
        .\Q_reg[1] (Sel_B_n_17),
        .\Q_reg[22] ({Oper_Start_in_module_n_73,Oper_Start_in_module_n_74,Oper_Start_in_module_n_75,Oper_Start_in_module_n_76,Oper_Start_in_module_n_77,Oper_Start_in_module_n_78,Oper_Start_in_module_n_79,Oper_Start_in_module_n_80,Oper_Start_in_module_n_81,Oper_Start_in_module_n_82,Oper_Start_in_module_n_83,Oper_Start_in_module_n_84,Oper_Start_in_module_n_85,Oper_Start_in_module_n_86,Oper_Start_in_module_n_87,Oper_Start_in_module_n_88,Oper_Start_in_module_n_89,Oper_Start_in_module_n_90,Oper_Start_in_module_n_91,Oper_Start_in_module_n_92,Oper_Start_in_module_n_93,Oper_Start_in_module_n_94,Oper_Start_in_module_n_95}),
        .\Q_reg[22]_0 ({Oper_Start_in_module_n_42,Oper_Start_in_module_n_43,Oper_Start_in_module_n_44,Oper_Start_in_module_n_45,Oper_Start_in_module_n_46,Oper_Start_in_module_n_47,Oper_Start_in_module_n_48,Oper_Start_in_module_n_49,Oper_Start_in_module_n_50,Oper_Start_in_module_n_51,Oper_Start_in_module_n_52,Oper_Start_in_module_n_53,Oper_Start_in_module_n_54,Oper_Start_in_module_n_55,Oper_Start_in_module_n_56,Oper_Start_in_module_n_57,Oper_Start_in_module_n_58,Oper_Start_in_module_n_59,Oper_Start_in_module_n_60,Oper_Start_in_module_n_61,Oper_Start_in_module_n_62,Oper_Start_in_module_n_63,Oper_Start_in_module_n_64}),
        .\Q_reg[23] ({Add_Subt_Sgf_module_n_53,Add_Subt_Sgf_module_n_54,Add_Subt_Sgf_module_n_55,Add_Subt_Sgf_module_n_56}),
        .\Q_reg[25] ({Barrel_Shifter_module_n_27,Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50,Sgf_normalized_result}),
        .\Q_reg[2] (Sel_B_n_16),
        .\Q_reg[31] ({Oper_Start_in_module_n_3,Oper_Start_in_module_n_4,Oper_Start_in_module_n_5,Oper_Start_in_module_n_6,Oper_Start_in_module_n_7,Oper_Start_in_module_n_8,Oper_Start_in_module_n_9,Oper_Start_in_module_n_10,Oper_Start_in_module_n_11,Oper_Start_in_module_n_12,Oper_Start_in_module_n_13,Oper_Start_in_module_n_14,Oper_Start_in_module_n_15,Oper_Start_in_module_n_16,Oper_Start_in_module_n_17,Oper_Start_in_module_n_18,Oper_Start_in_module_n_19,Oper_Start_in_module_n_20,Oper_Start_in_module_n_21,Oper_Start_in_module_n_22,Oper_Start_in_module_n_23,Oper_Start_in_module_n_24,Oper_Start_in_module_n_25,Oper_Start_in_module_n_26}),
        .\Q_reg[31]_0 (intDY),
        .\Q_reg[31]_1 (intDX),
        .\Q_reg[4] (Codec_to_Reg),
        .\Q_reg[7] ({Add_Subt_Sgf_module_n_37,Add_Subt_Sgf_module_n_38,Add_Subt_Sgf_module_n_39,Add_Subt_Sgf_module_n_40}),
        .S({Add_Subt_Sgf_module_n_33,Add_Subt_Sgf_module_n_34,Add_Subt_Sgf_module_n_35,Add_Subt_Sgf_module_n_36}),
        .add_overflow_flag(add_overflow_flag),
        .intAS(intAS));
  Barrel_Shifter Barrel_Shifter_module
       (.AR(FS_Module_n_25),
        .CLK(clk_IBUF_BUFG),
        .D(Data_Reg),
        .E(FSM_barrel_shifter_load),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_24),
        .Q(\Mux_Array/Data_array[4]_1 ),
        .\Q_reg[0] ({Barrel_Shifter_module_n_27,Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50,Sgf_normalized_result}),
        .\Q_reg[16] (Barrel_Shifter_module_n_0),
        .\Q_reg[16]_0 (Sel_B_n_34),
        .\Q_reg[17] (Barrel_Shifter_module_n_18),
        .\Q_reg[17]_0 (Sel_B_n_37),
        .\Q_reg[18] (Barrel_Shifter_module_n_20),
        .\Q_reg[19] (Barrel_Shifter_module_n_22),
        .\Q_reg[20] (Barrel_Shifter_module_n_24),
        .\Q_reg[21] (Barrel_Shifter_module_n_25),
        .\Q_reg[22] (Barrel_Shifter_module_n_23),
        .\Q_reg[23] (Barrel_Shifter_module_n_21),
        .\Q_reg[24] (Barrel_Shifter_module_n_19),
        .\Q_reg[25] (Barrel_Shifter_module_n_17),
        .\Q_reg[2] (\Mux_Array/Data_array[3]_0 ),
        .\Q_reg[3] (Sel_B_n_36),
        .\Q_reg[4] (Sel_B_n_35),
        .r_mode_IBUF(r_mode_IBUF),
        .round_flag(round_flag),
        .sign_final_result(sign_final_result));
  IBUF \Data_X_IBUF[0]_inst
       (.I(Data_X[0]),
        .O(Data_X_IBUF[0]));
  IBUF \Data_X_IBUF[10]_inst
       (.I(Data_X[10]),
        .O(Data_X_IBUF[10]));
  IBUF \Data_X_IBUF[11]_inst
       (.I(Data_X[11]),
        .O(Data_X_IBUF[11]));
  IBUF \Data_X_IBUF[12]_inst
       (.I(Data_X[12]),
        .O(Data_X_IBUF[12]));
  IBUF \Data_X_IBUF[13]_inst
       (.I(Data_X[13]),
        .O(Data_X_IBUF[13]));
  IBUF \Data_X_IBUF[14]_inst
       (.I(Data_X[14]),
        .O(Data_X_IBUF[14]));
  IBUF \Data_X_IBUF[15]_inst
       (.I(Data_X[15]),
        .O(Data_X_IBUF[15]));
  IBUF \Data_X_IBUF[16]_inst
       (.I(Data_X[16]),
        .O(Data_X_IBUF[16]));
  IBUF \Data_X_IBUF[17]_inst
       (.I(Data_X[17]),
        .O(Data_X_IBUF[17]));
  IBUF \Data_X_IBUF[18]_inst
       (.I(Data_X[18]),
        .O(Data_X_IBUF[18]));
  IBUF \Data_X_IBUF[19]_inst
       (.I(Data_X[19]),
        .O(Data_X_IBUF[19]));
  IBUF \Data_X_IBUF[1]_inst
       (.I(Data_X[1]),
        .O(Data_X_IBUF[1]));
  IBUF \Data_X_IBUF[20]_inst
       (.I(Data_X[20]),
        .O(Data_X_IBUF[20]));
  IBUF \Data_X_IBUF[21]_inst
       (.I(Data_X[21]),
        .O(Data_X_IBUF[21]));
  IBUF \Data_X_IBUF[22]_inst
       (.I(Data_X[22]),
        .O(Data_X_IBUF[22]));
  IBUF \Data_X_IBUF[23]_inst
       (.I(Data_X[23]),
        .O(Data_X_IBUF[23]));
  IBUF \Data_X_IBUF[24]_inst
       (.I(Data_X[24]),
        .O(Data_X_IBUF[24]));
  IBUF \Data_X_IBUF[25]_inst
       (.I(Data_X[25]),
        .O(Data_X_IBUF[25]));
  IBUF \Data_X_IBUF[26]_inst
       (.I(Data_X[26]),
        .O(Data_X_IBUF[26]));
  IBUF \Data_X_IBUF[27]_inst
       (.I(Data_X[27]),
        .O(Data_X_IBUF[27]));
  IBUF \Data_X_IBUF[28]_inst
       (.I(Data_X[28]),
        .O(Data_X_IBUF[28]));
  IBUF \Data_X_IBUF[29]_inst
       (.I(Data_X[29]),
        .O(Data_X_IBUF[29]));
  IBUF \Data_X_IBUF[2]_inst
       (.I(Data_X[2]),
        .O(Data_X_IBUF[2]));
  IBUF \Data_X_IBUF[30]_inst
       (.I(Data_X[30]),
        .O(Data_X_IBUF[30]));
  IBUF \Data_X_IBUF[31]_inst
       (.I(Data_X[31]),
        .O(Data_X_IBUF[31]));
  IBUF \Data_X_IBUF[3]_inst
       (.I(Data_X[3]),
        .O(Data_X_IBUF[3]));
  IBUF \Data_X_IBUF[4]_inst
       (.I(Data_X[4]),
        .O(Data_X_IBUF[4]));
  IBUF \Data_X_IBUF[5]_inst
       (.I(Data_X[5]),
        .O(Data_X_IBUF[5]));
  IBUF \Data_X_IBUF[6]_inst
       (.I(Data_X[6]),
        .O(Data_X_IBUF[6]));
  IBUF \Data_X_IBUF[7]_inst
       (.I(Data_X[7]),
        .O(Data_X_IBUF[7]));
  IBUF \Data_X_IBUF[8]_inst
       (.I(Data_X[8]),
        .O(Data_X_IBUF[8]));
  IBUF \Data_X_IBUF[9]_inst
       (.I(Data_X[9]),
        .O(Data_X_IBUF[9]));
  IBUF \Data_Y_IBUF[0]_inst
       (.I(Data_Y[0]),
        .O(Data_Y_IBUF[0]));
  IBUF \Data_Y_IBUF[10]_inst
       (.I(Data_Y[10]),
        .O(Data_Y_IBUF[10]));
  IBUF \Data_Y_IBUF[11]_inst
       (.I(Data_Y[11]),
        .O(Data_Y_IBUF[11]));
  IBUF \Data_Y_IBUF[12]_inst
       (.I(Data_Y[12]),
        .O(Data_Y_IBUF[12]));
  IBUF \Data_Y_IBUF[13]_inst
       (.I(Data_Y[13]),
        .O(Data_Y_IBUF[13]));
  IBUF \Data_Y_IBUF[14]_inst
       (.I(Data_Y[14]),
        .O(Data_Y_IBUF[14]));
  IBUF \Data_Y_IBUF[15]_inst
       (.I(Data_Y[15]),
        .O(Data_Y_IBUF[15]));
  IBUF \Data_Y_IBUF[16]_inst
       (.I(Data_Y[16]),
        .O(Data_Y_IBUF[16]));
  IBUF \Data_Y_IBUF[17]_inst
       (.I(Data_Y[17]),
        .O(Data_Y_IBUF[17]));
  IBUF \Data_Y_IBUF[18]_inst
       (.I(Data_Y[18]),
        .O(Data_Y_IBUF[18]));
  IBUF \Data_Y_IBUF[19]_inst
       (.I(Data_Y[19]),
        .O(Data_Y_IBUF[19]));
  IBUF \Data_Y_IBUF[1]_inst
       (.I(Data_Y[1]),
        .O(Data_Y_IBUF[1]));
  IBUF \Data_Y_IBUF[20]_inst
       (.I(Data_Y[20]),
        .O(Data_Y_IBUF[20]));
  IBUF \Data_Y_IBUF[21]_inst
       (.I(Data_Y[21]),
        .O(Data_Y_IBUF[21]));
  IBUF \Data_Y_IBUF[22]_inst
       (.I(Data_Y[22]),
        .O(Data_Y_IBUF[22]));
  IBUF \Data_Y_IBUF[23]_inst
       (.I(Data_Y[23]),
        .O(Data_Y_IBUF[23]));
  IBUF \Data_Y_IBUF[24]_inst
       (.I(Data_Y[24]),
        .O(Data_Y_IBUF[24]));
  IBUF \Data_Y_IBUF[25]_inst
       (.I(Data_Y[25]),
        .O(Data_Y_IBUF[25]));
  IBUF \Data_Y_IBUF[26]_inst
       (.I(Data_Y[26]),
        .O(Data_Y_IBUF[26]));
  IBUF \Data_Y_IBUF[27]_inst
       (.I(Data_Y[27]),
        .O(Data_Y_IBUF[27]));
  IBUF \Data_Y_IBUF[28]_inst
       (.I(Data_Y[28]),
        .O(Data_Y_IBUF[28]));
  IBUF \Data_Y_IBUF[29]_inst
       (.I(Data_Y[29]),
        .O(Data_Y_IBUF[29]));
  IBUF \Data_Y_IBUF[2]_inst
       (.I(Data_Y[2]),
        .O(Data_Y_IBUF[2]));
  IBUF \Data_Y_IBUF[30]_inst
       (.I(Data_Y[30]),
        .O(Data_Y_IBUF[30]));
  IBUF \Data_Y_IBUF[31]_inst
       (.I(Data_Y[31]),
        .O(Data_Y_IBUF[31]));
  IBUF \Data_Y_IBUF[3]_inst
       (.I(Data_Y[3]),
        .O(Data_Y_IBUF[3]));
  IBUF \Data_Y_IBUF[4]_inst
       (.I(Data_Y[4]),
        .O(Data_Y_IBUF[4]));
  IBUF \Data_Y_IBUF[5]_inst
       (.I(Data_Y[5]),
        .O(Data_Y_IBUF[5]));
  IBUF \Data_Y_IBUF[6]_inst
       (.I(Data_Y[6]),
        .O(Data_Y_IBUF[6]));
  IBUF \Data_Y_IBUF[7]_inst
       (.I(Data_Y[7]),
        .O(Data_Y_IBUF[7]));
  IBUF \Data_Y_IBUF[8]_inst
       (.I(Data_Y[8]),
        .O(Data_Y_IBUF[8]));
  IBUF \Data_Y_IBUF[9]_inst
       (.I(Data_Y[9]),
        .O(Data_Y_IBUF[9]));
  Exp_Operation Exp_Operation_Module
       (.AR(FS_Module_n_25),
        .CLK(clk_IBUF_BUFG),
        .D({Sign_S_mux,Exp_Operation_Module_n_3,Exp_Operation_Module_n_4,Exp_Operation_Module_n_5,Exp_Operation_Module_n_6,Exp_Operation_Module_n_7,Exp_Operation_Module_n_8,Exp_Operation_Module_n_9,Exp_Operation_Module_n_10,Exp_Operation_Module_n_11,Exp_Operation_Module_n_12,Exp_Operation_Module_n_13,Exp_Operation_Module_n_14,Exp_Operation_Module_n_15,Exp_Operation_Module_n_16,Exp_Operation_Module_n_17,Exp_Operation_Module_n_18,Exp_Operation_Module_n_19,Exp_Operation_Module_n_20,Exp_Operation_Module_n_21,Exp_Operation_Module_n_22,Exp_Operation_Module_n_23,Exp_Operation_Module_n_24,Exp_Operation_Module_n_25,Exp_Operation_Module_n_26,Exp_Operation_Module_n_27,Exp_Operation_Module_n_28,Exp_Operation_Module_n_29,Exp_Operation_Module_n_30,Exp_Operation_Module_n_31,Exp_Operation_Module_n_32,Exp_Operation_Module_n_33}),
        .DI(Sel_B_n_11),
        .Data_A(Data_A),
        .E(FSM_exp_operation_load_diff),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_B(FSM_selector_B),
        .O(Sel_B_n_12),
        .Q(exp_oper_result),
        .\Q_reg[0] (Exp_Operation_Module_n_40),
        .\Q_reg[0]_0 (FS_Module_n_13),
        .\Q_reg[0]_1 (Sel_A_n_0),
        .\Q_reg[0]_2 (LZA_output[0]),
        .\Q_reg[1] ({Sel_B_n_0,Sel_B_n_1,Sel_B_n_2,Sel_B_n_3,Sel_B_n_4,Sel_B_n_5,Sel_B_n_6,Sel_B_n_7}),
        .\Q_reg[1]_0 (Sel_B_n_41),
        .\Q_reg[24] ({Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50}),
        .\Q_reg[26] ({Sel_B_n_8,Sel_B_n_9,Sel_B_n_10}),
        .\Q_reg[30] ({Oper_Start_in_module_n_34,Oper_Start_in_module_n_35,Oper_Start_in_module_n_36,Oper_Start_in_module_n_37,Oper_Start_in_module_n_38,Oper_Start_in_module_n_39,Oper_Start_in_module_n_40,Oper_Start_in_module_n_41}),
        .\Q_reg[30]_0 ({Oper_Start_in_module_n_65,Oper_Start_in_module_n_66,Oper_Start_in_module_n_67,Oper_Start_in_module_n_72}),
        .\Q_reg[3] ({Exp_Operation_Module_n_45,Exp_Operation_Module_n_46,Exp_Operation_Module_n_47,Exp_Operation_Module_n_48}),
        .S({Exp_Operation_Module_n_41,Exp_Operation_Module_n_42,Exp_Operation_Module_n_43,Exp_Operation_Module_n_44}),
        .overflow_flag_OBUF(overflow_flag_OBUF),
        .sign_final_result(sign_final_result),
        .underflow_flag_OBUF(underflow_flag_OBUF));
  FSM_Add_Subtract FS_Module
       (.AR(rst_int),
        .CLK(clk_IBUF_BUFG),
        .CO(eqXY),
        .E(FS_Module_n_12),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_C(FSM_selector_C),
        .FSM_selector_D(FSM_selector_D),
        .Q({Add_Subt_Sgf_module_n_26,Add_Subt_Sgf_module_n_27}),
        .\Q_reg[0] (FS_Module_n_5),
        .\Q_reg[0]_0 (FS_Module_n_10),
        .\Q_reg[0]_1 (FS_Module_n_11),
        .\Q_reg[0]_10 (Add_Subt_Sgf_module_n_24),
        .\Q_reg[0]_11 (Sel_B_n_40),
        .\Q_reg[0]_12 (Sel_A_n_0),
        .\Q_reg[0]_13 (Exp_Operation_Module_n_40),
        .\Q_reg[0]_2 (FS_Module_n_13),
        .\Q_reg[0]_3 (FSM_exp_operation_load_diff),
        .\Q_reg[0]_4 (FSM_Add_Subt_Sgf_load),
        .\Q_reg[0]_5 (FSM_op_start_in_load_a),
        .\Q_reg[0]_6 (FSM_op_start_in_load_b),
        .\Q_reg[0]_7 (FSM_barrel_shifter_load),
        .\Q_reg[0]_8 (FSM_LZA_load),
        .\Q_reg[0]_9 (Add_Subt_Sgf_module_n_25),
        .\Q_reg[1] (Sel_B_n_17),
        .\Q_reg[1]_0 ({Sel_B_n_1,Sel_B_n_2,Sel_B_n_4}),
        .\Q_reg[21] (FS_Module_n_2),
        .\Q_reg[23] ({\Mux_Array/Data_array[3]_0 [23],\Mux_Array/Data_array[3]_0 [21]}),
        .\Q_reg[2] (Sel_B_n_16),
        .\Q_reg[31] ({FS_Module_n_24,FS_Module_n_25}),
        .\Q_reg[31]_0 (Oper_Start_in_module_n_33),
        .S(FS_Module_n_23),
        .ack_FSM_IBUF(ack_FSM_IBUF),
        .add_overflow_flag(add_overflow_flag),
        .beg_FSM_IBUF(beg_FSM_IBUF),
        .in1(rst_IBUF),
        .out({FS_Module_n_6,FS_Module_n_7,FS_Module_n_8,FS_Module_n_9}),
        .ready_OBUF(ready_OBUF),
        .round_flag(round_flag),
        .underflow_flag_OBUF(underflow_flag_OBUF),
        .zero_flag(zero_flag));
  LZD Leading_Zero_Detector_Module
       (.CLK(clk_IBUF_BUFG),
        .D(Codec_to_Reg),
        .E(FSM_LZA_load),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_25),
        .Q(LZA_output));
  Oper_Start_In Oper_Start_in_module
       (.AR(rst_int),
        .CLK(clk_IBUF_BUFG),
        .CO(eqXY),
        .D(Data_Y_IBUF),
        .\Data_X[31] (Data_X_IBUF),
        .E(FSM_op_start_in_load_a),
        .FSM_selector_D(FSM_selector_D),
        .\FSM_sequential_state_reg_reg[3] (Oper_Start_in_module_n_33),
        .\FSM_sequential_state_reg_reg[3]_0 (FSM_op_start_in_load_b),
        .\FSM_sequential_state_reg_reg[3]_1 ({FS_Module_n_24,FS_Module_n_25}),
        .O({Oper_Start_in_module_n_27,Oper_Start_in_module_n_28,Oper_Start_in_module_n_29}),
        .Q(intDY),
        .\Q_reg[0] (intDX),
        .\Q_reg[0]_0 (Sel_D_n_1),
        .\Q_reg[23] ({Oper_Start_in_module_n_3,Oper_Start_in_module_n_4,Oper_Start_in_module_n_5,Oper_Start_in_module_n_6,Oper_Start_in_module_n_7,Oper_Start_in_module_n_8,Oper_Start_in_module_n_9,Oper_Start_in_module_n_10,Oper_Start_in_module_n_11,Oper_Start_in_module_n_12,Oper_Start_in_module_n_13,Oper_Start_in_module_n_14,Oper_Start_in_module_n_15,Oper_Start_in_module_n_16,Oper_Start_in_module_n_17,Oper_Start_in_module_n_18,Oper_Start_in_module_n_19,Oper_Start_in_module_n_20,Oper_Start_in_module_n_21,Oper_Start_in_module_n_22,Oper_Start_in_module_n_23,Oper_Start_in_module_n_24,Oper_Start_in_module_n_25,Oper_Start_in_module_n_26}),
        .\Q_reg[25] ({Barrel_Shifter_module_n_27,Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50,Sgf_normalized_result[1]}),
        .\Q_reg[31] ({Add_Subt_Sgf_module_n_37,Add_Subt_Sgf_module_n_38,Add_Subt_Sgf_module_n_39,Add_Subt_Sgf_module_n_40}),
        .\Q_reg[31]_0 ({Add_Subt_Sgf_module_n_41,Add_Subt_Sgf_module_n_42,Add_Subt_Sgf_module_n_43,Add_Subt_Sgf_module_n_44}),
        .\Q_reg[31]_1 ({Add_Subt_Sgf_module_n_45,Add_Subt_Sgf_module_n_46,Add_Subt_Sgf_module_n_47,Add_Subt_Sgf_module_n_48}),
        .\Q_reg[31]_2 ({Add_Subt_Sgf_module_n_49,Add_Subt_Sgf_module_n_50,Add_Subt_Sgf_module_n_51,Add_Subt_Sgf_module_n_52}),
        .\Q_reg[31]_3 ({Add_Subt_Sgf_module_n_53,Add_Subt_Sgf_module_n_54,Add_Subt_Sgf_module_n_55,Add_Subt_Sgf_module_n_56}),
        .\Q_reg[31]_4 ({Add_Subt_Sgf_module_n_57,Add_Subt_Sgf_module_n_58}),
        .\Q_reg[7] ({Oper_Start_in_module_n_34,Oper_Start_in_module_n_35,Oper_Start_in_module_n_36,Oper_Start_in_module_n_37,Oper_Start_in_module_n_38,Oper_Start_in_module_n_39,Oper_Start_in_module_n_40,Oper_Start_in_module_n_41,Oper_Start_in_module_n_42,Oper_Start_in_module_n_43,Oper_Start_in_module_n_44,Oper_Start_in_module_n_45,Oper_Start_in_module_n_46,Oper_Start_in_module_n_47,Oper_Start_in_module_n_48,Oper_Start_in_module_n_49,Oper_Start_in_module_n_50,Oper_Start_in_module_n_51,Oper_Start_in_module_n_52,Oper_Start_in_module_n_53,Oper_Start_in_module_n_54,Oper_Start_in_module_n_55,Oper_Start_in_module_n_56,Oper_Start_in_module_n_57,Oper_Start_in_module_n_58,Oper_Start_in_module_n_59,Oper_Start_in_module_n_60,Oper_Start_in_module_n_61,Oper_Start_in_module_n_62,Oper_Start_in_module_n_63,Oper_Start_in_module_n_64}),
        .\Q_reg[7]_0 ({Oper_Start_in_module_n_65,Oper_Start_in_module_n_66,Oper_Start_in_module_n_67,Oper_Start_in_module_n_68,Oper_Start_in_module_n_69,Oper_Start_in_module_n_70,Oper_Start_in_module_n_71,Oper_Start_in_module_n_72,Oper_Start_in_module_n_73,Oper_Start_in_module_n_74,Oper_Start_in_module_n_75,Oper_Start_in_module_n_76,Oper_Start_in_module_n_77,Oper_Start_in_module_n_78,Oper_Start_in_module_n_79,Oper_Start_in_module_n_80,Oper_Start_in_module_n_81,Oper_Start_in_module_n_82,Oper_Start_in_module_n_83,Oper_Start_in_module_n_84,Oper_Start_in_module_n_85,Oper_Start_in_module_n_86,Oper_Start_in_module_n_87,Oper_Start_in_module_n_88,Oper_Start_in_module_n_89,Oper_Start_in_module_n_90,Oper_Start_in_module_n_91,Oper_Start_in_module_n_92,Oper_Start_in_module_n_93,Oper_Start_in_module_n_94,Oper_Start_in_module_n_95}),
        .S({Add_Subt_Sgf_module_n_33,Add_Subt_Sgf_module_n_34,Add_Subt_Sgf_module_n_35,Add_Subt_Sgf_module_n_36}),
        .add_subt_IBUF(add_subt_IBUF),
        .intAS(intAS),
        .sign_final_result(sign_final_result),
        .zero_flag(zero_flag));
  RegisterAdd Sel_A
       (.CLK(clk_IBUF_BUFG),
        .\FSM_sequential_state_reg_reg[0] (FS_Module_n_11),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_25),
        .\Q_reg[0]_0 (Sel_A_n_0));
  RegisterAdd__parameterized0 Sel_B
       (.CLK(clk_IBUF_BUFG),
        .D(Data_Reg),
        .DI(Sel_B_n_11),
        .Data_A(Data_A),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_B(FSM_selector_B),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_25),
        .O(Sel_B_n_12),
        .Q(\Mux_Array/Data_array[4]_1 ),
        .\Q_reg[0]_0 (Sel_B_n_35),
        .\Q_reg[0]_1 (Sel_B_n_36),
        .\Q_reg[0]_2 (FS_Module_n_23),
        .\Q_reg[0]_3 (FS_Module_n_2),
        .\Q_reg[0]_4 (Add_Subt_Sgf_module_n_22),
        .\Q_reg[0]_5 (Add_Subt_Sgf_module_n_23),
        .\Q_reg[16] (Barrel_Shifter_module_n_17),
        .\Q_reg[17] (Barrel_Shifter_module_n_19),
        .\Q_reg[18] (Barrel_Shifter_module_n_21),
        .\Q_reg[19] (Barrel_Shifter_module_n_23),
        .\Q_reg[20] (Barrel_Shifter_module_n_25),
        .\Q_reg[21] (Sel_B_n_40),
        .\Q_reg[21]_0 (Barrel_Shifter_module_n_24),
        .\Q_reg[22] (Barrel_Shifter_module_n_22),
        .\Q_reg[23] (Barrel_Shifter_module_n_20),
        .\Q_reg[24] (Barrel_Shifter_module_n_18),
        .\Q_reg[25] ({\Mux_Array/Data_array[3]_0 [25:24],\Mux_Array/Data_array[3]_0 [22]}),
        .\Q_reg[25]_0 (Sel_B_n_16),
        .\Q_reg[25]_1 (Sel_B_n_17),
        .\Q_reg[25]_2 (Barrel_Shifter_module_n_0),
        .\Q_reg[26] ({Exp_Operation_Module_n_45,Exp_Operation_Module_n_46,Exp_Operation_Module_n_47,Exp_Operation_Module_n_48}),
        .\Q_reg[30] ({Oper_Start_in_module_n_65,Oper_Start_in_module_n_66,Oper_Start_in_module_n_67,Oper_Start_in_module_n_68,Oper_Start_in_module_n_69,Oper_Start_in_module_n_70,Oper_Start_in_module_n_71}),
        .\Q_reg[3] ({Sel_B_n_8,Sel_B_n_9,Sel_B_n_10}),
        .\Q_reg[4] (LZA_output),
        .\Q_reg[4]_0 (exp_oper_result),
        .\Q_reg[7] ({Sel_B_n_0,Sel_B_n_1,Sel_B_n_2,Sel_B_n_3,Sel_B_n_4,Sel_B_n_5,Sel_B_n_6,Sel_B_n_7}),
        .\Q_reg[7]_0 (Sel_B_n_41),
        .\Q_reg[8] (Sel_B_n_37),
        .\Q_reg[9] (Sel_B_n_34),
        .S({Exp_Operation_Module_n_41,Exp_Operation_Module_n_42,Exp_Operation_Module_n_43,Exp_Operation_Module_n_44}),
        .add_overflow_flag(add_overflow_flag),
        .out({FS_Module_n_6,FS_Module_n_7,FS_Module_n_8,FS_Module_n_9}));
  RegisterAdd_0 Sel_C
       (.CLK(clk_IBUF_BUFG),
        .FSM_selector_C(FSM_selector_C),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_5),
        .\FSM_sequential_state_reg_reg[3]_0 (FS_Module_n_25));
  RegisterAdd_1 Sel_D
       (.CLK(clk_IBUF_BUFG),
        .FSM_selector_D(FSM_selector_D),
        .\FSM_sequential_state_reg_reg[0] (FS_Module_n_10),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_25),
        .\Q_reg[0]_0 (Sgf_normalized_result[0]),
        .\Q_reg[3] (Sel_D_n_1));
  IBUF ack_FSM_IBUF_inst
       (.I(ack_FSM),
        .O(ack_FSM_IBUF));
  IBUF add_subt_IBUF_inst
       (.I(add_subt),
        .O(add_subt_IBUF));
  IBUF beg_FSM_IBUF_inst
       (.I(beg_FSM),
        .O(beg_FSM_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  Tenth_Phase final_result_ieee_Module
       (.AR(rst_int),
        .CLK(clk_IBUF_BUFG),
        .D({Sign_S_mux,Exp_Operation_Module_n_3,Exp_Operation_Module_n_4,Exp_Operation_Module_n_5,Exp_Operation_Module_n_6,Exp_Operation_Module_n_7,Exp_Operation_Module_n_8,Exp_Operation_Module_n_9,Exp_Operation_Module_n_10,Exp_Operation_Module_n_11,Exp_Operation_Module_n_12,Exp_Operation_Module_n_13,Exp_Operation_Module_n_14,Exp_Operation_Module_n_15,Exp_Operation_Module_n_16,Exp_Operation_Module_n_17,Exp_Operation_Module_n_18,Exp_Operation_Module_n_19,Exp_Operation_Module_n_20,Exp_Operation_Module_n_21,Exp_Operation_Module_n_22,Exp_Operation_Module_n_23,Exp_Operation_Module_n_24,Exp_Operation_Module_n_25,Exp_Operation_Module_n_26,Exp_Operation_Module_n_27,Exp_Operation_Module_n_28,Exp_Operation_Module_n_29,Exp_Operation_Module_n_30,Exp_Operation_Module_n_31,Exp_Operation_Module_n_32,Exp_Operation_Module_n_33}),
        .E(FS_Module_n_12),
        .Q(final_result_ieee_OBUF));
  OBUF \final_result_ieee_OBUF[0]_inst
       (.I(final_result_ieee_OBUF[0]),
        .O(final_result_ieee[0]));
  OBUF \final_result_ieee_OBUF[10]_inst
       (.I(final_result_ieee_OBUF[10]),
        .O(final_result_ieee[10]));
  OBUF \final_result_ieee_OBUF[11]_inst
       (.I(final_result_ieee_OBUF[11]),
        .O(final_result_ieee[11]));
  OBUF \final_result_ieee_OBUF[12]_inst
       (.I(final_result_ieee_OBUF[12]),
        .O(final_result_ieee[12]));
  OBUF \final_result_ieee_OBUF[13]_inst
       (.I(final_result_ieee_OBUF[13]),
        .O(final_result_ieee[13]));
  OBUF \final_result_ieee_OBUF[14]_inst
       (.I(final_result_ieee_OBUF[14]),
        .O(final_result_ieee[14]));
  OBUF \final_result_ieee_OBUF[15]_inst
       (.I(final_result_ieee_OBUF[15]),
        .O(final_result_ieee[15]));
  OBUF \final_result_ieee_OBUF[16]_inst
       (.I(final_result_ieee_OBUF[16]),
        .O(final_result_ieee[16]));
  OBUF \final_result_ieee_OBUF[17]_inst
       (.I(final_result_ieee_OBUF[17]),
        .O(final_result_ieee[17]));
  OBUF \final_result_ieee_OBUF[18]_inst
       (.I(final_result_ieee_OBUF[18]),
        .O(final_result_ieee[18]));
  OBUF \final_result_ieee_OBUF[19]_inst
       (.I(final_result_ieee_OBUF[19]),
        .O(final_result_ieee[19]));
  OBUF \final_result_ieee_OBUF[1]_inst
       (.I(final_result_ieee_OBUF[1]),
        .O(final_result_ieee[1]));
  OBUF \final_result_ieee_OBUF[20]_inst
       (.I(final_result_ieee_OBUF[20]),
        .O(final_result_ieee[20]));
  OBUF \final_result_ieee_OBUF[21]_inst
       (.I(final_result_ieee_OBUF[21]),
        .O(final_result_ieee[21]));
  OBUF \final_result_ieee_OBUF[22]_inst
       (.I(final_result_ieee_OBUF[22]),
        .O(final_result_ieee[22]));
  OBUF \final_result_ieee_OBUF[23]_inst
       (.I(final_result_ieee_OBUF[23]),
        .O(final_result_ieee[23]));
  OBUF \final_result_ieee_OBUF[24]_inst
       (.I(final_result_ieee_OBUF[24]),
        .O(final_result_ieee[24]));
  OBUF \final_result_ieee_OBUF[25]_inst
       (.I(final_result_ieee_OBUF[25]),
        .O(final_result_ieee[25]));
  OBUF \final_result_ieee_OBUF[26]_inst
       (.I(final_result_ieee_OBUF[26]),
        .O(final_result_ieee[26]));
  OBUF \final_result_ieee_OBUF[27]_inst
       (.I(final_result_ieee_OBUF[27]),
        .O(final_result_ieee[27]));
  OBUF \final_result_ieee_OBUF[28]_inst
       (.I(final_result_ieee_OBUF[28]),
        .O(final_result_ieee[28]));
  OBUF \final_result_ieee_OBUF[29]_inst
       (.I(final_result_ieee_OBUF[29]),
        .O(final_result_ieee[29]));
  OBUF \final_result_ieee_OBUF[2]_inst
       (.I(final_result_ieee_OBUF[2]),
        .O(final_result_ieee[2]));
  OBUF \final_result_ieee_OBUF[30]_inst
       (.I(final_result_ieee_OBUF[30]),
        .O(final_result_ieee[30]));
  OBUF \final_result_ieee_OBUF[31]_inst
       (.I(final_result_ieee_OBUF[31]),
        .O(final_result_ieee[31]));
  OBUF \final_result_ieee_OBUF[3]_inst
       (.I(final_result_ieee_OBUF[3]),
        .O(final_result_ieee[3]));
  OBUF \final_result_ieee_OBUF[4]_inst
       (.I(final_result_ieee_OBUF[4]),
        .O(final_result_ieee[4]));
  OBUF \final_result_ieee_OBUF[5]_inst
       (.I(final_result_ieee_OBUF[5]),
        .O(final_result_ieee[5]));
  OBUF \final_result_ieee_OBUF[6]_inst
       (.I(final_result_ieee_OBUF[6]),
        .O(final_result_ieee[6]));
  OBUF \final_result_ieee_OBUF[7]_inst
       (.I(final_result_ieee_OBUF[7]),
        .O(final_result_ieee[7]));
  OBUF \final_result_ieee_OBUF[8]_inst
       (.I(final_result_ieee_OBUF[8]),
        .O(final_result_ieee[8]));
  OBUF \final_result_ieee_OBUF[9]_inst
       (.I(final_result_ieee_OBUF[9]),
        .O(final_result_ieee[9]));
  OBUF overflow_flag_OBUF_inst
       (.I(overflow_flag_OBUF),
        .O(overflow_flag));
  IBUF \r_mode_IBUF[0]_inst
       (.I(r_mode[0]),
        .O(r_mode_IBUF[0]));
  IBUF \r_mode_IBUF[1]_inst
       (.I(r_mode[1]),
        .O(r_mode_IBUF[1]));
  OBUF ready_OBUF_inst
       (.I(ready_OBUF),
        .O(ready));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  OBUF underflow_flag_OBUF_inst
       (.I(underflow_flag_OBUF),
        .O(underflow_flag));
endmodule