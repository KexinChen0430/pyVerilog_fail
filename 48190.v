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
  wire [25:0]Add_Subt_LZD;
  wire [25:0]Add_Subt_result;
  wire [30:0]DMP;
  wire [31:0]Data_X;
  wire [31:0]Data_X_IBUF;
  wire [31:0]Data_Y;
  wire [31:0]Data_Y_IBUF;
  wire [30:0]DmP;
  wire FSM_Add_Subt_Sgf_load;
  wire FSM_Final_Result_load;
  wire FSM_LZA_load;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire FSM_barrel_shifter_load;
  wire FSM_exp_operation_A_S;
  wire FSM_exp_operation_load_OU;
  wire FSM_exp_operation_load_diff;
  wire FSM_op_start_in_load_a;
  wire FSM_op_start_in_load_b;
  wire FSM_selector_A;
  wire [1:0]FSM_selector_B;
  wire FSM_selector_C;
  wire FSM_selector_D;
  wire [4:0]LZA_output;
  wire [25:0]S_A_S_Oper_A;
  wire [25:0]S_A_S_Oper_B;
  wire S_A_S_op;
  wire [25:0]S_Data_Shift;
  wire [7:0]S_Oper_A_exp;
  wire [7:0]S_Oper_B_exp;
  wire [4:0]S_Shift_Value;
  wire [25:0]Sgf_normalized_result;
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
  wire [7:0]exp_oper_result;
  wire [31:0]final_result_ieee;
  wire [31:0]final_result_ieee_OBUF;
  wire load_b;
  wire overflow_flag;
  wire overflow_flag_OBUF;
  wire [1:0]r_mode;
  wire [1:0]r_mode_IBUF;
  wire ready;
  wire ready_OBUF;
  wire real_op;
  wire round_flag;
  wire rst;
  wire rst_IBUF;
  wire rst_int;
  wire [1:0]selector_B;
  wire selector_C;
  wire selector_D;
  wire sign_final_result;
  wire underflow_flag;
  wire underflow_flag_OBUF;
  wire zero_flag;
  wire NLW_FS_Module_ctrl_a_o_UNCONNECTED;
initial begin
 $sdf_annotate("Testbench_FPU_Add_Subt_time_synth.sdf",,,,"tool_control");
