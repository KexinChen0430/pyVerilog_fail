module CORDIC_Arch3
   (clk,
    rst,
    beg_fsm_cordic,
    ack_cordic,
    operation,
    data_in,
    shift_region_flag,
    ready_cordic,
    overflow_flag,
    underflow_flag,
    zero_flag,
    busy,
    data_output);
  input clk;
  input rst;
  input beg_fsm_cordic;
  input ack_cordic;
  input operation;
  input [31:0]data_in;
  input [1:0]shift_region_flag;
  output ready_cordic;
  output overflow_flag;
  output underflow_flag;
  output zero_flag;
  output busy;
  output [31:0]data_output;
  wire [7:0]A;
  wire ITER_CONT_n_10;
  wire ITER_CONT_n_100;
  wire ITER_CONT_n_104;
  wire ITER_CONT_n_107;
  wire ITER_CONT_n_108;
  wire ITER_CONT_n_109;
  wire ITER_CONT_n_11;
  wire ITER_CONT_n_118;
  wire ITER_CONT_n_119;
  wire ITER_CONT_n_12;
  wire ITER_CONT_n_13;
  wire ITER_CONT_n_14;
  wire ITER_CONT_n_15;
  wire ITER_CONT_n_16;
  wire ITER_CONT_n_17;
  wire ITER_CONT_n_18;
  wire ITER_CONT_n_19;
  wire ITER_CONT_n_20;
  wire ITER_CONT_n_21;
  wire ITER_CONT_n_22;
  wire ITER_CONT_n_23;
  wire ITER_CONT_n_24;
  wire ITER_CONT_n_25;
  wire ITER_CONT_n_26;
  wire ITER_CONT_n_27;
  wire ITER_CONT_n_28;
  wire ITER_CONT_n_29;
  wire ITER_CONT_n_30;
  wire ITER_CONT_n_31;
  wire ITER_CONT_n_32;
  wire ITER_CONT_n_33;
  wire ITER_CONT_n_34;
  wire ITER_CONT_n_35;
  wire ITER_CONT_n_36;
  wire ITER_CONT_n_37;
  wire ITER_CONT_n_38;
  wire ITER_CONT_n_39;
  wire ITER_CONT_n_40;
  wire ITER_CONT_n_41;
  wire ITER_CONT_n_42;
  wire ITER_CONT_n_43;
  wire ITER_CONT_n_44;
  wire ITER_CONT_n_45;
  wire ITER_CONT_n_46;
  wire ITER_CONT_n_47;
  wire ITER_CONT_n_48;
  wire ITER_CONT_n_49;
  wire ITER_CONT_n_5;
  wire ITER_CONT_n_50;
  wire ITER_CONT_n_51;
  wire ITER_CONT_n_52;
  wire ITER_CONT_n_53;
  wire ITER_CONT_n_54;
  wire ITER_CONT_n_55;
  wire ITER_CONT_n_56;
  wire ITER_CONT_n_57;
  wire ITER_CONT_n_58;
  wire ITER_CONT_n_59;
  wire ITER_CONT_n_6;
  wire ITER_CONT_n_60;
  wire ITER_CONT_n_61;
  wire ITER_CONT_n_62;
  wire ITER_CONT_n_63;
  wire ITER_CONT_n_64;
  wire ITER_CONT_n_65;
  wire ITER_CONT_n_66;
  wire ITER_CONT_n_67;
  wire ITER_CONT_n_68;
  wire ITER_CONT_n_69;
  wire ITER_CONT_n_7;
  wire ITER_CONT_n_70;
  wire ITER_CONT_n_71;
  wire ITER_CONT_n_72;
  wire ITER_CONT_n_73;
  wire ITER_CONT_n_74;
  wire ITER_CONT_n_75;
  wire ITER_CONT_n_76;
  wire ITER_CONT_n_77;
  wire ITER_CONT_n_78;
  wire ITER_CONT_n_79;
  wire ITER_CONT_n_8;
  wire ITER_CONT_n_80;
  wire ITER_CONT_n_81;
  wire ITER_CONT_n_82;
  wire ITER_CONT_n_83;
  wire ITER_CONT_n_84;
  wire ITER_CONT_n_85;
  wire ITER_CONT_n_86;
  wire ITER_CONT_n_87;
  wire ITER_CONT_n_88;
  wire ITER_CONT_n_89;
  wire ITER_CONT_n_9;
  wire ITER_CONT_n_90;
  wire ITER_CONT_n_91;
  wire ITER_CONT_n_92;
  wire ITER_CONT_n_93;
  wire ITER_CONT_n_94;
  wire ITER_CONT_n_95;
  wire ITER_CONT_n_96;
  wire ITER_CONT_n_97;
  wire ITER_CONT_n_98;
  wire ITER_CONT_n_99;
  wire VAR_CONT_n_10;
  wire VAR_CONT_n_11;
  wire VAR_CONT_n_12;
  wire VAR_CONT_n_13;
  wire VAR_CONT_n_14;
  wire VAR_CONT_n_15;
  wire VAR_CONT_n_16;
  wire VAR_CONT_n_17;
  wire VAR_CONT_n_18;
  wire VAR_CONT_n_19;
  wire VAR_CONT_n_20;
  wire VAR_CONT_n_21;
  wire VAR_CONT_n_22;
  wire VAR_CONT_n_23;
  wire VAR_CONT_n_24;
  wire VAR_CONT_n_25;
  wire VAR_CONT_n_26;
  wire VAR_CONT_n_27;
  wire VAR_CONT_n_28;
  wire VAR_CONT_n_29;
  wire VAR_CONT_n_3;
  wire VAR_CONT_n_30;
  wire VAR_CONT_n_31;
  wire VAR_CONT_n_32;
  wire VAR_CONT_n_33;
  wire VAR_CONT_n_34;
  wire VAR_CONT_n_35;
  wire VAR_CONT_n_36;
  wire VAR_CONT_n_37;
  wire VAR_CONT_n_38;
  wire VAR_CONT_n_39;
  wire VAR_CONT_n_40;
  wire VAR_CONT_n_41;
  wire VAR_CONT_n_42;
  wire VAR_CONT_n_43;
  wire VAR_CONT_n_44;
  wire VAR_CONT_n_45;
  wire VAR_CONT_n_46;
  wire VAR_CONT_n_47;
  wire VAR_CONT_n_48;
  wire VAR_CONT_n_49;
  wire VAR_CONT_n_5;
  wire VAR_CONT_n_50;
  wire VAR_CONT_n_51;
  wire VAR_CONT_n_52;
  wire VAR_CONT_n_53;
  wire VAR_CONT_n_54;
  wire VAR_CONT_n_55;
  wire VAR_CONT_n_56;
  wire VAR_CONT_n_57;
  wire VAR_CONT_n_58;
  wire VAR_CONT_n_59;
  wire VAR_CONT_n_6;
  wire VAR_CONT_n_60;
  wire VAR_CONT_n_61;
  wire VAR_CONT_n_62;
  wire VAR_CONT_n_63;
  wire VAR_CONT_n_64;
  wire VAR_CONT_n_65;
  wire VAR_CONT_n_66;
  wire VAR_CONT_n_67;
  wire VAR_CONT_n_68;
  wire VAR_CONT_n_7;
  wire VAR_CONT_n_8;
  wire VAR_CONT_n_9;
  wire [7:0]Y;
  wire ack_cordic;
  wire ack_cordic_IBUF;
  wire beg_fsm_cordic;
  wire beg_fsm_cordic_IBUF;
  wire busy;
  wire busy_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]cont_iter_out;
  wire [1:0]cont_var_out;
  wire d_ff1_operation_out;
  wire [31:31]d_ff2_Y;
  wire [31:31]d_ff2_Z;
  wire d_ff3_sign_out;
  wire d_ff4_Xn_n_0;
  wire d_ff4_Xn_n_1;
  wire d_ff4_Xn_n_10;
  wire d_ff4_Xn_n_11;
  wire d_ff4_Xn_n_12;
  wire d_ff4_Xn_n_13;
  wire d_ff4_Xn_n_14;
  wire d_ff4_Xn_n_15;
  wire d_ff4_Xn_n_16;
  wire d_ff4_Xn_n_17;
  wire d_ff4_Xn_n_18;
  wire d_ff4_Xn_n_19;
  wire d_ff4_Xn_n_2;
  wire d_ff4_Xn_n_20;
  wire d_ff4_Xn_n_21;
  wire d_ff4_Xn_n_22;
  wire d_ff4_Xn_n_23;
  wire d_ff4_Xn_n_24;
  wire d_ff4_Xn_n_25;
  wire d_ff4_Xn_n_26;
  wire d_ff4_Xn_n_27;
  wire d_ff4_Xn_n_28;
  wire d_ff4_Xn_n_29;
  wire d_ff4_Xn_n_3;
  wire d_ff4_Xn_n_30;
  wire d_ff4_Xn_n_31;
  wire d_ff4_Xn_n_4;
  wire d_ff4_Xn_n_5;
  wire d_ff4_Xn_n_6;
  wire d_ff4_Xn_n_7;
  wire d_ff4_Xn_n_8;
  wire d_ff4_Xn_n_9;
  wire d_ff4_Yn_n_0;
  wire d_ff4_Yn_n_1;
  wire d_ff4_Yn_n_10;
  wire d_ff4_Yn_n_11;
  wire d_ff4_Yn_n_12;
  wire d_ff4_Yn_n_13;
  wire d_ff4_Yn_n_14;
  wire d_ff4_Yn_n_15;
  wire d_ff4_Yn_n_16;
  wire d_ff4_Yn_n_17;
  wire d_ff4_Yn_n_18;
  wire d_ff4_Yn_n_19;
  wire d_ff4_Yn_n_2;
  wire d_ff4_Yn_n_20;
  wire d_ff4_Yn_n_21;
  wire d_ff4_Yn_n_22;
  wire d_ff4_Yn_n_23;
  wire d_ff4_Yn_n_24;
  wire d_ff4_Yn_n_25;
  wire d_ff4_Yn_n_26;
  wire d_ff4_Yn_n_27;
  wire d_ff4_Yn_n_28;
  wire d_ff4_Yn_n_29;
  wire d_ff4_Yn_n_3;
  wire d_ff4_Yn_n_30;
  wire d_ff4_Yn_n_31;
  wire d_ff4_Yn_n_4;
  wire d_ff4_Yn_n_5;
  wire d_ff4_Yn_n_6;
  wire d_ff4_Yn_n_7;
  wire d_ff4_Yn_n_8;
  wire d_ff4_Yn_n_9;
  wire d_ff4_Zn_n_0;
  wire d_ff4_Zn_n_1;
  wire d_ff4_Zn_n_10;
  wire d_ff4_Zn_n_11;
  wire d_ff4_Zn_n_12;
  wire d_ff4_Zn_n_13;
  wire d_ff4_Zn_n_14;
  wire d_ff4_Zn_n_15;
  wire d_ff4_Zn_n_16;
  wire d_ff4_Zn_n_17;
  wire d_ff4_Zn_n_18;
  wire d_ff4_Zn_n_19;
  wire d_ff4_Zn_n_2;
  wire d_ff4_Zn_n_20;
  wire d_ff4_Zn_n_21;
  wire d_ff4_Zn_n_22;
  wire d_ff4_Zn_n_23;
  wire d_ff4_Zn_n_24;
  wire d_ff4_Zn_n_25;
  wire d_ff4_Zn_n_26;
  wire d_ff4_Zn_n_27;
  wire d_ff4_Zn_n_28;
  wire d_ff4_Zn_n_29;
  wire d_ff4_Zn_n_3;
  wire d_ff4_Zn_n_30;
  wire d_ff4_Zn_n_31;
  wire d_ff4_Zn_n_4;
  wire d_ff4_Zn_n_5;
  wire d_ff4_Zn_n_6;
  wire d_ff4_Zn_n_7;
  wire d_ff4_Zn_n_8;
  wire d_ff4_Zn_n_9;
  wire [31:0]data_in;
  wire [31:0]data_in_IBUF;
  wire [26:0]data_out_LUT;
  wire [31:0]data_output;
  wire [31:0]data_output_OBUF;
  wire enab_RB3;
  wire enab_cont_iter;
  wire enab_d_ff4_Yn;
  wire enab_d_ff4_Zn;
  wire enab_d_ff5_data_out;
  wire enab_d_ff_RB1;
  wire inst_CORDIC_FSM_v3_n_0;
  wire inst_CORDIC_FSM_v3_n_1;
  wire inst_CORDIC_FSM_v3_n_3;
  wire inst_CORDIC_FSM_v3_n_4;
  wire inst_CORDIC_FSM_v3_n_5;
  wire inst_CORDIC_FSM_v3_n_6;
  wire inst_CORDIC_FSM_v3_n_7;
  wire inst_CORDIC_FSM_v3_n_8;
  wire inst_CORDIC_FSM_v3_n_9;
  wire inst_FPU_PIPELINED_FPADDSUB_n_10;
  wire inst_FPU_PIPELINED_FPADDSUB_n_11;
  wire inst_FPU_PIPELINED_FPADDSUB_n_12;
  wire inst_FPU_PIPELINED_FPADDSUB_n_13;
  wire inst_FPU_PIPELINED_FPADDSUB_n_14;
  wire inst_FPU_PIPELINED_FPADDSUB_n_15;
  wire inst_FPU_PIPELINED_FPADDSUB_n_16;
  wire inst_FPU_PIPELINED_FPADDSUB_n_17;
  wire inst_FPU_PIPELINED_FPADDSUB_n_18;
  wire inst_FPU_PIPELINED_FPADDSUB_n_19;
  wire inst_FPU_PIPELINED_FPADDSUB_n_2;
  wire inst_FPU_PIPELINED_FPADDSUB_n_20;
  wire inst_FPU_PIPELINED_FPADDSUB_n_21;
  wire inst_FPU_PIPELINED_FPADDSUB_n_22;
  wire inst_FPU_PIPELINED_FPADDSUB_n_23;
  wire inst_FPU_PIPELINED_FPADDSUB_n_24;
  wire inst_FPU_PIPELINED_FPADDSUB_n_25;
  wire inst_FPU_PIPELINED_FPADDSUB_n_26;
  wire inst_FPU_PIPELINED_FPADDSUB_n_27;
  wire inst_FPU_PIPELINED_FPADDSUB_n_28;
  wire inst_FPU_PIPELINED_FPADDSUB_n_29;
  wire inst_FPU_PIPELINED_FPADDSUB_n_3;
  wire inst_FPU_PIPELINED_FPADDSUB_n_30;
  wire inst_FPU_PIPELINED_FPADDSUB_n_31;
  wire inst_FPU_PIPELINED_FPADDSUB_n_32;
  wire inst_FPU_PIPELINED_FPADDSUB_n_33;
  wire inst_FPU_PIPELINED_FPADDSUB_n_37;
  wire inst_FPU_PIPELINED_FPADDSUB_n_4;
  wire inst_FPU_PIPELINED_FPADDSUB_n_5;
  wire inst_FPU_PIPELINED_FPADDSUB_n_6;
  wire inst_FPU_PIPELINED_FPADDSUB_n_7;
  wire inst_FPU_PIPELINED_FPADDSUB_n_8;
  wire inst_FPU_PIPELINED_FPADDSUB_n_9;
  wire max_tick_iter;
  wire op_add_subt;
  wire operation;
  wire operation_IBUF;
  wire overflow_flag;
  wire overflow_flag_OBUF;
  wire [2:2]p_1_out;
  wire ready_add_subt;
  wire ready_cordic;
  wire ready_cordic_OBUF;
  wire reg_LUT_n_0;
  wire reg_LUT_n_1;
  wire reg_LUT_n_10;
  wire reg_LUT_n_11;
  wire reg_LUT_n_12;
  wire reg_LUT_n_13;
  wire reg_LUT_n_14;
  wire reg_LUT_n_15;
  wire reg_LUT_n_16;
  wire reg_LUT_n_17;
  wire reg_LUT_n_18;
  wire reg_LUT_n_19;
  wire reg_LUT_n_2;
  wire reg_LUT_n_20;
  wire reg_LUT_n_3;
  wire reg_LUT_n_4;
  wire reg_LUT_n_5;
  wire reg_LUT_n_6;
  wire reg_LUT_n_7;
  wire reg_LUT_n_8;
  wire reg_LUT_n_9;
  wire reg_Z0_n_0;
  wire reg_Z0_n_1;
  wire reg_Z0_n_10;
  wire reg_Z0_n_11;
  wire reg_Z0_n_12;
  wire reg_Z0_n_13;
  wire reg_Z0_n_14;
  wire reg_Z0_n_15;
  wire reg_Z0_n_16;
  wire reg_Z0_n_17;
  wire reg_Z0_n_18;
  wire reg_Z0_n_19;
  wire reg_Z0_n_2;
  wire reg_Z0_n_20;
  wire reg_Z0_n_21;
  wire reg_Z0_n_22;
  wire reg_Z0_n_23;
  wire reg_Z0_n_24;
  wire reg_Z0_n_25;
  wire reg_Z0_n_26;
  wire reg_Z0_n_27;
  wire reg_Z0_n_28;
  wire reg_Z0_n_29;
  wire reg_Z0_n_3;
  wire reg_Z0_n_30;
  wire reg_Z0_n_31;
  wire reg_Z0_n_4;
  wire reg_Z0_n_5;
  wire reg_Z0_n_6;
  wire reg_Z0_n_7;
  wire reg_Z0_n_8;
  wire reg_Z0_n_9;
  wire reg_region_flag_n_0;
  wire reg_region_flag_n_1;
  wire reg_region_flag_n_10;
  wire reg_region_flag_n_11;
  wire reg_region_flag_n_12;
  wire reg_region_flag_n_13;
  wire reg_region_flag_n_14;
  wire reg_region_flag_n_15;
  wire reg_region_flag_n_16;
  wire reg_region_flag_n_17;
  wire reg_region_flag_n_18;
  wire reg_region_flag_n_19;
  wire reg_region_flag_n_2;
  wire reg_region_flag_n_20;
  wire reg_region_flag_n_21;
  wire reg_region_flag_n_22;
  wire reg_region_flag_n_23;
  wire reg_region_flag_n_24;
  wire reg_region_flag_n_25;
  wire reg_region_flag_n_26;
  wire reg_region_flag_n_27;
  wire reg_region_flag_n_28;
  wire reg_region_flag_n_29;
  wire reg_region_flag_n_3;
  wire reg_region_flag_n_30;
  wire reg_region_flag_n_31;
  wire reg_region_flag_n_4;
  wire reg_region_flag_n_5;
  wire reg_region_flag_n_6;
  wire reg_region_flag_n_7;
  wire reg_region_flag_n_8;
  wire reg_region_flag_n_9;
  wire reg_shift_x_n_0;
  wire reg_shift_x_n_1;
  wire reg_shift_x_n_10;
  wire reg_shift_x_n_11;
  wire reg_shift_x_n_12;
  wire reg_shift_x_n_13;
  wire reg_shift_x_n_14;
  wire reg_shift_x_n_15;
  wire reg_shift_x_n_16;
  wire reg_shift_x_n_17;
  wire reg_shift_x_n_18;
  wire reg_shift_x_n_19;
  wire reg_shift_x_n_2;
  wire reg_shift_x_n_20;
  wire reg_shift_x_n_21;
  wire reg_shift_x_n_22;
  wire reg_shift_x_n_23;
  wire reg_shift_x_n_24;
  wire reg_shift_x_n_25;
  wire reg_shift_x_n_26;
  wire reg_shift_x_n_27;
  wire reg_shift_x_n_28;
  wire reg_shift_x_n_29;
  wire reg_shift_x_n_3;
  wire reg_shift_x_n_30;
  wire reg_shift_x_n_31;
  wire reg_shift_x_n_4;
  wire reg_shift_x_n_5;
  wire reg_shift_x_n_6;
  wire reg_shift_x_n_7;
  wire reg_shift_x_n_8;
  wire reg_shift_x_n_9;
  wire reg_shift_y_n_0;
  wire reg_shift_y_n_1;
  wire reg_shift_y_n_10;
  wire reg_shift_y_n_11;
  wire reg_shift_y_n_12;
  wire reg_shift_y_n_13;
  wire reg_shift_y_n_14;
  wire reg_shift_y_n_15;
  wire reg_shift_y_n_16;
  wire reg_shift_y_n_17;
  wire reg_shift_y_n_18;
  wire reg_shift_y_n_19;
  wire reg_shift_y_n_2;
  wire reg_shift_y_n_20;
  wire reg_shift_y_n_21;
  wire reg_shift_y_n_22;
  wire reg_shift_y_n_23;
  wire reg_shift_y_n_24;
  wire reg_shift_y_n_25;
  wire reg_shift_y_n_26;
  wire reg_shift_y_n_27;
  wire reg_shift_y_n_28;
  wire reg_shift_y_n_29;
  wire reg_shift_y_n_3;
  wire reg_shift_y_n_30;
  wire reg_shift_y_n_31;
  wire reg_shift_y_n_4;
  wire reg_shift_y_n_5;
  wire reg_shift_y_n_6;
  wire reg_shift_y_n_7;
  wire reg_shift_y_n_8;
  wire reg_shift_y_n_9;
  wire reg_val_muxX_2stage_n_0;
  wire reg_val_muxX_2stage_n_1;
  wire reg_val_muxX_2stage_n_13;
  wire reg_val_muxX_2stage_n_14;
  wire reg_val_muxX_2stage_n_15;
  wire reg_val_muxX_2stage_n_16;
  wire reg_val_muxX_2stage_n_17;
  wire reg_val_muxX_2stage_n_18;
  wire reg_val_muxX_2stage_n_19;
  wire reg_val_muxX_2stage_n_2;
  wire reg_val_muxX_2stage_n_20;
  wire reg_val_muxX_2stage_n_21;
  wire reg_val_muxX_2stage_n_22;
  wire reg_val_muxX_2stage_n_23;
  wire reg_val_muxX_2stage_n_24;
  wire reg_val_muxX_2stage_n_25;
  wire reg_val_muxX_2stage_n_26;
  wire reg_val_muxX_2stage_n_27;
  wire reg_val_muxX_2stage_n_28;
  wire reg_val_muxX_2stage_n_29;
  wire reg_val_muxX_2stage_n_3;
  wire reg_val_muxX_2stage_n_30;
  wire reg_val_muxX_2stage_n_31;
  wire reg_val_muxX_2stage_n_32;
  wire reg_val_muxX_2stage_n_33;
  wire reg_val_muxX_2stage_n_34;
  wire reg_val_muxX_2stage_n_35;
  wire reg_val_muxX_2stage_n_36;
  wire reg_val_muxX_2stage_n_37;
  wire reg_val_muxX_2stage_n_38;
  wire reg_val_muxX_2stage_n_39;
  wire reg_val_muxX_2stage_n_4;
  wire reg_val_muxY_2stage_n_1;
  wire reg_val_muxY_2stage_n_10;
  wire reg_val_muxY_2stage_n_11;
  wire reg_val_muxY_2stage_n_12;
  wire reg_val_muxY_2stage_n_13;
  wire reg_val_muxY_2stage_n_14;
  wire reg_val_muxY_2stage_n_15;
  wire reg_val_muxY_2stage_n_16;
  wire reg_val_muxY_2stage_n_17;
  wire reg_val_muxY_2stage_n_18;
  wire reg_val_muxY_2stage_n_19;
  wire reg_val_muxY_2stage_n_2;
  wire reg_val_muxY_2stage_n_20;
  wire reg_val_muxY_2stage_n_21;
  wire reg_val_muxY_2stage_n_22;
  wire reg_val_muxY_2stage_n_23;
  wire reg_val_muxY_2stage_n_24;
  wire reg_val_muxY_2stage_n_25;
  wire reg_val_muxY_2stage_n_26;
  wire reg_val_muxY_2stage_n_27;
  wire reg_val_muxY_2stage_n_28;
  wire reg_val_muxY_2stage_n_29;
  wire reg_val_muxY_2stage_n_3;
  wire reg_val_muxY_2stage_n_30;
  wire reg_val_muxY_2stage_n_31;
  wire reg_val_muxY_2stage_n_32;
  wire reg_val_muxY_2stage_n_33;
  wire reg_val_muxY_2stage_n_34;
  wire reg_val_muxY_2stage_n_35;
  wire reg_val_muxY_2stage_n_36;
  wire reg_val_muxY_2stage_n_37;
  wire reg_val_muxY_2stage_n_38;
  wire reg_val_muxY_2stage_n_39;
  wire reg_val_muxY_2stage_n_4;
  wire reg_val_muxY_2stage_n_5;
  wire reg_val_muxY_2stage_n_6;
  wire reg_val_muxY_2stage_n_7;
  wire reg_val_muxY_2stage_n_8;
  wire reg_val_muxY_2stage_n_9;
  wire reg_val_muxZ_2stage_n_1;
  wire reg_val_muxZ_2stage_n_10;
  wire reg_val_muxZ_2stage_n_11;
  wire reg_val_muxZ_2stage_n_12;
  wire reg_val_muxZ_2stage_n_13;
  wire reg_val_muxZ_2stage_n_14;
  wire reg_val_muxZ_2stage_n_15;
  wire reg_val_muxZ_2stage_n_16;
  wire reg_val_muxZ_2stage_n_17;
  wire reg_val_muxZ_2stage_n_18;
  wire reg_val_muxZ_2stage_n_19;
  wire reg_val_muxZ_2stage_n_2;
  wire reg_val_muxZ_2stage_n_20;
  wire reg_val_muxZ_2stage_n_21;
  wire reg_val_muxZ_2stage_n_22;
  wire reg_val_muxZ_2stage_n_23;
  wire reg_val_muxZ_2stage_n_24;
  wire reg_val_muxZ_2stage_n_25;
  wire reg_val_muxZ_2stage_n_26;
  wire reg_val_muxZ_2stage_n_27;
  wire reg_val_muxZ_2stage_n_28;
  wire reg_val_muxZ_2stage_n_29;
  wire reg_val_muxZ_2stage_n_3;
  wire reg_val_muxZ_2stage_n_30;
  wire reg_val_muxZ_2stage_n_31;
  wire reg_val_muxZ_2stage_n_4;
  wire reg_val_muxZ_2stage_n_5;
  wire reg_val_muxZ_2stage_n_6;
  wire reg_val_muxZ_2stage_n_7;
  wire reg_val_muxZ_2stage_n_8;
  wire reg_val_muxZ_2stage_n_9;
  wire reset_reg_cordic;
  wire rst;
  wire rst0;
  wire rst_IBUF;
  wire [1:0]shift_region_flag;
  wire [1:0]shift_region_flag_IBUF;
  wire underflow_flag;
  wire underflow_flag_OBUF;
  wire zero_flag;
  wire zero_flag_OBUF;