end
  (* W = "26" *)
  Multiplexer_AC__parameterized158 Add_Sub_Sgf_Oper_A_mux
       (.D0({1'b0,DMP[22:0],1'b0,1'b0}),
        .D1(Sgf_normalized_result),
        .S(S_A_S_Oper_A),
        .ctrl(FSM_selector_D));
  (* W = "26" *)
  Multiplexer_AC__parameterized159 Add_Sub_Sgf_Oper_B_mux
       (.D0(Sgf_normalized_result),
        .D1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S(S_A_S_Oper_B),
        .ctrl(FSM_selector_D));
  (* W = "1" *)
  Multiplexer_AC__parameterized157 Add_Sub_Sgf_op_mux
       (.D0(real_op),
        .D1(1'b0),
        .S(S_A_S_op),
        .ctrl(FSM_selector_D));
  (* SWR = "26" *)
  Add_Subt Add_Subt_Sgf_module
       (.Add_Sub_op_i(S_A_S_op),
        .Data_A_i(S_A_S_Oper_A),
        .Data_Result_o(Add_Subt_result),
        .FSM_C_o(add_overflow_flag),
        .PreData_B_i(S_A_S_Oper_B),
        .clk(clk_IBUF_BUFG),
        .load_i(FSM_Add_Subt_Sgf_load),
        .rst(rst_int));
  (* W = "26" *)
  Multiplexer_AC__parameterized0 Barrel_Shifter_D_I_mux
       (.D0({1'b0,DmP[22:0],1'b0,1'b0}),
        .D1(Add_Subt_result),
        .S(S_Data_Shift),
        .ctrl(FSM_selector_C));
  (* W = "5" *)
  Mux_3x1__parameterized0 Barrel_Shifter_S_V_mux
       (.D0(exp_oper_result[4:0]),
        .D1(LZA_output),
        .D2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S(S_Shift_Value),
        .ctrl(FSM_selector_B));
  (* EWR = "5" *)
  (* SWR = "26" *)
  Barrel_Shifter Barrel_Shifter_module
       (.Bit_Shift_i(FSM_barrel_shifter_B_S),
        .Left_Right_i(FSM_barrel_shifter_L_R),
        .N_mant_o(Sgf_normalized_result),
        .Shift_Data_i(S_Data_Shift),
        .Shift_Value_i(S_Shift_Value),
        .clk(clk_IBUF_BUFG),
        .load_i(FSM_barrel_shifter_load),
        .rst(rst_int));
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
  (* W = "8" *)
  Multiplexer_AC__1 Exp_Oper_A_mux
       (.D0(DMP[30:23]),
        .D1(exp_oper_result),
        .S(S_Oper_A_exp),
        .ctrl(FSM_selector_A));
  (* W = "8" *)
  Mux_3x1 Exp_Oper_B_mux
       (.D0(DmP[30:23]),
        .D1({1'b0,1'b0,1'b0,LZA_output}),
        .D2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S(S_Oper_B_exp),
        .ctrl(FSM_selector_B));
  (* EW = "8" *)
  Exp_Operation Exp_Operation_Module
       (.Add_Subt_i(FSM_exp_operation_A_S),
        .Data_A_i(S_Oper_A_exp),
        .Data_B_i(S_Oper_B_exp),
        .Data_Result_o(exp_oper_result),
        .Overflow_flag_o(overflow_flag_OBUF),
        .Underflow_flag_o(underflow_flag_OBUF),
        .clk(clk_IBUF_BUFG),
        .load_a_i(FSM_exp_operation_load_diff),
        .load_b_i(FSM_exp_operation_load_OU),
        .rst(rst_int));
  (* add_subt = "4'b0110" *)
  (* add_subt_r = "4'b0111" *)
  (* extra1_64 = "4'b0100" *)
  (* extra2_64 = "4'b1011" *)
  (* load_diff_exp = "4'b0011" *)
  (* load_final_result = "4'b1101" *)
  (* load_oper = "4'b0001" *)
  (* norm_sgf_first = "4'b0101" *)
  (* norm_sgf_r = "4'b1100" *)
  (* overflow_add = "4'b1000" *)
  (* overflow_add_r = "4'b1010" *)
  (* ready_flag = "4'b1110" *)
  (* round_sgf = "4'b1001" *)
  (* start = "4'b0000" *)
  (* zero_info_state = "4'b0010" *)
  FSM_Add_Subtract FS_Module
       (.A_S_op_o(FSM_exp_operation_A_S),
        .add_overflow_i(add_overflow_flag),
        .beg_FSM(beg_FSM_IBUF),
        .bit_shift_o(FSM_barrel_shifter_B_S),
        .clk(clk_IBUF_BUFG),
        .ctrl_a_o(NLW_FS_Module_ctrl_a_o_UNCONNECTED),
        .ctrl_b_load_o(load_b),
        .ctrl_b_o(selector_B),
        .ctrl_c_o(selector_C),
        .ctrl_d_o(selector_D),
        .left_right_o(FSM_barrel_shifter_L_R),
        .load_1_o(FSM_op_start_in_load_a),
        .load_2_o(FSM_op_start_in_load_b),
        .load_3_o(FSM_exp_operation_load_diff),
        .load_4_o(FSM_barrel_shifter_load),
        .load_5_o(FSM_Add_Subt_Sgf_load),
        .load_6_o(FSM_LZA_load),
        .load_7_o(FSM_Final_Result_load),
        .load_8_o(FSM_exp_operation_load_OU),
        .norm_iteration_i(FSM_selector_C),
        .ready(ready_OBUF),
        .round_i(round_flag),
        .rst(rst_IBUF),
        .rst_FSM(ack_FSM_IBUF),
        .rst_int(rst_int),
        .zero_flag_i(zero_flag));
  (* EWR = "5" *)
  (* SWR = "26" *)
  LZD Leading_Zero_Detector_Module
       (.Add_subt_result_i(Add_Subt_LZD),
        .Shift_Value_o(LZA_output),
        .clk(clk_IBUF_BUFG),
        .load_i(FSM_LZA_load),
        .rst(rst_int));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_1
       (.I0(Add_Subt_result[25]),
        .O(Add_Subt_LZD[25]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_10
       (.I0(Add_Subt_result[16]),
        .O(Add_Subt_LZD[16]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_11
       (.I0(Add_Subt_result[15]),
        .O(Add_Subt_LZD[15]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_12
       (.I0(Add_Subt_result[14]),
        .O(Add_Subt_LZD[14]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_13
       (.I0(Add_Subt_result[13]),
        .O(Add_Subt_LZD[13]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_14
       (.I0(Add_Subt_result[12]),
        .O(Add_Subt_LZD[12]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_15
       (.I0(Add_Subt_result[11]),
        .O(Add_Subt_LZD[11]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_16
       (.I0(Add_Subt_result[10]),
        .O(Add_Subt_LZD[10]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_17
       (.I0(Add_Subt_result[9]),
        .O(Add_Subt_LZD[9]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_18
       (.I0(Add_Subt_result[8]),
        .O(Add_Subt_LZD[8]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_19
       (.I0(Add_Subt_result[7]),
        .O(Add_Subt_LZD[7]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_2
       (.I0(Add_Subt_result[24]),
        .O(Add_Subt_LZD[24]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_20
       (.I0(Add_Subt_result[6]),
        .O(Add_Subt_LZD[6]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_21
       (.I0(Add_Subt_result[5]),
        .O(Add_Subt_LZD[5]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_22
       (.I0(Add_Subt_result[4]),
        .O(Add_Subt_LZD[4]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_23
       (.I0(Add_Subt_result[3]),
        .O(Add_Subt_LZD[3]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_24
       (.I0(Add_Subt_result[2]),
        .O(Add_Subt_LZD[2]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_25
       (.I0(Add_Subt_result[1]),
        .O(Add_Subt_LZD[1]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_26
       (.I0(Add_Subt_result[0]),
        .O(Add_Subt_LZD[0]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_3
       (.I0(Add_Subt_result[23]),
        .O(Add_Subt_LZD[23]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_4
       (.I0(Add_Subt_result[22]),
        .O(Add_Subt_LZD[22]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_5
       (.I0(Add_Subt_result[21]),
        .O(Add_Subt_LZD[21]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_6
       (.I0(Add_Subt_result[20]),
        .O(Add_Subt_LZD[20]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_7
       (.I0(Add_Subt_result[19]),
        .O(Add_Subt_LZD[19]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_8
       (.I0(Add_Subt_result[18]),
        .O(Add_Subt_LZD[18]));
  LUT1 #(
    .INIT(2'h1))
    Leading_Zero_Detector_Module_i_9
       (.I0(Add_Subt_result[17]),
        .O(Add_Subt_LZD[17]));
  (* W = "32" *)
  Oper_Start_In Oper_Start_in_module
       (.DMP_o(DMP),
        .Data_X_i(Data_X_IBUF),
        .Data_Y_i(Data_Y_IBUF),
        .DmP_o(DmP),
        .add_subt_i(add_subt_IBUF),
        .clk(clk_IBUF_BUFG),
        .load_a_i(FSM_op_start_in_load_a),
        .load_b_i(FSM_op_start_in_load_b),
        .real_op_o(real_op),
        .rst(rst_int),
        .sign_final_result_o(sign_final_result),
        .zero_flag_o(zero_flag));
  Round_Sgf_Dec Rounding_Decoder
       (.Data_i(Sgf_normalized_result[1:0]),
        .Round_Flag_o(round_flag),
        .Round_Type_i(r_mode_IBUF),
        .Sign_Result_i(sign_final_result));
  (* W = "1" *)
  RegisterAdd__1 Sel_A
       (.D(1'b0),
        .Q(FSM_selector_A),
        .clk(clk_IBUF_BUFG),
        .load(selector_D),
        .rst(rst_int));
  (* W = "2" *)
  RegisterAdd__parameterized0 Sel_B
       (.D(selector_B),
        .Q(FSM_selector_B),
        .clk(clk_IBUF_BUFG),
        .load(load_b),
        .rst(rst_int));
  (* W = "1" *)
  RegisterAdd__2 Sel_C
       (.D(1'b0),
        .Q(FSM_selector_C),
        .clk(clk_IBUF_BUFG),
        .load(selector_C),
        .rst(rst_int));
  (* W = "1" *)
  RegisterAdd__3 Sel_D
       (.D(1'b0),
        .Q(FSM_selector_D),
        .clk(clk_IBUF_BUFG),
        .load(selector_D),
        .rst(rst_int));
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
  (* EW = "8" *)
  (* SW = "23" *)
  (* W = "32" *)
  Tenth_Phase final_result_ieee_Module
       (.clk(clk_IBUF_BUFG),
        .exp_ieee_i(exp_oper_result),
        .final_result_ieee_o(final_result_ieee_OBUF),
        .load_i(FSM_Final_Result_load),
        .rst(rst_int),
        .sel_a_i(overflow_flag_OBUF),
        .sel_b_i(underflow_flag_OBUF),
        .sgf_ieee_i(Sgf_normalized_result[24:2]),
        .sign_i(sign_final_result));
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