initial begin
 $sdf_annotate("testbench_CORDIC_Arch3_time_synth.sdf",,,,"tool_control");
end
  Up_counter ITER_CONT
       (.CLK(clk_IBUF_BUFG),
        .D({ITER_CONT_n_5,ITER_CONT_n_6,ITER_CONT_n_7,ITER_CONT_n_8,ITER_CONT_n_9,ITER_CONT_n_10,ITER_CONT_n_11,ITER_CONT_n_12,ITER_CONT_n_13,ITER_CONT_n_14,ITER_CONT_n_15,ITER_CONT_n_16,ITER_CONT_n_17,ITER_CONT_n_18,ITER_CONT_n_19,ITER_CONT_n_20,ITER_CONT_n_21,ITER_CONT_n_22,ITER_CONT_n_23,ITER_CONT_n_24,ITER_CONT_n_25,ITER_CONT_n_26,ITER_CONT_n_27,ITER_CONT_n_28,ITER_CONT_n_29,ITER_CONT_n_30,ITER_CONT_n_31,ITER_CONT_n_32,ITER_CONT_n_33,ITER_CONT_n_34,ITER_CONT_n_35,ITER_CONT_n_36}),
        .E(enab_cont_iter),
        .Q(cont_iter_out),
        .\Q_reg[26] ({data_out_LUT[26:24],ITER_CONT_n_104,data_out_LUT[22:21],ITER_CONT_n_107,ITER_CONT_n_108,ITER_CONT_n_109,data_out_LUT[14],data_out_LUT[12:9],p_1_out,data_out_LUT[6],data_out_LUT[4],ITER_CONT_n_118,ITER_CONT_n_119,data_out_LUT[0]}),
        .\Q_reg[31] ({ITER_CONT_n_37,ITER_CONT_n_38,ITER_CONT_n_39,ITER_CONT_n_40,ITER_CONT_n_41,ITER_CONT_n_42,ITER_CONT_n_43,ITER_CONT_n_44,ITER_CONT_n_45,ITER_CONT_n_46,ITER_CONT_n_47,ITER_CONT_n_48,ITER_CONT_n_49,ITER_CONT_n_50,ITER_CONT_n_51,ITER_CONT_n_52,ITER_CONT_n_53,ITER_CONT_n_54,ITER_CONT_n_55,ITER_CONT_n_56,ITER_CONT_n_57,ITER_CONT_n_58,ITER_CONT_n_59,ITER_CONT_n_60,ITER_CONT_n_61,ITER_CONT_n_62,ITER_CONT_n_63,ITER_CONT_n_64,ITER_CONT_n_65,ITER_CONT_n_66,ITER_CONT_n_67,ITER_CONT_n_68}),
        .\Q_reg[31]_0 ({ITER_CONT_n_69,ITER_CONT_n_70,ITER_CONT_n_71,ITER_CONT_n_72,ITER_CONT_n_73,ITER_CONT_n_74,ITER_CONT_n_75,ITER_CONT_n_76,ITER_CONT_n_77,ITER_CONT_n_78,ITER_CONT_n_79,ITER_CONT_n_80,ITER_CONT_n_81,ITER_CONT_n_82,ITER_CONT_n_83,ITER_CONT_n_84,ITER_CONT_n_85,ITER_CONT_n_86,ITER_CONT_n_87,ITER_CONT_n_88,ITER_CONT_n_89,ITER_CONT_n_90,ITER_CONT_n_91,ITER_CONT_n_92,ITER_CONT_n_93,ITER_CONT_n_94,ITER_CONT_n_95,ITER_CONT_n_96,ITER_CONT_n_97,ITER_CONT_n_98,ITER_CONT_n_99,ITER_CONT_n_100}),
        .\Q_reg[31]_1 ({d_ff4_Zn_n_0,d_ff4_Zn_n_1,d_ff4_Zn_n_2,d_ff4_Zn_n_3,d_ff4_Zn_n_4,d_ff4_Zn_n_5,d_ff4_Zn_n_6,d_ff4_Zn_n_7,d_ff4_Zn_n_8,d_ff4_Zn_n_9,d_ff4_Zn_n_10,d_ff4_Zn_n_11,d_ff4_Zn_n_12,d_ff4_Zn_n_13,d_ff4_Zn_n_14,d_ff4_Zn_n_15,d_ff4_Zn_n_16,d_ff4_Zn_n_17,d_ff4_Zn_n_18,d_ff4_Zn_n_19,d_ff4_Zn_n_20,d_ff4_Zn_n_21,d_ff4_Zn_n_22,d_ff4_Zn_n_23,d_ff4_Zn_n_24,d_ff4_Zn_n_25,d_ff4_Zn_n_26,d_ff4_Zn_n_27,d_ff4_Zn_n_28,d_ff4_Zn_n_29,d_ff4_Zn_n_30,d_ff4_Zn_n_31}),
        .\Q_reg[31]_2 ({reg_Z0_n_0,reg_Z0_n_1,reg_Z0_n_2,reg_Z0_n_3,reg_Z0_n_4,reg_Z0_n_5,reg_Z0_n_6,reg_Z0_n_7,reg_Z0_n_8,reg_Z0_n_9,reg_Z0_n_10,reg_Z0_n_11,reg_Z0_n_12,reg_Z0_n_13,reg_Z0_n_14,reg_Z0_n_15,reg_Z0_n_16,reg_Z0_n_17,reg_Z0_n_18,reg_Z0_n_19,reg_Z0_n_20,reg_Z0_n_21,reg_Z0_n_22,reg_Z0_n_23,reg_Z0_n_24,reg_Z0_n_25,reg_Z0_n_26,reg_Z0_n_27,reg_Z0_n_28,reg_Z0_n_29,reg_Z0_n_30,reg_Z0_n_31}),
        .\Q_reg[31]_3 ({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_13,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_16,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_20,d_ff4_Xn_n_21,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_27,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30,d_ff4_Xn_n_31}),
        .\Q_reg[31]_4 ({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}),
        .SR(reset_reg_cordic),
        .max_tick_iter(max_tick_iter));
  Up_counter__parameterized0 VAR_CONT
       (.CLK(clk_IBUF_BUFG),
        .D({VAR_CONT_n_5,VAR_CONT_n_6,VAR_CONT_n_7,VAR_CONT_n_8,VAR_CONT_n_9,VAR_CONT_n_10,VAR_CONT_n_11,VAR_CONT_n_12,VAR_CONT_n_13,VAR_CONT_n_14,VAR_CONT_n_15,VAR_CONT_n_16,VAR_CONT_n_17,VAR_CONT_n_18,VAR_CONT_n_19,VAR_CONT_n_20,VAR_CONT_n_21,VAR_CONT_n_22,VAR_CONT_n_23,VAR_CONT_n_24,VAR_CONT_n_25,VAR_CONT_n_26,VAR_CONT_n_27,VAR_CONT_n_28,VAR_CONT_n_29,VAR_CONT_n_30,VAR_CONT_n_31,VAR_CONT_n_32,VAR_CONT_n_33,VAR_CONT_n_34,VAR_CONT_n_35,VAR_CONT_n_36}),
        .E(enab_d_ff4_Zn),
        .Q({reg_shift_y_n_0,reg_shift_y_n_1,reg_shift_y_n_2,reg_shift_y_n_3,reg_shift_y_n_4,reg_shift_y_n_5,reg_shift_y_n_6,reg_shift_y_n_7,reg_shift_y_n_8,reg_shift_y_n_9,reg_shift_y_n_10,reg_shift_y_n_11,reg_shift_y_n_12,reg_shift_y_n_13,reg_shift_y_n_14,reg_shift_y_n_15,reg_shift_y_n_16,reg_shift_y_n_17,reg_shift_y_n_18,reg_shift_y_n_19,reg_shift_y_n_20,reg_shift_y_n_21,reg_shift_y_n_22,reg_shift_y_n_23,reg_shift_y_n_24,reg_shift_y_n_25,reg_shift_y_n_26,reg_shift_y_n_27,reg_shift_y_n_28,reg_shift_y_n_29,reg_shift_y_n_30,reg_shift_y_n_31}),
        .\Q_reg[29] ({reg_LUT_n_0,reg_LUT_n_1,reg_LUT_n_2,reg_LUT_n_3,reg_LUT_n_4,reg_LUT_n_5,reg_LUT_n_6,reg_LUT_n_7,reg_LUT_n_8,reg_LUT_n_9,reg_LUT_n_10,reg_LUT_n_11,reg_LUT_n_12,reg_LUT_n_13,reg_LUT_n_14,reg_LUT_n_15,reg_LUT_n_16,reg_LUT_n_17,reg_LUT_n_18,reg_LUT_n_19,reg_LUT_n_20}),
        .\Q_reg[31] (VAR_CONT_n_3),
        .\Q_reg[31]_0 (enab_d_ff4_Yn),
        .\Q_reg[31]_1 ({VAR_CONT_n_37,VAR_CONT_n_38,VAR_CONT_n_39,VAR_CONT_n_40,VAR_CONT_n_41,VAR_CONT_n_42,VAR_CONT_n_43,VAR_CONT_n_44,VAR_CONT_n_45,VAR_CONT_n_46,VAR_CONT_n_47,VAR_CONT_n_48,VAR_CONT_n_49,VAR_CONT_n_50,VAR_CONT_n_51,VAR_CONT_n_52,VAR_CONT_n_53,VAR_CONT_n_54,VAR_CONT_n_55,VAR_CONT_n_56,VAR_CONT_n_57,VAR_CONT_n_58,VAR_CONT_n_59,VAR_CONT_n_60,VAR_CONT_n_61,VAR_CONT_n_62,VAR_CONT_n_63,VAR_CONT_n_64,VAR_CONT_n_65,VAR_CONT_n_66,VAR_CONT_n_67,VAR_CONT_n_68}),
        .\Q_reg[31]_2 ({reg_shift_x_n_0,reg_shift_x_n_1,reg_shift_x_n_2,reg_shift_x_n_3,reg_shift_x_n_4,reg_shift_x_n_5,reg_shift_x_n_6,reg_shift_x_n_7,reg_shift_x_n_8,reg_shift_x_n_9,reg_shift_x_n_10,reg_shift_x_n_11,reg_shift_x_n_12,reg_shift_x_n_13,reg_shift_x_n_14,reg_shift_x_n_15,reg_shift_x_n_16,reg_shift_x_n_17,reg_shift_x_n_18,reg_shift_x_n_19,reg_shift_x_n_20,reg_shift_x_n_21,reg_shift_x_n_22,reg_shift_x_n_23,reg_shift_x_n_24,reg_shift_x_n_25,reg_shift_x_n_26,reg_shift_x_n_27,reg_shift_x_n_28,reg_shift_x_n_29,reg_shift_x_n_30,reg_shift_x_n_31}),
        .\Q_reg[31]_3 ({d_ff2_Z,reg_val_muxZ_2stage_n_1,reg_val_muxZ_2stage_n_2,reg_val_muxZ_2stage_n_3,reg_val_muxZ_2stage_n_4,reg_val_muxZ_2stage_n_5,reg_val_muxZ_2stage_n_6,reg_val_muxZ_2stage_n_7,reg_val_muxZ_2stage_n_8,reg_val_muxZ_2stage_n_9,reg_val_muxZ_2stage_n_10,reg_val_muxZ_2stage_n_11,reg_val_muxZ_2stage_n_12,reg_val_muxZ_2stage_n_13,reg_val_muxZ_2stage_n_14,reg_val_muxZ_2stage_n_15,reg_val_muxZ_2stage_n_16,reg_val_muxZ_2stage_n_17,reg_val_muxZ_2stage_n_18,reg_val_muxZ_2stage_n_19,reg_val_muxZ_2stage_n_20,reg_val_muxZ_2stage_n_21,reg_val_muxZ_2stage_n_22,reg_val_muxZ_2stage_n_23,reg_val_muxZ_2stage_n_24,reg_val_muxZ_2stage_n_25,reg_val_muxZ_2stage_n_26,reg_val_muxZ_2stage_n_27,reg_val_muxZ_2stage_n_28,reg_val_muxZ_2stage_n_29,reg_val_muxZ_2stage_n_30,reg_val_muxZ_2stage_n_31}),
        .\Q_reg[31]_4 ({reg_val_muxX_2stage_n_4,A,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .\Q_reg[31]_5 ({d_ff2_Y,reg_val_muxY_2stage_n_1,reg_val_muxY_2stage_n_2,reg_val_muxY_2stage_n_3,reg_val_muxY_2stage_n_4,reg_val_muxY_2stage_n_5,reg_val_muxY_2stage_n_6,reg_val_muxY_2stage_n_7,reg_val_muxY_2stage_n_8,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31}),
        .cont_var_out(cont_var_out),
        .d_ff3_sign_out(d_ff3_sign_out),
        .op_add_subt(op_add_subt),
        .out({inst_CORDIC_FSM_v3_n_4,inst_CORDIC_FSM_v3_n_6}),
        .ready_add_subt(ready_add_subt),
        .rst_IBUF(rst_IBUF));
  IBUF ack_cordic_IBUF_inst
       (.I(ack_cordic),
        .O(ack_cordic_IBUF));
  IBUF beg_fsm_cordic_IBUF_inst
       (.I(beg_fsm_cordic),
        .O(beg_fsm_cordic_IBUF));
  OBUF busy_OBUF_inst
       (.I(busy_OBUF),
        .O(busy));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  d_ff_en__parameterized8 d_ff4_Xn
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .E(VAR_CONT_n_3),
        .Q({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_13,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_16,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_20,d_ff4_Xn_n_21,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_27,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30,d_ff4_Xn_n_31}),
        .\Q_reg[31]_0 ({inst_FPU_PIPELINED_FPADDSUB_n_2,inst_FPU_PIPELINED_FPADDSUB_n_3,inst_FPU_PIPELINED_FPADDSUB_n_4,inst_FPU_PIPELINED_FPADDSUB_n_5,inst_FPU_PIPELINED_FPADDSUB_n_6,inst_FPU_PIPELINED_FPADDSUB_n_7,inst_FPU_PIPELINED_FPADDSUB_n_8,inst_FPU_PIPELINED_FPADDSUB_n_9,inst_FPU_PIPELINED_FPADDSUB_n_10,inst_FPU_PIPELINED_FPADDSUB_n_11,inst_FPU_PIPELINED_FPADDSUB_n_12,inst_FPU_PIPELINED_FPADDSUB_n_13,inst_FPU_PIPELINED_FPADDSUB_n_14,inst_FPU_PIPELINED_FPADDSUB_n_15,inst_FPU_PIPELINED_FPADDSUB_n_16,inst_FPU_PIPELINED_FPADDSUB_n_17,inst_FPU_PIPELINED_FPADDSUB_n_18,inst_FPU_PIPELINED_FPADDSUB_n_19,inst_FPU_PIPELINED_FPADDSUB_n_20,inst_FPU_PIPELINED_FPADDSUB_n_21,inst_FPU_PIPELINED_FPADDSUB_n_22,inst_FPU_PIPELINED_FPADDSUB_n_23,inst_FPU_PIPELINED_FPADDSUB_n_24,inst_FPU_PIPELINED_FPADDSUB_n_25,inst_FPU_PIPELINED_FPADDSUB_n_26,inst_FPU_PIPELINED_FPADDSUB_n_27,inst_FPU_PIPELINED_FPADDSUB_n_28,inst_FPU_PIPELINED_FPADDSUB_n_29,inst_FPU_PIPELINED_FPADDSUB_n_30,inst_FPU_PIPELINED_FPADDSUB_n_31,inst_FPU_PIPELINED_FPADDSUB_n_32,inst_FPU_PIPELINED_FPADDSUB_n_33}));
  d_ff_en__parameterized9 d_ff4_Yn
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .E(enab_d_ff4_Yn),
        .Q({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}),
        .\Q_reg[31]_0 ({inst_FPU_PIPELINED_FPADDSUB_n_2,inst_FPU_PIPELINED_FPADDSUB_n_3,inst_FPU_PIPELINED_FPADDSUB_n_4,inst_FPU_PIPELINED_FPADDSUB_n_5,inst_FPU_PIPELINED_FPADDSUB_n_6,inst_FPU_PIPELINED_FPADDSUB_n_7,inst_FPU_PIPELINED_FPADDSUB_n_8,inst_FPU_PIPELINED_FPADDSUB_n_9,inst_FPU_PIPELINED_FPADDSUB_n_10,inst_FPU_PIPELINED_FPADDSUB_n_11,inst_FPU_PIPELINED_FPADDSUB_n_12,inst_FPU_PIPELINED_FPADDSUB_n_13,inst_FPU_PIPELINED_FPADDSUB_n_14,inst_FPU_PIPELINED_FPADDSUB_n_15,inst_FPU_PIPELINED_FPADDSUB_n_16,inst_FPU_PIPELINED_FPADDSUB_n_17,inst_FPU_PIPELINED_FPADDSUB_n_18,inst_FPU_PIPELINED_FPADDSUB_n_19,inst_FPU_PIPELINED_FPADDSUB_n_20,inst_FPU_PIPELINED_FPADDSUB_n_21,inst_FPU_PIPELINED_FPADDSUB_n_22,inst_FPU_PIPELINED_FPADDSUB_n_23,inst_FPU_PIPELINED_FPADDSUB_n_24,inst_FPU_PIPELINED_FPADDSUB_n_25,inst_FPU_PIPELINED_FPADDSUB_n_26,inst_FPU_PIPELINED_FPADDSUB_n_27,inst_FPU_PIPELINED_FPADDSUB_n_28,inst_FPU_PIPELINED_FPADDSUB_n_29,inst_FPU_PIPELINED_FPADDSUB_n_30,inst_FPU_PIPELINED_FPADDSUB_n_31,inst_FPU_PIPELINED_FPADDSUB_n_32,inst_FPU_PIPELINED_FPADDSUB_n_33}));
  d_ff_en__parameterized10 d_ff4_Zn
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .E(enab_d_ff4_Zn),
        .Q({d_ff4_Zn_n_0,d_ff4_Zn_n_1,d_ff4_Zn_n_2,d_ff4_Zn_n_3,d_ff4_Zn_n_4,d_ff4_Zn_n_5,d_ff4_Zn_n_6,d_ff4_Zn_n_7,d_ff4_Zn_n_8,d_ff4_Zn_n_9,d_ff4_Zn_n_10,d_ff4_Zn_n_11,d_ff4_Zn_n_12,d_ff4_Zn_n_13,d_ff4_Zn_n_14,d_ff4_Zn_n_15,d_ff4_Zn_n_16,d_ff4_Zn_n_17,d_ff4_Zn_n_18,d_ff4_Zn_n_19,d_ff4_Zn_n_20,d_ff4_Zn_n_21,d_ff4_Zn_n_22,d_ff4_Zn_n_23,d_ff4_Zn_n_24,d_ff4_Zn_n_25,d_ff4_Zn_n_26,d_ff4_Zn_n_27,d_ff4_Zn_n_28,d_ff4_Zn_n_29,d_ff4_Zn_n_30,d_ff4_Zn_n_31}),
        .\Q_reg[31]_0 ({inst_FPU_PIPELINED_FPADDSUB_n_2,inst_FPU_PIPELINED_FPADDSUB_n_3,inst_FPU_PIPELINED_FPADDSUB_n_4,inst_FPU_PIPELINED_FPADDSUB_n_5,inst_FPU_PIPELINED_FPADDSUB_n_6,inst_FPU_PIPELINED_FPADDSUB_n_7,inst_FPU_PIPELINED_FPADDSUB_n_8,inst_FPU_PIPELINED_FPADDSUB_n_9,inst_FPU_PIPELINED_FPADDSUB_n_10,inst_FPU_PIPELINED_FPADDSUB_n_11,inst_FPU_PIPELINED_FPADDSUB_n_12,inst_FPU_PIPELINED_FPADDSUB_n_13,inst_FPU_PIPELINED_FPADDSUB_n_14,inst_FPU_PIPELINED_FPADDSUB_n_15,inst_FPU_PIPELINED_FPADDSUB_n_16,inst_FPU_PIPELINED_FPADDSUB_n_17,inst_FPU_PIPELINED_FPADDSUB_n_18,inst_FPU_PIPELINED_FPADDSUB_n_19,inst_FPU_PIPELINED_FPADDSUB_n_20,inst_FPU_PIPELINED_FPADDSUB_n_21,inst_FPU_PIPELINED_FPADDSUB_n_22,inst_FPU_PIPELINED_FPADDSUB_n_23,inst_FPU_PIPELINED_FPADDSUB_n_24,inst_FPU_PIPELINED_FPADDSUB_n_25,inst_FPU_PIPELINED_FPADDSUB_n_26,inst_FPU_PIPELINED_FPADDSUB_n_27,inst_FPU_PIPELINED_FPADDSUB_n_28,inst_FPU_PIPELINED_FPADDSUB_n_29,inst_FPU_PIPELINED_FPADDSUB_n_30,inst_FPU_PIPELINED_FPADDSUB_n_31,inst_FPU_PIPELINED_FPADDSUB_n_32,inst_FPU_PIPELINED_FPADDSUB_n_33}));
  d_ff_en__parameterized11 d_ff5_data_out
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .D({reg_region_flag_n_0,reg_region_flag_n_1,reg_region_flag_n_2,reg_region_flag_n_3,reg_region_flag_n_4,reg_region_flag_n_5,reg_region_flag_n_6,reg_region_flag_n_7,reg_region_flag_n_8,reg_region_flag_n_9,reg_region_flag_n_10,reg_region_flag_n_11,reg_region_flag_n_12,reg_region_flag_n_13,reg_region_flag_n_14,reg_region_flag_n_15,reg_region_flag_n_16,reg_region_flag_n_17,reg_region_flag_n_18,reg_region_flag_n_19,reg_region_flag_n_20,reg_region_flag_n_21,reg_region_flag_n_22,reg_region_flag_n_23,reg_region_flag_n_24,reg_region_flag_n_25,reg_region_flag_n_26,reg_region_flag_n_27,reg_region_flag_n_28,reg_region_flag_n_29,reg_region_flag_n_30,reg_region_flag_n_31}),
        .E(enab_d_ff5_data_out),
        .Q(data_output_OBUF));
  IBUF \data_in_IBUF[0]_inst
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[10]_inst
       (.I(data_in[10]),
        .O(data_in_IBUF[10]));
  IBUF \data_in_IBUF[11]_inst
       (.I(data_in[11]),
        .O(data_in_IBUF[11]));
  IBUF \data_in_IBUF[12]_inst
       (.I(data_in[12]),
        .O(data_in_IBUF[12]));
  IBUF \data_in_IBUF[13]_inst
       (.I(data_in[13]),
        .O(data_in_IBUF[13]));
  IBUF \data_in_IBUF[14]_inst
       (.I(data_in[14]),
        .O(data_in_IBUF[14]));
  IBUF \data_in_IBUF[15]_inst
       (.I(data_in[15]),
        .O(data_in_IBUF[15]));
  IBUF \data_in_IBUF[16]_inst
       (.I(data_in[16]),
        .O(data_in_IBUF[16]));
  IBUF \data_in_IBUF[17]_inst
       (.I(data_in[17]),
        .O(data_in_IBUF[17]));
  IBUF \data_in_IBUF[18]_inst
       (.I(data_in[18]),
        .O(data_in_IBUF[18]));
  IBUF \data_in_IBUF[19]_inst
       (.I(data_in[19]),
        .O(data_in_IBUF[19]));
  IBUF \data_in_IBUF[1]_inst
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[20]_inst
       (.I(data_in[20]),
        .O(data_in_IBUF[20]));
  IBUF \data_in_IBUF[21]_inst
       (.I(data_in[21]),
        .O(data_in_IBUF[21]));
  IBUF \data_in_IBUF[22]_inst
       (.I(data_in[22]),
        .O(data_in_IBUF[22]));
  IBUF \data_in_IBUF[23]_inst
       (.I(data_in[23]),
        .O(data_in_IBUF[23]));
  IBUF \data_in_IBUF[24]_inst
       (.I(data_in[24]),
        .O(data_in_IBUF[24]));
  IBUF \data_in_IBUF[25]_inst
       (.I(data_in[25]),
        .O(data_in_IBUF[25]));
  IBUF \data_in_IBUF[26]_inst
       (.I(data_in[26]),
        .O(data_in_IBUF[26]));
  IBUF \data_in_IBUF[27]_inst
       (.I(data_in[27]),
        .O(data_in_IBUF[27]));
  IBUF \data_in_IBUF[28]_inst
       (.I(data_in[28]),
        .O(data_in_IBUF[28]));
  IBUF \data_in_IBUF[29]_inst
       (.I(data_in[29]),
        .O(data_in_IBUF[29]));
  IBUF \data_in_IBUF[2]_inst
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[30]_inst
       (.I(data_in[30]),
        .O(data_in_IBUF[30]));
  IBUF \data_in_IBUF[31]_inst
       (.I(data_in[31]),
        .O(data_in_IBUF[31]));
  IBUF \data_in_IBUF[3]_inst
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  IBUF \data_in_IBUF[8]_inst
       (.I(data_in[8]),
        .O(data_in_IBUF[8]));
  IBUF \data_in_IBUF[9]_inst
       (.I(data_in[9]),
        .O(data_in_IBUF[9]));
  OBUF \data_output_OBUF[0]_inst
       (.I(data_output_OBUF[0]),
        .O(data_output[0]));
  OBUF \data_output_OBUF[10]_inst
       (.I(data_output_OBUF[10]),
        .O(data_output[10]));
  OBUF \data_output_OBUF[11]_inst
       (.I(data_output_OBUF[11]),
        .O(data_output[11]));
  OBUF \data_output_OBUF[12]_inst
       (.I(data_output_OBUF[12]),
        .O(data_output[12]));
  OBUF \data_output_OBUF[13]_inst
       (.I(data_output_OBUF[13]),
        .O(data_output[13]));
  OBUF \data_output_OBUF[14]_inst
       (.I(data_output_OBUF[14]),
        .O(data_output[14]));
  OBUF \data_output_OBUF[15]_inst
       (.I(data_output_OBUF[15]),
        .O(data_output[15]));
  OBUF \data_output_OBUF[16]_inst
       (.I(data_output_OBUF[16]),
        .O(data_output[16]));
  OBUF \data_output_OBUF[17]_inst
       (.I(data_output_OBUF[17]),
        .O(data_output[17]));
  OBUF \data_output_OBUF[18]_inst
       (.I(data_output_OBUF[18]),
        .O(data_output[18]));
  OBUF \data_output_OBUF[19]_inst
       (.I(data_output_OBUF[19]),
        .O(data_output[19]));
  OBUF \data_output_OBUF[1]_inst
       (.I(data_output_OBUF[1]),
        .O(data_output[1]));
  OBUF \data_output_OBUF[20]_inst
       (.I(data_output_OBUF[20]),
        .O(data_output[20]));
  OBUF \data_output_OBUF[21]_inst
       (.I(data_output_OBUF[21]),
        .O(data_output[21]));
  OBUF \data_output_OBUF[22]_inst
       (.I(data_output_OBUF[22]),
        .O(data_output[22]));
  OBUF \data_output_OBUF[23]_inst
       (.I(data_output_OBUF[23]),
        .O(data_output[23]));
  OBUF \data_output_OBUF[24]_inst
       (.I(data_output_OBUF[24]),
        .O(data_output[24]));
  OBUF \data_output_OBUF[25]_inst
       (.I(data_output_OBUF[25]),
        .O(data_output[25]));
  OBUF \data_output_OBUF[26]_inst
       (.I(data_output_OBUF[26]),
        .O(data_output[26]));
  OBUF \data_output_OBUF[27]_inst
       (.I(data_output_OBUF[27]),
        .O(data_output[27]));
  OBUF \data_output_OBUF[28]_inst
       (.I(data_output_OBUF[28]),
        .O(data_output[28]));
  OBUF \data_output_OBUF[29]_inst
       (.I(data_output_OBUF[29]),
        .O(data_output[29]));
  OBUF \data_output_OBUF[2]_inst
       (.I(data_output_OBUF[2]),
        .O(data_output[2]));
  OBUF \data_output_OBUF[30]_inst
       (.I(data_output_OBUF[30]),
        .O(data_output[30]));
  OBUF \data_output_OBUF[31]_inst
       (.I(data_output_OBUF[31]),
        .O(data_output[31]));
  OBUF \data_output_OBUF[3]_inst
       (.I(data_output_OBUF[3]),
        .O(data_output[3]));
  OBUF \data_output_OBUF[4]_inst
       (.I(data_output_OBUF[4]),
        .O(data_output[4]));
  OBUF \data_output_OBUF[5]_inst
       (.I(data_output_OBUF[5]),
        .O(data_output[5]));
  OBUF \data_output_OBUF[6]_inst
       (.I(data_output_OBUF[6]),
        .O(data_output[6]));
  OBUF \data_output_OBUF[7]_inst
       (.I(data_output_OBUF[7]),
        .O(data_output[7]));
  OBUF \data_output_OBUF[8]_inst
       (.I(data_output_OBUF[8]),
        .O(data_output[8]));
  OBUF \data_output_OBUF[9]_inst
       (.I(data_output_OBUF[9]),
        .O(data_output[9]));
  CORDIC_FSM_v3 inst_CORDIC_FSM_v3
       (.AR({inst_CORDIC_FSM_v3_n_0,inst_CORDIC_FSM_v3_n_1,rst0,inst_CORDIC_FSM_v3_n_3}),
        .CLK(clk_IBUF_BUFG),
        .E(inst_CORDIC_FSM_v3_n_8),
        .\FSM_sequential_state_reg_reg[0]_0 (inst_CORDIC_FSM_v3_n_7),
        .\FSM_sequential_state_reg_reg[2]_0 (inst_FPU_PIPELINED_FPADDSUB_n_37),
        .\Q_reg[0] (enab_RB3),
        .\Q_reg[1] (enab_d_ff_RB1),
        .\Q_reg[31] (inst_CORDIC_FSM_v3_n_9),
        .\Q_reg[31]_0 (enab_d_ff5_data_out),
        .\Q_reg[31]_1 (reset_reg_cordic),
        .ack_cordic_IBUF(ack_cordic_IBUF),
        .beg_fsm_cordic_IBUF(beg_fsm_cordic_IBUF),
        .cont_var_out(cont_var_out),
        .max_tick_iter(max_tick_iter),
        .out({inst_CORDIC_FSM_v3_n_4,inst_CORDIC_FSM_v3_n_5,inst_CORDIC_FSM_v3_n_6}),
        .ready_cordic_OBUF(ready_cordic_OBUF),
        .rst_IBUF(rst_IBUF),
        .\temp_reg[0] (enab_cont_iter),
        .\temp_reg[1] (enab_d_ff4_Zn));
  FPU_PIPELINED_FPADDSUB inst_FPU_PIPELINED_FPADDSUB
       (.AR({inst_CORDIC_FSM_v3_n_0,inst_CORDIC_FSM_v3_n_1,rst0,inst_CORDIC_FSM_v3_n_3}),
        .CLK(clk_IBUF_BUFG),
        .D({VAR_CONT_n_5,VAR_CONT_n_6,VAR_CONT_n_7,VAR_CONT_n_8,VAR_CONT_n_9,VAR_CONT_n_10,VAR_CONT_n_11,VAR_CONT_n_12,VAR_CONT_n_13,VAR_CONT_n_14,VAR_CONT_n_15,VAR_CONT_n_16,VAR_CONT_n_17,VAR_CONT_n_18,VAR_CONT_n_19,VAR_CONT_n_20,VAR_CONT_n_21,VAR_CONT_n_22,VAR_CONT_n_23,VAR_CONT_n_24,VAR_CONT_n_25,VAR_CONT_n_26,VAR_CONT_n_27,VAR_CONT_n_28,VAR_CONT_n_29,VAR_CONT_n_30,VAR_CONT_n_31,VAR_CONT_n_32,VAR_CONT_n_33,VAR_CONT_n_34,VAR_CONT_n_35,VAR_CONT_n_36}),
        .E(inst_CORDIC_FSM_v3_n_9),
        .\FSM_sequential_state_reg_reg[1] (inst_CORDIC_FSM_v3_n_7),
        .\FSM_sequential_state_reg_reg[2] ({inst_CORDIC_FSM_v3_n_4,inst_CORDIC_FSM_v3_n_5}),
        .Q(busy_OBUF),
        .\Q_reg[31] ({inst_FPU_PIPELINED_FPADDSUB_n_2,inst_FPU_PIPELINED_FPADDSUB_n_3,inst_FPU_PIPELINED_FPADDSUB_n_4,inst_FPU_PIPELINED_FPADDSUB_n_5,inst_FPU_PIPELINED_FPADDSUB_n_6,inst_FPU_PIPELINED_FPADDSUB_n_7,inst_FPU_PIPELINED_FPADDSUB_n_8,inst_FPU_PIPELINED_FPADDSUB_n_9,inst_FPU_PIPELINED_FPADDSUB_n_10,inst_FPU_PIPELINED_FPADDSUB_n_11,inst_FPU_PIPELINED_FPADDSUB_n_12,inst_FPU_PIPELINED_FPADDSUB_n_13,inst_FPU_PIPELINED_FPADDSUB_n_14,inst_FPU_PIPELINED_FPADDSUB_n_15,inst_FPU_PIPELINED_FPADDSUB_n_16,inst_FPU_PIPELINED_FPADDSUB_n_17,inst_FPU_PIPELINED_FPADDSUB_n_18,inst_FPU_PIPELINED_FPADDSUB_n_19,inst_FPU_PIPELINED_FPADDSUB_n_20,inst_FPU_PIPELINED_FPADDSUB_n_21,inst_FPU_PIPELINED_FPADDSUB_n_22,inst_FPU_PIPELINED_FPADDSUB_n_23,inst_FPU_PIPELINED_FPADDSUB_n_24,inst_FPU_PIPELINED_FPADDSUB_n_25,inst_FPU_PIPELINED_FPADDSUB_n_26,inst_FPU_PIPELINED_FPADDSUB_n_27,inst_FPU_PIPELINED_FPADDSUB_n_28,inst_FPU_PIPELINED_FPADDSUB_n_29,inst_FPU_PIPELINED_FPADDSUB_n_30,inst_FPU_PIPELINED_FPADDSUB_n_31,inst_FPU_PIPELINED_FPADDSUB_n_32,inst_FPU_PIPELINED_FPADDSUB_n_33}),
        .\Q_reg[31]_0 ({VAR_CONT_n_37,VAR_CONT_n_38,VAR_CONT_n_39,VAR_CONT_n_40,VAR_CONT_n_41,VAR_CONT_n_42,VAR_CONT_n_43,VAR_CONT_n_44,VAR_CONT_n_45,VAR_CONT_n_46,VAR_CONT_n_47,VAR_CONT_n_48,VAR_CONT_n_49,VAR_CONT_n_50,VAR_CONT_n_51,VAR_CONT_n_52,VAR_CONT_n_53,VAR_CONT_n_54,VAR_CONT_n_55,VAR_CONT_n_56,VAR_CONT_n_57,VAR_CONT_n_58,VAR_CONT_n_59,VAR_CONT_n_60,VAR_CONT_n_61,VAR_CONT_n_62,VAR_CONT_n_63,VAR_CONT_n_64,VAR_CONT_n_65,VAR_CONT_n_66,VAR_CONT_n_67,VAR_CONT_n_68}),
        .op_add_subt(op_add_subt),
        .out(inst_FPU_PIPELINED_FPADDSUB_n_37),
        .overflow_flag({overflow_flag_OBUF,underflow_flag_OBUF,zero_flag_OBUF}),
        .ready_add_subt(ready_add_subt));
  IBUF operation_IBUF_inst
       (.I(operation),
        .O(operation_IBUF));
  OBUF overflow_flag_OBUF_inst
       (.I(overflow_flag_OBUF),
        .O(overflow_flag));
  OBUF ready_cordic_OBUF_inst
       (.I(ready_cordic_OBUF),
        .O(ready_cordic));
  d_ff_en__parameterized7 reg_LUT
       (.CLK(clk_IBUF_BUFG),
        .D({data_out_LUT[26:24],ITER_CONT_n_104,data_out_LUT[22:21],ITER_CONT_n_107,ITER_CONT_n_108,ITER_CONT_n_109,data_out_LUT[14],data_out_LUT[12:9],p_1_out,data_out_LUT[6],data_out_LUT[4],ITER_CONT_n_118,ITER_CONT_n_119,data_out_LUT[0]}),
        .E(enab_RB3),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({reg_LUT_n_0,reg_LUT_n_1,reg_LUT_n_2,reg_LUT_n_3,reg_LUT_n_4,reg_LUT_n_5,reg_LUT_n_6,reg_LUT_n_7,reg_LUT_n_8,reg_LUT_n_9,reg_LUT_n_10,reg_LUT_n_11,reg_LUT_n_12,reg_LUT_n_13,reg_LUT_n_14,reg_LUT_n_15,reg_LUT_n_16,reg_LUT_n_17,reg_LUT_n_18,reg_LUT_n_19,reg_LUT_n_20}));
  d_ff_en__parameterized1 reg_Z0
       (.CLK(clk_IBUF_BUFG),
        .D(data_in_IBUF),
        .E(enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({reg_Z0_n_0,reg_Z0_n_1,reg_Z0_n_2,reg_Z0_n_3,reg_Z0_n_4,reg_Z0_n_5,reg_Z0_n_6,reg_Z0_n_7,reg_Z0_n_8,reg_Z0_n_9,reg_Z0_n_10,reg_Z0_n_11,reg_Z0_n_12,reg_Z0_n_13,reg_Z0_n_14,reg_Z0_n_15,reg_Z0_n_16,reg_Z0_n_17,reg_Z0_n_18,reg_Z0_n_19,reg_Z0_n_20,reg_Z0_n_21,reg_Z0_n_22,reg_Z0_n_23,reg_Z0_n_24,reg_Z0_n_25,reg_Z0_n_26,reg_Z0_n_27,reg_Z0_n_28,reg_Z0_n_29,reg_Z0_n_30,reg_Z0_n_31}));
  d_ff_en reg_operation
       (.CLK(clk_IBUF_BUFG),
        .E(enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .d_ff1_operation_out(d_ff1_operation_out),
        .operation_IBUF(operation_IBUF));
  d_ff_en__parameterized0 reg_region_flag
       (.CLK(clk_IBUF_BUFG),
        .D({reg_region_flag_n_0,reg_region_flag_n_1,reg_region_flag_n_2,reg_region_flag_n_3,reg_region_flag_n_4,reg_region_flag_n_5,reg_region_flag_n_6,reg_region_flag_n_7,reg_region_flag_n_8,reg_region_flag_n_9,reg_region_flag_n_10,reg_region_flag_n_11,reg_region_flag_n_12,reg_region_flag_n_13,reg_region_flag_n_14,reg_region_flag_n_15,reg_region_flag_n_16,reg_region_flag_n_17,reg_region_flag_n_18,reg_region_flag_n_19,reg_region_flag_n_20,reg_region_flag_n_21,reg_region_flag_n_22,reg_region_flag_n_23,reg_region_flag_n_24,reg_region_flag_n_25,reg_region_flag_n_26,reg_region_flag_n_27,reg_region_flag_n_28,reg_region_flag_n_29,reg_region_flag_n_30,reg_region_flag_n_31}),
        .E(enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}),
        .\Q_reg[31] ({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_13,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_16,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_20,d_ff4_Xn_n_21,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_27,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30,d_ff4_Xn_n_31}),
        .d_ff1_operation_out(d_ff1_operation_out),
        .\shift_region_flag[1] (shift_region_flag_IBUF));
  d_ff_en__parameterized5 reg_shift_x
       (.CLK(clk_IBUF_BUFG),
        .D({reg_val_muxX_2stage_n_4,Y,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .E(enab_RB3),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({reg_shift_x_n_0,reg_shift_x_n_1,reg_shift_x_n_2,reg_shift_x_n_3,reg_shift_x_n_4,reg_shift_x_n_5,reg_shift_x_n_6,reg_shift_x_n_7,reg_shift_x_n_8,reg_shift_x_n_9,reg_shift_x_n_10,reg_shift_x_n_11,reg_shift_x_n_12,reg_shift_x_n_13,reg_shift_x_n_14,reg_shift_x_n_15,reg_shift_x_n_16,reg_shift_x_n_17,reg_shift_x_n_18,reg_shift_x_n_19,reg_shift_x_n_20,reg_shift_x_n_21,reg_shift_x_n_22,reg_shift_x_n_23,reg_shift_x_n_24,reg_shift_x_n_25,reg_shift_x_n_26,reg_shift_x_n_27,reg_shift_x_n_28,reg_shift_x_n_29,reg_shift_x_n_30,reg_shift_x_n_31}));
  d_ff_en__parameterized6 reg_shift_y
       (.CLK(clk_IBUF_BUFG),
        .D({d_ff2_Y,reg_val_muxY_2stage_n_32,reg_val_muxY_2stage_n_33,reg_val_muxY_2stage_n_34,reg_val_muxY_2stage_n_35,reg_val_muxY_2stage_n_36,reg_val_muxY_2stage_n_37,reg_val_muxY_2stage_n_38,reg_val_muxY_2stage_n_39,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31}),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .\FSM_sequential_state_reg_reg[2] (enab_RB3),
        .Q({reg_shift_y_n_0,reg_shift_y_n_1,reg_shift_y_n_2,reg_shift_y_n_3,reg_shift_y_n_4,reg_shift_y_n_5,reg_shift_y_n_6,reg_shift_y_n_7,reg_shift_y_n_8,reg_shift_y_n_9,reg_shift_y_n_10,reg_shift_y_n_11,reg_shift_y_n_12,reg_shift_y_n_13,reg_shift_y_n_14,reg_shift_y_n_15,reg_shift_y_n_16,reg_shift_y_n_17,reg_shift_y_n_18,reg_shift_y_n_19,reg_shift_y_n_20,reg_shift_y_n_21,reg_shift_y_n_22,reg_shift_y_n_23,reg_shift_y_n_24,reg_shift_y_n_25,reg_shift_y_n_26,reg_shift_y_n_27,reg_shift_y_n_28,reg_shift_y_n_29,reg_shift_y_n_30,reg_shift_y_n_31}));
  d_ff_en_0 reg_sign
       (.CLK(clk_IBUF_BUFG),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .\FSM_sequential_state_reg_reg[2] (enab_RB3),
        .Q(d_ff2_Z),
        .d_ff3_sign_out(d_ff3_sign_out));
  d_ff_en__parameterized2 reg_val_muxX_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({ITER_CONT_n_37,ITER_CONT_n_38,ITER_CONT_n_39,ITER_CONT_n_40,ITER_CONT_n_41,ITER_CONT_n_42,ITER_CONT_n_43,ITER_CONT_n_44,ITER_CONT_n_45,ITER_CONT_n_46,ITER_CONT_n_47,ITER_CONT_n_48,ITER_CONT_n_49,ITER_CONT_n_50,ITER_CONT_n_51,ITER_CONT_n_52,ITER_CONT_n_53,ITER_CONT_n_54,ITER_CONT_n_55,ITER_CONT_n_56,ITER_CONT_n_57,ITER_CONT_n_58,ITER_CONT_n_59,ITER_CONT_n_60,ITER_CONT_n_61,ITER_CONT_n_62,ITER_CONT_n_63,ITER_CONT_n_64,ITER_CONT_n_65,ITER_CONT_n_66,ITER_CONT_n_67,ITER_CONT_n_68}),
        .E(inst_CORDIC_FSM_v3_n_8),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({reg_val_muxX_2stage_n_4,A,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .\Q_reg[26]_0 ({reg_val_muxX_2stage_n_36,reg_val_muxX_2stage_n_37,reg_val_muxX_2stage_n_38,reg_val_muxX_2stage_n_39}),
        .S({reg_val_muxX_2stage_n_0,reg_val_muxX_2stage_n_1,reg_val_muxX_2stage_n_2,reg_val_muxX_2stage_n_3}),
        .\temp_reg[3] (cont_iter_out));
  d_ff_en__parameterized3 reg_val_muxY_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({reg_val_muxY_2stage_n_32,reg_val_muxY_2stage_n_33,reg_val_muxY_2stage_n_34,reg_val_muxY_2stage_n_35,reg_val_muxY_2stage_n_36,reg_val_muxY_2stage_n_37,reg_val_muxY_2stage_n_38,reg_val_muxY_2stage_n_39}),
        .E(inst_CORDIC_FSM_v3_n_8),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({d_ff2_Y,reg_val_muxY_2stage_n_1,reg_val_muxY_2stage_n_2,reg_val_muxY_2stage_n_3,reg_val_muxY_2stage_n_4,reg_val_muxY_2stage_n_5,reg_val_muxY_2stage_n_6,reg_val_muxY_2stage_n_7,reg_val_muxY_2stage_n_8,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31}),
        .\temp_reg[3] (cont_iter_out),
        .\temp_reg[3]_0 ({ITER_CONT_n_69,ITER_CONT_n_70,ITER_CONT_n_71,ITER_CONT_n_72,ITER_CONT_n_73,ITER_CONT_n_74,ITER_CONT_n_75,ITER_CONT_n_76,ITER_CONT_n_77,ITER_CONT_n_78,ITER_CONT_n_79,ITER_CONT_n_80,ITER_CONT_n_81,ITER_CONT_n_82,ITER_CONT_n_83,ITER_CONT_n_84,ITER_CONT_n_85,ITER_CONT_n_86,ITER_CONT_n_87,ITER_CONT_n_88,ITER_CONT_n_89,ITER_CONT_n_90,ITER_CONT_n_91,ITER_CONT_n_92,ITER_CONT_n_93,ITER_CONT_n_94,ITER_CONT_n_95,ITER_CONT_n_96,ITER_CONT_n_97,ITER_CONT_n_98,ITER_CONT_n_99,ITER_CONT_n_100}));
  d_ff_en__parameterized4 reg_val_muxZ_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({ITER_CONT_n_5,ITER_CONT_n_6,ITER_CONT_n_7,ITER_CONT_n_8,ITER_CONT_n_9,ITER_CONT_n_10,ITER_CONT_n_11,ITER_CONT_n_12,ITER_CONT_n_13,ITER_CONT_n_14,ITER_CONT_n_15,ITER_CONT_n_16,ITER_CONT_n_17,ITER_CONT_n_18,ITER_CONT_n_19,ITER_CONT_n_20,ITER_CONT_n_21,ITER_CONT_n_22,ITER_CONT_n_23,ITER_CONT_n_24,ITER_CONT_n_25,ITER_CONT_n_26,ITER_CONT_n_27,ITER_CONT_n_28,ITER_CONT_n_29,ITER_CONT_n_30,ITER_CONT_n_31,ITER_CONT_n_32,ITER_CONT_n_33,ITER_CONT_n_34,ITER_CONT_n_35,ITER_CONT_n_36}),
        .E(inst_CORDIC_FSM_v3_n_8),
        .\FSM_sequential_state_reg_reg[1] (reset_reg_cordic),
        .Q({d_ff2_Z,reg_val_muxZ_2stage_n_1,reg_val_muxZ_2stage_n_2,reg_val_muxZ_2stage_n_3,reg_val_muxZ_2stage_n_4,reg_val_muxZ_2stage_n_5,reg_val_muxZ_2stage_n_6,reg_val_muxZ_2stage_n_7,reg_val_muxZ_2stage_n_8,reg_val_muxZ_2stage_n_9,reg_val_muxZ_2stage_n_10,reg_val_muxZ_2stage_n_11,reg_val_muxZ_2stage_n_12,reg_val_muxZ_2stage_n_13,reg_val_muxZ_2stage_n_14,reg_val_muxZ_2stage_n_15,reg_val_muxZ_2stage_n_16,reg_val_muxZ_2stage_n_17,reg_val_muxZ_2stage_n_18,reg_val_muxZ_2stage_n_19,reg_val_muxZ_2stage_n_20,reg_val_muxZ_2stage_n_21,reg_val_muxZ_2stage_n_22,reg_val_muxZ_2stage_n_23,reg_val_muxZ_2stage_n_24,reg_val_muxZ_2stage_n_25,reg_val_muxZ_2stage_n_26,reg_val_muxZ_2stage_n_27,reg_val_muxZ_2stage_n_28,reg_val_muxZ_2stage_n_29,reg_val_muxZ_2stage_n_30,reg_val_muxZ_2stage_n_31}));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \shift_region_flag_IBUF[0]_inst
       (.I(shift_region_flag[0]),
        .O(shift_region_flag_IBUF[0]));
  IBUF \shift_region_flag_IBUF[1]_inst
       (.I(shift_region_flag[1]),
        .O(shift_region_flag_IBUF[1]));
  Simple_Subt shift_x
       (.D(Y),
        .Q(A[6:0]),
        .\Q_reg[26] ({reg_val_muxX_2stage_n_36,reg_val_muxX_2stage_n_37,reg_val_muxX_2stage_n_38,reg_val_muxX_2stage_n_39}),
        .S({reg_val_muxX_2stage_n_0,reg_val_muxX_2stage_n_1,reg_val_muxX_2stage_n_2,reg_val_muxX_2stage_n_3}));
  OBUF underflow_flag_OBUF_inst
       (.I(underflow_flag_OBUF),
        .O(underflow_flag));
  OBUF zero_flag_OBUF_inst
       (.I(zero_flag_OBUF),
        .O(zero_flag));
endmodule